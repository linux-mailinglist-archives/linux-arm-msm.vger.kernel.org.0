Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9338C8279B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2019 00:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730147AbfHEW17 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Aug 2019 18:27:59 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33893 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729999AbfHEW17 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Aug 2019 18:27:59 -0400
Received: by mail-pg1-f193.google.com with SMTP id n9so34224232pgc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Aug 2019 15:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O7ol3Af3UOOFqacwpXB2Tkvb5T9+UO25EUzpB5YdSYk=;
        b=yj6hr5hxUJenkSZp1UcIBWxZj3uBMngG0g469BpTJOQyhnZXP4os/nIQjFlCi4nBfz
         BmQi7zHWfdgEQcyU2IoxT1TtoUQy2VEGrifPAPymP6nVJlvoowBiSMDNU7tTuW6U7P8t
         Ljvd48h3GMeSX4XMq5QvRDtvsfFM/s6fi0+inxDc3s3tIqKrvRJjMvyvd4EsQGLmg7AK
         XKyd/PMO6i5wrhTRy+5/w6cd1LHKXcDpudtK7EZcxJVVB+f99JoaDzQGznpXdjko0hPs
         4laB2/NlGZv487hyR6Iowl6ajy1SQiMhXKZKnNC6dqkySQWzX97V2x8QfcqVFF/FQD2f
         6+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O7ol3Af3UOOFqacwpXB2Tkvb5T9+UO25EUzpB5YdSYk=;
        b=KR+1pF1VKqaPrysx1Tb7YiNtxf4G+i6SXfsEzMXMOvYU683Vktbg3cXRKk0CRowHax
         aHAWsOCDxLsiNWQTzbukUz6JGUkLvar4Mjx2EO8D/rd16ugYYFTn6ixxSYH2A6qW5q3M
         i1C4aQQjwClZpbsvpoqYHfXutUEDNm/05v+3rdWJk3DsAZComfMSqQq5rPEpaUGvH24D
         bqaO86VpXw9+FcFtoEuNA1sq7vI57a+VDNS9BlKpfvC8VUntArss4pK4eMmEth0QFKyY
         mLzQjSKY9a2admSPTyLezdzgq4XiY71hIDDF2Gb08T6/cF/MU3ddGU39BlSf5Nmj7Sbt
         3ILg==
X-Gm-Message-State: APjAAAXsnfVxjePaWuRbmp88PZwGZQtdRFzSjCv12gfR1PLQznYjQG7m
        XtBmZDR3Q55udqc2W58xayIFRQ==
X-Google-Smtp-Source: APXvYqx3UxedQNr2C3bs2uHAldkFth/HQlaWKyEV0qOeCU3fPsEGSvQLw45fJ8MdFeTtVbj3iog84A==
X-Received: by 2002:a17:90a:2767:: with SMTP id o94mr9103pje.25.1565044078659;
        Mon, 05 Aug 2019 15:27:58 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a12sm20255316pje.3.2019.08.05.15.27.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 15:27:58 -0700 (PDT)
Date:   Mon, 5 Aug 2019 15:27:55 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vivek Gautam <vivek.gautam@codeaurora.org>
Cc:     Will Deacon <will.deacon@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        robh+dt <robh+dt@kernel.org>,
        David Brown <david.brown@linaro.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Andy Gross <agross@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 1/4] firmware: qcom_scm-64: Add atomic version of
 qcom_scm_call
Message-ID: <20190805222755.GB2634@builder>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
 <20190612071554.13573-2-vivek.gautam@codeaurora.org>
 <20190618175536.GI4270@fuggles.cambridge.arm.com>
 <CAFp+6iEwN6jeEGNxKVU5_i5NxdEbuF2ZggegEJZ1Rq6F=H34jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFp+6iEwN6jeEGNxKVU5_i5NxdEbuF2ZggegEJZ1Rq6F=H34jg@mail.gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 19 Jun 04:34 PDT 2019, Vivek Gautam wrote:

> On Tue, Jun 18, 2019 at 11:25 PM Will Deacon <will.deacon@arm.com> wrote:
> >
> > On Wed, Jun 12, 2019 at 12:45:51PM +0530, Vivek Gautam wrote:
> > > There are scnenarios where drivers are required to make a
> > > scm call in atomic context, such as in one of the qcom's
> > > arm-smmu-500 errata [1].
> > >
> > > [1] ("https://source.codeaurora.org/quic/la/kernel/msm-4.9/commit/
> > >       drivers/iommu/arm-smmu.c?h=CogSystems-msm-49/
> > >       msm-4.9&id=da765c6c75266b38191b38ef086274943f353ea7")
> > >
> > > Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> > > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >  drivers/firmware/qcom_scm-64.c | 136 ++++++++++++++++++++++++++++-------------
> > >  1 file changed, 92 insertions(+), 44 deletions(-)
> > >
> > > diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
> > > index 91d5ad7cf58b..b6dca32c5ac4 100644
> > > --- a/drivers/firmware/qcom_scm-64.c
> > > +++ b/drivers/firmware/qcom_scm-64.c
> 
> [snip]
> 
> > > +
> > > +static void qcom_scm_call_do(const struct qcom_scm_desc *desc,
> > > +                          struct arm_smccc_res *res, u32 fn_id,
> > > +                          u64 x5, bool atomic)
> > > +{
> >
> > Maybe pass in the call type (ARM_SMCCC_FAST_CALL vs ARM_SMCCC_STD_CALL)
> > instead of "bool atomic"? Would certainly make the callsites easier to
> > understand.
> 
> Sure, will do that.
> 
> >
> > > +     int retry_count = 0;
> > > +
> > > +     if (!atomic) {
> > > +             do {
> > > +                     mutex_lock(&qcom_scm_lock);
> > > +
> > > +                     __qcom_scm_call_do(desc, res, fn_id, x5,
> > > +                                        ARM_SMCCC_STD_CALL);
> > > +
> > > +                     mutex_unlock(&qcom_scm_lock);
> > > +
> > > +                     if (res->a0 == QCOM_SCM_V2_EBUSY) {
> > > +                             if (retry_count++ > QCOM_SCM_EBUSY_MAX_RETRY)
> > > +                                     break;
> > > +                             msleep(QCOM_SCM_EBUSY_WAIT_MS);
> > > +                     }
> > > +             }  while (res->a0 == QCOM_SCM_V2_EBUSY);
> > > +     } else {
> > > +             __qcom_scm_call_do(desc, res, fn_id, x5, ARM_SMCCC_FAST_CALL);
> > > +     }
> >
> > Is it safe to make concurrent FAST calls?
> 
> I better add a spinlock here.
> 

Hi Vivek,

Would you be able to respin this patch, so that we could unblock the
introduction of the display nodes in the various device?

Regards,
Bjorn
