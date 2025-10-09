Return-Path: <linux-arm-msm+bounces-76589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CDCBC84AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 11:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E24A04E8C73
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 09:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6B02765D3;
	Thu,  9 Oct 2025 09:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkXcNGpV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E14127B327
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 09:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760001973; cv=none; b=sMuurZmNGcexqsSI6fhQQ17CUFrQZkkZ8gtPNc5fosWm+VEzAfkLsSGrO37JsUCH7s4jSHqacpOOhS/+pkQnnTFKz7G9l8kdI33zUEWuPM2cnFrMsUaybJGC6S2fOV3xml/kD8x8Y5LSLNc+ODA7CpCQjZjBtbRo9PLzSG21WNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760001973; c=relaxed/simple;
	bh=utxI/ULBqHNoRHaa98abrqVVhdCZaM5+EZRg0gJ11UM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QECsXzZycJw4D0YSYhS3taH1TLOXDmNS7eiwghfKLC4M6BtcRImWmSp2hHYx1Iek8+jPhUbU816IYV7B0DKYwWxFONLf6B1azT6AvlBGECdK78u02puwvgAMAUZmmrfEeaGc+7QRwT8mCPsRW6u0y/HdLAYHtQz6fMxC6V/oUwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkXcNGpV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EIKM028491
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 09:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3OVHAa5V6RkvtP12fLWJPioi/xyeh80to3fyM1SmruI=; b=TkXcNGpVNow8DpFM
	54D7T6YiqyJQKORDYNEjV0dXZ/iEQurj+JRSvjgH2QHSAUm+/GAQn8gh719jNLCo
	6LjwyjYmaIOC9Fz+idLGqT4SkPGWzROjqOK+dRunaH3Z0FtwvVSBSfTEzwQL70it
	0yf+hBsrjkaOFsOEQLSJRZZsr/5LL0dVBvHhG3OYYG4zhxGUiL17glot0+UhwElg
	5NkXEPnjWEGhyToVUEpjKo6J+pUEH7jQBsOBAReGqTEaP2P0J2v3/YBhEF6LYSM0
	mNRZ0gyF50zd9bAJ3G66P5t6kqXLkipH9TegPUo/Cv7F+Enk9aRWYgu8ErCC+20b
	i9uQcw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kt717-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 09:26:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e4b4e6f75fso2969371cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 02:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760001970; x=1760606770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3OVHAa5V6RkvtP12fLWJPioi/xyeh80to3fyM1SmruI=;
        b=TrwaFefFuNvVTbyVys/0rAYswvVqeUhzgJCYpFhCiaXmUSLVgQmU4yMTLQfLhVU5Z9
         P8dSIrVhyFNZewLxlacJEUBrbRHsolA9ImZVXew3UOgeZN6CGmHzAF/lFXug0Hi9FYzU
         +Qyh9LqZ4yQ0hcEkV8ROxmRzfVKEEmgr6T8SKnuF2QNfJ8B0Py8VRe2qei47QJO0IJnU
         RUjdpzjIhxzKaJo+IS5aVVvGRAxye8K3zJ6HSI0Uol6eBDRMriRzRUSa9HjlKhYdVY3u
         nzISczuxD4lDZLgNFYJyeJ0apqmXXu0KRdKG5q0W1Q8amAI3iwv7L6yV7nHMJP4H6OSb
         pdLQ==
X-Gm-Message-State: AOJu0YzN2Xo+Z+A/bO2NmPm6aY8mhOBSBdE/QPh7f1RaoJl4rJOC40iQ
	gzNnpvVtiUlOKPd7+zSNpnPU5CKo5yZg+GYpV9ieOLngtMGENU+EY1KzJQMU7KwpOHl/0IjiU+7
	u3cW8R+a1VjsZc2ya0qLLRJPHQOVdpojrdy+6EjlpFvRlC6UhO2vkmhy/GmY12etboKEA
X-Gm-Gg: ASbGnctTNZ8C7A4LmKaxL+lMAZMIGUBY03mfwu/4JQLFnOA1CYqg+YvG0cRCIQBg0SS
	5LBh+b7C7krpe9B35vHTAmWA+MxqLal/f1CZ0uBp4cSiGAldQRQwIOND9RitFr11UNRkGroAF3D
	Eclg/zjJ2C/OWRxziE6QMyeCmyYpmR9VyC4m/inlTdox7ewgQrOTC3vpjGlW8nnjHbyU8y76RyE
	rc5xz0Z3rCqW1eDoK4iUjmq5/B+S5mk75Mkkz7oAwO32ztsG+TkzZdmpYzWf48FdnoI2bHs+BZr
	Nb/DDfQ1DwXeiiQq8oARVhtfVxQKTAaenLrnj7VDUetP31vduaKxkQVpc7Iz6tgCagZ/5Y7BS2J
	1oTxnJA+YCbUh6XAg/PSeCnBbYv4=
X-Received: by 2002:a05:622a:3d3:b0:4d8:85db:314 with SMTP id d75a77b69052e-4e6ead5eeb7mr59493661cf.11.1760001969825;
        Thu, 09 Oct 2025 02:26:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTRPTAZvD3wF2/a9+OuTMJj1spFQmgeaFWHJlGbPvOzFAFoUdxrLC4mglua8zi7PyH4hTjIQ==
X-Received: by 2002:a05:622a:3d3:b0:4d8:85db:314 with SMTP id d75a77b69052e-4e6ead5eeb7mr59493431cf.11.1760001969260;
        Thu, 09 Oct 2025 02:26:09 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9ea1sm1841043266b.16.2025.10.09.02.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:26:08 -0700 (PDT)
Message-ID: <39ebaf4e-e91f-4568-8de6-9fc1f805a1e4@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 11:26:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-evk: Fix 4-speaker
 playback support
To: leqi <le.qi@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20251009072630.460387-1-le.qi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251009072630.460387-1-le.qi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0a+TsEKbEyQY
 VIaGj05qIit0T1URmDpaw3yDdcWY6PTDPaQ5+NdtXxDvUpssr760UfTOQKeDnDQBQbz3Eg5ACbp
 FXapI3WOh1eiWkxRpuh65Mc80yD6cbKHLCatMwq3I1+gND33vknlepJh4ylzGtq8vU0StAdol/S
 sp+QB39wSzON1MrNHlwUgMI5Bha31yy6UvOm060PwhiwarLt2QB30YvMO24JM03hLWVWKoimDEQ
 fL+8AjtE8PnoXs3OTxatsd13lnPtNCjhgZzogbNTjRhhl/Sy7edP8/VYX4EA2TJ1DpabMpOsA+q
 +TfuTKd1m+LUfT1awigW9bszPOqVb+TSkIRcu0YhCWlGybjONQOmnrIDdH6E75w18iecOOhlLi6
 nJ8rCpB4mfmRg2A1V6yV/s0LxnLJFg==
X-Proofpoint-GUID: 3BY3M3oMb6uN5Bo3uTR3aBB_GcphfxeM
X-Proofpoint-ORIG-GUID: 3BY3M3oMb6uN5Bo3uTR3aBB_GcphfxeM
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e77fb3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=GZ-sSbIBM5jd_UAKczkA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/9/25 9:26 AM, leqi wrote:
> On the HAMOA-IOT-EVK board only 2 out of 4 speakers were functional.
> Unlike the CRD, which shares a single GPIO reset line for WSA1/2,
> this board provides a dedicated GPIO reset for each WSA, resulting
> in 4 separate reset lines.
> 
> Update the device tree accordingly so that all 4 speakers can
> playback audio as expected.
> 
> Signed-off-by: leqi <le.qi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 30 +++++++++++++++++-----
>  1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index df8d6e5c1f45..de9af19be6e8 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -743,7 +743,7 @@ retimer_ss1_con_sbu_out: endpoint {
>  };
>  
>  &lpass_tlmm {
> -	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
> +	spkr0_sd_n_active: spkr0-sd-n-active-state {
>  		pins = "gpio12";
>  		function = "gpio";
>  		drive-strength = <16>;
> @@ -751,13 +751,29 @@ spkr_01_sd_n_active: spkr-01-sd-n-active-state {
>  		output-low;
>  	};
>  
> -	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
> +	spkr1_sd_n_active: spkr1-sd-n-active-state {
>  		pins = "gpio13";
>  		function = "gpio";
>  		drive-strength = <16>;
>  		bias-disable;
>  		output-low;

output- properties should be removed in favor of in-code gpiod_
function calls, otherwise the reset gets asserted by the kernel as
the OF node is being processed, unbeknownst to the then-not-yet-
bound driver

[...]

> -	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
> +	pinctrl-0 = <&wsa_swr_active>, <&spkr0_sd_n_active>, <&spkr1_sd_n_active>;

Similarly, because these pin configs relate to GPIOs connected to
the speaker amps, and not the soundwire host, these entries should
be split between each individual device

Konrad

