Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D849255AB1D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jun 2022 16:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233003AbiFYOpl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jun 2022 10:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232977AbiFYOph (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jun 2022 10:45:37 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22034140C0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 07:45:37 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id c65so7184537edf.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 07:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TL/BmZNGSH0YDu8VnWJmtXrclXOV4slFnYUNd3pBuw4=;
        b=aQIBfwmMXYQv2Dj5sonaawXdulKap1MyHWcEGk2rr1YTsThaBv0VAWvyjc7z60te9e
         4FBP4j18U/sh397iE/kUgdCqG1F5zeZs5vuwO5gaamkmTpqKrecFFboWVL+v23NqegqQ
         ZYYm8NdB4DY/M51y3/91g3JkRt1EzEXelW0T4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TL/BmZNGSH0YDu8VnWJmtXrclXOV4slFnYUNd3pBuw4=;
        b=sfFbI1r+l/XdHAu+sxMaSfUV+PBQJ4E7A2IBIErkRc2ArfbJ7aqvQX0LNrXh/7S7cg
         /7kU7YKwNG4tZa2Uo0Ook1xHpTotPYjd8kRfU+XDTVEW/azkknsuugwcPZ/G9r6B3W02
         kGTxJ2OE6v/fKHy3mAQPJayqt9cOIttZU0KEDEsfijqklMU515V31WU3S9FJOz2VE/h8
         GeIqsu5GfyWXfbziGo0Q2LKM/MIbSTmXichCBcFSErN7hn+ZN6TDyuBbQdvThx0EO/hl
         wib0xX7gzfSYnWvjEi5qiQH7Ps9IuTA0Ip4w6NQwj/N8M728uNRAETYXRsRcyn9LFBvP
         Lu4Q==
X-Gm-Message-State: AJIora9K+zQlezR5UHIBCuFGvxabztDiUzUQLN6BUQFlUAZkSqKl3oqK
        JfsZF51QxiXVHV8e4E4K1I81J3XxPXgqt41Yn60=
X-Google-Smtp-Source: AGRyM1td70x9zGBWdP47Fdzlh7V12C9dVAQzhiG75v9zHuIUucFNqQU5C11m1E30SUufU6srzh5WQA==
X-Received: by 2002:a05:6402:51d3:b0:431:6c7b:c35 with SMTP id r19-20020a05640251d300b004316c7b0c35mr5539557edd.28.1656168335367;
        Sat, 25 Jun 2022 07:45:35 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id v2-20020aa7d802000000b0042ab2127051sm4076399edq.64.2022.06.25.07.45.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jun 2022 07:45:32 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id d17so1258630wrc.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 07:45:32 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr3993162wrr.583.1656168332218; Sat, 25
 Jun 2022 07:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220625022716.683664-1-joebar@chromium.org> <20220624192643.v13.4.I41e2c2dc12961fe000ebc4d4ef6f0bc5da1259ea@changeid>
In-Reply-To: <20220624192643.v13.4.I41e2c2dc12961fe000ebc4d4ef6f0bc5da1259ea@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Sat, 25 Jun 2022 07:45:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+92d+PvrHENT3g5=hkJ_UaVWHgMHyuvn3erg10DpVAw@mail.gmail.com>
Message-ID: <CAD=FV=X+92d+PvrHENT3g5=hkJ_UaVWHgMHyuvn3erg10DpVAw@mail.gmail.com>
Subject: Re: [PATCH v13 4/5] arm64: dts: qcom: sc7180: Add pazquel dts files
To:     "Joseph S. Barrera III" <joebar@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jun 24, 2022 at 7:28 PM Joseph S. Barrera III
<joebar@chromium.org> wrote:
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index e55dbaa6dc12..69cd4b3b911b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -11,6 +11,12 @@
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include <dt-bindings/sound/sc7180-lpass.h>
>
> +#ifdef __SC7180_TROGDOR_DTSI__
> +#error "Duplicate include"
> +#else
> +#define __SC7180_TROGDOR_DTSI__
> +#endif
> +

I'm not convinced about the need for this. That being said:

* If you want to try to do something like this, it should be in a
separate patch, probably at the end of the series. Then if people all
love it then it can be applied and if people don't like it then the
series can simply be applied without it.

* IMO if you wanted to pick one file to put this in it'd be
sc7180.dtsi, not sc7180-trogdor.dtsi.

-Doug
