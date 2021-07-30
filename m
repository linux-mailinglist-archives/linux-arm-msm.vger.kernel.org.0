Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 467803DBE29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 20:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbhG3SOi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 14:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbhG3SOg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 14:14:36 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 016C2C0613C1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 11:14:32 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id t14so14431359oiw.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 11:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Rc/AVBrPvwRzL0X+38wuA19xK4WI9HXXJR3Jq5n4fXQ=;
        b=xYJmqMzetizp0d//qDjERSNMBhxRyux6KG7YP2MFGsAsCLdzNYIxIGvLq72ICr6kA0
         7NVEv8zMWEg31G6nLcqRW6+ZASOFyb+NpqFEIqCTn0zYr8WRcODGX7wv8M08ovyZb23C
         sP9Qfy2ZXqsXXY5cY3P8Nq5RRwsJKifpeCn7Nv/TFYHERVQsVMbGAKxF7hHcAOVdrTei
         Uc45+ONVn/6Ym/QqRYZnm2wdnwosEErgmclvVjGvkJCEPI7aGhJdyWn4qSDnjqtChTUL
         t0BlCervYZbFqXQTNub2ob5yqo+q6D1gRnOoFGifZaHcIdACfCxm4dS0JE/Ny9Oixfgk
         GDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rc/AVBrPvwRzL0X+38wuA19xK4WI9HXXJR3Jq5n4fXQ=;
        b=nWB3eQ+feNw/dKCmTMKlsH+t5ipZwQ9OQcD49HsVdu5F1RNOJGqErIN4Ta3TQ7+8ax
         S/GCu1q0zFO9oyJUTXqiAp88NdEvOLtwfaQh1FY0XVIAPk5u/7bhv5v/53whnX5CBBvQ
         j59ysPv5TSle+ri4FCNTV0LL6sn2enFYwLTKiBTZkaCo6fI0aBMVA9qwRByMmYJRM8KJ
         abYtAzqvfWLBSB8zMKxABZIN38fTAelKCecTGGT8k71CQbuBUR1gROa+d9++PkVKOV3o
         0ibWXeIhtbhyBdexHLwbGcTGFxUocQgHZAllA3T6AErlrC7x5DgWdFwBMBNnbKbOeylE
         aKNQ==
X-Gm-Message-State: AOAM532Joc4ij5dHAu7bo2Xg3smdAyzLQ7Fg4d7EUQlGzoOSQFfRSFST
        G5bNAw8KbL22ezbav7VlfFd/fg==
X-Google-Smtp-Source: ABdhPJyVl7na4KYIky1m9tZxqT+FUSR85EjHbfQ9B74ux1IwE7cz7uqU4l7VpSa8Qfwv+/C9/mFriQ==
X-Received: by 2002:a05:6808:1807:: with SMTP id bh7mr2793707oib.52.1627668871361;
        Fri, 30 Jul 2021 11:14:31 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p10sm189286oop.46.2021.07.30.11.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 11:14:30 -0700 (PDT)
Date:   Fri, 30 Jul 2021 13:14:28 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, robh+dt@kernel.org,
        will@kernel.org, saiprakash.ranjan@codeaurora.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH 9/9] arm64: dts: qcom: sc7280: Update Q6V5 MSS node
Message-ID: <YQRBhOeHO7LMDdWu@builder.lan>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-10-git-send-email-sibis@codeaurora.org>
 <YNodaqE9n9+sQUFq@google.com>
 <c561f99cb281c28581d10e5805190df8@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c561f99cb281c28581d10e5805190df8@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 30 Jun 15:08 CDT 2021, Sibi Sankar wrote:

> On 2021-06-29 00:35, Matthias Kaehlcke wrote:
> > On Fri, Jun 25, 2021 at 01:17:38AM +0530, Sibi Sankar wrote:
> > > Update MSS node to support MSA based modem boot on SC7280 SoCs.
> > > 
> > > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sc7280-idp.dts |  7 +++++++
> > >  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 19 ++++++++++++++++---
> > >  2 files changed, 23 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > > b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > > index 191e8a92d153..d66e3ca42ad5 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > > +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > > @@ -343,3 +343,10 @@
> > >  		bias-pull-up;
> > >  	};
> > >  };
> > > +
> > > +&remoteproc_mpss {
> > > +	status = "okay";
> > > +	compatible = "qcom,sc7280-mss-pil";
> > > +	iommus = <&apps_smmu 0x124 0x0>, <&apps_smmu 0x488 0x7>;
> > > +	memory-region = <&mba_mem &mpss_mem>;
> > > +};
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > index 56ea172f641f..6d3687744440 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > @@ -586,7 +586,8 @@
> > > 
> > >  		remoteproc_mpss: remoteproc@4080000 {
> > >  			compatible = "qcom,sc7280-mpss-pas";
> > > -			reg = <0 0x04080000 0 0x10000>;
> > > +			reg = <0 0x04080000 0 0x10000>, <0 0x04180000 0 0x48>;
> > > +			reg-names = "qdsp6", "rmb";
> > 
> > Binding needs update?
> > 
> > Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml:
> > 
> >   reg:
> >       maxItems: 1
> > 
> > > 
> > >  			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
> > >  					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > > @@ -597,8 +598,11 @@
> > >  			interrupt-names = "wdog", "fatal", "ready", "handover",
> > >  					  "stop-ack", "shutdown-ack";
> > > 
> > > -			clocks = <&rpmhcc RPMH_CXO_CLK>;
> > > -			clock-names = "xo";
> > > +			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
> > > +				 <&gcc GCC_MSS_OFFLINE_AXI_CLK>,
> > > +				 <&gcc GCC_MSS_SNOC_AXI_CLK>,
> > > +				 <&rpmhcc RPMH_CXO_CLK>;
> > > +			clock-names = "iface", "offline", "snoc_axi", "xo";
> > 
> > Binding needs update?
> > 
> > Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml:
> > 
> >   clocks:
> >     items:
> >       - description: XO clock
> >   clock-names:
> >     items:
> >       - const: xo
> 
> qcom,sc7280-mpss-pas compatible requires
> just the xo clock and one reg space whereas
> the qcom,sc7280-mss-pil compatible requires
> the additional clks and reg spaces. We just
> overload properties where re-use is possible
> across boards. Hence it would be wrong to
> list those clks/reg spaces as requirements
> for the pas compatible.
> 

Our decision to describe the platform node as a superset of the
resources needed by the pas and pil variants was never reflected in the
DT bindings; resulting in the issue that the superset doesn't validate
against the pas binding and both bindings are full of platform-specific
conditionals.

To resolve the two issues I think we should split the current binding(s)
in a set of platform-centric bindings, that captures the idea of
describing the superset.

To reduce the duplication - that already exists between the two
bindings - I think we should break those out in a common part.


I'm however fine with not delaying this series further, if we agree that
the end result matches what we would put in a combined qcom,sc7280-mpss
binding.

Regards,
Bjorn
