Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA06512451
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 23:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237930AbiD0VKV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Apr 2022 17:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237994AbiD0VKM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Apr 2022 17:10:12 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0446090CFE
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 14:06:18 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id bv19so5801340ejb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 14:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jjauEsEHj5sd6R0bf8PubRvrJywSXsRV0wPk6pUL5dM=;
        b=lqj+aRvM9wHKgYPNZJHCdMN7jqtNcF8wOkGevnc9WIDv+1Uh+iBIxocTBII9pBiT8a
         GJyn1HWGPh1cAam7gj83EA9YuXCRZZ8IbQ8zjznfC4RczXzNk7R60uGz78vmDBA9KdIj
         fq78Fg9uk9GVx2GI4ERJEBWCUC+hso/XqgVjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jjauEsEHj5sd6R0bf8PubRvrJywSXsRV0wPk6pUL5dM=;
        b=Vk4i1LEs4FG6W9NqcWUTYszMa6yy58PcVopGnVxpb/PAQgM2rPpFiLfPOT98nDENCu
         g0EGgWa/qcvnxFoVaFmJACww0DOQ98SK04M9fpu2xUklUP+LtjFK9NlZrvHlMIx88cxh
         hvIQKO9yNPBkROPTWGT00NEUP0R6jdIcMFYWIKRWEqubPmMPM6uKh4wOmE32dGIT7iQh
         umCPnTd4nJoTAgbBuffGO1JQDB7Ylac4BBMEW/1cn8Zx1oFcz5rBz6qyrb5gfOnbO9H8
         KdJkUbK6Pxzn3CcbzUdL0/yNK+kb3RG92DsE23g+dd7euxrL1XoY4/twjW++cJCAZog+
         ne3g==
X-Gm-Message-State: AOAM531201f5tVKJk3CE8aBTZ91F56q+Eecy8yAjXzw41sKYmrPY5DzK
        25z+p6a1ZQd2zr/jWVhdf7GTDrLorMm2y/zC
X-Google-Smtp-Source: ABdhPJyVn2f/WDcFus+J9ZAhLtnnwDWGTA/21LJ4/mzOxLCFE8AWxlxlVjaSXuSkGNCPqqXH8dl2pA==
X-Received: by 2002:a17:907:3da3:b0:6ef:f8e3:cf1a with SMTP id he35-20020a1709073da300b006eff8e3cf1amr28345705ejc.300.1651093576068;
        Wed, 27 Apr 2022 14:06:16 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id c2-20020a170906924200b006f3d1141693sm1042138ejx.44.2022.04.27.14.06.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 14:06:14 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id n32-20020a05600c3ba000b00393ea7192faso1926307wms.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 14:06:12 -0700 (PDT)
X-Received: by 2002:a05:600c:502b:b0:38f:f7c6:3609 with SMTP id
 n43-20020a05600c502b00b0038ff7c63609mr27998069wmr.15.1651093572373; Wed, 27
 Apr 2022 14:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220426170306.v22.1.I7a1a6448d50bdd38e6082204a9818c59cc7a9bfd@changeid>
 <20220426170306.v22.2.I18481b296484eec47bdc292a31fa46fa8c655ca9@changeid>
In-Reply-To: <20220426170306.v22.2.I18481b296484eec47bdc292a31fa46fa8c655ca9@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 27 Apr 2022 14:06:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UWPG6cZ_dcuXSKuO8ZA34J5TE1OJDxs7B3qn34V6n+eg@mail.gmail.com>
Message-ID: <CAD=FV=UWPG6cZ_dcuXSKuO8ZA34J5TE1OJDxs7B3qn34V6n+eg@mail.gmail.com>
Subject: Re: [PATCH v22 2/2] arm64: dts: qcom: sc7280-herobrine: Add nodes for
 onboard USB hub
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Apr 26, 2022 at 5:03 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Add nodes for the onboard USB hub on herobrine devices. Remove the
> 'always-on' property from the hub regulator, since the regulator
> is now managed by the onboard_usb_hub driver.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> Changes in v22:
> - patch added to the series
>
>  .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)

Just like on patch #1, I presume it will be moderately annoying if
this lands in the Qualcomm branch before the driver lands in mainline?
I guess very few people have herobrine hardware, so maybe not that big
of a deal...

In any case, I'm happy with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
