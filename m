Return-Path: <linux-arm-msm+bounces-112162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aI2oK3MGKGob7gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:26:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4116E660091
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:26:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bwbr73QD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A4goGxTi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112162-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112162-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1B383181F04
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 12:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4114183A6;
	Tue,  9 Jun 2026 12:18:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D45416D06
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 12:18:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007511; cv=none; b=bFbn2bFXQCJpZtCIBeY2FePqoCsbuxFu3l26zbYQdWVFGx1xEYj3F4jRmlViwo0aNIgasM728GE3y6W59AiA2QfgU0eKVVBU37G77lq2n05BwO7e2JvDgdfDCblK6I6IuvZTgC4FrFn1QwjDS/WZsD1EPaxcb/HH3eT1mvfvFK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007511; c=relaxed/simple;
	bh=XooUwXri4R+BoLa5L4foDmENTNjKE4+yhojS5sLja5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KdhTfK1Hyzcg68yR7HDgZX8h++XAjTm6QKcYbjN9PLwnqBS8bj3OdBjeoZDG6Z1Uu2dh9xlDKwZ7zHX2swHheJM/OX0gq0z//YhuwYD3Hs/A4B270oOLQF6SkW7KQOGbxDGvPCcUCC2TXSc5KH76UCzEucu2VYFZetn57AJjhhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwbr73QD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A4goGxTi; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659Bn9jf518627
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 12:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1YFD4b+EciMSnNmzK0ZeRJeHEjtUncEVJ+8zDIPQSkM=; b=bwbr73QDVI2TdFV7
	vsx/3Nm37xUjkUbU2Tpac9lM/lWR+Z7IVZEyDpJ/wQwq6V1q241I/Y0FHpPiJNcQ
	lpw8JMvtvC5L7k+szDr8Roho+wrN53yT1q8GeHsPLSO1QiW11w3OIbSU6d5UabzP
	mMQwkvdEPmy9nyfoC0AK55iPv20ipA7iVfRPzXHBAfpLNgtE1oJGy5SdMe6O46zg
	BGgNQLnVF5VsCKcfiQgzqX7svO1vHCPA3Dk7QzSXDbWMyZekssx1vdrlAJnIG0zE
	wPA7f8eEtWMhX7GKbNsD58bOF5PVe4x/0Yn9hRY+jLsddgu7oPzep7hfvd8VXdzU
	N0p0fw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0ss17w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 12:18:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5176891d0a9so14080591cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 05:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781007508; x=1781612308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1YFD4b+EciMSnNmzK0ZeRJeHEjtUncEVJ+8zDIPQSkM=;
        b=A4goGxTihiuw0y3Ig7AU5GcJWc4DeeJLYKPH9oWKOYkNliuTUcEARGc7iRX9JWOftq
         BRDS4MIsDjgNzTq5SW84FqIvH4qH9lnvlHpnkJFcuapK4H/j9TObKlRp46xtz0SWFnD/
         ro3HQoyS+jq3T2xr1y9i7XuqREwHQIY+M3XIFtc2ymOg2yyLRmhuTR8lEoIxSFGJ8G3x
         92IxxNUFe8cVcVSsE4GfwjGF/NmPe5FV+hRmPZVWiNFnKccgu+tU34FbgDExt+L3JByZ
         Mcbctt0FHSkmHSDb8tRuRJMgkAnaRM1Z19Lq4mktKU6Oo9nMsD0ynero+as+zFVq/ASq
         ccrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007508; x=1781612308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1YFD4b+EciMSnNmzK0ZeRJeHEjtUncEVJ+8zDIPQSkM=;
        b=BQ5vvffBw53NraimorHICNDWYDV4RExmk/ORcW9w90trS9DDs6zilr5RKqdSv1xlfZ
         eed9Lx/tun/Eyd8llpS4tglpEuWAGL3/bKKsFUD+kh4H1PON2tZmv6NaCkT/l+ckAvSi
         hzxnsRNo9JyRBO6K6an83MVfO12tOAQkt0s25hn31TTnOoPqD1407bdNdVN0JD2qIHvx
         cObpMWRbh9NGCdMK3+w6q9l933+RkuFzrzTPZZlf47eAoHglSVj06ZPdwAbmov9r1O3p
         6EBGaL6eGt14Dke+US7nixchTVtfWRRA/zViHfHkZ7lpjX/HarFysY8fdl8mE+D7ka1N
         YWTw==
X-Gm-Message-State: AOJu0YzNjkB1J0QpRfcy2siP3O4MU4B+eJ7QqKWyMu0noqkorSIhTUzV
	Zaix77yTS5iz+zV3Al1mXftKS1/oMbB6vuI5jE7+Atble+U010PwpCEJidm1BWPgGwokuc1kNzo
	3sLKWU+bp8C9+/iKmEllcEg0kD9aMhv1iLUH4fnhD/Dj7+wK31NBp8Z1LtUApOdJSIyiz
X-Gm-Gg: Acq92OF4vLTy6eEfnZsfWSFBCAN8rJvtlgr5MbZJCmvmFeG2MuakMLcbEmViRQyH5TU
	I2vUpuXVtkbm0b+nT/uVD6nwWDmRmvG9h4epiG6v24MeIOb1rng2lN/ndaKwyYnIYPVNurtLnIq
	DTx1HabmU7L7HP6ZoVIhylSbg6N5frJZTjJS7kOGaXv3btKS7Mep4KdpZt+5YM2uS3ZJhtvUm4Q
	vetO/ElXvYbEQUPwV1iqlHIc1AukFuZMk6F3cLsJ4uqt2Ve9+v7kDOm3SsGl7s84NDXSO+V2xR9
	2eUb/3rpgF+/LaNuB8qgJcfSaHgB/dXQhxq7wgbLeaEaxSG3D30lMRjalmaSkPEEmK26VCCdutU
	iXFaeiVCgVe8ukeWmhGxDwcmiVbTJjJzYhiUp0hyho482Vcrea0k9Ac6o
X-Received: by 2002:a05:622a:40d:b0:517:6d82:9d7b with SMTP id d75a77b69052e-51795b3e4cbmr169911531cf.4.1781007508059;
        Tue, 09 Jun 2026 05:18:28 -0700 (PDT)
X-Received: by 2002:a05:622a:40d:b0:517:6d82:9d7b with SMTP id d75a77b69052e-51795b3e4cbmr169907931cf.4.1781007502784;
        Tue, 09 Jun 2026 05:18:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e04a89sm1023030566b.41.2026.06.09.05.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:18:22 -0700 (PDT)
Message-ID: <aac3c437-16c7-45ea-8d29-77795bb27be5@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:18:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc8280xp-x13s: Use predefined MCLK
 pinctrl
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260607160435.36546-1-mitltlatltl@gmail.com>
 <20260607160435.36546-2-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260607160435.36546-2-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNiBTYWx0ZWRfXx8H9QQJStKFp
 KjNPvgcBnz7ByADGmU/F5nKv6E8TBEeiDHUT2Li+JXI2i4t7YztABwfi+X+FTM2R37Avs5+qkkD
 5kOObeJScSIyvAO4q0MlDz9wsIKwZOqxCmtjCbyqFz+iJ22AvPZ3OqwbY+//CbB9PSQFZB8DBcQ
 DA8F6Sri0cyjDHd8Cib+rPMSNpSthpuEdhWscRimbHNSjzV8rqkBw4keMDJ0tVopIMxUlkxiHrP
 vmYLop6855kcT6KrTCuyrhng9Q2w7ad1ctG3sqJCpvtMl0b5bH0rQ1sB7EkYqcAGS/hpFNbeEKm
 eyx6fgyZJYfr8Qv6uBciGkozbIMAB8W0bDABtANSEt8SBdyrIsHVVlDaMMwuof6uUyfDDIWG1H7
 ImQ7LlTm8koc9H6r8GoM1qOO4+Htu1ryNxkxFSRABZGH/Rrcys9lmGwOxfCazNPOxvtqMXluE4y
 KHayRBsBeo3FgpUJg8A==
X-Proofpoint-ORIG-GUID: ZVO9sBZuVR9dLg9ZytxIzqG7potmZA6k
X-Proofpoint-GUID: ZVO9sBZuVR9dLg9ZytxIzqG7potmZA6k
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a280495 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=af0J6g1wBCmrdnSuRJEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112162-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4116E660091

On 6/7/26 6:04 PM, Pengyu Luo wrote:
> Now that the predefined MCLK pinctrl configuration is available in the
> sc8280xp SoC DTSI, switch the ThinkPad X13s to use it. Drop the local,
> duplicate MCLK pin definition from the camera pinctrl node.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  .../boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index abd9c5a67b9f..5d652be69e44 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -674,8 +674,9 @@ camera@10 {
>  		reg = <0x10>;
>  
>  		reset-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&cam_rgb_default>, <&cam_mclk3_default>;
>  		pinctrl-names = "default";
> -		pinctrl-0 = <&cam_rgb_default>;
>  
>  		leds = <&privacy_led>;
>  		led-names = "privacy";
> @@ -1552,13 +1553,6 @@ cam_indicator_en: cam-indicator-en-state {
>  	};
>  
>  	cam_rgb_default: cam-rgb-default-state {
> -		mclk-pins {
> -			pins = "gpio17";
> -			function = "cam_mclk";
> -			drive-strength = <16>;

This changes the value of drive-strength (which is probably way too
high, but it would be good to know what Lenovo set originally..)

Konrad

