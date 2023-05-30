Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD5027162BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 15:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbjE3N4h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 09:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbjE3N4h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 09:56:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09F78E
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 06:56:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 654D36245A
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 13:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6AFC433EF;
        Tue, 30 May 2023 13:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685454994;
        bh=LrjXuV2Q5x/9WNlBWKzREb7TsJ7j0wzkyJ0mj9EiQbs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f7QbqjGiuZjdF2QpUQNplhRV62biQ6lm5VMpFlTQGwj4K5Ds1Xhj0IQhc/ck9IsHj
         lss0Ed7nYwkPipRPCldHxR5tAZ9DM2x8KDyWTH73m8pw8pQxn1bZFQoTyhuoMcn+pN
         h6X5nxU6p8VBpg+bvaXksZ9njq/3KwTWQAXv+S1Os+md5/ccz6NdN/lkmsDjYGDEiL
         PJcg9LpSvMkmiARTiQhMM18XXPbkg9t2F0Qm0e4z0bqMWmEOdF1OdckLLxN+x84nJF
         TEH46sMV9CBDXAVvMvfwG0OXODtpj/ZtBNpFoeHZOautJl7yiZdmy2HijdiSAYG7nY
         Trx2uX4aa1vCw==
Date:   Tue, 30 May 2023 19:26:20 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     Jeffrey Hugo <quic_jhugo@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] bus: mhi: host: allow SBL as initial EE
Message-ID: <20230530135620.GA2313@thinkpad>
References: <20230530091340.3513141-1-dnlplm@gmail.com>
 <20230530103103.GB6379@thinkpad>
 <CAGRyCJGR4YsUgWekf_DgYHJqoXNfmFpL-N_virvqE18aU=Ovkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGRyCJGR4YsUgWekf_DgYHJqoXNfmFpL-N_virvqE18aU=Ovkg@mail.gmail.com>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 30, 2023 at 01:12:59PM +0200, Daniele Palmas wrote:
> Hi Mani,
> 
> Il giorno mar 30 mag 2023 alle ore 12:31 Manivannan Sadhasivam
> <mani@kernel.org> ha scritto:
> >
> > On Tue, May 30, 2023 at 11:13:40AM +0200, Daniele Palmas wrote:
> > > There are situations in which SBL is a legitimate initial execution
> > > environment (e.g. modem stuck in SBL due to a firmware failure...), but
> > > mhi refuses to start:
> > >
> > > mhi-pci-generic 0000:01:00.0: MHI PCI device found: foxconn-sdx55
> > > mhi-pci-generic 0000:01:00.0: BAR 0: assigned
> > > mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
> > > mhi mhi0: Requested to power ON
> > > mhi mhi0: SECONDARY BOOTLOADER is not a valid EE for power on
> > > mhi-pci-generic 0000:01:00.0: failed to power up MHI controller
> > > mhi-pci-generic: probe of 0000:01:00.0 failed with error -5
> > >
> > > Fix this by adding SBL as an allowed initial execution environment.
> > >
> >
> > What can you do with the modem when firmware failure happens? If there is a
> > usecase, please explain.
> 
> (removing Siddartha and Sujeev due to addresses not working)
> 

Both left Qualcomm a while ago...

> A possible scenario for a Telit modem not being able to go to mission
> mode is when a firmware update does not work properly: in this case it
> remains stuck in SBL, but the SAHARA device can be used for retrying
> the firmware update.
> 

So IIUC, while updating SBL over SAHARA channel, the firmware update could be
corrupted and the device would get stuck in SBL EE. In that case, the SAHARA
channel exposed by PBL will still be open and that could be used to retry the
firmware update. Am I right?

Looks like PBL is doing a fail safe upgrade!

> Telit FN990 supports the SAHARA channels in pci_generic. It's true
> that there's still missing the exposed device for userspace, something
> that we are currently managing with out of tree patches, but I see
> that there's some ongoing effort for that
> https://lore.kernel.org/mhi/20230522190459.13790-1-quic_jhugo@quicinc.com/
> 
> I'm not sure if non-Telit modems have other reasonable use-cases.
> 

If my above understanding is correct, then this patch will benefit other
platforms too.

- Mani

> Regards,
> Daniele
> 
> >
> > - Mani
> >
> > > Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
> > > Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> > > ---
> > >  drivers/bus/mhi/host/internal.h | 2 +-
> > >  drivers/bus/mhi/host/pm.c       | 3 ++-
> > >  2 files changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> > > index 2e139e76de4c..3bdcd2321aa5 100644
> > > --- a/drivers/bus/mhi/host/internal.h
> > > +++ b/drivers/bus/mhi/host/internal.h
> > > @@ -56,7 +56,7 @@ extern const char * const mhi_ee_str[MHI_EE_MAX];
> > >
> > >  #define MHI_IN_PBL(ee) (ee == MHI_EE_PBL || ee == MHI_EE_PTHRU || \
> > >                       ee == MHI_EE_EDL)
> > > -#define MHI_POWER_UP_CAPABLE(ee) (MHI_IN_PBL(ee) || ee == MHI_EE_AMSS)
> > > +#define MHI_POWER_UP_CAPABLE(ee) (MHI_IN_PBL(ee) || ee == MHI_EE_AMSS || ee == MHI_EE_SBL)
> > >  #define MHI_FW_LOAD_CAPABLE(ee) (ee == MHI_EE_PBL || ee == MHI_EE_EDL)
> > >  #define MHI_IN_MISSION_MODE(ee) (ee == MHI_EE_AMSS || ee == MHI_EE_WFW || \
> > >                                ee == MHI_EE_FP)
> > > diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> > > index 083459028a4b..18872c5017be 100644
> > > --- a/drivers/bus/mhi/host/pm.c
> > > +++ b/drivers/bus/mhi/host/pm.c
> > > @@ -1203,10 +1203,11 @@ int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
> > >
> > >       wait_event_timeout(mhi_cntrl->state_event,
> > >                          MHI_IN_MISSION_MODE(mhi_cntrl->ee) ||
> > > +                        mhi_cntrl->ee == MHI_EE_SBL ||
> > >                          MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
> > >                          msecs_to_jiffies(mhi_cntrl->timeout_ms));
> > >
> > > -     ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -ETIMEDOUT;
> > > +     ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee) || mhi_cntrl->ee == MHI_EE_SBL) ? 0 : -ETIMEDOUT;
> > >       if (ret)
> > >               mhi_power_down(mhi_cntrl, false);
> > >
> > > --
> > > 2.37.1
> > >
> >
> > --
> > மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்
