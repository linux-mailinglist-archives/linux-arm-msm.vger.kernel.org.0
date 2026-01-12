Return-Path: <linux-arm-msm+bounces-88482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 346EAD11331
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 09:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16B033003BFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 08:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8524432936C;
	Mon, 12 Jan 2026 08:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A1zQXDCo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BE63195EA
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768206372; cv=none; b=sFQjlSa9HmUE/TyhT83uNGFzbJp66S+gnJxbRH8kxFUgoev/t+V9Ly3gqy/sQWh/5d5Da/DLdj5TEyffIp1Hs6xYi9G7zyATm7w85genkLNgDROuVmuL5Q97SPsrtLiSwiF8Tmv1MZfBFUDjmE11+6xQwqC5Q1KA1bSpcpQY3Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768206372; c=relaxed/simple;
	bh=crOxfXx3Bkxmg/62bNfuXm2ff0UCs2ZSN8ubtVaCd+U=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YIEE9uERS6HVAohzTnKpZhvqoP6qeodC3yWvEED+rJG/TclwLCVCZmVkqoEwDXfAAPhURls/Rw0f+KIsX6gDtpA130v0IP2MNRn+bVJ7Pb9BesTDoHwbG4Wu3HJVNn8Wn5ykSPHKqGJSpM1APKtLk5WVd7yRPY9OuIuekiTcNw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A1zQXDCo; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso48579265e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 00:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768206369; x=1768811169; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2tN6b+lbrWfZ7oxTxnv+TGwJvGYGk587gJwGFobI+w=;
        b=A1zQXDCokwxTLxwTXKjvjpbpAoYa9yGj60ylrmySGVt0W9DT6AQXGrlSPv4aJzTqNP
         MWja4/xR2KgMHO4t89khmUlNpnKDbNWY9bVWvw1dc8S8ff2Mx/clZwjYLs+E2RolUtSi
         zs6JSYflGdZA7klxduXv8cHUDZMvELZBPeu43Q+LLdp+ysBxoKSUMf5pFKQKdiYP0Bz6
         d1V2yMqiiJwEvX6ExeqJJe6ek4tVDkLQpHdIN12ILbZzQJT4g+IkhmpXdOiRPKQAC2Th
         4v4ixWNg/xWvLAZAm3LU/tPJrtiIgSlNr+Tm2Y/a4clksRJIMK3K9M+Rk2B92zctKVYG
         0rFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768206369; x=1768811169;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2tN6b+lbrWfZ7oxTxnv+TGwJvGYGk587gJwGFobI+w=;
        b=D08BcWw4CB1OwjH4+8S1qcUR443NeS6ACa0D3LvjIeErxLcoK424scH2ni85Yq7Q6f
         qiSVKJeIec90tbr/1DRFC7d0UcQ6WDa/vS1dMWYjwRoAy66lmXUbAWleglJDsVebFrUD
         19hIdThIgBTlCF+LFneo8Xe/kierveilzVtlz+RNjnKyuz3C+XS9sQq/6RD+cumja5IE
         BSSLigcBrMJ7fd7MUtgz6SAh5aG3X0V6cOviVSl63k1I8SpLZAG+ESrdriXn0ug4Ft1z
         eBegUZ+XImpIEU9617uM0rvLwA2owReIrZrVTzVrgtckJvTVHLz301xCShW7sUEUAyxg
         6+tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX+adJ/1GoENe570nrWLUPYFC0XdCVyyp80jUeLFRvSPwXUHreiqtpa4zekdmC+tui62hAE5PGol5u671I@vger.kernel.org
X-Gm-Message-State: AOJu0YxQqdZ+YbZKWT4EZpUAe59iqIC1rdeXmbOlk4Rjr2b3SWvCapXN
	VNi6gGos+yfkztHu74DQCtrNoMH+d7gnOvXI88O3xbP8gluoG9YI2Pj4fwNzzXoYS8s=
X-Gm-Gg: AY/fxX5aLJej5buKcLQUrjj0y4ifUsOSReFci6+ACfVWXMxW0qswbx4BME7oahfPn1e
	A6B60Wo3eo2Hw2r8aKOldV0kqllbftBTlOYuvdtN2++ZF2in/b2xEOrWgwQeGT3JCeYSaCw6Ci8
	BJL4RnO5lUKg4CXrsJuXEld9HCtcifwMdoOt+PROYQZh3EzIJfSqrXUqtDiQn5xmE0nCFWc+XDg
	q9TUtvUrWU2aK/khmqa7x/qR9G0mF3ZucjZaSFWeVt04PW6+aOir0bTyFL+c4VnD64acpPLx1zu
	Z7RRGEvxEzisMt20C4xQss2S0keJy7sv508RxBAbxncSlKfBf2nL63CKKAAohlKZXdNMEOpZKV9
	u9n9vzwl8BNDBfouHRQ+GvaYQVvCiA1eQV/fcFyJD+X4hUg3Z3gdTtHegvMxJG+xad4FZVpc65b
	6221kAjGz+pQX9atFykx1lAWjRH9HVqaUOZRj58tO0JU7y1H3GeR0vhj++2k88fhQ=
X-Google-Smtp-Source: AGHT+IEHe//EMfbw9CmlUYlXkRTQIfxEKVLk8LbEc0vmw0imeAGWpvdjD+oOFjRIpcjB4QO1aoBseQ==
X-Received: by 2002:a05:600c:8b43:b0:479:1ac2:f9b8 with SMTP id 5b1f17b1804b1-47d84b33b7bmr196273835e9.21.1768206368719;
        Mon, 12 Jan 2026 00:26:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:2842:da44:d7db:b175? ([2a01:e0a:3d9:2080:2842:da44:d7db:b175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8661caffsm123763705e9.5.2026.01.12.00.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 00:26:08 -0800 (PST)
Message-ID: <543d9e55-c858-40f9-8785-c9f636850120@linaro.org>
Date: Mon, 12 Jan 2026 09:26:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: milos: Add UFS nodes
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
 <20260107-milos-ufs-v1-5-6982ab20d0ac@fairphone.com>
 <2486dc4b-71f3-4cd9-8139-b397407d7e4d@linaro.org>
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
In-Reply-To: <2486dc4b-71f3-4cd9-8139-b397407d7e4d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/7/26 14:53, Neil Armstrong wrote:
> Hi,
> 
> On 1/7/26 09:05, Luca Weiss wrote:
>> Add the nodes for the UFS PHY and UFS host controller, along with the
>> ICE used for UFS.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>   arch/arm64/boot/dts/qcom/milos.dtsi | 127 +++++++++++++++++++++++++++++++++++-
>>   1 file changed, 124 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
>> index e1a51d43943f..0f69deabb60c 100644
>> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
>> @@ -797,9 +797,9 @@ gcc: clock-controller@100000 {
>>                    <&sleep_clk>,
>>                    <0>, /* pcie_0_pipe_clk */
>>                    <0>, /* pcie_1_pipe_clk */
>> -                 <0>, /* ufs_phy_rx_symbol_0_clk */
>> -                 <0>, /* ufs_phy_rx_symbol_1_clk */
>> -                 <0>, /* ufs_phy_tx_symbol_0_clk */
>> +                 <&ufs_mem_phy 0>,
>> +                 <&ufs_mem_phy 1>,
>> +                 <&ufs_mem_phy 2>,
>>                    <0>; /* usb3_phy_wrapper_gcc_usb30_pipe_clk */
>>               #clock-cells = <1>;
>> @@ -1151,6 +1151,127 @@ aggre2_noc: interconnect@1700000 {
>>               qcom,bcm-voters = <&apps_bcm_voter>;
>>           };
>> +        ufs_mem_phy: phy@1d80000 {
>> +            compatible = "qcom,milos-qmp-ufs-phy";
>> +            reg = <0x0 0x01d80000 0x0 0x2000>;
>> +
>> +            clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +                 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>> +                 <&tcsr TCSR_UFS_CLKREF_EN>;
>> +            clock-names = "ref",
>> +                      "ref_aux",
>> +                      "qref";
>> +
>> +            resets = <&ufs_mem_hc 0>;
>> +            reset-names = "ufsphy";
>> +
>> +            power-domains = <&gcc UFS_MEM_PHY_GDSC>;
>> +
>> +            #clock-cells = <1>;
>> +            #phy-cells = <0>;
>> +
>> +            status = "disabled";
>> +        };
>> +
>> +        ufs_mem_hc: ufshc@1d84000 {
>> +            compatible = "qcom,milos-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
>> +            reg = <0x0 0x01d84000 0x0 0x3000>;
>> +
>> +            interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
>> +
>> +            clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
>> +                 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
>> +                 <&gcc GCC_UFS_PHY_AHB_CLK>,
>> +                 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
>> +                 <&tcsr TCSR_UFS_PAD_CLKREF_EN>,
>> +                 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
>> +                 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
>> +                 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
>> +            clock-names = "core_clk",
>> +                      "bus_aggr_clk",
>> +                      "iface_clk",
>> +                      "core_clk_unipro",
>> +                      "ref_clk",
>> +                      "tx_lane0_sync_clk",
>> +                      "rx_lane0_sync_clk",
>> +                      "rx_lane1_sync_clk";
>> +
>> +            resets = <&gcc GCC_UFS_PHY_BCR>;
>> +            reset-names = "rst";
>> +
>> +            interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
>> +                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +                    <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +                     &cnoc_cfg SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
>> +            interconnect-names = "ufs-ddr",
>> +                         "cpu-ufs";
>> +
>> +            power-domains = <&gcc UFS_PHY_GDSC>;
>> +            required-opps = <&rpmhpd_opp_nom>;
>> +
>> +            operating-points-v2 = <&ufs_opp_table>;
>> +
>> +            iommus = <&apps_smmu 0x60 0>;
> 
> dma-coherent ?
> 
> and no MCQ support ?

So, people just ignore my comment ?

Milos is based on SM8550, so it should have dma-coherent, for the MCQ
I hope they used the fixed added to the SM8650 UFS controller for MCQ.

Neil

> 
> <snip>
> 
> Thanks,
> Neil


