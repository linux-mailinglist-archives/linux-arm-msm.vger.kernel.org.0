Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38730860E9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 13:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732249AbfHHLfh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 07:35:37 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57542 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731955AbfHHLfh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 07:35:37 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A99A460452; Thu,  8 Aug 2019 11:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565264135;
        bh=sH6nUxZ8Y5dNhEx5LOsnBwv7hqu3JssLmT67GtkYFO8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mqb7vvjzx+MKfzAMS8jEz1fTkI4H9bPpTOCk+imcRQkezG9Yp2E+E45/nhpmGZQei
         pBirMUA6XrO/Ht5xpyR9XJ/KaYs42L/b1ivVHV1CgYRhHdhPeAC+V5PPpEvsbpjWwX
         srYIPa2q0ySeKGkshNuudBF2AsrzdJ65bO0R/VZQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4245860452;
        Thu,  8 Aug 2019 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565264134;
        bh=sH6nUxZ8Y5dNhEx5LOsnBwv7hqu3JssLmT67GtkYFO8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZbrI0B4S6yZ9W8DkXTkRKrtxZxIGwqY+/MXPYB0o2rmzwggw0xkXrqFe8/EQqk3qx
         CEiE0e7ulfOwRuC4cCZk5zRsj+IjxTMkazmUE1W++Hhtf2TrNtbW8Zj1X5IqmRAqkF
         eR+XXmlBx8cVE9RFQgP2+XxaVevY5NI/aexva7a0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4245860452
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f52.google.com with SMTP id h8so2240926edv.7;
        Thu, 08 Aug 2019 04:35:34 -0700 (PDT)
X-Gm-Message-State: APjAAAW0rTAydE88HFcRZLbHuomed2Ggdt2b3nNhv4mbikfrfxNigiiU
        klWl1Gu5kYD/Tn6GArSHL6Y+w3a70MHu75A0ENk=
X-Google-Smtp-Source: APXvYqzXmB+VRV0h6DczJ86/gi4VfVSVgaDq6lvQZ78xCiCfDaAmWfeWWRuyx/bhq49Zbz7Hw0FKWVka+rpz4IhZsdg=
X-Received: by 2002:a17:906:7013:: with SMTP id n19mr12879575ejj.65.1565264132964;
 Thu, 08 Aug 2019 04:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
 <20190612071554.13573-2-vivek.gautam@codeaurora.org> <20190618175536.GI4270@fuggles.cambridge.arm.com>
 <CAFp+6iEwN6jeEGNxKVU5_i5NxdEbuF2ZggegEJZ1Rq6F=H34jg@mail.gmail.com> <20190805222755.GB2634@builder>
In-Reply-To: <20190805222755.GB2634@builder>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Thu, 8 Aug 2019 17:05:21 +0530
X-Gmail-Original-Message-ID: <CAFp+6iHhh9749dAV4YDeE_0w1nCiftecTBedW4Rf0aiaOJsN2A@mail.gmail.com>
Message-ID: <CAFp+6iHhh9749dAV4YDeE_0w1nCiftecTBedW4Rf0aiaOJsN2A@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] firmware: qcom_scm-64: Add atomic version of qcom_scm_call
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        open list <linux-kernel@vger.kernel.org>,
        David Brown <david.brown@linaro.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "robh+dt" <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 6, 2019 at 3:58 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 19 Jun 04:34 PDT 2019, Vivek Gautam wrote:
>
> > On Tue, Jun 18, 2019 at 11:25 PM Will Deacon <will.deacon@arm.com> wrote:
> > >
> > > On Wed, Jun 12, 2019 at 12:45:51PM +0530, Vivek Gautam wrote:
> > > > There are scnenarios where drivers are required to make a
> > > > scm call in atomic context, such as in one of the qcom's
> > > > arm-smmu-500 errata [1].
> > > >
> > > > [1] ("https://source.codeaurora.org/quic/la/kernel/msm-4.9/commit/
> > > >       drivers/iommu/arm-smmu.c?h=CogSystems-msm-49/
> > > >       msm-4.9&id=da765c6c75266b38191b38ef086274943f353ea7")
> > > >
> > > > Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> > > > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > ---
> > > >  drivers/firmware/qcom_scm-64.c | 136 ++++++++++++++++++++++++++++-------------
> > > >  1 file changed, 92 insertions(+), 44 deletions(-)
> > > >
> > > > diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
> > > > index 91d5ad7cf58b..b6dca32c5ac4 100644
> > > > --- a/drivers/firmware/qcom_scm-64.c
> > > > +++ b/drivers/firmware/qcom_scm-64.c
> >
> > [snip]
> >
> > > > +
> > > > +static void qcom_scm_call_do(const struct qcom_scm_desc *desc,
> > > > +                          struct arm_smccc_res *res, u32 fn_id,
> > > > +                          u64 x5, bool atomic)
> > > > +{
> > >
> > > Maybe pass in the call type (ARM_SMCCC_FAST_CALL vs ARM_SMCCC_STD_CALL)
> > > instead of "bool atomic"? Would certainly make the callsites easier to
> > > understand.
> >
> > Sure, will do that.
> >
> > >
> > > > +     int retry_count = 0;
> > > > +
> > > > +     if (!atomic) {
> > > > +             do {
> > > > +                     mutex_lock(&qcom_scm_lock);
> > > > +
> > > > +                     __qcom_scm_call_do(desc, res, fn_id, x5,
> > > > +                                        ARM_SMCCC_STD_CALL);
> > > > +
> > > > +                     mutex_unlock(&qcom_scm_lock);
> > > > +
> > > > +                     if (res->a0 == QCOM_SCM_V2_EBUSY) {
> > > > +                             if (retry_count++ > QCOM_SCM_EBUSY_MAX_RETRY)
> > > > +                                     break;
> > > > +                             msleep(QCOM_SCM_EBUSY_WAIT_MS);
> > > > +                     }
> > > > +             }  while (res->a0 == QCOM_SCM_V2_EBUSY);
> > > > +     } else {
> > > > +             __qcom_scm_call_do(desc, res, fn_id, x5, ARM_SMCCC_FAST_CALL);
> > > > +     }
> > >
> > > Is it safe to make concurrent FAST calls?
> >
> > I better add a spinlock here.
> >
>
> Hi Vivek,
>
> Would you be able to respin this patch, so that we could unblock the
> introduction of the display nodes in the various device?

Will pointed [1] to the restructuring of arm-smmu to support
implementation specific details.
That hasn't been posted yet, and I haven't yet been able to work on that either.
I will be happy to respin this series with the comments addressed if
Will is okay to pull changes to unblock sdm845 devices. :)

[1] https://lore.kernel.org/patchwork/patch/1087457/

Thanks & Regards
Vivek

>
> Regards,
> Bjorn
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu



-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
