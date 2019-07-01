Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36F435C12B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 18:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728568AbfGAQfF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 12:35:05 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57392 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727782AbfGAQfF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 12:35:05 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 563D1609CD; Mon,  1 Jul 2019 16:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561998903;
        bh=jZp0t/cawdeTmQZClVIxAeCh2F6TIuiqyuk74l+7jXQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iNpgrhSiTtGl9QjXUT8+MK7TUzPIaInmDgN7skl0BZM9usWZ94s7zO1NB3lZZNRNJ
         BFwko82NZrGKpUbwuK5+yTktB5f7Scuv0oNNFHFsAfsO3ZKLE5eVWBRczpMWT2I/Q1
         rs4mc8VGRcl0HHFIYIOxeGzaWxgyURUc+3Ay2r2k=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DEE53602EF;
        Mon,  1 Jul 2019 16:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561998900;
        bh=jZp0t/cawdeTmQZClVIxAeCh2F6TIuiqyuk74l+7jXQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BhjpE3eAcf9BYJMMSWU+zoZlCxpJkzyJHDtIaIIGyt8pgfULdrUCWtNys711kEfrx
         OnFdB5QfIoN2k3PKa1gBhvxwSb+8tn9nyQmt9VnYCVTxl6/W/GxKeZ2UIMUgAkvQsY
         T8qhMs9oBAW5u4OR+lWjBmyn9EyDATVl0BpofSrc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DEE53602EF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 1 Jul 2019 10:34:57 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Mack <daniel@zonque.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] gpu: Use dev_get_drvdata()
Message-ID: <20190701163456.GA10188@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Fuqian Huang <huangfq.daxian@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Mack <daniel@zonque.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20190701032245.25906-1-huangfq.daxian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701032245.25906-1-huangfq.daxian@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 01, 2019 at 11:22:35AM +0800, Fuqian Huang wrote:
> Using dev_get_drvdata directly.

msm parts LGTM.  If you split the patches feel free to add my

Acked-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c      |  6 ++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c         | 13 +++++--------
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c        |  6 ++----
>  drivers/gpu/drm/msm/dsi/dsi_host.c              |  6 ++----
>  drivers/gpu/drm/msm/msm_drv.c                   |  3 +--
>  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 15 +++++----------
>  drivers/gpu/drm/panfrost/panfrost_device.c      |  6 ++----
>  7 files changed, 19 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index b3deb346a42b..fafd00d2574a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -403,16 +403,14 @@ static const struct of_device_id dt_match[] = {
>  #ifdef CONFIG_PM
>  static int adreno_resume(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct msm_gpu *gpu = platform_get_drvdata(pdev);
> +	struct msm_gpu *gpu = dev_get_drvdata(dev);
>  
>  	return gpu->funcs->pm_resume(gpu);
>  }
>  
>  static int adreno_suspend(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct msm_gpu *gpu = platform_get_drvdata(pdev);
> +	struct msm_gpu *gpu = dev_get_drvdata(dev);
>  
>  	return gpu->funcs->pm_suspend(gpu);
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ae885e5dd07d..6c6f8ca9380f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1025,16 +1025,15 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>  
>  static void dpu_unbind(struct device *dev, struct device *master, void *data)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
> +	struct dpu_kms *dpu_kms = dev_get_drvdata(dev);
>  	struct dss_module_power *mp = &dpu_kms->mp;
>  
>  	msm_dss_put_clk(mp->clk_config, mp->num_clk);
> -	devm_kfree(&pdev->dev, mp->clk_config);
> +	devm_kfree(dev, mp->clk_config);
>  	mp->num_clk = 0;
>  
>  	if (dpu_kms->rpm_enabled)
> -		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_disable(dev);
>  }
>  
>  static const struct component_ops dpu_ops = {
> @@ -1056,8 +1055,7 @@ static int dpu_dev_remove(struct platform_device *pdev)
>  static int __maybe_unused dpu_runtime_suspend(struct device *dev)
>  {
>  	int rc = -1;
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
> +	struct dpu_kms *dpu_kms = dev_get_drvdata(dev);
>  	struct drm_device *ddev;
>  	struct dss_module_power *mp = &dpu_kms->mp;
>  
> @@ -1077,8 +1075,7 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
>  static int __maybe_unused dpu_runtime_resume(struct device *dev)
>  {
>  	int rc = -1;
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
> +	struct dpu_kms *dpu_kms = dev_get_drvdata(dev);
>  	struct drm_encoder *encoder;
>  	struct drm_device *ddev;
>  	struct dss_module_power *mp = &dpu_kms->mp;
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 901009e1f219..25d1ebb32e73 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -1052,8 +1052,7 @@ static int mdp5_dev_remove(struct platform_device *pdev)
>  
>  static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
> +	struct mdp5_kms *mdp5_kms = dev_get_drvdata(dev);
>  
>  	DBG("");
>  
> @@ -1062,8 +1061,7 @@ static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
>  
>  static __maybe_unused int mdp5_runtime_resume(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
> +	struct mdp5_kms *mdp5_kms = dev_get_drvdata(dev);
>  
>  	DBG("");
>  
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index dbf490176c2c..882f13725819 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -477,8 +477,7 @@ static void dsi_bus_clk_disable(struct msm_dsi_host *msm_host)
>  
>  int msm_dsi_runtime_suspend(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct msm_dsi *msm_dsi = platform_get_drvdata(pdev);
> +	struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
>  	struct mipi_dsi_host *host = msm_dsi->host;
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  
> @@ -492,8 +491,7 @@ int msm_dsi_runtime_suspend(struct device *dev)
>  
>  int msm_dsi_runtime_resume(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct msm_dsi *msm_dsi = platform_get_drvdata(pdev);
> +	struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
>  	struct mipi_dsi_host *host = msm_dsi->host;
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index f38d7367bd3b..0d9e46561609 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -241,8 +241,7 @@ static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
>  
>  static int msm_drm_uninit(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct drm_device *ddev = platform_get_drvdata(pdev);
> +	struct drm_device *ddev = dev_get_drvdata(dev);
>  	struct msm_drm_private *priv = ddev->dev_private;
>  	struct msm_kms *kms = priv->kms;
>  	struct msm_mdss *mdss = priv->mdss;
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index 8edef8ef23b0..53240da139b1 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -407,8 +407,7 @@ static const struct backlight_ops dsicm_bl_ops = {
>  static ssize_t dsicm_num_errors_show(struct device *dev,
>  		struct device_attribute *attr, char *buf)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
> +	struct panel_drv_data *ddata = dev_get_drvdata(dev);
>  	struct omap_dss_device *src = ddata->src;
>  	u8 errors = 0;
>  	int r;
> @@ -439,8 +438,7 @@ static ssize_t dsicm_num_errors_show(struct device *dev,
>  static ssize_t dsicm_hw_revision_show(struct device *dev,
>  		struct device_attribute *attr, char *buf)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
> +	struct panel_drv_data *ddata = dev_get_drvdata(dev);
>  	struct omap_dss_device *src = ddata->src;
>  	u8 id1, id2, id3;
>  	int r;
> @@ -506,8 +504,7 @@ static ssize_t dsicm_show_ulps(struct device *dev,
>  		struct device_attribute *attr,
>  		char *buf)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
> +	struct panel_drv_data *ddata = dev_get_drvdata(dev);
>  	unsigned int t;
>  
>  	mutex_lock(&ddata->lock);
> @@ -521,8 +518,7 @@ static ssize_t dsicm_store_ulps_timeout(struct device *dev,
>  		struct device_attribute *attr,
>  		const char *buf, size_t count)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
> +	struct panel_drv_data *ddata = dev_get_drvdata(dev);
>  	struct omap_dss_device *src = ddata->src;
>  	unsigned long t;
>  	int r;
> @@ -553,8 +549,7 @@ static ssize_t dsicm_show_ulps_timeout(struct device *dev,
>  		struct device_attribute *attr,
>  		char *buf)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
> +	struct panel_drv_data *ddata = dev_get_drvdata(dev);
>  	unsigned int t;
>  
>  	mutex_lock(&ddata->lock);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index 3b2bced1b015..ed187648e6d8 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -227,8 +227,7 @@ const char *panfrost_exception_name(struct panfrost_device *pfdev, u32 exception
>  #ifdef CONFIG_PM
>  int panfrost_device_resume(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct panfrost_device *pfdev = platform_get_drvdata(pdev);
> +	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>  
>  	panfrost_gpu_soft_reset(pfdev);
>  
> @@ -243,8 +242,7 @@ int panfrost_device_resume(struct device *dev)
>  
>  int panfrost_device_suspend(struct device *dev)
>  {
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct panfrost_device *pfdev = platform_get_drvdata(pdev);
> +	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>  
>  	if (!panfrost_job_is_idle(pfdev))
>  		return -EBUSY;
> -- 
> 2.11.0
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
