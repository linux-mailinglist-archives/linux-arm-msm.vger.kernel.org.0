Return-Path: <linux-arm-msm+bounces-108202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFUVDZwXC2o5/wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:43:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D962156DE11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 582A330465ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FE5372EE4;
	Mon, 18 May 2026 13:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RAzIwqGz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68294378833
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111740; cv=none; b=GpoO1UWqcks/0/SfnpmnioIGXOH0xy7FZ5xraA3pvgIYZ0+Z8slj9H2UO4Tf2uJmLqwncGDI4zAx4GYwN09bGN6e+e8FSrNvowuoln6zs/XjcvGnsEV/+GM8IdxzRfVBo3bUr3TJxvI+CIaQwPsnkmEREOkgahUxfa8M+P5UBG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111740; c=relaxed/simple;
	bh=phicAUtLwfBEBApbvqLfhBVzebPJnXcW5f7izh+9EyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQ4bI2tsYZ4OqUiNO0n/WNUemxrkZGnRyRsAlA8PoVaEVELRJQfw2AhaOc767XJYHR3ON6RRZFlwO1BGUFAX84YHonLTlwIKJyQYr8w1e1UBoHrocntVm+kGsxYAGea/AxNjxcYQcibrudqoclHUNntFMhbJoGO8LMa+84wjxkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RAzIwqGz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so34616525e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779111732; x=1779716532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qrl7X6LWp+Kwsf0LGx75Q3m3WXWBZnBJCVNbzcnpWzM=;
        b=RAzIwqGz8gpb1/5THhI4UZVFL8mw91OhGcwSuLGDMsI3Qc/lIGDh4YCZC95yc5hBUI
         2p9RbxVj4BteytuknJfsz3ZLac6IguWd4z/CSpvjnjFO5cQZHvk32dZmQoYs9p2Wz/Cy
         X+i5xZpi9LvwkprtxTlD8AL6waUVVSgCyDRIvNjmelQ40lXqBqzlZ2MS/tC7fKcjTPYh
         pMQVbMc9Ir77mP36P0PoMAisRUZP/fup91z74AD0M21Z6Rr5XRe3ot0CBFzSzfjHSNaW
         ZRR+wwomGYRacFjURL4BlFfROOlpmk8oZarDXyf+hTVPXFncsThpaTVCGW/ELejEgshi
         Z97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779111732; x=1779716532;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrl7X6LWp+Kwsf0LGx75Q3m3WXWBZnBJCVNbzcnpWzM=;
        b=oGLnZWOoJinULN3j8gKpE6h1ZOOYDST0DfyJhcxNJHcZvhJL/3F7cVHFSq/OA/dVzI
         XVqke8cH5xJ9SrmFN+VP/pH+d06qn5g1VLkqjH4d3TpSCqncihVuEy1GdVWvzdPo40JK
         IwzrFNo1xyi7teAqqEedgmbcfWe4/Z4PuJyZXqh5Bj6FjsbotGNh5nMyjW/gVI9vxvU/
         a5lCWzMDhDuSHqxwuomWJAVnvU6/ufqB0fTTT2DFLCZA5Zbct5PTj1TfFVuW87k0bqU0
         RUwL91Zi+HedNkBOF57tBYGwFvlsuvX1zGVE3+IPrJgXLm9WslytOm4lhK+NupznNvFO
         fz4Q==
X-Gm-Message-State: AOJu0YwmvfxEx7niPPPas0m/t20RDvkPbgEEV7Z5OoyoW+OlAyykDnJi
	75//g4ERTJF5fAGG6Hv8xYPB7d27lUL4qaoR5pkoFNP8BguUMC2ykWPrKWWOtCK9A6g=
X-Gm-Gg: Acq92OHzIVl9F9nTiH2jR0/EyhoKcyuHf0UsVrE13lrgqtcBjwXC/Cblrad5vpEe88o
	GBER1kzZNzxXaXo07ZGtU9e07ajbWRXzJSP7E+kKKlDZREHwB+BqzrdC7c9Uuo3yHn1OrwC8Wdb
	5l4i86MXahQotpL2Xg422dYcMWo7RQ+033GkKrme4yFC3vd+xv4Vljjd0NhKQKIRbx2QSPRp/35
	+n5g8woOHgDzyBuzHnkXF5DSQLqf0XGfpJI1sajzcp2a48BQGYhbkafYdacxdDaYhwBpi8VU1B2
	9aMJvpC34LjeH3WtP/D0v0eMHATd+VjuXSrJ+AibBA6Nx/WiL17U1MXTpNudHOZ+RrHMvv446sM
	hweT8YN/bB3ZXb7wmzC9u/eKD5sO99o+62h33pA5vpE07wgOAwNZJlx4SNvMw99wtGhhhcgZN7O
	irU4VFdVnIFPN/pzWxOVDzBystNZBVFq5OmBT3+pGl4yTFNSygLodriJkPEvr0TOWTgGYu89iL0
	T21zVQ=
X-Received: by 2002:a05:600c:c10e:b0:48a:65a5:750f with SMTP id 5b1f17b1804b1-48fe63265ddmr176315985e9.21.1779111732344;
        Mon, 18 May 2026 06:42:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1029:e3c5:362e:1250? ([2a01:e0a:106d:1080:1029:e3c5:362e:1250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm151219645e9.4.2026.05.18.06.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 06:42:11 -0700 (PDT)
Message-ID: <6fca9806-3707-468d-b4ef-12e92d9480a5@linaro.org>
Date: Mon, 18 May 2026 15:42:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket DS gaming console
To: azkali.limited@gmail.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260517-pocketds-v3-0-d5910c801756@gmail.com>
 <20260517-pocketds-v3-3-d5910c801756@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260517-pocketds-v3-3-d5910c801756@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108202-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: D962156DE11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/17/26 15:14, Alexandre Hamamdjian via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> Add initial Device Tree for the Ayaneo Pocket DS gaming console based
> on the Qualcomm QCS8550 platform.
> 
> The design is similar to a phone without the modem, the game control
> is handled via a standalone controller connected to a Renesas uPD720201
> PCIe USB 3.0 host controller. DisplayPort is muxed over the USB-C
> connector with all four lanes wired.
> 
> Display panel support will be added in a second time.
> 
> Co-developed-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>   .../boot/dts/qcom/qcs8550-ayaneo-pocketds.dts      | 1883 ++++++++++++++++++++
>   2 files changed, 1884 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index cc42829f92eb..45859e977bc9 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -185,6 +185,7 @@ qcs8300-ride-el2-dtbs := qcs8300-ride.dtb monaco-el2.dtbo
>   
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayaneo-pocketds.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
>   
> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts
> new file mode 100644
> index 000000000000..416399a4179b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts
> @@ -0,0 +1,1883 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025, Teguh Sobirin.
> + * Copyright (c) 2025, ROCKNIX (https://github.com/ROCKNIX)
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "qcs8550.dtsi"
> +#include "pm8550.dtsi"
> +#include "pm8550b.dtsi"
> +#define PMK8550VE_SID 5
> +#include "pm8550ve.dtsi"
> +#include "pm8550vs.dtsi"
> +#include "pmk8550.dtsi"
> +
> +/delete-node/ &aop_image_mem;
> +/delete-node/ &aop_config_mem;
> +/delete-node/ &camera_mem;
> +/delete-node/ &ipa_fw_mem;
> +/delete-node/ &ipa_gsi_mem;
> +/delete-node/ &mpss_dsm_mem;
> +/delete-node/ &mpss_mem;
> +/delete-node/ &q6_mpss_dtb_mem;
> +/delete-node/ &cdsp_mem;
> +/delete-node/ &q6_cdsp_dtb_mem;
> +
> +/delete-node/ &remoteproc_mpss;
> +/delete-node/ &remoteproc_cdsp;
> +
> +/ {
> +	model = "AYANEO Pocket DS";
> +	compatible = "ayaneo,pocketds", "qcom,qcs8550", "qcom,sm8550";
> +	rocknix-u-boot-dt-id = "u-boot-pocket-ds";

Seems you completely ignored Sahisko & my comments on top:
https://lore.kernel.org/all/1d04c00d-ee66-4467-b60e-f36326b90f11@linaro.org/

> +
> +	aliases {
> +		serial0 = &uart7;
> +		serial1 = &uart14;
> +		hsuart0 = &uart11;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	pmic-glink {
> +		compatible = "qcom,sm8550-pmic-glink", "qcom,pmic-glink";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		orientation-gpios = <&tlmm 11 GPIO_ACTIVE_HIGH>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +
> +			reg = <0>;
> +
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint = <&redriver_ss_out>;
> +					};
> +				};

Ditto

> +			};
> +		};
> +	};
> +
> +	pwm_fan: pwm-fan {
> +		compatible = "pwm-fan";
> +
> +		pinctrl-0 = <&fan_pwm_active>, <&fan_int>;
> +		pinctrl-names = "default", "sleep";
> +
> +		fan-supply = <&vdd_fan_5v0>;
> +		pwms = <&pm8550_pwm 3 40000>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <64 IRQ_TYPE_EDGE_FALLING>;
> +
> +		#cooling-cells = <2>;
> +		cooling-levels = <0 30 45 60 70 90 120 150>;
> +	};
> +

<snip>

> +
> +	sound {
> +		compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
> +		model = "SM8550-APS";
> +
> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA_SPK2 OUT",
> +				"VA DMIC0", "vdd-micb",
> +				"VA DMIC1", "vdd-micb";

Ditto

> +
> +		wsa-dai-link {
> +			link-name = "WSA Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&spk_amp_l>,
> +					    <&spk_amp_r>,
> +					    <&swr0 0>,
> +					    <&lpass_wsamacro 0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +
> +		va-dai-link {
> +			link-name = "VA Capture";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&lpass_vamacro 0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +	};
> +

<snip>

> +};
> +
> +&cpu7_top_thermal {
> +	polling-delay = <200>;
> +
> +	trips {
> +		cpu7_top_fan0: trip-point2 {
> +			temperature = <70000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};

Ditto

> +
> +		cpu7_top_fan1: trip-point3 {
> +			temperature = <75000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpu7_top_fan2: trip-point4 {
> +			temperature = <80000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +	};
> +};
> +
> +&cpuss0_thermal {
> +	polling-delay = <200>;
> +
> +	trips {
> +		cpuss0_fan0: trip-point2 {
> +			temperature = <40000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss0_fan1: trip-point3 {
> +			temperature = <50000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss0_fan2: trip-point4 {
> +			temperature = <60000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss0_fan3: trip-point5 {
> +			temperature = <65000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss0_fan4: trip-point6 {
> +			temperature = <70000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss0_fan5: trip-point7 {
> +			temperature = <75000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss0_fan6: trip-point8 {
> +			temperature = <80000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +	};
> +};
> +
> +&cpuss1_thermal {
> +	polling-delay = <200>;
> +
> +	trips {
> +		cpuss1_fan0: trip-point2 {
> +			temperature = <40000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss1_fan1: trip-point3 {
> +			temperature = <50000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss1_fan2: trip-point4 {
> +			temperature = <60000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss1_fan3: trip-point5 {
> +			temperature = <65000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss1_fan4: trip-point6 {
> +			temperature = <70000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss1_fan5: trip-point7 {
> +			temperature = <75000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss1_fan6: trip-point8 {
> +			temperature = <80000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +	};
> +};
> +
> +&cpuss2_thermal {
> +	polling-delay = <200>;
> +
> +	trips {
> +		cpuss2_fan0: trip-point2 {
> +			temperature = <40000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss2_fan1: trip-point3 {
> +			temperature = <50000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss2_fan2: trip-point4 {
> +			temperature = <60000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss2_fan3: trip-point5 {
> +			temperature = <65000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss2_fan4: trip-point6 {
> +			temperature = <70000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss2_fan5: trip-point7 {
> +			temperature = <75000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss2_fan6: trip-point8 {
> +			temperature = <80000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +	};
> +};
> +
> +&cpuss3_thermal {
> +	polling-delay = <200>;
> +
> +	trips {
> +		cpuss3_fan0: trip-point2 {
> +			temperature = <40000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss3_fan1: trip-point3 {
> +			temperature = <50000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss3_fan2: trip-point4 {
> +			temperature = <60000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss3_fan3: trip-point5 {
> +			temperature = <65000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss3_fan4: trip-point6 {
> +			temperature = <70000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss3_fan5: trip-point7 {
> +			temperature = <75000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +
> +		cpuss3_fan6: trip-point8 {
> +			temperature = <80000>;
> +			hysteresis = <3000>;
> +			type = "passive";
> +		};
> +	};
> +};
> +
> +&gpi_dma1 {
> +	status = "okay";
> +};
> +
> +&gpi_dma2 {
> +	status = "okay";
> +};
> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_opp_table {
> +	opp-719000000 {
> +		opp-hz = /bits/ 64 <719000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> +		opp-peak-kBps = <10687500>;
> +		qcom,opp-acd-level = <0x882e5ffd>;
> +	};
> +
> +	opp-746000000 {
> +		opp-hz = /bits/ 64 <746000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +		opp-peak-kBps = <10687500>;
> +		qcom,opp-acd-level = <0x882e5ffd>;
> +	};
> +
> +	opp-794000000 {
> +		opp-hz = /bits/ 64 <794000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +		opp-peak-kBps = <14398438>;
> +		qcom,opp-acd-level = <0xa82d5ffd>;
> +	};
> +
> +	opp-827000000 {
> +		opp-hz = /bits/ 64 <827000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +		opp-peak-kBps = <16500000>;
> +		qcom,opp-acd-level = <0xa82d5ffd>;
> +	};
> +
> +	opp-860000000 {
> +		opp-hz = /bits/ 64 <860000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +		opp-peak-kBps = <16500000>;
> +		qcom,opp-acd-level = <0x882d5ffd>;
> +	};
> +
> +	opp-1000000000 {
> +		opp-hz = /bits/ 64 <1000000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L2>;
> +		opp-peak-kBps = <16500000>;
> +		qcom,opp-acd-level = <0x882d5ffd>;
> +	};
> +};

Please drop this until we properly implement support for detecting those dynamically

> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +	remote-endpoint = <&panel0_in>;
> +
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +
> +	display_panel: panel@0 {
> +		reg = <0>;
> +
> +		pinctrl-0 = <&sde_dsi_active>, <&sde_te_active>;
> +		pinctrl-1 = <&sde_dsi_suspend>, <&sde_te_suspend>;
> +		pinctrl-names = "default", "sleep";
> +	};

Ditto, again, drop all Display related nodes until the display bindings are
reviewed, don't keep a node without compatible.

> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l1e_0p88>;
> +
> +	status = "okay";
> +};
> +

<snip>

> 

And again, don't submit v4 _without_ testing the DT against the bindings so it returns 0 errors:

arch/arm64/boot/dts/qcom/sm8550.dtsi:3878.30-3881.9: ERROR (phandle_references): /soc@0/display-subsystem@ae00000/displayport-controller@ae90000/ports/port@1/endpoint: Reference to non-existent node or label "panel0_in"

   also defined at arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts:1381.15-1385.3
arch/arm64/boot/dts/qcom/sm8550.dtsi:4056.31-4057.9: ERROR (phandle_references): /soc@0/display-subsystem@ae00000/dsi@ae96000/ports/port@1/endpoint: Reference to non-existent node or label "panel1_in"

Neil

