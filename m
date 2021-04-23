Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC3EA3696B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 18:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhDWQRA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 12:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhDWQQ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 12:16:59 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6090EC061756
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:16:23 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id e25so19709978oii.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1beMU+DaWF7yKuEoNt6I8by7dA1jU8B9WzUrcEqZmfo=;
        b=qZMZ6z42jx4QzKNiRoYpBwAz4W0vEnC7jY8zKS3N63hCnwyPO6goMHM8UnmQHJibxg
         o0m/M7kOUcuB9Hg7pNGraR6Bhcm3Xo8W3Fhn6Mbwd+KPUnUQwpAuw0y+UHpIS7xSUXb1
         WimXdrmQ9MwZ4l3fAm9WOA5ruAtlrkqtbeRcaoWyCgQQQ8adjutRczA3bvB2nZJPmlB6
         h1ws44ETe3srAA/2lD7j36eOE/e9Ey8B8H6BumsIRVkKMSC8JjXOAXaN4r5WEPuJWX1n
         vGUsvoGbaqQs/e7jZCvN5yahbDO7Ii2U4hpqy+XJ8MXDKQ5nJzS7MYgPB9mGD2ZWFWuD
         9kjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1beMU+DaWF7yKuEoNt6I8by7dA1jU8B9WzUrcEqZmfo=;
        b=o1/f5EHuqCIJqFl/mFl5NdNdZXjpFj4L1dgukBrCSv50IZPTfXFZXrrjRJPiL0wvrm
         tHXEqqUsCBMMcLtI/0xelX0ByUxanoKZPiPO5OiWvNsSe9dqCT1no/wGDadFBEXTkVyb
         jw4PfZu2wlu/r/IQwOl1U3uaMN7cn3Il64U8rgaeAEZVtkWUh5Sbx1UHip6ViDvMG26J
         TGUfpt/vzWeWPOvUfc2ytEU4/XVr7jjqMbM0lqwUMDPN+ElTuQpiAzXn07xfffQAyCkv
         yMTn4GxZ1MmfvSmPCbZ/OYoSXjvb0CdpODtP4wo4nvYEIkIMafarT0PXrT4rH7PBO58I
         J7NA==
X-Gm-Message-State: AOAM533UDgPKqePOn05a3ZnGqQFhQog+Q/gMz2KgZiJiRT1s8GaS/lMo
        zqdayO6Fc97R3DQ2s1iC/+QgaptMpn19ew==
X-Google-Smtp-Source: ABdhPJx8WB+E1jil+D6UMM6kwQmfbL2ZIs2j/TC89e174s2risj+WmXI/IPeTibjmhBXYErASaAYmQ==
X-Received: by 2002:aca:f2c1:: with SMTP id q184mr4510159oih.29.1619194582719;
        Fri, 23 Apr 2021 09:16:22 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t19sm1484007otm.40.2021.04.23.09.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 09:16:22 -0700 (PDT)
Date:   Fri, 23 Apr 2021 11:16:20 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 26/27] arm64: dts: qcom: Link the panel to the
 bridge's DDC bus
Message-ID: <YILy1L7guo1c3BXu@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.26.Ibdb7735fb1844561b902252215a69526a14f9abd@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.26.Ibdb7735fb1844561b902252215a69526a14f9abd@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 16 Apr 17:39 CDT 2021, Douglas Anderson wrote:

> Adding this link allows the panel code to do things like read the
> EDID.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
> (no changes since v1)
> 
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 24d293ef56d7..96e530594509 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -265,6 +265,7 @@ panel: panel {
>  		power-supply = <&pp3300_dx_edp>;
>  		backlight = <&backlight>;
>  		hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
> +		ddc-i2c-bus = <&sn65dsi86_bridge>;
>  
>  		ports {
>  			port {
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
