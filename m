Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E19B0154DB7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2020 22:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727578AbgBFVLi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 16:11:38 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40834 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727499AbgBFVLh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 16:11:37 -0500
Received: by mail-pf1-f193.google.com with SMTP id q8so82124pfh.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2020 13:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c3NTdAdhdM9DYmFQ0d2YUfPxuIsTP1hTGZxxt3uKZUY=;
        b=zJXxFnEE8Q2NCpkipo/7srIVDo5W0ovP+Yah2bAOHVxwQTzvt/wv3ePcbWvpGkV9Jq
         lAVEK3PQ0SLLdlm8z/Q8OLyvb4xv4d5DFVBRrdxDPOsEGyrssmSAGX9QFuM/C6dNNfZk
         0IkfNrzTYxMCcj0sjuHUXU5j4+Ml2hKCdjCZCo3gaxWhJr1hm5HdK0NJc119OH69ac5v
         Uggv56I/34Sz/QeyxXDwGRHTzlf+Q+S62xFfSxm+jHtNYuV3gcIdWRjoLwY0sD7vMk0/
         0LbZzSaDMCZMU5UNAiq3Pmo4SqJYhLrRGi7QHcVytrfgp7ygWUSDRSkV0HvDiRo+GYUe
         HlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c3NTdAdhdM9DYmFQ0d2YUfPxuIsTP1hTGZxxt3uKZUY=;
        b=FCRaFZl00uld4NT8IsLnFoSywMwws9er43CPxb6vKSvbN2Ea7HeLsmkKZP/G82JRjs
         dFgfrpga/iOFYajqUvRuaIWSYL2eOLpfygYSHOYNA9AbSNMrbwoWPDFSRJIAHQajHPQd
         YeR5i43vYUxY9NH09570eN5ArVNr1IM/GLZCrEUgLb6etkYR0TmAhk8p09gXih+yFFkE
         2/jUsPE9rweFDN/0UoYxnzpoNkGReGXaiWPBzuZcAovrtIqytXk9f3iYKOAjuLhGNBCd
         vRMXSz/RcxYxYbMHR/Wg8xy1l4P5vkG7bkjLWn26tH7c36qm8T5Ct1ZgfBGM3rJMDlgE
         NnMg==
X-Gm-Message-State: APjAAAUfvyxFdxdMchGG9WI3U9jmf8qsIK+H9YKzmtykuP0r9HL1C+jj
        34j5SdPoTbXYDRcRB34QCCl3iA==
X-Google-Smtp-Source: APXvYqzrGxCq7CnAyAvJAFB+znvWs+GRUSk2yK50/nOsNyU4uC6b/DPz4td5EjEFKdnWuruf1/X7Kw==
X-Received: by 2002:aa7:8687:: with SMTP id d7mr6079767pfo.164.1581023496876;
        Thu, 06 Feb 2020 13:11:36 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z19sm307621pfn.49.2020.02.06.13.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 13:11:36 -0800 (PST)
Date:   Thu, 6 Feb 2020 13:11:33 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Maulik Shah <mkshah@codeaurora.org>, swboyd@chromium.org,
        agross@kernel.org, david.brown@linaro.org,
        Lorenzo.Pieralisi@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org, ulf.hansson@linaro.org, rjw@rjwysocki.net
Subject: Re: [PATCH v3 5/7] drivers: firmware: psci: Add hierarchical domain
 idle states converter
Message-ID: <20200206211133.GR2514@yoga>
References: <1580736940-6985-1-git-send-email-mkshah@codeaurora.org>
 <1580736940-6985-6-git-send-email-mkshah@codeaurora.org>
 <20200203170832.GA38466@bogus>
 <0d7f7ade-3a1e-5428-d851-f1a886f58712@codeaurora.org>
 <20200204152132.GA44858@bogus>
 <6ff7c82d-4204-a339-4070-0154ab4515f1@codeaurora.org>
 <20200205140603.GB38466@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205140603.GB38466@bogus>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 05 Feb 06:06 PST 2020, Sudeep Holla wrote:

> On Wed, Feb 05, 2020 at 05:53:00PM +0530, Maulik Shah wrote:
> >
> > On 2/4/2020 8:51 PM, Sudeep Holla wrote:
> > > On Tue, Feb 04, 2020 at 10:22:42AM +0530, Maulik Shah wrote:
> > > > On 2/3/2020 10:38 PM, Sudeep Holla wrote:
> > > > > On Mon, Feb 03, 2020 at 07:05:38PM +0530, Maulik Shah wrote:
> > > > > > From: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > >
> > > > > > If the hierarchical CPU topology is used, but the OS initiated mode isn't
> > > > > > supported, we need to rely solely on the regular cpuidle framework to
> > > > > > manage the idle state selection, rather than using genpd and its
> > > > > > governor.
> > > > > >
> > > > > > For this reason, introduce a new PSCI DT helper function,
> > > > > > psci_dt_pm_domains_parse_states(), which parses and converts the
> > > > > > hierarchically described domain idle states from DT, into regular flattened
> > > > > > cpuidle states. The converted states are added to the existing cpuidle
> > > > > > driver's array of idle states, which make them available for cpuidle.
> > > > > >
> > > > > And what's the main motivation for this if OSI is not supported in the
> > > > > firmware ?
> > > > Hi Sudeep,
> > > >
> > > > Main motivation is to do last-man activities before the CPU cluster can
> > > > enter a deep idle state.
> > > >
> > > Details on those last-man activities will help the discussion. Basically
> > > I am wondering what they are and why they need to done in OSPM ?
> >
> > Hi Sudeep,
> >
> > there are cases like,
> >
> > Last cpu going to deepest idle mode need to lower various resoruce
> > requirements (for eg DDR freq).
> >
> 
> In PC mode, only PSCI implementation knows the last man and there shouldn't
> be any notion of it in OS. If you need it, you may need OSI. You are still
> mixing up the things. NACK for any such approach, sorry.
> 

Forgive me if I'm misunderstanding PSCI's role here, but doesn't it deal
with the power management of the "processor subsystem" in the SoC?


In the Qualcomm platforms most resources (voltage rails, clocks, etc)
are controlled through a power controller that provides controls for a
state when the CPU subsystem is running and when it's asleep. This
allows non-CPU-related device to control if resources that are shared
with the CPU subsystem should be kept on when the last CPU/cluster goes
down.

An example of this would be the display controller voting to keep a
voltage rail on after the CPU subsystem collapses, because the display
is still on.

But as long as the CPU subsystem is running it will keep these resources
available and there's no need to change these votes (e.g. if the display
is turned on and off while the CPU is active the sleep-requests cancels
out), so they are simply cached/batched up in the RPMh driver and what
Maulik's series is attempting to do is to flush the cached values when
Linux believes that the firmware might decide to enter a lower power
state.

Regards,
Bjorn
