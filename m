Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C63E26573E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 09:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232493AbiL1I1C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 03:27:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbiL1I05 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 03:26:57 -0500
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D06EE32
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 00:26:56 -0800 (PST)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-14455716674so17916648fac.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 00:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Z9/PqGQwTjm38REEONxEQHatW3RqTg7g05P268BC1M=;
        b=nji85v022+wAGzmuUCmXUT7B5uYInWB2zkQn16q8fdGe7/NDlAMQUr5Cp2I9SaCEjj
         u5yD4380zCWtdDuPfOC8UZCmJ6L++mibjRQruP1ULO0tQJvhxgNb5Uu/N/e+62vZyALf
         Yuf5rkLMepoBBrL0JMSbuODZglCg/qcegi4vZE13eGKWxRgBLBbU2lnYCnpfonxmRvhY
         qH0XGE1LhursulJ0Ga0m1dEkKfrFwcC6iSmJrDhfNu+QgmNKdTSyccuBk1f/rUWiJbaO
         EkyKHYcNB+MP1iLxe2+Ut/Z49LyDteNB0PJQXprHM7fgb1L529pMts20yuxoEpSIodZz
         iu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Z9/PqGQwTjm38REEONxEQHatW3RqTg7g05P268BC1M=;
        b=cpg3oVcW6JiRhuDnpqdqkL7Dq9cHKdnsTwsNsyEgx2mZfP1tQNczPOibrTRjrbn9wk
         duR8LTa0N/RAT4lXkDx44/THD3G8se3R88JeZi0jbbAWpKUr/8iAuk7ngPkbQZBDUSck
         Y7Jk6LM7ZKidQyWXhCyNoa/tBOAu6t61lYsK6Uz86yInlAZ5YNLiUB4Fl8xDlKB1wXDi
         BRsr+6AKq7Hmq2l01luXW0rXaDmBCKoWMyuNbEWdm4UGat+iedmRY1Tf6G4ZMpkK9RiL
         iphde9+2TKzvRaH7v8cvKffMVeehH72n7O/UjjfllpT6JSY60AUMKkk0m6/y+d7IVHRT
         yezw==
X-Gm-Message-State: AFqh2kr/Wllr43qMZNZoQI5x37eB6OqWo08t42CfP6t1WoW9wRcVvyAy
        WxqXVU+ZVrILtZnVogs2jSWKqjWQ4qQi6FBCJoeGP7aCjRkpRQ==
X-Google-Smtp-Source: AMrXdXvBQl9y5tcOiVIyN/zYA7iZvfKaDqF0akasn2AMX0NYxoPxxzLuE0yanG7HITqm7KzMeYSloUiGJcFvvJfwVNo=
X-Received: by 2002:a05:6870:d906:b0:13c:33d0:22e2 with SMTP id
 gq6-20020a056870d90600b0013c33d022e2mr1595918oab.14.1672216014029; Wed, 28
 Dec 2022 00:26:54 -0800 (PST)
MIME-Version: 1.0
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-12-robert.foss@linaro.org> <ed8c6ca2-e4e1-52f5-0858-8c774819dd73@linaro.org>
In-Reply-To: <ed8c6ca2-e4e1-52f5-0858-8c774819dd73@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 28 Dec 2022 09:26:43 +0100
Message-ID: <CAG3jFysSBF_bkeUu=0wWFh-2yBx1HBP=36AdsBKFew_0r1qApw@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] arm64: dts: qcom: sm8350-hdk: Enable lt9611uxc
 dsi-hdmi bridge
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
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

On Mon, 5 Dec 2022 at 17:47, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/12/2022 17:37, Robert Foss wrote:
> > The sm8350-hdk ships with the LT9611 UXC DSI/HDMI bridge chip.
> >
> > In order to toggle the board to enable the HDMI output,
> > switch #7 & #8 on the rightmost multi-switch package have
> > to be toggled to On.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
>
> Thank you for your patch. There is something to discuss/improve.
>
> > +
> >  &slpi {
> >       status = "okay";
> >       firmware-name = "qcom/sm8350/slpi.mbn";
> > @@ -544,4 +633,20 @@ usb_hub_enabled_state: usb-hub-enabled-state {
> >               drive-strength = <2>;
> >               output-low;
> >       };
> > +
> > +     lt9611_state: lt9611-state {
> > +             lt9611_rst_pin {
>
> No underscores in node names.

Ack

>
> > +                     pins = "gpio48";
> > +                     function = "normal";
> > +
> > +                     output-high;
> > +                     input-disable;
> > +             };
> > +
> > +             lt9611_irq_pin {
>
> Ditto

Ack

>
> > +                     pins = "gpio50";
> > +                     function = "gpio";
> > +                     bias-disable;
> > +             };
> > +     };
> >  };
>
> Best regards,
> Krzysztof
>
