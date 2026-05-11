Return-Path: <linux-arm-msm+bounces-106854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMYQCMuSAWrsegEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:26:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C29C250A127
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4E606305A21C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 08:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01673BADA0;
	Mon, 11 May 2026 08:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z0A614Wq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121AD3BA22E
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778487568; cv=none; b=cMYc9z7TfAPMoR1rF7O/nJO1Lkr26lSOdzoDBVpSH+Xo9eWWGHZH/vNf9Bp9qV5shF/k/gB2opAm+Brvu6PgY74sVgGsxowskcTWL8m1hko6r/iQn3l3bk+PNxPFaNR0QHMbX8zhtVaqU0QcLhhp/2l3NFd+dIGwmJqJl83Vj+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778487568; c=relaxed/simple;
	bh=NwVyXbFXLaRVIuradKbOPLojYL57TmtZJtz4Pm5cM3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sQBPirDwACrKhG6pdiDmlfTEXI1GJLS2frOsHSvHfa1+2QfKTSJ9xo7aWm9zOZYrEPz6G4z3x+YnYCK7kCFTcM4d7jFNGV8jvhxSxgJA65I6JFos0lLWFpZlyzRj18G9VoC9Pj5FUIBxhToS8jB62WxcwC5vYGFfE1tNP7hJgro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z0A614Wq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so35824675e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 01:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778487543; x=1779092343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oW1dcXgQjovcdY6k/1vZS5jRNNH7isj2uzAbIZD+FZY=;
        b=z0A614WqayDmah65aNEndsIGpqLDs6mRSZU+N8AlKPlTGzo99ye0SWjhVKcPWfSPdF
         UD5NQyxtraea6SFnjoFgsMuReUWyusQxVqw50g2B3Trq5GOnSBn2Mlt/MQn+4YTvA3Tj
         aqiNvIu94KvUFsXOHRhom/d2CBiHJBsEwsHilcv8hoyVrE/r+jtglYkAozqwEkVgYOM+
         8u8fn2pHKvacJVW7SWDMjbxb2EyyGJIh49uQfDtd1ASRl2LjAgLVVSdTRLRiOuXMQ+HG
         ceiQkegBw+FuRNTVbV4wjGv+/BZDFGvvbg7Z1+CYjO14f+y6jN/OhhJp9FGvO35Hy2Az
         U5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778487543; x=1779092343;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oW1dcXgQjovcdY6k/1vZS5jRNNH7isj2uzAbIZD+FZY=;
        b=EyHto02rGvJLFN3QzuRaAbHcSsMtPStQZJHJz1PQgBOFMyiAuN8H0aVjGKUlOgzv6t
         MDTAHEnL9BusZLDYL1gEculVVjcMnI/zShNA6nO7tJ6biYHv+PNUdl3yai0HYaMy+Xw4
         SOul6TuM+iN3NIRMu9Al2hla1ojQ4/wY8jAn5DpQMJG3vTof3U4SweaOg38Y4pYK8bPU
         XR0+78oEy4ug8k8IHBG21UP3TxABxTA6pLojtcCJCAHGy63aqbRyl7I8NPadpZzdlbSi
         kyLFw/EhC9cWVKNvQ5rjAE8zmYz3n7zoPdJ/LO2t2STCGwveOgxfQZ1YjpdE1StvxPJV
         Nq1g==
X-Gm-Message-State: AOJu0Yx9XbBy8K7mRjTuWfAUfZOZi3A4Bm9Uj3noRqt4gfpcy8zZLUvU
	VO76HSLQOn3h4MXH3d4EMiEqofaEaqMEJ9F3q45gxqdYw1MsuQZixFs8hOjvWyKHHb0=
X-Gm-Gg: Acq92OHp8FnH9RgdRFDykuX3wH2gLMVXeguvLHeWaiekZJai2vSthbkiLDPoqoMxcJw
	+NRirAdbkIZneaJia4jupynThxFy1Ldu2hwFb4tvBEkGtkh8S5AvbvSX3SePElW+8CGyBG1quWP
	DZzu9K0HVSeu1O1MyTUvN/hGJH8VCaabegaTeS/cOmoAybwr/8vqh/sAalhAvA3fv0lX+EaxFlZ
	jJ/gpuaggVlTUCBdqKgUNZaieY4TMevggur2Ca76wokm2dWnWFcT8KBpmO90QxkMdlrjsU5ikRq
	jYOX49BT50UzXqacJSaIpx/52jWDXrBC7+d7/mjQMF8as7L1kzHygaL7ZL4cLVFw6HFPiHRpW8w
	oQt4nwXZT0HNhfR9Xi95zgBMVfg+X5oupx20oIL+ApHuf+rXsOCTxE7D8JL0K0rRsj2jauPXSP1
	irYqzwZ1jt8U9w4aBYNeFFPiO/KG9G72Zsh46/8EtkSpCE9KPsg/oXnUN/TEq0OVvmC9ypfIA/Q
	acVkFc=
X-Received: by 2002:a05:600c:c094:b0:48a:599a:3716 with SMTP id 5b1f17b1804b1-48e51f40a29mr267305125e9.23.1778487542911;
        Mon, 11 May 2026 01:19:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:63dd:7879:45c5:21b9? ([2a01:e0a:106d:1080:63dd:7879:45c5:21b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e957asm170120755e9.6.2026.05.11.01.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 01:19:02 -0700 (PDT)
Message-ID: <9f7368f9-f6ea-4b97-b8f6-2e2f2e62c261@linaro.org>
Date: Mon, 11 May 2026 10:19:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket DS gaming console
To: azkali.limited@gmail.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260510-pocketds-v1-0-cf05acec06af@gmail.com>
 <20260510-pocketds-v1-2-cf05acec06af@gmail.com>
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
In-Reply-To: <20260510-pocketds-v1-2-cf05acec06af@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C29C250A127
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106854-lists,linux-arm-msm=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

Hi,

On 5/10/26 18:05, Alexandre Hamamdjian via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> Add initial device tree support for the Ayaneo Pocket DS gaming
> console based on the Qualcomm QCS8550 platform.
> 
> The board file is split into qcs8550-ayaneo-pocket-common.dtsi and
> qcs8550-ayaneo-pocketds.dts in anticipation of additional boards in
> the same family that share the QCS8550 base. Only the Pocket DS has
> been verified on hardware so far; the shared dtsi is intended to pick
> up sibling boards as they are submitted.

Please don't, this is dead code, please send a single file and then
split it when you introduce variants boards.

> 
> Co-developed-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>   .../dts/qcom/qcs8550-ayaneo-pocket-common.dtsi     | 1596 ++++++++++++++++++++
>   .../boot/dts/qcom/qcs8550-ayaneo-pocketds.dts      |  170 +++
>   3 files changed, 1767 insertions(+)
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
> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-common.dtsi b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-common.dtsi
> new file mode 100644
> index 000000000000..8d215a9d31d5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-common.dtsi
> @@ -0,0 +1,1596 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025, Teguh Sobirin.
> + */
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
> +	chassis-type = "handset";
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
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&volume_up_n>;
> +		pinctrl-names = "default";
> +
> +		key-volume-up {
> +			label = "Volume Up";
> +			debounce-interval = <15>;
> +			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};
> +
> +	pmic-glink {
> +		compatible = "qcom,sm8550-pmic-glink", "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 11 GPIO_ACTIVE_HIGH>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
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
> +			};
> +		};
> +	};
> +
> +	reserved-memory {
> +		hyp_mem: hyp-region@80000000 {
> +			reg = <0 0x80000000 0 0xa00000>;
> +			no-map;
> +		};
> +
> +		cpusys_vm_mem: cpusys-vm-region@80a00000 {
> +			reg = <0 0x80a00000 0 0x400000>;
> +			no-map;
> +		};
> +
> +		hyp_tags_mem: hyp-tags-region@80e00000 {
> +			reg = <0 0x80e00000 0 0x3d0000>;
> +			no-map;
> +		};
> +
> +		xbl_sc_mem: xbl-sc-region@d8100000 {
> +			reg = <0 0xd8100000 0 0x40000>;
> +			no-map;
> +		};
> +
> +		hyp_tags_reserved_mem: hyp-tags-reserved-region@811d0000 {
> +			reg = <0 0x811d0000 0 0x30000>;
> +			no-map;
> +		};
> +
> +		xbl_dt_log_merged_mem: xbl-dt-log-merged-region@81a00000 {
> +			reg = <0 0x81a00000 0 0x260000>;
> +			no-map;
> +		};
> +
> +		aop_config_merged_mem: aop-config-merged-region@81c80000 {
> +			reg = <0 0x81c80000 0 0x74000>;
> +			no-map;
> +		};
> +
> +		chipinfo_mem: chipinfo-region@81cf4000 {
> +			reg = <0 0x81cf4000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		global_sync_mem: global-sync-region@82600000 {
> +			reg = <0 0x82600000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		tz_stat_mem: tz-stat-region@82700000 {
> +			reg = <0 0x82700000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		cpucp_fw_mem: cpucp-fw-region@d8140000 {
> +			reg = <0 0xd8140000 0 0x1c0000>;
> +			no-map;
> +		};
> +
> +		qtee_mem: qtee-region@d8300000 {
> +			reg = <0 0xd8300000 0 0x500000>;
> +			no-map;
> +		};
> +
> +		hwfence_shbuf: hwfence-shbuf-region@e6440000 {
> +			reg = <0 0xe6440000 0 0x2dd000>;
> +			no-map;
> +		};
> +
> +		hyp_ext_reserved_mem: hyp-ext-reserved-region@ff700000 {
> +			reg = <0 0xff700000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		llcc_lpi_mem: llcc_lpi_region@ff800000 {
> +			reg = <0 0xff800000 0 0x600000>;
> +			no-map;
> +		};
> +
> +		hyp_ext_tags_mem: hyp-ext-tags-region@fce00000 {
> +			reg = <0 0xfce00000 0 0x2900000>;
> +			no-map;
> +		};
> +
> +		splash_region: splash_region@b8000000 {
> +			reg = <0x0 0xb8000000 0x0 0x2b00000>;
> +			label = "cont_splash_region";
> +			no-map;
> +		};
> +	};
> +
> +	sound {
> +		status = "okay";
> +		compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
> +		model = "SM8550-APS";
> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA_SPK2 OUT",
> +				"VA DMIC0", "vdd-micb",
> +				"VA DMIC1", "vdd-micb";
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
> +					<&spk_amp_r>,
> +					<&swr0 0>,
> +					<&lpass_wsamacro 0>;
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
> +	thermal-zones {
> +		cpuss0-thermal {

Add labels for each thermal zones on the sm8550.dtsi files instead.

Please see the sm8650-ayaneo-pocket-s2 as reference.

> +			polling-delay = <200>;
> +			trips {
> +				cpuss0_fan0: trip-point2 {
> +					temperature = <40000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +					};

Bad alignment

Please add empty lines like the rest of the file.

> +				cpuss0_fan1: trip-point3 {
> +					temperature = <50000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss0_fan2: trip-point4 {
> +					temperature = <60000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss0_fan3: trip-point5 {
> +					temperature = <65000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss0_fan4: trip-point6 {
> +					temperature = <70000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss0_fan5: trip-point7 {
> +					temperature = <75000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss0_fan6: trip-point8 {
> +					temperature = <80000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +			};
> +
> +		};
> +		cpuss1-thermal {
> +			polling-delay = <200>;
> +			trips {
> +				cpuss1_fan0: trip-point2 {
> +					temperature = <40000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss1_fan1: trip-point3 {
> +					temperature = <50000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss1_fan2: trip-point4 {
> +					temperature = <60000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss1_fan3: trip-point5 {
> +					temperature = <65000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss1_fan4: trip-point6 {
> +					temperature = <70000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss1_fan5: trip-point7 {
> +					temperature = <75000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss1_fan6: trip-point8 {
> +					temperature = <80000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +			};
> +
> +		};
> +		cpuss2-thermal {
> +			polling-delay = <200>;
> +			trips {
> +				cpuss2_fan0: trip-point2 {
> +					temperature = <40000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss2_fan1: trip-point3 {
> +					temperature = <50000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss2_fan2: trip-point4 {
> +					temperature = <60000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss2_fan3: trip-point5 {
> +					temperature = <65000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss2_fan4: trip-point6 {
> +					temperature = <70000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss2_fan5: trip-point7 {
> +					temperature = <75000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss2_fan6: trip-point8 {
> +					temperature = <80000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +			};
> +
> +		};
> +		cpuss3-thermal {
> +			polling-delay = <200>;
> +			trips {
> +				cpuss3_fan0: trip-point2 {
> +					temperature = <40000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss3_fan1: trip-point3 {
> +					temperature = <50000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss3_fan2: trip-point4 {
> +					temperature = <60000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss3_fan3: trip-point5 {
> +					temperature = <65000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss3_fan4: trip-point6 {
> +					temperature = <70000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss3_fan5: trip-point7 {
> +					temperature = <75000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpuss3_fan6: trip-point8 {
> +					temperature = <80000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +			};
> +
> +		};
> +		cpu7-top-thermal {
> +			polling-delay = <200>;
> +			trips {
> +				cpu7_top_fan0: trip-point2 {
> +					temperature = <70000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpu7_top_fan1: trip-point3 {
> +					temperature = <75000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				cpu7_top_fan2: trip-point4 {
> +					temperature = <80000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +			};
> +
> +		};
> +		gpuss-0-thermal {
> +			polling-delay = <200>;
> +			trips {
> +				gpuss0_fan0: trip-point3 {
> +					temperature = <70000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				gpuss0_fan1: trip-point4 {
> +					temperature = <75000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				gpuss0_fan2: trip-point5 {
> +					temperature = <80000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +			};
> +
> +		};
> +		gpuss-1-thermal {
> +			polling-delay = <200>;
> +			trips {
> +				gpuss1_fan0: trip-point3 {
> +					temperature = <70000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				gpuss1_fan1: trip-point4 {
> +					temperature = <75000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				gpuss1_fan2: trip-point5 {
> +					temperature = <80000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +			};
> +
> +		};
> +		gpuss-2-thermal {
> +			polling-delay = <200>;
> +			trips {
> +				gpuss2_fan0: trip-point3 {
> +					temperature = <70000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				gpuss2_fan1: trip-point4 {
> +					temperature = <75000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				gpuss2_fan2: trip-point5 {
> +					temperature = <80000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +			};
> +
> +		};
> +		gpuss-3-thermal {
> +			polling-delay = <200>;
> +			trips {
> +				gpuss3_fan0: trip-point3 {
> +					temperature = <70000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				gpuss3_fan1: trip-point4 {
> +					temperature = <75000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				gpuss3_fan2: trip-point5 {
> +					temperature = <80000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +			};
> +
> +		};
> +		gpuss-4-thermal {
> +			polling-delay = <200>;
> +			trips {
> +				gpuss4_fan0: trip-point3 {
> +					temperature = <70000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				gpuss4_fan1: trip-point4 {
> +					temperature = <75000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				gpuss4_fan2: trip-point5 {
> +					temperature = <80000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +			};
> +
> +		};
> +		gpuss-5-thermal {
> +			polling-delay = <200>;
> +			trips {
> +				gpuss5_fan0: trip-point3 {
> +					temperature = <70000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				gpuss5_fan1: trip-point4 {
> +					temperature = <75000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				gpuss5_fan2: trip-point5 {
> +					temperature = <80000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +			};
> +
> +		};
> +		gpuss-6-thermal {
> +			polling-delay = <200>;
> +			trips {
> +				gpuss6_fan0: trip-point3 {
> +					temperature = <70000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				gpuss6_fan1: trip-point4 {
> +					temperature = <75000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				gpuss6_fan2: trip-point5 {
> +					temperature = <80000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +			};
> +
> +		};
> +		gpuss-7-thermal {
> +			polling-delay = <200>;
> +			trips {
> +				gpuss7_fan0: trip-point3 {
> +					temperature = <70000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				gpuss7_fan1: trip-point4 {
> +					temperature = <75000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +				gpuss7_fan2: trip-point5 {
> +					temperature = <80000>;
> +					hysteresis = <3000>;
> +					type = "passive";
> +				};
> +			};
> +
> +		};
> +	};
> +
> +	vdd_fan_5v0: vdd-fan-5v0-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_fan_5v0";
> +
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		gpio = <&tlmm 31 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&fan_pwr_active>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +
> +	vph_pwr: regulator-vph-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "  vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	pwm_fan: pwm-fan {
> +		compatible = "pwm-fan";
> +
> +		pinctrl-names = "default", "sleep";
> +		pinctrl-0 = <&fan_pwm_active>, <&fan_int>;
> +
> +		fan-supply = <&vdd_fan_5v0>;
> +		pwms = <&pm8550_pwm 3 40000>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <64 IRQ_TYPE_EDGE_FALLING>;
> +
> +		#cooling-cells = <2>;
> +		cooling-levels = <0 30 45 60 70 90 120 150>;
> +	};
> +
> +	wcn7850-pmu {
> +		compatible = "qcom,wcn7850-pmu";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlan_en>, <&bt_default>, <&pmk8550_sleep_clk>;
> +
> +		wlan-enable-gpios = <&tlmm 80 GPIO_ACTIVE_HIGH>;
> +		bt-enable-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply = <&vreg_s5g_0p85>;
> +		vddio-supply = <&vreg_l15b_1p8>;
> +		vddaon-supply = <&vreg_s2g_0p85>;
> +		vdddig-supply = <&vreg_s4e_0p95>;
> +		vddrfa1p2-supply = <&vreg_s4g_1p25>;
> +		vddrfa1p8-supply = <&vreg_s6g_1p86>;
> +
> +		regulators {
> +			vreg_pmu_rfa_cmn: ldo0 {
> +				regulator-name = "vreg_pmu_rfa_cmn";
> +			};
> +
> +			vreg_pmu_aon_0p59: ldo1 {
> +				regulator-name = "vreg_pmu_aon_0p59";
> +			};
> +
> +			vreg_pmu_wlcx_0p8: ldo2 {
> +				regulator-name = "vreg_pmu_wlcx_0p8";
> +			};
> +
> +			vreg_pmu_wlmx_0p85: ldo3 {
> +				regulator-name = "vreg_pmu_wlmx_0p85";
> +			};
> +
> +			vreg_pmu_btcmx_0p85: ldo4 {
> +				regulator-name = "vreg_pmu_btcmx_0p85";
> +			};
> +
> +			vreg_pmu_rfa_0p8: ldo5 {
> +				regulator-name = "vreg_pmu_rfa_0p8";
> +			};
> +
> +			vreg_pmu_rfa_1p2: ldo6 {
> +				regulator-name = "vreg_pmu_rfa_1p2";
> +			};
> +
> +			vreg_pmu_rfa_1p8: ldo7 {
> +				regulator-name = "vreg_pmu_rfa_1p8";
> +			};
> +
> +			vreg_pmu_pcie_0p9: ldo8 {
> +				regulator-name = "vreg_pmu_pcie_0p9";
> +			};
> +
> +			vreg_pmu_pcie_1p8: ldo9 {
> +				regulator-name = "vreg_pmu_pcie_1p8";
> +			};
> +		};
> +	};
> +};
> +
> +/* DMIC 01 23 */
> +&lpass_vamacro {
> +	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
> +	pinctrl-names = "default";
> +	vdd-micb-supply = <&vreg_l10b_1p8>;
> +	qcom,dmic-sample-rate = <4800000>;
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pm8550-rpmh-regulators";
> +		qcom,pmic-id = "b";
> +
> +		vdd-bob1-supply = <&vph_pwr>;
> +		vdd-bob2-supply = <&vph_pwr>;
> +		vdd-l1-l4-l10-supply = <&vreg_s6g_1p86>;
> +		vdd-l2-l13-l14-supply = <&vreg_bob1>;
> +		vdd-l3-supply = <&vreg_s4g_1p25>;
> +		vdd-l5-l16-supply = <&vreg_bob1>;
> +		vdd-l6-l7-supply = <&vreg_bob1>;
> +		vdd-l8-l9-supply = <&vreg_bob1>;
> +		vdd-l11-supply = <&vreg_s4g_1p25>;
> +		vdd-l12-supply = <&vreg_s6g_1p86>;
> +		vdd-l15-supply = <&vreg_s6g_1p86>;
> +		vdd-l17-supply = <&vreg_bob2>;
> +
> +		vreg_bob1: bob1 {
> +			regulator-name = "vreg_bob1";
> +			regulator-min-microvolt = <3296000>;
> +			regulator-max-microvolt = <3960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_bob2: bob2 {
> +			regulator-name = "vreg_bob2";
> +			regulator-min-microvolt = <2720000>;
> +			regulator-max-microvolt = <3960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2b_3p0: ldo2 {
> +			regulator-name = "vreg_l2b_3p0";
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5b_3p1: ldo5 {
> +			regulator-name = "vreg_l5b_3p1";
> +			regulator-min-microvolt = <3104000>;
> +			regulator-max-microvolt = <3104000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6b_1p8: ldo6 {
> +			regulator-name = "vreg_l6b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7b_1p8: ldo7 {
> +			regulator-name = "vreg_l7b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8b_1p8: ldo8 {
> +			regulator-name = "vreg_l8b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9b_2p9: ldo9 {
> +			regulator-name = "vreg_l9b_2p9";
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10b_1p8: ldo10 {
> +			regulator-name = "vreg_l10b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11b_1p2: ldo11 {
> +			regulator-name = "vreg_l11b_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1504000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12b_1p8: ldo12 {
> +			regulator-name = "vreg_l12b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13b_3p0: ldo13 {
> +			regulator-name = "vreg_l13b_3p0";
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l14b_3p2: ldo14 {
> +			regulator-name = "vreg_l14b_3p2";
> +			regulator-min-microvolt = <3200000>;
> +			regulator-max-microvolt = <3200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15b_1p8: ldo15 {
> +			regulator-name = "vreg_l15b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l16b_2p8: ldo16 {
> +			regulator-name = "vreg_l16b_2p8";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l17b_2p5: ldo17 {
> +			regulator-name = "vreg_l17b_2p5";
> +			regulator-min-microvolt = <2504000>;
> +			regulator-max-microvolt = <2504000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-1 {
> +		compatible = "qcom,pm8550vs-rpmh-regulators";
> +		qcom,pmic-id = "c";
> +
> +		vdd-l1-supply = <&vreg_s4g_1p25>;
> +		vdd-l2-supply = <&vreg_s4e_0p95>;
> +		vdd-l3-supply = <&vreg_s4e_0p95>;
> +
> +		vreg_l3c_0p9: ldo3 {
> +			regulator-name = "vreg_l3c_0p9";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-2 {
> +		compatible = "qcom,pm8550vs-rpmh-regulators";
> +		qcom,pmic-id = "d";
> +
> +		vdd-l1-supply = <&vreg_s4e_0p95>;
> +		vdd-l2-supply = <&vreg_s4e_0p95>;
> +		vdd-l3-supply = <&vreg_s4e_0p95>;
> +
> +		vreg_l1d_0p88: ldo1 {
> +			regulator-name = "vreg_l1d_0p88";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-3 {
> +		compatible = "qcom,pm8550vs-rpmh-regulators";
> +		qcom,pmic-id = "e";
> +
> +		vdd-l1-supply = <&vreg_s4e_0p95>;
> +		vdd-l2-supply = <&vreg_s4e_0p95>;
> +		vdd-l3-supply = <&vreg_s4g_1p25>;
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +
> +		vreg_s4e_0p95: smps4 {
> +			regulator-name = "vreg_s4e_0p95";
> +			regulator-min-microvolt = <904000>;
> +			regulator-max-microvolt = <984000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s5e_1p08: smps5 {
> +			regulator-name = "vreg_s5e_1p08";
> +			regulator-min-microvolt = <1010000>;
> +			regulator-max-microvolt = <1120000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1e_0p88: ldo1 {
> +			regulator-name = "vreg_l1e_0p88";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2e_0p9: ldo2 {
> +			regulator-name = "vreg_l2e_0p9";
> +			regulator-min-microvolt = <904000>;
> +			regulator-max-microvolt = <970000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3e_1p2: ldo3 {
> +			regulator-name = "vreg_l3e_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-4 {
> +		compatible = "qcom,pm8550ve-rpmh-regulators";
> +		qcom,pmic-id = "f";
> +
> +		vdd-l1-supply = <&vreg_s4e_0p95>;
> +		vdd-l2-supply = <&vreg_s4e_0p95>;
> +		vdd-l3-supply = <&vreg_s4e_0p95>;
> +		vdd-s4-supply = <&vph_pwr>;
> +
> +		vreg_s4f_0p5: smps4 {
> +			regulator-name = "vreg_s4f_0p5";
> +			regulator-min-microvolt = <500000>;
> +			regulator-max-microvolt = <700000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1f_0p9: ldo1 {
> +			regulator-name = "vreg_l1f_0p9";
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2f_0p88: ldo2 {
> +			regulator-name = "vreg_l2f_0p88";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3f_0p88: ldo3 {
> +			regulator-name = "vreg_l3f_0p88";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-5 {
> +		compatible = "qcom,pm8550vs-rpmh-regulators";
> +		qcom,pmic-id = "g";
> +		vdd-l1-supply = <&vreg_s4g_1p25>;
> +		vdd-l2-supply = <&vreg_s4g_1p25>;
> +		vdd-l3-supply = <&vreg_s4g_1p25>;
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +		vdd-s6-supply = <&vph_pwr>;
> +
> +		vreg_s1g_1p25: smps1 {
> +			regulator-name = "vreg_s1g_1p25";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1300000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s2g_0p85: smps2 {
> +			regulator-name = "vreg_s2g_0p85";
> +			regulator-min-microvolt = <800000>;
> +			regulator-max-microvolt = <1000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s3g_0p8: smps3 {
> +			regulator-name = "vreg_s3g_0p8";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1004000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s4g_1p25: smps4 {
> +			regulator-name = "vreg_s4g_1p25";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1352000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s5g_0p85: smps5 {
> +			regulator-name = "vreg_s5g_0p85";
> +			regulator-min-microvolt = <500000>;
> +			regulator-max-microvolt = <1004000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s6g_1p86: smps6 {
> +			regulator-name = "vreg_s6g_1p86";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1g_1p2: ldo1 {
> +			regulator-name = "vreg_l1g_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3g_1p2: ldo3 {
> +			regulator-name = "vreg_l3g_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> +
> +&pm8550_gpios {
> +	sdc2_card_det_n: sdc2-card-det-n-state {
> +		pins = "gpio12";
> +		function = "normal";
> +		input-enable;
> +		output-disable;
> +		bias-pull-up;
> +		power-source = <1>;
> +	};
> +
> +	volume_up_n: volume-up-n-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		power-source = <1>;
> +		bias-pull-up;
> +		input-enable;
> +	};
> +
> +	fan_pwm_active: fan-pwm-active-state {
> +		pins = "gpio9";
> +		function = "func1";
> +		output-low;
> +		bias-disable;
> +		power-source = <0>;
> +		qcom,drive-strength = <3>; /* PMIC_GPIO_STRENGTH_LOW */
> +	};
> +};
> +
> +&pmk8550_gpios {
> +	pmk8550_sleep_clk: sleep-clk-state {
> +		pins = "gpio3";
> +		function = "func1";
> +		input-disable;
> +		output-enable;
> +		bias-disable;
> +		power-source = <0>;
> +	};
> +};
> +
> +&pm8550b_eusb2_repeater {
> +	vdd18-supply = <&vreg_l15b_1p8>;
> +	vdd3-supply = <&vreg_l5b_3p1>;
> +};
> +
> +&pon_pwrkey {
> +	status = "okay";
> +};
> +
> +&pon_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +
> +	status = "okay";
> +};
> +
> +&pmk8550_rtc {
> +	nvmem-cells = <&rtc_offset>;
> +	nvmem-cell-names = "offset";
> +};
> +
> +&pmk8550_sdam_2 {
> +	rtc_offset: rtc-offset@bc {
> +		reg = <0xbc 0x4>;
> +	};
> +};
> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&qupv3_id_1 {
> +	status = "okay";
> +
> +	/* AYANEO Controller serial interface */
> +	uart11: serial@88c000 {
> +		compatible = "qcom,geni-uart";
> +		reg = <0 0x0088c000 0 0x4000>;
> +		clock-names = "se";
> +		clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&qup_uart11_default>;
> +		interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
> +				 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
> +				<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +				 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +		interconnect-names = "qup-core", "qup-config";
> +		operating-points-v2 = <&qup_opp_table_100mhz>;
> +		power-domains = <&rpmhpd RPMHPD_CX>;
> +		status = "okay";
> +	};
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/sm8550/ayaneo/adsp.mdt",
> +			"qcom/sm8550/ayaneo/adsp_dtb.mdt";
> +	status = "okay";
> +};
> +
> +&sdhc_2 {
> +	cd-gpios = <&pm8550_gpios 12 GPIO_ACTIVE_LOW>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
> +	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
> +	vmmc-supply = <&vreg_l9b_2p9>;
> +	vqmmc-supply = <&vreg_l8b_1p8>;
> +	no-sdio;
> +	no-mmc;
> +
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	sd-uhs-ddr50;
> +
> +	qcom,dll-config = <0x0007442c>;
> +	sdhci-caps-mask = <0x3 0x0>;
> +
> +	status = "okay";
> +};
> +
> +&sleep_clk {
> +	clock-frequency = <32764>;
> +};
> +
> +&swr0 {
> +	status = "okay";
> +
> +	spk_amp_l: speaker@0,0 {
> +		compatible = "sdw20217020400";
> +		reg = <0 0>;
> +
> +		pinctrl-0 = <&spkr_1_sd_n_active>;
> +		pinctrl-names = "default";
> +
> +		powerdown-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
> +
> +		vdd-1p8-supply = <&vreg_l10b_1p8>;
> +		vdd-io-supply = <&vreg_l10b_1p8>;
> +
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "SpkrLeft";
> +		qcom,port-mapping = <1 2 3 7 10 13>;
> +	};
> +
> +	spk_amp_r: speaker@0,1 {
> +		compatible = "sdw20217020400";
> +		reg = <0 1>;
> +
> +		pinctrl-0 = <&spkr_2_sd_n_active>;
> +		pinctrl-names = "default";
> +
> +		powerdown-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
> +
> +		vdd-1p8-supply = <&vreg_l10b_1p8>;
> +		vdd-io-supply = <&vreg_l10b_1p8>;
> +
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "SpkrRight";
> +		qcom,port-mapping = <4 5 6 7 11 13>;
> +	};
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <32 8>;
> +
> +	bt_default: bt-default-state {
> +		bt-en-pins {
> +			pins = "gpio81";
> +			function = "gpio";
> +			drive-strength = <16>;
> +			bias-disable;
> +		};
> +
> +		sw-ctrl-pins {
> +			pins = "gpio82";
> +			function = "gpio";
> +			bias-pull-down;
> +		};
> +	};
> +
> +	fan_pwr_active: fan-pwr-active-state {
> +		pins = "gpio31";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;
> +	};
> +
> +	fan_int: fan-int-state {
> +		pins = "gpio64";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	upd720201_active: upd720201-active-state {
> +		pins = "gpio10",  "gpio13", "gpio18";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +		output-high;
> +	};
> +
> +	gamepad_pwr_en: gamepad-pwr-en-active-state {
> +		pins = "gpio52";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	qup_uart11_default: qup-uart11-default-state {
> +		/* TX, RX */
> +		pins = "gpio70", "gpio71";
> +		function = "qup2_se3";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	sde_dsi_active: sde-dsi-active-state {
> +		pins = "gpio133";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	sde_dsi_suspend: sde-dsi-suspend-state {
> +		pins = "gpio133";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_te_active: sde-te-active-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_te_suspend: sde-te-suspend-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	wlan_en: wlan-en-state {
> +		pins = "gpio80";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-down;
> +	};
> +
> +	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
> +		pins = "gpio7";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
> +		pins = "gpio12";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +		output-high;
> +	};
> +};
> +
> +&pm8550_pwm {
> +	status = "okay";
> +};
> +
> +&xo_board {
> +	clock-frequency = <76800000>;
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
> +
> +	zap-shader {
> +		firmware-name = "qcom/sm8550/a740_zap.mbn";
> +	};
> +};
> +
> +&gpu_opp_table {
> +	/* Additional speedbin for Adreno A32
> +	 *	719000000  RPMH_REGULATOR_LEVEL_SVS_L2
> +	 *	746000000 RPMH_REGULATOR_LEVEL_NOM
> +	 *	794000000 RPMH_REGULATOR_LEVEL_NOM_L1
> +	 *	827000000 RPMH_REGULATOR_LEVEL_TURBO
> +	 *	860000000 RPMH_REGULATOR_LEVEL_TURBO_L1
> +	 *	1000000000 RPMH_REGULATOR_LEVEL_TURBO_L2
> +	 */
> +	opp-719000000 {
> +		opp-hz = /bits/ 64 <719000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> +		opp-peak-kBps = <10687500>; // Level 7
> +		qcom,opp-acd-level = <0x882e5ffd>;
> +	};
> +
> +	opp-746000000 {
> +		opp-hz = /bits/ 64 <746000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +		opp-peak-kBps = <10687500>; // Level 7
> +		qcom,opp-acd-level = <0x882e5ffd>;
> +	};
> +
> +	opp-794000000 {
> +		opp-hz = /bits/ 64 <794000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +		opp-peak-kBps = <14398438>; // Level 8
> +		qcom,opp-acd-level = <0xa82d5ffd>;
> +	};
> +
> +	opp-827000000 {
> +		opp-hz = /bits/ 64 <827000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +		opp-peak-kBps = <16500000>; // Level 9
> +		qcom,opp-acd-level = <0xa82d5ffd>;
> +	};
> +
> +	opp-860000000 {
> +		opp-hz = /bits/ 64 <860000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +		opp-peak-kBps = <16500000>; // Level 9
> +		qcom,opp-acd-level = <0x882d5ffd>;
> +	};
> +
> +	opp-1000000000 {
> +		opp-hz = /bits/ 64 <1000000000>;
> +		opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L2>;
> +		opp-peak-kBps = <16500000>; // Level 9
> +		qcom,opp-acd-level = <0x882d5ffd>;
> +	};
> +};
> +
> +&i2c_master_hub_0 {
> +	status = "okay";
> +};
> +
> +&i2c_hub_2 {
> +	status = "okay";
> +
> +	typec-retimer@1c {
> +		compatible = "onnn,nb7vpq904m";
> +		reg = <0x1c>;
> +		vcc-supply = <&vreg_l15b_1p8>;
> +
> +		retimer-switch;
> +		orientation-switch;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				redriver_ss_out: endpoint {
> +					remote-endpoint = <&pmic_glink_ss_in>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				redriver_ss_in: endpoint {
> +					data-lanes = <3 2 1 0>;
> +					remote-endpoint = <&usb_dp_qmpphy_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l3e_1p2>;
> +	status = "okay";
> +
> +	display_panel: panel@0 {
> +		reg = <0>;
> +
> +		pinctrl-0 = <&sde_dsi_active>, <&sde_te_active>;
> +		pinctrl-1 = <&sde_dsi_suspend>, <&sde_te_suspend>;
> +		pinctrl-names = "default", "sleep";
> +	};

The panel compatible is not added in the main board file, this is wrong
and leaves a node without compatible.

I guess you did not test your DT files against the bindings

> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l1e_0p88>;
> +	status = "okay";
> +};
> +
> +&mdss_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +	data-lanes = <0 1>;
> +};
> +
> +&pcie0 {
> +	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
> +	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> +
> +	max-link-speed = <2>;
> +
> +	pinctrl-0 = <&pcie0_default_state>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie1 {
> +	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
> +	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 = <&pcie1_default_state>, <&upd720201_active>, <&gamepad_pwr_en>;


This is wrong, please add an upd720201 node like the ayaneo pocket s2

> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie1_phy {
> +	vdda-phy-supply = <&vreg_l3c_0p9>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +	vdda-qref-supply = <&vreg_l1e_0p88>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l17b_2p5>;
> +	vcc-max-microamp = <1300000>;
> +	vccq-supply = <&vreg_l1g_1p2>;
> +	vccq-max-microamp = <1200000>;
> +	vdd-hba-supply = <&vreg_l3g_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l1d_0p88>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in>;
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l1e_0p88>;
> +	vdda12-supply = <&vreg_l3e_1p2>;
> +
> +	phys = <&pm8550b_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_dp_qmpphy {
> +	vdda-phy-supply = <&vreg_l3e_1p2>;
> +	vdda-pll-supply = <&vreg_l3f_0p88>;
> +
> +	status = "okay";
> +};
> +
> +&usb_dp_qmpphy_out {
> +	remote-endpoint = <&redriver_ss_in>;
> +};
> +
> +&uart7 {
> +	status = "okay";
> +};
> +
> +&uart14 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn7850-bt";
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> +
> +		max-speed = <3200000>;
> +	};
> +};
> +
> +&iris {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts
> new file mode 100644
> index 000000000000..723b027fa73b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025, Teguh Sobirin.
> + * Copyright (c) 2025, ROCKNIX (https://github.com/ROCKNIX)
> + */
> +
> +/dts-v1/;
> +
> +#include "qcs8550-ayaneo-pocket-common.dtsi"
> +
> +/ {
> +	model = "AYANEO Pocket DS";
> +	compatible = "ayaneo,pocketds", "qcom,sm8550";
> +	rocknix-u-boot-dt-id = "u-boot-pocket-ds";
> +
> +	tca6424_vcc: regulator-tca6424-vcc {
> +		compatible = "regulator-fixed";
> +		regulator-name = "tca6424_vcc";
> +
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 168 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-boot-on;
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +
> +	vdd_ts: vdd-ts {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_ts_en";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&tca6408 1 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <32 4>;
> +	panel_pwr_active: panel-pwr-active-state {
> +		pins = "gpio152", "gpio153";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	sde_dsi1_active: sde-dsi1-active-state {
> +		pins = "gpio137";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	sde_dsi1_suspend: sde-dsi1-suspend-state {
> +		pins = "gpio137";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	ts_rst_default: ts-rst-default-state {
> +		pins = "gpio24";
> +		function = "gpio";
> +		bias-pull-up;
> +		drive-strength = <8>;
> +	};
> +
> +	ts_rst_sleep: ts-rst-sleep-state {
> +		pins = "gpio24";
> +		function = "gpio";
> +		bias-pull-down;
> +		drive-strength = <2>;
> +	};
> +
> +	ts_int_default: ts-int-default-state {
> +		pins = "gpio25";
> +		function = "gpio";
> +		bias-pull-up;
> +		drive-strength = <8>;
> +	};
> +
> +	ts_int_sleep: ts-int-sleep-state {
> +		pins = "gpio25";
> +		function = "gpio";
> +		bias-pull-down;
> +		drive-strength = <2>;
> +	};
> +
> +	ts2_irq: ts2-irq-state {
> +		pins = "gpio39";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	ts2_reset: ts2-reset-state {
> +		pins = "gpio38";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-down;
> +	};
> +};
> +
> +&i2c0 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	tca6408: tca64_20@20 {
> +		gpio-controller;
> +		compatible = "ti,tca6408";
> +		status = "okay";
> +		reg = <0x20>;
> +		#gpio-cells = <0x02>;
> +		vcc-supply = <&tca6424_vcc>;
> +	};
> +};
> +
> +&i2c2 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	touchscreen@5d {
> +		reg = <0x5d>;
> +		compatible = "goodix,gt911";
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <39 IRQ_TYPE_EDGE_FALLING>;
> +
> +		reset-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>;
> +		irq-gpios = <&tlmm 39 GPIO_ACTIVE_HIGH>;
> +		VDDIO-supply = <&vdd_ts>;
> +
> +		touchscreen-size-x = <768>;
> +		touchscreen-size-y = <1024>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ts2_reset>, <&ts2_irq>;
> +
> +	};
> +};
> +
> +&i2c4 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +	touchscreen: touchscreen@38 {
> +		compatible = "focaltech,ft5426";
> +		reg = <0x38>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
> +
> +		reset-gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
> +
> +		vcc-supply = <&vreg_l14b_3p2>;
> +		iovcc-supply = <&vreg_l12b_1p8>;
> +
> +		pinctrl-0 = <&ts_int_default &ts_rst_default>;
> +		pinctrl-1 = <&ts_int_sleep &ts_rst_sleep>;
> +		pinctrl-names = "default", "sleep";
> +
> +		touchscreen-size-x = <1080>;
> +		touchscreen-size-y = <1920>;
> +	};
> +};
> 

Why 2 touch controllers ?

Thanks,
Neil

