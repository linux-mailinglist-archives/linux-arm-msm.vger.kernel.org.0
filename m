Return-Path: <linux-arm-msm+bounces-84482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A3ACA7C68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 14:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8D4430E5DDA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 13:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32660296159;
	Fri,  5 Dec 2025 13:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSda8SHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTU4ea56"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC7532AADF
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 13:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764941594; cv=none; b=H+xqJop+WM6VRjXqFhOZr7GGu7GEvJLHHtjz1R9vnDwZYhJ968n+oFGP6lrvxo5O3aKIPTYOwoei8DjrmKQM6Z8zZVgnRBt+2Xt1+13/+XaIn5EQESROeHZ0Hy52EzLulnKNqs4maUyvLkilgE4hVWiE1nCHh3YesjnXcxWxYms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764941594; c=relaxed/simple;
	bh=QHj3xnwky3Uk8wvgmY0YtvTjrcA0L0RkTeArbF8MyRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/XW/8A2/++kbmwNFHAcYHuud/45YTHWbq3zXF13x9oDweV344m7FHTpYukcM5/mF2rsa3wU7CO05fSZxhz0s4Y6FtuFaCC5AXRB+N9zZZYs+xwogZF8wsHqxj8nBdSMSIKYHqIzZ5bKaA1yxIpc+6kVwXRT3a7wKw9bnP31TII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSda8SHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTU4ea56; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B58XGPX2516887
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 13:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NEilRw3Pm5b/R4XVm3+IxDimgP8gvCmGMXBVBgylipQ=; b=cSda8SHG0x0quEaG
	GAWtydV3y9Wbp+lRLauKv7Uy8mxi1yFesPQxDhZWN9ukaS+i30X4xo1nOb5qWnRz
	nddeVyN32tEWqBvBGDtfMULci74mKkMYDe2xjgGp9B2bFCw2qrvnaZzu//2Agluz
	uDlV4B55DvULh/eGItnhnr40UiODJdiGkb9ZN/QQj9774GyxsTlZLJiHB+JnDmgy
	J/opFDtW22q4AQcA0Ycu7Pz6joaGCR+bLmF/Bckmt7fU9DY5vI2ds8I6mumZoAi2
	AihT6GucHRk7pPojt9Q3RI3+S55HiiXl/8IkZuLaEaz4VqtkcQ1tgSSv0WRWspfV
	CE3rwA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auj7n2a18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 13:33:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b222111167so42518285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 05:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764941590; x=1765546390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NEilRw3Pm5b/R4XVm3+IxDimgP8gvCmGMXBVBgylipQ=;
        b=aTU4ea56GMgyqE0d8V3eu/v3HhSsSfNEdbIAV2/2BcJaCxyp6kEaD/zGCmDjEVRO4z
         2/UB/HeVcQ7J5GC47OANfIpyRfztHy98bDS9ebObUtH6GWC0aX6eclY82qHh+wOnQ9PI
         b8mVa/tBESoqE7Q+gqdp+hJy64TUQHPOleWcQtWKk3jDP9C0qWD4pkN66h9bT1Tli2oi
         OU4YAxEiNVkOp+sd4RExOPBw1SgQPmsDeazubN0mLbm01bARTBayOWuJsm8mV0EUfatX
         xyOpKKu0Mbia7ixJRtGOVZrAWIbHQuUFdi2didh37DD06XD29MRqIH1R/5/xXJWn9bWa
         aE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764941590; x=1765546390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEilRw3Pm5b/R4XVm3+IxDimgP8gvCmGMXBVBgylipQ=;
        b=SJ4XmI93aNWBstLxkcGO/muJ2znMRt6WkVvlzPBIRtiQQRTDhn+UYlCi8oPIN3p1Lt
         QQ1J66O99+5LtvG26ciTaCTHUpQGib0HVniYMXqN3qlVlE/EtOoa+DDwirY0bI4BbtFN
         A+t5IFlOykIeDTi6a1ZZVfLTmgWWn1JnDZxP1FCU6GuGQjA/zec/ii2LtyFs6zdXY+VR
         4YU2RHAR4dp009+7leHLSIFK6UK9MKZg3rcz9NZf9hU9inPHtsfTETwxYIL0Tm2ombix
         zanDb70/CpFGK+YI0SIngpztSdUbss0u1JAkmQEL4tn1lPQa68uyR3faaBJjIsVmO1RT
         p+uQ==
X-Gm-Message-State: AOJu0Yxs7CeEBXEK2d0A60kWXlyXkGEaWZY2RKk0y3Kk4v/RfnpERSUj
	jR4Lu6FeXNvU4CARYc6HdrSgbCceVZY9p50vwCJ3p5E0+PsRkwOFS6+cLrwkYr5BjLk3EVRE+Oi
	bb/T8jBqYrBNDjBHvhetHUz6scCONiFIotNEyZZarPoGcXMAxqrESLxCHJqTJXMdUcFV5
X-Gm-Gg: ASbGncsc1J13FYZTWiI82O4JVOp4FYDlQBd3aN92y79M+4yJ3Y13J0AYR91yxSH9BzS
	SOpOg68j2uLHqHBLC6yL3UPkhkiJwc3f3JgecikrphObkKSdeXoZaN0svp88nyRelEpOc5mpcmT
	YopUYDE7Q0QSou9c2aJf2K69iehBZTof5UdPjXuKSTOB90Xb8i5/NDWU+T6GLW9q4peZr8RXlhk
	ufLZITTsU/8ZITsxDR45JTFRC/g6gd9Bh8HDtw9yqrYcu1CzN+SsvQD7w3j0SaVnCbe8pR6A1iH
	VBy9uuUvBmtO79RsvWOirg4G+oJNsVFopP6xpzTqV7Bgh8HZZ55yTfobEFsNfv1FsFr9oNZk33i
	H/vSEGo5ZAEW3fYxzgu1mce6GKI4fTAzvyGYT1WTB8e25GOTwH7DYifCvI6PVQey44A==
X-Received: by 2002:a05:620a:1a9c:b0:89a:7d24:f5eb with SMTP id af79cd13be357-8b5e6e8350cmr974018985a.9.1764941589738;
        Fri, 05 Dec 2025 05:33:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTjTKXrFKkSK/V0KfZ7fy94EAD0Cg10uR1dF7MXrkT0U1GkoASZlYw6J8tBsUcuJVDIGH08g==
X-Received: by 2002:a05:620a:1a9c:b0:89a:7d24:f5eb with SMTP id af79cd13be357-8b5e6e8350cmr974014885a.9.1764941589261;
        Fri, 05 Dec 2025 05:33:09 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f44d3d9esm357996666b.30.2025.12.05.05.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 05:33:08 -0800 (PST)
Message-ID: <2190ecf7-5dc3-4264-b2b9-e8a20d099b40@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 14:33:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8750-mtp: Add eusb2 repeater
 tuning parameters
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251204044644.3072086-1-krishna.kurapati@oss.qualcomm.com>
 <20251204044644.3072086-4-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204044644.3072086-4-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DOSCIiNb c=1 sm=1 tr=0 ts=6932df16 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7xTNHD16rym9O0bEjTgA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: OM6ZJgkaWKAUe2i4e8BBEHTl7hJPi80T
X-Proofpoint-GUID: OM6ZJgkaWKAUe2i4e8BBEHTl7hJPi80T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5NyBTYWx0ZWRfX3xncQakT+wRH
 Kbc6snLI1bq31Qgnf0YKfsotWrxcupZLD5axxbFfygKXzHk8EJbhNsDb/g7bTg20tE7oqVbUQV4
 rPygO8TsCNEBrle4PqDLRZktqAQWgtlWelZwh4/j73sAD47lAPqVLtQUaVJ7qluHy3PxH8AWNkR
 BSgBarB1OB4UVGSL5XkH9psT19Sb260ek6in4yLaAKHNRlL6kjH+WBE34KO3jx0xwkvW+wBYqHZ
 OebRhhw35F81cZ0HuxLhpMtFKi3zLVomMsLBfOvBpCjpJQ4C1w4mul1njA0tUHuNV4ba4+IP6/F
 Zm7l4vwd08RujkvH3FO6HEMQs6D32RKSx6HkUM5kUAsF0PBYydESom4kXYIvUHvgntbFUojPGd4
 IrhrFfQstTPYbQcN5zKq1wFncr3c9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050097

On 12/4/25 5:46 AM, Krishna Kurapati wrote:
> Add eusb2 repeater tuning parameters for MTP platform.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> index c8cb521b4c26..b9a4d1c99816 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> @@ -1041,6 +1041,10 @@ wifi@0 {
>  &pmih0108_eusb2_repeater {
>  	status = "okay";
>  
> +	qcom,tune-usb2-preem = /bits/ 8 <0x3>;
> +	qcom,tune-usb2-amplitude = /bits/ 8 <0xa>;
> +	qcom,squelch-detector-bp = <(-2000)>;

This happens to be the only(?) node in this file that has status first
instead of last. May I ask you to fix that up, since it's even visible
in the diff?

Also, does the QRD also need a similar update?

Konrad

> +
>  	vdd18-supply = <&vreg_l15b_1p8>;
>  	vdd3-supply = <&vreg_l5b_3p1>;
>  };

