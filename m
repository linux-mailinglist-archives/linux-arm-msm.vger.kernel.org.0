Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77D1A3AFB0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 04:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbhFVCaK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 22:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbhFVCaJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 22:30:09 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C159C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 19:27:54 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id u11so22141161oiv.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 19:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jyUspRD+QDz3dTkk8iQ2AHNGE8vCC+sPnnlJZQaUVNU=;
        b=NahmYXEAl3imcVSMEaXGAItj5kWOjRMMtzQgzSIAfXOsNH2nEPmi6zyqLPSiZtPkmL
         gBhVHpTqsxoK9GggntJXeOPsk1N983cV43v5OAYYZKUeWlKcjrfyAguoVsAKlTdIYIWX
         kg7U0zCYbpyJZamf1j5XvWSbfSGdM8DB2zvatgUsVa59ed9lEvSRSnGnMd/TCVcWeQHm
         AjB09seVk02kV9N+w+B0q7U/Y6r3MVc7EPxsB5oOvctcZmHrhwoi0eGiDHDdNC5LmRXb
         eDnrUWjdPjPFCvWK5CgUs8Zl/Rhc+G6sGaSnDL8YBGDb2c87k3jbFrIFa2jTl/LiqJ/N
         hvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jyUspRD+QDz3dTkk8iQ2AHNGE8vCC+sPnnlJZQaUVNU=;
        b=h+jSc/CxVQS0W3md5lPwHvqk2AqUUNONj5UE/9MXbemIsBNkVFZyVYgGOjztFNCnjl
         chnFg94WAlJZ3m4fgBv6ijZ70b+a1ZFthwh8pnZga5Ugm9UAGgQ82GFd0TC3bZoYinri
         1YZeLJqQA/qG4ejIAxcVCrbtlyMwTWcz44bYOCbFfz6+/OqgcaQGFLzeCUlQw05G0Xtl
         39z0oWch2UCyojZFTjWBCjKoWt2g+jqX/sWuPQg1a2YAUruw7eLWhWhnwiUWaetHQsn4
         SR9OC1pP5szTI3Q+dRcT41N0j4lhN5osN2Sm1GiL2Qu6bfu5qa8ZAsDCWSk7elVq6WOv
         NgZg==
X-Gm-Message-State: AOAM530WqQLaZeFmMo4GsT8YjfbYDSOEUo0VwZvnHjyHRyz7PNoRbP4W
        LbfmGaMd6Fr+MLIfBGh7jskg3A==
X-Google-Smtp-Source: ABdhPJyoOtZiG1tG11RZjBU0AJ3ADLcZ61RQbIwDWPXfbOgr3HIJWltcW+02sOd2B6Wc+vfX//WlMg==
X-Received: by 2002:a05:6808:8e6:: with SMTP id d6mr1176092oic.147.1624328873562;
        Mon, 21 Jun 2021 19:27:53 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r7sm2127807ota.59.2021.06.21.19.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 19:27:52 -0700 (PDT)
Date:   Mon, 21 Jun 2021 21:27:50 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jassi Brar <jassisinghbrar@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        jamipkettunen@somainline.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V3 3/3] mailbox: qcom-apcs: Add SM6125 compatible
Message-ID: <YNFKpvhXyZbs8RE1@yoga>
References: <20210612094631.89980-1-martin.botka@somainline.org>
 <20210612094631.89980-3-martin.botka@somainline.org>
 <CABb+yY3BYYC2na8EFunEeu0XCfLXrUQon=hF3q5p=+FUoigoyw@mail.gmail.com>
 <CAL_JsqLWqtAtqLRF-MAnq80NMfD0a+CfWPv8JWjjNTJFgMjCxg@mail.gmail.com>
 <CABb+yY0sdSinTm788pMFrqEZ6QMC2OwCP7Kkto+pG9h1aGMzwQ@mail.gmail.com>
 <CAL_JsqKdoMwpL_tYC7VQRAG2AC5nR4diShMQCgDseObcgU+egQ@mail.gmail.com>
 <YNEiUMBqGAx1zLVX@yoga>
 <CABb+yY2wy4iSKjn+SihQ=FE=YwcEzUNOpGw_CV22Anzgbba8hA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABb+yY2wy4iSKjn+SihQ=FE=YwcEzUNOpGw_CV22Anzgbba8hA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 21 Jun 20:00 CDT 2021, Jassi Brar wrote:

> On Mon, Jun 21, 2021 at 6:35 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Mon 21 Jun 18:19 CDT 2021, Rob Herring wrote:
> >
> > > On Mon, Jun 21, 2021 at 5:10 PM Jassi Brar <jassisinghbrar@gmail.com> wrote:
> > > >
> > > > On Mon, Jun 21, 2021 at 2:46 PM Rob Herring <robh+dt@kernel.org> wrote:
> > > > >
> > > > > On Sun, Jun 20, 2021 at 10:03 PM Jassi Brar <jassisinghbrar@gmail.com> wrote:
> > > > > >
> > > > > > On Sat, Jun 12, 2021 at 4:46 AM Martin Botka
> > > > > > <martin.botka@somainline.org> wrote:
> > > > > > >
> > > > > > > This commit adds compatible for the SM6125 SoC
> > > > > > >
> > > > > > > Signed-off-by: Martin Botka <martin.botka@somainline.org>
> > > > > > > ---
> > > > > > > Changes in V2:
> > > > > > > None
> > > > > > > Changes in V3:
> > > > > > > Change compatible to apcs-hmss-global
> > > > > > >  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 5 +++++
> > > > > > >  1 file changed, 5 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > > > > > > index f25324d03842..f24c5ad8d658 100644
> > > > > > > --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > > > > > > +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > > > > > > @@ -57,6 +57,10 @@ static const struct qcom_apcs_ipc_data sdm660_apcs_data = {
> > > > > > >         .offset = 8, .clk_name = NULL
> > > > > > >  };
> > > > > > >
> > > > > > > +static const struct qcom_apcs_ipc_data sm6125_apcs_data = {
> > > > > > > +       .offset = 8, .clk_name = NULL
> > > > > > > +};
> > > > > > > +
> > > > > > >  static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
> > > > > > >         .offset = 12, .clk_name = NULL
> > > > > > >  };
> > > > > > > @@ -166,6 +170,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
> > > > > > >         { .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
> > > > > > >         { .compatible = "qcom,sdm660-apcs-hmss-global", .data = &sdm660_apcs_data },
> > > > > > >         { .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
> > > > > > > +       { .compatible = "qcom,sm6125-apcs-hmss-global", .data = &sm6125_apcs_data },
> > > > > > >         { .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
> > > > > > >         { .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
> > > > > > >         {}
> > > > > > >
> > > > > > These all are basically different names for the same controller.
> > > > > > The 'offset' is a configuration parameter and the 'clock', when NULL,
> > > > > > is basically some "always-on" clock.
> > > > > > I am sure we wouldn't be doing it, if the controller was third-party.
> > > > >
> > > > > If newer implementations are 'the same', then they should have a
> > > > > fallback compatible to the existing one that is the same and no driver
> > > > > change is needed. If the differences are board or instance (within an
> > > > > SoC) specific, then a DT property would be appropriate.
> > > > >
> > > > The controllers (13 now) only differ by the 'offset' where the
> > > > registers are mapped. Clock-name is a pure s/w artifact.
> > > > So, maybe we could push all these in DT.
> > >
> > > Why is 'reg' not used for the offset?
> > >
> >
> > The DT node and its "reg" describes the whole IP block.
> >
> > The particular register that we care of has, as you can see, moved
> > around during the various platforms and some incarnations of this IP
> > block provides controls for CPU-related clocks as well.
> >
> > We can certainly have the multiple compatible points to the same
> > apcs_data, but I'm not able to spot a reasonable "catch-all compatible"
> > given that I don't see any natural groupings.
> >
> Any platform that comes later may reuse the already available compatible.
> For example drop this patch and reuse "qcom,sdm660-apcs-hmss-global" ?
> 

The problem is that this would change the meaning of
"qcom,sdm660-apcs-hmss-global" from meaning "The apcs hmss global block
_in_ sdm660" to "any random apcs block with the mailbox register at
offset 8".

Using a compatible that actually describes the specific IP block allows
us to add more implementation details to the existing binding after the
fact, like we had to do in c815d769b598 ("mailbox: qcom: Create APCS
child device for clock controller")


So what we typically do between Qualcomm platforms is to come up with
some common compatible that really states the equivalent of "a generic
apcs with mailbox register at offset 8", we specify both the specific
and the generic in DT and we implement only the generic - until the day
when we need the specific.

But we need to figure out what the common descriptor is for these
various groups of apcs blocks for that to work out.

> > > In any case, we can't really get rid of the first 13 instances though...
> > >
> >
> > Right, we have the problem that we have DTBs out there that relies on
> > these compatibles, but as Jassi requests we'd have to start describing
> > the internal register layout in DT - which this binding purposefully
> > avoids.
> >
> Not these strings, but 'offset' and 'clock-name' as optional
> properties that new platforms can use.
> 

Relying on completely generic compatibles to match the driver and then
distinguish each platform using additional properties is exactly what
Qualcomm does downstream.  The community has clarified countless times
that this is not the way to write DT bindings.

That said, I certainly dislike the current situation, because bringing a
new Qualcomm platform upstream means adding a couple of drivers (clocks,
pinctl etc) and then it's a large amount of oneliners throughout the
various drivers just adding compatibles in the right palces.

Regards,
Bjorn
