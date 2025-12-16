Return-Path: <linux-arm-msm+bounces-85315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ABECC1534
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 08:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 077B33048096
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 07:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 987ED3128B2;
	Tue, 16 Dec 2025 07:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MKcJHQ7d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949C73093AC
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 07:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765870563; cv=none; b=k9js1U6eySdSR6G73baXdKTqsja+UA6+MGdhHoJpxa0YY8H39PFrAMLDkDp7QsR495/DgYVQdWQx53Vs1IOo2QaO2lYROvQDCVx8ChIwsTYFgnub8HuG01XjEBGx5q0baQ8LpiDLSrl7g5KNWNWFoUOcgdwLgKKqMqrhM6T2OKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765870563; c=relaxed/simple;
	bh=TSTZH3ha7P3zf07UuAzzCe0DuOTPhq7Iu4ok3zeXQDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RslbAHh0RPaecKS2/gmXDwaEcQlOPr1aSnqW3fXzVzh9O9BCpmG7ESwfe8bCucNdCpheHveC6fDfkgzbcwLUu4Ekh7GtH0mfv4RxJqk4Tu/EgIciDf3SD5oKmnJwfP3I9dZ8uLwKlYHhfHLwfsPps0jnyoRs++vaitFrcRyBLCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MKcJHQ7d; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5986cd85d83so202450e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 23:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765870558; x=1766475358; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n16XrMflW8K8mCPPIig2n79GG39zI0dw0k9fySATJAk=;
        b=MKcJHQ7dLs5AtE6b7YT3ZDf5h3PkL5su1lXUpP+J9VClf9fUGrUYX/MCeT25FVhJ59
         ix5+KNe4tgJt9cMfVy97/AGeAN4oWklYOkb1haEjrQw7GQ2AirIl0auSmTAiOJdfs5qs
         EyTj9dpJL8XCkVyenr9nT9+wqYB8b5rSc5Wo8eHRXeeVG1bMCCRZpy8ya+H/egpEVxOo
         wVBusbwblb89K4aQbImL0/m08ndrZJetUbbzoYawmltU8hCUaKg5YMzjoBWW5tI8okVX
         h+pqLqKB9CKBQsOhBwDbK7tWFpWkGNah57K/MMfGDFXmsAP7QOORbzl07LHEavKzUJhd
         QjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765870558; x=1766475358;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n16XrMflW8K8mCPPIig2n79GG39zI0dw0k9fySATJAk=;
        b=Ftt0+0+apsc0k/f5Tu8ssxraEODl3A9iXnPINZLVGACNQFo2Q3TlHV92KAEr5uVxxd
         FJhJ75wEpZt7MfgDuUDAMLiczCsC+H6fOx+9BwKDgL/k/R7o4vb2mVJuIzVCxXdYq+D7
         wd0JXqojNrlnFUFccOtceUwN0Osta8p0/yYuePycUZMma1bqvh1b+F3iDyogBOK0TKle
         czXAMD/oT3loCcXO5hWp+7CK68RtiZxz7d/G0PS3cctYVnwZ+guXx6iLFzOI3rOXjxkk
         zO5QQJNnPeuodxyfMakSW5PRszgFjhJcRN9XJpzUyMqYCL9o/zprKUCwg04q8UmEkI7m
         Zvpw==
X-Forwarded-Encrypted: i=1; AJvYcCUzyALBpHD/izwu6Hez+LJyspShJ7eUh/LygtW5YEudsDiGABVSgfehKYC+wL0H527ifPynKuLPeE0rEgfD@vger.kernel.org
X-Gm-Message-State: AOJu0YwVy//0R4s9uA7ls8yqHlVbirGk3WFR1B8nNNovq8eRvH4O/G4y
	PAcQlKPPbXQ4OZPBD9YrQG8alqJmT3FRLIH6Gx8wKTs2LKyy2MTi+IOX35nPtViVDdk=
X-Gm-Gg: AY/fxX4+Fxl0RRJzwr5XO2hsjKUA/T+6r1uciiuwdT1aI0zJv+Sds6HtbcAazLCEJlv
	z32rtvsw71M/LVexj1oNHYOc+6qkVdzV+w5gGFg2LPFBYJVGVosWi9nMAlf3XF1ihBGTSbge1gn
	ZF4j7tyeBEuP0S03Gtx69lXmk5zPoHPVm2a010ifwSIohWxSKnGW4j9ZWsvAifqQkN+qMu1s1gX
	gng186kkALMTdD7NxlsV1YXmBoxlRguFwiYDOYeNf7/Qhs7uti3I8XGDB1TfZsXYtYeThvEdIej
	Lbn160Ciaq5xwU3GrnDOeh7trBkMgHgluypubFQGbh29nbK/hXJayji14REDbyuv2l9EJa6+YCo
	Za5xWG16zT2vUHj5nOXBBf2UNC9+dvKSADVHcBEeasG04RYh6G9axklA5F2MFyz79uNk4D7fnam
	7Aza15HbS0GxkSz+rClL2Ece78sugAdauN3gVvdJaiuXdVSd5XSeytzuyr75981SS/1w==
X-Google-Smtp-Source: AGHT+IEA3Aizumvo2C29apLGRfL5f4cmKkJaCe7dpJMQ1br+YvsIHx4NhcZQQJWEH/cY0jbWIL6pIw==
X-Received: by 2002:a05:6512:3e27:b0:598:e3ed:b43e with SMTP id 2adb3069b0e04-598faa98e36mr2872191e87.6.1765870557425;
        Mon, 15 Dec 2025 23:35:57 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da5040bsm639372e87.65.2025.12.15.23.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 23:35:56 -0800 (PST)
Message-ID: <5bd29b5f-6fcf-428d-b451-698d92f0883e@linaro.org>
Date: Tue, 16 Dec 2025 09:35:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
 bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ravi Shankar <quic_rshankar@quicinc.com>,
 Vishal Verma <quic_vishverm@quicinc.com>
References: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
 <20251216062223.2474216-6-quic_nihalkum@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251216062223.2474216-6-quic_nihalkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/25 08:22, Nihal Kumar Gupta wrote:
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
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |  4 ++
>   .../dts/qcom/monaco-evk-camera-imx577.dtso    | 67 +++++++++++++++++++
>   2 files changed, 71 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6f34d5ed331c..b1ba182a0d8d 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -38,6 +38,10 @@ lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
>   dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera.dtb
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
> index 000000000000..351eb5ee70ba
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
> @@ -0,0 +1,67 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

Year is missing.

> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> +#include <dt-bindings/gpio/gpio.h>
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

Please remove 'clock-lanes' property here.

> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	pinctrl-0 = <&cci1_0_default>;
> +	pinctrl-1 = <&cci1_0_sleep>;
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
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <0 1 2 3>;

data-lanes property value should be '1 2 3 4>', 0 is for the clock lane.

On CAMSS side this cannot be changed, unfortunately it's a lingering issue.

> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};

If only one of 3 defined from 4/5 regulators is used, do you really wish
to describle all 3 in advance? You may consider to remove 2 currently unused
GPIO controlled regulator descriptions, and squash this change with 4/5.

-- 
Best wishes,
Vladimir

