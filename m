Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5B9710347
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 05:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233157AbjEYDWr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 23:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232060AbjEYDWq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 23:22:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E64E2;
        Wed, 24 May 2023 20:22:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B4E3863456;
        Thu, 25 May 2023 03:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DE0C433D2;
        Thu, 25 May 2023 03:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684984963;
        bh=Y8eng3t17gv2o3mDMCtBcNTu2z6eQ5wzesN6JYvYaNk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WC4I5vV6Q2Pwy5RJtl381jfpkTHdy1dPSAw7n0PpuOAQlfP1W4xGAvTC3P4Oqs1K+
         ES3GqDrI0TIk9oWKS0A31vN3/ABs8OU0VTMhzt5GPrJE3Bg9b3/llOkCqJLWXe4TjC
         V7ak1gmYj8pmZ6/FVYZwwFuEHAehLjwBKtC/kXLlq5S2xxHlnlOgK6hyzQu6hqhr36
         TNKnIDx/O+xmFkF/EDfsyaYMwLQOwAzaKjSNHwTuYQ3kn3fkPUSJL913FXYpjOywLL
         4CAaRx5FX5wFAZfNidSqUYYaCDKirYumlGv20PWjzp7cERxUDei67qkY6I70SwaOKQ
         DBBIITn9QQYAA==
Date:   Wed, 24 May 2023 20:26:33 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH v1 2/2] usb: typec: mux: Remove alt mode parameters from
 the API
Message-ID: <20230525032633.zfpgu4moisbaau6q@ripper>
References: <20230524122901.53659-1-heikki.krogerus@linux.intel.com>
 <20230524122901.53659-3-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524122901.53659-3-heikki.krogerus@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 24, 2023 at 03:29:01PM +0300, Heikki Krogerus wrote:
> The alt mode descriptor parameters are not used anymore.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Prashant Malani <pmalani@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Bjorn Andersson <andersson@kernel.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Tested-by: Bjorn Andersson <andersson@kernel.org> #pmic_glink_altmode

Regards,
Bjorn

> ---
>  drivers/platform/chrome/cros_ec_typec.c |  2 +-
>  drivers/soc/qcom/pmic_glink_altmode.c   |  5 +----
>  drivers/usb/typec/class.c               |  4 ++--
>  drivers/usb/typec/mux.c                 |  6 ++----
>  include/linux/usb/typec_mux.h           | 11 ++++-------
>  5 files changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index a673c33424706..25f9767c28e82 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -77,7 +77,7 @@ static int cros_typec_get_switch_handles(struct cros_typec_port *port,
>  {
>  	int ret = 0;
>  
> -	port->mux = fwnode_typec_mux_get(fwnode, NULL);
> +	port->mux = fwnode_typec_mux_get(fwnode);
>  	if (IS_ERR(port->mux)) {
>  		ret = PTR_ERR(port->mux);
>  		dev_dbg(dev, "Mux handle not found: %d.\n", ret);
> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
> index 4d7895bdeaf2f..df48fbea4b686 100644
> --- a/drivers/soc/qcom/pmic_glink_altmode.c
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> @@ -369,7 +369,6 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
>  {
>  	struct pmic_glink_altmode_port *alt_port;
>  	struct pmic_glink_altmode *altmode;
> -	struct typec_altmode_desc mux_desc = {};
>  	const struct of_device_id *match;
>  	struct fwnode_handle *fwnode;
>  	struct device *dev = &adev->dev;
> @@ -427,9 +426,7 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
>  		alt_port->dp_alt.mode = USB_TYPEC_DP_MODE;
>  		alt_port->dp_alt.active = 1;
>  
> -		mux_desc.svid = USB_TYPEC_DP_SID;
> -		mux_desc.mode = USB_TYPEC_DP_MODE;
> -		alt_port->typec_mux = fwnode_typec_mux_get(fwnode, &mux_desc);
> +		alt_port->typec_mux = fwnode_typec_mux_get(fwnode);
>  		if (IS_ERR(alt_port->typec_mux))
>  			return dev_err_probe(dev, PTR_ERR(alt_port->typec_mux),
>  					     "failed to acquire mode-switch for port: %d\n",
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 349cc2030c903..faa184ae3dac8 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -2110,7 +2110,7 @@ typec_port_register_altmode(struct typec_port *port,
>  	struct typec_mux *mux;
>  	struct typec_retimer *retimer;
>  
> -	mux = typec_mux_get(&port->dev, desc);
> +	mux = typec_mux_get(&port->dev);
>  	if (IS_ERR(mux))
>  		return ERR_CAST(mux);
>  
> @@ -2274,7 +2274,7 @@ struct typec_port *typec_register_port(struct device *parent,
>  		return ERR_PTR(ret);
>  	}
>  
> -	port->mux = typec_mux_get(&port->dev, NULL);
> +	port->mux = typec_mux_get(&port->dev);
>  	if (IS_ERR(port->mux)) {
>  		ret = PTR_ERR(port->mux);
>  		put_device(&port->dev);
> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> index 089c2fd478318..a29945e2eb077 100644
> --- a/drivers/usb/typec/mux.c
> +++ b/drivers/usb/typec/mux.c
> @@ -287,15 +287,13 @@ static void *typec_mux_match(const struct fwnode_handle *fwnode,
>  /**
>   * fwnode_typec_mux_get - Find USB Type-C Multiplexer
>   * @fwnode: The caller device node
> - * @desc: Alt Mode description
>   *
>   * Finds a mux linked to the caller. This function is primarily meant for the
>   * Type-C drivers. Returns a reference to the mux on success, NULL if no
>   * matching connection was found, or ERR_PTR(-EPROBE_DEFER) when a connection
>   * was found but the mux has not been enumerated yet.
>   */
> -struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
> -				       const struct typec_altmode_desc *desc)
> +struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode)
>  {
>  	struct typec_mux_dev *mux_devs[TYPEC_MUX_MAX_DEVS];
>  	struct typec_mux *mux;
> @@ -308,7 +306,7 @@ struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
>  		return ERR_PTR(-ENOMEM);
>  
>  	count = fwnode_connection_find_matches(fwnode, "mode-switch",
> -					       (void *)desc, typec_mux_match,
> +					       NULL, typec_mux_match,
>  					       (void **)mux_devs,
>  					       ARRAY_SIZE(mux_devs));
>  	if (count <= 0) {
> diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
> index 9292f0e078464..11bfa314529fd 100644
> --- a/include/linux/usb/typec_mux.h
> +++ b/include/linux/usb/typec_mux.h
> @@ -60,8 +60,7 @@ struct typec_mux_desc {
>  
>  #if IS_ENABLED(CONFIG_TYPEC)
>  
> -struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
> -				       const struct typec_altmode_desc *desc);
> +struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode);
>  void typec_mux_put(struct typec_mux *mux);
>  int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state);
>  
> @@ -74,8 +73,7 @@ void *typec_mux_get_drvdata(struct typec_mux_dev *mux);
>  
>  #else
>  
> -static inline struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
> -				       const struct typec_altmode_desc *desc)
> +static inline struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode);
>  {
>  	return NULL;
>  }
> @@ -102,10 +100,9 @@ static inline void *typec_mux_get_drvdata(struct typec_mux_dev *mux)
>  
>  #endif /* CONFIG_TYPEC */
>  
> -static inline struct typec_mux *
> -typec_mux_get(struct device *dev, const struct typec_altmode_desc *desc)
> +static inline struct typec_mux *typec_mux_get(struct device *dev)
>  {
> -	return fwnode_typec_mux_get(dev_fwnode(dev), desc);
> +	return fwnode_typec_mux_get(dev_fwnode(dev));
>  }
>  
>  #endif /* __USB_TYPEC_MUX */
> -- 
> 2.39.2
> 
