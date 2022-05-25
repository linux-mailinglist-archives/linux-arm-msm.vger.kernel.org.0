Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE6453427B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 May 2022 19:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343556AbiEYRwk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 13:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343600AbiEYRwd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 13:52:33 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F0EC2BF5
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 10:52:26 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id a15so1370271ilq.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 10:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pCOJwAVhHqabf7q+ofFTKhfH08ncrowINh8zKJmKO8o=;
        b=fH5vloMgnO8q0+QKAIm8czJR7NH9BJmMdne5Ag+L/GDQCO0gBO5HLcleZSz3O+/WrY
         Jov0PppgY6/ita+gQd8tm5Ri0XYd1n6NlOefOktjw+IPnLkpFgwbbp+iDrgqP9Emrwva
         xOU3+QDLodh1nWYbHoJAVL+ToVbcVfbPiIGjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pCOJwAVhHqabf7q+ofFTKhfH08ncrowINh8zKJmKO8o=;
        b=b/xAQ6kBlmYVsTbCyDvLpTW36Lz8W67kiXILBMUgyY0MzSTqdD4L/q/gXRVURO+ALz
         TRk7XDQ5HA1GUFEVgauuZdges/Fy54Sa1H20oUYTnQOWKKkGDGSAehnjSnF2+mkhOrcg
         1NLpQz+K4Upl7N3mUmkKAxcZSiSrQMlul3uH+C18OLZu4ULn1bSP8+tsLBMZAFzF8XRI
         /+De0kZS7NH0gNOfPO4oq9ArAJZXXmsHWjnIWbonrRYdNR/XpoN2/gG9/Y+vv96sdnXy
         dR8RnYh0EVwak6Js+5jkC/uwdKkR72Per4/QPr/rHYW3xbuHXhWEGwozfVIe7kDaxd/v
         N4lA==
X-Gm-Message-State: AOAM532RD0cvK1TZBIrQbLFVq6VyV9quBUM29nsGxtSQiaC7fwgQVm+K
        NcXmGv2uzE2bx+4lrDam731o4UAKP4rkBSH6ixs=
X-Google-Smtp-Source: ABdhPJwZOEMT5w+EzpN9zEkamuzM7hmzutl7x/Qc2ze0X5glQ9TTi0OQbiy4xLdJ0cus4+rzpnU5eA==
X-Received: by 2002:a05:6e02:66e:b0:2d0:f42d:33c2 with SMTP id l14-20020a056e02066e00b002d0f42d33c2mr17457753ilt.269.1653501145354;
        Wed, 25 May 2022 10:52:25 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id f16-20020a056602039000b0065a47e16f50sm4625766iov.34.2022.05.25.10.52.24
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 10:52:24 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id d198so17093812iof.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 10:52:24 -0700 (PDT)
X-Received: by 2002:a6b:6b10:0:b0:660:d279:31bb with SMTP id
 g16-20020a6b6b10000000b00660d27931bbmr10484568ioc.47.1653501144197; Wed, 25
 May 2022 10:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220525014308.1853576-1-judyhsiao@chromium.org> <20220525014308.1853576-4-judyhsiao@chromium.org>
In-Reply-To: <20220525014308.1853576-4-judyhsiao@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 25 May 2022 10:52:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UfT_TuAS9DaKQ4D3dE_cY=rqPHvSuvkD7SS1egVuFKbA@mail.gmail.com>
Message-ID: <CAD=FV=UfT_TuAS9DaKQ4D3dE_cY=rqPHvSuvkD7SS1egVuFKbA@mail.gmail.com>
Subject: Re: [v3 3/3] arm64: dts: qcom: sc7280: include sc7280-herobrine-audio-rt5682.dtsi
 in villager and herobrine-r1
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Judy Hsiao <judyhsiao@google.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, May 24, 2022 at 6:43 PM Judy Hsiao <judyhsiao@chromium.org> wrote:
>
> Include sc7280-herobrine-audio-rt5682.dtsi in villager and herobrine-r1 as
> these boards use rt5682 codec.
>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts | 1 +
>  arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts  | 1 +
>  2 files changed, 2 insertions(+)

Should have carried my review from v2:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
