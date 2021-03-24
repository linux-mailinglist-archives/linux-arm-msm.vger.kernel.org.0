Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA400347001
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 04:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235122AbhCXDMd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 23:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232328AbhCXDMB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 23:12:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509C5C061763;
        Tue, 23 Mar 2021 20:11:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C2ED580;
        Wed, 24 Mar 2021 04:11:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616555515;
        bh=kb4zw6NG0VsDFfF9QtkW7sGJ6epHO7oOhIpVPz6fw2c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Va+SLLjgpX6Q8QhUfABVlt1povvnhgGxY3I0zsUQY2ll4oI0PYd2Bq5Dkh64dlxk/
         lUgjmdQQ7XZZpXHTM11jxPfoUETqaIeHNoKUKj+9BOonsEZ66VDSg4/w13hyGK5FPi
         vpYVXSJOCblJFxss/qwVmS0ju4raad5BCQDysS6o=
Date:   Wed, 24 Mar 2021 05:11:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] arm64: dts: qcom: trogdor: Add no-hpd to DSI bridge node
Message-ID: <YFqt0U+sUPiNGIkQ@pendragon.ideasonboard.com>
References: <20210324025534.1837405-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210324025534.1837405-1-swboyd@chromium.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

Thank you for the patch.

On Tue, Mar 23, 2021 at 07:55:34PM -0700, Stephen Boyd wrote:
> We should indicate that we're not using the HPD pin on this device, per
> the binding document. Otherwise if code in the future wants to enable
> HPD in the bridge when this property is absent we'll be wasting power
> powering hpd when we don't use it on trogdor boards. We didn't notice
> this before because the kernel driver blindly disables hpd, but that
> won't be true for much longer.
> 
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Fixes: 7ec3e67307f8 ("arm64: dts: qcom: sc7180-trogdor: add initial trogdor and lazor dt")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 07c8b2c926c0..298af6d7fb4a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -595,6 +595,8 @@ sn65dsi86_bridge: bridge@2d {
>  		clocks = <&rpmhcc RPMH_LN_BB_CLK3>;
>  		clock-names = "refclk";
>  
> +		no-hpd;
> +
>  		ports {
>  			#address-cells = <1>;
>  			#size-cells = <0>;

-- 
Regards,

Laurent Pinchart
