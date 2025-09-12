Return-Path: <linux-arm-msm+bounces-73303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A555B549F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEFEA189D031
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021822EA73B;
	Fri, 12 Sep 2025 10:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRXaSTge"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867CA2EA467
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673407; cv=none; b=p//7+2QCzB8jhOto3Cpz3eC8ujabCXwUsJCtCrMs0lJ4PlNUKGJfS5796PbtBusA08Q69nKOOtGVtpzigV4ABI/8ouyJSRkj9lj2UlJUZFEY0VxEi4ef8GUhYoXU52esbJFoSxfDMJU2QOuC1B/deIW1pvJ6r/OOr3mTt2I7cB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673407; c=relaxed/simple;
	bh=nJ3+l5v55fpLJ9xg3lY7KIMVNF6NVqMD4GX1L9S7lTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JUVNGC2bxbRmMMhLJTCQs1PJZVP0x6RMxLVPSpoxFd9Ie870cxWlqsbYSCIZ0QRWqJAeOB963vV/dP6pHkJxfU2jqSGEwgRxCegPLBNOzX7of/uj3NFQgrB/iXYc1siMl+HhexAAMYVikUGTun7gP3gR+uoRFeLfNI11xolOm88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRXaSTge; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fLuX010823
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kuHENK0DYgi7JlXzy3OZov0FtKUnSjJcORNhHeAJWYU=; b=PRXaSTgetmg7zo0w
	8p3lbwOJ6d1M9WnZe5isUSyBKGnV4OhtM8zPP/FpHxml5tOvmt3B7qVE8jx9FxTu
	yyhuwKmp2dAW4/MBgOPuCax387Ou86SPB43fMN9Eva1YdUn82fopsZOLJsm9/iVI
	AzJdj06Nr62QF3zOmG06y8KSKA0dMSG6zidkRBTY0JpHQOtQ89WUY+xe+xpqc27w
	dLv8fpjJOeXTsImOjEKhLqKqzlSY4kipXpLdk42+pkq9WTt5dWhC7YG8iucSHMP2
	mJ5qlUDmCEVzu1ojjyY1YgQO7LBk9C8Qouoi0UG4hSs7MtznxgDcDqPDbP4blvx2
	iEPk7Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4mb1re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:36:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70dca587837so4043366d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 03:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757673404; x=1758278204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kuHENK0DYgi7JlXzy3OZov0FtKUnSjJcORNhHeAJWYU=;
        b=YwXXRLKW/Wjqi5EzVoLTV1rXe4lakcRVKHMKF5oD1aCxtiGpnjkaoOA6zusrok0Hqk
         fCfnde0T3m18eSwvSzbMjH6/EaRtd8efDP40QIQeuXW5yk2WTHszj4GKbqyRqcID+6ft
         XpywSQMwGAT9JowO1A9w4g2yDui9wngt0OK4dI0tm5V+TxRseaOXLQTLcfzcv43Hzf0i
         OxrT9SR+/txF9VRiH9UyvQIgZM+wEGvvq2bo+fYkpX/k0NfvlKH6QAfvHnWVwSm2NqOk
         i81g1POrozApqagmYR8hVHuLyKiHAtQN5dcEucEcX2jl83ANeewB8cT/Lu6YJom8abqW
         jgOg==
X-Forwarded-Encrypted: i=1; AJvYcCVbZBLY2wBgyoE68j7PBjEH4u51O8rx8VlH2MCrn+vJwfTfc2dGtxPBHnM92J1TU+wWfo1x595Sx87v9iOe@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe3jSu8vBnx4xiD8r21e5e4Xyuiz+gcPpuyC/fPygdSJwzcR8G
	oE8lAFsYZsB8yJZ1f2WhZqkOtYFCR+KKgiyJ1qTtSD9Ak4UDKOrSb+o6tXWDbdI5DRzRflwyh51
	ySWhn+Y9ybQWb6VWqfpMiEQ+bHl1I3aGKz8AiJ+tZxWPfptFjsoM5REi4f9sLB3vqZq78
X-Gm-Gg: ASbGncudL9BJUSIMvjtIvHCtObJpJ8s72dyW9FYCO/isBscNWuPlqXNasGq55UAmvOO
	lNf7ILYDlWWeCfslejgLaGrhnW6SU6HrCIrY44gAEcwEd97p2ERUFlZ+UO9By15nN0iBpwbcINU
	dVd2qMuj5gdqsgSzMH+MQJ8o4hlPB1FbQHrfHIp+hKlj9f4eXgaywRvkQXr+a8TJRTKS3ARQxrz
	RGx9secUjG81bAnhbxN+wMyIzVl8SRuBjG6G0ppZrMFOBGXelAylUx1bDxWaTbeK6ELrfk+eUlR
	4Vo1Y/pYojOGc7p86gCivV75mwIaJibjxoT+sI7pwgLd4e9ts2JTr+2W9zGI/3RDhJ16c63ybdj
	Yw76R8/JfjYeBl955PvzVoA==
X-Received: by 2002:a05:622a:901a:b0:4b5:fc2a:f37a with SMTP id d75a77b69052e-4b7888cc278mr1141051cf.3.1757673404461;
        Fri, 12 Sep 2025 03:36:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU7PAoPRCNJz37EaX6IxNCBg6Jtsm+8T8pgUt1a0L7KS8lH3skeL6+I/GUlg9QPEybmuu4Fw==
X-Received: by 2002:a05:622a:901a:b0:4b5:fc2a:f37a with SMTP id d75a77b69052e-4b7888cc278mr1140821cf.3.1757673404019;
        Fri, 12 Sep 2025 03:36:44 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd88fsm343748266b.51.2025.09.12.03.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 03:36:43 -0700 (PDT)
Message-ID: <fa6f147f-c4fd-4267-82e3-139129caccbe@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 12:36:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arch: arm64: dts: qcom: sdm845-starqltechn: fix
 max77705 interrupts
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250909-starqltechn-correct_max77705_nodes-v2-0-e4174d374074@gmail.com>
 <20250909-starqltechn-correct_max77705_nodes-v2-3-e4174d374074@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250909-starqltechn-correct_max77705_nodes-v2-3-e4174d374074@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX4jnpX5optsu/
 zjgFFgaeOuvyODA02XdrZlFOYS2MOEsjgSP6yIf6ESY8ZkthbXV5RHZ3NQIHFNXGhG+gO5J3dok
 sBXx9yaOLTF3Ouwc47w+ZRk3KfrvaPyW5IJbjX/8kby5qyzq2HbXMf31i3RYAxtE7ItfZ0q8Uyk
 AU63l9Je2V/7yBPldnkZSNJiNsONUmE7EQsqAei4fOcmdfYQ4WyPixVGynO+siomsecsQRg5LgV
 cxKqTGV4AxNKpSzi7H8r7eUcafnida7cmereIzteY5H2TC8P8rynxPyagiuu6NJrEdp8KWHPouZ
 N++WJ9ZjdduvBR9YCri7Io1Tvmag/EHGZ/QZyaIVn4VnnYM7VLzrAgsfJNHHdLMHjRYuROLxXab
 kPY8+fIn
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c3f7bd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=5anC7vb6YJh9jDJep64A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: WsY9Olp4DCDY-FwTRI3w4P59I0cbhaln
X-Proofpoint-ORIG-GUID: WsY9Olp4DCDY-FwTRI3w4P59I0cbhaln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

On 9/9/25 9:22 PM, Dzmitry Sankouski wrote:
> Since max77705 has a register, which indicates interrupt source, it acts
> as an interrupt controller.
> 
> Use max77705 as an interrupt controller for charger and fuelgauge
> subdevices.

"""
Direct MAX77705's subdevices to use the IC's internal interrupt
controller, instead of listening to every interrupt fired by the
chip towards the host device.
"""

Fixes: 7a88a931d095 ("arm64: dts: qcom: sdm845-starqltechn: add max77705 PMIC")

Konrad> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
> Changes for v2:
> - fix commit msg header prefix to 'arm64: dts: qcom: sdm845-starqltechn:'
> - remove binding header for interrupt numbers
> - make interrupt-cells 1, because irq trigger type is not used
> ---
>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index 8a1e4c76914c..597e25d27d76 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -584,13 +584,15 @@ &uart9 {
>  &i2c14 {
>  	status = "okay";
>  
> -	pmic@66 {
> +	max77705: pmic@66 {
>  		compatible = "maxim,max77705";
>  		reg = <0x66>;
>  		interrupt-parent = <&pm8998_gpios>;
>  		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-controller;
>  		pinctrl-0 = <&pmic_int_default>;
>  		pinctrl-names = "default";
> +		#interrupt-cells = <1>;
>  
>  		leds {
>  			compatible = "maxim,max77705-rgb";
> @@ -629,8 +631,8 @@ max77705_charger: charger@69 {
>  		reg = <0x69>;
>  		compatible = "maxim,max77705-charger";
>  		monitored-battery = <&battery>;
> -		interrupt-parent = <&pm8998_gpios>;
> -		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&max77705>;
> +		interrupts = <0>;
>  	};
>  
>  	fuel-gauge@36 {
> @@ -638,8 +640,8 @@ fuel-gauge@36 {
>  		compatible = "maxim,max77705-battery";
>  		power-supplies = <&max77705_charger>;
>  		maxim,rsns-microohm = <5000>;
> -		interrupt-parent = <&pm8998_gpios>;
> -		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&max77705>;
> +		interrupts = <2>;
>  	};
>  };
>  
> 

