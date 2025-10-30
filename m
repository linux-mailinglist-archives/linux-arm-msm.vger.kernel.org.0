Return-Path: <linux-arm-msm+bounces-79649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 407DBC1F9E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EFC03AA5F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5236E351FCA;
	Thu, 30 Oct 2025 10:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dqDeOkJ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFBF335BAF
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761821064; cv=none; b=noWQfYz/CQFIVA6V9d9Q/ukWH7EuAyYISXuItoSuG8puqYiEsr2IGoC8QQiK56yHOVvOi0YJOjsToF+YQgVlR4eK0sRY+9dkr5qW3QWzWNbpETjvAN8CeFWtZ7mkSbn6DenvyFb3zGUAp49XnynDvDxain5mEamYrDyXygQUsm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761821064; c=relaxed/simple;
	bh=WBNuq+ZGVxRWTCoDAXYspaxNG/EOMwfhzOF6NNl22pY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9WCbj6/+08tKwgl94gGwMwAD3iRe+SUIrydYs+ef1L1w1Ao99nRSKRhYd3cQPdqjE6k4iLTlzEJZthQ+dBaP3ZIxW7gBM0DBpRE5q1Wk497KdSLq8yw5dhDdCSpfpdLFwrjwSuG6gFrcYGVqy6W5T6SSVP8E3EOTGwP3csmMzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dqDeOkJ0; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b6d345d7ff7so410107466b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761821060; x=1762425860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zOErGZpwLMOb7PwfNc34LT3iVngAjXuP7cLtNkH6Fno=;
        b=dqDeOkJ0zee/6wsx7HfVyGLj1p7EWv9PWVfkLMVSDFQlIow8/et3xbkvSN2hRHi8w9
         kl8deXgZkWwb7lenp0FJI5C7GGZ07XeRMwG+AjON0QKKmetxMq7KxSZ8PJpUXv+sAW3Y
         qZIypgPnBEmDi0DO9k2kbL0y4AL1R+wIBAZIohNNw9lmgbs6sWT5v3Zxeqrk+6UQKLIw
         eih3OcjE8fei55tpKuMoV3w7N3/yqcqBw3NBTSk0hDkUTYLjkxm9Dok6nPdkm6mB93Pu
         HFaTdRp/l1Vh0zPwhByPVWeRfIEBSr4JlER7eEdBurUOqPosSng+0oPyxdcaXvgF8DEE
         C9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761821060; x=1762425860;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zOErGZpwLMOb7PwfNc34LT3iVngAjXuP7cLtNkH6Fno=;
        b=SC5WgKTNgAmRSOHvnUthLrqp+oK0NJ/Thl1lC30twZU64dKF90QQFKFpqj7Q1TuIwC
         V6tf8ORG6w0UwwMJGNA+F1PAFmEtFQt46uA9AxhnsNtXL3UcbOZHhJREDfiCrZxRd/lk
         +OYP/NwiB0W4xG8wBxS+6JIedBqJnWMK03J5WgzrUjJiFAmhs09YBYi0ezjgF2LxgQxT
         gF8AupeQB2Upd1QXxIoyUMDdsygJTvubGR8d2cvZU3J7HqYqlHFQQTDRf0Twh3sR2ti9
         25mAzAbO0SIx7jKRy+DrJzenRFDbanFkCLc3yE1Z1tG+NrmSU/TbBuZco1inM3VQ54le
         1XFw==
X-Forwarded-Encrypted: i=1; AJvYcCX0XI5/pAZMvlfS4UyClHu9dL0rkLpiPf+omdYI72N+qhWGodT6x6e/lYK2Z+7HLjNwxCKohB3YVXjzNNyH@vger.kernel.org
X-Gm-Message-State: AOJu0YwK0ozg463kjK0UmoXt/R+ftJr1tX9+zEwyl5UDSWm8nDCYrTuQ
	aCaBbJAjjmthFvVH8SGPIBum6TbORK/KnNuNhSqoxOVi43dPoWOgSAQloloF3k+PX5Y=
X-Gm-Gg: ASbGncsTZUCgf/AUzQZuKKfI+qpEnMrw0oZ0GmF9CKpOHKXQ4/Io9+wXIez8niBdnRm
	BJpvgLIIiYvmmM5SSFrAdAy8tDTyswjm76ivAOAJu5tAwRHsWmw3o/MqTYdWcf+5pPKtlOM5Adz
	YfFexepsNWqFRoq3pAN/WZt9YLSCSoAjmoJ2JBmEoX1J4zFSYhfXxIVVTgtwVCB0FWDGGo7Mojm
	QBXzqMJ7mj11J7YhdoUUz9O+V7BXdpkVvoJZffklphIXWfdOvHb3W2PgieGQKLwVGQ0e12WkO+S
	gXkD57hCe/YgHN1IibaAFJE1HYHqup2RaWktrJ2BJ0i3Isj5HKi6xWHlsYXw344SU9x9OldOckl
	iWbgta4W0W/+Uc3GYXPEUJrOyXhKTWhnkU9QpcbTJNlbE2dIpseGteYuXA3jL3wRY9uAm+ISpx9
	hDvO/DJhjo9O32lTKPRhBG0+OIay95YZ1k+xMFYENDjC7PwbsJgO4Gb2uVZnznJdE=
X-Google-Smtp-Source: AGHT+IGtYVJD/Y/pHf4k9CBt97P94Orn8JwMiP/b+9frzwAxKr8mPjQLaIEcIupT/9ucSIpkO3DApA==
X-Received: by 2002:a17:907:d1a:b0:b70:4f7d:24f8 with SMTP id a640c23a62f3a-b70520e4069mr289801566b.22.1761821060521;
        Thu, 30 Oct 2025 03:44:20 -0700 (PDT)
Received: from [192.168.0.21] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85445e81sm1710205466b.64.2025.10.30.03.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 03:44:20 -0700 (PDT)
Message-ID: <9b6b1427-9712-4934-8b0c-ab0a8ae97b4a@linaro.org>
Date: Thu, 30 Oct 2025 10:44:18 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 quic_nihalkum@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ravi Shankar <quic_rshankar@quicinc.com>,
 Vishal Verma <quic_vishverm@quicinc.com>
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
 <20251015131303.2797800-4-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251015131303.2797800-4-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2025 14:13, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Monaco EVK board does not include a camera sensor in its default hardware
> configuration. Introducing a device tree overlay to support optional
> integration of the IMX577 sensor via CSIPHY1.
> 
> Camera reset is handled through an I2C expander, and power is enabled
> via TLMM GPIO74.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -V '"imx577 3-001a":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy1":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video1
> 
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |  4 +
>   .../dts/qcom/monaco-evk-camera-imx577.dtso    | 96 +++++++++++++++++++
>   2 files changed, 100 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 296688f7cb26..4df3044639a4 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -36,6 +36,10 @@ lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx5
>   
>   dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
> +
> +monaco-evk-camera-imx577-dtbs	:= monaco-evk.dtb monaco-evk-camera-imx577.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-camera-imx577.dtb
> +
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
> new file mode 100644
> index 000000000000..2237f0fc4a14
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	vreg_cam1_2p8: vreg-cam1-2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam1_2p8";
> +		startup-delay-us = <10000>;
> +		enable-active-high;
> +		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&camss {
> +	vdda-phy-supply = <&vreg_l4a>;
> +	vdda-pll-supply = <&vreg_l5a>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csiphy1_ep: endpoint {
> +				clock-lanes = <7>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	pinctrl-0 = <&cci1_i2c0_default>;
> +	pinctrl-1 = <&cci1_i2c0_sleep>;
> +
> +	status = "okay";
> +};
> +
> +&cci1_i2c0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&expander2 1 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam1_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK1_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK1_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		avdd-supply = <&vreg_cam1_2p8>;
> +
> +		port {
> +			imx577_ep1: endpoint {
> +				clock-lanes = <7>;
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&tlmm {
> +	cam1_default: cam1-default-state {
> +		mclk-pins {
> +			pins = "gpio68";
> +			function = "cam_mclk";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		ldo-avdd-pins {
> +			pins = "gpio74";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +};
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

