Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E211522304
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 May 2022 19:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348355AbiEJRov (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 May 2022 13:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348361AbiEJRot (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 May 2022 13:44:49 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D481012A81
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 10:40:49 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id y63so19285507oia.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 10:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=UKufSQs9qr2bj9JxpR70M2MLmSNQQ67hZiGFvmJhYoc=;
        b=mdY/If8uRLEfI44R6YGWNOJxV4pcVZkV2cqgKl6mPn2qSRu9ZEv1lEWDIFC2daiykt
         2e1RiT9qD3sYV5V/WfZx0zxgjzmxv1dsDsRhjJ9fNdW9WfpT/PoLmKh1gugpSSvyB9OS
         r5ivIcCI5Z4QdKRZvhVb8GLWcVU4lgDzVyo9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=UKufSQs9qr2bj9JxpR70M2MLmSNQQ67hZiGFvmJhYoc=;
        b=tcspmwD1yF38nw6QTZplbSpa/VYzRASoMZy2tarrgfnzPP9AdXe2Qiv3z5KMd5wqdA
         0vbxx2B8Y2iq9Kjm3JgL5FZJvng7FF+dOOissNLChgKMfkbZE9tg7RetAVfNPXg++CSF
         dgsPJz4+w88jERH2o+HYHb4svFWtykvjl5n2afLcghbEmpHuNiyPBietf36hQM2sMhuQ
         Edt+wEpS7Ol9QMzwiaA7JOwZpozenrBmARNHOv7tvDNdQy3/wkR6+gR5DP73ybzfBCEn
         T4VKH0yBjncGWTyjNGdXUoFSZo2ZUTfqEGErm8ckcs7RVgjswEe5F5iZAS7Lf/OXYwBK
         wP1w==
X-Gm-Message-State: AOAM530GUMOq5uQRablKZpY/SMShCS6redOniouzAwrs8kQsOH3RuBve
        czmg1KHAOmP8jsj+3sXgyxP84QglwnV4f0e+wztk6A==
X-Google-Smtp-Source: ABdhPJz95HjcXUXoUbA/7guupIrd/nNtcSppXPf36HaH/0UjgRjU1DiKnHjuUteekXQ3UkimNseRwGrch2RzwVkttFo=
X-Received: by 2002:a05:6808:14c2:b0:326:c129:d308 with SMTP id
 f2-20020a05680814c200b00326c129d308mr576354oiw.193.1652204449230; Tue, 10 May
 2022 10:40:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 May 2022 10:40:48 -0700
MIME-Version: 1.0
In-Reply-To: <20220505104024.v4.1.Id769ddc5dbf570ccb511db96da59f97d08f75a9c@changeid>
References: <20220505104024.v4.1.Id769ddc5dbf570ccb511db96da59f97d08f75a9c@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 10 May 2022 10:40:48 -0700
Message-ID: <CAE-0n511S7dNPetX0dHp2RSPUZQjwGtXM8nMTF0bf03JjbPwfg@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] arm64: dts: qcom: sc7180: Add wormdingler dts files
To:     "Joseph S. Barrera III" <joebar@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Joseph S. Barrera III (2022-05-05 10:41:12)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
> new file mode 100644
> index 000000000000..e947e01d0b3b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
> @@ -0,0 +1,417 @@
[...]
> +
> +/* PINCTRL - board-specific pinctrl */
> +
> +&tlmm {
> +       gpio-line-names = "HUB_RST_L",
[...]
> +
> +       vdd_reset_1800: vdd-reset-1800 {
> +               pinmux {
> +                       pins = "gpio87";
> +                       function = "gpio";
> +               };
> +
> +               pinconf {
> +                       pins = "gpio87";
> +                       drive-strength = <2>;
> +                       bias-disable;
> +               };
> +       };
> +
> +       avdd_lcd_en: avdd-lcd-en {
> +               pinmux {
> +                       pins = "gpio88";
> +                       function = "gpio";
> +               };
> +
> +               pinconf {
> +                       pins = "gpio88";
> +                       drive-strength = <2>;
> +                       bias-disable;
> +               };
> +       };
> +
> +       avee_lcd_en: avee-lcd_en {

avee-lcd-en

No underscores in node names please.

> +               pinmux {
> +                       pins = "gpio21";
> +                       function = "gpio";
> +               };
> +
> +               pinconf {
> +                       pins = "gpio21";
> +                       drive-strength = <2>;
> +                       bias-disable;
> +               };
> +       };

Are these supposed to be sorted by node name? Or gpio number? Please do
one of those.

> +
> +       mipi_1800_en: mipi-1800-en {
> +               pinmux {
> +                       pins = "gpio86";
> +                       function = "gpio";
> +               };
> +
> +               pinconf {
> +                       pins = "gpio86";
> +                       drive-strength = <2>;
> +                       bias-disable;
> +               };
> +       };
> +};
