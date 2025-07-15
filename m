Return-Path: <linux-arm-msm+bounces-65057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B16ECB0618E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 16:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0D691C82618
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 14:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFEF2248B5;
	Tue, 15 Jul 2025 14:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="EDaNcNLd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DA41FF1B4;
	Tue, 15 Jul 2025 14:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752590134; cv=none; b=OVsQ0NjinU65lmQbovJZb6nzsmpPTdbJLwYnY5CEY0ve/BLAV6h6UL+J33m8AjWw+lHerZhgd6zksPvc7Lkl3umcijiIasdQuqpc1QtFYOQMueBfdBkCRO9l1vlg9qvVdAqCim/SCMydXlEWuT5wYBMP5L1QHdExBfTbQ4cuEzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752590134; c=relaxed/simple;
	bh=dgu36HNp6Ey5tbWJzea7xTs+Q7Z2LXx/xuvpNQ1pA7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XFLV8SeGAcEyEUxXjxLR8ywrUkflVF66YumYWtEgqDzvb7JkPH/4wdHX3f80TqY1FuvTrXJJycaO+S1pdtNhJrPWC3/KfnTjxHQOh08rYLX06lWPZkxYU/BTv0Yvs9Hj+eyhpGEQnG9ivLxOl9jJ0av54RwzQBqMRS87XFo2+2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=EDaNcNLd; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FE4gGV025660;
	Tue, 15 Jul 2025 16:34:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	dgu36HNp6Ey5tbWJzea7xTs+Q7Z2LXx/xuvpNQ1pA7w=; b=EDaNcNLd5XIOq7Sr
	WEFVM9cWVQkLDtI+tD5DoTxUM1/PjExjGSx895DC4+l386R7fL28nPGPptNoSqxq
	eAdz2y9fmkQPer6/hLzzgavwPgIVa+JQIJbEd2TgJiw2sMrN3uCfIma3AeiVT9+y
	GKX/c3E236Qy1buK2A4KGTLtvfS5A0A9SI+WYNctil/EZO1NOz59AVfITTfdHEHc
	xZZL0kRPox+X+93cIKfd+woucWbm2t4V3Ecc6BfuuUZBQMZy7qhUG7ZnWmvUrscN
	6rWp21CgMYxQ+5IhN3Lzaq1gzMSuLq6lcYk1SnIt2d1VE1Enh8n7zGKsmnWkq6tp
	muaJoA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47ud4mp9pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 16:34:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B01FE40045;
	Tue, 15 Jul 2025 16:31:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E1DE1BAFFBB;
	Tue, 15 Jul 2025 16:29:28 +0200 (CEST)
Received: from [10.130.74.78] (10.130.74.78) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 16:29:27 +0200
Message-ID: <1df0432a-b950-4baf-93f1-25ced11ab243@foss.st.com>
Date: Tue, 15 Jul 2025 16:29:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/stm/dw_mipi_dsi-stm: convert from round_rate() to
 determine_rate()
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
        Pengutronix
 Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Clark
	<robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav
 Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang
	<jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
        <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-sunxi@lists.linux.dev>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-6-601b9ea384c3@redhat.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-6-601b9ea384c3@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-15_01,2025-03-28_01



On 7/10/25 19:43, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Hi Brian,

Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

Thanks !

Best regards,
Raphaël


