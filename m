Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5FA5188A4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 17:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238585AbiECPhN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 11:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238563AbiECPhM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 11:37:12 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C57E32CE14
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 08:33:39 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id h11so5342788ila.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 08:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gvRzGHxzShcbzeb9SvoZt+wpZS+HlwfYAw4KbiIeK9c=;
        b=Fz56/UjZT+JA/KlltkVjMTZpS/FLpEs3AL3ljnlrpQHHY8+55+WJNjdp1tMejkjHtc
         B8bI1ZlgayDQbuYu5iZLJSRFBB2pY9+H7DO4/ATwr+KUcTZQZCqEWxgTxYkvcEzjxUGV
         eRNBrmVcR84f7wLKt6jRx6+49iSe6XvmpqhR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gvRzGHxzShcbzeb9SvoZt+wpZS+HlwfYAw4KbiIeK9c=;
        b=CMf+OAI49DsnDNfydtGo6E3l1zaCVtTsXd3uuFjBjdqcrWEy8nSt4UaqZb8gWYUQJ5
         Z+llT3MU2zbNi+IMn5PnthHE4EczFO/VUvJ8zN62uJOzc1zrFATy0yyM9FnUtEFKHE5P
         qHARvY0SZNhvKv+RMcO409b2g4uDD4FFiY5t+yL2DIgx0S5j71/YTCIq8T7seGer81kI
         kIY5rZjVgQ3pgRGTAfPrGfJqMi5gup7B81dNp8bTVLoEQEtG1lzigLIRVUgPfV/6vUp6
         YpGfZJGZ6yQdWncMak6dQR6E26eL1h9iypQXS+t4aA9jTLnZS3Tx3LCETu9Np7m1zZuH
         ZPPg==
X-Gm-Message-State: AOAM531nLyRhBgEw7sAqO5wZ/6qYJQQQBASo7x4oIXM6G7L5VBnHS1ET
        BWJs+Wl6GqDqa1/bHm0ZnSOrB8wtxlLt593l
X-Google-Smtp-Source: ABdhPJw01fuA8nrkWZlxxmmjV8miQ+W81bgqMM9HS5ICN+W2ZYUwziN7HNQSHshhEv9JSJH7e2s0kA==
X-Received: by 2002:a05:6e02:1c2d:b0:2cd:7ada:ae3e with SMTP id m13-20020a056e021c2d00b002cd7adaae3emr6639866ilh.176.1651592018716;
        Tue, 03 May 2022 08:33:38 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com. [209.85.166.51])
        by smtp.gmail.com with ESMTPSA id r13-20020a056638044d00b0032b3a7817adsm3972543jap.113.2022.05.03.08.33.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 08:33:38 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id c125so19336208iof.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 08:33:38 -0700 (PDT)
X-Received: by 2002:a05:6638:35a0:b0:32a:8f99:fa03 with SMTP id
 v32-20020a05663835a000b0032a8f99fa03mr7388950jal.8.1651592017817; Tue, 03 May
 2022 08:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220428094043.v23.1.I7a1a6448d50bdd38e6082204a9818c59cc7a9bfd@changeid>
In-Reply-To: <20220428094043.v23.1.I7a1a6448d50bdd38e6082204a9818c59cc7a9bfd@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 3 May 2022 08:33:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VVVRj=FeW0dkPs+KGD_x=Xc+Vy9GiMsqZzW6OSirnuQw@mail.gmail.com>
Message-ID: <CAD=FV=VVVRj=FeW0dkPs+KGD_x=Xc+Vy9GiMsqZzW6OSirnuQw@mail.gmail.com>
Subject: Re: [PATCH v23 1/2] arm64: dts: qcom: sc7180-trogdor: Add nodes for
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 28, 2022 at 9:41 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Add nodes for the onboard USB hub on trogdor devices. Remove the
> 'always-on' property from the hub regulator, since the regulator
> is now managed by the onboard_usb_hub driver.
>
> For anyone using trogdor-based devices on Linux, it should be
> noted that this requires "CONFIG_USB_ONBOARD_HUB=y".
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> Depends on "usb: misc: Add onboard_usb_hub driver" [1] which landed in
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-testing

Looks like this got reverted again. :( So the dts changes definitely
need to be put on hold until it gets sorted out...

-Doug
