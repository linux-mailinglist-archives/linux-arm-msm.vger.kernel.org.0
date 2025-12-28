Return-Path: <linux-arm-msm+bounces-86729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B19CE521C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 16:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B8E1300C6F3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 15:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28C1296BC8;
	Sun, 28 Dec 2025 15:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gxrM/Kyk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cSdr4f1Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1822A21B9F5
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 15:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766936977; cv=none; b=XfnZ3GMa7D/rs3j+6aCBrRXQhYsotGXTC2+wu3onqDJsX2WN/NLNrSURkbyrgAezVXJTuLb+hAjQviBZAUR49JvxpUzMW23LPVFBQP/bwUFsK41RQ1rno9OSkmnk+hf08WPMlvyzOFnvQN1Jbr3veMyCH9Grp8gGJ+LMXIefafA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766936977; c=relaxed/simple;
	bh=dgG132k42M20FYnknFJL2g8UiEL+NDi4cy00SlMh3bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXBt4ES0zT4RHpqJcQ5yd+InudXcdC1xU2/ejjhKWJA0Bl+ZQoPx3JT1mbEAT0J2cRebjVb356JFQrx0/RudUGoPfUzI5dD3Hwj9U9XfWQqsY8tEPzn0zsMRuXZFD1jQHltnhL1mSTw3I7XeGz9KyC5N6Hwzd6rlj/vvmxrf9vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gxrM/Kyk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSdr4f1Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSEkBf22773520
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 15:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vwfeEIRaCKFeYtT0tLinArBQ
	J9If4EPdzyQ0Deyom+k=; b=gxrM/KykbJxt7MUwkZLDKhgwPDrG304JIVakK16F
	ObaBKB+dn83Dxv6qUCJiliRAaXxDmAEebMVprrPyuAdZ8kXqNPOeX+TWPS5cPUKS
	tMxULZBY2/4d7YB247Od4ImeXl86C95mfFaCq6iNDyeQLwbCDMeclawwFFdROcnA
	dnLV271h7eC768j5SKO9whYRd7pCEhTSCyoLY/jyK6pSQFhnSFo542CVhQq3xu3M
	MvxZQF0nvZ3ELqEsOSmvhBok9lY0XG4xkLgB1QjXo7gprlWBeD5rf4IOAJ31p3hs
	wLmvB2FTTIXqqU3W6SzME5Vl6XwlS3I/soem2Qx2ckc9kg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6sg2dnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 15:49:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee1b7293e7so309290281cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 07:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766936973; x=1767541773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vwfeEIRaCKFeYtT0tLinArBQJ9If4EPdzyQ0Deyom+k=;
        b=cSdr4f1YD5OlvPapR3D5BEvQRsyrk7pAIBC3OkHIzPW0SjDEti2Mus78EowSJsKqHx
         laI2KwoG/bk2uz6YPPLp8f2/JHpL0zjP7ApXcBgqefg1Ae3xwzll8R6TwPd2RkEk0y84
         g9z5JWrfklIppHKwYsf/fpRh1OAM/GAR5GzjWn0p3CMXYr163M5m5PNw+QTJfAn7juvS
         +zQ8sMZD9639CNdbhTO5D7B2p+Muup6r4Eoee2OHGDKS3lb3A7bhl4yHGUVMtPZg6sag
         mZRdIhxfD85oh+6mxsGgDpezmnbw8Jw8OgqKyhjLscBYxpxKjhxfZWVbBjWs3zRaJ5HM
         B3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766936973; x=1767541773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwfeEIRaCKFeYtT0tLinArBQJ9If4EPdzyQ0Deyom+k=;
        b=AUJOKusRxz/z/lIEIX5mV+rcQH3P48AI96oMkw8kravfGi9CHvECafJOdwqZcjF2GR
         npAeSXb/zz8pvBeTK+tWWToKVqCS+MnNE/On4k9TUe17lUfbIsZjwBQ2bJBLPCkJ6TsG
         5q4kNYcLUkiGKDNiWzsbpv759bBC1wTh6r1B6C//ccb+vuqrtXAwWGpVi56zniC7+c/s
         pax4tJTpDD2mXmBz2tQJTf8z6uzDF3YRfcnyI1mPQmFeUW1MqlvfCdQS+CST+qmMRnYY
         3XXiqt9Mx5w6K7Fk2mOsGLJtUDjL6HLSV61EwMetriW6fLSnBL7UgZHCzxvjJ18UAYEH
         DCIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM3DX7pD8Hm6ij+8SRF0h0/SyniK+2Y3eLszj0idiQwXdhyREdPKyB4eZrVfrPZVFOaWXStDZx0kc115Ls@vger.kernel.org
X-Gm-Message-State: AOJu0YxuEvSh+Q0Pc9Ej5HTnOdxFhEmFjqvIm9/vH4cFLEVxyUGkK9p8
	Xgdd+71PLD10og3kNfU4FneuX2lSo7/VYmRiC9UduwF4ZymaHkMr5r6NcNU82AFqgMCtkQoAG59
	Vf9ELug/l0aKn1zQdvdv96Eibj/QQQMN6iFeF4CYE6o8S5c2spoGeaJL2az/AVifGOmOyc4iu+x
	oq
X-Gm-Gg: AY/fxX5cxa89I65/kz30AikNpbn/K1oH9PD0Bte/k4LGHZO+gJPAxwnHwEWP0rZJ1Gf
	5lxvwrS8pDsezgxWuSa+OabdASCDCMw4g6uVSB3lcjVvRYqebRTTS9zwB1/LCCV8LhdE15zGoOd
	YQs3t5cAw4JoTYuHII+AjIjhUt5NBOd7jFI8wvPWORu8E89lw3qWhRB89tRD54dMUDtBLXaOt0p
	qvmu5QCfiUhQSQcUQpzinL3C3VUN1yH2dTICs8qWigrN4f0oi/9yurWI9rEVGs5IjyMI78ua3S/
	s60Z5XzHEHB75Ol4zdWBvp9hp/x6xNv0kS2Mo3Drup4OGUO+sW+URLhuZHBUXF5FgIszlv3l21v
	jkDBjvhTn6riQ1HDShen7+/weBE6S2UkEv5b6+6nCvC6p46NMecn+z0n4zNSrGKz1WYowHfHB+L
	ycp/Au61OEzuwrMJD75GE7mdY=
X-Received: by 2002:ac8:5d8a:0:b0:4b6:24ba:dc6a with SMTP id d75a77b69052e-4f4abd80e8dmr425514021cf.38.1766936973492;
        Sun, 28 Dec 2025 07:49:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKadOjIyAnFqcD13IwuUcPCTTuwkryXrcJSimm0Zo6/q/z7BMM+4i02cq1G83gDtjKO8KMMw==
X-Received: by 2002:ac8:5d8a:0:b0:4b6:24ba:dc6a with SMTP id d75a77b69052e-4f4abd80e8dmr425513761cf.38.1766936973088;
        Sun, 28 Dec 2025 07:49:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185dd1e9sm8083570e87.23.2025.12.28.07.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 07:49:32 -0800 (PST)
Date: Sun, 28 Dec 2025 17:49:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge
 with displayport
Message-ID: <z3y6wb6irac2ef3f55roy66wzyufel4vannfbynoivzgl2cuob@um5eomgvt5uc>
References: <20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com>
 <20251228-lt8713sx-bridge-linux-for-next-v3-1-3f77ad84d7d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228-lt8713sx-bridge-linux-for-next-v3-1-3f77ad84d7d1@oss.qualcomm.com>
X-Proofpoint-GUID: jTClFzI0wdwcaL4Wqy2a2hDDdlYDZDUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE0MyBTYWx0ZWRfXyYYnaNaPphq+
 xTeooQLRf/YQ21JGfIhc8fRL34TkIWmbKaVy9UZQfVATRp23EfSlMrghAhOPDiMBYb+9fJf/DXJ
 ZyT0l4uBv2NaGVgttvCp8pA+oeyDOxqdImKBtGJgI0WgfJZsw7OyDe04rLHQsHmZ2OitNBzkDb+
 sQmpQTruKHM/HB41+JoQazhJ7ctuojZUSdjinYmjD9rRxL9+52t9P9E3ffKDJfMsruOen/APUkT
 BntS2mEhdkVyFlm+SVhjU/dJi4eAXbHx4FmwZKDVEGta76hV/8HB3mS9k1HfwYj4biRRiOfdWoX
 VjA44l9WUwG6vDNEhJzcyKjJRFs7hcEf1i6+eAM8NZWBjLMtC4JRKVPvLETAfVxX9L0yM989UBZ
 9uCOSLl2BmZ0hwbfJzSN1mXDYtXkxWbWdcQ7WZfPFT/3yZZ/zcq3qDhdjb+0fWqhABrGJ+wSGAt
 +hC8YX19gWZ5jVq2xBA==
X-Proofpoint-ORIG-GUID: jTClFzI0wdwcaL4Wqy2a2hDDdlYDZDUF
X-Authority-Analysis: v=2.4 cv=Y+L1cxeN c=1 sm=1 tr=0 ts=6951518e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Qfnmt6Nk8Hwk5oKYdnIA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280143

On Sun, Dec 28, 2025 at 07:10:38PM +0530, Vishnu Saini wrote:
> Monaco-evk has LT8713sx which act as DP to 3 DP output
> converter. Edp PHY from monaco soc is connected to lt8713sx
> as input and output of lt8713sx is connected to 3 mini DP ports.
> 
> Two ports are available in mainboard and one port
> is available on Mezz board.
> 
> lt8713sx is connected to soc over i2c0 and with reset gpio
> connected to pin6 of ioexpander5.
> 
> Enable the edp nodes from monaco and enable lontium lt8713sx
> bridge node.
> 
> Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 89 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/monaco.dtsi    |  6 +++
>  2 files changed, 95 insertions(+)
> 

> @@ -396,10 +456,39 @@ expander6: gpio@3e {
>  	};
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dp0 {
> +	pinctrl-0 = <&dp_hot_plug_det>;
> +	pinctrl-names = "default";

Is there a single HPD? How does it work? What happens if either of
connected displays sends a HPD pulse signal?

> +
> +	status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +	data-lanes = <0 1 2 3>;
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +	remote-endpoint = <&lt8713sx_dp_in>;

Does the bridge use DP signalling or does it use USB-C signalling here?
And even if it is DP signalling, it should be correctly described as
it uses signals coming from the QMP PHY. See how it's done for laptops
with DP-HDMI convertors.

> +};
> +
> +&mdss_dp0_phy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l4a>;
> +
> +	status = "okay";
> +};
> +
>  &iris {
>  	status = "okay";
>  };
>  
> +&qup_i2c0_data_clk {
> +	drive-strength = <2>;
> +	bias-pull-up;
> +};
> +
>  &qupv3_id_0 {
>  	firmware-name = "qcom/qcs8300/qupv3fw.elf";
>  	status = "okay";
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index e44fd5c33816..7f6c681fb1b4 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -5117,6 +5117,12 @@ tlmm: pinctrl@f100000 {
>  			#interrupt-cells = <2>;
>  			wakeup-parent = <&pdc>;
>  
> +			dp_hot_plug_det: dp-hot-plug-det-state {
> +				pins = "gpio94";
> +				function = "edp0_hot";
> +				bias-disable;
> +			};
> +
>  			hs0_mi2s_active: hs0-mi2s-active-state {
>  				pins = "gpio106", "gpio107", "gpio108", "gpio109";
>  				function = "hs0_mi2s";
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

