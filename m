Return-Path: <linux-arm-msm+bounces-89811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDe3EXrFcGkNZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:24:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EFE56B50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:24:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4234A5E88AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 11:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AEDE40F8F2;
	Tue, 20 Jan 2026 11:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsfxfUDs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43738346FD2
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 11:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768906988; cv=none; b=OwNoz7k1rDc9hy4UoDyO+crYoRiqIgLe9knhP2MnRfEEdQJXvPyF/mV0B1DCyfJJW6ZXwGGUDQGW06M5cVJE3UNqbvreW4sVbhr/fHOCGfAILIuX1lVXF+QUOLVbFhCuIhHEHqxVOKMOVX0CPoQzMa1itM2E6H+ulA7fbPNLyZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768906988; c=relaxed/simple;
	bh=5OA6bNPETcupqq2lPUorp+Eny9CcQn+xjwzTZ8G0RJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5bpxDYat4m4oLk9kuErtSM0Iw0hkfC0Iy4jtALyJLvkYp/PAKjQTA/uE9U5be9g1J/J2mYK3iFW+EdJVzzfOmqSl8kHycCq2ZTuLuIGyCET6yu7/caT9i9qAVQrRwuyo9F86wkC4TVRT4skdXPzsGQxSvmeqds0q8IU8QHuD14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsfxfUDs; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81f42a49437so2578351b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 03:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768906985; x=1769511785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wyX4YHrmDwIWOskZYXY7MpXFXWUHXvIpcnijKgVhNv4=;
        b=DsfxfUDsCGG4Kkbooh8R2dm+GtIIPZY9MSjLSnHtPQyedo9NJlrrmsRit+Sc9u7YfS
         KC3C06h+K9gJXIdcKxmzDIFUjClm3XELQ8dUxQnLG3lZwI8t2MVt7/k5q/dKMqXaA3Gl
         4nLWQreYtIZPZqT+KD9SYBWOpwA95Mdcz/wpiEBFfKnF+Pg0wJpnwxiJAdv2U0Yz2jK1
         TdW73enkGAzoQCmYippyBlvdulTNAagm7CTz/cF6gvj38+Vnxm3vxylstoYL5Zjn9wCL
         EHF2i8fmrxpz16ha6y/W2zMRzbfZp0diDy/sPGqArZOlOAP88h/bINkUHXaoGqweofWB
         qNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768906985; x=1769511785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyX4YHrmDwIWOskZYXY7MpXFXWUHXvIpcnijKgVhNv4=;
        b=rY76BV1OikDnIyOr0mg8Xj0VLVFguy1rLkUMj0ltImaBgtKYwjS46BWnfqJKC+PEF4
         YP0OW86bdRAa3TA4FNSUGO01lLYGUJb8yxNWqGNkWJYsewNEaqB8yA/NdMmFxHmn4hwn
         EqnbOxM7cvfc+tJ4fBE8FjC6maObsUfHl9ZNaHNB1MXwchfo+G2mos3HxLkan5/ICZTb
         YnfJles/KZCyF3m4LBOSadqToukYVlMt8he0VD/7vDwF08tBRPAYWxpl1qUT6cIikDSp
         8hGYkbEeev44p5D675nvjvzDsU7E35+PYYDtrfQFf/ghkktEucblgW6SOMAKhNbdNQ0o
         2nKg==
X-Forwarded-Encrypted: i=1; AJvYcCW8keARY+JI2S4GwGc3/VAjLfg2aRX/5NYEapk6Hm8eYgwPLpBd/xC4jcBLIrVFQAaOs9OxzBgByoD4IZ8r@vger.kernel.org
X-Gm-Message-State: AOJu0YyZpOI19Y1Dwhw7A2Ut07cciHZt7s7QymkXlagDOZ+9e5xyTjK2
	+EbAWiND2mWtb+i8ywzwxaXV6GxmbDYmtbk0SwWna4stSnzziydEbj7w
X-Gm-Gg: AY/fxX7Kf77o8CNQnuDOSZgNjc7U9YV/qjypsLt5OtUHvAxY1Xj+E+IZvJPLrvf0iHI
	HXQLFh8CzmUIuCHv1E+NqHWN895sHKYU8QQ/6sgxo+5tBre0s6KaY7DUhCSyH8axyK6UJTprUDJ
	w7OxTL59KdN8ATPneww/PdKtVd0evqjdyeJazdBwWntF6KYoYOEyJ31eaxo8XV7h6cCUmEURseM
	78BXV6bMxnYHHBIw6xwlLpoCNV7U/WPQYtgC7o0YeY1vdYWlGJwK9HXYAFASbiqlNDQ9zRUdTep
	/mj/TnF4IML8H1Mdmw7rX/nJyOSG7UIHbA7B6dygwrE7DfO1Bvs0D1GlrzSmurTAZDvh2/idQfl
	mrgIdsf+itMfU6tbj9+O1P/e9GehE9ahCV0GHnrtCgxWLDSiToWEq4qhvf3HE5YYQiTlH/AZPN0
	ocOesSfV/AaqZjcIrCQ7QcGZ15XWcP4hBvcg==
X-Received: by 2002:a05:6a20:7346:b0:38b:ea2a:2843 with SMTP id adf61e73a8af0-38e45d05bebmr1469872637.10.1768906985160;
        Tue, 20 Jan 2026 03:03:05 -0800 (PST)
Received: from [172.16.20.12] ([136.226.253.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a773d4e5basm12710395ad.94.2026.01.20.03.03.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 03:03:04 -0800 (PST)
Message-ID: <2d9775c4-e8fb-4c95-b1fa-c775e96d5e04@gmail.com>
Date: Tue, 20 Jan 2026 16:33:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/4] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Qian Zhang <qian.zhang@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260109095221.2847067-1-tessolveupstream@gmail.com>
 <20260109095221.2847067-5-tessolveupstream@gmail.com>
 <3a4e0513-5b2d-4890-a4df-5306a694cf50@oss.qualcomm.com>
 <530e2a7b-52e4-4119-ad54-8ff9e1d4fec0@gmail.com>
 <ei3zvx47jubvgrz25pemfeu6zt5be6dduqpllp5qyhbhqblvnp@c2tqv7hyicii>
 <3eba04f8-fd1e-46f7-a674-510ed6f48ed2@gmail.com>
 <k3kzreaehe2whvxbnbhj3pb7s4gifobfp65epzvmqgb6s6xoi3@wqawppwj7vmi>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <k3kzreaehe2whvxbnbhj3pb7s4gifobfp65epzvmqgb6s6xoi3@wqawppwj7vmi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DATE_IN_PAST(1.00)[25];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89811-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.0.0.1:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:email,0.0.0.0:email,0.0.0.3:email]
X-Rspamd-Queue-Id: B1EFE56B50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 16-01-2026 17:19, Dmitry Baryshkov wrote:
> On Fri, Jan 16, 2026 at 04:57:42PM +0530, tessolveupstream@gmail.com wrote:
>>
>>
>> On 16-01-2026 13:26, Dmitry Baryshkov wrote:
>>> On Fri, Jan 16, 2026 at 12:28:22PM +0530, tessolveupstream@gmail.com wrote:
>>>>
>>>>
>>>> On 15-01-2026 18:47, Qian Zhang wrote:
>>>>>
>>>>>
>>>>> On 1/9/2026 5:52 PM, Sudarshan Shetty wrote:
>>>>>> Add the device tree for the QCS615-based Talos EVK platform. The
>>>>>> platform is composed of a System-on-Module following the SMARC
>>>>>> standard, and a Carrier Board.
>>>>>>
>>>>>> The Carrier Board supports several display configurations, HDMI and
>>>>>> LVDS. Both configurations use the same base hardware, with the display
>>>>>> selection controlled by a DIP switch.
>>>>>>
>>>>>> Use a DTBO file, talos-evk-lvds-auo,g133han01.dtso, which defines an
>>>>>> overlay that disables HDMI and adds LVDS. The DTs file talos-evk
>>>>>> can describe the HDMI display configurations.
>>>>>>
>>>>>> The initial device tree includes support for:
>>>>>> - CPU and memory
>>>>>> - UART
>>>>>> - GPIOs
>>>>>> - Regulators
>>>>>> - PMIC
>>>>>> - Early console
>>>>>> - AT24MAC602 EEPROM
>>>>>> - MCP2515 SPI to CAN
>>>>>> - ADV7535 DSI-to-HDMI bridge
>>>>>> - DisplayPort interface
>>>>>> - SN65DSI84ZXHR DSI-to-LVDS bridge
>>>>>> - Wi-Fi/BT
>>>>>>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>>>>>> ---
>>>>>>   arch/arm64/boot/dts/qcom/Makefile             |   4 +
>>>>>>   .../qcom/talos-evk-lvds-auo,g133han01.dtso    | 126 ++++
>>>>>>   arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 616 ++++++++++++++++++
>>>>>>   arch/arm64/boot/dts/qcom/talos-evk.dts        | 139 ++++
>>>>>>   4 files changed, 885 insertions(+)
>>>>>>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>>>>>>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>>>>>>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>>>>> index 76cf0115a00a..289b651ef0c5 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>>>> @@ -324,6 +324,10 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8650-mtp.dtb
>>>>>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8650-qrd.dtb
>>>>>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8750-mtp.dtb
>>>>>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8750-qrd.dtb
>>>>>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk.dtb
>>>>>> +talos-evk-lvds-auo,g133han01-dtbs    := \
>>>>>> +    talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
>>>>>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-lvds-auo,g133han01.dtb
>>>>>>   x1e001de-devkit-el2-dtbs    := x1e001de-devkit.dtb x1-el2.dtbo
>>>>>>   dtb-$(CONFIG_ARCH_QCOM)    += x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
>>>>>>   x1e78100-lenovo-thinkpad-t14s-el2-dtbs    := x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>>>>>> new file mode 100644
>>>>>> index 000000000000..ad058cf4cd93
>>>>>> --- /dev/null
>>>>>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>>>>>> @@ -0,0 +1,126 @@
>>>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>>>> +/*
>>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>>> + */
>>>>>> +/dts-v1/;
>>>>>> +/plugin/;
>>>>>> +
>>>>>> +#include <dt-bindings/gpio/gpio.h>
>>>>>> +
>>>>>> +&{/} {
>>>>>> +    backlight: backlight {
>>>>>> +        compatible = "gpio-backlight";
>>>>>> +        gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>,
>>>>>> +            <&tlmm 115 GPIO_ACTIVE_HIGH>;
>>>>>> +        default-on;
>>>>>> +    };
>>>>>> +
>>>>>> +    panel-lvds {
>>>>>> +        compatible = "auo,g133han01";
>>>>>> +
>>>>>> +        ports {
>>>>>> +            #address-cells = <1>;
>>>>>> +            #size-cells = <0>;
>>>>>> +
>>>>>> +            /* LVDS A (Odd pixels) */
>>>>>> +            port@0 {
>>>>>> +                reg = <0>;
>>>>>> +                dual-lvds-odd-pixels;
>>>>>> +
>>>>>> +                lvds_panel_out_a: endpoint {
>>>>>> +                    remote-endpoint = <&sn65dsi84_out_a>;
>>>>>> +                };
>>>>>> +            };
>>>>>> +
>>>>>> +            /* LVDS B (Even pixels) */
>>>>>> +            port@1 {
>>>>>> +                reg = <1>;
>>>>>> +                dual-lvds-even-pixels;
>>>>>> +
>>>>>> +                lvds_panel_out_b: endpoint {
>>>>>> +                    remote-endpoint = <&sn65dsi84_out_b>;
>>>>>> +                };
>>>>>> +            };
>>>>>> +        };
>>>>>> +    };
>>>>>> +};
>>>>>> +
>>>>>> +&hdmi_connector {
>>>>>> +    status = "disabled";
>>>>>> +};
>>>>>> +
>>>>>> +&i2c1 {
>>>>>> +    clock-frequency = <400000>;
>>>>>> +
>>>>>> +    status = "okay";
>>>>>> +
>>>>>> +    hdmi_bridge: bridge@3d {
>>>>>> +        status = "disabled";
>>>>>> +    };
>>>>>> +
>>>>>> +    lvds_bridge: bridge@2c {
>>>>>> +        compatible = "ti,sn65dsi84";
>>>>>> +        reg = <0x2c>;
>>>>>> +        enable-gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
>>>>>> +        ti,dsi-lanes = <4>;
>>>>>> +        ti,lvds-format = "jeida-24";
>>>>>> +        ti,lvds-bpp = <24>;
>>>>>> +
>>>>>> +        ports {
>>>>>> +            #address-cells = <1>;
>>>>>> +            #size-cells = <0>;
>>>>>> +
>>>>>> +            port@0 {
>>>>>> +                reg = <0>;
>>>>>> +
>>>>>> +                sn65dsi84_in: endpoint {
>>>>>> +                    data-lanes = <1 2 3 4>;
>>>>>> +                    remote-endpoint = <&mdss_dsi0_out>;
>>>>>> +                };
>>>>>> +            };
>>>>>> +
>>>>>> +            port@2 {
>>>>>> +                reg = <2>;
>>>>>> +
>>>>>> +                sn65dsi84_out_a: endpoint {
>>>>>> +                    data-lanes = <1 2 3 4>;
>>>>>> +                    remote-endpoint = <&lvds_panel_out_a>;
>>>>>> +                };
>>>>>> +            };
>>>>>> +
>>>>>> +            port@3 {
>>>>>> +                reg = <3>;
>>>>>> +
>>>>>> +                sn65dsi84_out_b: endpoint {
>>>>>> +                    data-lanes = <1 2 3 4>;
>>>>>> +                    remote-endpoint = <&lvds_panel_out_b>;
>>>>>> +                };
>>>>>> +            };
>>>>>> +        };
>>>>>> +    };
>>>>>> +};
>>>>>> +
>>>>>> +&mdss_dsi0 {
>>>>>> +    vdda-supply = <&vreg_l11a>;
>>>>>> +
>>>>>> +    status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&mdss_dsi0_out {
>>>>>> +    remote-endpoint = <&sn65dsi84_in>;
>>>>>> +    data-lanes = <0 1 2 3>;
>>>>>> +};
>>>>>> +
>>>>>> +&tlmm {
>>>>>> +    lcd_bklt_en: lcd-bklt-en-state {
>>>>>> +        pins = "gpio115";
>>>>>> +        function = "gpio";
>>>>>> +        bias-disable;
>>>>>> +    };
>>>>>> +
>>>>>> +    lcd_bklt_pwm: lcd-bklt-pwm-state {
>>>>>> +        pins = "gpio59";
>>>>>> +        function = "gpio";
>>>>>> +        bias-disable;
>>>>>> +    };
>>>>>> +};
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>>>>>> new file mode 100644
>>>>>> index 000000000000..95ed335bcb08
>>>>>> --- /dev/null
>>>>>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>>>>>> @@ -0,0 +1,616 @@
>>>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>>>> +/*
>>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>>> + */
>>>>>> +/dts-v1/;
>>>>>> +
>>>>>> +#include <dt-bindings/gpio/gpio.h>
>>>>>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>>>> +#include "talos.dtsi"
>>>>>> +#include "pm8150.dtsi"
>>>>>> +/ {
>>>>>> +    aliases {
>>>>>> +        mmc0 = &sdhc_1;
>>>>>> +        serial0 = &uart0;
>>>>>> +        serial1 = &uart7;
>>>>>> +    };
>>>>>> +
>>>>>> +    chosen {
>>>>>> +        stdout-path = "serial0:115200n8";
>>>>>> +    };
>>>>>> +
>>>>>> +    clocks {
>>>>>> +        can_osc: can-oscillator {
>>>>>> +            compatible = "fixed-clock";
>>>>>> +            clock-frequency = <20000000>;
>>>>>> +            #clock-cells = <0>;
>>>>>> +        };
>>>>>> +
>>>>>> +        sleep_clk: sleep-clk {
>>>>>> +            compatible = "fixed-clock";
>>>>>> +            clock-frequency = <32764>;
>>>>>> +            #clock-cells = <0>;
>>>>>> +        };
>>>>>> +
>>>>>> +        xo_board_clk: xo-board-clk {
>>>>>> +            compatible = "fixed-clock";
>>>>>> +            clock-frequency = <38400000>;
>>>>>> +            #clock-cells = <0>;
>>>>>> +        };
>>>>>> +    };
>>>>>> +
>>>>>> +    regulator-usb2-vbus {
>>>>>> +        compatible = "regulator-fixed";
>>>>>> +        regulator-name = "USB2_VBUS";
>>>>>> +        gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
>>>>>> +        pinctrl-0 = <&usb2_en>;
>>>>>> +        pinctrl-names = "default";
>>>>>> +        enable-active-high;
>>>>>> +        regulator-always-on;
>>>>>> +    };
>>>>>> +
>>>>>> +    vreg_conn_1p8: regulator-conn-1p8 {
>>>>>> +        compatible = "regulator-fixed";
>>>>>> +        regulator-name = "vreg_conn_1p8";
>>>>>> +        startup-delay-us = <4000>;
>>>>>> +        enable-active-high;
>>>>>> +        gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
>>>>>> +    };
>>>>>> +
>>>>>> +    vreg_conn_pa: regulator-conn-pa {
>>>>>> +        compatible = "regulator-fixed";
>>>>>> +        regulator-name = "vreg_conn_pa";
>>>>>> +        startup-delay-us = <4000>;
>>>>>> +        enable-active-high;
>>>>>> +        gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
>>>>>> +    };
>>>>>> +
>>>>>> +    vreg_v3p3_can: regulator-v3p3-can {
>>>>>> +        compatible = "regulator-fixed";
>>>>>> +        regulator-name = "vreg-v3p3-can";
>>>>>> +        regulator-min-microvolt = <3300000>;
>>>>>> +        regulator-max-microvolt = <3300000>;
>>>>>> +        regulator-boot-on;
>>>>>> +        regulator-always-on;
>>>>>> +    };
>>>>>> +
>>>>>> +    vreg_v5p0_can: regulator-v5p0-can {
>>>>>> +        compatible = "regulator-fixed";
>>>>>> +        regulator-name = "vreg-v5p0-can";
>>>>>> +        regulator-min-microvolt = <5000000>;
>>>>>> +        regulator-max-microvolt = <5000000>;
>>>>>> +        regulator-boot-on;
>>>>>> +        regulator-always-on;
>>>>>> +    };
>>>>>> +
>>>>>> +    wcn6855-pmu {
>>>>>> +        compatible = "qcom,wcn6855-pmu";
>>>>>> +
>>>>>> +        pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
>>>>>> +        pinctrl-names = "default";
>>>>>> +
>>>>>> +        bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
>>>>>> +        wlan-enable-gpios = <&tlmm 84 GPIO_ACTIVE_HIGH>;
>>>>>> +
>>>>>> +        vddio-supply = <&vreg_conn_pa>;
>>>>>> +        vddaon-supply = <&vreg_s5a>;
>>>>>> +        vddpmu-supply = <&vreg_conn_1p8>;
>>>>>> +        vddpmumx-supply = <&vreg_conn_1p8>;
>>>>>> +        vddpmucx-supply = <&vreg_conn_pa>;
>>>>>> +        vddrfa0p95-supply = <&vreg_s5a>;
>>>>>> +        vddrfa1p3-supply = <&vreg_s6a>;
>>>>>> +        vddrfa1p9-supply = <&vreg_l15a>;
>>>>>> +        vddpcie1p3-supply = <&vreg_s6a>;
>>>>>> +        vddpcie1p9-supply = <&vreg_l15a>;
>>>>>> +
>>>>>> +        regulators {
>>>>>> +            vreg_pmu_rfa_cmn: ldo0 {
>>>>>> +                regulator-name = "vreg_pmu_rfa_cmn";
>>>>>> +            };
>>>>>> +
>>>>>> +            vreg_pmu_aon_0p59: ldo1 {
>>>>>> +                regulator-name = "vreg_pmu_aon_0p59";
>>>>>> +            };
>>>>>> +
>>>>>> +            vreg_pmu_wlcx_0p8: ldo2 {
>>>>>> +                regulator-name = "vreg_pmu_wlcx_0p8";
>>>>>> +            };
>>>>>> +
>>>>>> +            vreg_pmu_wlmx_0p85: ldo3 {
>>>>>> +                regulator-name = "vreg_pmu_wlmx_0p85";
>>>>>> +            };
>>>>>> +
>>>>>> +            vreg_pmu_btcmx_0p85: ldo4 {
>>>>>> +                regulator-name = "vreg_pmu_btcmx_0p85";
>>>>>> +            };
>>>>>> +
>>>>>> +            vreg_pmu_rfa_0p8: ldo5 {
>>>>>> +                regulator-name = "vreg_pmu_rfa_0p8";
>>>>>> +            };
>>>>>> +
>>>>>> +            vreg_pmu_rfa_1p2: ldo6 {
>>>>>> +                regulator-name = "vreg_pmu_rfa_1p2";
>>>>>> +            };
>>>>>> +
>>>>>> +            vreg_pmu_rfa_1p7: ldo7 {
>>>>>> +                regulator-name = "vreg_pmu_rfa_1p7";
>>>>>> +            };
>>>>>> +
>>>>>> +            vreg_pmu_pcie_0p9: ldo8 {
>>>>>> +                regulator-name = "vreg_pmu_pcie_0p9";
>>>>>> +            };
>>>>>> +
>>>>>> +            vreg_pmu_pcie_1p8: ldo9 {
>>>>>> +                regulator-name = "vreg_pmu_pcie_1p8";
>>>>>> +            };
>>>>>> +        };
>>>>>> +    };
>>>>>> +
>>>>>> +    wifi_1p8v: regulator-wifi-1p8v {
>>>>>> +        compatible = "regulator-fixed";
>>>>>> +        regulator-name = "wifi_1p8v";
>>>>>> +        regulator-min-microvolt = <1800000>;
>>>>>> +        regulator-max-microvolt = <1800000>;
>>>>>> +        gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
>>>>> Please check this pin number
>>>>>> +        enable-active-high;
>>>>>> +        pinctrl-0 = <&wifi_reg_en_pins_state>;
>>>>>> +        pinctrl-names = "default";
>>>>>> +        regulator-boot-on;
>>>>>> +        regulator-always-on;
>>>>>> +    };
>>>>>> +
>>>>>> +    wifi_3p85v: regulator-wifi-3p85v {
>>>>>> +        compatible = "regulator-fixed";
>>>>>> +        regulator-name = "wifi_3p85v";
>>>>>> +        regulator-min-microvolt = <3850000>;
>>>>>> +        regulator-max-microvolt = <3850000>;
>>>>>> +        gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
>>>>> Please check this pin number
>>>>>> +        enable-active-high;
>>>>>> +        pinctrl-0 = <&wifi_reg_en_pins_state>;
>>>>>> +        pinctrl-names = "default";
>>>>>> +        regulator-boot-on;
>>>>>> +        regulator-always-on;
>>>>>> +    };
>>>>>> +};
>>>>>
>>>>> Are these two node necessary?
>>>>>
>>>>
>>>> On this board, GPIO91 is wired as a common enable for both WiFi 
>>>> power rails: WiFi 1.8V and WiFi 3.85V.
>>>> I currently modeled them as two regulator-fixed nodes because these 
>>>> are two distinct rails.
>>>> Would you prefer modelling a single regulator node that controls the 
>>>> shared GPIO as below:
>>>>
>>>> wifi_en: regulator-wifi-en {
>>>>     compatible = "regulator-fixed";
>>>>     regulator-name = "wifi_en";
>>>>     gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
>>>>     enable-active-high;
>>>>     pinctrl-0 = <&wifi_reg_en_pins_state>;
>>>>     pinctrl-names = "default";
>>>>     regulator-boot-on;
>>>>     regulator-always-on;
>>>> };
>>>
>>> What is the voltage of this regulator? What does it represent? What
>>> should be represented in the DT?
>>>
>>> BTW: what is powered on by those regulators? I don't see them being
>>> wired to the PMU.
>>>
>>
>> There are two separate TPS62130RGTR regulator ICs on the board:
>> One provides 1.8V and Another provides 3.85V.
>>
>> Both regulators use the same enable signal (SOC_GPIO_91_S4A_1P8 - 
>> GPIO91), which connects to their EN pins. 
>> When GPIO91 goes high, both regulators switch on at the same 
>> time.
> 
> And gpiolib-shared.c should be able to support that.
> 
>>
>> I described them as two separate regulator-fixed nodes since they 
>> are different chips with different voltages.
> 
> okay.
> 
>>
>> As an alternative, I suggested representing them as a single node 
>> (based on the review comment from Qian Zhang) if you only want to 
>> show the shared GPIO enable control instead of the individual 
>> voltage rails.
> 
> Why do you need an alternative?
> 
>>
>> In AF68E module, 3.85V regulator powers VDD_PA_5G and 1.8V regulator
>> powers VDD_PA_2G.
> 
> Do they power up the WCN6855 itself or some external PA present on the
> module? In the former case, those regulators should be consumed by the
> PMU, in the latter case, by the WiFi node. Anyway, they should not be
> left as always-on / boot-on.
> 

On this board, the GPIO-controlled regulators power the WCN6855 
WiFi module itself (not an external PA). To model this correctly, 
I updated the device tree like this:
 
a) I added a single upstream fixed regulator, wifi_vin, which 
   represents the GPIO enable line (tlmm 91). This is the only node 
   marked always-on, so the enable GPIO stays asserted.
b) The downstream rails wifi_1p8v and wifi_3p85v are now defined as 
   fixed regulators that depend on wifi_vin using vin-supply. They 
   no longer control the GPIO directly.
c) These two rails are then explicitly connected as supplies to the 
   WiFi device node (wifi@0) using:
     1. vddpaa-supply = <&wifi_3p85v>;
     2. vddpab-supply = <&wifi_1p8v>;

With this change, the regulators are not left as generic always-on/
boot-on supplies without a consumer. Instead, the WiFi device node 
consumes the rails, which matches the real hardware wiring: the GPIO 
enables power to the WCN6855 rails.

Please find the updated changes below - could you please confirm 
whether this aligns with your expectations?

diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 95ed335bcb08..f37159af2375 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -146,29 +146,41 @@ vreg_pmu_pcie_1p8: ldo9 {
                };
        };

-       wifi_1p8v: regulator-wifi-1p8v {
+       /* Downstream rails controlled by the same GPIO */
+       wifi_1p8v: regulator-1p8v {
                compatible = "regulator-fixed";
+
                regulator-name = "wifi_1p8v";
                regulator-min-microvolt = <1800000>;
                regulator-max-microvolt = <1800000>;
-               gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
-               enable-active-high;
-               pinctrl-0 = <&wifi_reg_en_pins_state>;
-               pinctrl-names = "default";
-               regulator-boot-on;
-               regulator-always-on;
+
+               vin-supply = <&wifi_vin>;
        };

-       wifi_3p85v: regulator-wifi-3p85v {
+       wifi_3p85v: regulator-3p85v {
                compatible = "regulator-fixed";
+
                regulator-name = "wifi_3p85v";
                regulator-min-microvolt = <3850000>;
                regulator-max-microvolt = <3850000>;
-               gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
+
+               vin-supply = <&wifi_vin>;
+       };
+
+       /* Upstream supply */
+       wifi_vin: regulator-wifi-en {
+               compatible = "regulator-fixed";
+
+               regulator-name = "wifi_vin";
+               regulator-min-microvolt = <3850000>;
+               regulator-max-microvolt = <3850000>;
+
                enable-active-high;
+               gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
+
                pinctrl-0 = <&wifi_reg_en_pins_state>;
                pinctrl-names = "default";
-               regulator-boot-on;
+
                regulator-always-on;
        };
 };
@@ -413,6 +425,9 @@ wifi@0 {
                vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
                vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
                vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+               vddpaa-supply = <&wifi_3p85v>;
+               vddpab-supply = <&wifi_1p8v>;
+
        };
 };





