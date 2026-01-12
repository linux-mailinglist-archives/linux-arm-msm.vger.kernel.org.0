Return-Path: <linux-arm-msm+bounces-88571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91967D12B0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 14:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E40D330262A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 13:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26E6358D07;
	Mon, 12 Jan 2026 13:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ONUb602Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2E43587BC
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768223335; cv=none; b=UPIx8Kuj7SshFUdMn42OmdgOLhZyKmdTzadlotFZlSs/1L1wFn2+pY/KcQJDX5i9MYytgPbSW4KRi0J2K9n1lCK2a0aKYCap8mfezEn0W/uzn8epHhlGOTFmRJI1xM756o9h5wyC3RlmwGp+i99h4OOrjaUzc0TE9NbQ2ClEqoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768223335; c=relaxed/simple;
	bh=YTVkCN24/ARJNxBRMbLG2byyse7jCJp1KD9YVEJe7fg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YGp2m3C76IYYgmIoVZkaBhYrifa36KflvUtgrSsvWnwrAALIRAGCjZnTlA8VdrLgRETYmgA4e+nyoaF2I2WWKNGKwDwv3XEfP+8v2WCY/RY8RDaFB+yi5ksf7z9Io5CauEa7hbP4OVYa+cfs8srH8YEctsknZwSTPHvN568co3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ONUb602Q; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso58439255e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 05:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768223331; x=1768828131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BF9HRCZwVM8HohHOVVmaFmMZoI1kBoRSnqS8ZzxwdRQ=;
        b=ONUb602QVTxB0uTYiPCiU6+kXahVGELlLm3CowLbvvfwCD5mCGdVTasZm5O1ldbT2C
         VGcxR4itUDFm6VeSBgxaf1gwxRXDJZZOPNgqJVdDeZlW7C2FuPA0mkYYYmhrSrrNLL2e
         pRKlwPbOSJCgX76N3tQHSjy1+Dcv8453zZp7Y5YxFqeT3T23c3yGhynXocuH3wminpVk
         PjcmmS2VDK7AFoZCPAUQ76XDNVz+vdz0LL4ME5MRWbHT0q1KZWuAIJkLclzBM/rRVcOX
         qG8Z6e1sSzpsblBKsVFMJFZM6i7s8AWDfwo0qOLwX3uhplET2h6JPy8BiZxzCMLEmgeq
         QGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768223331; x=1768828131;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BF9HRCZwVM8HohHOVVmaFmMZoI1kBoRSnqS8ZzxwdRQ=;
        b=rqW3oIIfo7ICXjTc0dfIrh98V3ljx/a85CtJn4HSaN3UGp6Se7F3AemfhXKiR/7LqQ
         w1pBjlXziKaq3DD+MLy8jhUlUcdb7B0F9lXi7wS5r1bznYPh9WO6TOXgXTS6uhKWdcs4
         n+f1RVhbgBWSSaZu2S8GI2H3B4rtxFXW2t2WLbJnYE7ZGxVyzskgq7tdtznmFk6shcuJ
         x5sh4zrA8RPZkqMAtdwHwjmzSfaXm7XGD8h85a5HPZBIE4g48jdk5fBIKiw+i1qmRKHY
         vHADIKDdR86u3HrmRjxvvO8krlKdDLQDOMsHfnIYdZ+Mniblcmv72I8u/zbJi3yrSD7z
         N/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVYLhzNVavVP47uZPkkbONOLwxU3pyb6x0t2+cTEXeZyI4I/wm4CRwbN0PWUpZhNTHgfKSeExN5LlO0Es1k@vger.kernel.org
X-Gm-Message-State: AOJu0YzTaWl75h0im5nL/Pokkv0kNnWMQYFFAsYwjh4IfKp9aIp3D0KJ
	rkK8ttrI8iV89u77+d0SGKA0y7lg6kVoNGrfRnMCyyR8vhALgCI7PSATHqId0fYo5E0=
X-Gm-Gg: AY/fxX4kl/K91vvgI0R1fHgWtBW+A49jpCDjGtSYAY7dhks8V31dn5u1KyGwUjOF0eR
	qZrL5sesiIHD4yxoN+Tp6os8305Rdai1TXiaMzRhnbPjKSf2SszoZHsby/1wnYsIAkPZYTaOcBb
	80EfLiC2X9ehAjgLlYVBCu6/5H8nqoPNSqRGTB62zxy8OSzxHt3sBhXlX4MinmT34jFo/AEZ4J6
	Cr4Ry0ysu8hN58CH3Xb+UYlUtGDhvDmP++c/W2AUT7oPXHXigAva2DkQ13alG1Uk5syYDWJOq7f
	PNmwpB9b6ckNPTflj01KOBWuJNpeXyl9OOk6Y2boa3mut5fva8/tvtzX9VL4L3YhZGVPzrD/HtN
	XVl1y3eGvk09WZ+mc0rULJympN+tmc1QXI/DnYU5rKtJ5FKsL9w+zS9o7h58FqJZCxG0npic8Fd
	tdQmIm6vp1ltxtHQ0T0c2U5vWsBT52Mb6Z/5hMbtE=
X-Google-Smtp-Source: AGHT+IEtO2xzsh2F6bjVyeH53ljL8NiwROmn+6MmXlos+dptQWGriTYDZzCaDlYWz//1QpK6zSKEIg==
X-Received: by 2002:a05:600c:3110:b0:479:3a86:dc1a with SMTP id 5b1f17b1804b1-47d84b41176mr203344865e9.36.1768223331152;
        Mon, 12 Jan 2026 05:08:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080::fa42:7768? ([2a01:e0a:3d9:2080::fa42:7768])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5fe67csm38528840f8f.40.2026.01.12.05.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 05:08:50 -0800 (PST)
Message-ID: <99ec09fa-b4e3-4f68-9980-a3dfb81635e8@linaro.org>
Date: Mon, 12 Jan 2026 14:08:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: milos: Add UFS nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Luca Weiss <luca.weiss@fairphone.com>,
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
 <543d9e55-c858-40f9-8785-c9f636850120@linaro.org>
 <DFMH8W40TCJ0.XCTHNRJFJE4T@fairphone.com>
 <ccbaff51-d7fa-4b22-8d4e-02bea5d8a529@oss.qualcomm.com>
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
In-Reply-To: <ccbaff51-d7fa-4b22-8d4e-02bea5d8a529@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/12/26 11:29, Konrad Dybcio wrote:
> On 1/12/26 9:45 AM, Luca Weiss wrote:
>> Hi Neil,
>>
>> On Mon Jan 12, 2026 at 9:26 AM CET, Neil Armstrong wrote:
>>> On 1/7/26 14:53, Neil Armstrong wrote:
>>>> Hi,
>>>>
>>>> On 1/7/26 09:05, Luca Weiss wrote:
>>>>> Add the nodes for the UFS PHY and UFS host controller, along with the
>>>>> ICE used for UFS.
>>>>>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/milos.dtsi | 127 +++++++++++++++++++++++++++++++++++-
>>>>>    1 file changed, 124 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
>>>>> index e1a51d43943f..0f69deabb60c 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
>>>>> @@ -797,9 +797,9 @@ gcc: clock-controller@100000 {
>>>>>                     <&sleep_clk>,
>>>>>                     <0>, /* pcie_0_pipe_clk */
>>>>>                     <0>, /* pcie_1_pipe_clk */
>>>>> -                 <0>, /* ufs_phy_rx_symbol_0_clk */
>>>>> -                 <0>, /* ufs_phy_rx_symbol_1_clk */
>>>>> -                 <0>, /* ufs_phy_tx_symbol_0_clk */
>>>>> +                 <&ufs_mem_phy 0>,
>>>>> +                 <&ufs_mem_phy 1>,
>>>>> +                 <&ufs_mem_phy 2>,
>>>>>                     <0>; /* usb3_phy_wrapper_gcc_usb30_pipe_clk */
>>>>>                #clock-cells = <1>;
>>>>> @@ -1151,6 +1151,127 @@ aggre2_noc: interconnect@1700000 {
>>>>>                qcom,bcm-voters = <&apps_bcm_voter>;
>>>>>            };
>>>>> +        ufs_mem_phy: phy@1d80000 {
>>>>> +            compatible = "qcom,milos-qmp-ufs-phy";
>>>>> +            reg = <0x0 0x01d80000 0x0 0x2000>;
>>>>> +
>>>>> +            clocks = <&rpmhcc RPMH_CXO_CLK>,
>>>>> +                 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>>>>> +                 <&tcsr TCSR_UFS_CLKREF_EN>;
>>>>> +            clock-names = "ref",
>>>>> +                      "ref_aux",
>>>>> +                      "qref";
>>>>> +
>>>>> +            resets = <&ufs_mem_hc 0>;
>>>>> +            reset-names = "ufsphy";
>>>>> +
>>>>> +            power-domains = <&gcc UFS_MEM_PHY_GDSC>;
>>>>> +
>>>>> +            #clock-cells = <1>;
>>>>> +            #phy-cells = <0>;
>>>>> +
>>>>> +            status = "disabled";
>>>>> +        };
>>>>> +
>>>>> +        ufs_mem_hc: ufshc@1d84000 {
>>>>> +            compatible = "qcom,milos-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
>>>>> +            reg = <0x0 0x01d84000 0x0 0x3000>;
>>>>> +
>>>>> +            interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
>>>>> +
>>>>> +            clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
>>>>> +                 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
>>>>> +                 <&gcc GCC_UFS_PHY_AHB_CLK>,
>>>>> +                 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
>>>>> +                 <&tcsr TCSR_UFS_PAD_CLKREF_EN>,
>>>>> +                 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
>>>>> +                 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
>>>>> +                 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
>>>>> +            clock-names = "core_clk",
>>>>> +                      "bus_aggr_clk",
>>>>> +                      "iface_clk",
>>>>> +                      "core_clk_unipro",
>>>>> +                      "ref_clk",
>>>>> +                      "tx_lane0_sync_clk",
>>>>> +                      "rx_lane0_sync_clk",
>>>>> +                      "rx_lane1_sync_clk";
>>>>> +
>>>>> +            resets = <&gcc GCC_UFS_PHY_BCR>;
>>>>> +            reset-names = "rst";
>>>>> +
>>>>> +            interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
>>>>> +                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>>>> +                    <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>>>>> +                     &cnoc_cfg SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
>>>>> +            interconnect-names = "ufs-ddr",
>>>>> +                         "cpu-ufs";
>>>>> +
>>>>> +            power-domains = <&gcc UFS_PHY_GDSC>;
>>>>> +            required-opps = <&rpmhpd_opp_nom>;
>>>>> +
>>>>> +            operating-points-v2 = <&ufs_opp_table>;
>>>>> +
>>>>> +            iommus = <&apps_smmu 0x60 0>;
>>>>
>>>> dma-coherent ?
>>
>>
>> Given that downstream volcano.dtsi has dma-coherent in the ufshc@1d84000
>> node, looks like this is missing in my patch.
> 
> Seems that way
> 
>>>>
>>>> and no MCQ support ?
>>
>> Not sure, I could only find one reference to MCQ on createpoint for
>> milos, but given there's no mcq_sqd/mcq_vs reg defined downstream, and I
>> couldn't find anything for the same register values in the .FLAT file, I
>> don't think Milos has MCQ? Feel free to prove me wrong though.
>>
>>>
>>> So, people just ignore my comment ?
>>>
>>> Milos is based on SM8550, so it should have dma-coherent, for the MCQ
>>> I hope they used the fixed added to the SM8650 UFS controller for MCQ.
>>
>> Not sure what this should mean regarding MCQ...
> 
> This platform doesn't support MCQ

Ack, it must be same situation as Kailua then,

Thanks
Neil

> 
> Konrad


