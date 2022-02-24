Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 450D14C3146
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 17:29:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiBXQaL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 11:30:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiBXQaH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 11:30:07 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997781BE11B
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 08:29:33 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id j8-20020a056830014800b005ad00ef6d5dso1668279otp.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 08:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Tws7ZXpM+PZc0CK0cVaZrCHFV7BPRjaCWbwFJSB4uHI=;
        b=gGGXB3s1XU/Jl+tQ3PSSFy+TQcXe3tcSTVTuFCvZW1w9l3Jb43G/q7V/N1xagmSonu
         6WxMEqoManJU5rF/K8t2gZUMW1Dh407q0MyPbikVpaZ+TXv5tvMyhYLci8r4gzuzDSD4
         G3W2wOinGLKK495jA29V5Zrty4bqxytsc1WKb4UmuJ1pwLsO7ulkLme8jS+HHiOxF/ei
         lHS2NjjQfOG111fidmaRpuhHdCUvx2M7ZIRz/D1ssXxMsSiWhvKd3FnnUwH8NjodLnbV
         +Xa8x0ov1O7u6s9R9yQfQHOZrWlseViXoHMTQhXkd3uEEoR6NJGVGnHzhDxkvfKuMmO6
         QKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tws7ZXpM+PZc0CK0cVaZrCHFV7BPRjaCWbwFJSB4uHI=;
        b=cX8iU/l7SYMSE+e4SfoCh/HaOjp7Zl0RCNL/BJgZOyUo74nX/SCC/I8xmDR4H+dHhb
         R2wuzE+tBA3ZZk7XJSMMn8UQGrvPe4/KVbU/R8C9h/ovk42L8w+Q15u381HSpxSbSUOh
         gso8TFeYpAF5ldj67q4Bc1+7B/M0THytBPLf7UT+c74+t8gd3VhYzLZaZoamxaT5Ul+c
         rU4FzLGK+dyVqesOyYGJP7tqO2sypZ1pSq/vpwMXyB2Pms6TPK4GZXKtGwFASxpTXBKI
         OVbaYRXw3TXK//jWlr6d9j4nbDYCZT1/ORJvV45BHhiQRoZpf0Qmg3oJdtg0/wvzAUY2
         rEmw==
X-Gm-Message-State: AOAM533XbV5b0VgGeSEl5UvqBYyJaLqT9fE4nbyNJ2T22majkBf+aC5+
        J4Uq5n6CLFektJuU0dEVdS97P/oY6Bb0Yg==
X-Google-Smtp-Source: ABdhPJw2WlUPhxTSbdyd1LW3KRyGcWe5GoUwG2vd4ysIqVSblKp59SBKER8m2mJkBR4Dnhwd0N1jFg==
X-Received: by 2002:a9d:467:0:b0:5ac:c840:eb0c with SMTP id 94-20020a9d0467000000b005acc840eb0cmr1202877otc.228.1645719390679;
        Thu, 24 Feb 2022 08:16:30 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id ay42sm1662102oib.5.2022.02.24.08.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 08:16:30 -0800 (PST)
Date:   Thu, 24 Feb 2022 08:18:28 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/16] dt-bindings: clock: add ipq8064 ce5 clk define
Message-ID: <Yhev1BMkuqI5/Cu6@ripper>
References: <20220217235703.26641-1-ansuelsmth@gmail.com>
 <20220217235703.26641-13-ansuelsmth@gmail.com>
 <YhcDCnMFRppk3Mo+@builder.lan>
 <Yher1ybYkFCVLLVt@Ansuel-xps.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yher1ybYkFCVLLVt@Ansuel-xps.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 24 Feb 08:01 PST 2022, Ansuel Smith wrote:

> On Wed, Feb 23, 2022 at 10:01:14PM -0600, Bjorn Andersson wrote:
> > On Thu 17 Feb 17:56 CST 2022, Ansuel Smith wrote:
> > 
> > > Add ipq8064 ce5 clk define needed for CryptoEngine in gcc driver.
> > > 
> > 
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > 
> > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > > ---
> > >  include/dt-bindings/clock/qcom,gcc-ipq806x.h | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/include/dt-bindings/clock/qcom,gcc-ipq806x.h b/include/dt-bindings/clock/qcom,gcc-ipq806x.h
> > > index 7deec14a6dee..02262d2ac899 100644
> > > --- a/include/dt-bindings/clock/qcom,gcc-ipq806x.h
> > > +++ b/include/dt-bindings/clock/qcom,gcc-ipq806x.h
> > > @@ -240,7 +240,7 @@
> > >  #define PLL14					232
> > >  #define PLL14_VOTE				233
> > >  #define PLL18					234
> > > -#define CE5_SRC					235
> > > +#define CE5_A_CLK				235
> > >  #define CE5_H_CLK				236
> > >  #define CE5_CORE_CLK				237
> > >  #define CE3_SLEEP_CLK				238
> > > @@ -283,5 +283,8 @@
> > >  #define EBI2_AON_CLK				281
> > >  #define NSSTCM_CLK_SRC				282
> > >  #define NSSTCM_CLK				283
> > 
> > You don't like 284?
> > 
> > Regards,
> > Bjorn
> >
> 
> In the QSDK 284 is used for a virtual clk used to scale the NSS core.
> I skipped that in case we will implement it and to keep these header
> similar across QSDK and linux.
> 

Okay, let's take a look at how that virtual clock is implemented once
you get there. But I'm fine with the reasoning for leaving a gap.

Regards,
Bjorn

> > > +#define CE5_A_CLK_SRC				285
> > > +#define CE5_H_CLK_SRC				286
> > > +#define CE5_CORE_CLK_SRC			287
> > >  
> > >  #endif
> > > -- 
> > > 2.34.1
> > > 
> 
> -- 
> 	Ansuel
