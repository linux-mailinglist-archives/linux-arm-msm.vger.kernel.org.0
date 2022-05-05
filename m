Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8182751CB96
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 23:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386152AbiEEVtD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 17:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386118AbiEEVs5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 17:48:57 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C82EE214
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 14:45:14 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id gh6so11170000ejb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 14:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9a49K+nsIpClkkZJMCjWXi8/OJdtqcmRhzbltH+MvOc=;
        b=kp3l63ItWPcoj3mIJFjL1IS0DRKLyCgq8rg4f+5Xx4U7BSNFu/vpr3X3kPrINxWG1y
         d4JS+qP+fmnZlhoPr5rrxuKxTeRFD8zpP3dHL+NRp/2aruwblCvzL3UEjWgzvScPOgHO
         OoIyC3l+RahxKrVlyOwHDLG9nq+F4L/tutw2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9a49K+nsIpClkkZJMCjWXi8/OJdtqcmRhzbltH+MvOc=;
        b=jsk6Gz5l1NLOEOVt6oBKwOgFD4MNzPDoNkfGhYTy90+ZS/zc/65+0U03yVVZP14fYq
         8/x43bUytZf7/YiOvUc+xovKReZUrrD+zkIqIE+tWpg+8DTNph1GBw4I+XDVANow5dzD
         i9cnLoDiHwQCtSQyNlLTbpD7yI0l0w4KmBkfV4gClOU1404ngem2osXZawWiimpZ454n
         WDZh2FIiuxJE4LZXBSU11JnwwWYJfQS4NCz2D69/fkF8iGuc6INwe/pJ2OvyyIj9elHO
         r30zJj/QCuulyWIyssLPpZlIaP3nCcazuBjRDPvwRyhcssIHNVWo++Bgk6AuLyOKOdwA
         uEQQ==
X-Gm-Message-State: AOAM532Y5OCVXJNsbicdc4blk8Cz43IidA63j0a9xYtK4w1fBDHs/4xP
        le4Lu+fvUHSzwshdDiKY2UymYWqHoC9CmpQUzRw=
X-Google-Smtp-Source: ABdhPJxdqhFG+u40j51SPqZ7BYNhgcXKk1XEPfD8K3fAOHR4DM0+neRP6qfNtRKFRfXml+uXBXKAfg==
X-Received: by 2002:a17:907:97d4:b0:6f4:c876:6f6b with SMTP id js20-20020a17090797d400b006f4c8766f6bmr157799ejc.627.1651787112946;
        Thu, 05 May 2022 14:45:12 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id zd9-20020a17090698c900b006f3ef214e28sm1216556ejb.142.2022.05.05.14.45.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 14:45:12 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id x18so7733998wrc.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 14:45:12 -0700 (PDT)
X-Received: by 2002:a5d:42c8:0:b0:20a:d91f:87b5 with SMTP id
 t8-20020a5d42c8000000b0020ad91f87b5mr103577wrr.301.1651787111509; Thu, 05 May
 2022 14:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220505104024.v4.1.Id769ddc5dbf570ccb511db96da59f97d08f75a9c@changeid>
In-Reply-To: <20220505104024.v4.1.Id769ddc5dbf570ccb511db96da59f97d08f75a9c@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 5 May 2022 14:44:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vb8EJJakDYkZLiAEqU1iFUfU4oNwAbTqiH9dM7Ph0BxQ@mail.gmail.com>
Message-ID: <CAD=FV=Vb8EJJakDYkZLiAEqU1iFUfU4oNwAbTqiH9dM7Ph0BxQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] arm64: dts: qcom: sc7180: Add wormdingler dts files
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, May 5, 2022 at 10:43 AM Joseph S. Barrera III
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
>  .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  | 417 ++++++++++++++++++
>  9 files changed, 628 insertions(+)

This series looks great now to me now. Bjorn: if you agree and if it's
not too land to land these for 5.19 that'd be wonderful. Otherwise I
guess we've snooze for the next 4.5-5.5 weeks... ;-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
