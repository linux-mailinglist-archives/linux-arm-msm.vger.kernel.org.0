Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1DE54BAEF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Feb 2022 02:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbiBRBDw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Feb 2022 20:03:52 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:41640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbiBRBDv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Feb 2022 20:03:51 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7264285A87
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Feb 2022 17:03:35 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id p15so11214341ejc.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Feb 2022 17:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YhNqz0TwV7gSLYgP9YWbRspB12calUNnn7qInjIWMb8=;
        b=kjaQXcd+qDo6HeXDPEWhbFh7itNDJeBgJ0jJRODQBOZ7hs979pzm2WflsUaeHt87yP
         QfxDMnIRoaJ7eDkvmb/yckwyk9YSdc1FaxiFI9ozai/ESqHRWGC3j6y8tn1v5Pwbp/xi
         y+HpVyyGh9scpSCcn61WSMOXHDjMnjoadxSfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YhNqz0TwV7gSLYgP9YWbRspB12calUNnn7qInjIWMb8=;
        b=7e+jbo5T5s1dL8mhKY0Gj8jwA279YF9xpZS1WwxzNO6G2ChKT/Cf9J26nAzRV2BQvY
         GCwnEKDLF1Sebt0LFIntVGaU+VYn1TXIp/tU/jmZJObRIQDkkbmafKLO/6bBygH5A++g
         ODP/SG2sKQzncmeiDiuxCwDaYDnAL89xqNE3yDO6SJBDQOmVg77q/BGiulXpXHkeRPyX
         TLM+XCy3WmjIWcdK0YMsQz3zNEfG4LCQEvfjpm9EEd728KQvJmWXBKviN5u3lB6s81k7
         H5BG4WbArTZWe58nKnMuTJLc9LMEtBYsHOYZInyv/npk9A3bnkz1cMVXlTlUYI/aM7RY
         se7w==
X-Gm-Message-State: AOAM531ebwqCkcF92B5djk9xf0dwv0/bLdhOWgW7LsOQV7OrIz/Lk9nJ
        Szny+c43/7dgWVan8R33GYPWENcebt5YPaF/2Hk=
X-Google-Smtp-Source: ABdhPJzWcKvCgXxrpC1DmoW+jiJmvHekPMzoY65I6wSlyZBCextU+9wFgWENbS6qtyP+HFOShParag==
X-Received: by 2002:a17:906:7c58:b0:6b3:fd31:2e1a with SMTP id g24-20020a1709067c5800b006b3fd312e1amr4509021ejp.50.1645146214475;
        Thu, 17 Feb 2022 17:03:34 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id j9sm1699313ejo.106.2022.02.17.17.03.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 17:03:34 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id h6so11818395wrb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Feb 2022 17:03:34 -0800 (PST)
X-Received: by 2002:a5d:64ef:0:b0:1e3:1e05:d042 with SMTP id
 g15-20020a5d64ef000000b001e31e05d042mr4049131wri.679.1645146213585; Thu, 17
 Feb 2022 17:03:33 -0800 (PST)
MIME-Version: 1.0
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com> <1644494255-6632-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1644494255-6632-3-git-send-email-quic_sbillaka@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 17 Feb 2022 17:03:13 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VVvcn1VpLXjd+X9Xe50sS_vY5ukKJE8i=eAZf1Phofuw@mail.gmail.com>
Message-ID: <CAD=FV=VVvcn1VpLXjd+X9Xe50sS_vY5ukKJE8i=eAZf1Phofuw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, quic_kalyant@quicinc.com,
        quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com,
        quic_mkrishn@quicinc.com, quic_vproddut@quicinc.com
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

On Thu, Feb 10, 2022 at 3:58 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> +       backlight_3v3_regulator: backlight-3v3-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "backlight_3v3_regulator";
> +
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpio = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&edp_bl_power>;
> +       };

So I'm pretty sure that this is wrong and what you had on a previous
patch was more correct. Specifically the PMIC's GPIO 7 truly _is_ an
enable pin for the backlight. In the schematics I see it's named as
"PMIC_EDP_BL_EN" and is essentially the same net as "EDP_BL_EN". This
is distinct from the backlight _regulator_ that is named VREG_EDP_BP.
I believe the VREG_EDP_BP is essentially sourced directly from
PPVAR_SYS. That's how it works on herobrine and I believe that CRD is
the same. You currently don't model ppvar_sys, but it's basically just
a variable-voltage rail that could be provided somewhat directly from
the battery or could be provided from Type C components. I believe
that the panel backlight is designed to handle this fairly wide
voltage range and it's done this way to get the best efficiency.

So personally I'd prefer if you do something like herobrine and model
PPVAR_SYS. Then the backlight can use ppvar_sys as its regulator and
you can go back to providing this as an "enable" pin for the
backlight.

I know, technically it doesn't _really_ matter, but it's nice to model
it more correctly.
