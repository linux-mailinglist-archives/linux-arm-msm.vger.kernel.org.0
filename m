Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66DF300CFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 20:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729954AbhAVTzb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 14:55:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728292AbhAVSht (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 13:37:49 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60EFBC06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jan 2021 10:37:09 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id 15so7028636oix.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jan 2021 10:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oiwTUWFMiiTAag0lmijypi0pOjEKvSmh8EmQOS0n7Gc=;
        b=cpnwDGd8R6/JJHRmec+G6nc6gOBqjaPwi2aGFQNIjDJM7SgZOfO2gMn5najABtCGGk
         Fq1/SDPVd9FR3YgmnCy6Df5qwJ9cOh/Gd37sTFqZRM2FborxaPyylbfz6Q49HoXAWIz2
         w6fq+yQ1CumMJZf4XQ0KLc39d8G+JyPUP8xK+9NQO35aTAcX9NQ9+PgvzgrJ9UgqRNt6
         5vLiw+aRoWepI9MyCNSWCtV4DB6UY6gcJhKgIi58HN6uaCCmb6O1gqU0RSv2Go7bxDjM
         F5OMSVS8CjUfrd8sHeAQ1Z2hqf0MQFf0KDK48Ka5QovqiI0jzv9g5Rw4LVFCrLN6Zaru
         e/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oiwTUWFMiiTAag0lmijypi0pOjEKvSmh8EmQOS0n7Gc=;
        b=QUWelUtBbTEf+RMuXrZjE0e8rsPbgmxlqYkwBbt2vzmyN9Fwd8YMhWHF4NVj6L4aij
         8gkvPtOERg7PdM0EhJXyYDBMfLNLM5dreEfd653oBWPJVfuI/C+z+PXfivtxpFQePloa
         UCpNdZsvPK6MYDHSXViS1xKbH1DIMZsW/fO8yVi/Eaii+Q4YRzjyS9rcu/+nxtu1b15V
         MmuQSzXPULSMuuyhdOY3GDlquDm/u83HNqEv09TIdCwoPFfpnA5lWeKcVcdFz4hluWOH
         G/h+pFK37tMaPamyTpSyGaqMR+rQaZ1fSHKH+8rBkPR1d3DCerSAMiDeoQa9sF2jQSQp
         ws7g==
X-Gm-Message-State: AOAM531/8c8hJIlGAAOxtmZ+vzzrfkoj5HYHYxLrM+6sLQ54h/zJboB9
        T4Vf51gVgbqsPDWoL8L0EV/+gQ==
X-Google-Smtp-Source: ABdhPJwKAvyk3ThKI943yqpMg2u8a94sfT2RZdHPFBpX0QAr4RcLE8Sy3H4is4Db3CxyY4Bwld/d/Q==
X-Received: by 2002:aca:3784:: with SMTP id e126mr4145267oia.170.1611340628453;
        Fri, 22 Jan 2021 10:37:08 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b19sm1852449oib.6.2021.01.22.10.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 10:37:07 -0800 (PST)
Date:   Fri, 22 Jan 2021 12:37:06 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan McDowell <noodles@earth.li>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: add prng definition to ipq806x
Message-ID: <YAsbUsLuDuDiqwFU@builder.lan>
References: <20200705142544.GA3389@earth.li>
 <20201129185022.GT32650@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201129185022.GT32650@earth.li>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 29 Nov 12:50 CST 2020, Jonathan McDowell wrote:

> Gentle poke; did this just get missed or is there some reason not to
> apply it?
> 

There's no reason why this wasn't applied. I've picked it up now.

Thank you,
Bjorn

> On Sun, Jul 05, 2020 at 03:25:44PM +0100, Jonathan McDowell wrote:
> > Add missing prng definition for ipq806x SoC
> > 
> > Signed-off-by: Jonathan McDowell <noodles@earth.li>
> > ---
> >  arch/arm/boot/dts/qcom-ipq8064.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> > index b912da9a3ff3..22e0669b9133 100644
> > --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> > +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> > @@ -386,6 +386,13 @@ gsbi7_serial: serial@16640000 {
> >  			};
> >  		};
> >  
> > +		rng@1a500000 {
> > +			compatible = "qcom,prng";
> > +			reg = <0x1a500000 0x200>;
> > +			clocks = <&gcc PRNG_CLK>;
> > +			clock-names = "core";
> > +		};
> > +
> >  		sata_phy: sata-phy@1b400000 {
> >  			compatible = "qcom,ipq806x-sata-phy";
> >  			reg = <0x1b400000 0x200>;
> > -- 
> > 2.27.0
> > 
> 
> J.
> 
> -- 
> Revd Jonathan McDowell, ULC | Hail Eris. All hail Discordia. Fnord?
