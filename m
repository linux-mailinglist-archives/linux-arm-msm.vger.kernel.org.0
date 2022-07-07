Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D27856A58B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 16:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235397AbiGGOfr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 10:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235185AbiGGOfq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 10:35:46 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E54130549
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 07:35:45 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id u15so8349941ejx.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 07:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6R/ddtNSwfm7ty86Jg8Rk/94EllRS1alXZobv2bNWis=;
        b=nop4+PYaSie6cLDfOoz79jPZj+LmcL3qmT5jqfFfbawptaU2DSYNGb9uCsJ6ie6CBA
         044wbTmELbC6ll9dHCgX/qKoXRUW4Gt58A8QRV6+vaYK5VZxmSNh9JGnRQJEzvaXSXoZ
         p894kw4QPJoW/iXmBPjcZx7ieiwtgw4Ew+ydA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6R/ddtNSwfm7ty86Jg8Rk/94EllRS1alXZobv2bNWis=;
        b=eBqZvJQRzC1WeJ8o0/qssp9UNeVPHCYAgasHQK6Xwpl7y2+D7bxRltHFDXQZ5DkJND
         Is311PsE8UBU5PGgUVi/WM377W4L35rIz2lCryedQv2urX90I29Hn428RzP3klElHScI
         m30rn5q/l0OSegW/UxCsOzXWC29v6nete2NYIjzoxd63DMX8kLgczKnAutXJ7T1oQ2AV
         NgHsepevYL9fyREwuecduJM3jsqnwLRDvtSIVkKTAfRFIdQAPoBDi20edQSfUKLBM7oC
         YC1x3V3T0tIMqOhksg6XTUU3kMJBMq8dPwGTHg+JXoJHlo3rwvkYJbzv/vygacA+xopg
         Rd1g==
X-Gm-Message-State: AJIora8zDbRM5OB8+Rba9Toau0VXrvXZwOdWmdlZcs2uyp93XZQIdfOo
        ybZ/StV+Ex9AD+wp4aNkHNVxdrn6msPIqeA8w2Q=
X-Google-Smtp-Source: AGRyM1uiTGOp3iqJ9Wm88125A6rWhm3Vhj4sxD0e3arHEuqPVYjKlWxoWPvyFN3SYal95tlNPRJMPg==
X-Received: by 2002:a17:907:9711:b0:726:443d:3724 with SMTP id jg17-20020a170907971100b00726443d3724mr46177781ejc.759.1657204543663;
        Thu, 07 Jul 2022 07:35:43 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id f17-20020a17090631d100b0072af12590fesm3171046ejf.207.2022.07.07.07.35.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 07:35:42 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id h17so13462226wrx.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 07:35:41 -0700 (PDT)
X-Received: by 2002:adf:d1c1:0:b0:21b:a5e9:b7b2 with SMTP id
 b1-20020adfd1c1000000b0021ba5e9b7b2mr45296183wrd.405.1657204541324; Thu, 07
 Jul 2022 07:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220707075151.67335-1-krzysztof.kozlowski@linaro.org> <20220707075151.67335-6-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707075151.67335-6-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 7 Jul 2022 07:35:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XOGLH9UH4Bwd3E6RC_PT5A4bf20muhnZoW5Rb8O3b2LA@mail.gmail.com>
Message-ID: <CAD=FV=XOGLH9UH4Bwd3E6RC_PT5A4bf20muhnZoW5Rb8O3b2LA@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: dts: qcom: align SDHCI clocks with DT schema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
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

On Thu, Jul 7, 2022 at 1:04 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The DT schema expects clocks iface-core order.  No functional change.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-apq8084.dtsi    | 12 ++++++------
>  arch/arm/boot/dts/qcom-ipq4019.dtsi    |  4 ++--
>  arch/arm/boot/dts/qcom-msm8226.dtsi    | 18 +++++++++---------
>  arch/arm/boot/dts/qcom-msm8974.dtsi    | 18 +++++++++---------
>  arch/arm/boot/dts/qcom-msm8974pro.dtsi |  6 +++---
>  5 files changed, 29 insertions(+), 29 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
