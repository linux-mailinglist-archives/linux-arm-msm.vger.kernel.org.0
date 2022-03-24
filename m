Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 175C84E6640
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Mar 2022 16:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351237AbiCXPqk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Mar 2022 11:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344411AbiCXPqk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Mar 2022 11:46:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D8D2A72D;
        Thu, 24 Mar 2022 08:45:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 67866B82407;
        Thu, 24 Mar 2022 15:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E38CC340ED;
        Thu, 24 Mar 2022 15:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648136705;
        bh=W0ujt+uG7tz/cIu1lu+5YA1hm5s0h2ZhoEP/N2GqCNM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TQh+1RpC7VntD7RlSC5lAgWlzPhTHIAkGED39r+s/JdbooGd8ji13vIJB03pDmxkh
         Fd8GqQz/ZfGHH6K+fds7hOrn3/PMlTlJQPrPhhPLypqP+RjZK6nxfOgICOC1it3YZw
         uZ2mrkFT9b3HQpYSyAM1X72krcAWAg9HFmxgKexrJW+eS5ICZ3LlxREsM5ErvDIZBv
         9FdqXZX7JOgBdihel1e/F9rWyOx0Sr1YF02M36e3u7bBe4eoBrdmGpoXluAcqVH0R/
         8Z/9Tna+AxpxzMG53tnDFBBxs0nW6n4PLrAUzcw4ptpiOPAdaZZIWKHjwiSd9l5YHh
         B4Qhic+fWJoXw==
Date:   Thu, 24 Mar 2022 21:15:00 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [REPOST PATCH v4 13/13] drm/msm/dsi: Add support for DSC
 configuration
Message-ID: <YjyR/LrBeXeVd2J3@matsya>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-14-vkoul@kernel.org>
 <977340f4-1a5d-a103-4669-ab0168df8cd6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <977340f4-1a5d-a103-4669-ab0168df8cd6@linaro.org>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-02-22, 05:11, Dmitry Baryshkov wrote:
> On 10/02/2022 13:34, Vinod Koul wrote:
> > When DSC is enabled, we need to configure DSI registers accordingly and
> > configure the respective stream compression registers.
> > 
> > Add support to calculate the register setting based on DSC params and
> > timing information and configure these registers.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >   drivers/gpu/drm/msm/dsi/dsi.xml.h  |  10 +++
> >   drivers/gpu/drm/msm/dsi/dsi_host.c | 109 ++++++++++++++++++++++++++++-
> >   2 files changed, 118 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> > index 49b551ad1bff..c1c85df58c4b 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> > +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> > @@ -706,4 +706,14 @@ static inline uint32_t DSI_VERSION_MAJOR(uint32_t val)
> >   #define REG_DSI_CPHY_MODE_CTRL					0x000002d4
> > +#define REG_DSI_VIDEO_COMPRESSION_MODE_CTRL			0x0000029c
> > +
> > +#define REG_DSI_VIDEO_COMPRESSION_MODE_CTRL2			0x000002a0
> > +
> > +#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL			0x000002a4
> > +
> > +#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2			0x000002a8
> > +
> > +#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL3			0x000002ac
> > +
> >   #endif /* DSI_XML */
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > index 438c80750682..3d8d5a1daaa3 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -908,6 +908,20 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
> >   		dsi_write(msm_host, REG_DSI_CPHY_MODE_CTRL, BIT(0));
> >   }
> > +static int dsi_dsc_update_pic_dim(struct msm_display_dsc_config *dsc,
> > +				  int pic_width, int pic_height)
> > +{
> > +	if (!dsc || !pic_width || !pic_height) {
> > +		pr_err("DSI: invalid input: pic_width: %d pic_height: %d\n", pic_width, pic_height);
> > +		return -EINVAL;
> > +	}
> > +
> > +	dsc->drm->pic_width = pic_width;
> > +	dsc->drm->pic_height = pic_height;
> > +
> > +	return 0;
> > +}
> > +
> >   static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >   {
> >   	struct drm_display_mode *mode = msm_host->mode;
> > @@ -940,7 +954,68 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >   		hdisplay /= 2;
> >   	}
> > +	if (msm_host->dsc) {
> > +		struct msm_display_dsc_config *dsc = msm_host->dsc;
> > +
> > +		/* update dsc params with timing params */
> > +		dsi_dsc_update_pic_dim(dsc, mode->hdisplay, mode->vdisplay);
> > +		DBG("Mode Width- %d x Height %d\n", dsc->drm->pic_width, dsc->drm->pic_height);
> > +
> > +		/* we do the calculations for dsc parameters here so that
> > +		 * panel can use these parameters
> > +		 */
> > +		dsi_populate_dsc_params(dsc);
> > +
> > +		/* Divide the display by 3 but keep back/font porch and
> > +		 * pulse width same
> > +		 */
> > +		h_total -= hdisplay;
> > +		hdisplay /= 3;
> > +		h_total += hdisplay;
> > +		ha_end = ha_start + hdisplay;
> > +	}
> > +
> >   	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
> > +		if (msm_host->dsc) {
> > +			struct msm_display_dsc_config *dsc = msm_host->dsc;
> > +			u32 reg, intf_width, slice_per_intf;
> > +			u32 total_bytes_per_intf;
> > +
> > +			/* first calculate dsc parameters and then program
> > +			 * compress mode registers
> > +			 */
> > +			intf_width = hdisplay;
> > +			slice_per_intf = DIV_ROUND_UP(intf_width, dsc->drm->slice_width);
> > +
> > +			dsc->drm->slice_count = 1;
> > +			dsc->bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width * 8, 8);
> > +			total_bytes_per_intf = dsc->bytes_in_slice * slice_per_intf;
> > +
> > +			dsc->eol_byte_num = total_bytes_per_intf % 3;
> > +			dsc->pclk_per_line =  DIV_ROUND_UP(total_bytes_per_intf, 3);
> > +			dsc->bytes_per_pkt = dsc->bytes_in_slice * dsc->drm->slice_count;
> > +			dsc->pkt_per_line = slice_per_intf / dsc->drm->slice_count;
> > +
> > +			reg = dsc->bytes_per_pkt << 16;
> > +			reg |= (0x0b << 8);    /* dtype of compressed image */
> > +
> > +			/* pkt_per_line:
> > +			 * 0 == 1 pkt
> > +			 * 1 == 2 pkt
> > +			 * 2 == 4 pkt
> > +			 * 3 pkt is not supported
> > +			 * above translates to ffs() - 1
> > +			 */
> > +			reg |= (ffs(dsc->pkt_per_line) - 1) << 6;
> > +
> > +			dsc->eol_byte_num = total_bytes_per_intf % 3;
> > +			reg |= dsc->eol_byte_num << 4;
> > +			reg |= 1;
> > +
> > +			dsi_write(msm_host,
> > +				  REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
> > +		}
> > +
> >   		dsi_write(msm_host, REG_DSI_ACTIVE_H,
> >   			DSI_ACTIVE_H_START(ha_start) |
> >   			DSI_ACTIVE_H_END(ha_end));
> > @@ -959,8 +1034,40 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >   			DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
> >   			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
> >   	} else {		/* command mode */
> > +		if (msm_host->dsc) {
> > +			struct msm_display_dsc_config *dsc = msm_host->dsc;
> > +			u32 reg, reg_ctrl, reg_ctrl2;
> > +			u32 slice_per_intf, bytes_in_slice, total_bytes_per_intf;
> > +
> > +			reg_ctrl = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
> > +			reg_ctrl2 = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
> > +
> > +			slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->drm->slice_width);
> > +			bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width *
> > +						      dsc->drm->bits_per_pixel, 8);
> > +			dsc->drm->slice_chunk_size = bytes_in_slice;
> > +			total_bytes_per_intf = dsc->bytes_in_slice * slice_per_intf;
> 
> Should we use dsc->bytes_in_slice or just bytes_in_slice here?

This should be dsc->bytes_in_slice, fixed up now. Thanks for pointing

-- 
~Vinod
