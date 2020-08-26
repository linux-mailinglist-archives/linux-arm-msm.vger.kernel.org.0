Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D80AC2525CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 05:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgHZDhf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 23:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgHZDhd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 23:37:33 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C31C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 20:37:32 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id k20so430652otr.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 20:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vxm806OK1qT4rz/cJFxTxFe4mzMGtSheZzPPycHL8Oc=;
        b=YWU68lJ0LeeD2IDp1keXs5IJvZq4mBhvlKcuX95taXgL5v13MCHGTcmxxET3P9+dsF
         /jkV2fNGrRTfQ/dgJvZHBVJHmJslLeEXfRp5TeQV/gNTE8RlLGfTVKCJOsgB13zI0B6K
         VrTMF7dT0N8omzprUP5JvKnUeQSFtjnA8u0C6patm8PMEheo0BpKBcfYMOvajozP6JFN
         5f9tfSfsjnT6YIvXZp1IQ9Zm2xGz4Nx9VussciSWm27SpxAaeLQgETJxskNt5A8wx0zi
         FUptsSA/F6ROxIz2BkQEHLn3643K820RPDGN5VqXYy6gKWC2RtHZ+dWKuv6xmRXh4F6L
         iXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vxm806OK1qT4rz/cJFxTxFe4mzMGtSheZzPPycHL8Oc=;
        b=ouAL9FMTRszAysRZ+O0yFkmzB5DRgJRB139cJWMoOaxDUOQ8U8ydPfVWb+CR2Jmblp
         scn6MV9E+0znEpaXcM0EkUpkEtqKoGy0pquzBXC5z5ZKVgFWjnviznZMjxUoa8J6moO/
         TpJuGnJj2u2hkbq7iBkoL8wdvUR49MkhHuGMQHpx49Ky7xLpctSjc4AKVaKxYcL79wXT
         tbVGf+PNZynXLWIuZhkoYTVlOjRTlgWM4sz8qPqV+FuugLBI4wsVVQ+qXNquBP/QWHLn
         SugNQUpAbYmuKAVLt73S4Y3cbnHwH1FR3ay+Wpt0cFc3+Xdk/qi2W0v0XeVirI+TKauB
         e/wA==
X-Gm-Message-State: AOAM531BjlmlbjMkmgtKKCk8n3Pxaltj19q82E3cR19iiUOXzrlbMvY9
        OQnIn382wVVmbOjmXJP9Iw8xqA==
X-Google-Smtp-Source: ABdhPJwMIR0mvWjiDK7RvpESanSt0/D2qNDzWyXZClrSwaog6P0tT2m2biZgHNJRYNj/fv1eZoF22A==
X-Received: by 2002:a05:6830:1259:: with SMTP id s25mr9399554otp.203.1598413051473;
        Tue, 25 Aug 2020 20:37:31 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id p189sm236625oia.18.2020.08.25.20.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 20:37:30 -0700 (PDT)
Date:   Tue, 25 Aug 2020 22:37:28 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v1 2/9] phy: qcom-qmp: Move phy mode into struct qmp_phy
Message-ID: <20200826033728.GD3715@yoga>
References: <20200826024711.220080-1-swboyd@chromium.org>
 <20200826024711.220080-3-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826024711.220080-3-swboyd@chromium.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 25 Aug 21:47 CDT 2020, Stephen Boyd wrote:

> The phy mode pertains to the phy itself, i.e. 'struct qmp_phy', not the
> wrapper, i.e. 'struct qcom_qmp'. Move the phy mode into the phy
> structure to more accurately reflect what is going on. This also cleans
> up 'struct qcom_qmp' so that it can eventually be the place where qmp
> wrapper wide data is located, paving the way for the USB3+DP combo phy.
> 
> Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: Vara Reddy <varar@codeaurora.org>
> Cc: Tanmay Shah <tanmay@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Cc: Manu Gautam <mgautam@codeaurora.org>
> Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Jonathan Marek <jonathan@marek.ca>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 562053ce9455..7ee9e966dc6d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -1812,6 +1812,7 @@ struct qmp_phy_cfg {
>   * @index: lane index
>   * @qmp: QMP phy to which this lane belongs
>   * @lane_rst: lane's reset controller
> + * @mode: current PHY mode
>   */
>  struct qmp_phy {
>  	struct phy *phy;
> @@ -1825,6 +1826,7 @@ struct qmp_phy {
>  	unsigned int index;
>  	struct qcom_qmp *qmp;
>  	struct reset_control *lane_rst;
> +	enum phy_mode mode;
>  };
>  
>  /**
> @@ -1843,7 +1845,6 @@ struct qmp_phy {
>   * @phy_mutex: mutex lock for PHY common block initialization
>   * @init_count: phy common block initialization count
>   * @phy_initialized: indicate if PHY has been initialized
> - * @mode: current PHY mode
>   * @ufs_reset: optional UFS PHY reset handle
>   */
>  struct qcom_qmp {
> @@ -1861,7 +1862,6 @@ struct qcom_qmp {
>  	struct mutex phy_mutex;
>  	int init_count;
>  	bool phy_initialized;
> -	enum phy_mode mode;
>  
>  	struct reset_control *ufs_reset;
>  };
> @@ -2801,9 +2801,8 @@ static int qcom_qmp_phy_set_mode(struct phy *phy,
>  				 enum phy_mode mode, int submode)
>  {
>  	struct qmp_phy *qphy = phy_get_drvdata(phy);
> -	struct qcom_qmp *qmp = qphy->qmp;
>  
> -	qmp->mode = mode;
> +	qphy->mode = mode;
>  
>  	return 0;
>  }
> @@ -2816,8 +2815,8 @@ static void qcom_qmp_phy_enable_autonomous_mode(struct qmp_phy *qphy)
>  	void __iomem *pcs_misc = qphy->pcs_misc;
>  	u32 intr_mask;
>  
> -	if (qmp->mode == PHY_MODE_USB_HOST_SS ||
> -	    qmp->mode == PHY_MODE_USB_DEVICE_SS)
> +	if (qphy->mode == PHY_MODE_USB_HOST_SS ||
> +	    qphy->mode == PHY_MODE_USB_DEVICE_SS)
>  		intr_mask = ARCVR_DTCT_EN | ALFPS_DTCT_EN;
>  	else
>  		intr_mask = ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL;
> @@ -2863,7 +2862,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_suspend(struct device *dev)
>  	struct qmp_phy *qphy = qmp->phys[0];
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  
> -	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
> +	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qphy->mode);
>  
>  	/* Supported only for USB3 PHY */
>  	if (cfg->type != PHY_TYPE_USB3)
> @@ -2889,7 +2888,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  	int ret = 0;
>  
> -	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
> +	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qphy->mode);
>  
>  	/* Supported only for USB3 PHY */
>  	if (cfg->type != PHY_TYPE_USB3)
> -- 
> Sent by a computer, using git, on the internet
> 
