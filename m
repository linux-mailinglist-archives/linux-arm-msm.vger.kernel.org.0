Return-Path: <linux-arm-msm+bounces-112027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wLhfLBXCJ2qo1gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:34:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2216365D428
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:34:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=g8tV2zqC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LozUe19h;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112027-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112027-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45D2E3005643
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 07:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9691E3DD506;
	Tue,  9 Jun 2026 07:30:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3954C3DC4DD
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 07:30:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990240; cv=none; b=bwuBMg3Hum7lfyPSMPOeBsUCSRZh2ZzXsdfPI28YmKWDXRtaAaM3uA+jPoH6qOn1ICTU9/I2pdfgai46gZQFWdYKsWNGLNS+IChtF2dfNHCgqoFFQJ3L+rymVn4b7kVztLPfkSCAb17fptHStAKH3WG30ossQ2+xKeUplUUjS1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990240; c=relaxed/simple;
	bh=+v6IEbQVCpkDL/Xft9tmnNB8By/FFw35YP6vmoZkLyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXQDBoZmItIHkwnyGX3r0Q8vaHAnGS1HZ+ZoruhaqSJft6hK9RoedLd9AEmkTWcLJwA1kRppSWINSfkINW+wmJSH1MdfB+C9qCbRFUJzp/LQKs8tixCzS8BqAzl0QhgTxPr5Yg8zCBX866j39FFuYAbELicUb737PS2H7ACXnHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g8tV2zqC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LozUe19h; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wriU1515464
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 07:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8Np3vAMjL3J6o3Lpc/P+gOzC
	v/SDCraSG0R5DHfhCvs=; b=g8tV2zqCRLS0QTs0B/bfHXXVa6nhGyBsHjCFT0k7
	5kvw3I/W+pvwb/x2ATNYFry5+xt0OYDgIONKGP2LMS7h2cL277QwoutgMcuukNL2
	R3LsbN6hlX3pETgeLqYX0RP5lMAUMxplbfiRENNA97Q3+2B/SqsR3wQ4S9GBBn2g
	hequbsauchtEC9+McPIcitgC+ZK+949rRV1KBz/Q22NmTp0+14t5Zvd2eBPCdm0h
	kPskV/dp6o/nR4b7xkOsG+dGuS6/Fp/72gqcC8NbW4jK8gF2equ+PGej1sWdnIQj
	DWdbX4vWO6DLywfAARW8zzKoPxTB8TRIND6nLuMcI3rQIg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsvcjjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:30:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517d766e05aso2940541cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 00:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780990237; x=1781595037; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Np3vAMjL3J6o3Lpc/P+gOzCv/SDCraSG0R5DHfhCvs=;
        b=LozUe19hPaNflzi2s6/hYgl+UElGMzjdCS7XzOVi9lnWRV1tWjgA0vIIrrtAI6PJuP
         Pb/FFkEHMzJ084wQfBbXxOFFmkK6hAvfIEax4LAQygO7rzBc/W4Xr5Iy9kBiqB+/9AFK
         gfenB+ji+l54RLRE7e0BRbN7yBQ0K77DmCWfh2mssaCW2bkv1oLvxBhcjkjeumdoZ5gt
         LEgTUMDKUKbDTZbErAicaNArYn2Se2CAa9uowU6/8ziam+urIfdppwPGMX7Ue4Z0Jixu
         C5T6858rvwXKeied2IHnVCLsaytGC4HdXyrCP6d4RbqcIKovcue71IjXfimrMaHm2KAS
         MRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780990237; x=1781595037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Np3vAMjL3J6o3Lpc/P+gOzCv/SDCraSG0R5DHfhCvs=;
        b=Y5V2OHSCZ4L33uGvjSdThZXceAoIzX5+ohXTA2OCdBjASEE9Bq2FAMf1ptyfqRJTuB
         LiOpIDVIr965Wk2QfdRun3cDJa64ehBhqTo+mGXYEu0Ymb+ZlAcZC9Pe2upqxPQSeRJV
         7qeyRkpM+pFQwYAZm+BY/D0AMapCG3wHkXuHGpEfnDYRRWIDER0ohwV4SWAQB8ticTHX
         uzfe31Zk9ToxZpzKC+MeDP+o4GtFG1sMvfXT8Hcmucb/2Z+5W/Syn8UnBQyH5Hi2rn/r
         eaoFJUnYgiBH5nR2jOl+Jk9z/AjykACTRQkQ1TrLybYtfl4/zxg04PNj65+GN9iEhNcI
         xVow==
X-Forwarded-Encrypted: i=1; AFNElJ9kdfya7rlp1CNJqjQdXxsoPLe30knBY5QY1OA3Rn6q2h0mKuU3XBvrtP6GPrH7O7MGLaBRaqUtle0Fg6u+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz27dgxuVk2B20o++hjhK73vs5UnWRgvWuHhfNiSXjpeaBR6/DD
	WB9IS1UJNFLFKzX53PE2A/PKILuMrpTrE86RLKhQKOrPghY4odGy9uKZ7dspc33GZTPo10IynmW
	EFH2zsXy0IrjFKIxvhpxOYpC5H7mVm1P5eUChR300AIoR7g1F8IOt8a8OrQRUjiYp0R9rBwzyvY
	h6
X-Gm-Gg: Acq92OEQ8gPmQvA8jxKCeepS+8LLKrV99bllu0iju4E0qzlE4kvohFMCBIEETg35OfZ
	7EC6nP3biPzXCAAIFDLt7fR5sP05bvOLjMgwRGFhNwJEC4Jk3BP3FFQbelOs328Pga62qPqS4/3
	ohZJQ/FxiRcU8u9CljQ05huukONqgRkbcxN6pexpSAqp56Wo3p+enV6yHIcZ9+8ni5F00vdNpyU
	3ahKLmnSRH+OmuyNIsUehALQrLEYHLO/+G8jhXZ0ecjprA7MlimeNOm9AVFwutPBIJkg/B0B15I
	yQHl+W7K20nsPArW1Bk6F07gBU+yuSwcQIP0VtrCfDie6iKDgheNHeVxPSoKrEYBw2rZIsiYu2K
	1jB+mo+rW4+c7qJvEY4uehZ5DdJtHWl7xNRrRR3SOrA8=
X-Received: by 2002:a05:622a:684b:20b0:517:c582:9161 with SMTP id d75a77b69052e-517c5829bafmr28027731cf.7.1780990237421;
        Tue, 09 Jun 2026 00:30:37 -0700 (PDT)
X-Received: by 2002:a05:622a:684b:20b0:517:c582:9161 with SMTP id d75a77b69052e-517c5829bafmr28027541cf.7.1780990236888;
        Tue, 09 Jun 2026 00:30:36 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f5612sm57587244f8f.15.2026.06.09.00.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:30:35 -0700 (PDT)
Date: Tue, 9 Jun 2026 10:30:34 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Eliza CQS EVK board
Message-ID: <fb5mewo6su6u5axg5oludgew5jpmxoimbvsrdc4xxczgyb4uyw@yn7kqgkgsyny>
References: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
 <20260519-eliza-dts-qcs-evk-v2-3-ad7303659d24@oss.qualcomm.com>
 <786f5464-d151-4c49-81c3-62cbb0a148b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <786f5464-d151-4c49-81c3-62cbb0a148b5@oss.qualcomm.com>
X-Proofpoint-GUID: Z26_cVcyCrEGD0R_XWShfXxHGGXmpxSn
X-Proofpoint-ORIG-GUID: Z26_cVcyCrEGD0R_XWShfXxHGGXmpxSn
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a27c11e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8QTKlXtQg7LSafaPMREA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2OSBTYWx0ZWRfXx7IXj9mz586C
 dQa3qsBiuOeRLxNbExIRMPwm7p2Cn/3eH1xBB27sJyhtNhDLbN1HFyAmmxXStxW1TT/5UvbbPIn
 jq63EXMvhTzts8a4gal6K0zhW4R75Uvs08QYngNP5VE13LwHeQFe2RzolVq17io8DDANOI2NUFG
 /ziiPJj4FHLt9uNc72CPvl+USAuUdMgUGf3NcdfMFMYPGZVnHz06PC3oWDPCZy6qzQxWFK+GjIG
 mx7f1wXj9R0VI0R9+YkEPz2iE1hCRhzKsM4A+wNU1W+NvHWrzrLD8nU1g75j83f5mp0+WMowoxP
 o2sHsZfMex0JKDADTvTmU9CuhaUh+gidqnVI/myg8Ys8UPlFysmHFxljtcYf8PeiTmofuEcLdyN
 76VL3VDeXJB7KRZWtJgV2j4Fbs7dcLDTZSqcKQsdt5aukce+scqXfv+HtzapqndV0FqRAPdD6Z6
 SfQZDjECy+JmkE2jOSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112027-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2216365D428

On 26-05-22 14:11:38, Konrad Dybcio wrote:
> On 5/19/26 6:09 PM, Abel Vesa wrote:
> > The Eliza CQS EVK board combines the CQ7790S-based (Eliza) SoM with the
> > common Eliza EVK base board, which provides connectors for different
> > peripherals.
> > 
> > Add a common Eliza EVK dtsi for the base board bits that can be reused
> > alongside other Eliza SoM variants. Then, add the final Eliza CQS EVK dts,
> > including the CQS SoM and common EVK dtsi.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile          |  1 +
> >  arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 20 ++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/eliza-evk.dtsi    | 20 ++++++++++++++++++++
> >  3 files changed, 41 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 795cee4757ab..e244e808a647 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
> > new file mode 100644
> > index 000000000000..d1cf08ce19d1
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
> > @@ -0,0 +1,20 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "eliza-cqs-som.dtsi"
> > +#include "eliza-evk.dtsi"
> > +
> > +/ {
> > +	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
> > +	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
> > +};
> > +
> > +&tlmm {
> > +	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
> > +			       <111 2>,  /* WCN UART1 */
> > +			       <118 1>;  /* NFC Secure I/O */
> 
> Are these going to be specific to the CQS-EVK?
> 

Sorry for the late reply.

These should probably belong in the SoM.

Will move them there and respin.

> Otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks.

