Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52FB256705C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 16:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232877AbiGEOIe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 10:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232607AbiGEOIV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 10:08:21 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A14F2408D
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 06:57:01 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id f190so7083096wma.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 06:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BjBLo3BZc3i/RrsqwYepC98EZoOUEWdJFyaQ2Y5SkP0=;
        b=HVTwtZciptDZ08KFzuykH2G4uvbG1AF9IUbGC6tPbew+VkkEep2biH9kqSb2g2WudP
         k3SAShqWQEBii7o3dGcbIl77ShsFOqF2GBIBbr+934nuyV77fVbDoBzI2EWMySR6qkKA
         EAomRNCay5OQGrRSiLPGF2kIcHCn9DtJQAYUUDlgYK0WfUUURvvrXitCCYwVBcxpXxJC
         Ywfj7RmFSvikjNUHDME3fb2Jti/pd3k6cDcPf+AZh2GRCqK56E/69h5fZ/GWWW/QpVQD
         0oS4VtrmruMf/9nENMSS7m4auTm1KBfEbFCg5Yd8a4tq8Xx97eDhxtRXS84fslUSA+zj
         9ksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BjBLo3BZc3i/RrsqwYepC98EZoOUEWdJFyaQ2Y5SkP0=;
        b=qedn6KYZ3V/h09WzonaGikMUE5PctVURwtcLEVGGe0HvjfjyTM/IrJjCL1mgU6bQ/C
         ghUC0MPoXHsRqlHE1pW1sR/gDhrt0KYFCt6szIslw+ItfnP6XbmeSkywiui5/aufZzet
         uSU3/2YMrAiiphH+pehuTB1bMLfSUpjjD3LhdJ6+RRc3zB/XSwiD23unXeldsAgAHwgW
         h2hJmx/PPPv1J2tfoeOa4jqmrlLGjWJxJw8pVXb9TUBSCTFuTBS0wldttal36Edxi+W6
         JQGWf9jtew3GWLpukuIeQZs8RwK6bErqwfZx9kUN0zzxcN7++jrg1+xdWXH0tGuQeLQn
         biOg==
X-Gm-Message-State: AJIora+JBIXTgy0k2g9V8UEuq9/SYx02Tk1+pSCtx+iCGQQ/v6VDd5ei
        V24AiZftItzj2lw99dVH4TkWdw==
X-Google-Smtp-Source: AGRyM1ta/onHiJ4mcOXFofWIPIfNC6d8zHYsI6fzj5uesjQthvz30oMnsL4Ne07JK1olvzUJKW0PgA==
X-Received: by 2002:a05:600c:a42:b0:39c:9166:5a55 with SMTP id c2-20020a05600c0a4200b0039c91665a55mr36560873wmq.141.1657029420036;
        Tue, 05 Jul 2022 06:57:00 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id q4-20020a1ce904000000b003a2b433c738sm4799348wmc.26.2022.07.05.06.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 06:56:59 -0700 (PDT)
Date:   Tue, 5 Jul 2022 16:56:58 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Saravana Kannan <saravanak@google.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [RFC] driver core: Fix repeated device_is_dependent check for
 same link
Message-ID: <YsRDKmW1ZSbGN4l0@linaro.org>
References: <20220705134502.2603795-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220705134502.2603795-1-abel.vesa@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-07-05 16:45:02, Abel Vesa wrote:
> In case of a cyclic dependency, if the supplier is not yet available,
> the parent of the supplier is checked for dependency. But if there are
> more than one suppliers with the same parent, the first check returns
> true while the next checks skip that specific link entirely. So add a
> flag that marks the link for future checks and bail early if it is
> already marked with that flag.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>
> For more details about this issue, have a look at this thread:
> https://lore.kernel.org/all/CAGETcx8F0wP+RA0KpjOJeZfc=DVG-MbM_=SkRHD4UhD2ReL7Kw@mail.gmail.com/
>
>  drivers/base/core.c    | 14 +++++++++++---
>  include/linux/device.h |  2 ++
>  2 files changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index ccdd5b4295de..38cb478ae400 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -297,12 +297,18 @@ int device_is_dependent(struct device *dev, void *target)
>  		return ret;
>
>  	list_for_each_entry(link, &dev->links.consumers, s_node) {
> +		/* if already marked before as dependent, bail early */
> +		if (link->flags & DL_FLAG_DEVICE_IS_DEPENDENT)
> +			return 1;

On a second thought, this is wrong since it might be a different
consumer link.

> +
>  		if ((link->flags & ~DL_FLAG_INFERRED) ==
>  		    (DL_FLAG_SYNC_STATE_ONLY | DL_FLAG_MANAGED))
>  			continue;
>
> -		if (link->consumer == target)
> +		if (link->consumer == target) {
> +			link->flags |= DL_FLAG_DEVICE_IS_DEPENDENT;
>  			return 1;
> +		}
>
>  		ret = device_is_dependent(link->consumer, target);
>  		if (ret)
> @@ -1660,11 +1666,13 @@ static void fw_devlink_relax_link(struct device_link *link)
>  	if (!(link->flags & DL_FLAG_INFERRED))
>  		return;
>
> -	if (link->flags == (DL_FLAG_MANAGED | FW_DEVLINK_FLAGS_PERMISSIVE))
> +	if ((link->flags & (DL_FLAG_MANAGED | FW_DEVLINK_FLAGS_PERMISSIVE)) ==
> +			(DL_FLAG_MANAGED | FW_DEVLINK_FLAGS_PERMISSIVE))
>  		return;
>
>  	pm_runtime_drop_link(link);
> -	link->flags = DL_FLAG_MANAGED | FW_DEVLINK_FLAGS_PERMISSIVE;
> +	link->flags &= DL_FLAG_DEVICE_IS_DEPENDENT;
> +	link->flags |= DL_FLAG_MANAGED | FW_DEVLINK_FLAGS_PERMISSIVE;
>  	dev_dbg(link->consumer, "Relaxing link with %s\n",
>  		dev_name(link->supplier));
>  }
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 424b55df0272..3b0c4b777a60 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -317,6 +317,7 @@ enum device_link_state {
>   * MANAGED: The core tracks presence of supplier/consumer drivers (internal).
>   * SYNC_STATE_ONLY: Link only affects sync_state() behavior.
>   * INFERRED: Inferred from data (eg: firmware) and not from driver actions.
> + * DEVICE_IS_DEPENDENT: The consumer is dependent on the supplier
>   */
>  #define DL_FLAG_STATELESS		BIT(0)
>  #define DL_FLAG_AUTOREMOVE_CONSUMER	BIT(1)
> @@ -327,6 +328,7 @@ enum device_link_state {
>  #define DL_FLAG_MANAGED			BIT(6)
>  #define DL_FLAG_SYNC_STATE_ONLY		BIT(7)
>  #define DL_FLAG_INFERRED		BIT(8)
> +#define DL_FLAG_DEVICE_IS_DEPENDENT	BIT(9)
>
>  /**
>   * enum dl_dev_state - Device driver presence tracking information.
> --
> 2.34.3
>
