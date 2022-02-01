Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2464A5415
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 01:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbiBAAdV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 19:33:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230452AbiBAAdU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 19:33:20 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C9EC061714
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 16:33:20 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id b17-20020a9d4791000000b005a17fc2dfc1so14644202otf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 16:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SGS6XMiq+69tnr9MpQLbmug5Dg8UYiEPb4kpnsmFU1w=;
        b=BiUWzQUjgUnY2SARQmADRD/plM8a8BgKCssG/yChXVVytyC0zhiIG2PtCv54o3EHa3
         hCg7wyvhjkW13FRMGi1KtTlEW3+iUPDlTTLsfx6LVDlvFCoNnk0aWT/fMdiG4tf5xXG1
         Qe5h85mUBerWEzDCF4rr6FwD5k99lpssXRpXC30dfqgyxX2fc4hgy3YV6RKQ+1JKIm4W
         8dyLNfuEyUy3wWSojkCx56Qm5wkCaNgErFC1vnRlYoFc30/YQpUbf1hY9gUApSYv6xB3
         19hw/sgj7wD8at4CEsvQDDiuN3HmtGsxmRq80d2dSN3r3azWEjjt68uvsuBgHjNM8Q0W
         ZYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SGS6XMiq+69tnr9MpQLbmug5Dg8UYiEPb4kpnsmFU1w=;
        b=haLuhKOnpD5cWZXgd7uJdrCqJxc0EUq6HlgkqX59oucfLETwY9vKoEPulbGN4pAZm0
         gQ5DneQXmZQty+WCZ4peL0yXq2sDdJR/NVmKwsHXnnOgLPWkVwmF2P5Bp0pv+NUNUZh6
         EOwfRUBsJzvqVrw6ujMXZeQueo+iUUYbnpXBpaNUEjh26oXP5OAbEk6c9a8MffT2VUP2
         4ZGfWUv2x8CWYv04mkAYO6JnNdsuSbdxm8GInzh+QDmqhrg5j8zs3itQ1rmQqjSxMw9q
         z0X+1stMVWcQ/e+s+SZasxjH2H+2P/kZVQEMuc+bTo2wRtp7gIcOxYDrZ/UI2ZuQVeBA
         ru+w==
X-Gm-Message-State: AOAM533tZHDIRASXeN9oeSTpcSopFgeosB/KWI3yvHUbaqQn2TMWLROo
        xcpaOSbtzzzWpnfCapvjUqCJsA==
X-Google-Smtp-Source: ABdhPJzCgdsPJiI5evYkcAgEJGZ636aZDwtNc3OqNEO+6NsaaKhFih06N+HO9LWNcOGn3pL/V4/QdQ==
X-Received: by 2002:a05:6830:448e:: with SMTP id r14mr13108661otv.102.1643675600043;
        Mon, 31 Jan 2022 16:33:20 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id 21sm3942355otj.71.2022.01.31.16.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 16:33:19 -0800 (PST)
Date:   Mon, 31 Jan 2022 18:33:17 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sc7280: Clean up sdc1 / sdc2
 pinctrl
Message-ID: <Yfh/zXKrzC5zaxl/@builder.lan>
References: <20220201001042.3724523-1-dianders@chromium.org>
 <20220131161034.4.I79baad7f52351aafb470f8b21a9fa79d7031ad6a@changeid>
 <CAD=FV=U4oma5qeoboczmKf6Qx7hpuwFbU-wi51p=owaKgZCQtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=U4oma5qeoboczmKf6Qx7hpuwFbU-wi51p=owaKgZCQtg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 31 Jan 18:25 CST 2022, Doug Anderson wrote:

> Hi,
> 
> On Mon, Jan 31, 2022 at 4:11 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > index 40cb414bc377..dc98a87e2871 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > @@ -616,6 +616,9 @@ qfprom: efuse@784000 {
> >
> >                 sdhc_1: sdhci@7c4000 {
> >                         compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
> > +                       pinctrl-names = "default", "sleep";
> > +                       pinctrl-0 = <&sdc1_clk>, <&sdc1_cmd>, <&sdc1_data>, <&sdc1_rclk>;
> > +                       pinctrl-1 = <&sdc1_clk_sleep>, <&sdc1_cmd_sleep>, <&sdc1_data_sleep>, <&sdc1_rclk_sleep>;
> >                         status = "disabled";
> >
> >                         reg = <0 0x007c4000 0 0x1000>,
> > @@ -2425,6 +2428,9 @@ apss_merge_funnel_in: endpoint {
> >
> >                 sdhc_2: sdhci@8804000 {
> >                         compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
> > +                       pinctrl-names = "default", "sleep";
> > +                       pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>;
> > +                       pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>;
> >                         status = "disabled";
> >
> >                         reg = <0 0x08804000 0 0x1000>;
> > @@ -3943,81 +3949,76 @@ qup_uart15_rx: qup-uart15-rx {
> >                                 function = "qup17";
> >                         };
> >
> > -                       sdc1_on: sdc1-on {
> > -                               clk {
> > -                                       pins = "sdc1_clk";
> > -                               };
> >
> > -                               cmd {
> > -                                       pins = "sdc1_cmd";
> > -                               };
> >
> > -                               data {
> > -                                       pins = "sdc1_data";
> > -                               };
> > +                       sdc1_clk: sdc1-clk {
> 
> Ugh. I just noticed that there are way too many blank lines here in
> the output. Happy to have this fixed when applying or I can post a v2.
> 

I can fix that up as I apply it. Will let it sit for a few days to
attract reviews first though.

Regards,
Bjorn
