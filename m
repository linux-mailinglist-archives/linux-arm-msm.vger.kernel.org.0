Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09A7A3D19F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 00:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbhGUWMm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 18:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbhGUWMm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 18:12:42 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838A0C061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 15:53:18 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id e11so4597098oii.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 15:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=oCKEd1eI7lqzSHK9yaavlpSmIIydu9UzKpE8HGQM2SE=;
        b=PbkHC3LYJgY3qQZv8q2gWel042lTPUj1HBzY544pXIla5BJkUbECdmQkthsyLfqtcw
         es196ZVx11s5Wb5qEoOVbUfylOvVqaqxvOO3N7D75HUzslf2/CIAy/sHF7yQ5uLVzrHm
         L5N1CFe8HtcSHhQ/dE+jCWR3BHIQP7TOseU2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=oCKEd1eI7lqzSHK9yaavlpSmIIydu9UzKpE8HGQM2SE=;
        b=A0f1Pd+N8xWnK+VeiN+hhZtsZqY4d1Hm+bRRP8ibho8VBYVpgltk1UieeDOfGwxoIq
         tza1Avh54ShlNSD68mN1+oZxIOQ1mWsuM6JNXEYDeDhRt2zDLYpSwbcNFsS1r+deC5AG
         ZAwYEEFBOMfsRla4pnDn61VWBXMdBUMtA6bqWFKk8jus/jWFLrwnv90E2ENIEWUewPIp
         J1aLWw2VmaLrcl1PLOI5shxhxXLOErSvf9aQIAJzXSXl/vDsYpUGS/g3ds0Zbas5MO70
         3x2fGiwQ9QvsRLKnhSRUn/3qLtaQDmdUsLMVRvoqyR50jGxoPgr/zWfs3ZUXCC1HGI9Z
         ivWg==
X-Gm-Message-State: AOAM53118n4jHOY09WWn3At3/BFqvl18sJWZ+GtKprE8Axsaj/3C4Fy3
        CzQGDIS5UdWMLg8id9MHoJSYckVmZ13+IYOjaO08zA==
X-Google-Smtp-Source: ABdhPJzbPKDtNdlxW4NvKFlQyTPoSfnQchlbW6O2jPFaB32eqHy0IHSsaftEDVwjcUKJSsAbo7fxVLlq0+U2qYPV7cI=
X-Received: by 2002:a05:6808:a83:: with SMTP id q3mr4032552oij.125.1626907997947;
 Wed, 21 Jul 2021 15:53:17 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 22:53:17 +0000
MIME-Version: 1.0
In-Reply-To: <a021012616af266905099e0563d0fff5@codeaurora.org>
References: <1626775980-28637-1-git-send-email-sibis@codeaurora.org>
 <1626775980-28637-11-git-send-email-sibis@codeaurora.org> <CAE-0n53bRGouiycpcukPYB_+Gyz_Dr=rCAnb2MH64=+Q899aOA@mail.gmail.com>
 <a021012616af266905099e0563d0fff5@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 22:53:17 +0000
Message-ID: <CAE-0n51UbfpM94aOkdnSH9ZAvz-+V1X-hsOSMbkHJQDkYyD22w@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: sc7280: Update Q6V5 MSS node
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, mka@chromium.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, will@kernel.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-07-21 10:16:14)
> On 2021-07-21 11:17, Stephen Boyd wrote:
> > Quoting Sibi Sankar (2021-07-20 03:13:00)
> >
> >> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> index 56ea172f641f..6d3687744440 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> @@ -586,7 +586,8 @@
> >>
> >>                 remoteproc_mpss: remoteproc@4080000 {
> >>                         compatible = "qcom,sc7280-mpss-pas";
> >> -                       reg = <0 0x04080000 0 0x10000>;
> >> +                       reg = <0 0x04080000 0 0x10000>, <0 0x04180000
> >> 0 0x48>;
> >> +                       reg-names = "qdsp6", "rmb";
> >>
> >>                         interrupts-extended = <&intc GIC_SPI 264
> >> IRQ_TYPE_EDGE_RISING>,
> >>                                               <&modem_smp2p_in 0
> >> IRQ_TYPE_EDGE_RISING>,
> >> @@ -597,8 +598,11 @@
> >>                         interrupt-names = "wdog", "fatal", "ready",
> >> "handover",
> >>                                           "stop-ack", "shutdown-ack";
> >>
> >> -                       clocks = <&rpmhcc RPMH_CXO_CLK>;
> >> -                       clock-names = "xo";
> >> +                       clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
> >> +                                <&gcc GCC_MSS_OFFLINE_AXI_CLK>,
> >> +                                <&gcc GCC_MSS_SNOC_AXI_CLK>,
> >> +                                <&rpmhcc RPMH_CXO_CLK>;
> >> +                       clock-names = "iface", "offline", "snoc_axi",
> >> "xo";
> >>
> >>                         power-domains = <&rpmhpd SC7280_CX>,
> >>                                         <&rpmhpd SC7280_MSS>;
> >> @@ -611,6 +615,15 @@
> >>                         qcom,smem-states = <&modem_smp2p_out 0>;
> >>                         qcom,smem-state-names = "stop";
> >>
> >> +                       resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
> >> +                                <&pdc_reset PDC_MODEM_SYNC_RESET>;
> >> +                       reset-names = "mss_restart", "pdc_reset";
> >> +
> >> +                       qcom,halt-regs = <&tcsr_mutex 0x23000 0x25000
> >> 0x28000 0x33000>;
> >> +                       qcom,ext-regs = <&tcsr_regs 0x10000 0x10004
> >> +                                        &tcsr_mutex 0x26004 0x26008>;
> >> +                       qcom,qaccept-regs = <&tcsr_mutex 0x23030
> >> 0x23040 0x23020>;
> >> +
> >>                         status = "disabled";
> >>
> >>                         glink-edge {
> >
> > Any reason to not combine this stuff with the previous patch?
>
> I split it into two separate
> patches just to show that sc7280
> supports two ways of bringing
> modem out of reset and method
> used is determined by the platform.
>

Ok. But if there are two methods do they work with the same node in
sc7280.dtsi? Because I was expecting to see the node introduced in the
SoC dtsi file in the final form instead of the half form and then be
amended in this patch.
