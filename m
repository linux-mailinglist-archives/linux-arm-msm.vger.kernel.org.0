Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84FAE1DD1E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 17:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729778AbgEUPcQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 11:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729598AbgEUPcP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 11:32:15 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87049C061A0E
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 08:32:15 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id y18so3474466pfl.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 08:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+L6yMgj6SF412wxBrlIvpshzc4kgoWA+VMhfhRUlVRs=;
        b=p/q6amQYHbeWvUMuWV8BWlNvYitmVYExKiYUbdqWdS/RIHPFjC0D7KSnjAQ3Vsiuot
         pAo9OHxUXoiEjwGn/Qa8YsiYl8QbK4R0jl4q6MN00xn4PPsooPgrFs/DIkxaiKR6Oaw+
         QggFTCvHrCfhpzbed8BBeB0vy3Ewtvau7CeGec4qF13qB3K3WeSx7Jiw+JjKQM1ArCdj
         j2Tdw7TPFVfOTcriqkuIc5Hvcb+6qQuog8h2umBG3WsexWEpEvdF887dDCmn7ecCbj8U
         pN/RPtImXVEQCrGRYkXUrMp4y2HH5AWxGyH86aa6kKS/+bu0uD2JkZfdttVNu6gk0Ako
         CFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+L6yMgj6SF412wxBrlIvpshzc4kgoWA+VMhfhRUlVRs=;
        b=f8+RPuwHA97/UJnPzPygQ7uEhXk856BHE97uasLw5Tw8PLS6Z50RXGpmsP6OzeS1Ed
         PbZ6CsCtBPkAd5Eoup/Xv7y9Wwwlh3FjKAwlN33fUUTCmnfRWWz3U3NVgRPFfIALMM8Y
         LGhYszwyI4RQaL9vegIWA38AGDH+Z2rXRY3L8iJYcHRQWVyGnAyq1LE0NNcIhMMVXmeh
         OL/ccYRNDbf/e9WNX+uNLvUCEmNUiCztGUC4QI3FoddA060OzIlQysRWizLaQJ18LjAY
         WHwZ8Dr1nXaR52qxjnhd/uRLYcgN6qy36aZHNNvs8hOKn/EUbpgrxqmRX/daqbAV7PTA
         qptQ==
X-Gm-Message-State: AOAM530PRm97+TVcSo6hxZwenXzdrYy5u9RdCtDaWA1jvfjJDEN8spml
        RuYIfupaFmsXLnZI0y/1x9FSHAOs2g==
X-Google-Smtp-Source: ABdhPJxVBBy9yBW/WE8YGP4H2DxszJRV6L7CHDKqB4fy5/Z98hD7jA8/4zKVUuYdSmtOCG2J8BXsmQ==
X-Received: by 2002:a62:4e88:: with SMTP id c130mr10082114pfb.122.1590075134984;
        Thu, 21 May 2020 08:32:14 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:69f:45f2:3d8d:3719:f568:7ee9])
        by smtp.gmail.com with ESMTPSA id g27sm5034156pfr.51.2020.05.21.08.32.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 08:32:14 -0700 (PDT)
Date:   Thu, 21 May 2020 21:02:08 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] Introduce features and debugfs/sysfs entries for
 MHI
Message-ID: <20200521153208.GB16101@Mani-XPS-13-9360>
References: <1589832241-13867-1-git-send-email-bbhatt@codeaurora.org>
 <20200521132318.GA3797@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521132318.GA3797@Mani-XPS-13-9360>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 21, 2020 at 06:53:18PM +0530, Manivannan Sadhasivam wrote:
> Hi,
> 
> On Mon, May 18, 2020 at 01:03:54PM -0700, Bhaumik Bhatt wrote:
> > Introduce independent bus and device voting mechanism for clients and save
> > hardware information from BHI.
> > Allow reading and modifying some MHI variables for debug, test, and
> > informational purposes using debugfs.
> > Read values for device specific hardware information to be used by OEMs in
> > factory testing such as serial number and PK hash using sysfs.
> > 
> 
> I think this series is not yet ready. So will not merge any patches in this
> series for 5.8.
> 
> Or let me know if there are any independent patches which should get merged.
> I'm planning to send the final 5.8 series to Greg by Friday.
> 

Sorry. I just realised that we are running out of time as we are ending rc6. So
I've sent the 5.8 series to Greg.

Thanks,
Mani

> Thanks,
> Mani
> 
> > This set of patches was tested on arm64 and x86.
> > 
> > v3:
> > -Add patch to check for pending packets in suspend as a dependency for the
> > independent voting mechanism introduction
> > -Include register dump entry for debugfs to dump MHI, BHI, and BHIe registers
> > -Update commit message for the debugfs patch
> > -Updated Documentation/ABI with the required info for sysfs
> > -Updated debugfs patch to include a new KConfig entry and dependencies
> > -Updated reviewed-by for some patches
> > 
> > v2:
> > -Added a new debugfs.c file for specific debugfs entries and code
> > -Updated commit text and addressed some comments for voting change
> > -Made sure sysfs is only used for serial number and OEM PK hash usage
> > 
> > Bhaumik Bhatt (7):
> >   bus: mhi: core: Abort suspends due to outgoing pending packets
> >   bus: mhi: core: Introduce independent voting mechanism
> >   bus: mhi: core: Use generic name field for an MHI device
> >   bus: mhi: core: Introduce helper function to check device state
> >   bus: mhi: core: Introduce debugfs entries and counters for MHI
> >   bus: mhi: core: Read and save device hardware information from BHI
> >   bus: mhi: core: Introduce sysfs entries for MHI
> > 
> >  Documentation/ABI/stable/sysfs-bus-mhi |  25 ++
> >  MAINTAINERS                            |   1 +
> >  drivers/bus/mhi/Kconfig                |   8 +
> >  drivers/bus/mhi/core/Makefile          |   5 +-
> >  drivers/bus/mhi/core/boot.c            |  17 +-
> >  drivers/bus/mhi/core/debugfs.c         | 501 +++++++++++++++++++++++++++++++++
> >  drivers/bus/mhi/core/init.c            |  80 +++++-
> >  drivers/bus/mhi/core/internal.h        |  29 ++
> >  drivers/bus/mhi/core/main.c            |   6 +-
> >  drivers/bus/mhi/core/pm.c              |  79 ++++--
> >  include/linux/mhi.h                    |  39 ++-
> >  11 files changed, 745 insertions(+), 45 deletions(-)
> >  create mode 100644 Documentation/ABI/stable/sysfs-bus-mhi
> >  create mode 100644 drivers/bus/mhi/core/debugfs.c
> > 
> > -- 
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
