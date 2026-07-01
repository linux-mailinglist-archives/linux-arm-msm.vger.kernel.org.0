Return-Path: <linux-arm-msm+bounces-115687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XFxhDWf5RGpf4QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:26:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C02B06ECCB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:26:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X2xL6q2a;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VjbjiGDd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115687-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115687-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B52E300CEA0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 11:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B913C47884B;
	Wed,  1 Jul 2026 11:26:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8761646AEFA
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 11:26:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905181; cv=none; b=Q28meDxiGjvLQylFtRf3dNvL7qsqGvchVV/3bkvHsUtA7NHF6zcvy1OTUxbEgP7us6Z9GFPgr+532GuaEfsypvFuXd38Bgg+gAnclBGlo5g5D/kiQFV6Zmwv6qNFzS7S+bbK0DgKgEocA/jzUJPThdoFbU1K+Blgg/+aBJnbDpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905181; c=relaxed/simple;
	bh=uTrm+Ei0a9srd5hJciY+cu5JM3xony2sOLFOtsmJUCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CjlvRNzi3exNMClLLQMX55pZ3I/A7pdZJXZpWs8KOa6u2jIv+7qRdXKl6fAsuPRJWfkkVWBInFKLCKIY3jjO1GzotugcgC/Wr5iDwiRVIGZaM+IkiVeHt6P9Dzw2UtIn1iLit6kA6UajvM0E3uaXzNoQ85+zyzCPMwntepSLanY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2xL6q2a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjbjiGDd; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A93tp753738
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 11:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xp5p/r44DsE2JSugRR4ejWJMNXTC3UutYVUvdegbYT0=; b=X2xL6q2aSFMnFie4
	oymcz7Ls6BCDIrvnwREX6mT8rz7+qBNkuy49jcDCZXrfhLbtdNJQ2b1jqpGsRMO9
	e+2d5CLs2N+u+rSs22hFXE472jTFFApGfdoFzSKHgBGzem4ftBoF7FDoDp6pqcfa
	ddi8s5FSIEwLN17mTB87wKtm7cVdthudVFtUnnjBv5i4zQxBHR7oXEIXMna69FqR
	oQXzFFp2Fbx36tWImEto3TyiuhYGnLLXzv+A6ccs3wLkLifm9EJZYHLPTP89c/ku
	arPM0X2KOkn10Ivt/1yXKY3CPXJRiggxMJEPu2mxcq6S5ayJ95qn1x2soUT1fnE/
	0TWAKA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy2eb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 11:26:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07313be5so1040241cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 04:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782905176; x=1783509976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xp5p/r44DsE2JSugRR4ejWJMNXTC3UutYVUvdegbYT0=;
        b=VjbjiGDdWyxtf9tO/kvng5MZoR+Su1jycpTd3/sDAQM7lG3pQc50/heDsI9QOsKjiG
         zubgED5MWCkxXPmRhJgG3qP65FsOF/9WDalFIN5zOMBPp43LbIDWXftpjFxC9GatRj3o
         LqZ6bDkrPiDzBJaW0GxPtnxmB0bT/8DjvwK+3/aLwh1JL4nm+Br4Nv3R91iztHtUjNOS
         cagnETz3ifOxGwLGbgN2IP77w9eo76uF70FAvFe6IiF5kACtHlkVhnL+RWZ+40YwftBR
         +IJj4qpY3NrmnJ1Gnt6wZbzpwTp7iHbv2N0IZ6GxaNAI1FL/3a7THmZ2R6St2ep6ShPj
         2l8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782905176; x=1783509976;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xp5p/r44DsE2JSugRR4ejWJMNXTC3UutYVUvdegbYT0=;
        b=JeWCjQxffLvhGnDXCbx6bPqvKQdDwcF9XF8jGuY7rDH4xHIV9dTt6c8tNWC4AHkmBq
         TYzQgC+M+gCILJxnZpaZiHsfNY5jA080GbWa2VVYmMBShU4kW21xldUZeApp/dvKkpSa
         Iw3c1OZiC7BoqZoeDYbnuq4POA5t1fF/kUcflM4iSm0l1y4Zacr+hmh6Ucbpe0G6Ll3o
         O81+LytCtCZz7Oj3vQVO+0N22PkfG18yRImjre5o4GTzQiJz+66TCoiIhp7l1FLWZW4B
         jaHYxc0KdXnAUBQsskVSR9DxNtwmTd+WmmggkyFcjLJ6bwWcWKeHkdvY0lr/r4P/9hO9
         a23A==
X-Gm-Message-State: AOJu0YyNok5pLClZ6bDD4YY6etf169vmBz0elhphdG9PiDY1Nx0MAVao
	4RYHO+uxZBdejT8nEPKLNGHTI4nTjP7d/b0/ykYqB48dhWdsMjmUCGtW44670ZRWm5Qru24g54C
	cnIJy4o7sOdQf6/Mp86PXkQaH7MRr4bOHT2XQuRsWeFWVTXxRyZP/rqI5mLz+jdhRRYRP
X-Gm-Gg: AfdE7cm/PtyDOSn+p9QdZt4sxLeJy6KRDDiAc0Yas8r8tuFDdyNnOkgJ3LkJL74hhj2
	QuMbKWt83u8II7LXzdZDKTRxdsXj+UnsPtfebX75eVA7QS7/+UgyVACaAOkY1g3NHPGKABDIwsj
	qlCBospAIgma9nNQGiMChIWAyueOaYe6rcGc6nwYtYnshiibUO098oVMfK1OVimm+kuUaXBb5py
	OP+0ElknjTzImOkX/rAMsl+Gh4SP2Usyjk+BTqXLlXdXLV9l3Awhyb5X3ptDsf8GsNgrO/ypRCO
	qkJOlHZmY9OKlySNokT1G/MOPX5FrfR+nhnSGEBrM86uOjcBPnXJDaOPw2UcMjzfoLuhXCosS/f
	b/BNeP3S+n6JCw3CLZfdgPLS5FoAe+mzOCPU=
X-Received: by 2002:ac8:5f13:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51c2693f551mr9876321cf.0.1782905176506;
        Wed, 01 Jul 2026 04:26:16 -0700 (PDT)
X-Received: by 2002:ac8:5f13:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51c2693f551mr9876051cf.0.1782905176008;
        Wed, 01 Jul 2026 04:26:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12a42b51cfsm70242166b.14.2026.07.01.04.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:26:15 -0700 (PDT)
Message-ID: <83cdc9dd-65d2-48c0-b172-d66f513b9c74@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:26:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Fix pm4125 vbus regulator
 compatible and constraints
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
 <20260701-add_pm4125-vbus-reg-v2-3-6bac2bac7131@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-add_pm4125-vbus-reg-v2-3-6bac2bac7131@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iJ0UOTYyGSSwlc0yMuHqHZKb0AHbnnPu
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a44f959 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=AFF9jj2RtcA-9a89tu0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyMCBTYWx0ZWRfX6LS3nyDp7U3X
 4ZALfZTuqVQjBBcg79U4vmmxb8XLHu5XRuTuQB2ORoa75eBOS+SFyie4C4UtSTqvMJ8NE6iVoZL
 DrHTu9hku3q45VZ0txknj65fwlEbyv98UNUq3KzROGIub39kg8SDw4TemvgYr2wvdi0XfcsShXI
 nDS91t+jsFPvHfaB0E77+9LSCxQIFuBJtXfHe7rGRAhx7ZDNKS/8tHK1JEMOTfv4J7B0WiX+pOn
 wou0wflvCYibeLH4bd8ES9gziEPH4BI60rKDWuq2v6Z2mWLCjkirpBQhs6hpaBu8GvWZPMoMORZ
 dTX7z9agyE+OqDl6Y9QuFxeEWR5E+/zd5LpeSxTnAVHv9P5ho9EaiktaSTGQJaWKFgRq+QA9EKM
 d2mipB3QFZ4xr5FcOGZSptUuRkOF0LJRJzAa6Obk/p7to9A5QFsj/H+TeArJkc8LCXVjUvbDb6t
 hVA4uNtifTGTtmWiD/w==
X-Proofpoint-ORIG-GUID: iJ0UOTYyGSSwlc0yMuHqHZKb0AHbnnPu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyMCBTYWx0ZWRfX8EyWo4EY0gN2
 f2mnGA1CTfYkOnp+k0X5iGpU9F1rZP2zcHqPPNNqPH5gj+Ej7tDHiu/wrvCspXRfWmhWBk/fwvB
 wNqbuuxQAGzBPlggfa5qelUyBJLnRC0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115687-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,quicinc.com];
	FORGED_RECIPIENTS(0.00)[m:rakesh.kota@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C02B06ECCB4

On 7/1/26 12:28 PM, Rakesh Kota wrote:
> Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
> constraints in qrb2210 DTS files to use microvolt instead of
> microamp.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm4125.dtsi               | 2 +-
>  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++--
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> index 542e8fe030da40dfefc7b744dcc30133fdb35e74..3dc8d667d091ceb4267081d32b7aae983fc25071 100644
> --- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> @@ -37,7 +37,7 @@ pm4125_resin: resin {
>  		};
>  
>  		pm4125_vbus: usb-vbus-regulator@1100 {
> -			compatible = "qcom,pm4125-vbus-reg", "qcom,pm8150b-vbus-reg";
> +			compatible = "qcom,pm4125-vbus-reg";
>  			reg = <0x1100>;
>  			status = "disabled";
>  		};
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> index bf088fa9807f040f0c8f405f9111b01790b09377..2b50f3f577577d30a87fcb6466c7d7690270aaa3 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> @@ -235,8 +235,8 @@ &mdss_dsi0_phy {
>  };
>  
>  &pm4125_vbus {
> -	regulator-min-microamp = <500000>;
> -	regulator-max-microamp = <500000>;
> +	regulator-min-microvolt = <4250000>;
> +	regulator-max-microvolt = <5000000>;

Perhaps that's a stupid question, but is there any good reason to
not just keep it at 5V if enabled?

Konrad

