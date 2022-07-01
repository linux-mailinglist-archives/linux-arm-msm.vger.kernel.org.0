Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C670563782
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 18:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbiGAQNf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jul 2022 12:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbiGAQNe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jul 2022 12:13:34 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9A1131509
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Jul 2022 09:13:27 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id ge10so4901063ejb.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Jul 2022 09:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iU1WXNqtWMrZUa+JVDcKXW+n/u2YiixZY6UAGKLDnPg=;
        b=iq8OARlHdwjKJaotlBm1jpgne1kU1PT5n8rnl6fpp9YAyJoLGzBe5hekwwTHO4U6WG
         ZHK2qR50/rtNqUyDApnn0W+70spOH37v/wSryluuzENNpTsfhHWf5E7ADyc2jEgaJWZ7
         jHT3znd5Z/JBcuN1ieNFm6MgqTMUf+yFMuuW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iU1WXNqtWMrZUa+JVDcKXW+n/u2YiixZY6UAGKLDnPg=;
        b=kjCYRv6lH0GfgCLDbxrXv+MGHVsTEoUhRniWYutuPwba4Ixp6pR8TEonuxTv9mdic0
         08F/lal1PE6CzE6MHfBKP+mHbCFNsWB7DXEGL8scmCDE/WeoAA+cjG4D94h2ITH+iy+y
         /O6ch3KoyTHh/QJWjetk+dOEhBEqgoWFWn0J0/hzKLXnadjeqoZdXYwgFnqg312V93hc
         5Y4MuYXdyz2oxoG5yp/JGmN4de+49n6p+GPx2bLKiOWhroDhLyqFTC0diUxbgPLjdKr/
         ZGazMI4angR7ko08rWPu2cwhxCbJzoeu53vXfxEbKQ+/cpjL6CzFnwllLQAwJ2FzjQNX
         aubg==
X-Gm-Message-State: AJIora8kVPsZlBrqe83Rijd19Z5CSLztfJEYTbxVdb/AKEdi4OLX3RCW
        BdMJMNdciDWqsK7w3x7l79ydzkLRzeRTQrVX
X-Google-Smtp-Source: AGRyM1uiW4K8fjGEY0JImL0PG4jSmAzGP/D2BYVzNERJv7M+lME5rmD2QPzeD2q1qt4xfLjCWaPG5Q==
X-Received: by 2002:a17:907:1c97:b0:6f5:22ae:7024 with SMTP id nb23-20020a1709071c9700b006f522ae7024mr14528729ejc.570.1656692005740;
        Fri, 01 Jul 2022 09:13:25 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id x13-20020a170906b08d00b00724261b592esm10564034ejy.186.2022.07.01.09.13.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 09:13:25 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id l40-20020a05600c1d2800b003a18adff308so1725413wms.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Jul 2022 09:13:25 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8d:b0:3a1:2e4d:1dd2 with SMTP id
 f13-20020a05600c4e8d00b003a12e4d1dd2mr17792094wmq.85.1656691617857; Fri, 01
 Jul 2022 09:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <1656690436-15221-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1656690436-15221-1-git-send-email-quic_khsieh@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 1 Jul 2022 09:06:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V5uLz9aqrgHrsPYHzBXL+Bx5Ds8aEP_kSzA29d-9jtBg@mail.gmail.com>
Message-ID: <CAD=FV=V5uLz9aqrgHrsPYHzBXL+Bx5Ds8aEP_kSzA29d-9jtBg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dta: qcom: sc7180: delete vdda-1p2 and vdda-0p9
 from mdss_dp
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        quic_mkrishn@quicinc.com, quic_kalyant@quicinc.coml,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jul 1, 2022 at 8:47 AM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Both vdda-1p2-supply and vdda-0p9-supply regulators are controlled
> by dp combo phy. Therefore remove them from dp controller.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 732e118..824a98c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -813,8 +813,6 @@ hp_i2c: &i2c9 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&dp_hot_plug_det>;
>         data-lanes = <0 1>;
> -       vdda-1p2-supply = <&vdda_usb_ss_dp_1p2>;
> -       vdda-0p9-supply = <&vdda_usb_ss_dp_core>;
>  };

Reviewed-by: Douglas Anderson <dianders@chromium.org>

NOTE: this is somewhat related to Kuogee's series [1] but it's OK to
take even though his series hasn't landed. On trogdor we always keep
these regulators in HPM mode so we're not truly dependent on the
addition of regulator_set_load in the DP PHY.

[1] https://lore.kernel.org/lkml/8b751eb3-2e19-0e03-4c94-b26b3badd397@linaro.org/

-Doug
