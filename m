Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA49F3F8F37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 21:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240521AbhHZTwZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 15:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233100AbhHZTwY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 15:52:24 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C9FC0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 12:51:37 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id c4so2457605plh.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 12:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VDKSZwM6+MkspeAfVSvtL1ryQMnZ/8yIsg8vSwepJrk=;
        b=kKU5fomT08zxgo0C6ur54X+WSdXkohiKvaojhLd65QKKOp1DUTy43t4weo5hEyBW0/
         LGi2JAL/MobSKVsax+S4xp7F94wJP8F7bkEgpyVd/1FkDLxw1NPGL00nkQRIl9kaXcls
         zVTo+8SrCNlubKZsH42QWBHs3OLWvlCkPkTnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VDKSZwM6+MkspeAfVSvtL1ryQMnZ/8yIsg8vSwepJrk=;
        b=WbsPSrY1qvhfv2rEHe0SgCTm3414ULC3wIE7Wab/m/nAiKaiG/+aBpYlR9TcKuapD2
         WWCJCBMsxr+g90VvTFkubDBXmdkEAXoqSeZ0hhJTp+2pLDFaFxyHer7I0MFBP/xJzZtH
         J9rJj1RJJwgIsfKG28tRSIKmHDUbafcGra0uG3TcIn3uZKg1mv6hNMFzjohRzXv+2q/1
         sF2zyoHFeU2zwk7OrXP3o4aXVe7H/dqlJq3ESXIXQwRy/CkhzR1egxneExqoAswC7tGA
         YQvURe+TOQJA5Dw3jmkdtPndILl6hdJqbAMgDtEaGO2ME5a+jRqrKW4OC0MAnC+TbGLI
         WGsg==
X-Gm-Message-State: AOAM532QwqasqNgAPhtyGVYMX7cy52R6dq3t0/K4191BAriB3r9krSuR
        mmxvPEx87mV72Sui8+OpJxv1vA==
X-Google-Smtp-Source: ABdhPJx6mpM4H0UsaVPSAz7cl4fw0b0Mrl9F8syKLHFXkbN/VITueXvFSZJ84fZAJAYlW/wHoRFHIw==
X-Received: by 2002:a17:90a:9f91:: with SMTP id o17mr18336584pjp.29.1630007496692;
        Thu, 26 Aug 2021 12:51:36 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:bd0b:bcb8:ebdb:c24d])
        by smtp.gmail.com with UTF8SMTPSA id z8sm3749169pfa.113.2021.08.26.12.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 12:51:36 -0700 (PDT)
Date:   Thu, 26 Aug 2021 12:51:34 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     rajpat@codeaurora.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org
Subject: Re: [PATCH V5 3/7] arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
Message-ID: <YSfwxuX22Ix4fqX2@google.com>
References: <1628754078-29779-1-git-send-email-rajpat@codeaurora.org>
 <1628754078-29779-4-git-send-email-rajpat@codeaurora.org>
 <YRUsr6x9vqvaBB9i@google.com>
 <114d7419b0a85fcacf775cc34f279f0e@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <114d7419b0a85fcacf775cc34f279f0e@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 26, 2021 at 06:37:02PM +0530, rajpat@codeaurora.org wrote:
> On 2021-08-12 19:44, Matthias Kaehlcke wrote:
> > On Thu, Aug 12, 2021 at 01:11:14PM +0530, Rajesh Patil wrote:
> > > From: Roja Rani Yarubandi <rojay@codeaurora.org>
> > > 
> > > Add QUPv3 wrapper_0 DT nodes for SC7280 SoC.
> > > 
> > > Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> > > Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sc7280.dtsi | 720
> > > +++++++++++++++++++++++++++++++++++
> > >  1 file changed, 720 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > index f8dd5ff..e461395 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > >
> > > ...
> > >
> > > +			spi0: spi@980000 {
> > > +				compatible = "qcom,geni-spi";
> > > +				reg = <0 0x00980000 0 0x4000>;
> > > +				clock-names = "se";
> > > +				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
> > > +				pinctrl-names = "default";
> > > +				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>,
> > > <&qup_spi0_cs_gpio>;
> > 
> > What is the story behind 'qup_spiN_cs' and 'qup_spiN_cs_gpio'? Both
> > configure
> > the CS pin with a different function:
> > 
> 
> As per discussion here [1], we have split like this.
> 
> [1] https://lore.kernel.org/patchwork/patch/1393353/#1591826

IIUC that's only about having separate configs for each pin, instead of
groups like 'qup-spi0-default'. What you are doing above with 'qup_spi0_cs'
and 'qup_spi0_cs_gpio' is to configure the same pin (GPIO 3) both as SPI
chip select and as GPIO. Which one is it?

I imagine we want to have both pinctrl definitions to allow a board to
configure the pin either as SPI CS or GPIO. However it should be only one
of the two at a time, and the SoC .dtsi should provide a reasonable
default, which probably is SPI CS.

Maybe I'm missing something, if so please provide details on why it is
necessary to have this config.
