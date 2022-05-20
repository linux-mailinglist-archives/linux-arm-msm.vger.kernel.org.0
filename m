Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90A9B52F58C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 00:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353851AbiETWQW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 18:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353846AbiETWQV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 18:16:21 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A19762B2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 15:16:20 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id eg11so12356751edb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 15:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xvie0QExXbdO9a6ZetpQ6DoZ8RHzFGI7AHEhn57vJjo=;
        b=b0LWh1jkiwtCTs7/NY5t9cERb0AJv432EorW/6rJ05w/AT0CTG5+oyybm3cf5ei2rH
         mUBjXpXoPNZ9pdd2a/OTiuTn0l25LBjH8JcvbQza4Hp0GCHknr9rLKGBVN0yFZ21sbVv
         KvyQap+JZT9Qt3hfwV4wMkZb/MBoSVAX2rvsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xvie0QExXbdO9a6ZetpQ6DoZ8RHzFGI7AHEhn57vJjo=;
        b=Dgp7T6K6f315Jiay8FtLvi1YNycHBMX0OsHAoKKBwy7KsWJz39QxZFI4gxOWzIB6Wl
         mmMOp+Ot3NeBWp7994FN7ijzwwtlNNQ5Hy1cZfxiTxqYylZ4x1Alkt/spA/1SgHnK4UR
         NCmgN0YvfVq4OfB8oWuYL+dNpeTJI943tZ7GULnRGIRwn/eiJgIHIUWtka/fLLPgywBY
         FoCvzdtpiOjOv072t16FpTOh/q1SZpCUxtKYs+9Iy4QIpZkyL975Rj3P263ftcIoHgra
         zUEg8TzL8y7ZrcQwxhOc1JqqJJs7eXH0xivTL30KZFK1VvnnVnMOq2d5wIttRTvBY7gS
         pLbA==
X-Gm-Message-State: AOAM531/zmLA0Xk0NzvOxx6EbUK2KjbHj/QmzNzDMQQyUOJXYzdDWPR2
        FWTJfZbcVwQ5EZdkTHIUi/BvSOfl5g88LcRc27U=
X-Google-Smtp-Source: ABdhPJz9RLpil5IvvNdpayxzWljM56J8+1kXr+X8U7rNDNsLKpAWlag2Umse6XR24mJbhQjvQc8Ltw==
X-Received: by 2002:a50:9b0d:0:b0:42a:4bda:c70 with SMTP id o13-20020a509b0d000000b0042a4bda0c70mr13351721edi.287.1653084978884;
        Fri, 20 May 2022 15:16:18 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id hy14-20020a1709068a6e00b006f3ef214e76sm3542954ejc.220.2022.05.20.15.16.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 15:16:17 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id m20so2046121wrb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 15:16:17 -0700 (PDT)
X-Received: by 2002:a05:6000:1548:b0:20f:c4e3:637a with SMTP id
 8-20020a056000154800b0020fc4e3637amr932134wry.513.1653084976906; Fri, 20 May
 2022 15:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220427020339.360855-1-swboyd@chromium.org> <20220427020339.360855-4-swboyd@chromium.org>
In-Reply-To: <20220427020339.360855-4-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 20 May 2022 15:16:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VSMyJrs9bTE2XEC=q7VtZi6YKFaKJQJyLTZhVaYa9-Jg@mail.gmail.com>
Message-ID: <CAD=FV=VSMyJrs9bTE2XEC=q7VtZi6YKFaKJQJyLTZhVaYa9-Jg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Only include sc7180.dtsi in sc7180-trogdor.dtsi
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>, patches@lists.linux.dev,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>
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

On Tue, Apr 26, 2022 at 7:03 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> The SoC is always present on sc7180-trogdor.dtsi and thus we should
> include it in the "generic" dtsi file for trogdor. Previously we had
> removed it from there because we had to do the spi6/spi0 swizzle, so
> each trogdor variant board had to include sc7180.dtsi and then
> sc7180-trogdor.dtsi so that the latter dtsi file could modify the right
> spi bus for EC and H1 properties that are common to all trogdor boards.
>
> Now that we're done with that we can replace sc7180.dtsi includes with
> sc7180-trogdor.dtsi and include sc7180.dtsi in sc7180-trogdor.dtsi as
> was originally intended. We still need to include sc7180-trogdor.dtsi
> before the bridge dtsi files though because those rely on the panel
> label.
>
> Cc: "Joseph S. Barrera III" <joebar@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi            | 1 -
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dts        | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dts        | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dts        | 2 +-
>  .../boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts    | 2 +-
>  .../boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dts    | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dts  | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dts  | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts           | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts           | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts        | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts       | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts           | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts        | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts       | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dts           | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi            | 1 -
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts                 | 1 -
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi                   | 3 ++-
>  19 files changed, 17 insertions(+), 19 deletions(-)

While reviewing a different change, I found something fishy and
tracked it down to ${SUBJECT} patch.

Specifically, after ${SUBJECT} patch then I run `git grep
include.*trogdor.dtsi`. When I do that, I see that
`sc7180-trogdor.dtsi` is double-included in all lazor devices. :( It's
included in the actual dts files and also in the lazor.dtsi file.

That's probably not right. I think we need to remove the one in the
lazor.dtsi file?

-Doug
