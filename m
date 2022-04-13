Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26E5F4FFD15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 19:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235640AbiDMRup (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 13:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235764AbiDMRun (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 13:50:43 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5BA96D3A2;
        Wed, 13 Apr 2022 10:48:20 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id v15so3302435edb.12;
        Wed, 13 Apr 2022 10:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:in-reply-to;
        bh=OcdT5dzwGB0NSZ0Zfcq5AGwevU6ZP+UA0hgOZU3f3O0=;
        b=FX/8I6C2TFCiwyKyfLjnU+BIrZouIziMBeuZyxTPP9ppiDwdpaxGZ+ncP+iwdFaUrM
         TVHSl798PdhJTyIu2z6KaNOP5dVE4swnn0IE+5jaUyR5pe9FDZKOVMNxJid4uvGARZnk
         LmLtZpHQ4mQKjf46tqgpw3/CYLFscMVg0kDJZvJAzfC64EdflUXxpg9uctAB9ig+W8jZ
         330TzL9ZQbhD92BPVa5aG2dL/B5iKoBUb9yKBhtLM1VL3ZSs/zWZDC5ngnbCQoXAwKp5
         MDOpwY7DffoqhwFABxNKmxRaxttepgY96UZnAoMD41lWp4Giz4VeuvpHvflU3qesMtKI
         kE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:in-reply-to;
        bh=OcdT5dzwGB0NSZ0Zfcq5AGwevU6ZP+UA0hgOZU3f3O0=;
        b=5RCg5rbGXLSV86cuczSr7bhJysivOq/djroWSEd49E0jAVp1z0YOgknzmSnTAh5PB4
         PF5Sa2KHziFgP1J1T6tFLCRRqHXQBNSiMQ551l9OazoGuc+VUPJz5w5MlCA5h0y79CWW
         3LNMmaaogayskYv1FgTlTEQZhtVKG3tlSS0R9jXvI/T5V/Yj/6Ixd3vY5FVG4aCzuuXQ
         XrDSNg5TJ2knltTyBA8bK9Fe19kn7/NlvEMivwi1rmXJ+sUoBcp2/JYu62aQdG/BTjDq
         vEu4NMdjaOEgHnhx6rvh9kn4wcZ4JnYrslcs+FVV9J2DxphZjF1El6nw0JR+mFOM+KTn
         rAVA==
X-Gm-Message-State: AOAM530aRrkhfcTBkDtwY9ZNJXVdqrjvITknHTinPofyyACZDVWwMfO3
        TSVnnMvzbZpnXh6uYB/+KPFQ60tL7/g=
X-Google-Smtp-Source: ABdhPJwphOqrXvRUNk6aB+0mOc2jFSJ71nNmHufZPygOuu7p3rVEXm9MkR/0nbMIFlc63JsyQdeUkw==
X-Received: by 2002:a05:6402:27d0:b0:419:5184:58ae with SMTP id c16-20020a05640227d000b00419518458aemr45731415ede.314.1649872099278;
        Wed, 13 Apr 2022 10:48:19 -0700 (PDT)
Received: from Ansuel-xps. (host-80-182-176-248.retail.telecomitalia.it. [80.182.176.248])
        by smtp.gmail.com with ESMTPSA id qb10-20020a1709077e8a00b006e892cf471asm198323ejc.84.2022.04.13.10.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 10:48:13 -0700 (PDT)
Message-ID: <62570cdd.1c69fb81.7eb7.12e8@mx.google.com>
X-Google-Original-Message-ID: <YlcM3IPfbpT+5/zY@Ansuel-xps.>
Date:   Wed, 13 Apr 2022 19:48:12 +0200
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 00/18] Modernize rest of the krait drivers
References: <20220321231548.14276-1-ansuelsmth@gmail.com>
 <c5af6c12-961d-43e2-31ea-cbda9ac347cf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5af6c12-961d-43e2-31ea-cbda9ac347cf@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 13, 2022 at 08:31:31PM +0300, Dmitry Baryshkov wrote:
> On 22/03/2022 02:15, Ansuel Smith wrote:
> > This is a follow-up to the ipq806x gcc modernize series. Manu cleanup
> > changes and also some discoveries of wrong definition notice only with
> > all these conversions.
> 
> General comment regarding this patch series. It contains fixes, clock
> conversion for several drivers, dts fixes, etc. It's, for example, not
> straightforwardly obvious if Bjorn can pickup patches 04 or 06 without
> picking up other patches.
> 
> If would be best if you can split this series or at least pull fixes to be
> the first patches in the pile.
>

Considering that now this is grown to 21 patch in v7 (that is still have
to push)... Yes I think I have to split this...
Wonder if you can give me some hint. 

- Series for krait-cc
- Series for kpss-acc/gcc
- Single patch for hfpll
- Single patch for gcc fixes
- Series for kpss-xcc
- Series for clk-krait
- Series for dts fixes?

Wonder if this kind of split can work?

> Patch 01 is only used by patch 10, they can stay close.
> 
> In some of the commit messages you describe what do they do, but you
> completely omit the reason for the change, why is the change necessary.
> (Yes, I spot that because I also too often skip that).
> 
> > 
> > The first patch is an improvement of the clk_hw_get_parent_index. The
> > original idea of clk_hw_get_parent_index was to give a way to access the
> > parent index but for some reason the final version limited it to the
> > current index. We change it to give the current parent if is not
> > provided and to give the requested parent if provided. Any user of this
> > function is updated to follow the new implementation.
> > 
> > The patch 2 and 3 are some additional fixes for gcc.
> > The first one is a fix that register the pxo and cxo fixed clock only if
> > they are not defined in DTS.
> > The patch 3 require some explaination. In short is a big HACK to prevent
> > kernel panic with this series.
> > 
> > The kpss-xcc driver is a mess.
> > The Documentation declare that the clocks should be provided but for some
> > reason it was never followed.
> > In fact in the ipq8064 DTSI only the clocks for l2cc are declared but
> > for cpu0 and cpu1 the clocks are not defined.
> > The kpss-xcc driver use parent_names so the clks are ignored and never
> > used so till now it wasn't a problem (ignoring the fact that they
> > doesn't follow documentation at all)
> > On top of that, the l2cc node declare the pxo clock in a really strange
> > way. It's declared using the PXO_SRC gcc clock that is never defined in
> > the gcc ipq8064 clock table. (the correct way was to declare a fixed
> > clock in dts and reference that)
> > To prevent any kind of problem we use the patch 3 and provide the clk
> > for PXO_SRC in the gcc clock table. We manually provide the clk after
> > gcc probe.
> > 
> > Patch 4 is just a minor cleanup where we use the poll macro
> > 
> > Patch 5 is the actually kpss-xcc conversion to parent data
> > 
> > Patch 6-7 should be a fixup of a real conver case
> > 
> > Patch 8 converts the krait-cc to parent_data
> > Patch 9 give some love to the code with some minor fixup
> > Patch 10 drop the hardcoded safe sel and use the new
> > clk_hw_get_parent_index to get the safe parent index.
> > (also I discovered that the parent order was wrong)
> > 
> > Patch 11 is an additional fixup to force the reset of the muxes even
> > more.
> > 
> > Patch 12-13 are some additiona taken from the qsdk that were missing in
> > the upstream driver
> > 
> > Patch 14 converts krait-cc to yaml
> > 
> > Patch 15 add to krait-cc Documentation the L2 clocks
> > 
> > Patch 16 converts the kpss-acc driver to yaml and fix some Documentation
> > error
> > 
> > Patch 17 convets the kpss-gcc driver to yaml
> > 
> > Patch 18 finally adds all this stuff to the ipq8064 dtsi (and fix the
> > stupid PXO_SRC phandle)
> > 
> > I tested this series on a ipq8064 SoC by running a cache benchmark test
> > to make sure the changes are correct and we don't silently cause
> > regressions. Also I compared the output of the clk_summary every time
> > and we finally have a sane output where the mux are correctly placed in
> > the correct parent. (till now we had the cpu aux clock all over the
> > place, probably never cause problems but who knows.)
> > 
> > v6:
> > - Move dts patch as last patch
> > - Address commencts from Rob
> > - Fix warning from make dtbs_check
> > v5:
> > - Address comments from Krzysztof
> > v4:
> > - Fix more dt-bindings bog errors
> > v3:
> > - Split Documentation files for kpss and krait-cc
> > v2:
> > - introduce new API instead of fixing the existing one
> > - do not reorganize variables in krait-cc
> > - fix some comments error and improve it
> > - return better error for patch 7
> > - fix missing new line on patch 16
> > 
> > Ansuel Smith (18):
> >    clk: introduce clk_hw_get_index_of_parent new API
> >    clk: qcom: gcc-ipq806x: skip pxo/cxo fixed clk if already present
> >    clk: qcom: gcc-ipq806x: add PXO_SRC in clk table
> >    clk: qcom: clk-hfpll: use poll_timeout macro
> >    clk: qcom: kpss-xcc: convert to parent data API
> >    clk: qcom: clk-krait: unlock spin after mux completion
> >    clk: qcom: clk-krait: add hw_parent check for div2_round_rate
> >    clk: qcom: krait-cc: convert to parent_data API
> >    clk: qcom: krait-cc: drop pr_info and register qsb only if needed
> >    clk: qcom: krait-cc: drop hardcoded safe_sel
> >    clk: qcom: krait-cc: force sec_mux to QSB
> >    clk: qcom: clk-krait: add apq/ipq8064 errata workaround
> >    clk: qcom: clk-krait: add enable disable ops
> >    dt-bindings: clock: Convert qcom,krait-cc to yaml
> >    dt-bindings: clock: Add L2 clocks to qcom,krait-cc Documentation
> >    dt-bindings: arm: msm: Convert kpss-acc driver Documentation to yaml
> >    dt-bindings: arm: msm: Convert kpss-gcc driver Documentation to yaml
> >    ARM: dts: qcom: qcom-ipq8064: add missing krait-cc compatible and
> >      clocks
> > 
> >   .../bindings/arm/msm/qcom,kpss-acc.txt        |  49 -----
> >   .../bindings/arm/msm/qcom,kpss-acc.yaml       |  94 +++++++++
> >   .../bindings/arm/msm/qcom,kpss-gcc.txt        |  44 -----
> >   .../bindings/arm/msm/qcom,kpss-gcc.yaml       |  69 +++++++
> >   .../bindings/clock/qcom,krait-cc.txt          |  34 ----
> >   .../bindings/clock/qcom,krait-cc.yaml         |  65 ++++++
> >   arch/arm/boot/dts/qcom-ipq8064.dtsi           |  24 ++-
> >   drivers/clk/clk.c                             |  14 ++
> >   drivers/clk/qcom/clk-hfpll.c                  |  13 +-
> >   drivers/clk/qcom/clk-krait.c                  |  44 ++++-
> >   drivers/clk/qcom/clk-krait.h                  |   1 +
> >   drivers/clk/qcom/gcc-ipq806x.c                |  27 ++-
> >   drivers/clk/qcom/kpss-xcc.c                   |  25 +--
> >   drivers/clk/qcom/krait-cc.c                   | 186 ++++++++++--------
> >   include/linux/clk-provider.h                  |   1 +
> >   15 files changed, 453 insertions(+), 237 deletions(-)
> >   delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.txt
> >   create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.yaml
> >   delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.txt
> >   create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.yaml
> >   delete mode 100644 Documentation/devicetree/bindings/clock/qcom,krait-cc.txt
> >   create mode 100644 Documentation/devicetree/bindings/clock/qcom,krait-cc.yaml
> > 
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
	Ansuel
