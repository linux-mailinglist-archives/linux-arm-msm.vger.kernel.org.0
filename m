Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBF736224D0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Nov 2022 08:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbiKIHpL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Nov 2022 02:45:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiKIHpK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Nov 2022 02:45:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A73C186FE
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 23:45:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BF29EB81CEC
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Nov 2022 07:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A450C433D6;
        Wed,  9 Nov 2022 07:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667979907;
        bh=bKZfzoTQZOxjXRJ5wvO5FvUQuWJtV6CrGATUo+dw2JM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t2I32leLnRPuEufxCgUkn7fiFuNZrs+pC32WvQPHl6fNb4+UloTrRnr/x1v2TerJU
         cwqbi0I0dPq2OtS8vMuHFiGeO/lUaE5djlGUTMg3bCIwsYWq7MUYY29myXkiVFDgmr
         SvbxuRRug8ta+oetWya1qXxvdeHAYY8gf7ItQGxGDcIFmyRjgyrs0QL1PkXF9J/mW/
         qypAHYWuZrxmo2BZNkUJMPjEpjMoAVa8kMVIC+xolZl2JzHAKwxjmRnCCUrA+urrR2
         HkSBYrm6KdHpi+yYJ2/OjWRF81VDst0/reqslbS8Ny3trVa5n3P5qvCNucqlbb171K
         GbSiOCyFO7h+Q==
Date:   Wed, 9 Nov 2022 13:15:00 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Kalle Valo <kvalo@kernel.org>
Cc:     Jeff Johnson <quic_jjohnson@quicinc.com>,
        Hemant Kumar <quic_hemantk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev
Subject: Re: [PATCH v5] bus: mhi: host: make mhi_controller_config::event_cfg
 const
Message-ID: <20221109074500.GB4651@thinkpad>
References: <20220829205112.12036-1-quic_jjohnson@quicinc.com>
 <20220830171147.24338-1-quic_jjohnson@quicinc.com>
 <20220907080016.GA22505@workstation>
 <87fsettvtc.fsf@kernel.org>
 <20221108143902.GA88842@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221108143902.GA88842@thinkpad>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 08, 2022 at 08:09:02PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Nov 08, 2022 at 03:33:35PM +0200, Kalle Valo wrote:
> > Manivannan Sadhasivam <mani@kernel.org> writes:
> > 
> > > On Tue, Aug 30, 2022 at 10:11:47AM -0700, Jeff Johnson wrote:
> > >> Currently the event_cfg pointer in struct mhi_controller_config is not
> > >> defined as a const pointer. This prevents clients from registering a
> > >> read-only configuration unless they use a typecast. Since the
> > >> event_cfg should not be modified once registered, add the const
> > >> qualifier to event_cfg. This is aligned with the definition of ch_cfg.
> > >> 
> > >> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> > >
> > > Applied to mhi-next!
> > 
> > BTW what happened to this patch? I cannot find it anywhere.
> > 
> 
> Sorry! I did apply this patch earlier locally but didn't push it to
> remote. So it got lost.
> 
> Now pushed! Thanks for spotting.
> 

Dropped the patch now because of this: https://lore.kernel.org/lkml/20221109151637.67be60f8@canb.auug.org.au/

Since we need to modify event_cfg for using the shared IRQ, I don't think the
patch is applicable. Maybe that's the reason I dropped it earlier also, but
forgot to share it in mailing list.

Thanks,
Mani

> > -- 
> > https://patchwork.kernel.org/project/linux-wireless/list/
> > 
> > https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்
> 

-- 
மணிவண்ணன் சதாசிவம்
