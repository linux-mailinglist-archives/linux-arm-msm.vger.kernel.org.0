Return-Path: <linux-arm-msm+bounces-108154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eATFHe7uCmo89gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:50:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8284356AFB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3054A30626D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AE33EFD1B;
	Mon, 18 May 2026 10:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Azwb2TmF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCDsrepd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BC83E314F
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100364; cv=none; b=t1dJjM8qfZXjO845SF5rfxNI93EjyARrl+hBTwrO2n5xS1fqcaRY3ltSsgT9Y2dbedZgVHrnCF5IspUHmWw719tmuDF9duR9g1mXRKucE0JQvbIWoZNLzdg1hOLFqqbcrLcg9zsdsKXPkZSptIqC8myHW3vBNaEwfzeLzaGD0Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100364; c=relaxed/simple;
	bh=G2Suns5VJleYMRm6J0IcnGJCb8Kgzf9eDglIQGSVjYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzzW4nMMIoJhQrVZJIz8ISrG4OK6RTdRNGF1NiSt8pO97bo6r7RH27q5NKnXOJtRMMU+hxgX2bNBf3c1D1IEwAhODohrsITzOd4l8TJLRx6dvOzbv1zlWNndKdN6i/GEM0jiMRTZQ8cChUP8nwkISpW4Nlm5o32KXOZwdg0MevU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Azwb2TmF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCDsrepd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAL0pe3889365
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JKBw9AR404EF4NUzLzs/nNnx
	H064LGvJW1ef6d0/ijc=; b=Azwb2TmFOtPQepUDtP77ta/2KX3x9vQP6D3FtGW3
	D9CxjPxaeh/Wd5H6a5J+aLXX+6JK8kSSv0kzfVNtaB0rrip9dJKCdYRvwIjtNXTl
	/2Am7yLBGe3E9zarizH6L1LGG5JJhPdPQfJ7sJMYrfObrWwbSaeRImfb20tlA+1L
	Cd2DDxcQAZlwjR3uWQx6wwpYjnxibciZ96E5eSDHJ84UpoJwK4H8Kf5UNMDVpoHJ
	xxTwpQsyoEd4H76CYAlCfvbrGCq5b3y+HRK+P01U5ngqofiIE9++Lm34IwSYExOX
	ja894zCO+lSEDQZ3JP6AjWv3NifoQaQ3/e9Lk0GffzKeHw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qe168-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:32:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516458449d4so26061261cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 03:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779100353; x=1779705153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JKBw9AR404EF4NUzLzs/nNnxH064LGvJW1ef6d0/ijc=;
        b=iCDsrepdu7smnvjo3u52ZsoRitmrgfSS7aAP1cRnCRxpMeXAln5uz9KBC9Qw1BAExC
         yWmTvuTPgwEae067viDXnnCTscTgkWPIVT48ddgt1HKVGC/V4oxms6XsbSB4LSSktYa9
         wC7HjYaEqBWO6UVKreMYeWPlvJ3sEceDQ8rQqS2xCl/w+JDW54ETXzoJZKfVXooeEmSs
         s5ZXQcOHTcnl9aR63aVcB+o/uLeCv9h4u/Kk7nItmJYg3rfZk/gmTN1uqX6ft5CCEX6E
         EZ1Cmkj24lzxAsAOprhZg36igfKpKP8WOEM+cFkRGX6EJJql4rW1fBlnUCzRwX0jyTlD
         v8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100353; x=1779705153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKBw9AR404EF4NUzLzs/nNnxH064LGvJW1ef6d0/ijc=;
        b=KE5jwRS9F4zxfd6EHLBsyM+5e077S9ydbIhLvkOx1Q+4IpDlazuwnswmUJJSxS+PVM
         9IxfooVdg8SmnlNCYa7ADRnzEx1VXSNMokI7dH0g6Eh44sKwht5EJIAQBekRaky9xJJG
         H+Rg+WyTKKd804HuzStcs57nFNPHGzqpGLBprRWOYFgkKs1IAzFsNHYSrvyG8StqmGmN
         M9AFZrF+69OU5U47uI7dxpN81CuEVl7C4WD2/1KSynkKjcFPqy6cn8HzBSaOGWY4aaLc
         yfsxZTS2Jbt6LbymT7Zru21wPe/VoTt/ETpoYyn6YPxACaf4aAE0kXaBneq+7kZ2ebB+
         la8w==
X-Forwarded-Encrypted: i=1; AFNElJ+KZOavzMCI70rrmJXaU2Q6jsFzc1B5nU5v7MgQsfGeoe4lPouFTuOYLUQGqX+nbRE2pDoU5OdmYf4zUCvu@vger.kernel.org
X-Gm-Message-State: AOJu0YycSvNsPJX6pUYDVOO4GfUMZwNXZ3HwjOeftJLvxaFg9ESUyzor
	5w2b36N1SSK3PUUFhN6HQzMIsrCujiETFmgVfcfwapB0PqbTz9ajX22Fxbibnl+p0CGp9+2x/Si
	b4yeu315X6qaYjpbk3VeKpg7D83iSu40bpzyhjDoUHanSkDQEo+A/oiGRDnubHp6f0CSE
X-Gm-Gg: Acq92OHf2cunRLmR6QJFy6eQ12ppVPAb26xjKnknsScDutM7NBCiPNY76cTJtZ2vpi5
	9wzDB38lVEdYV98VVre4k+wBJJEbZzZNQZCVJT+Y0bffxJRMONyu9u2vaRsm0SFh58tWGl314HE
	RSKYa1pjIDtgzQRmrkPewKH+Ft2GCs4VQ6J768KmB8GDcDZTAV+0ZFbNhZkgXM8NAqmDNRQ+qtj
	yWBboWh3ZN0Hzhi0l1pyxJiRkPl3J6ioS5QTW1oqLb/h48CQSKpRi3T1HYHWzmnBw56Y+EHjd1p
	6Go+aPTjSF14edDsBy8JMpEb2buAxCbFD3Kktyc62dfoGwcANRi8uYiv6BQa2ZNKWyAiv1cNVDo
	MywEEnSGtaSkz0MmfZ8QIjbTwBbUMMSQLB0I=
X-Received: by 2002:a05:622a:1313:b0:50d:9b2e:7ee3 with SMTP id d75a77b69052e-5165a0ccdd9mr204777791cf.38.1779100352712;
        Mon, 18 May 2026 03:32:32 -0700 (PDT)
X-Received: by 2002:a05:622a:1313:b0:50d:9b2e:7ee3 with SMTP id d75a77b69052e-5165a0ccdd9mr204777111cf.38.1779100351558;
        Mon, 18 May 2026 03:32:31 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab671sm245653735e9.1.2026.05.18.03.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:32:30 -0700 (PDT)
Date: Mon, 18 May 2026 13:32:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix wrong interrupt number for
 i2c19
Message-ID: <sy6sl3tdfep6umhfk63jar3ibcufnayqteyrmvdqpn5krralzt@jonkgiphbagf>
References: <20260518-glymur-fix-i2c19-irq-v1-1-7d5968bd9b2b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-glymur-fix-i2c19-irq-v1-1-7d5968bd9b2b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uJClxPdNrpQXKRgwkArr3NQ5OSS5Hxb2
X-Proofpoint-GUID: uJClxPdNrpQXKRgwkArr3NQ5OSS5Hxb2
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a0aeac1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=YFrQUJdA0-VyeVoQsyUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwMSBTYWx0ZWRfXw2RkNiBzeceC
 Ac2GcXG2RQ9xG4040pf/QLbVNsLvKuFYXzFjbMfibF7fEuk3k3LM/GIfkDgJqI/vq4NE8mLt3TM
 /kXEcJzacgutlDXEDdPHz6CU+U/3s3qPorFpB3euU3aNDAFkXYyA4FZ+pOO5norGAfBwNxhmteg
 SCMBQpETy2B/jf9al03kQ+wY/2d52rCxgsMjtFtd0Q/I9Kb4C1WSkpauhB/jKoymojQa5tU40Ki
 jcXGOV2nVg7DWnF4weB53u1Rnr4HGtYQtpTRUU0Me74PqacFOOZC0b7NjQemUwyH2sfH0KYh0Rn
 o0GPo6gbRfjGt3tQPP32TbpLDHxHXbp0OdcN0GBveBMcCF4S4jJ7dk4SPlCkTrbZTB0PRFxkwTw
 XYbOvRPwVKodKb07Q/hSxZUKpUlgQ+0KqH+hGdNyZQmhYc0saQt+vgC6Si5U1cfQd13/u/hXX5/
 pULcU+duFpeshU5Ki6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180101
X-Rspamd-Queue-Id: 8284356AFB7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108154-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-05-18 02:52:53, Gopikrishna Garmidi wrote:
> The i2c19 node at 0x88c000 uses GIC SPI 584, but that interrupt
> belongs to the neighboring i2c18/spi18 node at 0x888000. The correct
> interrupt for i2c19 is GIC SPI 585, as used by its sibling nodes
> spi19 and uart19 which share the same register base and clock.
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

