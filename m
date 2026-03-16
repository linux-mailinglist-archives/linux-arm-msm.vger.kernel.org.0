Return-Path: <linux-arm-msm+bounces-97860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL/8G2q/t2n5UwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:29:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CED86296269
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D73983026AA3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 08:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F8734EF15;
	Mon, 16 Mar 2026 08:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XMht8q4b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F582372EE5
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649734; cv=none; b=H1fCGEDGj2Q5OTfkH23gwhCbcwBFhlgbLuRh0q2O2vGsdmMBE0IgD++Rvu2o/Gr3P8gWl/g1/sYdr5rmlde1TfyXAnP9JEAqdTWRZZ1zv2yGk90baTO323HCqw6ecMNMwRXCSpbr6fw8afY3XsfKN0K/vMMEC7xpCKX6kUP0Qnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649734; c=relaxed/simple;
	bh=tFidrwbsSVF0BctrFcOY3al2UBO/vzHaTCHov8ieLq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cIokBRVAveitf6WsCjO7FNnTFfTLuLFEzIclEOylDV3M0lcQAHcVnFuxKuO37YCGTDdR63lMbIr34dnR+KniqFlXI/T4oy2ymymJkDF7eZefmF9Lblx5BcfOXyXcqIjc1tb7uRWDWfAWlI/oM/qHcdwvI6iEswoaCOFBXrp+xG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XMht8q4b; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so963699f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773649731; x=1774254531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sI0jkZdZQ/XX2Ny4kKQlN4TDMozZ6Lmx2d/MpWh8cBU=;
        b=XMht8q4bBpmU8rdMuyUSXRxcmcTtm4DZDIEhKsbRH5x0O9RfAyyyIhiU8EO8/TnCTp
         tX4mPdhN+B6KGAjHhJhAXQ506v0rxbfbUSVbCRFuDG7prU2lHcRH2fvsBJVrISm8/tiR
         1hfhPOtAK07aYWAibQTufAJj59/EPPok3IhVSYRUUX8wGJX/bM+9/uYXXQ+BEe47oRkl
         rNxp/3qK9KLPuTquq/Q3Q5Komvsuu2fNJlzZw9mnLOPQlyJ7fOqsRBC6xtUI+mCzY2Q8
         RX6b8qn7GcUFYeDMnReJKnq9ylpLXfZbKyY3/4dU/IQYWF+UD/OUGQCJonDOFwqZVY7u
         A40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649731; x=1774254531;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sI0jkZdZQ/XX2Ny4kKQlN4TDMozZ6Lmx2d/MpWh8cBU=;
        b=lNRH2ycvh+GWAGUXWgfqZ6hfuwwvomoPQR/vOwXtFN4Cil9LaS5I3pOuTS6Wl25vWV
         JC9xEzZrDfIjJAKWFxrEIr1TIoNDxVScZaymIclwSvLtsNZCLIPdpLjV8jANGNJE/MNo
         u0wl2jAvvpedBbrV9XZE6d5vnyK3JvYEylbTvY33C5lhYBd5yean7WIcGmsk1S4vT9f6
         l0sWH7lYDLjPyqhXTBDLSbqlct452LokcSF6XzGLQ7zJNQwo10Nn1lfqNhKrMnEavB+k
         kAdhPU2wgYJec4uqNiif+Drn0/AiuNg419agCul3HIdzP4hqLbgKHaGRF/q9I2Y9gf9r
         7PWw==
X-Gm-Message-State: AOJu0YxswjjIzcSdLqNEy9tKceGReZKhCUln/oY28fiTQMf4o9dXoRdx
	8aBNnxJ8byzY/oT/Df6H03WBXGbIaeCv5EXGyXd4K0Bbt2hde7JDeb6fgcuBGHH+/54=
X-Gm-Gg: ATEYQzy71oCQ8W23R7EgFgPBzDXI2Tcxe6ra+4ajH1eAThacdyT/m/A2C20AKVwvbCl
	CJFDXt45W8lhTuJ500734Xx5nk7WgIQ+1smh8lsX7Ed0SCfwWD0DUfRFVsn0C6V5nv9J1/Lyj7t
	xnjfWtvd1Og8tH0UzeOLwPP5Oc1hWnfi8TH98jqzqOAvtNi2oAGmU87/57CgsyZsdZNWhqYnsvs
	nZ2vEaiPT869H2t0qMxj4VrDw9ZmiHSmqFZxrTn22rVB0AdaukBN7/itNm3D4djZuG8XkcjUTlm
	ih6IV/n46zsvFgC8nu4fKN2G/A8zCEOvcLEXvZ2Lpv/2fL//fSQSbvN3BMWbD/l5nj3IE8CqT3b
	BuUuuIlksswDm0AFDPJSO57C6SuEu6mg/SrtmACzNRQsUT2yoCtax7m+2z5WAZNEvp+0goGMBE0
	PEj2yN9lRWnr6m1kchW8CfxW+wFUa9mijiAoaO0dJhAkoKitgt9DfQdKXH2OB5EhNXB/C4hHGEj
	oZHa1k=
X-Received: by 2002:a05:6000:2501:b0:439:d0ac:8a8f with SMTP id ffacd0b85a97d-439fdf3407bmr29701850f8f.1.1773649730716;
        Mon, 16 Mar 2026 01:28:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:a12d:6e5e:e745:c5e8? ([2a01:e0a:106d:1080:a12d:6e5e:e745:c5e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19b936sm43500946f8f.5.2026.03.16.01.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:28:50 -0700 (PDT)
Message-ID: <b8d00023-ebe1-4abe-82ef-c8dc20f333dc@linaro.org>
Date: Mon, 16 Mar 2026 09:28:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add ov02c10 RGB sensor on CSIPHY4
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
 <20260316-x1e-camss-csi2-phy-dtsi-v2-10-859f3fa55790@linaro.org>
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
In-Reply-To: <20260316-x1e-camss-csi2-phy-dtsi-v2-10-859f3fa55790@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97860-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid,0.0.0.36:email];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: CED86296269
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 02:12, Bryan O'Donoghue wrote:
> Add in the RGB sensor on CSIPHY4.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 77 ++++++++++++++++++++++
>   1 file changed, 77 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index 1611bf7302ddf..b09b437e0cd50 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -7,6 +7,7 @@
>   
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>   
>   #include "hamoa.dtsi"
> @@ -863,6 +864,66 @@ &gpu_zap_shader {
>   	firmware-name = "qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn";
>   };
>   
> +&camss {
> +	status = "okay";
> +
> +	ports {
> +		/*
> +		 * port0 => csiphy0
> +		 * port1 => csiphy1
> +		 * port2 => csiphy2
> +		 * port3 => csiphy4
> +		 */
> +		port@3 {
> +			camss_csiphy4_inep0: endpoint@0 {
> +				clock-lanes = <7>;
> +				data-lanes = <0 1>;
> +				remote-endpoint = <&ov02c10_ep>;

This is quite wrong, with the PHY in a separate node, the lanes layout has nothing
to do in the "controller" ports since the sensor is connected to the the PHY which
configures the lanes functions.

The PHY should be a media element in a port/endpoint chain to properly describe the
data flow from the sensor to the controller.

PHY as a separate node is a first step, ideally all components of the CAMSS should be
in separate nodes with port/endpoints describing the whole data interconnection.

Neil

> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c1 {
> +	camera@36 {
> +		compatible = "ovti,ov02c10";
> +		reg = <0x36>;
> +
> +		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam_rgb_default>;
> +
> +		clocks = <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clock-rates = <19200000>;
> +
> +		orientation = <0>; /* front facing */
> +
> +		avdd-supply = <&vreg_l7b_2p8>;
> +		dvdd-supply = <&vreg_l1m_1p2>;
> +		dovdd-supply = <&vreg_l3m_1p8>;
> +
> +		port {
> +			ov02c10_ep: endpoint {
> +				data-lanes = <1 2>;
> +				link-frequencies = /bits/ 64 <400000000>;
> +				remote-endpoint = <&camss_csiphy4_inep0>;
> +			};
> +		};
> +	};
> +};
> +
> +&csiphy4 {
> +	vdda-0p8-supply = <&vreg_l2c_0p8>;
> +	vdda-1p2-supply = <&vreg_l1c_1p2>;
> +
> +	status = "okay";
> +};
> +
>   &i2c0 {
>   	clock-frequency = <400000>;
>   
> @@ -1410,6 +1471,22 @@ &tlmm {
>   			       <44 4>, /* SPI (TPM) */
>   			       <238 1>; /* UFS Reset */
>   
> +	cam_rgb_default: cam-rgb-default-state {
> +		mclk-pins {
> +			pins = "gpio100";
> +			function = "cam_aon";
> +			drive-strength = <16>;
> +			bias-disable;
> +		};
> +
> +		reset-n-pins {
> +			pins = "gpio237";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
>   	edp_reg_en: edp-reg-en-state {
>   		pins = "gpio70";
>   		function = "gpio";
> 


