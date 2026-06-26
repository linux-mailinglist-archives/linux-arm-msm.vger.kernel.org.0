Return-Path: <linux-arm-msm+bounces-114692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id avRDCwCZPmogIwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 17:21:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2776CE6E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 17:21:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YMyMKV93;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XuFhQAuF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114692-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114692-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC68C3006B0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 15:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508C337C0F9;
	Fri, 26 Jun 2026 15:21:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1626535BDA4
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:21:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782487267; cv=none; b=iO0mEg8vCbVBTwKBMcQSVpDMzAzu9cp2QKIH25GruaViLQTK4KKhAUuorxrsXAHFRU9jz5pV9WqUZ7HhKrN3XfxpFXrAsnZmUhoirMM6upzvzDyqYHXRL9DiNfdPLhyvIsi9vdcS03NiYSixqczHMesnTdxT+An5fE1ZkwlwbTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782487267; c=relaxed/simple;
	bh=ltF69OA17UroLUHIyRP59/gUxyGuE4XTfNICw6WzzjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3ZFWiHp2+5MYZ2VJWv7kCIxPIWxyCURWR1fENlcTIeBXk4L6PDIxpTMrG310F05dKhr7WJ0rYBmTFc5mxEP0jAk7QOHxhaEUXn6GlZwYz/52mbAEfso0djBph2jFeBrzIHnkQX2/zQxP5i5yUDwtBI5rsgjwImy3bLdRcGHLn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMyMKV93; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XuFhQAuF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QF45621150947
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xsLefAcDlircrvxuJgRyUJKceptb02A05dP+2K8RIh4=; b=YMyMKV93K5L61CUJ
	RnXS++4Q5kEcgoNkQq1IDRQKQV09BaAaHqQGbhtExVfiBH7V196vgY6y2iIJlLwZ
	Z+/wiev1EOWfH2XDF0k/sXh2qNKAlVm0sw/kq+Nt3Pos2SPq3deHEqwXmh2uZn11
	9jT8ccJp/ntRjCewDSdFtxRIxnL/Qh4VgwX0bSC8TzU5RtmKAbfuPnh7LPg3vOoo
	IGvnKv+jXqRezr10fc3y1nbr2mL+SdJpGcVritQc+w2apuLlTSYucaLcwRoSNbyY
	v7kVpkrHuVs9dU3j3Lgz/be0Lo2UccLKqpmeThJNTlvK7Frff0nTxVPLqEiWXRbi
	wNxCbQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgdu23k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:21:05 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7359eba94f2so32868137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 08:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782487264; x=1783092064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xsLefAcDlircrvxuJgRyUJKceptb02A05dP+2K8RIh4=;
        b=XuFhQAuF8eAlWhY1uhqkkq4dAk1yi6mWGwquBdJEg/hJkfu2U3/Fe/sgVcB3VsITN6
         e/ImoP1Yse9CVN3VxcdtvpU1HOrpcMvmx/yF4MiZzmubxl6a1GR6CCrrSBB/CK1ZGtQt
         FU/Uk0n/U/wuH9De2theHaLImFr4XaBSvZ1hKT1OOcxatRGGFjqd8oihLAjUO8ZkNhZt
         F1l5x/wna1JAMZrtgwMCIX7Md1CAxyiZvRrIktkJjhQS8ELaFDnSp9afSnATZdxOVAHW
         q5qNlQ8ecoaC3IF8HxspSbev9RsN9rSYVqraAUm8g/4fF5GbZmje7BRyH3HvLBzhqHhx
         xWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782487264; x=1783092064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xsLefAcDlircrvxuJgRyUJKceptb02A05dP+2K8RIh4=;
        b=MQuRVZxlf1mRLgk/6dCyZmp5y8pujy4comxgM66lTSLSeg2ucdjeTZIf/gOEg/vhdo
         Q0MoYgWlfA4BNVugcgpyydhk30BCcLVJ/17K7wP+2U52AgEWEG0NZ5NJ4+x11tewAka4
         n0b/NMEOfDjP78HD2JikyodCoqbPLboxTQIs47Jjr4LnvcOiNyv2jGedsTe0PhbukxxQ
         kcROMC/vFfGarGexlisJ+jDiiWdmZz1a0Ib36WG2PK0PhKbKRciaVoHX6FdaJHWa0Jr/
         HwBEh0Q6QedTbsJMAHzv1VTJtkTh8BwIt/aGCxLjh0BzPf3YTnFJx8flcS4UGa7N5dsg
         KPVw==
X-Forwarded-Encrypted: i=1; AHgh+RoUU6Wsc85Loq2aOba9UgbMnLWSxX6EoPgu+eECeJrDWRenjgP/BwyG+LxRkobCnNagiZarJeijghgOIJDw@vger.kernel.org
X-Gm-Message-State: AOJu0Yye98i1yEVbQ24MUkpmw7d/waugonz4Lt2hRhoPl2NLQSzynft4
	6tkLbxP8wGLxm13yruccPh+xVwqUrkiRG5NKQ9lwvkpRfVF1pWDyUsFQrPCUvDUl3qJ3U30nDk2
	ZA5xLf5VZFk+oj6JrTFdg+Jb7d0DV1RMIiNLBN8Jdfu8QUHAj2ZQsM3vdHiP5+t9otadI
X-Gm-Gg: AfdE7cmJHYB+aT3VT3vB2N8EP6ptDC43O9rC4KxNEGTTgvzMNvG/xO4otFA3Ecmx3cq
	AHMyHbiHIkTMV1DcgMWTy9X9xDmOUyfjWWQii303PKkwzJ1x/zNa4EMcWwuRQqn2TyLaCINj8QG
	ovH/hWrT9r0PUQtgBtZgMRCGVyWlaWAmwCveA45Q2y8Yg9qoIFzlNRt7zfxCskgA3Vz8bwkNXzX
	H6DRBzGnpL7vRY9NWjEhMt913K1UsxTj5jxChSrGJHYyYAwePrUB9E3I+tJtPj+/13PDcaPt6WK
	g+k385g3IP1HvVCdj0a/bdk56U99m0pcs4NofXTnhdrrOs1SCiT//9/Ud/cCNHBMuhF4mk376rp
	yww6r9J8lDbg3Gw77CULUrWNmnIZWvv2AhbA=
X-Received: by 2002:a05:6102:cd3:b0:631:25ab:8bbe with SMTP id ada2fe7eead31-734366bedd7mr1212345137.5.1782487264300;
        Fri, 26 Jun 2026 08:21:04 -0700 (PDT)
X-Received: by 2002:a05:6102:cd3:b0:631:25ab:8bbe with SMTP id ada2fe7eead31-734366bedd7mr1212332137.5.1782487263890;
        Fri, 26 Jun 2026 08:21:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a7a6sm3475196e87.40.2026.06.26.08.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 08:21:03 -0700 (PDT)
Message-ID: <f07dce35-f807-48bd-a04d-76d69ae74f37@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 17:21:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Fix DWC3 core register size
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260626-sc8280xp-fix-dwc3-reg-size-v1-1-ddcba897b19d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626-sc8280xp-fix-dwc3-reg-size-v1-1-ddcba897b19d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=API5kwXb c=1 sm=1 tr=0 ts=6a3e98e1 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=ksxQWNrZAAAA:8 a=8AAO5B-9T0azXVr5E88A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEyNiBTYWx0ZWRfXxGI/EO/DKCOz
 IdTRsI4bL3dr6v96Fv8vdaCK1zu0AMVprUPWX8PJUE2ZbJ6nHzgINi2SRJXDNt3BvPbkBr4AbT+
 ukmNKmeluoWo3ZopudX1raru1Xg2+u/Nfn9reIPxCQ0Djg6N+KKV/d2RTG0Hn30gmHthGOmwQJw
 nGcAAMZTBFJdpu9C5PfALMcYfVMc5e3lG0vKyCM4OSxGfNoex0M5OMzEEoqvPdBjUKWExgObAB+
 fEcnG55jCQ61mU3MZJUD2Tvx9CS1WdEJ1cNpXZckOigXzAqZ55uinmELCGekIsG8I3Sp/H8tGoc
 guPmow4QL3i4fvaZUJPG+dyVnzcT4p0csnCj5PmxIgL+YF1uxLRaBprBFJuFpy3R2MgZjh0EkTM
 yfdrZqiiquDB2XXFZsZBs5KH1RUKJMwqPcU4zROjGeurpiWj+MMno0fSAe3H7/78DBC72Rk/0T3
 HfBc/yjmMO14G4Y0gZA==
X-Proofpoint-ORIG-GUID: 5Pn_49AjBH2Bb6lckzMjNOBBRjV27pZk
X-Proofpoint-GUID: 5Pn_49AjBH2Bb6lckzMjNOBBRjV27pZk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEyNiBTYWx0ZWRfXx9TFy2A/yYLB
 fqd99+wSEu+VS5q7VZ48quO7me3CFxlrarZxDS0UDp3I8sNZjlu7iOQ8RQ09Uvsh/mhZ0JF/Ts2
 IHBBAWuILHGKBFkpNapLXBjds65UHJo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114692-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp,radxa.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:sophon@radxa.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:johan+linaro@kernel.org,m:quic_kriskura@quicinc.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:conor@kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D2776CE6E4

On 6/26/26 5:07 PM, Xilin Wu wrote:
> The SC8280XP DWC3 core register regions are currently described as 0xcd00
> bytes, but the hardware register block extends further. In particular, the
> DWC_usb31 LLUCTL registers start at 0xd024 and are accessed by the DWC3
> driver when a controller is limited to SuperSpeed using
> maximum-speed = "super-speed".
> 
> With the shorter resource, probing such a controller can fault when the
> driver programs LLUCTL.FORCE_GEN1. Use the correct 0xd950-byte register
> size for all SC8280XP DWC3 core instances.
> 
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Fixes: 3170a2c906c6 ("arm64: dts: qcom: sc8280xp: Add USB DWC3 Multiport controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index a2bd6b10e475..d06f79b7680c 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -4034,7 +4034,7 @@ usb_2: usb@a4f8800 {
>  
>  			usb_2_dwc3: usb@a400000 {
>  				compatible = "snps,dwc3";
> -				reg = <0 0x0a400000 0 0xcd00>;
> +				reg = <0 0x0a400000 0 0xd950>;

Let's do 0xfc100, the QC glue driver already does out-of-bounds
accesses into the base+0xfxxx space..

Konrad

