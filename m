Return-Path: <linux-arm-msm+bounces-79131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF31C13B55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE1DB3B41A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 09:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37E92D8782;
	Tue, 28 Oct 2025 09:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cjWFCcDJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F901B532F
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642505; cv=none; b=tszAgwB4895NgX5/FXkLRTFx9pVZWMJmcmQmW/RmLLZpGTn/cUAA5JXw/qnaP0lsY24yBnd8iDagD6E5kdjoeXJtNQR0tY8yBvgP1piw+FlYxorGMtm9KG88sbYOW/AWJE2ErSyl/R+aj2+xogNkj3KYa/6XvAmYuwC1YiHGeYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642505; c=relaxed/simple;
	bh=Mjy7PAoHBx36v7HAC236+RJx5SHs8x1JsKTGJ2NS6UU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o+u2ssTgtsUbr07Gm4j4aaRq41T68q607Tg+O5Z11NyQ7cdqfRSS+VtJJx8zd79aVvHEapDcsY7fUiYCIJ/GJm2i8R1cHcaY0Vga7RA1xJBQ1cz5iaSbx5F+zqckCXjNigQS5c4kNqc6i9VPSSsX4J/Vwa8HYcz2qRIt8tu/MZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cjWFCcDJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S4pNmE592015
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lNzCwtBrvgtjl8ydwxDZPx2RnyuBjsk244P+LTCOqBw=; b=cjWFCcDJIwlRWvP4
	6+AL2Rg9VjLUH37XJlCwumQhGczMosLlQNq58RlQUWnQ8Y1nnR+lO2lv3VC8d1Yt
	EVDp4zmzGHGPDbFNJ08lfz1SF+aNOm8B95c9TH8rx7kV53vTjU2LNZwKAOPapg6U
	Vq+fyROCB8xEOjIPoWwcbppPcDYKW4xXtETbNp7zMuYfmZgntB1tGFl8Eh+522ml
	7y4fwUUCpORrKAQJw4Xp4ynSAXRtQ8EtEyyp/CGctbdIvkrDmD3c79B0JG742Kvw
	Hzx592468RbxYaXK+AS+9ITJV2IvVkg+qqJdbZuE1z2qfKcZqKeE/GGai2hM0BJG
	LoJBNg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2q5u8q6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:08:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c1c70f1faso25145416d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 02:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761642502; x=1762247302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lNzCwtBrvgtjl8ydwxDZPx2RnyuBjsk244P+LTCOqBw=;
        b=xVNkQFZPf3HvDi8kzR6CCwxXJaT/IHH8aONCIDpZJdFh9ovaZbpA7duT1hJ5eNvlhT
         HnkDqgq940B56NTK7kKkRMSUSg3IxjDCldB1CxJn+hRt/e83I0N+OrRustb3pjdgcjO1
         mEuKA7wAKPPA0WsAeNBI475GqUTLZGpNWyDaNrZoBUUe8VhceVIppKhiajOQIg8eOSSE
         1wTCjoePSjduastZiSjeJDQBg+jEzHs4TSgjzEAVAix+UJjT7vIlbyD0QBFdBwpKdeeq
         FqEjsLOItkg9oW49hAAXlvmfKS/u7YiRHel0H1qYNA8AONqjUfNHaWngvvbRSyIUNk+J
         TUIw==
X-Gm-Message-State: AOJu0Yysq3GNjGC29ROPwaEnCO4vJBKlAz9GPO5LJD4YEhpWPPn5wTQ6
	1Noft7ZXDUJlnGeOjJFOBvQ2GXjEBCuxEUyCpPKVaLz8CHA6OCp91KEbUJBhrSSqYis6lr5ajie
	BE8mIdMN6zaxx/NGngtyKnn9EIyEr6U/ebypxGRXgkJP2ymbK10c9UXdz+GrXG8YHGeuJguMPxb
	yH
X-Gm-Gg: ASbGncuM+/K2ea69yd+0ZoUfcxHL6qaEwpDo/7ETTjHI29X0BLrzdfblc7HOWHITSrP
	6TsTu3SS+1pDKeieOBacegofPWOahIOb+HnH+JFW4DDC74OBAuaeanyFBeTXRS5QGWHW/vf4L3f
	+9DqKWS2bNWsCl8FisSczVd6sn/ogzFZoTkRF2XkrTTWYv4tfRppzcWIvZitoPAVN7OQ/pwS9Pb
	+XOtqbYACnGbiNAxMjHTrMa147egXvKJWHKIUcNYdDOHu1Gx9KWSUinGYb24BL2cYYeducstgyH
	ABhkTMW68/4nqliTybVsbQrBmPWFkl3vz3HuZBDluK3Y47llSznxTxqVwN1LLd7Yiw+KRQ140BS
	Z5ff3L1IzhYAL3aeZGB1Mw7iZLVcD6esRkJVxlD1GoGvvZzj8awd4YlN8
X-Received: by 2002:ad4:5c6f:0:b0:87d:cb51:4015 with SMTP id 6a1803df08f44-87ffaffe3d1mr25573276d6.1.1761642502355;
        Tue, 28 Oct 2025 02:08:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSsVgQ4selJ8mk4A008ZLRPPa4YkiK7p7R9VTF5PkagGcPA4cHYsISXb8KpyC6ExxL2/ff3A==
X-Received: by 2002:ad4:5c6f:0:b0:87d:cb51:4015 with SMTP id 6a1803df08f44-87ffaffe3d1mr25573046d6.1.1761642501909;
        Tue, 28 Oct 2025 02:08:21 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853696a3sm1026501966b.27.2025.10.28.02.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 02:08:21 -0700 (PDT)
Message-ID: <b5d9d47b-7fb2-4ce4-9bc8-0d28395b78db@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 10:08:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add backlight support for eDP panel
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-hamoa_dvt_backlight-v1-1-97ecb8d0ad01@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251028-hamoa_dvt_backlight-v1-1-97ecb8d0ad01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA3NyBTYWx0ZWRfX6RJPag0MKNrC
 VWKo04u636mAr/xWyIKtb+IwDU2OnblT8SMsyMSU53QZoVQ+k4+hgatf39J1lA/cTBfRAD+HaZE
 Jb9b8im+q0PC1+sVi2SJpmk+Sj89D9J8FQcWxlfT+fP95y7txI2LBAwu4ewNSMtexIN39v+K0pb
 Q3eGWY72xFkKle421+hPeVVsAS3orCz3XBsIvBaMi+szv9fo77vGVJLv7G3YjNgwoX9urfFjUvS
 17F8Vqs8vetKzVVSvjROaZrPHL6gXCEzXvB/E8RkuDNTm0SUAGjlKu174Wu4yJjw7b4Af/cc/Z1
 qVrEDmq1Yy1XZO1Zzo3YT3KkJr3s3gTfNhacOzw8bjUevZGwAHlSADAM8YSXF9o0pju+ccg+fON
 ScKOqj+pYI595S1NEwKqkghXF1io1w==
X-Proofpoint-ORIG-GUID: ylK9G81JUqoOXcXuN7ozRpvbAYFjucry
X-Proofpoint-GUID: ylK9G81JUqoOXcXuN7ozRpvbAYFjucry
X-Authority-Analysis: v=2.4 cv=c9CmgB9l c=1 sm=1 tr=0 ts=69008807 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gak16K312S0d-va-ULgA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280077

On 10/28/25 8:04 AM, Yongxing Mou wrote:
> Previously, the eDP panel backlight was enabled via UEFI. Added backlight
> control node in kernel DTS due to some meta may not enable the backlight.
> 
> Aligned with other x1e80100-based platforms: the PWM signal is controlled
> by PMK8550, and the backlight enable signal is handled by PMC8380.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---

The subject must say "hamoa-iot-evk:"
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 55 ++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 36dd6599402b4650b7f8ad2c0cd22212116a25fe..fda1b3a3c7673be74832c27849231cba4bc1f25f 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -17,6 +17,16 @@ aliases {
>  		serial1 = &uart14;
>  	};
>  
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pmk8550_pwm 0 5000000>;

Try adjusting the backlight value.. you'll find some funny behavior
near the max level.. which reminds me I should send some fixes for
some laptop DTs

[...]

> +	vreg_edp_bl: regulator-edp-bl {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VBL9";
> +		regulator-min-microvolt = <3600000>;
> +		regulator-max-microvolt = <3600000>;
> +
> +		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&edp_bl_reg_en>;

property-n
property-names

in this order, please

Konrad

