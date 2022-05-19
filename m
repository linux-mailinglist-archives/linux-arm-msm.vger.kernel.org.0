Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF2BF52D6AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 17:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240181AbiESPBL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 11:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240374AbiESPA7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 11:00:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38599EC324
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 07:59:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BB657619FD
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 14:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1FB2C385AA;
        Thu, 19 May 2022 14:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652972391;
        bh=Ncse05AeyeG8LbKqDothTn5Q6RJ3Y9c4/QPtdIOYUdk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oFqyYHTnf2q4ri1ads7c1J71xy93MeSmivuLNOMPMfRWv8jciEZJlQ2xnxwzsmErM
         mRbkXhi1ya6KX5vj5wjirgHEvHYAqTA/h8L5Dkktp47f0BRQvUmeYWIc8KUtSGIfhM
         3Y9hmRpDVoyRoBIWh/00qcUNvwg2eAGi1gpCZwLY=
Date:   Thu, 19 May 2022 16:55:47 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     quic_hemantk@quicinc.com, slark_xiao@163.com,
        quic_jhugo@quicinc.com, Daniele.Palmas@telit.com,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev
Subject: Re: [GIT PULL] MHI changes for v5.19
Message-ID: <YoZac0UtQ3UJKYzw@kroah.com>
References: <20220510062120.GA9140@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510062120.GA9140@thinkpad>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 10, 2022 at 11:51:20AM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 5d4be19cbe6aadfad0a5f40df91bd478cedd8344:
> 
>   bus: mhi: ep: Add uevent support for module autoloading (2022-04-04 10:17:51 +0530)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v5.19

Pulled and pushed out, thanks.

greg k-h
