Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA5415827EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jul 2022 15:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbiG0NqJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jul 2022 09:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232796AbiG0NqI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jul 2022 09:46:08 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 892DC13EB1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 06:46:07 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id z22so21449075edd.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 06:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=3+CIoBgIXCefHdiPwAwmZSqgvqBVzos7wCXQs6Z6pGY=;
        b=aAMKAAp0Q4vQ/GYiK/iVkkfSuNwFapAYxENRknBuwJ0oTeimvIONUDXaUCGYJnl+MN
         dCm+jifGdmZjh4mTxyNbJnJUuU0nV5KE68sSxyqe66eohR+CGWtnV5MeI+pKrrCklWCV
         FmD3Gc8j8kYyGdNRRSEFwFprV0BA1X2ynOk+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=3+CIoBgIXCefHdiPwAwmZSqgvqBVzos7wCXQs6Z6pGY=;
        b=CWg3CMUETJlpJiIPDgIzQmlVdhEC51nyhbEsgvXqYO68ckH6yZeCcthCuJZ6WaZGC9
         A5U+QdFYK8sCZfArILajx24dJ3mT5r2E8M6W/VQxPeMgp5DuhSos3lLFFD5kWDE2XwwL
         XVEkV0xIzGwAm2O8EmXTzc/aLTMZ/L0BPD2VsK2B+26GpN/1nf+d6ZI9Af/x+DtxAEpu
         woHe5SPyCITfZulyxy47RbnLIU7gn2DsF5Y7vMcdRRvBgUtj45mtyHYqkf1+0v948ApR
         H8AXI1KK6ZOWnEVygQyjGOXGurZj2rul0Eo0W3MLP0dtXAY7VwcvEctn7g+RaQGemGeZ
         tKlA==
X-Gm-Message-State: AJIora8TUX6zenhvZ9lMef/l4QHtFXXspkZrgrv1fEqEKyjdOuRjV0Fr
        U1r60NqGoXG+EPHpDjHEktaYf1BUB+oJNn4b
X-Google-Smtp-Source: AGRyM1tmfjijLtjeYhR9gtydCwoZSvdURQYamn53D5PXk4gC6tOg0tMapvpQFFzEiKaUwX62gdS9yw==
X-Received: by 2002:a05:6402:538a:b0:43a:298e:bc2b with SMTP id ew10-20020a056402538a00b0043a298ebc2bmr22932037edb.125.1658929565950;
        Wed, 27 Jul 2022 06:46:05 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id ku7-20020a170907788700b007052b183d51sm7619160ejc.132.2022.07.27.06.46.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 06:46:04 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id b26so24303154wrc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 06:46:03 -0700 (PDT)
X-Received: by 2002:adf:ead2:0:b0:21d:8b49:6138 with SMTP id
 o18-20020adfead2000000b0021d8b496138mr14815614wrn.138.1658929563550; Wed, 27
 Jul 2022 06:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220726212354.1.I5b9006878bdabd6493b866b46dbd6149968d545b@changeid>
In-Reply-To: <20220726212354.1.I5b9006878bdabd6493b866b46dbd6149968d545b@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 27 Jul 2022 06:45:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VJDT5dK46AonaO69Xzf_LTBvbZrBOqpPV8qqhvp1Ms=g@mail.gmail.com>
Message-ID: <CAD=FV=VJDT5dK46AonaO69Xzf_LTBvbZrBOqpPV8qqhvp1Ms=g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: document zoglin board
To:     Bob Moragues <moragues@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Bob Moragues <moragues@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jul 26, 2022 at 9:24 PM Bob Moragues <moragues@chromium.org> wrote:
>
> Zoglin is a Hoglin Chromebook with SPI Flash reduced from 64MB to 8MB.
> Zoglin is identical to Hoglin except for the SPI Flash.
> The actual SPI Flash is dynamically probed at and not specified in DTS.
>
> Signed-off-by: Bob Moragues <moragues@chromium.org>
>
> Signed-off-by: Bob Moragues <moragues@google.com>

You need to figure out how to get your system not to add the extra
"@google.com" Signed-off-by. It's probably worth spinning a v2 with
that, if for no other reason than to debug your setup for the next
patch you send.

Other than that, this looks right to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

(you should carry my Reviewed-by tag forward on your v2 unless you
change anything significant)
