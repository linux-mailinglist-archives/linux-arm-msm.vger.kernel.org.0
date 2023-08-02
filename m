Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97BCE76CB60
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 13:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232628AbjHBLA1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 07:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232986AbjHBLA0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 07:00:26 -0400
Received: from mgamail.intel.com (unknown [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B99781BC1;
        Wed,  2 Aug 2023 04:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690974025; x=1722510025;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uL/lMcoIpmA8jyiK1UfZfDEuaaCRn/1fGgpNmc5qjng=;
  b=DBhR4gk9KRqB6FUbpHPsrU9wUP1Ax8kkUX6yTmf2uHZlnSqKL0qCxGhs
   hk0e6tZMRD6hH48s3sf/2l6uRVFIm7w3nQxZ6u6+DBK2toiz1L7l+YV2w
   qm8hJnS61/7EOgEen22cLVy5/e55W5ZUiBU952psmbMXWIqLOjbH8Sa4i
   aCVfpSW9HZM+JD50PcZcdYo6XTCgH22Y2CpDc81aXTnNsOYMfEhfbO/53
   qLR/PIsROTk6oggS5KpOUC+zhNxJjUNQeXq5hl5ekZSCIp68p+FsxiKP6
   OfS2khFK/qrzrVQ9q4faBCE6tfI07shtUkVpBGX0UhYHjYs0+T7aCTnNC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="359589894"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="359589894"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 04:00:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="872438426"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Aug 2023 04:00:19 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 02 Aug 2023 14:00:16 +0300
Date:   Wed, 2 Aug 2023 14:00:16 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 3/3] usb: typec: nb7vpq904m: switch to
 DRM_SIMPLE_BRIDGE
Message-ID: <ZMo3QDym4Nteu8Tj@kuha.fi.intel.com>
References: <20230802011845.4176631-1-dmitry.baryshkov@linaro.org>
 <20230802011845.4176631-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802011845.4176631-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 02, 2023 at 04:18:45AM +0300, Dmitry Baryshkov wrote:
> Switch to using the new DRM_SIMPLE_BRIDGE helper to create the
> transparent DRM bridge device instead of handcoding corresponding
> functionality.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/Kconfig      |  2 +-
>  drivers/usb/typec/mux/nb7vpq904m.c | 44 ++----------------------------
>  2 files changed, 3 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
> index 784b9d8107e9..350a7ffce67e 100644
> --- a/drivers/usb/typec/mux/Kconfig
> +++ b/drivers/usb/typec/mux/Kconfig
> @@ -39,7 +39,7 @@ config TYPEC_MUX_NB7VPQ904M
>  	tristate "On Semiconductor NB7VPQ904M Type-C redriver driver"
>  	depends on I2C
>  	depends on DRM || DRM=n
> -	select DRM_PANEL_BRIDGE if DRM
> +	select DRM_SIMPLE_BRIDGE if DRM
>  	select REGMAP_I2C
>  	help
>  	  Say Y or M if your system has a On Semiconductor NB7VPQ904M Type-C
> diff --git a/drivers/usb/typec/mux/nb7vpq904m.c b/drivers/usb/typec/mux/nb7vpq904m.c
> index 9360b65e8b06..c89a956412ea 100644
> --- a/drivers/usb/typec/mux/nb7vpq904m.c
> +++ b/drivers/usb/typec/mux/nb7vpq904m.c
> @@ -11,7 +11,7 @@
>  #include <linux/regmap.h>
>  #include <linux/bitfield.h>
>  #include <linux/of_graph.h>
> -#include <drm/drm_bridge.h>
> +#include <drm/display/drm_simple_bridge.h>
>  #include <linux/usb/typec_dp.h>
>  #include <linux/usb/typec_mux.h>
>  #include <linux/usb/typec_retimer.h>
> @@ -70,8 +70,6 @@ struct nb7vpq904m {
>  	bool swap_data_lanes;
>  	struct typec_switch *typec_switch;
>  
> -	struct drm_bridge bridge;
> -
>  	struct mutex lock; /* protect non-concurrent retimer & switch */
>  
>  	enum typec_orientation orientation;
> @@ -297,44 +295,6 @@ static int nb7vpq904m_retimer_set(struct typec_retimer *retimer, struct typec_re
>  	return ret;
>  }
>  
> -#if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_DRM_PANEL_BRIDGE)
> -static int nb7vpq904m_bridge_attach(struct drm_bridge *bridge,
> -				    enum drm_bridge_attach_flags flags)
> -{
> -	struct nb7vpq904m *nb7 = container_of(bridge, struct nb7vpq904m, bridge);
> -	struct drm_bridge *next_bridge;
> -
> -	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> -		return -EINVAL;
> -
> -	next_bridge = devm_drm_of_get_bridge(&nb7->client->dev, nb7->client->dev.of_node, 0, 0);
> -	if (IS_ERR(next_bridge)) {
> -		dev_err(&nb7->client->dev, "failed to acquire drm_bridge: %pe\n", next_bridge);
> -		return PTR_ERR(next_bridge);
> -	}
> -
> -	return drm_bridge_attach(bridge->encoder, next_bridge, bridge,
> -				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> -}
> -
> -static const struct drm_bridge_funcs nb7vpq904m_bridge_funcs = {
> -	.attach	= nb7vpq904m_bridge_attach,
> -};
> -
> -static int nb7vpq904m_register_bridge(struct nb7vpq904m *nb7)
> -{
> -	nb7->bridge.funcs = &nb7vpq904m_bridge_funcs;
> -	nb7->bridge.of_node = nb7->client->dev.of_node;
> -
> -	return devm_drm_bridge_add(&nb7->client->dev, &nb7->bridge);
> -}
> -#else
> -static int nb7vpq904m_register_bridge(struct nb7vpq904m *nb7)
> -{
> -	return 0;
> -}
> -#endif
> -
>  static const struct regmap_config nb7_regmap = {
>  	.max_register = 0x1f,
>  	.reg_bits = 8,
> @@ -461,7 +421,7 @@ static int nb7vpq904m_probe(struct i2c_client *client)
>  
>  	gpiod_set_value(nb7->enable_gpio, 1);
>  
> -	ret = nb7vpq904m_register_bridge(nb7);
> +	ret = drm_simple_bridge_register(dev);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.39.2

-- 
heikki
