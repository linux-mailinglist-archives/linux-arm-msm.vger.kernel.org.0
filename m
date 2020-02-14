Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD24F15D826
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 14:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729287AbgBNNOh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Feb 2020 08:14:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:46994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729229AbgBNNOh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Feb 2020 08:14:37 -0500
Received: from localhost (unknown [106.201.58.38])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9644F2086A;
        Fri, 14 Feb 2020 13:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581686076;
        bh=VOWkhA1sc+eqIqzIPtB4Bs3LA4z7Q7k58kMbeIZ5+Fw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V/rzqzEnI02r6b6vlmGE0HWdbptf900L7HcvnPygtD8T3ExIzPLgpaeoT5SQ3UZoh
         phWkpSR3fosETus8KmLMGGCOoGP29bCAsWxzYyLmuQPyfk1QJ8KCQLmKreSATILvMc
         cGv6hi+pq1HmuPVV5xHcFEbNSvY7tgUbjBNPDXAI=
Date:   Fri, 14 Feb 2020 18:44:29 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, jshriram@codeaurora.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, psodagud@codeaurora.org,
        robh+dt@kernel.org, tdas@codeaurora.org, tsoni@codeaurora.org,
        vnkgutta@codeaurora.org
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: sm8250: Add sm8250 dts file
Message-ID: <20200214131429.GW2618@vkoul-mobl>
References: <1579905147-12142-1-git-send-email-vnkgutta@codeaurora.org>
 <1579905147-12142-8-git-send-email-vnkgutta@codeaurora.org>
 <20200205194750.464C020730@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205194750.464C020730@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-02-20, 11:47, Stephen Boyd wrote:

> > +               CPU7: cpu@700 {
> > +                       device_type = "cpu";
> > +                       compatible = "qcom,kryo485";
> > +                       reg = <0x0 0x700>;
> > +                       enable-method = "psci";
> > +                       next-level-cache = <&L2_700>;
> > +                       L2_700: l2-cache {
> > +                             compatible = "cache";
> > +                             next-level-cache = <&L3_0>;
> > +                       };
> > +               };
> > +       };
> > +
> > +       firmware: firmware {
> 
> Does this need a label?

Nope, removed

> > +       soc: soc@0 {
> > +               #address-cells = <2>;
> > +               #size-cells = <2>;
> > +               ranges = <0 0 0 0 0x10 0>;
> > +               dma-ranges = <0 0 0 0 0x10 0>;
> > +               compatible = "simple-bus";
> > +
> > +               gcc: clock-controller@100000 {
> > +                       compatible = "qcom,gcc-sm8250";
> > +                       reg = <0x0 0x00100000 0x0 0x1f0000>;
> > +                       #clock-cells = <1>;
> > +                       #reset-cells = <1>;
> > +                       #power-domain-cells = <1>;
> > +                       clock-names = "bi_tcxo",
> > +                                       "sleep_clk";
> 
> Weird tabbign here.

Fixed this and rest of them

> > +                       #interrupt-cells = <2>;
> > +                       interrupt-parent = <&intc>;
> > +                       interrupt-controller;
> > +               };
> > +
> > +               spmi_bus: qcom,spmi@c440000 {
> 
> Node name should be 'spmi'.

Yup, changed

> > +
> > +                       rpmhcc: clock-controller {
> > +                               compatible = "qcom,sm8250-rpmh-clk";
> > +                               #clock-cells = <1>;
> > +                               clock-names = "xo";
> > +                               clocks = <&xo_board>;
> > +                       };
> > +               };
> > +
> > +               tcsr_mutex_regs: syscon@1f40000 {
> > +                       compatible = "syscon";
> > +                       reg = <0x0 0x01f40000 0x0 0x40000>;
> > +               };
> > +
> > +               timer@17c20000 {
> 
> Doug fixed these in another thread to use offset. Run dt_bindings_check
> and see how it fails.

will do

> 
> > +                       #address-cells = <2>;
> > +                       #size-cells = <2>;
> > +                       ranges;
> > +                       compatible = "arm,armv7-timer-mem";
> > +                       reg = <0x0 0x17c20000 0x0 0x1000>;
> > +                       clock-frequency = <19200000>;
> 
> Remove this. Firmware should set it up properly.

Sure

-- 
~Vinod
