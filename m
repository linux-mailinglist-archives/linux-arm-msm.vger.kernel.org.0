Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 116533E9AFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 00:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232498AbhHKWmA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 18:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232456AbhHKWmA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 18:42:00 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCCBC0613D3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 15:41:35 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id s21-20020a4ae5550000b02902667598672bso1167164oot.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 15:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=plYGpTUg3hBhPNsukENJbkJpmTCgfsG18WpFEKeEYE4=;
        b=JMlici0AajcWDdqg6fs6d2wOsARMz4QpwexTWAf2qz6vFZkJKfwBMxrymuHHnp0FQV
         f/gNzudYQZk4S4IQxMzWZCkChvYIf7928QcvW383a5vi5tVGB/jRkTwNcmacN2tkjoTV
         zHSRPSByW/SuyvubcTqejOVOBzLiq78Jdp6yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=plYGpTUg3hBhPNsukENJbkJpmTCgfsG18WpFEKeEYE4=;
        b=DESQQfc5Cg7oLS7LRTfsAkWgW3jGa920mSQZBpjNVaFyzlUlKSiJFknhPYodbH88Nn
         avV3ED0wGTkYklcbe/0BKHVek/9+A1uiHrmsJkWr1H29HZMkHtjKcHElArN1k5mejJ3l
         IW2yLnzSyaF0CSZQmc+4OiFykFaQ54LtAJJ9OqDpHZlYKG5gw+QIsfF/zqQz5x9N2x3E
         WrSYIQKaL3RONRBiN09Xc5xRCxyCVMVIENNHJcBm9kuEaLxv9GQl6PDun7SKS4YDK3kx
         GEXfD/G1HiVp50C5KKHnLqyyqzfQJRJZ2lp7xSlCx6xLDK1k1I2I2wEaZTL2PjeZbLrf
         xF9g==
X-Gm-Message-State: AOAM532LLvfMfl92GiU40MNuTCm+km07kEAnzB8Lv3Hwzi3i7f/nio1x
        GugTfreiapbCrdkIXZIDJBHtkgGsACZwpqZkSYBGdw==
X-Google-Smtp-Source: ABdhPJx7N5s94WZG4b/nlp66DhI8qmu08SxIsV8d4hs541kZBTghgqNQsx72zF/VSSnlyIpFN83wGa+wsQlfkJBO9Ik=
X-Received: by 2002:a4a:96e1:: with SMTP id t30mr783364ooi.16.1628721689507;
 Wed, 11 Aug 2021 15:41:29 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Aug 2021 15:41:29 -0700
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Xks_cSAEWMUxCriLbhAQ11CkVUrJJ97waMgGUVF7mPyg@mail.gmail.com>
References: <20210811194719.856593-1-swboyd@chromium.org> <CAD=FV=Xks_cSAEWMUxCriLbhAQ11CkVUrJJ97waMgGUVF7mPyg@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 11 Aug 2021 15:41:29 -0700
Message-ID: <CAE-0n50qS-SgDTTMq33fu_q_Bnj6xKaKGta48JXQs_uuv_5BWA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Fix lpass dai link for HDMI
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2021-08-11 15:28:02)
> Hi,
>
> On Wed, Aug 11, 2021 at 12:47 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > This should be the dai for display port. Without this set properly we
> > fail to get audio routed through external displays on trogdor. It looks
> > like we picked up v4[1] of this patch when there was a v7[2]. The v7
> > patch still had the wrong sound-dai but at least we can fix all this up
> > and audio works.
> >
> > Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> > Cc: Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Fixes: b22d313e1772 ("arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for HDMI")
> > Link: https://lore.kernel.org/r/20210721080549.28822-3-srivasam@qti.qualcomm.com [1]
> > Link: https://lore.kernel.org/r/20210726120910.20335-3-srivasam@codeaurora.org [2]
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
>
> There were other changes between v4 and v7. Do we want to take those
> too? Basically two things discussed in my response to v5 [1].

Will you provide a Reviewed-by if I do? :)

>
> 1. I think we don't need `#sound-dai-cells = <0>;`
>
> 2. It seemed marginally better to call the node `hdmi@5`, not `hdmi-primary@5`.
>
> Also, in case you're comparing to v7, it looks like v7 still had a
> bug, though, that your patch fixes. It still had "sound-dai =
> <&lpass_cpu 2>;"
>
> So confusing!

Thanks. Hopefully v2 is better.
