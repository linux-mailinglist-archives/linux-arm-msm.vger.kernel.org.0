Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39D031F3323
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 06:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726848AbgFIEe0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 00:34:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:58284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726449AbgFIEeZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 00:34:25 -0400
Received: from localhost (unknown [122.171.156.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9883B2086A;
        Tue,  9 Jun 2020 04:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591677265;
        bh=I6qdniaTIXZUfVcuKwGH7IbkkD0WGORJPBa+sQm3yRs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ooUKtRhEDl8AqOXVXsq282jUBF1yIR/gaOAD7X31cgAYORgvcm+T+bnzYwesYxCJO
         dqVvDmb+47Svl5hxA0dSF9Dn4IGf05uhwmgGLeH6/AJnQDiDrKpVrHCh9SKWaRxj/9
         scgBMmjImxWhQgEENEoubn5YObdSM/6dZrjYgoBw=
Date:   Tue, 9 Jun 2020 10:04:20 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     alsa-devel@alsa-project.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] soundwire: qcom: add support for mmio soundwire
 devices
Message-ID: <20200609043420.GA1084979@vkoul-mobl>
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608204347.19685-3-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jonathan,

On 08-06-20, 16:43, Jonathan Marek wrote:
> Adds support for qcom soundwire devices with memory mapped IO registers.

Please use 'SoundWire Master devices' instead :)

> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/soundwire/qcom.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index f38d1fd3679f..628747df1c75 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -90,6 +90,7 @@ struct qcom_swrm_ctrl {
>  	struct sdw_bus bus;
>  	struct device *dev;
>  	struct regmap *regmap;
> +	void __iomem *mmio;
>  	struct completion *comp;
>  	struct work_struct slave_work;
>  	/* read/write lock */
> @@ -154,6 +155,20 @@ static int qcom_swrm_ahb_reg_write(struct qcom_swrm_ctrl *ctrl,
>  	return SDW_CMD_OK;
>  }
>  
> +static int qcom_swrm_cpu_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
> +				  u32 *val)
> +{
> +	*val = readl(ctrl->mmio + reg);
> +	return SDW_CMD_OK;
> +}
> +
> +static int qcom_swrm_cpu_reg_write(struct qcom_swrm_ctrl *ctrl, int reg,
> +				   int val)
> +{
> +	writel(val, ctrl->mmio + reg);
> +	return SDW_CMD_OK;
> +}

this looks fine but regmap supports mmio also, so I am thinking we
should remove these and set regmap (mmio/slim)... Srini..?

-- 
~Vinod
