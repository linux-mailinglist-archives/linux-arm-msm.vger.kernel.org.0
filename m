Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBE06517597
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 19:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386602AbiEBRVC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 13:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236549AbiEBRU6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 13:20:58 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD36A1B3
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 10:17:29 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id k23so29000584ejd.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 10:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oTeGZRyE2mr2u+m1voN9Z49X34/v4brkQnKi8WE42ks=;
        b=JxCTtdo7XskJybuw+4NTUgwS8Au5koSIUQ7QZEpluKPGW4M2qVduWv8V3CDMR53GbQ
         bI0iW4GTIpjXVQ12039X53L5Z5txctbYgvwRt7a2YYI/VN8UEkbiO/y8v6UMkVk/464O
         IIxEw0Q4uWhxMz7xmgfA5TH+ehxSMM0U0cAk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oTeGZRyE2mr2u+m1voN9Z49X34/v4brkQnKi8WE42ks=;
        b=fvnH5fV5FnF0p6d6oRmvAynRvy1PrSU3MU2MM6l5F8KfEcyBAFID4NZoyX+BKtK+A/
         NV7sz8iPU+eZpcoXIt2AK3uf+2CwmLwOdDox/4ENafqLXqUdThqi8o4KkgxA2Im8Upk8
         5WnICJvHa3zUKnyPiN8u7YfkpCyJ3cn5fkmvnLSdET8s2LPzOShoaWISHTYlJGlPN3sl
         4F0j8W1tcgpTRiZDvHqV1YzmN88VS7Y2F+OgTWOfpmh0df6ZLNHkc5CG4dVSniz4caUi
         UWOfl3ZdqzvRqkHEIV3o1WXVYzMx4uiL/o7nUj5D/0b6MYKjjs6mGB4uJ15OYu6PtAAN
         iRMw==
X-Gm-Message-State: AOAM5311dHmkO0Xg8/KtruGgt5Kqclb65EabYYn0hJh1xLOxjLDeALq7
        chiaeMoV07yVWflurlmK28d1GyKANQYhKX03
X-Google-Smtp-Source: ABdhPJzcRpdAYEHZPGtGhSLDivVoswQxWwF83HZBtjNrsu5GQKBEaSByp5RS3whRlyQ4MyEnQn968A==
X-Received: by 2002:a17:906:7b82:b0:6f3:ee8d:b959 with SMTP id s2-20020a1709067b8200b006f3ee8db959mr12411492ejo.458.1651511847510;
        Mon, 02 May 2022 10:17:27 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id jl9-20020a17090775c900b006f3ef214dedsm3708871ejc.83.2022.05.02.10.17.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 10:17:26 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id q20so8617055wmq.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 10:17:26 -0700 (PDT)
X-Received: by 2002:a05:600c:4e44:b0:394:46b4:7b0e with SMTP id
 e4-20020a05600c4e4400b0039446b47b0emr110547wmq.29.1651511846037; Mon, 02 May
 2022 10:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220430011402.1.If7c3471db53bea55213f7bcf17e9043084d3ac0c@changeid>
In-Reply-To: <20220430011402.1.If7c3471db53bea55213f7bcf17e9043084d3ac0c@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 2 May 2022 10:17:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U-YCicgn06BnvCLHvXWw1-XzKhu8TMDm4T5LphoBOUBQ@mail.gmail.com>
Message-ID: <CAD=FV=U-YCicgn06BnvCLHvXWw1-XzKhu8TMDm4T5LphoBOUBQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sc7180: Add wormdingler dts files
To:     "Joseph S. Barrera III" <joebar@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Apr 30, 2022 at 1:18 AM Joseph S. Barrera III
<joebar@chromium.org> wrote:
>
> Wormdingler is a trogdor-based board, shipping to customers as the
> Lenovo IdeaPad Chromebook Duet 3. These dts files are copies from
> the downstream Chrome OS 5.4 kernel, but with downstream bits removed.
>
> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
> ---

I was expecting that this patch series would be labeled "v3" and would
also have version history. What happened? I provided the tags you
needed for stuff like this in v2 and even wrote the history bits for
you... [1]


[1] https://lore.kernel.org/r/CAD=FV=XbQ7LhnxGAavLL3XDpPigwtCz0CF3YcZ=ywrXwu=uiMQ@mail.gmail.com/


> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Wormdingler board device tree source
> + *
> + * Copyright 2021 Google LLC.
> + *
> + * SKU: 0x0001 => 1
> + *  - bits 11..8: Panel ID: 0x0 (INX)
> + */
> +
> +/dts-v1/;
> +
> +#include "sc7180-trogdor-wormdingler.dtsi"

In my reply to your v2 I was suggesting that the rt5682s files could
be done more cleanly. I guess it's not 100% needed and could always be
a later cleanup, but any reason why you decided not to do it?


> +&ap_tp_i2c {
> +       status = "disabled";
> +};
> +
> +&backlight {
> +       pwms = <&cros_ec_pwm 0>;
> +};

Downstream we have:

&camcc {
       status = "okay";
};

Why did you remove it here? You didn't in the previous version. Coach
Z and Homestar still define it upstream and they work fine. Even if we
haven't finished defining the MIPI camera bits, enabling the camera
clock controller should still be fine, right?


Also in my reply to v2 I suggested that you delete the keypad num-rows
/ num-columns in wormdingler.dtsi. Hmmm, but I guess maybe we should
put the num-rows/num-columns change on hold while we settle on an
approach for it [1].


So I guess overall summary:
* Pretty sure you want "camcc", so please spin with that.
* Please figure out how to tag your series as v4 and have version history.
* I would still prefer the rt5682s stuff be cleaned up but if it's
really too hard we can do it in a follow-up.



[1] https://lore.kernel.org/r/CAD=FV=VX8EEgkeLgKwyKvjztcjbA8UhKOUpTr-sS1_Ec=QcWbA@mail.gmail.com
