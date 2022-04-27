Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 824E751244E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 23:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237431AbiD0VJI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Apr 2022 17:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237876AbiD0VI4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Apr 2022 17:08:56 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F36BD8CDB7
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 14:05:20 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id k23so5812174ejd.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 14:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wC/Y/xUAMY3MM1qWZscCo6iihTvh79u5k2H+tub7M5E=;
        b=FtTefVbihHVnJliLByKdlxfzTCkA6hkXRuVpjPjfpK7Oa0kTJUlsvEOldTXWCNcy8R
         NS656K5NfT9ME8aV/LBodl8YHBCxFs+MokOClhyZny34wKHaKFHE5QWoklgs2sSgrN6q
         ZaEoD5CFYhv4xaF3hnzN/9+MU2iyeE2Kq9lUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wC/Y/xUAMY3MM1qWZscCo6iihTvh79u5k2H+tub7M5E=;
        b=tWimK51KsAeQ8wOn8TrveF8qcDYK2WBBdtSheSS9zdTXcYgT44lUc0I/BwRjpZQEA3
         UMLnCxSWnrQf5Bb3HELeouBH8YEdqBqboWgskhDlR1xRCM9ylClotpZv5bcCqrkTtGCq
         GyVEgiems1dewxhqzwVuK9pS+YsCpIewxIzmHEEevzEPTzheBdO1JDXGZZLKYsAA0cy0
         oFjoQzTgyhCY/NnoRR1CjZdLkzeyCAXO0L7agS+kXGPw95GdP+4lJYSVkY8LZAjZnkt0
         1D3Cl/wBiXXWOAj6q3Tl1uPNbPjFcmRg8F7elO2y627qiVvKmE47NpR74aFulnzDOKtb
         JEww==
X-Gm-Message-State: AOAM530QYpvqZGhy0IP/Im9OAP/BdFNg50YoyY8d1NaeX/vzvqg/pMxz
        wqd7rzL4zW6Us7iuiTvOfAH62LDF9jJ9aEAC
X-Google-Smtp-Source: ABdhPJyeiYegNpYA3BU6Pl528l5725EQxZBAFX5N06G30oH/cy8zsfRvultAGq/OFilug7ekgo0Cvw==
X-Received: by 2002:a17:906:c14b:b0:6da:b30d:76a0 with SMTP id dp11-20020a170906c14b00b006dab30d76a0mr27768566ejc.279.1651093519043;
        Wed, 27 Apr 2022 14:05:19 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id x18-20020a170906b09200b006e8baac3a09sm7306052ejy.157.2022.04.27.14.05.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 14:05:17 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id u9-20020a05600c00c900b00393e729e655so1964218wmm.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 14:05:17 -0700 (PDT)
X-Received: by 2002:a05:600c:4f08:b0:391:fe3c:40e6 with SMTP id
 l8-20020a05600c4f0800b00391fe3c40e6mr36937959wmq.34.1651093516669; Wed, 27
 Apr 2022 14:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220426170306.v22.1.I7a1a6448d50bdd38e6082204a9818c59cc7a9bfd@changeid>
In-Reply-To: <20220426170306.v22.1.I7a1a6448d50bdd38e6082204a9818c59cc7a9bfd@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 27 Apr 2022 14:05:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UzhOrXgB4LrHO4kaSrfw1GQJMb0RNsQXYfG5kG8EwcRA@mail.gmail.com>
Message-ID: <CAD=FV=UzhOrXgB4LrHO4kaSrfw1GQJMb0RNsQXYfG5kG8EwcRA@mail.gmail.com>
Subject: Re: [PATCH v22 1/2] arm64: dts: qcom: sc7180-trogdor: Add nodes for
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Apr 26, 2022 at 5:03 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Add nodes for the onboard USB hub on trogdor devices. Remove the
> 'always-on' property from the hub regulator, since the regulator
> is now managed by the onboard_usb_hub driver.

There are people out there that are running trogdor devices with
upstream Linux. There's not much we can do about it, but probably this
patch will cause them to fail to probe USB because they won't have
"CONFIG_USB_ONBOARD_HUB=y". Luckily the commit subject has "USB" in it
so hopefully it'll be easy to spot, but I wonder if we should add
something to the commit message that makes that super obvious and
tells them about the relevant commit, like:

For anyone using trogdor-based devices on Linux, it should be noted
that this requires "CONFIG_USB_ONBOARD_HUB=y".


> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> Depends on "usb: misc: Add onboard_usb_hub driver" [1] which landed in
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-testing
>
> This patch was split off the above series.
>
> [1] https://patchwork.kernel.org/project/linux-usb/list/?series=615531&state=%2A&archive=both

I presume it will be moderately annoying if this lands in the Qualcomm
branch before the driver lands in mainline? Otherwise USB will fully
stop working on the Qualcomm branch. Do we want to postpone landing
this?


-Doug
