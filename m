Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 778E87CB308
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 20:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233732AbjJPSzX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 14:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233968AbjJPSzW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 14:55:22 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E00F7
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 11:55:21 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3429FC433C8;
        Mon, 16 Oct 2023 18:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697482520;
        bh=ybBFFxckp/7Pt2ygo1vu/EHKckpT5bl4YF7dxTBhogI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mmfkBY9fQwl657JEe/ndzsyRouP0LKBOlPQxhEyYX4Ux6NilSDHOtzYJQUbsCtLYq
         t2CBmattSGS84PRxWaz5k8gmWyQAwVOGRngk28A26yeQ8U07EYdTUZuFxHjrUE5efO
         Auz5KNnc44qJQcvaIGwsNddQpxSa8zaoOWtGopUoasBKjZ+Le/VzHarMmvppI2ZPL+
         eWwnn1mSKF7mXFtXEG5G3/C7h6uy0JZHbsZ5BYtQQW44SVexFoRnhW6SawTAFjSTa9
         FNo3PWhHKhAYXhCYqJd0FffqGAsGbxIHWJHoxqdT3B8c8BRGJabqfKdNa+93nZl976
         0NvPpHxtVG+1g==
Date:   Mon, 16 Oct 2023 11:59:08 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] soc: qcom: pmic_glink: fix connector type to be
 DisplayPort
Message-ID: <svwawy3lzocyaq6zg2tvnocukjacv237ff3el627s4ecreezl6@yu2y7oexqpnv>
References: <20231010225229.77027-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010225229.77027-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 11, 2023 at 01:52:29AM +0300, Dmitry Baryshkov wrote:
> As it was pointed out by Simon Ser, the DRM_MODE_CONNECTOR_USB connector
> is reserved for the GUD devices. Other drivers (i915, amdgpu) use
> DRM_MODE_CONNECTOR_DisplayPort even if the DP stream is handled by the
> USB-C altmode. While we are still working on implementing the proper way
> to let userspace know that the DP is wrapped into USB-C, change
> connector type to be DRM_MODE_CONNECTOR_DisplayPort.
> 
> Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
> Cc: Simon Ser <contact@emersion.fr>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Applied, thanks.

> ---
>  drivers/soc/qcom/pmic_glink_altmode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
> index 9569d999391d..6f8b2f7ae3cc 100644
> --- a/drivers/soc/qcom/pmic_glink_altmode.c
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> @@ -467,7 +467,7 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
>  		alt_port->bridge.funcs = &pmic_glink_altmode_bridge_funcs;
>  		alt_port->bridge.of_node = to_of_node(fwnode);
>  		alt_port->bridge.ops = DRM_BRIDGE_OP_HPD;
> -		alt_port->bridge.type = DRM_MODE_CONNECTOR_USB;
> +		alt_port->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
>  
>  		ret = devm_drm_bridge_add(dev, &alt_port->bridge);
>  		if (ret) {
> -- 
> 2.39.2
> 
