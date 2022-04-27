Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54D85510E37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 03:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356815AbiD0BmR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 21:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356813AbiD0BmQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 21:42:16 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C64421002C2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 18:39:06 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id e189so530378oia.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 18:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=JXmTulGYUsyP176e76/nF1iCXcOh0XmzJ8/VWjdkiR0=;
        b=RuwVqdMzYiU9T6M3Du19x1/Dyr8DeVrhQUJyEcz6mwyeuj359MkgcJMCgyGATRbzq5
         QWtjA5RdrWf2PoFmX9Jr3ZVFCPMoqQUHkQ5j1ep8FA4UJGBIrPK8WPFKeDgRJNsdyPCn
         WkPNzYizGEdxBnubUDPLk1oUy7bm6cDFr0Dy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=JXmTulGYUsyP176e76/nF1iCXcOh0XmzJ8/VWjdkiR0=;
        b=LYWxM3Z/LWCHZlBBzTnb98coJWkkfyCtIWcEK1JaMLaQZOswF8qmWeGoHnDOeJjQeR
         bIZbYA9iu6PNjH0eLX95jyZInKcNnFQ8IrG2bMXZ9agK6noBd3EOy5r5pvcitoBJDYZB
         XtRnoTwsC6nrs4URjNQ8Uld/OYvFBd3SYgkOLT2xepjjap9BbuyO6qshKeQtyKtef7zj
         VbuzrD5g3k+Rza6/nLJN6dd4x09sdE3Fg4DUFySuXqC5JUeCd6opgGahmi4cyU1UGr89
         NCeCqIkw0GERXEaelo8xcO2qCgUDT/HBshxqTt0NbrYAonawh96cwd3K0MaCJwqU9oKR
         Lcqg==
X-Gm-Message-State: AOAM5326/yUxLvIuFz2rAeXfN3paA5ieBa8FegIIMwx74uD/e/JdhCJv
        420wOhuWq2P1FsjGy9grtPbna2mpUm2MZ/cSmT1TZw==
X-Google-Smtp-Source: ABdhPJzsX79g6i+L7fGZ72ubSgkdyIwDZPUr0CTxtVjUYVv1Guf+xHbfosvF2v2Y/M85BpP6wlbTw1rgGLo5LxiWKi8=
X-Received: by 2002:a05:6808:1296:b0:325:8fb:68f3 with SMTP id
 a22-20020a056808129600b0032508fb68f3mr8167795oiw.193.1651023546195; Tue, 26
 Apr 2022 18:39:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 Apr 2022 18:39:05 -0700
MIME-Version: 1.0
In-Reply-To: <20220426151204.1.Id2821de5fde55ebe928e8fc87a71c8d535edb383@changeid>
References: <20220426151204.1.Id2821de5fde55ebe928e8fc87a71c8d535edb383@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 26 Apr 2022 18:39:05 -0700
Message-ID: <CAE-0n53juQ8--Sai=wKypj8URw+V1giOOhzd-p13fVbe_vxZ0Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: wormdingler: Add wormdingler
 dts files.
To:     "Joseph S. Barrera III" <joebar@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
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

Quoting Joseph S. Barrera III (2022-04-26 15:12:06)
> Wormdingler is a trogdor-based board, shipping to customers as the Lenovo IdeaPad Chromebook Duet 3. These dts files are copies from the downstream Chrome OS 5.4 kernel, but with the camera (sc7180-trogdor-mipi-camera.dtsi) #include removed.
>

Please wrap lines at 75 columns or so.

> Author: Joseph S. Barrera III <joebar@chromium.org>

This shouldn't be necessary as it matches the From: line of the email.

> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
> ---
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
> new file mode 100644
> index 000000000000..945caa21962f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
> @@ -0,0 +1,416 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Wormdingler board device tree source
> + *
> + * Copyright 2021 Google LLC.
> + */
> +
> +/dts-v1/;
> +
[...]
> +
> +/* PINCTRL - modifications to sc7180-trogdor.dtsi */
> +
> +/*
> + * No eDP on this board but it's logically the same signal so just give it
> + * a new name and assign the proper GPIO.
> + */
> +
> +tp_en: &en_pp3300_dx_edp {
> +       pinmux {
> +               pins = "gpio85";
> +               };

Please add a newline here and deindent the "};" to match pinconf below.

> +       pinconf {
> +               pins = "gpio85";
> +       };
> +};
> +
