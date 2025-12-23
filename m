Return-Path: <linux-arm-msm+bounces-86371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B96D0CD9FC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6791730202C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 16:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406AF339713;
	Tue, 23 Dec 2025 16:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WTt8Aj8B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FCA2BD5A7
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 16:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766507797; cv=none; b=M75+b1fkH9SLzf+VoHyzgADmUj8sv/1DEpnU+Kk9Xnst/1toe1pnZbmnDnnUItBWiPfrosCkJVHqoIJRIPqengEQZ4ResCaVae2pKe4h4YvffT+Pltr/oo0vbO2fL6t3PfpLpDlx1GOOQ7Eq0XkXXzbin2WhpTDMRcxlStW9EjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766507797; c=relaxed/simple;
	bh=AsonnezPKVC7fI47RBf1taVr00tLuXlLrnBnGNUWfIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RmMS59pTooqkrzMSRoaUgN1c2aj6iJhJc8R9SG/f6Pk3fx0nH3m5u8KXL1yPlcO2G6g6t0NGFMVH+dnhxQzfPpuAkHnyZRc3VU7JhzVBN3nl8rcST8mGmEakTZaFINfJMPU85GegomthrXhsSKuikPtidy0VNf96Dp1K2XrsYh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WTt8Aj8B; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37b9879f5e2so5569551fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 08:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766507793; x=1767112593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKS7HHgG53xO1wfAq0YsTD7AWJr4TDXXhEFRUFw3RgU=;
        b=WTt8Aj8BN1jdpOjjN1beCTPTJ4dVMvp+neXzsbTAqyvK/4jqPIMH0n1tGR8oC4ITrv
         WKCzS92XE/6ce/dJvQ5TyhC7lFZ5xC5HjxZJszahrAD57fzWaBQXpoIMPAXbdygq+J6B
         VB9sxRVz2MLXX/KRTQ0tc3bl0q3mstW+uaLSSCNblW/2QWG8EyB7Bx8265mzxEFYJA08
         hc1MOcagSFuT+hxEBnwj2EXXAo6/bCt4CoBdNbHTVQ1VbDIiNuTMHVXgDe25VR9Oze55
         L9TB1q73aWZdLLPukK6d8DSoZTWlhXJqL6oU/l0sEh44/MC1Q/g3MrvTkcvMNsY3VeR5
         5AEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766507793; x=1767112593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FKS7HHgG53xO1wfAq0YsTD7AWJr4TDXXhEFRUFw3RgU=;
        b=o4QdBrrGe0qfaDpOUQl7u36QL0DwAKKbqZRE4/WPaJ+q9Xcc6+6VT1z0Zn7WZJxySO
         ZuFQcHi+PgTE4LJheSvMX2Lq4YSz182iLOp8n1IDS79Y80jz1Ft/eI7LzcOBbuV2K4B9
         eYWpWq6ecriIbRrz/qxpV7/ZgKiQqdWZzncaCuFXV+qiMbChz3kCu0zklgtIfVxtNEcp
         u7w/auKYx/kda/vYdkTWLkHw5lBtbCI0D271/6GJ06qtwn1MNxxG+DlKtaz15GUnnb1f
         r3iWtTt8QkN27ylKxheZxlbcxZPdJopWaZrhRaKx7PIc/odyYiyCXoBFriqRmDazyQxW
         5mjQ==
X-Gm-Message-State: AOJu0Yw0/TvDyPBxNUdOIv5ZBZA7Dpw7hpODY/mWMyzrdOCM2LyimneO
	U1Q7vVfS9ihkZ+ZySyw1H78wt+eMi8OyFKdyYz0Lf+QbUZlCzpRHFiVRGLtwADDWNBU=
X-Gm-Gg: AY/fxX4R7O+GZeDSdRqBdlArvfLjXqrjXaeYBdtMxGrPR9DEU5HTtMyNLeJG915+NTz
	jUlSqpcgpz7g1F9jrLYEzRGG/l9l79yLEjmJftmfP1zTO0cgsFir4NkBAAMu4JAPRGXJYmSYjME
	g3Tin6BD0jpZJBy2VcWyraPZ4OHiuL+Y7KbPhK7JvNlHEM8coYnJQhgWzwK5Mo0jTkAofrVZ/Y7
	tHEJ0dJVIPDBRU1nMYUJeh8Evol56z/Wqy9BNbOmkLroLJwvBN8xyLBe9fugHzGodaha3/3kj4P
	xLJHGUif+5/yNbKsyDTUMtkad4U+Jmoj5rvKyJ067/DieCWokB7lOUEpfAUBCY9hT0jo8nhMuJO
	i0eOKltG2wfZ9pVfKvc4UN/cKQWa0atmmdpIWikISzXkTLf+/Pja2gqdgc332YAHN5a/Vu7XpAK
	whNI1MV2sW0yOIpEoigu+6d/2EAOoXGe3Kx07U1g9fumrbMYlqKIeZ+TYdn3ZLPCPNiw==
X-Google-Smtp-Source: AGHT+IFzEMRoITpmQ6ZakNQMm/lZNEMEzobgiFj5hsm84XHa9Vri2Ps+bWTD3utj6T3YjxNIu83zkg==
X-Received: by 2002:a05:651c:b0d:b0:37b:bafc:26a4 with SMTP id 38308e7fff4ca-3812156a320mr27330121fa.1.1766507792755;
        Tue, 23 Dec 2025 08:36:32 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38122693ad3sm33548271fa.49.2025.12.23.08.36.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 08:36:32 -0800 (PST)
Message-ID: <f5df62d0-6b93-4630-92d0-d8af35432178@linaro.org>
Date: Tue, 23 Dec 2025 18:36:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
 <20251222-sm6150_evk-v1-3-4d260a31c00d@oss.qualcomm.com>
 <cfb8f192-b327-4bb9-993e-a28184571712@linaro.org>
 <703a502c-883d-434a-8bcf-f785080f5102@oss.qualcomm.com>
 <091b863b-fa0a-4d3c-8461-60cdc4970992@linaro.org>
 <a767acb3-8bb9-45f7-99a6-68a595e4ebb5@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <a767acb3-8bb9-45f7-99a6-68a595e4ebb5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/23/25 04:16, Wenmeng Liu wrote:
> 
> 
> On 12/22/2025 11:45 PM, Vladimir Zapolskiy wrote:
>> On 12/22/25 13:41, Wenmeng Liu wrote:
>>>
>>>
>>> On 12/22/2025 7:19 PM, Vladimir Zapolskiy wrote:
>>>> On 12/22/25 10:44, Wenmeng Liu wrote:
>>>>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>>>>
>>>>> The Talos EVK board does not include a camera sensor
>>>>> by default, this overlay reflects the possibility of
>>>>> attaching an optional camera sensor.
>>>>> For this reason, the camera sensor configuration is
>>>>> placed in talos-evk-camera.dtso, rather than
>>>>> modifying the base talos-evk.dts.
>>>>>
>>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>>> ---
>>>>>     arch/arm64/boot/dts/qcom/Makefile              |  2 +
>>>>>     arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 64 ++++++++++++++++
>>>>> ++++++++++
>>>>>     arch/arm64/boot/dts/qcom/talos.dtsi            | 21 +++++++++
>>>>
>>>> Please split QCS615 MCLK definitions change into a separate commit.
>>> ACK.>
>>>>>     3 files changed, 87 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/
>>>>> qcom/Makefile
>>>>> index
>>>>> 60121f133078b2754f98e6f45a3db4031b478cc8..b1d85b1f4a94714f2a5c976d162482d70ae920f2 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>>> @@ -325,7 +325,9 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8650-qrd.dtb
>>>>>     dtb-$(CONFIG_ARCH_QCOM)    += sm8750-mtp.dtb
>>>>>     dtb-$(CONFIG_ARCH_QCOM)    += sm8750-qrd.dtb
>>>>>     dtb-$(CONFIG_ARCH_QCOM)    += talos-evk.dtb
>>>>> +talos-evk-camera-dtbs        := talos-evk.dtb talos-evk-camera.dtbo
>>>>>     talos-evk-lvds-auo,g133han01-dtbs    := talos-evk.dtb talos-evk-
>>>>> lvds-auo,g133han01.dtbo
>>>>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-camera.dtb
>>>>>     dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-lvds-auo,g133han01.dtb
>>>>>     x1e001de-devkit-el2-dtbs    := x1e001de-devkit.dtb x1-el2.dtbo
>>>>>     dtb-$(CONFIG_ARCH_QCOM)    += x1e001de-devkit.dtb x1e001de-devkit-
>>>>> el2.dtb
>>>>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso b/arch/
>>>>> arm64/boot/dts/qcom/talos-evk-camera.dtso
>>>>> new file mode 100644
>>>>> index
>>>>> 0000000000000000000000000000000000000000..ae1a02295b4dc48212aad40980a329ff458fe69a
>>>>> --- /dev/null
>>>>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso
>>>>> @@ -0,0 +1,64 @@
>>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>>> +/*
>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>
>>>> Please add a missing year of the change.
>>> Now our requirement is a yearless copyright.>
>>
>> Ack. It's a lawyers' domain anyway.
>>
>>>>> + */
>>>>> +
>>>>> +/dts-v1/;
>>>>> +/plugin/;
>>>>> +
>>>>> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
>>>>> +#include <dt-bindings/gpio/gpio.h>
>>>>> +
>>>>> +&camss {
>>>>> +    vdd-csiphy-1p2-supply = <&vreg_l11a>;
>>>>> +    vdd-csiphy-1p8-supply = <&vreg_l12a>;
>>>>> +
>>>>> +    status = "okay";
>>>>> +
>>>>> +    ports {
>>>>> +        #address-cells = <1>;
>>>>> +        #size-cells = <0>;
>>>>> +
>>>>> +        port@1 {
>>>>> +            reg = <1>;
>>>>> +
>>>>> +            csiphy1_ep: endpoint {
>>>>> +                clock-lanes = <7>;
>>>>
>>>> Please remove 'clock-lanes' property.
>>> ACK.>
>>>>> +                data-lanes = <0 1 2 3>;
>>>>> +                remote-endpoint = <&imx577_ep1>;
>>>>> +            };
>>>>> +        };
>>>>> +    };
>>>>> +};
>>>>> +
>>>>> +&cci {
>>>>> +    status = "okay";
>>>>> +};
>>>>> +
>>>>> +&cci_i2c1 {
>>>>> +    #address-cells = <1>;
>>>>> +    #size-cells = <0>;
>>>>> +
>>>>> +    camera@1a {
>>>>> +        compatible = "sony,imx577";
>>>>> +        reg = <0x1a>;
>>>>> +
>>>>> +        reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
>>>>> +        pinctrl-0 = <&cam2_default>;
>>>>> +        pinctrl-names = "default";
>>>>> +
>>>>> +        clocks = <&camcc CAM_CC_MCLK2_CLK>;
>>>>> +        assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
>>>>> +        assigned-clock-rates = <24000000>;
>>>>> +
>>>>> +        avdd-supply = <&vreg_s4a>;
>>>>
>>>> Just one voltage supply?
>>> yes, 22pin camera module only have one pin for power.>
>>
>> It's common that mezzanine boards are supplied with power from S4A or VBAT,
>> I've never seen a camera module supplied with just one voltage regulator,
>> that's why it attracts attention.
>>
>> What is a camera module here, is it on an attachable vision mezzanine like
>> on RBx series or a part of Talos EVK PCB like on QRD series?
>>
>> If it is a mezzanine, the support of mezzanine boards should be done as
>> a DT overlay.
>>
> 
> It`s like RBx series, does not include a camera sensor
> by default.
> 

Then to add the image sensor support please follow the model with DT overlays,
and it means you shall get a schematics of the mezzanine to describe the
attachable board.

When you get the schematics, you will get a valid view on voltage distribution,
sensor supplies will be derivatives from VBAT or S4A anyway, I believe.

See sm8550-hdk-rear-camera-card.dtso or qrb5165-rb5-vision-mezzanine.dtso as
the references.

-- 
Best wishes,
Vladimir

