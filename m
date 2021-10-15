Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4C042E51B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 02:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbhJOASC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 20:18:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231315AbhJOASC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 20:18:02 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5B1C061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 17:15:56 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id 77so7080956qkh.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 17:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s7GfeS32gI4T5cRoYk29Fyp1Z52NUILY3Xlxh32Z6xs=;
        b=EZeGtuFzkH8pfPvPiQ9aZxa8E/yfOmG4ICvTAnAZeKbvawjJOAS6han9FQ2hOOXPcQ
         STHK0u/5AWk+ypYEHZa2BLpEDrWdlEselqXq7vawwTBK9Cz380aliYdgo7znLsMub4Ng
         t7I1o8INVNl1ytvtaMvaHhGfC9nKEzDTc8ONKlbJia6je4sD82sjkJYswVr3l2sWBvhL
         gRzBD7/21TROm+5b73pcrPokuNabaNTIKDvhjmirKejQQVjrUgnrjCLN3zfIuPQMJvuO
         kjBh4TwwzfuGIHJdAGaY8wDwpr9t+QhaT/67Ok9t1V0bkvYAcB/V6i0bSyaA1giiyb3C
         bmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s7GfeS32gI4T5cRoYk29Fyp1Z52NUILY3Xlxh32Z6xs=;
        b=GDNKa0rpzj7m3739Fq7HmrdUSp4qB/2UIP3lV4b71saBvtP7Dmnje8rXCh7cQrArMl
         IRcd9yDum6wyocmNSeZwsCm5Mx3nKSfZf7dHNjPfCKxWbosET1ElBfXZ1R1OLmwIowgr
         u/ok95jgSpcvp1PgYFHMtzN9q5zPxbiaIF4rSkN56b4gBKOf1yBDOUzvyZhx2PmP9aO0
         qK9t1d1Zt9dkjmKYUCna4O+dXh+wokHnZ1cCDdlIWJuQUx1On5C5oKcsHh24GidM7Nzo
         f92MTNRCl3JDIaOFeIRpChANIk6kBibIU6scNBzQGCF0mj9Hm2Gx/x1a1Drxr6Sw821p
         k8WA==
X-Gm-Message-State: AOAM531mPXbDnPh/gQk/eRbUFcWlCZBmPcZ0ENryOfykn+5Xz5Q1Q45P
        7R7dfpuqEzlb357XSfYk19ge8Era4i8ha159ec3H5g==
X-Google-Smtp-Source: ABdhPJy04v77K/HBfyt6r1eUBHzQbcFSDZXxVl24akkIgkNKxr+9V8PP31Kr16nzAYOFxrxe56KwiPOPsHmYaOhUMLM=
X-Received: by 2002:a37:4658:: with SMTP id t85mr7370061qka.195.1634256955634;
 Thu, 14 Oct 2021 17:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
 <20210829154757.784699-8-dmitry.baryshkov@linaro.org> <YV8WsQb9H7+CaLjP@ripper>
 <4614587c-b87a-4375-cb6a-6af6f5462c6b@linaro.org> <163415465484.936110.9292145029740247591@swboyd.mtv.corp.google.com>
 <070b1b25-3718-5f3a-869b-a3954fdcc7c5@linaro.org> <163425629248.1688384.14367506222343416862@swboyd.mtv.corp.google.com>
In-Reply-To: <163425629248.1688384.14367506222343416862@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 15 Oct 2021 03:15:39 +0300
Message-ID: <CAA8EJpo4SCSPMVstxO_eTGHVNCEkhguJDcfE4=6Y3YSDQ+SeOw@mail.gmail.com>
Subject: Re: [PATCH v7 7/8] clk: qcom: dispcc-sm8250: stop using mmcx regulator
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 15 Oct 2021 at 03:04, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2021-10-14 02:53:41)
> > On 13/10/2021 22:50, Stephen Boyd wrote:
> > > Quoting Dmitry Baryshkov (2021-10-07 09:16:13)
> > >> On 07/10/2021 18:48, Bjorn Andersson wrote:
> > >>> On Sun 29 Aug 08:47 PDT 2021, Dmitry Baryshkov wrote:
> > >>>
> > >>>> Now as the common qcom clock controller code has been taught about power
> > >>>> domains, stop mentioning mmcx supply as a way to power up the clock
> > >>>> controller's gdsc.
> > >>>>
> > >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >>>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > >>>
> > >>> Once we merge these, I expect that the boards will start crashing if
> > >>> the kernel is booted using an existing DTB?
> > >>>
> > >>> Is it okay to just merge the first 6 patches in the series now and
> > >>> postpone these two until we've had the dts change sitting for a while?
> > >>
> > >> Sure it is.
> > >>
> > >
> > > What's the merge strategy? It goes through arm-soc?
> >
> > I think this should go through the clk tree. There is little chance of
> > conflicts.
> >
>
> The other thing that concerns me is that we don't have backwards
> compat code. If things are going to start crashing that's not very nice.
> Is there some way to make it work with old and new DTB for one release
> so that we don't have to worry about this problem?

I have to admit that I did not check that, but without the patch 7 the
dispcc and videocc would be compatible with the old DTB. The 'supply =
"mmcx"' would ensure that it is used if it is defined.

-- 
With best wishes
Dmitry
