Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0E07E19D0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 06:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbjKFF4z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 00:56:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbjKFF4x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 00:56:53 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A18BD6F
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Nov 2023 21:56:51 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EDF4C433C8;
        Mon,  6 Nov 2023 05:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699250210;
        bh=iQ8rLc2OhgNXSJULSr40kFTVSenEwezrcQ5xAm1ghiM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pzuf0q66fmANs8oRPEq0TATr2K8GV5S2G9hAs5rUeUUyb0IsLZ5NZegrZFx4GaeSN
         etNSA2o8BQTsFeXfJNCRLUzgYASkMyjzbWSpxsGiRWpMzhUzAkXWCf+Hp8GTilIrAm
         TtsLp5c0OPbBOUCg+HG6xoNDucS5AdVGLA1RqtwoGvMW0MERnhYo2drMhgkgr8gLhq
         NP0v45b9BgT6pULyNyLMVoIlTHrlposHxGtj81+ZuVvhapqGKR1Sjv5uGdckOKi2jM
         XjvUOfwJgqXmCmFhmidRqqcZYNSt6ZfCk4xDox5fUk+B/2qYkqWUS5gYGMve+SLT5L
         PQgmMFRrxpuxA==
Date:   Mon, 6 Nov 2023 11:26:45 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Tyler Stachecki <stachecki.tyler@gmail.com>
Cc:     mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add support for Sierra
 Wireless EM9291
Message-ID: <20231106055645.GF2474@thinkpad>
References: <20231105150510.96136-1-stachecki.tyler@gmail.com>
 <ZUewrgy0acOUkSAk@luigi.stachecki.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZUewrgy0acOUkSAk@luigi.stachecki.net>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Nov 05, 2023 at 10:11:42AM -0500, Tyler Stachecki wrote:
> On Sun, Nov 05, 2023 at 10:05:10AM -0500, Tyler J. Stachecki wrote:
> > Add support for the Sierra Wireless EM9291 modem.
> > Empirically, it seems to use the same configuration as
> > EM9191.
> > 
> > $ lspci -vv
> > 03:00.0 Unassigned class [ff00]: Qualcomm Device 0308
> >         Subsystem: Device 18d7:0301
> > 
> >
> 
> Hi Mani,
> 
> I just want to highlight "empirically" here. I do not have
> access to the IP which confirms proper MHI configuration
> here. Given that, not sure it is appropriate for submission
> to the kernel.
> 
> However, without these changes, AT is not exposed and QMI
> submissions time out -- so better than nothing...?
> 

Yes, and that's how some other modem support is added as well. So it is totally
fine.

Thanks for the patch!

- Mani

> Regards,
> Tyler
> 

-- 
மணிவண்ணன் சதாசிவம்
