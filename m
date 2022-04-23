Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E177B50C9AE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 13:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235308AbiDWLsl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Apr 2022 07:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235266AbiDWLsk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Apr 2022 07:48:40 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BD0C9D4C2
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 04:45:43 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id q3so16506022plg.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 04:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x+R6Gs65t5T2jcZWBAA8yZfSYHX0yotS1fjmH2xSc4k=;
        b=CvYtT/nGSyw2Xbs2RLcUZZOUQQFA3V6qkPCHn9xUemMzSyLzFZ/tErYJDChhiAi2RC
         o+GHIF2Cj1lA45CRBQEUvqOuqMKdxynYFB5wi5KHa0oV5JSbZQomLZHXaVor74KMgf5a
         zu65VoxqTP0lPkVDCvmDA3dkYBzy25i0V5juQo94VcjV1YpoVnjtgqFUfw0gbVapy9fL
         RvyGlYW/vHawGEZE+ikwpV+3TfO3+5JDHFMyYfYe6hHhh5yrgr7ZSzORCjDbuBmipilJ
         Ys6+feDGr5o2bmipSdsK/q+Nrm0blnIE8819EE45sqFu+OPoqJOzOo0VR51O10bOBwkW
         qsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x+R6Gs65t5T2jcZWBAA8yZfSYHX0yotS1fjmH2xSc4k=;
        b=frd2LmVeVhz+diKXHZtz7WHAZhZDrtkhl3Mc7hOsHX6X0HKh81uVKmX0rlotSvLGW2
         2WLwolUTXOMeM7Dn2ccSC93GGasJfZx8MNY+xkSXVvMO8J7V0PGXTJoWWasvwOe4aEEb
         F1CyAf2Z/TFH8seK09mV1kIp2FVXZFXcYCm4AVDM/VmG7si26ERowaBqHy3whEfbUoIC
         1DpSsOYoMzsMI93YvKqCNef488Qi/vP2D3olKb2i77RkfKLReFrfX4MpOZxlzJMwd6+d
         yReRMFN5zZWLmE9z8cVj2pBG3dfxm6n3m63NRPzWgIcQMJwRIIZaN8pbKdt7cnF0pYf3
         CHPQ==
X-Gm-Message-State: AOAM531WOkr9vPthjJPYt8SNfDlNCWV+88yNjISUwfsc9n8p33jwsw6j
        anQrR43h1mJZB0DbHTZuMNif
X-Google-Smtp-Source: ABdhPJzyqC0Hc2gI30M3mYB0Vc/KFIoeQC8TRfp+FBV2t1QAGsm4cKLvZ9h5KZjDM3pZrNtmV0CfUg==
X-Received: by 2002:a17:902:ea01:b0:15c:e746:477a with SMTP id s1-20020a170902ea0100b0015ce746477amr2409775plg.8.1650714342730;
        Sat, 23 Apr 2022 04:45:42 -0700 (PDT)
Received: from thinkpad ([117.207.28.196])
        by smtp.gmail.com with ESMTPSA id a10-20020a17090a480a00b001cd4989ff65sm8870613pjh.44.2022.04.23.04.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 04:45:41 -0700 (PDT)
Date:   Sat, 23 Apr 2022 17:15:35 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        avri.altman@wdc.com, alim.akhtar@samsung.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        quic_asutoshd@quicinc.com, quic_cang@quicinc.com,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH 3/5] scsi: ufs: qcom: Add a readl() to make sure ref_clk
 gets enabled
Message-ID: <20220423114535.GB374560@thinkpad>
References: <20220422132140.313390-1-manivannan.sadhasivam@linaro.org>
 <20220422132140.313390-4-manivannan.sadhasivam@linaro.org>
 <5ee685f5-152c-aca0-cc14-646cfae93000@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ee685f5-152c-aca0-cc14-646cfae93000@acm.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 22, 2022 at 10:03:22PM -0700, Bart Van Assche wrote:
> On 4/22/22 06:21, Manivannan Sadhasivam wrote:
> > In ufs_qcom_dev_ref_clk_ctrl(), it was noted that the ref_clk needs to be
> > stable for atleast 1us. Eventhough there is wmb() to make sure the write
>                ^              ^
> Some spaces are missing.
> 
> > gets "completed", there is no guarantee that the write actually reached
> > the UFS device. There is a good chance that the write could be stored in
> > a Write Buffer (WB). In that case, eventhough the CPU waits for 1us, the
>                                          ^
> missing space----------------------------
> 

Kind of used to it ;) Will fix it.

> > ref_clk might not be stable for that period.
> > 
> > So lets do a readl() to make sure that the previous write has reached the
> > UFS device before udelay().
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: f06fcc7155dc ("scsi: ufs-qcom: add QUniPro hardware support and power optimizations")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >   drivers/scsi/ufs/ufs-qcom.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> > index 5f0a8f646eb5..5b9986c63eed 100644
> > --- a/drivers/scsi/ufs/ufs-qcom.c
> > +++ b/drivers/scsi/ufs/ufs-qcom.c
> > @@ -690,6 +690,12 @@ static void ufs_qcom_dev_ref_clk_ctrl(struct ufs_qcom_host *host, bool enable)
> >   		/* ensure that ref_clk is enabled/disabled before we return */
> >   		wmb();
> > +		/*
> > +		 * Make sure the write to ref_clk reaches the destination and
> > +		 * not stored in a Write Buffer (WB).
> > +		 */
> > +		readl(host->dev_ref_clk_ctrl_mmio);
> > +
> >   		/*
> >   		 * If we call hibern8 exit after this, we need to make sure that
> >   		 * device ref_clk is stable for at least 1us before the hibern8
> 
> The comment above the wmb() call looks wrong to me. How about removing that
> wmb() call?
> 

Hmm, yes it could be removed as well. readl() on weakly ordered architectures
include a control dependency [1] so there is no way the instructions after it
can be speculated.

Thanks,
Mani

[1] https://www.spinics.net/lists/arm-kernel/msg689858.html

> Thanks,
> 
> Bart.
