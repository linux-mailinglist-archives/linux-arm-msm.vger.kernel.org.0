Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 150454B5603
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 17:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236718AbiBNQWl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 11:22:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245618AbiBNQWk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 11:22:40 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9DE60AA5
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 08:22:32 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id 9so20544066iou.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 08:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JskXaZJX9EqtyU9nDYwhDYopK1GYBeF5QAk0Zlst3K8=;
        b=WFoQIvGxJEbg8UOaiV70tS6PGdyf3qjcG0fNJQKbyHSfj48VnWpT1uPRsHkSjKp4oI
         VyXEAHc0fq+QePjMo/XUxaUdqQMw6JpndQdJRAM+wSSoz81Cj3PoON8L3Dmir1bNHNxO
         JLMBAFjfwqf69spTV2mC/gqt6Gw5T35QWKhp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JskXaZJX9EqtyU9nDYwhDYopK1GYBeF5QAk0Zlst3K8=;
        b=JcVc/32GXY2FBjy/vwgoFaHzZ0kR1fiMw5qStHPxgjJz0QkfFl6g3eG8ppSaY6EDfS
         840asH2Dc+Dg8h4ZnOB/VV5bjSfEUzPT3KuSLehvC6XzZ4DUpeOBTszGNHicIo3Ah7tA
         stZK6Jc9WXq9R8tUM6YtIcA9g+b6m9flp8crJCb+fykPbVGIo3n9XEWMVppe/mTLtNfW
         et3aaDmOaHCOcSJOqpdTtNCgcKB4oML64jn9QSIm694L0VoeDimTlfpkODr9pXgQp61V
         oSy0NzUr15COpkrmjRAY8WZaj8WjtRJqY5zXDp1Fk92q7h8ytsCCEY3xqRuU48T9ggQi
         8t0w==
X-Gm-Message-State: AOAM530X6LYjzlpkXicXA/JCfDXxaLaDkyAhKHchssbRn3HuJAeJuZuW
        gCB2g5Zv5gAdJ0CS3PqSbdhP4KriE8fQmA==
X-Google-Smtp-Source: ABdhPJz2fK8vxT1wUExARiUNijUS+LCc/erp7N7WunefoJ3dR7lMyY/LNxGlYM0bjOF9claJVOZWSw==
X-Received: by 2002:a5e:a806:: with SMTP id c6mr339371ioa.104.1644855752118;
        Mon, 14 Feb 2022 08:22:32 -0800 (PST)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id l2sm2798558ilv.66.2022.02.14.08.22.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 08:22:30 -0800 (PST)
Received: by mail-io1-f52.google.com with SMTP id 9so20543913iou.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 08:22:29 -0800 (PST)
X-Received: by 2002:a02:3b67:: with SMTP id i39mr299652jaf.50.1644855749283;
 Mon, 14 Feb 2022 08:22:29 -0800 (PST)
MIME-Version: 1.0
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com> <20220214081916.162014-5-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220214081916.162014-5-krzysztof.kozlowski@canonical.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 14 Feb 2022 08:22:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wzr=ra=_mt63Uj2p6PSNoEF1F=zN0-0yg5rcWkBFYkZw@mail.gmail.com>
Message-ID: <CAD=FV=Wzr=ra=_mt63Uj2p6PSNoEF1F=zN0-0yg5rcWkBFYkZw@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: rk3399: align Google CROS EC PWM node
 name with dtschema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, chrome-platform@lists.linux.dev,
        LKML <linux-kernel@vger.kernel.org>,
        linux-pwm <linux-pwm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Feb 14, 2022 at 12:20 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> dtschema expects PWM node name to be a generic "pwm".  This also matches
> Devicetree specification requirements about generic node names.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
