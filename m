Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD8202556B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Aug 2020 10:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728706AbgH1Ioj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 04:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728708AbgH1IoV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 04:44:21 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCED7C061234
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2020 01:44:21 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id v20so145447ual.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2020 01:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uTWUI5230ITwP2yP66ukJ+wNHyXX/sqNoITAtXVuFps=;
        b=rL15LOzCdw6xdKRCWQazp27CLIKDRF/eM575VOML6XSrlwujYfvPyV6ZMwSTNFGTfh
         Qpu3kZC+zFXQc4Whiw7JUr8liH2f/OoYv09CShh+CTJ5h2dGykBurLwF78MFoVXR6yeF
         T7xZ/LQaxVsDNgatt2q5xb9u5YecVoHTiCi39TdNtztkzpxEmaAYdbBzrdRrwfO2E/hb
         t0kn0QS02+/hRdKWze5VgjUdHqtvxAFwdrY5fSV8njnzbNX0Ynr0JGOzoyFuHCetJ8RT
         o2CnKaWNcV+3FC1snIr4weAmUJNZv1pBtczTVxnWfMVeBrfuzGV0aFWACzwXUg+rOvCA
         DuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uTWUI5230ITwP2yP66ukJ+wNHyXX/sqNoITAtXVuFps=;
        b=YED7WukoWlqBo3+Elq3djVfxsmslc5Rj8lfwidOlPDiNHhvcAbog8fZF0lmyXmJNrl
         eE8xFzHLi3YhY2SfioTdj81v8QsBcUrUwL/+0JSadExHGzKPuz/Hhcl2wBYeLfV0vigQ
         F06W//VX7M8ZEOY5Y6L6kvpH4yi+HTB0v9ceoWgBnELgKkv+wHce5VB1j9OfUCaH9Gio
         RstMeDgcbSp7rtpGeA2DwJAIvupJAPvXUx9dBKata8obPnS+y83qcJpSvfsVXhLMcLPI
         fEbms+yRbq1fxHbBbKqygRZwh5UkicHj/jhijUIaHNafdUqbfnKVmogvZ9AuWWNWCMdI
         oC5g==
X-Gm-Message-State: AOAM5327cnwP8XBOE48ks/aL2RTiITrasZDqkkv8FN0qnwKAZJmL1y7l
        HBe+og97mrg/AvLeIHwzV9aGN4cesBxaSLpX+4BJ+Q==
X-Google-Smtp-Source: ABdhPJxhkzPvcP1szr4uYROolGFNyCKo7d2OSli8XptERldHHbNbbnIX/77d3DD7+J1vhaw5c7yvGuz/6wyAIsvU17o=
X-Received: by 2002:a9f:2190:: with SMTP id 16mr283460uac.19.1598604260956;
 Fri, 28 Aug 2020 01:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200827083330.1.I669bb4dc3d92bd04e9a695f97904797dc8241b79@changeid>
 <20200828050935.m32njmxdrgbudw4r@vireshk-i7>
In-Reply-To: <20200828050935.m32njmxdrgbudw4r@vireshk-i7>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 28 Aug 2020 10:43:44 +0200
Message-ID: <CAPDyKFpt+8GF9K1evMJwPQ-hwsSOiC2GQkNTFER2axw5AF+fHg@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-msm: When dev_pm_opp_of_add_table() returns 0
 it's not an error
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 28 Aug 2020 at 07:09, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 27-08-20, 08:33, Douglas Anderson wrote:
> > The commit d05a7238fe1c ("mmc: sdhci-msm: Unconditionally call
> > dev_pm_opp_of_remove_table()") works fine in the case where there is
> > no OPP table.  However, if there is an OPP table then
> > dev_pm_opp_of_add_table() will return 0.  Since 0 != -ENODEV then the
> > "if (ret != -ENODEV)" will evaluate to true and we'll fall into the
> > error case.  Oops.
> >
> > Let's fix this.
> >
> > Fixes: d05a7238fe1c ("mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  drivers/mmc/host/sdhci-msm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> > index b7e47107a31a..55101dba42bd 100644
> > --- a/drivers/mmc/host/sdhci-msm.c
> > +++ b/drivers/mmc/host/sdhci-msm.c
> > @@ -2284,7 +2284,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
> >
> >       /* OPP table is optional */
> >       ret = dev_pm_opp_of_add_table(&pdev->dev);
> > -     if (ret != -ENODEV) {
> > +     if (ret && ret != -ENODEV) {
> >               dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
> >               goto opp_cleanup;
> >       }
>
> Wow!
>
> How many bugs did I introduce with a simple patch :(
>
> @Ulf, since this is material for 5.10 I was planning to resend the
> original patch itself with all the things fixed. Will you be able to
> rebase your tree? Or do you want to apply fixes separately ?

I have rebased my tree, to get rid of the problems completely.

Thanks everybody for helping out!

Kind regards
Uffe
