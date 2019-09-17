Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF05B519B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 17:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727190AbfIQPe0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 11:34:26 -0400
Received: from mail-io1-f52.google.com ([209.85.166.52]:46590 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726827AbfIQPe0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 11:34:26 -0400
Received: by mail-io1-f52.google.com with SMTP id d17so8524664ios.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2019 08:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b5eESMD28qPgijAAjYQFFcmvEqcWiLEcXpX+fUcktPY=;
        b=RXTfOdxTaJhTSqzhdU7taayxloeJ3SxbSRDGNzbfnSr0B9DyxW5EWppgAo7pTfOgCX
         Ol0NAEcDWxgYi/N2ukIt2QWmgFT5qZsujg2bW5EndzzTmTfDKtRLEUsb+okMyUGXyocV
         obvOZcwjcjUAUCAi+4Bd9FFkgBCCq4ry8D7x8COwUa1yL92SfAvCeU6d7m/YjvGylRzq
         0pDqlvQSurcPbG815AsMMdh2SekBw5Y7JNpwCVLfv5i9PX/A0+2LFc3cAR+2bknAE+uH
         y786fgNT32OvVBt309WZ/SPpL+xyHKejf2BocErPg1YRv+yuBII6h3Iulil94oFQF8a7
         h30g==
X-Gm-Message-State: APjAAAWV6Yr5JRyd0AQMySjYaxk7p+FaEEzakGYCT04+1FqukpVh53/W
        iO30MtU+AMRMoeN8MTQfE+9VIg==
X-Google-Smtp-Source: APXvYqxPWSxk0QiDZucIgQV74YO0vltXHIK9raR1c0yDGCwIJyW9xu9hnN02QKJ2g6jbj+82Tj3aaQ==
X-Received: by 2002:a02:9182:: with SMTP id p2mr4407846jag.43.1568734464780;
        Tue, 17 Sep 2019 08:34:24 -0700 (PDT)
Received: from google.com ([2620:15c:183:0:82e0:aef8:11bc:24c4])
        by smtp.gmail.com with ESMTPSA id u11sm3569716iof.22.2019.09.17.08.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 08:34:23 -0700 (PDT)
Date:   Tue, 17 Sep 2019 09:34:19 -0600
From:   Raul Rangel <rrangel@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>
Subject: Re: [RFC] clk: Remove cached cores in parent map during unregister
Message-ID: <20190917153419.GA258455@google.com>
References: <20190723051446.20013-1-bjorn.andersson@linaro.org>
 <20190729224652.17291206E0@mail.kernel.org>
 <20190821181009.00D6322D6D@mail.kernel.org>
 <20190826212415.ABD3521848@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826212415.ABD3521848@mail.kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 26, 2019 at 02:24:14PM -0700, Stephen Boyd wrote:
> > 
> > ---8<---
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index c0990703ce54..f42a803fb11a 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -3737,6 +3737,37 @@ static const struct clk_ops clk_nodrv_ops = {
> >         .set_parent     = clk_nodrv_set_parent,
> >  };
> >  
> > +static void clk_core_evict_parent_cache_subtree(struct clk_core *root,
> > +                                               struct clk_core *target)
> > +{
> > +       int i;
> > +       struct clk_core *child;
> > +
> > +       if (!root)
> > +               return;
> 
> I don't think we need this part. Child is always a valid pointer.
> 

Bjorn or Saiprakash
Are there any plans to send out Stephen's proposed patch?

Thanks
