Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCDC2550124
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 02:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237930AbiFRAPE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 20:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237736AbiFRAPE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 20:15:04 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A85215809
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 17:15:03 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id h7so3959854ila.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 17:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6QxFN8UrMFcSUUpM3X2yceWSzBEq/6g0OJ+cr8XRfAY=;
        b=WC55Elfj7HnK76ukAdSAcVsAj3IvHlSwmWziZZbsSfFe9kaQmlj1UqUDStr4vyVnGm
         jMRyEqXSNRJT2+H9F/TRdSIX5J6Mu1yAMs+jBhJEizyz3wQvARZg2+lAO9HERJU9Eix4
         l4fzAqlhWhMmu4qEtHW0W/xOf3V2ybkhpf7rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6QxFN8UrMFcSUUpM3X2yceWSzBEq/6g0OJ+cr8XRfAY=;
        b=UmmTiYBJmqDTi+NxWXvQHjZFlDjZoiN1A/kgJw8rbutayyhJinL+HVywkPmIuCuaIh
         xnAdJU2TG9HC7CSa1nD6FKFi9Nh9fum8aOvUj+KfOptN+pVU9BpMmgEk1jzKlAZNTU04
         GcXR7NVYPEhscOIi/9CKmstlqPfENyLpQLPhQ0ueEayWagq0RFtcw8Eu3Cgroa2x7h2e
         bijiacNh7lJ3pti7DAp0+W5BZpo+EmxUOS7XcF9L7Fse5QtY3505yR25ZxXwiSAmZgpg
         iOJc3sE4svE9u1buO6O6vfAlQ+fHTMkPmCPSkYwxlsbQCCHKGxvjp8p8AMW0LV9DcnhD
         HM6A==
X-Gm-Message-State: AJIora/Q3MrfygpJDNrJGcrZo9VFJhN5gbTiyOLwAbaweZL+tNa+g7n/
        SzBC1zxNutGfP+AJtCj+L831SXEEYzo90ANPDFE=
X-Google-Smtp-Source: AGRyM1uGIilzE+67ZNvXCinvPxyXCzFSi5WM9Cj5PrTYdaZosZdJzdG1d8nx/uOlXjlpzhkOq0s/uQ==
X-Received: by 2002:a05:6e02:1ba3:b0:2d3:ec59:3146 with SMTP id n3-20020a056e021ba300b002d3ec593146mr7170456ili.145.1655511302751;
        Fri, 17 Jun 2022 17:15:02 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com. [209.85.166.178])
        by smtp.gmail.com with ESMTPSA id h13-20020a056638062d00b003314bd44eb3sm2847762jar.17.2022.06.17.17.15.02
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 17:15:02 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id y17so3951730ilj.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 17:15:02 -0700 (PDT)
X-Received: by 2002:a05:6e02:1747:b0:2d3:e571:5058 with SMTP id
 y7-20020a056e02174700b002d3e5715058mr7074748ill.309.1655511301925; Fri, 17
 Jun 2022 17:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220617164000.v8.1.Id769ddc5dbf570ccb511db96da59f97d08f75a9c@changeid>
In-Reply-To: <20220617164000.v8.1.Id769ddc5dbf570ccb511db96da59f97d08f75a9c@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 17 Jun 2022 17:14:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XV_FOTT1WKBEUVCXJgGtay1O8qDi7Mj4BG1AUL6nh9TA@mail.gmail.com>
Message-ID: <CAD=FV=XV_FOTT1WKBEUVCXJgGtay1O8qDi7Mj4BG1AUL6nh9TA@mail.gmail.com>
Subject: Re: [PATCH v8 1/5] arm64: dts: qcom: sc7180: Add wormdingler dts files
To:     "Joseph S. Barrera III" <joebar@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jun 17, 2022 at 4:40 PM Joseph S. Barrera III
<joebar@chromium.org> wrote:
>
> Wormdingler is a trogdor-based board, shipping to customers as the
> Lenovo IdeaPad Chromebook Duet 3. These dts files are copies from
> the downstream Chrome OS 5.4 kernel, but with the camera
> (sc7180-trogdor-mipi-camera.dtsi) #include removed.
>
> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
>
> ---
>
> (no changes since v7)
>
> Changes in v7:
> - Incorporated changes from Stephen's "Simplify!" series.
>
> Changes in v5:
> - Replaced _ in node name with -
> - Ordered nodes by name
>
> Changes in v4:
> - Cleaned up rt5682s files
> - Restored camcc definition
> - Added missing version history
>
> Changes in v3:
> - Removed camcc definition
>
> Changes in v2:
> - Word wrapped patch description.
> - Removed "Author" from patch description.
> - Fixed whitespace around "en_pp3300_dx_edp"
>
>  arch/arm64/boot/dts/qcom/Makefile             |   6 +
>  .../sc7180-trogdor-wormdingler-rev0-boe.dts   |  22 +
>  .../sc7180-trogdor-wormdingler-rev0-inx.dts   |  22 +
>  .../qcom/sc7180-trogdor-wormdingler-rev0.dtsi |  53 +++
>  ...0-trogdor-wormdingler-rev1-boe-rt5682s.dts |  29 ++
>  .../sc7180-trogdor-wormdingler-rev1-boe.dts   |  28 ++
>  ...0-trogdor-wormdingler-rev1-inx-rt5682s.dts |  29 ++
>  .../sc7180-trogdor-wormdingler-rev1-inx.dts   |  22 +
>  .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  | 408 ++++++++++++++++++
>  9 files changed, 619 insertions(+)

Something in this patch series you need to talk about how you relate
to Stephen's two patches, AKA

1. https://lore.kernel.org/all/20220602190621.1646679-1-swboyd@chromium.org/
- arm64: dts: qcom: Remove duplicate sc7180-trogdor include on
lazor/homestar

2. https://lore.kernel.org/all/20220518172525.3319993-1-swboyd@chromium.org/
- arm64: dts: qcom: sc7180-trogdor: Split out keyboard node and
describe detachables

Probably that should be in a cover letter. At the moment, it looks as
if you are assuming that patch #1 is there but you're assuming patch
#2 _isn't_ there. Is that correct?

-Doug
