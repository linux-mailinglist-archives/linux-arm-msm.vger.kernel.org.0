Return-Path: <linux-arm-msm+bounces-70112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D1BB2F442
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 11:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAD5B3B9600
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 09:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E682D9ED8;
	Thu, 21 Aug 2025 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="x54WHZWt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9191DF74F;
	Thu, 21 Aug 2025 09:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755769215; cv=none; b=f5RXo6tgRaV07xYzbFw4RQjhU6mUPlV27A27/OO+iR2E5bqbFlf0K/GGz3titHPF8IzfphuqC3U1K78I++vtcwC+7xdg62xOGfgQkQeJw6px0fPUSV2Q8L50DwZC6QfGYNpjJha9YJhtzcDbszWMskIlf4SfTs4ClhYqAITpCrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755769215; c=relaxed/simple;
	bh=fW45PNHK/J993qQlytHQ9XXEMMWn/NrRcHqFiD5whj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=j8UY+b6SLq8dBIlVIUynUIOpfqaqQJ4cCiDi7G6srzUK8Q8sxtsasl8HdqKwA+hLGkEzAKTLl7bJ7PaVtu1n7WZ+DrGFY4yjwL49Zsv0Wbsl5rh4BNWK8WfK7d2q+hn93PqdVL6+ppXZo/69aZOhffkvyAZX5+h+jpKlzkcTYTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=x54WHZWt; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L8uf03028719;
	Thu, 21 Aug 2025 11:39:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	kHxcorhp5czLlBBNNIvPxeZEYbfShmd+8rRbKqHVLQc=; b=x54WHZWtHoVtnKSh
	GwXIq32qEehSt5QN4pnCvtl8/TiFHUGkCVxLDpTAaQktot64B36wulxk1ei+r5EB
	q4oJU0m5ApNcrcGtHJTtGKf8JmVGtpf2P+Nqv7T7elfSWoaqyewnWBbT/y30hkyM
	QztQ5odjdA0mMraCkgbl+w7JGJlgWV4xAyEG9fI/kLcwVxziU/qGhGPxTAw20d6i
	hM/4vG1IQ1AxUrf3PLjbdmzhAQKlbABlritN7UG4B85uzMmfNcd9IrPQzWD/XlfS
	/PHF7fjxPPYQDRwv1ACERxT7tPpV8bBLheQgLG2lpZ+jXslc/76fxC3S4Xlo4gTt
	cUUJxA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n81wnyun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 11:39:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 50FE64002D;
	Thu, 21 Aug 2025 11:36:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3FF873DB4E;
	Thu, 21 Aug 2025 11:35:26 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 11:35:25 +0200
Message-ID: <ea6b8999-4f5d-4cc2-b92b-b0776c2b1363@foss.st.com>
Date: Thu, 21 Aug 2025 11:35:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/stm/dw_mipi_dsi-stm: convert from round_rate()
 to determine_rate()
To: Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Shawn Guo
	<shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "Pengutronix
 Kernel Team" <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Clark
	<robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        "Abhinav
 Kumar" <abhinav.kumar@linux.dev>,
        Jessica Zhang
	<jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Raphael Gallais-Pou
	<raphael.gallais-pou@foss.st.com>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai
	<wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland
	<samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-sunxi@lists.linux.dev>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
 <20250811-drm-clk-round-rate-v2-6-4a91ccf239cf@redhat.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-6-4a91ccf239cf@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01

Hi Brian,

thanks for the patch.

Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>

Le 11/08/2025 à 12:56, Brian Masney a écrit :
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> index 2c7bc064bc66c6a58903a207cbe8091a14231c2b..58eae6804cc82d174323744206be7046568b905c 100644
> --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> @@ -274,8 +274,8 @@ static unsigned long dw_mipi_dsi_clk_recalc_rate(struct clk_hw *hw,
>   	return (unsigned long)pll_out_khz * 1000;
>   }
>   
> -static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> -				       unsigned long *parent_rate)
> +static int dw_mipi_dsi_clk_determine_rate(struct clk_hw *hw,
> +					  struct clk_rate_request *req)
>   {
>   	struct dw_mipi_dsi_stm *dsi = clk_to_dw_mipi_dsi_stm(hw);
>   	unsigned int idf, ndiv, odf, pll_in_khz, pll_out_khz;
> @@ -283,14 +283,14 @@ static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>   
>   	DRM_DEBUG_DRIVER("\n");
>   
> -	pll_in_khz = (unsigned int)(*parent_rate / 1000);
> +	pll_in_khz = (unsigned int)(req->best_parent_rate / 1000);
>   
>   	/* Compute best pll parameters */
>   	idf = 0;
>   	ndiv = 0;
>   	odf = 0;
>   
> -	ret = dsi_pll_get_params(dsi, pll_in_khz, rate / 1000,
> +	ret = dsi_pll_get_params(dsi, pll_in_khz, req->rate / 1000,
>   				 &idf, &ndiv, &odf);
>   	if (ret)
>   		DRM_WARN("Warning dsi_pll_get_params(): bad params\n");
> @@ -298,7 +298,9 @@ static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>   	/* Get the adjusted pll out value */
>   	pll_out_khz = dsi_pll_get_clkout_khz(pll_in_khz, idf, ndiv, odf);
>   
> -	return pll_out_khz * 1000;
> +	req->rate = pll_out_khz * 1000;
> +
> +	return 0;
>   }
>   
>   static int dw_mipi_dsi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -351,7 +353,7 @@ static const struct clk_ops dw_mipi_dsi_stm_clk_ops = {
>   	.disable = dw_mipi_dsi_clk_disable,
>   	.is_enabled = dw_mipi_dsi_clk_is_enabled,
>   	.recalc_rate = dw_mipi_dsi_clk_recalc_rate,
> -	.round_rate = dw_mipi_dsi_clk_round_rate,
> +	.determine_rate = dw_mipi_dsi_clk_determine_rate,
>   	.set_rate = dw_mipi_dsi_clk_set_rate,
>   };
>   
>

