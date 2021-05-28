Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F232394914
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 May 2021 01:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhE1XQm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 19:16:42 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:34437 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhE1XQm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 19:16:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622243706; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=azlKBw4uANFk+nlXTFfIkpbn40olsiMC97YLg2B3820=;
 b=Fog8IT7OOz9ePS7QAZ2iAu7bAtDxATnZOBNyLgyaWg7MNMmC3S4ctFiP5Gy+TDbp3VFKA9cZ
 Gjfr+iJWglbuXFaXZ47Dzzl4yHH8+tC8VD6IqMCx46Ad7Lzh0+GKc0L8mj8aCU9yBVrqv55a
 m6eGo9iG2ZgMUZTbhLqprPd6PA4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60b17975e27c0cc77f094f56 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 28 May 2021 23:15:01
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BCCE1C4323A; Fri, 28 May 2021 23:15:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1EB86C433D3;
        Fri, 28 May 2021 23:14:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 28 May 2021 16:14:59 -0700
From:   abhinavk@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>, sbillaka@codeaurora.org,
        Tanmay Shah <tanmay@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno@lists.freedesktop.org,
        Chandan Uddaraju <chandanu@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 2/4] drm/msm/dp: Store each subblock in the io
 region
In-Reply-To: <20210511042043.592802-3-bjorn.andersson@linaro.org>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
 <20210511042043.592802-3-bjorn.andersson@linaro.org>
Message-ID: <0a2e38497feb4b6904f5e5bc3ed43c62@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-10 21:20, Bjorn Andersson wrote:
> Not all platforms has DP_P0 at offset 0x1000 from the beginning of the
> DP block. So move the offsets into dss_io_data, to make it possible in
> the next patch to specify alternative offsets and sizes of these
> segments.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 57 ++++++++---------------------
>  drivers/gpu/drm/msm/dp/dp_parser.c  | 10 +++++
>  drivers/gpu/drm/msm/dp/dp_parser.h  |  8 ++++
>  3 files changed, 33 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
> b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 2eb37ee48e42..a0449a2867e4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -24,15 +24,6 @@
>  #define DP_INTERRUPT_STATUS_ACK_SHIFT	1
>  #define DP_INTERRUPT_STATUS_MASK_SHIFT	2
> 
> -#define MSM_DP_CONTROLLER_AHB_OFFSET	0x0000
> -#define MSM_DP_CONTROLLER_AHB_SIZE	0x0200
> -#define MSM_DP_CONTROLLER_AUX_OFFSET	0x0200
> -#define MSM_DP_CONTROLLER_AUX_SIZE	0x0200
> -#define MSM_DP_CONTROLLER_LINK_OFFSET	0x0400
> -#define MSM_DP_CONTROLLER_LINK_SIZE	0x0C00
> -#define MSM_DP_CONTROLLER_P0_OFFSET	0x1000
> -#define MSM_DP_CONTROLLER_P0_SIZE	0x0400
> -
>  #define DP_INTERRUPT_STATUS1 \
>  	(DP_INTR_AUX_I2C_DONE| \
>  	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
> @@ -64,75 +55,67 @@ struct dp_catalog_private {
> 
>  static inline u32 dp_read_aux(struct dp_catalog_private *catalog, u32 
> offset)
>  {
> -	offset += MSM_DP_CONTROLLER_AUX_OFFSET;
> -	return readl_relaxed(catalog->io->dp_controller.base + offset);
> +	return readl_relaxed(catalog->io->dp_controller.aux + offset);
>  }
> 
>  static inline void dp_write_aux(struct dp_catalog_private *catalog,
>  			       u32 offset, u32 data)
>  {
> -	offset += MSM_DP_CONTROLLER_AUX_OFFSET;
>  	/*
>  	 * To make sure aux reg writes happens before any other operation,
>  	 * this function uses writel() instread of writel_relaxed()
>  	 */
> -	writel(data, catalog->io->dp_controller.base + offset);
> +	writel(data, catalog->io->dp_controller.aux + offset);
>  }
> 
>  static inline u32 dp_read_ahb(struct dp_catalog_private *catalog, u32 
> offset)
>  {
> -	offset += MSM_DP_CONTROLLER_AHB_OFFSET;
> -	return readl_relaxed(catalog->io->dp_controller.base + offset);
> +	return readl_relaxed(catalog->io->dp_controller.ahb + offset);
>  }
> 
>  static inline void dp_write_ahb(struct dp_catalog_private *catalog,
>  			       u32 offset, u32 data)
>  {
> -	offset += MSM_DP_CONTROLLER_AHB_OFFSET;
>  	/*
>  	 * To make sure phy reg writes happens before any other operation,
>  	 * this function uses writel() instread of writel_relaxed()
>  	 */
> -	writel(data, catalog->io->dp_controller.base + offset);
> +	writel(data, catalog->io->dp_controller.ahb + offset);
>  }
> 
>  static inline void dp_write_p0(struct dp_catalog_private *catalog,
>  			       u32 offset, u32 data)
>  {
> -	offset += MSM_DP_CONTROLLER_P0_OFFSET;
>  	/*
>  	 * To make sure interface reg writes happens before any other 
> operation,
>  	 * this function uses writel() instread of writel_relaxed()
>  	 */
> -	writel(data, catalog->io->dp_controller.base + offset);
> +	writel(data, catalog->io->dp_controller.p0 + offset);
>  }
> 
>  static inline u32 dp_read_p0(struct dp_catalog_private *catalog,
>  			       u32 offset)
>  {
> -	offset += MSM_DP_CONTROLLER_P0_OFFSET;
>  	/*
>  	 * To make sure interface reg writes happens before any other 
> operation,
>  	 * this function uses writel() instread of writel_relaxed()
>  	 */
> -	return readl_relaxed(catalog->io->dp_controller.base + offset);
> +	return readl_relaxed(catalog->io->dp_controller.p0 + offset);
>  }
> 
>  static inline u32 dp_read_link(struct dp_catalog_private *catalog, u32 
> offset)
>  {
> -	offset += MSM_DP_CONTROLLER_LINK_OFFSET;
> -	return readl_relaxed(catalog->io->dp_controller.base + offset);
> +	return readl_relaxed(catalog->io->dp_controller.link + offset);
>  }
> 
>  static inline void dp_write_link(struct dp_catalog_private *catalog,
>  			       u32 offset, u32 data)
>  {
> -	offset += MSM_DP_CONTROLLER_LINK_OFFSET;
>  	/*
>  	 * To make sure link reg writes happens before any other operation,
>  	 * this function uses writel() instread of writel_relaxed()
>  	 */
> -	writel(data, catalog->io->dp_controller.base + offset);
> +	writel(data, catalog->io->dp_controller.link + offset);
>  }
> 
>  /* aux related catalog functions */
> @@ -267,29 +250,21 @@ static void dump_regs(void __iomem *base, int 
> len)
> 
>  void dp_catalog_dump_regs(struct dp_catalog *dp_catalog)
>  {
> -	u32 offset, len;
>  	struct dp_catalog_private *catalog = container_of(dp_catalog,
>  		struct dp_catalog_private, dp_catalog);
> +	struct dss_io_data *io = &catalog->io->dp_controller;
> 
>  	pr_info("AHB regs\n");
> -	offset = MSM_DP_CONTROLLER_AHB_OFFSET;
> -	len = MSM_DP_CONTROLLER_AHB_SIZE;
> -	dump_regs(catalog->io->dp_controller.base + offset, len);
> +	dump_regs(io->ahb, io->ahb_len);
> 
>  	pr_info("AUXCLK regs\n");
> -	offset = MSM_DP_CONTROLLER_AUX_OFFSET;
> -	len = MSM_DP_CONTROLLER_AUX_SIZE;
> -	dump_regs(catalog->io->dp_controller.base + offset, len);
> +	dump_regs(io->aux, io->aux_len);
> 
>  	pr_info("LCLK regs\n");
> -	offset = MSM_DP_CONTROLLER_LINK_OFFSET;
> -	len = MSM_DP_CONTROLLER_LINK_SIZE;
> -	dump_regs(catalog->io->dp_controller.base + offset, len);
> +	dump_regs(io->link, io->link_len);
> 
>  	pr_info("P0CLK regs\n");
> -	offset = MSM_DP_CONTROLLER_P0_OFFSET;
> -	len = MSM_DP_CONTROLLER_P0_SIZE;
> -	dump_regs(catalog->io->dp_controller.base + offset, len);
> +	dump_regs(io->p0, io->p0_len);
>  }
> 
>  int dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog)
> @@ -454,8 +429,7 @@ int dp_catalog_ctrl_set_pattern(struct dp_catalog
> *dp_catalog,
>  	bit = BIT(pattern - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
> 
>  	/* Poll for mainlink ready status */
> -	ret = readx_poll_timeout(readl, catalog->io->dp_controller.base +
> -					MSM_DP_CONTROLLER_LINK_OFFSET +
> +	ret = readx_poll_timeout(readl, catalog->io->dp_controller.link +
>  					REG_DP_MAINLINK_READY,
>  					data, data & bit,
>  					POLLING_SLEEP_US, POLLING_TIMEOUT_US);
> @@ -502,8 +476,7 @@ bool dp_catalog_ctrl_mainlink_ready(struct
> dp_catalog *dp_catalog)
>  				struct dp_catalog_private, dp_catalog);
> 
>  	/* Poll for mainlink ready status */
> -	ret = readl_poll_timeout(catalog->io->dp_controller.base +
> -				MSM_DP_CONTROLLER_LINK_OFFSET +
> +	ret = readl_poll_timeout(catalog->io->dp_controller.link +
>  				REG_DP_MAINLINK_READY,
>  				data, data & DP_MAINLINK_READY_FOR_VIDEO,
>  				POLLING_SLEEP_US, POLLING_TIMEOUT_US);
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c
> b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 0519dd3ac3c3..51ec85b4803b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -250,6 +250,7 @@ static int dp_parser_clock(struct dp_parser 
> *parser)
> 
>  static int dp_parser_parse(struct dp_parser *parser)
>  {
> +	struct dss_io_data *io = &parser->io.dp_controller;
>  	int rc = 0;
> 
>  	if (!parser) {
> @@ -275,6 +276,15 @@ static int dp_parser_parse(struct dp_parser 
> *parser)
>  	 */
>  	parser->regulator_cfg = &sdm845_dp_reg_cfg;
> 
> +	io->ahb = io->base + 0x0;
> +	io->ahb_len = 0x200;
> +	io->aux = io->base + 0x200;
> +	io->aux_len = 0x200;
> +	io->link = io->base + 0x400;
> +	io->link_len = 0x600;
> +	io->p0 = io->base + 0x1000;
> +	io->p0_len = 0x400;
> +
>  	return 0;
>  }
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h
> b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 34b49628bbaf..ff4774109c63 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -28,6 +28,14 @@ enum dp_pm_type {
>  struct dss_io_data {
>  	u32 len;
>  	void __iomem *base;
> +	void __iomem *ahb;
> +	size_t ahb_len;
> +	void __iomem *aux;
> +	size_t aux_len;
> +	void __iomem *link;
> +	size_t link_len;
> +	void __iomem *p0;
> +	size_t p0_len;
>  };
> 
>  static inline const char *dp_parser_pm_name(enum dp_pm_type module)
