Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5737E6FEDB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 May 2023 10:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233923AbjEKIPS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 May 2023 04:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233914AbjEKIPN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 May 2023 04:15:13 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFCD52D48
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 01:15:11 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-51b33c72686so5522851a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 01:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683792911; x=1686384911;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rp7EFkkNki21M4em3B9Ihum6krhAGnms8qgXubiREro=;
        b=h+gqCuqCQRyHCxRU42CejzLIkultByUIbaaJbX5nR16x1aUqb4CQcyVDOecd+f1J8T
         3pW4jhqaoj42U60titZypVh3WNes4khWkBnI/OeeF/uuq/6pVr4/I2c4pYzM5irwfOEg
         xZgdATeavs5cocMD47jNWgC42bRzlEwB3M7FbCprbmhosndUhG2tcMSgmyv3jQG9nG8o
         g1wg1fkRLb23eE4rU9gX9vIsQTgVS+DgIwvYEiX4fhSc6gC2vZD4ho5d23K1zd+1fThK
         l5cklbXRte97vTSOEv7iI80FDnsLkucoQPKlUILSfCfWATagraXOizc2XoA2Do8n0816
         zDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683792911; x=1686384911;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rp7EFkkNki21M4em3B9Ihum6krhAGnms8qgXubiREro=;
        b=hdBgshVW+j106uYcl6u665Mk7sfL3SWoT5+O7xBDnAUN1VHOaSho56qucsInQ3mcE8
         FI9OzypnM9+QM2ZEkfuPlSUdjDrjvgiboRzG9SI2Gp1WUqSjiJ26fHvsnS862Qor22+t
         QmIf+GGMnnuai6Gc1xDJY4H0I/EXye/lt+vVn+lfCejAtBZZTEO9Y29KQrezuhsokvoQ
         foVvysAXmY5Hfm6c9WxPlu1vGaowKcAE5QdV6kEDSGJJtIGNBgc7W8M3eaMUl39aRavR
         OOlh9bFGYHK5F7+j6xj+Wm1AlWnZYMUQjao6+rkXRdXs4cyrmfbbf/ZBnEyPlItFmGJd
         6NJg==
X-Gm-Message-State: AC+VfDxeVygVdyMkWc2kNUpkKxEYoAgHbGmASyK3vamLSesF8vVY90Tz
        nefcidl3oOqByQSQ2eNQyMKQ
X-Google-Smtp-Source: ACHHUZ6qP3kLWYF4y14EaOnQO9E9gvy90WM1bnsHzvO/XUZE+cJBJYRFg1DnII390waczWIR8TmyUw==
X-Received: by 2002:a05:6a20:4326:b0:100:b1b:2e6c with SMTP id h38-20020a056a20432600b001000b1b2e6cmr20418177pzk.52.1683792911189;
        Thu, 11 May 2023 01:15:11 -0700 (PDT)
Received: from thinkpad ([59.92.103.3])
        by smtp.gmail.com with ESMTPSA id s1-20020a17090a1c0100b0024e11f31012sm15493573pjs.5.2023.05.11.01.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 01:15:10 -0700 (PDT)
Date:   Thu, 11 May 2023 13:45:04 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: mmcc-msm8974: fix MDSS_GDSC power flags
Message-ID: <20230511081504.GA12021@thinkpad>
References: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
 <20230507175335.2321503-2-dmitry.baryshkov@linaro.org>
 <20230509055044.GA4823@thinkpad>
 <CAA8EJpoJr6gK=7fmwmF4+Xi5Ch_-+8L1q1WHkfVOOg+6qj=P3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJpoJr6gK=7fmwmF4+Xi5Ch_-+8L1q1WHkfVOOg+6qj=P3w@mail.gmail.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 09, 2023 at 02:20:07PM +0300, Dmitry Baryshkov wrote:
> On Tue, 9 May 2023 at 08:50, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Sun, May 07, 2023 at 08:53:35PM +0300, Dmitry Baryshkov wrote:
> > > Using PWRSTS_RET on msm8974's MDSS_GDSC causes display to stop working.
> > > The gdsc doesn't fully come out of retention mode. Change it's pwrsts
> > > flags to PWRSTS_OFF_ON.
> > >
> >
> > What does "stop working" implies? Does it work during boot and randomly stopped
> > working or it stopped working after resume from suspend?
> 
> It stops working during the boot. I observed the MDP not starting up
> properly. Mea culpa, I did not look deep enough into the details, just
> stomped upon this change which fixes the problem for me.
> 

IIUC, GDSC will be transitioned to retention mode only if the parent domain goes
to low power mode. So if the MDSS GDSC goes to retention mode during boot, then
it suggests that the parent domain is not voted properly. Unless I misunderstood
something...

Or is the GDSC behavior changes between RPM and RPMh?

- Mani

> >
> > Even though reverting to non-retention mode works, I think the issue might be
> > somewhere else. Like the vote might be missing to get the GDSC out of retention
> > mode.
> 
> I don't think there is a vote missing. The driver votes on MDSS_GDSC
> before enabling access to any of the registers from the MDSS region.
> 
> >
> > - Mani
> >
> > > Fixes: d399723950c4 ("clk: qcom: gdsc: Fix the handling of PWRSTS_RET support")
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/clk/qcom/mmcc-msm8974.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
> > > index aa29c79fcd55..277ef0065aae 100644
> > > --- a/drivers/clk/qcom/mmcc-msm8974.c
> > > +++ b/drivers/clk/qcom/mmcc-msm8974.c
> > > @@ -2401,7 +2401,7 @@ static struct gdsc mdss_gdsc = {
> > >       .pd = {
> > >               .name = "mdss",
> > >       },
> > > -     .pwrsts = PWRSTS_RET_ON,
> > > +     .pwrsts = PWRSTS_OFF_ON,
> > >  };
> > >
> > >  static struct gdsc camss_jpeg_gdsc = {
> > > --
> > > 2.39.2
> > >
> >
> > --
> > மணிவண்ணன் சதாசிவம்
> 
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
மணிவண்ணன் சதாசிவம்
