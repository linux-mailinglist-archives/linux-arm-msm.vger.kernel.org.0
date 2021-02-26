Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 373A032613C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 11:29:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhBZK2d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 05:28:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbhBZK2c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 05:28:32 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A95CC06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 02:27:51 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id n28so7049946qkk.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 02:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EWmVri0BM3myDebXpAYp1ijRGyFo55U7ydM4E7mFJ0k=;
        b=v2Kwb2WwD+YvoHeRLIMfC61dwixKOIAXBU3uJMFwGbkLZh2iexFKtm/t8NmEsxPbJc
         iurCNVQD6G1zbNTaFvlp90CSpZDjIYLQhSHV0Rv2FTpwfrtNkozRy/k+Xr/Siblmpdhe
         tSh1ZDNNoYuqQsRJT90VSACZMq+pYe0ls2URPeNXTT8lhpKGDk8O4KPjkp6R5AgGuhol
         3H5IdOeR4iCT/3UdwoBe++geiFY0KEWUgjYN9g9+L/OcycIr1VSoUgyj9YqesEyBpPNh
         jz4tNvooSHXCbTI/YpWP/ekPymTNibhAo5V5Vj9Jn6OcdaU220c+4xoahLU02kYT8PuL
         LLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EWmVri0BM3myDebXpAYp1ijRGyFo55U7ydM4E7mFJ0k=;
        b=s/+GTtQ9KG3Sgm3UYzhZbEwUps1+wSr36zUnX9yWPtuEUtVWWpjaWPApXFeNQQMLkO
         gsI+JRR4udR1n1s+uufbz5h8xWC0ncFkqAA+IBctuuJTWObK9zwfQnysSA6NWsnB+/ck
         Jl/uOFIZif5E3nPOkoYxfiaCOD54OJ6+2PlBM7LFv2IdaL6kDWHfTInxEh1liTISknA9
         9u3K0SPQSwqNBi1d97de6UyGPn0ViSUD+B3bdv2m+kGZpOD4E81VINupfbRUjWEPNSxZ
         WwaY9fLEzBkCW1aDOvzqR20Bo7xvhAmidttRUeN+rDKGWJEUcDUMsNBuhvADtIGJySDe
         Enag==
X-Gm-Message-State: AOAM5315tScg5uPo9yBeiVUCs708+kc8dXTUV4deoScz0t64rHAvVEiu
        eS97zYiorBVjpQirq5xShWHxf41xLlCZLsQMlZml7w==
X-Google-Smtp-Source: ABdhPJyqx3pcqRAE5id8tr4/lTFNSI+nbFJme9UuHtmhVpblH2cb18Cof5PG89cVumYEavdFtBXQ5PvA/XB5qshSZ/4=
X-Received: by 2002:a37:8cd:: with SMTP id 196mr1786072qki.434.1614335270436;
 Fri, 26 Feb 2021 02:27:50 -0800 (PST)
MIME-Version: 1.0
References: <1614155592-14060-1-git-send-email-skakit@codeaurora.org>
 <1614155592-14060-4-git-send-email-skakit@codeaurora.org> <50151f4b-298c-f0ee-a88f-7bdd945ad249@linaro.org>
 <51390b828a5d534e308460098f1b9af0@codeaurora.org>
In-Reply-To: <51390b828a5d534e308460098f1b9af0@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 26 Feb 2021 13:27:39 +0300
Message-ID: <CAA8EJpqN-jb3b3yHTHwrQQj_h3M-yxAvX7Hz7bNSV3_NBCJEwQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] regulator: qcom-rpmh: Correct the pmic5_hfsmps515 buck
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, kgunda@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 26 Feb 2021 at 09:59, <skakit@codeaurora.org> wrote:
>
> Hi,
>
> On 2021-02-25 16:39, Dmitry Baryshkov wrote:
> > On 24/02/2021 11:33, satya priya wrote:
> >> Correct the REGULATOR_LINEAR_RANGE and n_voltges for
> >> pmic5_hfsmps515 buck.
> >>
> >> Signed-off-by: satya priya <skakit@codeaurora.org>
> >> ---
> >>   drivers/regulator/qcom-rpmh-regulator.c | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/regulator/qcom-rpmh-regulator.c
> >> b/drivers/regulator/qcom-rpmh-regulator.c
> >> index 79a554f..36542c3 100644
> >> --- a/drivers/regulator/qcom-rpmh-regulator.c
> >> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> >> @@ -726,8 +726,8 @@ static const struct rpmh_vreg_hw_data
> >> pmic5_ftsmps510 = {
> >>   static const struct rpmh_vreg_hw_data pmic5_hfsmps515 = {
> >>      .regulator_type = VRM,
> >>      .ops = &rpmh_regulator_vrm_ops,
> >> -    .voltage_range = REGULATOR_LINEAR_RANGE(2800000, 0, 4, 16000),
> >> -    .n_voltages = 5,
> >> +    .voltage_range = REGULATOR_LINEAR_RANGE(320000, 0, 235, 16000),
> >> +    .n_voltages = 236,
> >
> > I've checked the docs for pm8009, the chip which also uses hfsmps515
> > regulators. The pdf clearly states that the 'Output voltage operating
> > range' is from 2.8 V to 2.85 V.
> >
> > So we'd probably need to define different versions of HFS515 regulator
> > data (like I had to create for pm8009-1).
> >
> >
>
> The min-max voltages for S1C (PM8350c) regulator are 2190000-2210000uV
> for sc7280(kodiak), so we had to modify this buck to support this
> regulator.
>
> AFAIK, this struct defines the HW constraints of a regulator, but the
> platform specific min-max values can be controlled from DT files. So,
> can't we modify it like above instead of adding a new definition? the
> new min_uV value (32000) is anyway not exceeding the old value (2800000)
> right? please correct me if wrong.

As far as I understand for other regulators we put 'output voltage
limitations' from the docs into the regulator definition and further
constrain it by the platform device tree. Please correct me if I'm
wrong.
For pm8009 the data from the datasheet matches the regulators defined
in the source file. Unfortunately I don't have kodiak specs at hand.


-- 
With best wishes
Dmitry
