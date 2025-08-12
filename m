Return-Path: <linux-arm-msm+bounces-68785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E9BB22958
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 15:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E74B11BC357F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8160F2820D6;
	Tue, 12 Aug 2025 13:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zA1Yx7Uu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FA83C2F
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 13:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755005945; cv=none; b=Z/L6y6iOZkupVUXJ3SGNjVtgnAaIsWC4DaTais8Z+QOgv4U76CDhMPMQOGxLsp1VCvYv0UXXpK0xOhmp415U2weWUzcyBWo2TIOTXo6+i+XJz2B9yB3Zab/aEgGajzzuQasADJzskcvOVQ4wVQI4NUMWuJuxcjyk9Eplt+TGlUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755005945; c=relaxed/simple;
	bh=vFn0jCSKE1KpsbrkuboVpZfoRk4S06SCDMiRDBC4J8s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Gy2VZpjP0FavqeVxXt9LB79VdwupJuSJBTwKOkfKUikkLlaKWex+mr4lS+E7kcPIXicKUgnd8SRB7lDriaC9rq1LcGePgGqjy3pX0CRJtmmNReBAETSb6u8oLzARSET7A7T4SQnF9Ir7Km8h5OlwE95BorKnE75AXX01vA4cg90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zA1Yx7Uu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-455b00339c8so35670665e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 06:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755005942; x=1755610742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+F6T7liCG9gadSn68AjZAZfIPgOb+DpRS8VT8i0DD8=;
        b=zA1Yx7Uu9KkqgEWh81jEvm4UFjXOkrFs2/PzPMFzDupuH+dxU1nksi4rB9I/7ut00J
         Kk5n0RIHJo8v96XnE0Xf4HqnGwoGy8e0y5Lihhq0Wn/svxMnfYFsAEP1nJllm/sCaamf
         pJCOUlhrbT6vfccsSIumFBE6MTvqXw6J4QfRhMkjsO/hB/05ml1/emgZwnUHpMf4Bh1V
         pB0CEDbcQaN57mZy+Q/LaQsX6oDR3AGqn6TVwG6ST7KAn58iXp2kPRTz62/Wzt9rlXKJ
         Pg3EjdYxGK/PtWOlM5ziPyYpbtDXTis2xiX2XXiJa5Yorv+b4Im+EPrvjan4fHxN3RZl
         e3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755005942; x=1755610742;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r+F6T7liCG9gadSn68AjZAZfIPgOb+DpRS8VT8i0DD8=;
        b=SM+GRsO2ijfl8KneopxanA5L7dHQAS8XNopMBHrDFueHCUqvG+VtZ08fcQ9MbO7dDD
         lU008jKCbcWl6RYjZH3eMk12WSpGRHDU5t7NFYdQ2TOLmfkIinFtcTvi1PsAxx0vACpL
         s01BmaSiJ8Fbl+mbYJi+0gMI34VVDdK5y7O2L9mwGY+JZipeCULgHuotpJOJ8y9ROKKr
         Wc9Bh+6OmzMi0StsMMbxnzZ1fTQoqQITkTlnMeieiGWN3gyaFZVE5YlljL4t6Qx8ycfk
         F5YsjmrqWg2Bkz8hzkU2lAM2/iH06vlMNIVbJKFMjcsDOa0uPCfWmePz4G+FIqMkXeAs
         fHuA==
X-Forwarded-Encrypted: i=1; AJvYcCXlyXW/dgNrcKivsH7QWNMsXQ0Pj+srQ71MCD7nmZjmwSGY2aoOcvAHuubrFFiYrkhjzvGhuG9pcXjRLLW6@vger.kernel.org
X-Gm-Message-State: AOJu0YwAfDJW5u0Kb+QqEAxXBwH+Q2wjOnHNsQDDbP96wkVF/C+dQLuU
	jh/q4ft4ckU8zK0u1DLjFlkWtwlmAxpOGXR9dM4rM9sh7JzN/CAQaUXEdkccjGJ375c=
X-Gm-Gg: ASbGncuTAhUwJVg0ZP78VZNRcADVJiJGyITxj8U1XB3fs/5rhpu2H6kp3K2ndbuykNl
	syYPqiFTpMcaoyNQI678YamrFUxqEW2EBmCbREO9iAJl2BhYeTHr7aoOwVJN/GVV9jb3ZKv2MBz
	h/xkMqMTMlkaZ05gYswt71PvT8SFbjqXom4CtyCSPQHMmqcXnkB+fJ6cSXr3Qr3uP23bmrmQMXM
	gMN6qZ8pVb4sV/PDZbF5e2tqI/TNuL7BRpsHGV+UbowaAlso/WIQec8LXBOYxAADtFar+TPAovo
	3NT0vym/6kxQMrai14/K2xY0bYFzTFA0/i/43hFwH1ShFrBdTdVtaqA/wjL+Ud9gt4T8/uoLpgu
	QicVraNxCHHZWMv9GZBPHclKfSidYyWXZi7Vr8K2da6AZSZ3MhfbgfhbI4kEiUEEUlj8O4oQ9NE
	YDNZpKIEJLfQ==
X-Google-Smtp-Source: AGHT+IG68k5KkLHuUBSjtpxGcS06gQVZPGCBg//jo/LZq9FzGZ01MFCnek+ggsr/rWGxjSd/2rnI0Q==
X-Received: by 2002:a05:600c:8b35:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-45a10b9ae9emr27765545e9.1.1755005941590;
        Tue, 12 Aug 2025 06:39:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:9086:bd36:16a7:1f8b? ([2a01:e0a:3d9:2080:9086:bd36:16a7:1f8b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c489e81sm44885723f8f.68.2025.08.12.06.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 06:39:00 -0700 (PDT)
Message-ID: <d7949778-73c4-4575-8db3-a3724f75eb38@linaro.org>
Date: Tue, 12 Aug 2025 15:39:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
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
In-Reply-To: <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/07/2025 18:16, Bryan O'Donoghue wrote:
> Add a new MIPI CSI2 driver in D-PHY mode initially. The entire set of
> existing CAMSS CSI PHY init sequences are imported in order to save time
> and effort in later patches.
> 
> In-line with other PHY drivers the process node name is omitted from the
> compat string while the soc name is included.
> 
> At the moment we follow the assignment of lane positions - the bitmap of
> physical input lanes to logical lane numbers as a linear list per the
> existing DPHY @lanes data-member.
> 
> This is fine for us in upstream since we also map the lanes contiguously
> but, our hardware can support different lane mappings so we should in the
> future extend out the DPHY structure to capture the mapping.
> 
> The Qualcomm 3PH class of PHYs can do both D-PHY and C-PHY mode. For now only
> D-PHY is supported.
> 
> In porting some of the logic over from camss-csiphy*.c to here its also
> possible to rationalise some of the code.
> 
> In particular use of regulator_bulk and clk_bulk as well as dropping the
> seemingly useless and unused interrupt handler.
> 
> The PHY sequences and a lot of the logic that goes with them are well proven
> in CAMSS and mature so the main thing to watch out for here is how to get
> the right sequencing of regulators, clocks and register-writes.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   MAINTAINERS                                        |  11 +
>   drivers/phy/qualcomm/Kconfig                       |  11 +
>   drivers/phy/qualcomm/Makefile                      |   6 +
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 491 +++++++++++++++++++++
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 281 ++++++++++++
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          | 101 +++++
>   6 files changed, 901 insertions(+)
> 
>
<snip>

> +const struct mipi_csi2phy_clk_freq zero = { 0 };
> +
> +const struct mipi_csi2phy_clk_freq dphy_4nm_x1e_csiphy = {
> +	.freq = {
> +		300000000, 400000000, 480000000
> +	},
> +	.num_freq = 3,
> +};
> +
> +const struct mipi_csi2phy_clk_freq dphy_4nm_x1e_csiphy_timer = {
> +	.freq = {
> +		266666667, 400000000
> +	},
> +	.num_freq = 2,
> +};
> +
> +const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
> +	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
> +	.reg_info = {
> +		.init_seq = lane_regs_x1e80100,
> +		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
> +		.offset = 0x1000,
> +		.generation = GEN2,
> +	},
> +	.supply_names = (const char *[]){
> +		"vdda-0p8",
> +		"vdda-1p2"
> +	},
> +	.num_supplies = 2,
> +	.clk_names = (const char *[]) {
> +		"camnoc_axi",
> +		"cpas_ahb",
> +		"csiphy",
> +		"csiphy_timer"
> +	},
> +	.num_clk = 4,
> +	.clk_freq = {
> +		zero,

It seems clang doesn't like this at all:
drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:486:3: error: initializer element is not a compile-time constant
                 zero,
                 ^~~~
1 error generated.

> +		zero,
> +		dphy_4nm_x1e_csiphy,
> +		dphy_4nm_x1e_csiphy_timer,
> +	},
> +};
<snip>


