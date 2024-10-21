Return-Path: <linux-arm-msm+bounces-35243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D0E9A6818
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 14:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 344761F258EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14361F4FB1;
	Mon, 21 Oct 2024 12:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dh4EBEmj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B631F1316
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 12:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729513309; cv=none; b=On94lLMD8x1fAlzMXRKmU2dPVhrfIu1PaeABNd7w1KEJYegsDZ21bBIoE1KjZMp3lyNaoV3bjU6uVF1Xjo/XGoTbRLPA8W1GgVpAmZRHkD0Tl/oBRiT0/WRTL1inuj5P+PaIW75fiD/9a/D+qJbiidyXoFTDnAepJoXEYGbG+dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729513309; c=relaxed/simple;
	bh=WZlxIaormjNBAmpVA3OSHxhEAdbnXU/CxUaZ0vpsPt8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=R5UMTXcwK7ozH7Rvj43RybE7j+laj1R68e5dJ9KmwVt+AfZ2h886fz9NHkeKKklpc0QVLaEvf7lUl9XDf5g3oWzS1t9mGYJ4SCr5QdYy9Tmi+Q8F3I/CRsITvxhJtUoJb4IK7qYoKpCl6ho/D/x61tfi6FNrvhsTV1j50elbhdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dh4EBEmj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so30569315e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 05:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729513306; x=1730118106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8PXh0dAOwDKmgSRcSg3e05JHCblzWTRNfVzKItfysk=;
        b=Dh4EBEmjf8s+EsHG5pZmzJa1h13FUJYaG44bVZiEIsu1PgT3TAObAeEHVXiXrCg2Ee
         m5CgtbKv2C7x1gKQ+jnKVfnbEBylIzzbTvLoj1h8HTqZ7tFU+/uHmEKgUiwFH4j8Av21
         3wBgPjSluiaPnChc6RDPtyYftuc9+oT4aOi45IqKzGSjjyT4LUFzCDGlByatGzabC1o5
         GypieX4Zd/4GHKjbhLoqscc+PodHZ/T0zNjJmNbi6c+0exBx33asN2sxBVg5NtqoX4az
         c9ksrn6jFYubtZvP68PMXjkq3SP0jfjBvhfjUpVIJX6KHREV7motmMtmlX7lt8GlZ6Ok
         002w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729513306; x=1730118106;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L8PXh0dAOwDKmgSRcSg3e05JHCblzWTRNfVzKItfysk=;
        b=ngI10b6GU4pE9uxdbNdvHeTI5qER/yZHsfhCumWUSYz06aKxs2QHN3atowTtv3Jj5/
         64PxuooAJ4IVEnJIP15PIdh6XHPcvRwi1govbqtF3RiLHW0QLGtoVFJ/W+E4iZgWNkVU
         DkkeqWpoXDXxESFFK9YDL1gQbmdMKJGi5qYb7MG5YVk6owIWWRVRaQpZgl0smcD2IbQh
         tg6/KX1JdRaBWJyNsNuqyE3tbIYHHI+ZhFtqnzPHzE0Tu8f0SpQuHKMOTRoC0yDwXM6J
         Dv3yb6MYt/vbRhjUawTebyGwMk11u77UjamzAxFkY7QBIlkd6Bu+Dwf3fD24fVCcF1BJ
         pilA==
X-Forwarded-Encrypted: i=1; AJvYcCXTi+Ugz9KWh1VpcGGGxGN541sId7t7gOUJXQBEQsMiwknmVCpUsSYkRyNGALWzgRW3jZW64lmxCJVc5bXA@vger.kernel.org
X-Gm-Message-State: AOJu0YzF0iRV+MpBjQpqUdiwA+xwTkeUk36OehEa1A+v/fiGHmGcKNOp
	f4trwHkhZIADqdXiJFI1L5cBEWSYpXPVJQLHEhxiOnEr193QNiZq0n66dDQ854w=
X-Google-Smtp-Source: AGHT+IHkCdDLs8a3oPYVJ00k2pUqgkYfiwWhPd4FYGvTMUrxEd+Of4MdGYYoSjjW2mKfmtYrwxqvxg==
X-Received: by 2002:a05:600c:34cc:b0:431:5d89:6465 with SMTP id 5b1f17b1804b1-43161697980mr86968265e9.34.1729513305634;
        Mon, 21 Oct 2024 05:21:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3908:dea6:2ddd:be97? ([2a01:e0a:982:cbb0:3908:dea6:2ddd:be97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5cc921sm55374295e9.46.2024.10.21.05.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 05:21:45 -0700 (PDT)
Message-ID: <efdcdd4b-c5ca-42cc-beed-e92201bc07e9@linaro.org>
Date: Mon, 21 Oct 2024 14:21:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 4/6] phy: qualcomm: qmp-pcie: split PCS_LANE1 region
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241021-sar2130p-phys-v2-0-d883acf170f7@linaro.org>
 <20241021-sar2130p-phys-v2-4-d883acf170f7@linaro.org>
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
In-Reply-To: <20241021-sar2130p-phys-v2-4-d883acf170f7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/10/2024 12:33, Dmitry Baryshkov wrote:
> The PCS_LANE1 region isn't a part of the PCS_PCIE region. It was handled
> this way as it simplified handled of devices with the old bindings.
> Nowadays it can be handled as is, without hacks.
> 
> Split the PCS_LANE1 region from the PCS_PCIE / PCS_MISC region space.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 32 ++++++++++++++++++----
>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4_20.h |  5 ++--
>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |  5 ++--
>   3 files changed, 33 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 873f2f9844c66d7bd0b3bb3ab4bbd8be9a37cebd..1ca1f21b1cc225f435da9c775c97dfa142117f95 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -1773,7 +1773,7 @@ static const struct qmp_phy_init_tbl sdx55_qmp_pcie_rc_pcs_misc_tbl[] = {
>   	QMP_PHY_INIT_CFG(QPHY_V4_20_PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
>   };
>   
> -static const struct qmp_phy_init_tbl sdx55_qmp_pcie_ep_pcs_misc_tbl[] = {
> +static const struct qmp_phy_init_tbl sdx55_qmp_pcie_ep_pcs_lane1_tbl[] = {
>   	QMP_PHY_INIT_CFG(QPHY_V4_20_PCS_LANE1_INSIG_SW_CTRL2, 0x00),
>   	QMP_PHY_INIT_CFG(QPHY_V4_20_PCS_LANE1_INSIG_MX_CTRL2, 0x00),
>   };
> @@ -1907,6 +1907,9 @@ static const struct qmp_phy_init_tbl sdx65_qmp_pcie_pcs_misc_tbl[] = {
>   	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_G4_EQ_CONFIG2, 0x0d),
>   	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_G4_EQ_CONFIG5, 0x02),
>   	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_G4_PRE_GAIN, 0x2e),
> +};
> +
> +static const struct qmp_phy_init_tbl sdx65_qmp_pcie_pcs_lane1_tbl[] = {
>   	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_LANE1_INSIG_SW_CTRL2, 0x00),
>   	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_LANE1_INSIG_MX_CTRL2, 0x00),
>   };
> @@ -2582,8 +2585,6 @@ static const struct qmp_phy_init_tbl sa8775p_qmp_gen4_pcie_rc_pcs_misc_tbl[] = {
>   static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x2_pcie_pcs_alt_tbl[] = {
>   	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_EQ_CONFIG4, 0x16),
>   	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_EQ_CONFIG5, 0x22),
> -	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_LANE1_INSIG_SW_CTRL2, 0x00),
> -	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_LANE1_INSIG_MX_CTRL2, 0x00),
>   	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_G3S2_PRE_GAIN, 0x2e),
>   	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_RX_SIGDET_LVL, 0x66),
>   };
> @@ -2728,6 +2729,7 @@ struct qmp_pcie_offsets {
>   	u16 serdes;
>   	u16 pcs;
>   	u16 pcs_misc;
> +	u16 pcs_lane1;
>   	u16 tx;
>   	u16 rx;
>   	u16 tx2;
> @@ -2752,6 +2754,8 @@ struct qmp_phy_cfg_tbls {
>   	int pcs_num;
>   	const struct qmp_phy_init_tbl *pcs_misc;
>   	int pcs_misc_num;
> +	const struct qmp_phy_init_tbl *pcs_lane1;
> +	int pcs_lane1_num;
>   	const struct qmp_phy_init_tbl *ln_shrd;
>   	int ln_shrd_num;
>   };
> @@ -2811,6 +2815,7 @@ struct qmp_pcie {
>   	void __iomem *serdes;
>   	void __iomem *pcs;
>   	void __iomem *pcs_misc;
> +	void __iomem *pcs_lane1;
>   	void __iomem *tx;
>   	void __iomem *rx;
>   	void __iomem *tx2;
> @@ -2927,6 +2932,7 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v4_20 = {
>   	.serdes		= 0x1000,
>   	.pcs		= 0x1200,
>   	.pcs_misc	= 0x1600,
> +	.pcs_lane1	= 0x1e00,
>   	.tx		= 0x0000,
>   	.rx		= 0x0200,
>   	.tx2		= 0x0800,
> @@ -2957,6 +2963,7 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_20 = {
>   	.serdes		= 0x1000,
>   	.pcs		= 0x1200,
>   	.pcs_misc	= 0x1400,
> +	.pcs_lane1	= 0x1e00,
>   	.tx		= 0x0000,
>   	.rx		= 0x0200,
>   	.tx2		= 0x0800,
> @@ -3440,8 +3447,8 @@ static const struct qmp_phy_cfg sdx55_qmp_pciephy_cfg = {
>   	.tbls_ep = &(const struct qmp_phy_cfg_tbls) {
>   		.serdes		= sdx55_qmp_pcie_ep_serdes_tbl,
>   		.serdes_num	= ARRAY_SIZE(sdx55_qmp_pcie_ep_serdes_tbl),
> -		.pcs_misc	= sdx55_qmp_pcie_ep_pcs_misc_tbl,
> -		.pcs_misc_num	= ARRAY_SIZE(sdx55_qmp_pcie_ep_pcs_misc_tbl),
> +		.pcs_lane1	= sdx55_qmp_pcie_ep_pcs_lane1_tbl,
> +		.pcs_lane1_num	= ARRAY_SIZE(sdx55_qmp_pcie_ep_pcs_lane1_tbl),
>   	},
>   
>   	.reset_list		= sdm845_pciephy_reset_l,
> @@ -3540,6 +3547,8 @@ static const struct qmp_phy_cfg sdx65_qmp_pciephy_cfg = {
>   			.pcs_num        = ARRAY_SIZE(sdx65_qmp_pcie_pcs_tbl),
>   			.pcs_misc       = sdx65_qmp_pcie_pcs_misc_tbl,
>   			.pcs_misc_num   = ARRAY_SIZE(sdx65_qmp_pcie_pcs_misc_tbl),
> +			.pcs_lane1       = sdx65_qmp_pcie_pcs_lane1_tbl,
> +			.pcs_lane1_num   = ARRAY_SIZE(sdx65_qmp_pcie_pcs_lane1_tbl),
>   		},
>   	.reset_list             = sdm845_pciephy_reset_l,
>   	.num_resets             = ARRAY_SIZE(sdm845_pciephy_reset_l),
> @@ -3739,6 +3748,8 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x2_pciephy_cfg = {
>   		.pcs_num		= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_pcs_alt_tbl),
>   		.pcs_misc		= sa8775p_qmp_gen4_pcie_pcs_misc_tbl,
>   		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_misc_tbl),
> +		.pcs_lane1	= sdx65_qmp_pcie_pcs_lane1_tbl,
> +		.pcs_lane1_num	= ARRAY_SIZE(sdx65_qmp_pcie_pcs_lane1_tbl),
>   	},
>   
>   	.tbls_rc = &(const struct qmp_phy_cfg_tbls) {
> @@ -3945,6 +3956,7 @@ static void qmp_pcie_init_registers(struct qmp_pcie *qmp, const struct qmp_phy_c
>   	void __iomem *rx2 = qmp->rx2;
>   	void __iomem *pcs = qmp->pcs;
>   	void __iomem *pcs_misc = qmp->pcs_misc;
> +	void __iomem *pcs_lane1 = qmp->pcs_lane1;
>   	void __iomem *ln_shrd = qmp->ln_shrd;
>   
>   	if (!tbls)
> @@ -3969,6 +3981,7 @@ static void qmp_pcie_init_registers(struct qmp_pcie *qmp, const struct qmp_phy_c
>   
>   	qmp_configure(qmp->dev, pcs, tbls->pcs, tbls->pcs_num);
>   	qmp_configure(qmp->dev, pcs_misc, tbls->pcs_misc, tbls->pcs_misc_num);
> +	qmp_configure(qmp->dev, pcs_lane1, tbls->pcs_lane1, tbls->pcs_lane1_num);
>   
>   	if (cfg->lanes >= 4 && qmp->tcsr_4ln_config) {
>   		qmp_configure(qmp->dev, serdes, cfg->serdes_4ln_tbl,
> @@ -4420,6 +4433,14 @@ static int qmp_pcie_parse_dt_legacy(struct qmp_pcie *qmp, struct device_node *np
>   		}
>   	}
>   
> +	/*
> +	 * For all platforms where legacy bindings existed, PCS_LANE1 was
> +	 * mapped as a part of the PCS_MISC region.
> +	 */
> +	if (!IS_ERR(qmp->pcs_misc) && cfg->offsets->pcs_lane1 != 0)
> +		qmp->pcs_lane1 = qmp->pcs_misc +
> +			(cfg->offsets->pcs_lane1 - cfg->offsets->pcs_misc);
> +
>   	clk = devm_get_clk_from_child(dev, np, NULL);
>   	if (IS_ERR(clk)) {
>   		return dev_err_probe(dev, PTR_ERR(clk),
> @@ -4487,6 +4508,7 @@ static int qmp_pcie_parse_dt(struct qmp_pcie *qmp)
>   	qmp->serdes = base + offs->serdes;
>   	qmp->pcs = base + offs->pcs;
>   	qmp->pcs_misc = base + offs->pcs_misc;
> +	qmp->pcs_lane1 = base + offs->pcs_lane1;
>   	qmp->tx = base + offs->tx;
>   	qmp->rx = base + offs->rx;
>   
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4_20.h
> index ac872a9eff9a8fe7fc3307759288aee15d17bd24..ab892d1067c219e8db0ba0591921b38a9cebebe7 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4_20.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4_20.h
> @@ -13,7 +13,8 @@
>   #define QPHY_V4_20_PCS_PCIE_G4_RXEQEVAL_TIME		0x0f4
>   #define QPHY_V4_20_PCS_PCIE_G4_EQ_CONFIG2		0x0fc
>   #define QPHY_V4_20_PCS_PCIE_G4_EQ_CONFIG5		0x108
> -#define QPHY_V4_20_PCS_LANE1_INSIG_SW_CTRL2		0x824
> -#define QPHY_V4_20_PCS_LANE1_INSIG_MX_CTRL2		0x828
> +
> +#define QPHY_V4_20_PCS_LANE1_INSIG_SW_CTRL2		0x024
> +#define QPHY_V4_20_PCS_LANE1_INSIG_MX_CTRL2		0x028
>   
>   #endif
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
> index cdf8c04ea078a985be82d561ad0918dfdece9987..283d63c8159338b57a5026b6c2a86e3cce21097c 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
> @@ -17,7 +17,8 @@
>   #define QPHY_V5_20_PCS_PCIE_G4_EQ_CONFIG5		0x108
>   #define QPHY_V5_20_PCS_PCIE_G4_PRE_GAIN			0x15c
>   #define QPHY_V5_20_PCS_PCIE_RX_MARGINING_CONFIG3	0x184
> -#define QPHY_V5_20_PCS_LANE1_INSIG_SW_CTRL2		0xa24
> -#define QPHY_V5_20_PCS_LANE1_INSIG_MX_CTRL2		0xa28
> +
> +#define QPHY_V5_20_PCS_LANE1_INSIG_SW_CTRL2		0x024
> +#define QPHY_V5_20_PCS_LANE1_INSIG_MX_CTRL2		0x028
>   
>   #endif
> 

Looks good

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

