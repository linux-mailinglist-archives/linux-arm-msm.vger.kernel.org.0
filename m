Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E730E650FFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 17:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbiLSQMH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 11:12:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231136AbiLSQMG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 11:12:06 -0500
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC08BA1BE
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 08:12:03 -0800 (PST)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-144b21f5e5fso12017900fac.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 08:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=opNyEy4Hga2S+HSZGwYoo4n70oAUrhY/I95QJwBLXGw=;
        b=GLXF0a9hN4NDrxSiyquzet3CYHgBek4M8xB9NgCoRur+3SiWUQ7U0TpQ80vS2Ey3yF
         7Z9I/KAw6ATX613YDJ3PomP8p4XMs41nnalAMwU6+QkQFUhMm8vvsM/K4MpnHj4V1b0x
         +YaWd5cjgjBFDIyenlffSYdjzvSma6xkeJIJvjxWrd9sI8mBIlSsddTfnkbhYVUCIDzB
         Lw7vc0hRHHp2zRSkxqQG/nmlTh1KEbHJdzruUiUK2ggEdHmzJdhNBQQ55yhkimSIbzcJ
         ORq78PFUdH2Oq9tfhYAjIghbEMkSxUcC+jVPPGxbu/HWGDnWbImG5UrI6v8+r37GhsdB
         tXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=opNyEy4Hga2S+HSZGwYoo4n70oAUrhY/I95QJwBLXGw=;
        b=rT5M+sYleec7rlyKfgtFmblSnOlUy7htdTGHgH9ZPVtRYMaJUmVbFmjqAVrnAuz8RB
         v6HRPzp1Gufg9udRU7RuCwPe/VqJ/oTlbYtrIox8j5N0OigTTPH+1XL4f1X+zhnPXxFY
         lNQyI8R377W3EaJjmGMl3uIQWG/Wpvc/aXmuT4fDd2NS+R3uAqpSVvVY5u73nLNVjLq5
         jNYXyPkpyH5K6rHVRg/ysu1fF1XmtKGQsfCCwm4q+xAKPLRaRCsViKOy46cNpNWC4jxL
         CYVfUXRyhBxBh+xpWbJnUvprr3xn+6XrHTGZ2Ur8ONxkOTRH+tEQbNAm+V8MKx7DU4yJ
         4GzQ==
X-Gm-Message-State: AFqh2kqm6hswdxmQO/O63a3smyM1B7qVl/vEaDdnRz5aW9eY09nc8HOR
        zFtom+75X0uVL7RrnSgOeHGHSIxOWTNEy0pKc6dJGg==
X-Google-Smtp-Source: AA0mqf55kS80V69FV3FbQLl+xTi2OHqecJQT7VNkb/GHotEghsH04avx+8ln6J+VXS2w3SXe+3JAgEmw1jbdGZgvIyg=
X-Received: by 2002:a05:6870:9e4c:b0:13c:33d0:22e2 with SMTP id
 pt12-20020a0568709e4c00b0013c33d022e2mr1717322oab.14.1671466323100; Mon, 19
 Dec 2022 08:12:03 -0800 (PST)
MIME-Version: 1.0
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-11-robert.foss@linaro.org> <853d49f9-cd97-e8a0-53fd-9f673c2720a1@linaro.org>
In-Reply-To: <853d49f9-cd97-e8a0-53fd-9f673c2720a1@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 19 Dec 2022 17:11:52 +0100
Message-ID: <CAG3jFysRXykUgOqRiPVYSRtjQ5Rfj+DQQqPzhzA8j9B9LToj5g@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] arm64: dts: qcom: sm8350-hdk: Enable display &
 dsi nodes
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        quic_kalyant@quicinc.com, angelogioacchino.delregno@somainline.org,
        loic.poulain@linaro.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        vinod.koul@linaro.org, quic_jesszhan@quicinc.com,
        andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 5 Dec 2022 at 17:44, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 05/12/2022 18:37, Robert Foss wrote:
> > Enable the display subsystem and the dsi0 output for
> > the sm8350-hdk board.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 22 ++++++++++++++++++++++
> >   1 file changed, 22 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > index e6deb08c6da0..39462c659c58 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > @@ -213,10 +213,32 @@ &cdsp {
> >       firmware-name = "qcom/sm8350/cdsp.mbn";
> >   };
> >
> > +&dispcc {
> > +     status = "okay";
> > +};
> > +
> > +&dsi0 {
>
> Bjorn suggested using mdss_dsi0 / mdss_dsi0_phy labels for DSI host and
> PHY, as it allows us to group them nicely. WDYT?

Sounds quite reasonable, fixing it in dts/dtsi/binding.

>
> > +     vdda-supply = <&vreg_l6b_1p2>;
> > +     status = "okay";
> > +};
> > +
> > +&dsi0_phy  {
> > +     vdds-supply = <&vreg_l5b_0p88>;
> > +     status = "okay";
> > +};
> > +
> >   &gpi_dma1 {
> >       status = "okay";
> >   };
> >
> > +&mdss {
> > +     status = "okay";
> > +};
> > +
> > +&mdss_mdp {
> > +     status = "okay";
> > +};
> > +
> >   &mpss {
> >       status = "okay";
> >       firmware-name = "qcom/sm8350/modem.mbn";
>
> --
> With best wishes
> Dmitry
>
