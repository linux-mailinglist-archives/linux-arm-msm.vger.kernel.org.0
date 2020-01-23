Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC931468BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 14:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbgAWNKY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 08:10:24 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:36474 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbgAWNKY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 08:10:24 -0500
Received: by mail-pj1-f66.google.com with SMTP id n59so1288855pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 05:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=w+K4QUYUUumgx2GBrpHxL9/aHJwsZb+ZQPrV+qlnlsY=;
        b=NoDXl5cZHlHa7TPuIuglrvunhuT/l5kgyUDrQ5dtVKFmNDn3ABmeQkUL2uaEz5zojz
         c9JoLAZP+HCaGSAxx2WC6Olqu7T79PFnjmJdmsZXp0xJ4E+GYMYrMWcJXuqD5IR0BiX1
         DRSI9g9mxIpy7SgiuT5aLgz1GPoeHc/9z51XSWVAM6GUdTXDgyuriL1jpEWafCwn3DBH
         0Eg+hR6gJ5tpwtZLHDPMzXi4ocL1DmiQ1+EyFkGtw2PotA2jZvtcxzrDSSSJevyrcd0V
         NDDDhHAhH3YU3JQ3R3IL20jVTotLAtCuC1EpogjgjNLSWtZtcFfSkvjcV95uqbebKmQ5
         T3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w+K4QUYUUumgx2GBrpHxL9/aHJwsZb+ZQPrV+qlnlsY=;
        b=Brv6W68XEVyMEU4eQIGc3l6CLBN0n33aAD8E5qW74Z+BGLlUqJ3i3baNhEc25e+8NG
         +iWBGiwblx35SHbB1PmI6fvRcq3+M+pl5+hmhdYn9LJrsYElK+UMPz2NfTQF1V/5en1k
         2YHf0vF/WqpVkTJMjy+PIq+/eqNF9CGPIWxCWSN2aqmj3o6Lbjcag4hMnyT5CNbQdX/b
         mwKtSi2ARuM35w28gabpNb9srRq7tL1AOBIh5LV50ILxjY00zC53p1lhD5q6JNBmtqnq
         v15VICkK9r2UWp+HNcGnxzJEbwratQcZBnQZ31HcvP8yNWq7LTJOHa0txxTZK3ZhuJAr
         B0ew==
X-Gm-Message-State: APjAAAUXfTGalXXTP9QLguzlZW5xucT3tf2C3w8LZXZTUpQ8q79jOaZy
        lfGCWTLTLejuKePAgXlgbeGW
X-Google-Smtp-Source: APXvYqwYB6HGPHkP0BoBZT/vXkHibew8dpcXweBvnxZwYg9fCHBovirZGC4X+wUlr0VhE+o03fJZcA==
X-Received: by 2002:a17:902:8e8c:: with SMTP id bg12mr16253851plb.101.1579785023754;
        Thu, 23 Jan 2020 05:10:23 -0800 (PST)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id a69sm2943318pfa.129.2020.01.23.05.10.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 05:10:23 -0800 (PST)
Date:   Thu, 23 Jan 2020 18:40:15 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     gregkh <gregkh@linuxfoundation.org>, smohanad@codeaurora.org,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        hemantk@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 01/16] docs: Add documentation for MHI bus
Message-ID: <20200123131015.GA11366@mani>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-2-manivannan.sadhasivam@linaro.org>
 <CAK8P3a3Nxr3yqDjZDV1b0e0mdWEEsktwrmKXxZgsnq7Kv82mhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3Nxr3yqDjZDV1b0e0mdWEEsktwrmKXxZgsnq7Kv82mhw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 23, 2020 at 01:58:22PM +0100, Arnd Bergmann wrote:
> On Thu, Jan 23, 2020 at 12:18 PM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> > +============
> > +MHI Topology
> > +============
> > +
> > +This document provides information about the MHI topology modeling and
> > +representation in the kernel.
> > +
> > +MHI Controller
> > +--------------
> > +
> > +MHI controller driver manages the interaction with the MHI client devices
> > +such as the external modems and WiFi chipsets. It is also the MHI bus master
> > +which is in charge of managing the physical link between the host and device.
> > +It is however not involved in the actual data transfer as the data transfer
> > +is taken care by the physical bus such as PCIe. Each controller driver exposes
> > +channels and events based on the client device type.
> > +
> > +Below are the roles of the MHI controller driver:
> > +
> > +* Turns on the physical bus and establishes the link to the device
> > +* Configures IRQs, SMMU, and IOMEM
> > +* Allocates struct mhi_controller and registers with the MHI bus framework
> > +  with channel and event configurations using mhi_register_controller.
> > +* Initiates power on and shutdown sequence
> > +* Initiates suspend and resume power management operations of the device.
> 
> I don't see any callers of mhi_register_controller(). Did I just miss it or did
> you not post one? I'm particularly interested in where the configuration comes
> from, is this hardcoded in the driver, or parsed from firmware or from registers
> in the hardware itself?
> 

I have not included the controller driver in this patchset. But you can take a
look at the ath11k controller driver here:
https://git.linaro.org/people/manivannan.sadhasivam/linux.git/tree/drivers/net/wireless/ath/ath11k/mhi.c?h=ath11k-qca6390-mhi#n13

So the configuration comes from the static structures defined in the controller
driver. Earlier revision derived the configuration from devicetree but there are
many cases where this MHI bus is being used in non DT environments like x86.
So inorder to be platform agnostic, we chose static declaration method.

In future we can add DT/ACPI support for the applicable parameters.

I will include the link to this controller driver in the cover letter of future
iterations.

Thanks,
Mani

>         Arnd
