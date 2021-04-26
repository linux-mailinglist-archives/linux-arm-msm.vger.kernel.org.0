Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7608436B21D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Apr 2021 13:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbhDZLMN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 07:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233170AbhDZLMI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 07:12:08 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C33EC06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 04:11:25 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id c4so16525960wrt.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 04:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uXYb6BcHq27B6ScYW5tJ2SsqBaNuDx8oA92+GxjafKM=;
        b=xvUi/jFjSPOSvlz/BbBKn+ZE/Z9NzwrofgB+eXRzJYQ/2bL+Zb/2VVGEt/iCzyPK98
         pL/9abpx2tk1hTgBG+JZESktFflsU17VR7wROE4/rrO1Cn4RyLqRP1YUNglHucbWC8S6
         FOapPgutJJ9vKG0pgRhXNA4OuWK2cYA8x6XrJoQw07n1tJk9I5G+861+X0/z3Trj8pJQ
         kkaZljXTsrsuiVJKyTtS7854orFz2eynPNELr27p9eMBR751mXIJXN/tFyxP64DI+96A
         lCIcVSZgqJU9/c/usNiOESCKyIqI0DPDeryvlUzWHzdJyWfA9xJBsAnXo+zYDj1Y+++L
         tx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uXYb6BcHq27B6ScYW5tJ2SsqBaNuDx8oA92+GxjafKM=;
        b=BsQS70aGke543dkEZhpaMxidLZ/OzQxF047QClaXOnr2h2UNKi09XrdkzNqA5NIUpQ
         wgMhpYdaywdgIanoOzVPsVIPSffGM0x1vUGVU49lMMY7/tJUabtXX3ljwVWjPNYsSTQG
         YPd5mg4AFKw3c0Ohej4WDmk7NmBg+/J4SKz6b4/UNURyQwQi1m6Rx/lioUKHC6CwQOvD
         lBGXg2fiy6cofuT1U39y72+oXMFMnbTJ1EK7Ua5Nwxe1tNb00MeIV2hCwZHr4ljeUS6j
         lEUdeTp3hxZQhUVgiT/eBAoC/IW+Lscbt3nigFOvhWWJapRidsWxl3w9Mim3dNFL148I
         scFg==
X-Gm-Message-State: AOAM532OYpiJMX3cIlT22rc2NxtdkZjhsBq3jHdPY2oVTjgEjYBw5BKC
        79luwLB1iCvJO11Df+9ENC0D1A==
X-Google-Smtp-Source: ABdhPJzthkQ8A9dbPXyiOrcJp3qKrnW8BYa16c26OInVfMwwDZA1oulOtgOaJrtr56/7q3TzEzs6yw==
X-Received: by 2002:adf:d1c3:: with SMTP id b3mr22233136wrd.367.1619435478756;
        Mon, 26 Apr 2021 04:11:18 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id t20sm19529761wmi.35.2021.04.26.04.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 04:11:18 -0700 (PDT)
Date:   Mon, 26 Apr 2021 12:11:16 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Rajeev Nandan <rajeevny@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        mkrishn@codeaurora.org, linux-kernel@vger.kernel.org,
        abhinavk@codeaurora.org, dianders@chromium.org,
        seanpaul@chromium.org, kalyan_t@codeaurora.org,
        hoegsberg@chromium.org, Lyude Paul <lyude@redhat.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [v2 2/2] backlight: Add DisplayPort aux backlight driver
Message-ID: <20210426111116.4lc3ekxjugjr3oho@maple.lan>
References: <1619214904-10218-1-git-send-email-rajeevny@codeaurora.org>
 <1619214904-10218-3-git-send-email-rajeevny@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1619214904-10218-3-git-send-email-rajeevny@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Apr 24, 2021 at 03:25:04AM +0530, Rajeev Nandan wrote:
> Add backlight driver for the panels supporting backlight control
> using DPCD registers on the DisplayPort aux channel.
> 
> Changes in v2:
> - New (most of the code reused from drm_dp_aux_backlight.c of v1)

Did you respond to Jani's feedback on the v1 posting (asking you to
coordinate with Lyude's work on refactoring the i915 eDP helpers[1])?
I can't find anything showing the outcome of that.

[1]: https://www.spinics.net/lists/dri-devel/msg295602.html


> +static struct drm_dp_aux *i2c_to_aux(struct i2c_adapter *i2c)
> +{
> +	return container_of(i2c, struct drm_dp_aux, ddc);
> +}

[...]

> +	np = of_parse_phandle(pdev->dev.of_node, "ddc-i2c-bus", 0);
> +	if (!np) {
> +		dev_err(&pdev->dev, "failed to get aux ddc I2C bus\n");
> +		return -ENODEV;
> +	}
> +
> +	ddc = of_find_i2c_adapter_by_node(np);
> +	of_node_put(np);
> +	if (!ddc)
> +		return -EPROBE_DEFER;
> +
> +	aux_bl->aux = i2c_to_aux(ddc);
> +	dev_dbg(&pdev->dev, "using dp aux %s\n", aux_bl->aux->name);

It looks like this code "just knows" that the I2C controller it has
looked up is a special one. That seems a little odd to me.

If we "just know" this then I'd hope that is could either be modelled
in the devicetree or that it would be possible for the backlight driver
to be registered (possibly using helpers) by whatever it is that is
setting up struct drm_dp_aux in the first place.


Daniel.
