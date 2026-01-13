Return-Path: <linux-arm-msm+bounces-88705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A49D17774
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFA34307AF8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F06C3815C7;
	Tue, 13 Jan 2026 09:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qqqdRzKA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521303815DC
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294914; cv=none; b=BIVQr46o4g/KwW3DaYGTgGsqTAx2D31rSvjOgmI7cCEbfki/ecdHvAipTSU7z7tR6F5k1plEIrHc6vBQCYacMvcaRoVKgYrgx00NIxT/oCKWJ9J33fdZIYsGOR4/d7ah56IljVh6Puy5yghqhZNu3Am4pGToBi/PKSIKJ4Bb4Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294914; c=relaxed/simple;
	bh=d5vjg7xqY7UHMmCIfFmjlupVbmddXpBXVY3p8jlYrm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ikpLIaiKZ4If3CyqKaO9UJiFnJUfl3Z7XYwsPZXevUf4UHu+xUcqH+RBbIYiJcuLhiBpn7LuuG4I++2lPBLp2/1W+CfoONIL/VkecVgE7xo86ycuqIOFjoyGuC1DhK0LQKNOcp9Kp+u66IbHYaYOa8R7o5FqQTAKnvd1AFTzw+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qqqdRzKA; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fb03c3cf2so3877590f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768294910; x=1768899710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLayOWuB+aXoZiDViiMppHrDe6uab9ztwbJVajwHoL0=;
        b=qqqdRzKA+Y8PDfN/CVIv9++Oh+tq2fdIvcuGIGAfk8s+eCgv6Mc7864UuMd8OnOfN3
         C8Y8Q9Ij4A/en/qIGG9sAE67Qtuma4J+bh86LFUPAGuwGZSJIhSkuQitILfkRebkJK+8
         PI9dXFFXb+cYB1fm23J+wE8TsCBK1sY6b00hcT7kEnIJInxfWNn36JnZgDwgrkkbU9bo
         yg2mPqBB3gKuQNAObSW6fxRaLLLm4Z9V7sYxjNMuQYJ2ONiuQAqzA4+9zMAVW7dqnmp4
         yn41a4yYk0WEyRnRBHzZXW4ZY9W3K58q4IissEUiP3cOGBrBs0w6pocrRmJmqi45Dcrx
         fKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768294910; x=1768899710;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLayOWuB+aXoZiDViiMppHrDe6uab9ztwbJVajwHoL0=;
        b=LioI7KKtCYjIHRxjlxCYyWNqwBegZ4V1MauipM0CtmU/EPHe+RcmvZsBsq1JsE3eiU
         hbrXkil/yojHMyST3OvyDwqJChk5SmqqQwBg/LWYqzLHG3Xaxm1dhJACkzg9jMk/Dbf/
         nCoG78+GL8AZe89UhE3+YpVdjEprGtAISEHQwoXAu8pgIwBrc+hBiifs/D83rJMCVXFX
         BpYOaNuKByfOCwi1hbKK68pALOpKCnPqiONAINbnM8OHHhgNhWDLWPKc+e8JzYVMawFN
         gHwBh0VfaCO4Uwt4c9WSl5Rkm8PZxaeiyo0iyHQ5Hvjl1Lz6KeRkwE5qw2VvPojUqCtq
         LdYg==
X-Gm-Message-State: AOJu0YzA49+Yhdb/syK0EovmoKmAB+5OX+UR3SGJ3cWzVc9NVe8SRg+A
	23/GRWJFieC+JZDzYgk/klF5Gg7nHeO16MEgCFjX6Ofw43RZQzWRaCQc/wgrvgQvrh8=
X-Gm-Gg: AY/fxX7Z0cEtnnZVUya5ubUkDx6H39kum030ZhrmobIYZJZULCWOBmUuqa4SOLSHrWE
	mfPinTcZOkapfhMBWyu68kKwhJijvVZOq4uItTQWylW7bzFDWNrce04A0+OQaXplMAKkFf5ml4/
	OERy4N+dYQVKcw9B3bnU58oOnp6AlSuaTOYqbMkAfihM076bzFXfDtLKONLNxHXohOKyD6k9xLc
	3hATzuUhBQbfU+8LvvH7d6oBBrmHx5ESZScVcJeGDLg0rQ1O6yKhIzu/ej/7hrIFJ6mYzl6qcrv
	MMvtI5IE0oOIVbmUBlUer/14MGsHEhBVirbemXENFEKYz5vTTimnr0LdDkkrxEWoukHj5gWGmOw
	GppTGx4bhf5pppYEQqMY/khqnhmvnWYQmvNM2S/zTJqrRhS7qpbznQjhn7M5CSmWkv3BL4adRvT
	xTk3JbdYJalHlp0csDaGi6kyikmJHuOu3/EBMBeyo=
X-Google-Smtp-Source: AGHT+IGL6cmE/nd1MZd/Ljre/Dci5mn4Zxy9lXnPUTvY0Zx1DkovQdRnHMs/laovytBzLKvFHqa6FA==
X-Received: by 2002:a05:6000:438a:b0:432:c0e6:cfc0 with SMTP id ffacd0b85a97d-432c3778dd3mr26202405f8f.57.1768294910387;
        Tue, 13 Jan 2026 01:01:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080::fa42:7768? ([2a01:e0a:3d9:2080::fa42:7768])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9afsm45524987f8f.24.2026.01.13.01.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 01:01:49 -0800 (PST)
Message-ID: <782ed3c8-d031-4934-9a8c-6366abefbf7c@linaro.org>
Date: Tue, 13 Jan 2026 10:01:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add support for ECS LIVA QC710
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260111085726.634091-2-val@packett.cool>
 <20260111085726.634091-6-val@packett.cool>
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
In-Reply-To: <20260111085726.634091-6-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 1/11/26 09:35, Val Packett wrote:
> Add a device tree for the ECS LIVA QC710 (Snapdragon 7c) mini PC/devkit.
> 
> Working:
> - Wi-Fi (wcn3990 hw1.0)
> - Bluetooth
> - USB Type-A (USB3 and USB2)
> - Ethernet (over USB2)
> - HDMI Display
> - eMMC
> - SDHC (microSD slot)
> 
> Not included:
> - HDMI Audio
> - EC (IT8987)
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |   2 +
>   .../boot/dts/qcom/sc7180-ecs-liva-qc710.dts   | 625 ++++++++++++++++++
>   2 files changed, 627 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts

<snip>

> +
> +	hdmi-bridge {
> +		compatible = "algoltek,ag6311";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				hdmi_bridge_dp_in: endpoint {
> +					remote-endpoint = <&usb_1_qmpphy_dp_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				hdmi_bridge_tmds_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +		};
> +	};
> +
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&hdmi_bridge_tmds_out>;
> +			};
> +		};
> +	};
> +

<snip>

> +
> +&usb_1_qmpphy {
> +	vdda-phy-supply = <&vreg_l3c_1p2>;
> +	vdda-pll-supply = <&vreg_l4a_0p8>;
> +
> +	/delete-property/ mode-switch;
> +	/delete-property/ orientation-switch;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/delete-node/ endpoint;
> +
> +			usb_1_qmpphy_dp_out: endpoint@0 {
> +				reg = <0>;
> +
> +				data-lanes = <3 2>;
> +				remote-endpoint = <&hdmi_bridge_dp_in>;
> +			};
> +
> +			usb_1_qmpphy_usb_ss_out: endpoint@1 {
> +				reg = <1>;
> +
> +				data-lanes = <1 0>;
> +				remote-endpoint = <&usb_a_connector_ss_in>;
> +			};
> +		};
> +	};
> +};
> +
<snip>

Hehe, finally seems my work was quite useful after all :-)
Thanks,
Neil

