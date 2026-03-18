Return-Path: <linux-arm-msm+bounces-98518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDp8MUy7umk4bQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:48:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 412912BD81F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CB6D30731A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E7A3DDDB9;
	Wed, 18 Mar 2026 14:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QAKiEhoL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LqmqsVT9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D122D3DBD68
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844922; cv=none; b=RLJwM4SKYuJBiCuDom5D6tbPwPFHbt2RmzRUPe4iYdRRL5gyFVDZ9729AuMPMr1CFngdfOLGN6eS4f6Pb70/tFWRlbWEKuJPOV/gjHZkSPn2j0UPVGq3i6E/QuZTAilMGxaht1xfZbl2PLVcSTbFnd10r61t6l0gw38LOOneDNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844922; c=relaxed/simple;
	bh=88/4tD1UMvGQTh10XCNWmYrjiU25NgdqCEgiupFb7RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6Za5dqwI9e120B0GN0mABCqrBKFG015QAejpIHX56Etz0DonIZ3R3Fi9IfupJ9ZXyQik3BgVdNR6hiDnHhIHU/5XoVQaVJoL+t0siz3vDt87+5NHKT+HLnWL7WhFgY/CYvnHzMmKup2FDLKOQEGXRnUgJB+ktibLLS/vy513aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QAKiEhoL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LqmqsVT9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ICBjo6909962
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 14:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UCVtWlsO3NLtt8U2SVQN2B9V
	E1D5VvmX9n00rYrAV7I=; b=QAKiEhoL0UMDkjrpyb2DlAFGsZijCthbMZWSmtUe
	Qyj9XYSxMzmnghE/0bVcz0PQdJzTCI/0yVn/X/m3zKZLVSHkiu4yXVp23CMbBCK3
	Hmw6Wm3CTt85uup6i5ChgxP1Oe8gt/7kn89UNyLEcPoVPHJ6ImJZSCM93atVVzCp
	M8SuD7/gKPmLKWyn8REzGt86XBklQaKhvdZXIq2be/zVS/nRVGltU5bjRD7k3V+d
	/qi9o+oSZzVDjwLs00mNi3U46qUhLBnHatvV3ROZB33aUrua+9BIA5lT+s2prqAk
	PT2fVJQseQQL6SrQf0yvNwRVLUbMWlvMMROO3JXKYv3znQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyuucgj0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 14:41:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091ee9f1d8so72288561cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 07:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773844918; x=1774449718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UCVtWlsO3NLtt8U2SVQN2B9VE1D5VvmX9n00rYrAV7I=;
        b=LqmqsVT96YTrPF0v6joUnR2Y0+aU1tDfISwdVZMyXfqL4zF2x+1HdXhMYXieWwuqjG
         bX0ECqz6hUwX/igVJcYxKPwJx4nlAd2OGgoIlMGzYnV83FQW4TMWHpeKcBOGGv4R6/a8
         63l4MVJGsd8qdZehyIplziK44PKwYrNSu2oFWJIvjK2g/p2W7SPOsE39K1UqfFV1ZCP3
         JrpvGy0KbYqLBr8quypSSNQZCSp4xe/FPfDXTIFruyCg1IAB/z939Hg7Blg9vQ0wpIKA
         YIEd3u09885h874NcVgsZyQbZyyMNRiq7K8L9YOhPBVfpa/0VzQAtot6XfwarDhI/40f
         DKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844918; x=1774449718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCVtWlsO3NLtt8U2SVQN2B9VE1D5VvmX9n00rYrAV7I=;
        b=LraAH86silBfptuIrBpIkX3KymOQHw4QN7Naqx9j1KieIfM9/lae1ajC+/q/1d/Kh0
         XqDTpga0CgBsENGKgUd+/mgFPjVRuIXC7AEFHo4amMcX8teCH3UH2Uya732VKALR6RkA
         H3OzLFqOdN7SIZ5nNXKf1hZGc6wMRfRL2a0Xx4crRo1ZZcOTHy/Okki6FQwFXIt60Gaa
         yyp3K6T8ofpBVJU7mMaFy2iBsq2DLEu7359lIrfvb6ynbtzJFrTW81hfNUMx53ngQaE7
         Sbf4w+4Gcbff4yNMhtgMbOCHIxIT9AGj/3V3AEpxFQpbPWqlt2cvpbnTmKMwcFoeEtdb
         oDZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR+fGKFU5d3tT1dD6QlsMcjpyJgT1ZP7adGAVfWLp27LJKGkO17Ngk+JPAWuqML50pIMaO9rOEN2Y853PT@vger.kernel.org
X-Gm-Message-State: AOJu0YwmNWCaIHe+jDgu5/56J7w14EFnKp/NkHI9XK+96gPiVMO8fOps
	nYOH+BolK9mGx8XVwUC7Vmt1yTMqU70PpIBOWCCbaY0womDwI33R/cZHkghkIhiCN+UmG/1LerK
	04gLNbDOLkTrtIv1XpsirlJv8T8SAsGBf2r6cGp0RoF+vyLXDXB7wfbBaIMyy2DOFsmka
X-Gm-Gg: ATEYQzx2V3urTQ3oigNCUH89KU5oYJI213L/gyXl5wNetNlnRrVng6FsF0Bb5ySd1UP
	CDlSY27xVHkYNx6UTk87E5LXGgfAoX6U4AZ9g1eIFi52fE4KBaqWXLrb6jSl4y2Y16PRFSUxeo0
	gSAaFNOcaSxM/OUfFiTaY+Tp7DtMo54Adh1QP7InigAP6cq7xX0DQYRWnXJXLUgsq1XHYI8vl5w
	sZMk5TbMvvY8evf08yDL6zAIPGRTng20wXD92qS6iUWmRr1F+ig3yhbBaA48cmdmG/eq9ZXjZdq
	7EZ5w7cgUX9nMmMSc4Rz707aHSIV+A4whpAFuYZAP8yE8Tf1N3YURXAzkj8IIJ4wx4k0qk4ihpj
	xYnRxxvs+QoSeowReJZTybv0jyBXdDzfndI97bniypsynI2gL+fFYY8Aeq0teY1NbeO8nTe8eG2
	GLF28qHJDlAPOC9Ui60qJ8s0dcvjMcYEDfoqg=
X-Received: by 2002:ac8:5a02:0:b0:509:19b2:b713 with SMTP id d75a77b69052e-5099805c3c1mr93562371cf.18.1773844917995;
        Wed, 18 Mar 2026 07:41:57 -0700 (PDT)
X-Received: by 2002:ac8:5a02:0:b0:509:19b2:b713 with SMTP id d75a77b69052e-5099805c3c1mr93561831cf.18.1773844917510;
        Wed, 18 Mar 2026 07:41:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a27a987d19sm464670e87.73.2026.03.18.07.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:41:56 -0700 (PDT)
Date: Wed, 18 Mar 2026 16:41:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Petr Hodina <petr.hodina@protonmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sdm845-shift-axolotl: Convert
 fb to use memory-region
Message-ID: <h366xpuwwaghjbk4rv3b3uzlx3l2nhifiyavhajj3lce4eayyi@twhjgncrshwa>
References: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
 <20260317-beryllium-fb-v2-3-36b69dfb760c@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-beryllium-fb-v2-3-36b69dfb760c@ixit.cz>
X-Proofpoint-ORIG-GUID: anWirESZB5a8QrjjcLF1jhEnJTzKA9i5
X-Proofpoint-GUID: anWirESZB5a8QrjjcLF1jhEnJTzKA9i5
X-Authority-Analysis: v=2.4 cv=U4ifzOru c=1 sm=1 tr=0 ts=69bab9b7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=NdoN8BoSjOhuqMYtIe4A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEyNSBTYWx0ZWRfX+rSZWHO21izE
 zXyR5q2E7xDNNRQLX74zt5h+y5utRWlpke8DlF7/uMG9C7AHp/Lg8fV6xw0KPMz9pPWAs8r/9uK
 PavCANxJn0GCVWgDcaxdq27pa23cLPrUd8hen+aQgHSgeJS+DfrQF8gU2dSiTWlcxz4nn4yzJnl
 UJ5z97eHhNy4GCbGkEhOYSeRRvl/vBjUYip+9BwwN2gAhy5udJ8bzIw+o7nQuUU5++X1OAUuzIj
 XqLcrJqxSj0qu+QuS1DhJhM0wJPdBPQZZRTTvwt9I5L/flmTNcpdVqU+iaq3yxuagSh4bpFCTs/
 mAtByz6eQgcEkV+7gAOkrguDsVVji94D2Lw53QuOiNV/hgXTFtJhtvIziIWdjr+FYIs2l31I2Ze
 HyIEkLXeySuV0kdzE8s5GWfjU4IHzjuK96x6oGz4nMnw8E27h2PYiGMeRavI1GeC21kAP9D3FYU
 H/2a62KccrbqpyXtW9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180125
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98518-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,samcday.com,vger.kernel.org,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,ixit.cz:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.977];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 412912BD81F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 11:12:33PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Instead of manually specifying reg, reuse the memory region.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

