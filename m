Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F72F5F0FDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 18:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232105AbiI3QZ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 12:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232115AbiI3QZ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 12:25:57 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0BFACE6E5
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 09:25:56 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a26so10108536ejc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 09:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=H5nwdf+6a3nWhkjuSiALFiDXlcbOo5ZUX32+IBRmSng=;
        b=R4c/kdxbrr62ZWcJqRbnaugGrXExb3JpWqvTK3/tXTg0FhTZAxAJoOik7DAvoK+6Pc
         QGJ1F70NuRY7hI8zaB7NApUZKXf1R7FiA6LqA4dnT/1ciJeIldCT4hH7KoqEmZo11aEx
         4QN8CD3D8j0oSJu6unAgQCUkVOaVnG2gmWGZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=H5nwdf+6a3nWhkjuSiALFiDXlcbOo5ZUX32+IBRmSng=;
        b=zgE9mWV0hz/WEG6lM/tt+ZeVdZFvowdYmYUT/8bCDs5jKuvjwomn9Ib3Vho+8lLds9
         6GphBOkM1Y9iFfd87w8u8bJ08HvgUWn6onRkYQPQEKJC6ca1/22EWii2iN2dJYonrFIH
         fzuStrY0kYijlT8VmGTkjHcbOP7btTiI4XmM+UzTynevJI/N+2g2Omdk4xXaHjv2HJvZ
         TaufEq+1AbtkYQ+sObgrqw4e/6sb+7ajWSbvj3oZjMMxGspyJDF4DHCGrV3HC+wLVlCe
         +T87lKEYgraAfv8XGh1M81jsY27buFLdRakdKBS/AHZbY0j3z3gEXhBsKV2j1+LqINlo
         fW0g==
X-Gm-Message-State: ACrzQf2fzEBxS7ycHMPxqE7rT1Yt4IiGKU+wYS2sQYi9Xnx2+WAra95/
        9YfORRwIePkLZhg9K/rgtUgnx5s13dQiF7f7
X-Google-Smtp-Source: AMsMyM6TTYNnIpCNo1M0YT9bRhzZHBk3INciQcIkqbm9R/qSXcKvx/eGuOxocTxwZSefLA0AEBqXxA==
X-Received: by 2002:a17:906:8473:b0:77b:efa8:50e4 with SMTP id hx19-20020a170906847300b0077befa850e4mr6909980ejc.250.1664555154969;
        Fri, 30 Sep 2022 09:25:54 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906211200b0077077b59085sm1360374ejt.184.2022.09.30.09.25.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 09:25:54 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id o20-20020a05600c4fd400b003b4a516c479so2488405wmq.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 09:25:53 -0700 (PDT)
X-Received: by 2002:a05:600c:1e18:b0:3b3:b9f8:2186 with SMTP id
 ay24-20020a05600c1e1800b003b3b9f82186mr6683323wmb.151.1664555153017; Fri, 30
 Sep 2022 09:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220930073754.1391044-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20220930153538.v5.3.I50d04dcbe735dda69995cf1078824d671501869e@changeid>
In-Reply-To: <20220930153538.v5.3.I50d04dcbe735dda69995cf1078824d671501869e@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 30 Sep 2022 09:25:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHr9Y6oQR19wVVHC6jzcd82hf1bHNbr62n89vuTbme9Q@mail.gmail.com>
Message-ID: <CAD=FV=XHr9Y6oQR19wVVHC6jzcd82hf1bHNbr62n89vuTbme9Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: Add touchscreen and touchpad
 support for evoker
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Sep 30, 2022 at 12:38 AM Sheng-Liang Pan
<sheng-liang.pan@quanta.corp-partner.google.com> wrote:
>
> Change touchpad and touchscreen node for evoker
> Touchpad: SA461D-1011
> Touchscreen: GT7986U

[...cut...]

> +       touchscreen: touchscreen@5d {
> +               compatible = "goodix,gt7375p";
> +               reg = <0x5d>;

One further note is that in the commit message you've said GT7986U in
the commit message but you're specifying "goodix,gt7375p" here.
Ideally, what you'd do is:

1. Create a bindings patch modifying "goodix,gt7375p.yaml" much like
we did for elan [1]. You'd end up with something like this (untested):

  compatible:
    oneOf:
      - const: goodix,gt7375p
      - items:
          - const: goodix,gt7986u
          - const: goodix,gt7375p

2. You wouldn't need any driver patch unless the timings for gt7986u
are different than gt7375p

3. In your device tree, you'd list:

compatible = "goodix,gt7986u", "goodix,gt7375p";

...which says "I really have a gt7986u, but if you don't have any
special knowledge about gt7986u then you can just pretend I have a
gt7375p".


[1] https://lore.kernel.org/r/20220923083657.v5.2.Ic4e8f03868f88b8027a81bc3d414bae68978e6b7@changeid
