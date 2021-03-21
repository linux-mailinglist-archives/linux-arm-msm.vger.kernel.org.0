Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13D2E343261
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Mar 2021 13:22:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbhCUMVj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Mar 2021 08:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhCUMVS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Mar 2021 08:21:18 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38A37C061762
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Mar 2021 05:21:18 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so8991052pjh.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Mar 2021 05:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pk1zBavQCMgJOfI6/3DRueMGRnMF64T8/XpKS/gU6sc=;
        b=E3oSfjmnpT74rFr+EqN+eQ4x7Xs7dlMR29T/W+9l3L3Z0+vdjmwdsk7DqXj4QDMBu8
         N5fb1V6DUDrCG6tBLEIAKownVTj5NP7gqoeRDyXjOHlEGg2nB3EKiLmUAQh4UPayutD4
         pL6cxwgqe/mRq5Cf7J2jIYf+uHOE1tGvLZTJeBcsM1F2HO4lMDf7gEc+d5DCxCYkRiI8
         uX2yaLXx+gQJQWf3biN1thOJiq7uptRe/GzmPloR+aiLrhTVQQB5+EL4C08LJ1UZ7Wlg
         EXqjIFj5HOThPfe+zb+gTa2ZJ7DhC2HMq74OepUNNaqu5/A/hryAM0XW4Ls+v10KBTie
         D4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pk1zBavQCMgJOfI6/3DRueMGRnMF64T8/XpKS/gU6sc=;
        b=O2dQlesQSSTGcjhwWMwzDS9BeXiWGon0sQB3yPWukAHT1PkUV/e6cvBu6zz0y6ltsD
         W/lLe3CV3h7+E7zPQOD8BGxrzbw8vLNDzUe6zEJD5qdZ0ObA+lqqvyeMRdOELO3cuLk1
         ObhAQIu3ZW+zR3jBcSj+9rsN5fTQi6mS8QMRal0reVHbUmi2gW8i0OI/MLY2oMGesA3z
         IsxK1HJOWgwkaFfieyz4+LVpbOoUlRvUi/SykpxXvzEsGNjUDKJC822VReWKg8HCYTuZ
         bGI86LVVHc7+J5cf4PTKz/ff0o+TSiC7t03YiZ2Ap4TTtTQDIUR+jbtyo8X0ZD1BwZ2p
         8pwg==
X-Gm-Message-State: AOAM531LyO+GpHK4ml8B9iQZT0HfdTIfVWXNMegLyr7MjellPaNm5me9
        Ogm5gtnjA6qZx1ZG+3DYpPqgKA==
X-Google-Smtp-Source: ABdhPJzcNNhPqQPpRA8BGhB9v2KHrjW8RMbEuLZyH07qGD4EzaTILUyOwqgJtz/F1lOewT5bWZ1NSA==
X-Received: by 2002:a17:902:7889:b029:e6:b9c3:bc0d with SMTP id q9-20020a1709027889b02900e6b9c3bc0dmr22583020pll.23.1616329277591;
        Sun, 21 Mar 2021 05:21:17 -0700 (PDT)
Received: from leoy-ThinkPad-X240s (144.34.177.189.16clouds.com. [144.34.177.189])
        by smtp.gmail.com with ESMTPSA id p3sm9715690pgi.24.2021.03.21.05.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 05:21:16 -0700 (PDT)
Date:   Sun, 21 Mar 2021 20:21:12 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH] arm64: dts: msm8916: Enable CoreSight STM component
Message-ID: <20210321122112.GB488187@leoy-ThinkPad-X240s>
References: <20210320025942.487916-1-leo.yan@linaro.org>
 <YFYWOOdHT/qJk4Mr@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFYWOOdHT/qJk4Mr@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Mar 20, 2021 at 04:35:20PM +0100, Stephan Gerhold wrote:
> Hi Leo,
> 
> On Sat, Mar 20, 2021 at 10:59:42AM +0800, Leo Yan wrote:
> > From: Georgi Djakov <georgi.djakov@linaro.org>
> > 
> > Add DT binding for CoreSight System Trace Macrocell (STM) on msm8916,
> > which can benefit the CoreSight development on DB410c.
> > 
> > Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi |  1 +
> >  arch/arm64/boot/dts/qcom/msm8916.dtsi     | 27 +++++++++++++++++++++++
> >  2 files changed, 28 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > index 3a9538e1ec97..dd87e5d739ab 100644
> > --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > @@ -406,6 +406,7 @@ &wcd_codec {
> >  &etm1 { status = "okay"; };
> >  &etm2 { status = "okay"; };
> >  &etm3 { status = "okay"; };
> > +&stm { status = "okay"; };
> >  &etr { status = "okay"; };
> >  &funnel0 { status = "okay"; };
> >  &funnel1 { status = "okay"; };
> 
> This is alphabetically ordered so &stm should be on the line before &tpiu.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > index 402e891a84ab..892f1772e53c 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > [...]
> > @@ -882,6 +889,26 @@ etm3_out: endpoint {
> >  			};
> >  		};
> >  
> > +		stm: stm@802000 {
> 
> And these nodes are sorted by their unit address (0x802000),
> so stm@802000 should be the first coresight node, before cti@810000.
> 
> > +			compatible = "arm,coresight-stm", "arm,primecell";
> > +			reg = <0x802000 0x1000>,
> > +			      <0x9280000 0x180000>;
> 
> And please pad these addresses with zeroes so the order is more easily
> visible, i.e.
> 
> +			reg = <0x00802000 0x1000>,
> +			      <0x09280000 0x180000>;

Good suggestions, Stephan!  Have sent patch v2 for this.

Thank you,
Leo
