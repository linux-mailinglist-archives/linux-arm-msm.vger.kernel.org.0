Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A15AE1D332B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 16:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgENOhr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 10:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgENOhr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 10:37:47 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F008CC061A0F
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 07:37:46 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id f6so1337356pgm.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 07:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=myAfLnmBUwxOXrWpGmgAhuCrYyR/+Qq8ha9lCmTxobQ=;
        b=VVJT+tRdvrHedNG3fWcxgTVWuPw1kNXTpW31v+Zdv+sQr+6lTcPgup5zkVZ9D7YNKG
         sGXHX1XE/Ca+gIB8IBrlzNwi+Mko1SqNSHfodsk12A9YwLOnksgHlalr0gCQE/McA0Pm
         MLAhafXzPZTcbuXIWkQRsIsTGeXX5vm6ujwTR3aC8vCv3cRiHZ6rRaDEpSJg9tFoEfF/
         V480eHYm2hDmTpSj79PvM3VpG475Nlp4IP0mA+qnTjcS4VVyqWyvuEq61oyht9AWrW+Y
         AqfNHZq/nAxOgWvR6YMkZL/BZA9CPzIAxtn6q6gOA4Lp2yJKaYIIgAXLrl9BjABi37/L
         uYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=myAfLnmBUwxOXrWpGmgAhuCrYyR/+Qq8ha9lCmTxobQ=;
        b=DJcF1TVa8iB8FfbH4v9C2cjCiya/LRCNyEnmr6BekJ/74zWe773racpLeS6sBWzN+8
         SEcH0WYduPf+zyuxDu2jFXn/N8zgHKisalNW0+nqkAiID1z3yjJKROpxfbVb+7VCHW7Z
         pDpupaxbKKrRaugngr/kq9RdUyj5JOm9ZQxOLjq/6eOu3cUrffI65vxx23nKUS67YMHM
         q8E1/M9DVMpmk+K3iTDu+YRFNIb/ybFvRBEhYx3UNbpV3fY9dSNd+q85suOwLaN4pAIc
         eBjPXrQjKU91l4JCcnD1Oi8DY6KpPpPL/TWMUIhz8csB6wX6ysvMjqmhc5ajPfD4mnx1
         Dzmw==
X-Gm-Message-State: AOAM532Wyg8m+2OPVMZb7opsRmhRZzZTFLC/umLv77x0StFJsGnAu3z3
        KDVtWwtT1TviagUw6X54p1aY6w==
X-Google-Smtp-Source: ABdhPJzMUAO/Hp/8HePC/WpyIdkcWchv8FZml1mVlO6EUQe7g4ISZjDUtlBSdcFzqCdLKZBeYAn4ig==
X-Received: by 2002:a63:440e:: with SMTP id r14mr4398210pga.340.1589467066271;
        Thu, 14 May 2020 07:37:46 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h14sm18053136pjc.46.2020.05.14.07.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 07:37:45 -0700 (PDT)
Date:   Thu, 14 May 2020 07:36:16 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add sm8250 pinctrl
 bindings
Message-ID: <20200514143616.GU2165@builder.lan>
References: <20200417061907.1226490-1-bjorn.andersson@linaro.org>
 <20200417061907.1226490-2-bjorn.andersson@linaro.org>
 <20200429213453.GA32114@bogus>
 <20200514060422.GL1302550@yoga>
 <CACRpkdZpfgb0wwt2FUwqPab4XhtLXfDWOvZLdCc+NF-mVJkKYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZpfgb0wwt2FUwqPab4XhtLXfDWOvZLdCc+NF-mVJkKYw@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 14 May 07:12 PDT 2020, Linus Walleij wrote:

> On Thu, May 14, 2020 at 8:04 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Wed 29 Apr 14:34 PDT 2020, Rob Herring wrote:
> > > On Thu, Apr 16, 2020 at 11:19:06PM -0700, Bjorn Andersson wrote:
> > > > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
> > [..]
> > > > +#PIN CONFIGURATION NODES
> > > > +patternProperties:
> > > > +  '^.*$':
> > > > +    if:
> > > > +      type: object
> > > > +    then:
> > >
> > > Needs a $ref to the standard properties.
> > >
> > > Would be good to show a child node in the example too. (And try having
> > > an error in a standard property type to verify you get an error).
> > >
> >
> > Finally looked into this.
> 
> Can you send an incremental patch because otherwise I have
> to revert the patch that I merged (maybe to trigger happy, mea culpa).
> 

I appreciate that you merged this already, so I'm happy to fix this
incrementally.

> (If it's too hard I can just revert it.)
> 

Afaict there are two different $refs available with standard properties
and adding either one works, but I don't understand how to add both.
Also $ref'ing pincfg-node.yaml means that the binding suddenly accepts
standard properties that the hardware doesn't support, so I would like
to be able to reduce this list somehow...

But I don't see anything preventing this from being done incrementally.

Thanks,
Bjorn
