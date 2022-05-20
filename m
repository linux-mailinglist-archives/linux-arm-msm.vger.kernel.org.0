Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3CCF52F488
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 22:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353523AbiETUjk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 16:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353517AbiETUjj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 16:39:39 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF3A19FF53
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:39:38 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id f9so17731335ejc.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iSGqP8k10DFS00Kv/7Pr3iy8rKQRiyeNX2aJmQ3LLsM=;
        b=FTMVepZP6e/k7QioiDdbKxNtwhWGQn0dhQoWkprd/KGGrVjGhD8TaFhu0SKJJneTu3
         WXVoqKaj9KwLoKuh0hSVIaVAyLbluk+TKxuDlLVhpkvClzrdh8/2Zsf2NWWy/OXqPpZ5
         rJaozeD4h4ZnFkjfHsMC40Q208VRfheGECHpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iSGqP8k10DFS00Kv/7Pr3iy8rKQRiyeNX2aJmQ3LLsM=;
        b=uVmUmb5WNgdJWG5vew190K+E9db73E8D0W2k42J4H4bZpw3gPqnmlDY5PdDyPvnMTH
         2QhvvlzYcPURn57D+bLkWG7IprPMr5w7PN+8pTF8uqCm5QlZkiuV1TOG7cqTiEFAdc2U
         iQSbgOYHMLLhyTD4wcjvIbGB0+U7jEZw3BDFkGhj2G6G24AzQM5dYs7G/Mok3q5Y2Vcg
         v1rqozP8wF5DnVAeRJHxDQf0SJI0R+po/D6Dg4aJGPKRQfaoOQ1p71+UiYscZvuUlRXV
         h4hKz1JMvFpoVFMXCogWi8fSFew7N4JqmfLB6Wbld/hJGwdH8iewpOHLzE9144qn8T30
         hhyw==
X-Gm-Message-State: AOAM533OS/+oC8+ZrSrxL9J5wXvYgl34OwBOc27XGmmllxiKISveSnYR
        YXjkSCiA3b4s0OLK+eS1iY6Lvhz6gWWoU60ch1A=
X-Google-Smtp-Source: ABdhPJwfGGYlsJZZofeAv3bATTjBJYyhadMQgqOI0iPWE9kEYxktT+DzhAgqT5+lbgFhCZLeQswNZg==
X-Received: by 2002:a17:907:1c8f:b0:6e8:f898:63bb with SMTP id nb15-20020a1709071c8f00b006e8f89863bbmr10565378ejc.721.1653079177271;
        Fri, 20 May 2022 13:39:37 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id 15-20020a170906004f00b006f3ef214dd9sm3058687ejg.63.2022.05.20.13.39.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 13:39:35 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id t6so12954663wra.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:39:33 -0700 (PDT)
X-Received: by 2002:a05:6000:1c03:b0:20e:5cac:1eb5 with SMTP id
 ba3-20020a0560001c0300b0020e5cac1eb5mr9870704wrb.422.1653079173296; Fri, 20
 May 2022 13:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220520161004.1141554-1-judyhsiao@chromium.org>
 <20220520161004.1141554-2-judyhsiao@chromium.org> <CAE-0n53e0bq_MbfgZYdxatP8CpGVMKkBKOnSDOV+MvbBFB6wOA@mail.gmail.com>
In-Reply-To: <CAE-0n53e0bq_MbfgZYdxatP8CpGVMKkBKOnSDOV+MvbBFB6wOA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 20 May 2022 13:39:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VX_dr+hrNEGyC7GxcYcbMeL-uMaVLEJ5EgKnb76HVoDA@mail.gmail.com>
Message-ID: <CAD=FV=VX_dr+hrNEGyC7GxcYcbMeL-uMaVLEJ5EgKnb76HVoDA@mail.gmail.com>
Subject: Re: [v2 1/3] arm64: dts: qcom: sc7280: herobrine: Add pinconf
 settings for mi2s1
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Judy Hsiao <judyhsiao@google.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 20, 2022 at 1:38 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Judy Hsiao (2022-05-20 09:10:02)
> > 1. Add drive strength property for mi2s1 on sc7280 based platforms.
> > 2. Disbale the pull-up mi2s1_data0, mi2s1_sclk.
>
> s/Disbale/Disable/
>
> The commit text is a list of things done but no reason why they're done.
> I'd appreciate more freeform text with a blurb why a drive strength is
> chosen and why pulls are disabled.
>
> > Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> > index 9cb1bc8ed6b5..6d8744e130b0 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> > @@ -612,6 +612,20 @@ &dp_hot_plug_det {
> >         bias-disable;
> >  };
> >
> > +&mi2s1_data0 {
> > +       drive-strength = <6>;
> > +       bias-disable;
>
> Is there an external pull on this line?
>
> > +};
> > +
> > +&mi2s1_sclk {
> > +       drive-strength = <6>;
> > +       bias-disable;
>
> Is there an external pull on this line? If so please add that details as
> a comment like we do for other external pulls.

Actually, I think they are output lines, which is why they have a
drive-strength. I think for output lines we don't usually comment
about why we're disabling the pulls, only for input lines?

-Doug
