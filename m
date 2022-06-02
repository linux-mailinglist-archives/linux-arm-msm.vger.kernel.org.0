Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFE6553BF50
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 22:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239165AbiFBUIj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 16:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239120AbiFBUId (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 16:08:33 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7F737A80
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 13:08:30 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id o10so7648041edi.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 13:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qgACnyK4+wOiS5MKuMTnoonRsVlmK8PYmGJQJvcgO6E=;
        b=gCNQf5treIeOY896E1dwCdHz3vHIg34Tiv2t6JPnU8eRhXoHeu6+4L3Uh/UmmoSB4J
         frLhr+7HqIhSw29Lu1hlJ8Fl7ddyJgm7PH15YadqhbxolK5DpD9Oozcz3nAx9uaLJYZl
         w+l3zgS2iBUS4NjgZcWirSTVwqmGjn+NPH/cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qgACnyK4+wOiS5MKuMTnoonRsVlmK8PYmGJQJvcgO6E=;
        b=nlr2t+OF3K+Cg9GNVXYGuXbrp51tHjV3W29tt/J5olS6KdlNvPoEN8j+fvAjpmTead
         uVgZwBB42nKdBJZLQAO4pag56s3vDDqm7B0y9nqk8iYFuQn851Fvpb4VmYdVfXzKhVq8
         pbU3oNKota4B8XKstY9CtM832yPLbEsBS7aeaWH4/aeKTrcdmClSC1AgeFsQoTUQUt43
         HlWIMj2uXZD6abl0c9CGttG/zlg/1TEgXecclXsXx42BHsegWjvH8Ow2hW0F/aFmBBF8
         Uaz4nQMeCh7sjrNqlNE2ddFXlmp9vOXS7JfZCO814y8MIPY5TcS4n9kgtkn5wGVmM8QH
         SuvA==
X-Gm-Message-State: AOAM5310MaersMCvD0AEtd7wgHF2YOJXulSvxHIOX28wdMAwu7/8mrMJ
        5xHaeK3C1MmJT3/l3u7PraL2a9s1f4utUw==
X-Google-Smtp-Source: ABdhPJz12mivylFAS3dwTAZ+scg95aVPoO238LL1QgreaFkT7QQTAyb0ddK5CNQ0KlAa6vMktC4Opw==
X-Received: by 2002:a05:6402:84a:b0:426:262d:967e with SMTP id b10-20020a056402084a00b00426262d967emr7352102edz.286.1654200509092;
        Thu, 02 Jun 2022 13:08:29 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id y3-20020a170906524300b006fee16142b9sm2023941ejm.110.2022.06.02.13.08.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 13:08:27 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id t6so7804817wra.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 13:08:27 -0700 (PDT)
X-Received: by 2002:a5d:68d2:0:b0:210:31cc:64a6 with SMTP id
 p18-20020a5d68d2000000b0021031cc64a6mr4886531wrw.679.1654200506938; Thu, 02
 Jun 2022 13:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220602190621.1646679-1-swboyd@chromium.org>
In-Reply-To: <20220602190621.1646679-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Jun 2022 13:08:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X6702aSaEnpXUhF40b0kZuz1QvOBLNg-xcNDYbVCbsDw@mail.gmail.com>
Message-ID: <CAD=FV=X6702aSaEnpXUhF40b0kZuz1QvOBLNg-xcNDYbVCbsDw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: Remove duplicate sc7180-trogdor
 include on lazor/homestar
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>, patches@lists.linux.dev,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
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

On Thu, Jun 2, 2022 at 12:06 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> The sc7180-trogdor-{lazor,homestar}-*.dtsi files all include
> sc7180-trogdor.dtsi and sc7180-trogdor-lazor.dtsi or
> sc7180-trogdor-homestar.dtsi, so including it here in the
> sc7180-trogdor-{lazor,homestar}.dtsi file means we have a duplicate
> include after commit 19794489fa24 ("arm64: dts: qcom: Only include
> sc7180.dtsi in sc7180-trogdor.dtsi"). We include the sc7180-trogdor.dtsi
> file in a board like sc7180-trogdor-lazor-r1.dts so that we can include
> the display bridge snippet (e.g. sc7180-trogdor-ti-sn65dsi86.dtsi)
> instead of making ever increasing variants like
> sc7180-trogdor-lazor-ti-sn65dsi86.dtsi.
>
> Unfortunately, having the double include like this means the display
> bridge's i2c bus is left disabled instead of enabled by the bridge
> snippet. Any boards that use the i2c bus for the display bridge will
> have the bus disabled when we include sc7180-trogdor.dtsi the second
> time, which picks up the i2c status="disabled" line from sc7180.dtsi.
> This leads to the display not turning on and black screens at boot on
> lazor and homestar devices.
>
> Fix this by dropping the include and making a note that the
> sc7180-trogdor-{lazor,homestar}.dtsi file must be included after
> sc7180-trogdor.dtsi
>
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Cc: "Joseph S. Barrera III" <joebar@chromium.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Fixes: 19794489fa24 ("arm64: dts: qcom: Only include sc7180.dtsi in sc7180-trogdor.dtsi")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> It would be great to get this into -rc1 if possible to fix broken
> display.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I tested and this fixes the "no display" problem on Linus's tree on
both homestar and lazor.

Tested-by: Douglas Anderson <dianders@chromium.org>
