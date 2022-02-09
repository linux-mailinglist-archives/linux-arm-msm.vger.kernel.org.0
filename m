Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4AD74AE975
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 06:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbiBIFrO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 00:47:14 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:37462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233088AbiBIFnu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 00:43:50 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE2E7C033254;
        Tue,  8 Feb 2022 21:43:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 89D1760C1B;
        Wed,  9 Feb 2022 05:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74924C340E7;
        Wed,  9 Feb 2022 05:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644385433;
        bh=dAyr0RqvI61vgrjOBWTU0hTcjeBhpnEtaYRjd2yj1eg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fVb69s+rb/eG5n1PGT97doTnmU/HU45TOxcXaS3JBeOgbUDHuO1ZW34wBTwXGd0F9
         BUpLW5yKHPQNZM2/0LHQm9Wv1KtvASe/Q++oeJg6HUPNk7kBodw4cvwUrTnlghQAVD
         YQP9KULg/8hUqFlrSho1bOVTUF2z3Ri6k7Rb6npp9cla1suubqSyCk1v52Skl/bpsx
         rtd8dO6YtxXlCn8GRFU+j0rjcF4H9BGxRkKu/qRyUhjcFWc/XZFpZOr4NvNMAI+6Lk
         JvUOIxjBO4q6O7IRCp8hmSE/hEv88wO0QAG55l4yUo00W3aD3dhDX7emCvzcWMoPV7
         t6aYgYNTIWtMg==
Date:   Wed, 9 Feb 2022 11:13:49 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [RFD]: Solving qcom unique unit address warnings
Message-ID: <YgNUlVjoXaNYyTM3@matsya>
References: <YerolYU7Ih3GW/zP@matsya>
 <YgLNJPpyVgFYuB45@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgLNJPpyVgFYuB45@robh.at.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08-02-22, 14:05, Rob Herring wrote:
> On Fri, Jan 21, 2022 at 10:38:37PM +0530, Vinod Koul wrote:
> > 
> > 
> > The problem comes with all these nodes having same unit addresses. This
> > is adding to ~2K warning for unique_unit_address upstream.
> 
> This is with W=1, right? 

Yes

>  
> > So to solve this we thought of creating a qup se node and then query the
> > protocol supported from the firmware on boot and create a child
> > auxillary_device. The problem with that approach is another warning
> > "node name for SPI buses should be 'spi'"! So that would not help
> > 
> > Now, I cant think of any better idea here, except maybe move these to
> > respective board dts and perhaps keep them commented here for
> > documentation.
> > 
> > Do we have any better idea to solve this problem?
> 
> There is another dtc warning option called 
> unique_unit_address_if_enabled which we could enable under W=1 instead 
> of unique_unit_address. Even that option has too many warnings to enable 
> by default.

Bjorn pointed me to your proposal https://www.irccloud.com/pastebin/OnYqVn6p/

with this change I do get a better stats for warnings which we can focus
on reducing :)

Before:
   6483 unique_unit_address\n\
   1108 simple_bus_reg\n\
    764 avoid_unnecessary_addr_size\n\
    712 unit_address_vs_reg\n\
    120 graph_child_address\n\
     32 unique_unit_address_if_enabled

After:
    277 simple_bus_reg\n\
    191 avoid_unnecessary_addr_size\n\
    178 unit_address_vs_reg\n\
     32 unique_unit_address_if_enabled\n\
     30 graph_child_address

So, it would be helpful for now to merge this.

Thanks
-- 
~Vinod
