Return-Path: <linux-arm-msm+bounces-99759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NX7ELAcbw2mJoQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 00:15:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD3C31DAA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 00:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71EAA306777F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF6D3CA484;
	Tue, 24 Mar 2026 23:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/XlBMu3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DW+43oaU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD24D3C7DF4
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 23:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774394016; cv=none; b=FJGGXAKtyNQC7WJqmLjSke2kQpQGZLmmcVAxWuxvvoCVguR5gmWxrfjgqiK8/P6ZFYLf+JfIAUMknbTINEtq0x21cXikqbiV8OP8JjTHxoOZfbUhseDkHbkWL5e+crQUKPXIfUKBCZLthwLnJ4ZXF9yJC6cZs/QUbyhsJXcUPy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774394016; c=relaxed/simple;
	bh=VnJEUpt8Pn7TMxFiZmKTIjn63h23uf996H0jDMY17m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FegePoPjzr9auUGIOm3Bqwpg0M8pt5DKHryD2VGcchFGqPN+VscjSly131xSUuraBbS+jxNoJ0vGFbiM666Z65FiB/4bGKYVIlzhGq0/LItMAZogeGboTV9iAc1ADw65FstjJNk+JgujveFFff+5IbPRD4MSzhQSZ4OHp2xJYAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/XlBMu3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DW+43oaU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCt2M2807988
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 23:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ub388pzW/wDo7n70J6wJkQwd
	yj2opG87yqZpV9tyaSU=; b=A/XlBMu3lQ61fKzjZB5JV81gDFvTy7BDXCA9vgLF
	DiXRC81pwqkTbL6bHmGmgDLQaPY3KaX4DQ+FlpvST8F2hqjjQtJAgnXnZ5k1MsAA
	4/W7BALdv4+CI+TWdI9swO2JAgn2J5dx/VE7Lw7M8vC+Rx7rnagu/D+6RYbghWbB
	5BiBZJRFsfsxvXH1nrQRYQnwYhw4FHcxKi5GNPjDIT7nJtyYMkYtV/hecqUjjSbn
	fzSqS6m6yDVo5xK4s0wKYlo0TJFTTsTAv5pTm1qifH79JKmZGGPhqLJnctrZG5W3
	VWACeAjD3Htyw3BxGFg19pPA9Lz/aeFMfL/E6pf0QGrcJA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9ejen0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 23:13:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b274f94f8so13743381cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774394014; x=1774998814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ub388pzW/wDo7n70J6wJkQwdyj2opG87yqZpV9tyaSU=;
        b=DW+43oaUrPT3pt3nZRbaKiM5IG38sFZARrFm+LILhtRBDiMYzD4cYdJMbqhRKNl0pH
         IHv0rqZXXlMduIXPE7GcwDPOFN1q4nMvsPNZEh6NELfWRbr9PnRpGd+sDBuaf/99pERU
         RqyNf0n1RX6VQbwSQr9yvALQWLJmMMnhLsPH1O9Tw8NIYdhY+pdVW2IGzstxKMJrDpj+
         y8bmL239vni/xZ6r2BOs9XVzRbTlMJkU+AssuNanPzFo9/9SgndiM7XZUKpAo1CqPq5q
         KZGSzSpmNmsX+tWeK33Txi/TStssdzIVwx+pzV4cRIxhoZTLRklQvbSbqGXFEoAgzsO/
         cF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774394014; x=1774998814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ub388pzW/wDo7n70J6wJkQwdyj2opG87yqZpV9tyaSU=;
        b=c9pL3DI+B3H07NVqtiqvRUYJ0O8HFYfntqY0XRC/6wfINMTKtMzCtq3zYO3FeT18ke
         NwNyLYJR4wJXb4gVEAtKTv8kDMpwXHNk+++xoL1hN+tMHiCiPo96zm6j6zK8MAX0vRh1
         wsLidjA3Kv4FdupQAi/9eVBP3nLDwdE5ieNp8Y4R8TN1mh1sH6xv4tkWu5zImJJPGpJr
         a9woFS5Gf9NF0YPEx+VObm02AoemgNFIO8AoNi8ensumEsISxa0SNGxLAJzc8Pa70bR5
         RvyIZRQH+LWP8X8Q5LyzOrnHktw8920hbl4au1ueNNQ+X+8WYbRyfR4ndTAb+PssOh/z
         TArA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ9oThugW7lqPxNdr6zeuLUR51qvnoSSPyzd2E5eelrN6JLKkxZv0FA0NKaeUf1G5h2iWzVTEpiyuI+NEB@vger.kernel.org
X-Gm-Message-State: AOJu0YzLBzkpHXap5oq2Kf/DUnFOQRFqFRI1NwwFNKNjEP7X4IbtR1rc
	dpu+c72qEJJcU5x/3JSEm6eHtvpzw9y18Q0tB+tuFs7r35OscN5RtnJxxMy6fRAAyEYE4Zw5Bc8
	k8wD9LZ9YnV3BPM5WwMwvfHcPpZ4mmxZRhCFN6QkiuiO4vklzrM0UyQhu1ha5alY33Jck
X-Gm-Gg: ATEYQzydh+AMCMWR7WbqC3p6tz2/QrweKgAXfOiLRvMZ3zBx+Txvc/qSiOuR0IIiTL+
	Aey695o1NoxkjjEj8MFtA/q2hKu5ayJudI09q9QQDdfNv/6Bmak+Vc9brjbpZlI0q6CnJfd807q
	zRWj3sAoDXpYNC/2atvdvyg+VMn7QD7P2Oe1Uv+axCSccHjqTiBih2w9gIl2x1WPTkKuapBECcO
	TDRaSygEe4JLiUo9gL7Gp52AgEGHv7GbCFoYMzJNH/+M3eY2c7Vuimv+07+Mt2kPIZqyk41ntDw
	NzpM+myaJqjKGlYQ7ZJM4e60R4wBSWKYKY74wfdpd8a9g8vvDakWfQHddHQl+mVGIMxRJ7zK3BZ
	NUaoovttplR3qb4Sz/t/wai5QUehbBiMwkYpDloicyEMAhkw+uWtqL/bfjqH6ZY2Wx0NJvBDfjn
	1QPFOIHPMzR6Vt2NkpvEpumKYmXMYVzFvA6Bo=
X-Received: by 2002:ac8:7d90:0:b0:50b:47d4:a055 with SMTP id d75a77b69052e-50b6ee6aaebmr74622521cf.27.1774394013796;
        Tue, 24 Mar 2026 16:13:33 -0700 (PDT)
X-Received: by 2002:ac8:7d90:0:b0:50b:47d4:a055 with SMTP id d75a77b69052e-50b6ee6aaebmr74622131cf.27.1774394013368;
        Tue, 24 Mar 2026 16:13:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192e93sm3462838e87.13.2026.03.24.16.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 16:13:30 -0700 (PDT)
Date: Wed, 25 Mar 2026 01:13:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: purwa: deduplicate thermal sensors
 with Hamoa
Message-ID: <ftdzj5zcxs44zm3yyhv6hfwejkmxyfqb3w3snfeey2epmfuafz@qjl6ooz2gyzc>
References: <20260320-purwa-drop-thermals-v1-1-2c9fe046cd02@oss.qualcomm.com>
 <f25eb68c-3877-4ce7-b3cd-0910a00be30a@oss.qualcomm.com>
 <xy2jzlamtkpqfpcpegoysyh6u2cnfubkz5233yvuuzfutzpxkf@w3inytibm3sq>
 <7d13d449-17e5-4838-b4bf-f9ce14e1142e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d13d449-17e5-4838-b4bf-f9ce14e1142e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: GebutEWW3XxFLGVW4Fk5jUb2ai0aYPPN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3OSBTYWx0ZWRfX1ff7Xx4IZOHu
 ATx/InVx/yWXLyJFI6ruYnRWcDcizxSfRaTKPE696kpSsmAfzFBQNLECabav/T6o6fCzgo4cpBJ
 DmeSE5AEnQ+TEFIfjG/AsjGiODqizAjgOZbXu49fNjBpVtpoaH5JmhA4IPJH58kmeSY9+KrIGw7
 4ugnlr+Uud7PzaolvHqBB3gWrYA+gWVVS8QX4bwD7TEZbYv2U7k2ltFFWpmt8PMh/XB6g8aFX0F
 WOqDsTE7asjASyUDveA61GK9vjyYlNDyfMpfMA3ELvcYnPi7/80tPyY1KkJynYSyXVNAFmTP9vp
 cdYgLj98Xd2HyCac+XBdqB3hCVVFGHckyYU+7zI2jQCxftoX6Z0RDlUZ3BlmGK/dpKzvXV0zhXQ
 Vus5LQCgXrZdF8EWtjNhwPHgs4Q6ajhP5eFzBhHV1agKy7wLQbSPcr9aIOnMTRJBO+hTE20pRg4
 2pvN4KhkWVx5Yleu8cA==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c31a9e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=tETO4GxROsegJAF-TI0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: GebutEWW3XxFLGVW4Fk5jUb2ai0aYPPN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240179
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99759-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0FD3C31DAA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 10:25:30AM +0100, Konrad Dybcio wrote:
> On 3/23/26 5:49 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 23, 2026 at 04:21:00PM +0100, Konrad Dybcio wrote:
> >> On 3/20/26 3:33 AM, Dmitry Baryshkov wrote:
> >>> Hamoa and Purwa have pretty close thermal zones definitions. The major
> >>> difference is that several zones are absent (because of the lack of the
> >>> CPU cluster) and several zones use tsens2 instead of tsens3.
> >>>
> >>> Instead of completely duplicating thermal zones for Purwa, reuse themal
> >>> zones from Hamoa, patching them where required.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>
> >> Slightly reluctantly:
> > 
> > Why? I'd really interested here.
> 
> I suppose my reluctance comes from the decreased readability, but then
> I suppose the silicon is not going to change if we get it right once, so
> it's not a real concern..

I see. My usual concern is opposite: to make sure that we don't need to
fix another DT if we fix something.

-- 
With best wishes
Dmitry

