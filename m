Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 456E53C7A6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 02:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237112AbhGNAKG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jul 2021 20:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237098AbhGNAKF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jul 2021 20:10:05 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC4DC0613DD
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jul 2021 17:07:14 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a18so330793lfs.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jul 2021 17:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IEtc6WN0JMkgA1X93JOHMXDth957tk+vFhRSm4MpLAM=;
        b=kjXNNfOnOZfSXBl9SvNCTU7DVpgzZWIJVg9FqMS+1JX+6OMWWH9CLz877AqiHOprT/
         /lsKfkuIYEXI5WFMO1UydRgKvGakHia0Zef/k9HPAsht+GzeUkroxtZWMCQ2STLroRkq
         FbqTR01kbBnrLWRZIyDwPLNuRZw8bHlvVIeiols+N3IWOXnQTDwnr76itERqCDK3hsXZ
         ftqKLC+BlDomCfes9K25/WuyzNNNMkx43ZllqSA63P/fqo0Y8nrvLk14aMTDmLSU3tmX
         DEurRNdYe9gDg4EtE+LjmrSjSrKtx9TtcvisAvYwwvXgU6rLgKJAohSbtf0H2B/+yt/o
         Sq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IEtc6WN0JMkgA1X93JOHMXDth957tk+vFhRSm4MpLAM=;
        b=a96iSGwp1lpaj0ZUYl5/zTZGhsfwNadYFKkVdKC4224xN3Cm/Zxt9Q+dLo2Kar4BK2
         SbYPyOyo71Du8FlfTvJ9hYrRqgXeC/ndmuZNyb72MknpH52ilahVKlDTED8+mEypwy4z
         JawOsiwCEItv/9OrB9A9mclkpNEkDKwwqZbbNAJDMP7VPKaXPrrbjw/ENxpHTk6N5B/x
         RduwPeSC1WDIPpHr+EGn5bDeoPXjd98mMcgNjDYwrE0xnlF9i5GMU0G/0DuhmTnpeVqd
         m6voIdfmKQM4QVHhG9RedCq4+MmoFxRc5XvEKfyeEejWbwvaOf31sY0TyzuEc9CUlHxG
         X2sw==
X-Gm-Message-State: AOAM531f5PprkApxKqOvqgGrer7vX0gZnRaKIC+VGVLRw/j00wJhaCOc
        SaOpK2zjinqN1+JoOlcgBhSuglT28ocXMFBKjB/VWA==
X-Google-Smtp-Source: ABdhPJz8YKla708wW5apcE2e48dD+UxOPlSdmQcDXhRj1YqgSttTekZln8X6HfzXhD+WqceB5w0KiAl65c8UEeH/5gw=
X-Received: by 2002:a05:6512:22cc:: with SMTP id g12mr5427042lfu.535.1626221232412;
 Tue, 13 Jul 2021 17:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru> <20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 13 Jul 2021 17:07:00 -0700
Message-ID: <CALAqxLX_FNvFndEDWtGbFPjSzuAbfqxQE07diBJFZtftwEJX5A@mail.gmail.com>
Subject: Re: [PATCH 29/29] arm64: dts: qcom: Harmonize DWC USB3 DT nodes name
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 20, 2020 at 5:10 AM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> In accordance with the DWC USB3 bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> named.
>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

I know folks like to ignore this, but this patch breaks AOSP on db845c. :(

In the exact same way an earlier patch broke HiKey960:
  https://lore.kernel.org/lkml/CALAqxLWGujgR7p8Vb5S_RimRVYxwm5XF-c4NkKgMH-43wEBaWg@mail.gmail.com/

(which I still have to carry a revert for).

I get that this change is useful so more dynamic userland can find
devices using consistent naming with future kernels (but doesn't the
dynamic userland have to handle the case for older kernels as well?)
But for userland that uses static configs, its painful as updating
userland to use the new node ids then causes older kernels to fail.

I'm looking into how we might be able to probe and set the property
dynamically, but AOSP's init system is far more aligned to static
configs.

This will probably be ignored again, but it would be nice if we could
have a release where DTS changes don't break userland for one of my
boards. As it feels like its been awhile.

thanks
-john
