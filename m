Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD6660E99A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 21:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234710AbiJZTvK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 15:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234716AbiJZTvJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 15:51:09 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0817C8D20A
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 12:51:07 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id a15so19102116ljb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 12:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kl2nAO5gy8gHX4P+zkYYuzR2j2HMszdyI0HmA3G3Bnc=;
        b=R1stc9QNfLnbxcxfkLORrgbpZ/mok3CtKuqE8VQVvzf3iIbPBg7c94FRZfAVCa6y7t
         ya0/7JuIltoLG9E2HdFQZyweeZT8l01mXCHveZpdhKiEISaNMy7qvRjIacjULL46fgHD
         2Y0+7JXBqQqUPBZCExLJiKTNo0/G6F0BTa1jY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kl2nAO5gy8gHX4P+zkYYuzR2j2HMszdyI0HmA3G3Bnc=;
        b=asnUnoAahhb5e/v0Gw7RWoOqIOrp1GkOQsRFhsND4QPp8nU4Elqjta1xPniEB6PEiu
         UgTakK+JNxYDhsEj0ahXmsLl1cjtz+JXonKa3bITWbuIU4EfGTtJVb+dLkWc6qsh1B+H
         eJghr1E24yQctBK9yDqRD8GRPXv7cjsKScBhMxLxr51ZYf0MJIAN5txgxSDyajn5lXbu
         uBqD+NxGrOEVkIlQVWxz63qk7Ryrr5WrYr8z8G5rnB3p36FsQ5NFvrdRDK2r315jjFOy
         xSCVYoF5rxp3AxwEWrtHP7LHM3EnLX5r4v25SD2dLO7oOT9GmXYPOpegNVB9I7qYBz4M
         ASAA==
X-Gm-Message-State: ACrzQf1xak10nWnJuU1EmiqJC2q5mnfc81XC0U1vrpx3dQKesNEm0L4X
        htPM+SZelFK5SWjmsz22A7QEGkmkRX6X7xT+t9wW9g==
X-Google-Smtp-Source: AMsMyM55CS75cu8NCEEPadabnoMEL99YmG6yPMjuNP5NL1tM/On6r7BFU8Sbpa+YufOLkxQaZK5M9EqTtc6+ppTty1w=
X-Received: by 2002:a2e:a98b:0:b0:26f:c755:ae8e with SMTP id
 x11-20020a2ea98b000000b0026fc755ae8emr16098044ljq.27.1666813865392; Wed, 26
 Oct 2022 12:51:05 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Oct 2022 15:51:04 -0400
MIME-Version: 1.0
In-Reply-To: <20221020225135.31750-2-krzysztof.kozlowski@linaro.org>
References: <20221020225135.31750-1-krzysztof.kozlowski@linaro.org> <20221020225135.31750-2-krzysztof.kozlowski@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 26 Oct 2022 15:51:04 -0400
Message-ID: <CAE-0n51d82iShZKanS6e+-yrctm03k+w6HPm=g8B+1SKTN_C2g@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: sc7180-trogdor-homestar: fully
 configure secondary I2S pins
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krzysztof Kozlowski (2022-10-20 15:51:33)
> The Trogdor Homestar DTSI adds additional GPIO52 pin to secondary I2S pins
> ("sec_mi2s_active") and configures it to "mi2s_1" function.
>
> The Trogdor DTSI (which is included by Homestar) configures drive
> strength and bias for all "sec_mi2s_active" pins, thus the intention was
> to apply this configuration also to GPIO52 on Homestar.
>
> Reported-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Fixes: be0416a3f917 ("arm64: dts: qcom: Add sc7180-trogdor-homestar")
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
