Return-Path: <linux-arm-msm+bounces-98359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CIZNv1oumnnWAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:57:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 805972B8914
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 85CC5300B590
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31959376466;
	Wed, 18 Mar 2026 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dfoQfUed"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A199D33DEDD
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773824250; cv=none; b=mhd65yqYYOqxEXr+HGsiuHc+3aFcIjYvoq+D/as4nA007hngJ5DoawNJh2j1XU2iiHe70Kq8WMqtXBdjYK43ceVNYYEmS+8lNjDfMptx0LZ7YkqT1928Q8jUyrVbNWbTXZe1IMCs2BOL5C+TVudwtdRzto+65CyQKFu89vkWxKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773824250; c=relaxed/simple;
	bh=NUWaA211MVtgOyFvRrtpZ0xN6iYxcwddItz9sEVKQiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M0sigzQxSLtdeH8ebM0ZF2Q8ps4N2j+igjyOBZbIQbwPh3FniFz8FXlxSBCQ4p4WMocmhmBLOexa8+FnsoiUJR/KEGMxzW213emD1VK5leRS9oMHiA5/c0pMGJwJ4W7MB/r+d9HWTUWidcnpHM5Q8Nlb+feBvH0WZlKQ76tIVAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dfoQfUed; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so68337005e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 01:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773824247; x=1774429047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OudNO2OnvwTpIE96QJS7IaE3Xw3RCtNFDCoe4J2lk3A=;
        b=dfoQfUedNNvnmlDimCSR7G1+W7Rus9ksSpMCSVrMamWPCWFYIT7R58P2hoEBa2XyIf
         EoW3p54zCFkPH07K0Gca5PfiNWfhhf8slp3Q6IOMCsGYmwkT8yebOFK2uB8ei06lulfN
         hfSeiuW00qU4bBXQTLBa29v3W3eDRGDTygrJ3Vm+esjPxxwbg9wVAt7JXiS5b99BtHEC
         nnrgdhWBTQMIj2SgGq7l0YBxwTzbu8s/66Sx+OzzgVokVSCv3PLGEImxiRQYv4fojWhd
         CIbd+TpqV4LPGrFz6F4aoRpSveJm+dXbPT/COLpwSGqp3I7btL7swU8fxdfmO0H7VAWG
         /AiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773824247; x=1774429047;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OudNO2OnvwTpIE96QJS7IaE3Xw3RCtNFDCoe4J2lk3A=;
        b=UAHncuP8j5cRJ3/v2aoeQFnEB4w1xbUuu8mQpTe6AMu5l1LtjUV6uevtV0PiZ4NkJR
         eySK6R4/X1C+LlerKDCX2VfKFApOPzMFjgdNvfyESBrUZVleXWbY7FSYTEmA8mPQrcuo
         bAQCwqRzlPmme3MRJ+2afxsueK8B1gX3lZZFWHCFZzHFHZN3xAWgRRkyTgT2FC0u4eAO
         Cdlh7eZoFK97pYkl9xMUvYhnPwkCVvOLbG4F2TLmaKU4ggX07LDJnhBqONte0AE0kade
         InyGgJwKMar0dcJldM4WOjkQjRH/j3gMuyv4/XdkqHHZdM7N176wh3egJC8V4cCmKfK+
         ZzOg==
X-Forwarded-Encrypted: i=1; AJvYcCWlxRvKse8CIN/RBbu1TdGRhiQSmHH78ZeTFMcLefHsLcRuYvvFupYAElkGycboC/HfqvIpKN6bRaIwE4tl@vger.kernel.org
X-Gm-Message-State: AOJu0YwmbndoO07Y/FDmjrR3sn5d3NFgY1Upu/zjHkh3fvwtHRZHlJba
	plvoNZajPcNi9RRjnv+txgXN2EuAV7jbm/dBx0zkAx9DJK32UkVYdI1xoMMlOLmVRWE=
X-Gm-Gg: ATEYQzy3Lo6rfYFG4cRW2DBdJdWOA53ggzCGvO+Qho+LeJrPro8NBDxuhLLgmof5W78
	8UeDMifESA7iiO+FPNTVlS/g2u10FkauumHih30qEpmlg9RGLYqf+sgLy4aj1Uk8TgdZWAT4fvS
	CiZmeWDk9XWJwng9w4e+P/ZhtcCTq6z4fpFfaMEoVX4YlugyajCC3jHLEae1SG/epCMR0xTgA6G
	YpNX062/lHoZXKALNZ89bz5k+MOhcEDcrruKdsZADaIN2mQk0QTTzc09Dqh86wKlupX62lwm2L6
	N9pwLgHHvcK5TbKQ6N/9rvS4nX8hmw9drC817jmDK5ylmtt7pZAnWsVYoC6g4WT4F6w0hBbBdA7
	ACB48COP0ZDljDxQpHnP/c55oZfLKVkxlJT1HHuKw2eE8L5ogPl5zvUDLP1wlg/WZLnp3iALw+i
	zbJBu5ht3OA67nH7EevmcmOhWvfGpowfGSdsjuJlx8fN7ZK2rjBGF5sPH0eD7TM+MyUme6KITRp
	g/7zjw=
X-Received: by 2002:a05:600c:4fc4:b0:485:3423:727d with SMTP id 5b1f17b1804b1-486f4476ce8mr38072065e9.26.1773824246935;
        Wed, 18 Mar 2026 01:57:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ac75:790f:ef3c:2eb0? ([2a01:e0a:106d:1080:ac75:790f:ef3c:2eb0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eaffbbdsm124891015e9.15.2026.03.18.01.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 01:57:26 -0700 (PDT)
Message-ID: <b48e092a-fcee-4065-a8ef-862245b9e2eb@linaro.org>
Date: Wed, 18 Mar 2026 09:57:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add qcs9075-radxa-airbox-q900
To: Mecid Urganci <mecid@mecomediagroup.de>, andersson@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260318083621.470826-1-mecid@mecomediagroup.de>
 <20260318083621.470826-3-mecid@mecomediagroup.de>
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
In-Reply-To: <20260318083621.470826-3-mecid@mecomediagroup.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-98359-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 805972B8914
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 3/18/26 09:36, Mecid Urganci wrote:
> Add device tree support for the Radxa AirBox Q900 board based on the
> Qualcomm QCS9075 SoC (Lemans Family).
> 
> This board features HDMI 2.0 via dp0, 2x USB 3.1 Gen 2 ports,
> 2x 2.5GbE Ethernet ports and onboard UFS storage.
> 
> Further information: https://radxa.com/products/fogwise/airbox-q900/
> 
> Functionality has been tested and confirmed working via an Armbian
> Debian Trixie build.
> 
> Signed-off-by: Mecid Urganci <mecid@mecomediagroup.de>
> Made-with: Cursor
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |    1 +
>   .../dts/qcom/qcs9075-radxa-airbox-q900.dts    | 1012 +++++++++++++++++
>   2 files changed, 1013 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-radxa-airbox-q900.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index a4dc9e8b2d25..c8b7dd67806d 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -180,6 +180,7 @@ qcs8300-ride-el2-dtbs := qcs8300-ride.dtb monaco-el2.dtbo
>   
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-radxa-airbox-q900.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
>   
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-radxa-airbox-q900.dts b/arch/arm64/boot/dts/qcom/qcs9075-radxa-airbox-q900.dts
> new file mode 100644
> index 000000000000..8b5202b527cb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-radxa-airbox-q900.dts
> @@ -0,0 +1,1012 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026 Mecid Urganci
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "lemans.dtsi"
> +#include "lemans-pmics.dtsi"
> +
> +/ {
> +	model = "Radxa AIRbox Q900";

The radxa pages shows "Radxa Fogwise® AIRbox Q900", why did you drop Fogwise ?

> +	compatible = "radxa,airbox-q900", "qcom,qcs9075", "qcom,sa8775p";
> +

<snip>

> +
> +	dp0-connector {
> +		compatible = "dp-connector";
> +		label = "eDP0";
> +		type = "full-size";
> +
> +		port {
> +			dp0_connector_in: endpoint {
> +				remote-endpoint = <&mdss0_dp0_out>;
> +			};
> +		};

The device has an HDMI output, and this is probably provided by a DP to HDMI IC,
please represent it here.

> +	};
> +};
> +

<snip>

> +};
> +
> +/ {
> +	thermal-zones {
> +		cpu-0-0-0-thermal {
> +			polling-delay-passive = <1000>;
> +			polling-delay = <5000>;
> +
> +			trips {
> +				fan_on: fan-on {
> +					temperature = <40000>;
> +					hysteresis = <5000>;
> +					type = "active";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map-fan {
> +					trip = <&fan_on>;
> +					cooling-device = <&fan0 1 1>;
> +				};
> +			};
> +		};
> +	};

So the fan only cools the cpu0 ?? not the gpu ?

Neil

> +};


