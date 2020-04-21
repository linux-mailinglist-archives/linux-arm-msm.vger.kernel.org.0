Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 640881B1E96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 08:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgDUGIn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 02:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726524AbgDUGIn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 02:08:43 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C6DC061A10
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 23:08:42 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id r14so6160845pfg.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 23:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sDllzFsBHZPyzu3AXJKIrXB/1lUAjyHJuSQk9xHlHNQ=;
        b=ULcRFem5v+TtwwUxzAUUNG7yK13oeDuKqJl6RdKJCP9R+zDZCr/nW2iHIEDS8zEdEm
         CxyQiXeOA0o3Rq2Kx9kuS8YKt/0aGF+AEllryuRIJ8d9F/9JAhIl3MkYe9N+7o48UgpW
         E4ADuUERsn7TuLm9656ZnEC8GTcgxudT8/pM05cQoe8FD0QF9Ao4g3beZdEeTsWT0qgv
         8IjiutyJrOz5C4BVLcJUq4SFE/V7JBSi/E858GmurNXE0YSU8/37CWRreVO8lWbSLUYv
         yuBMA5MIGC4Iq3zaEI7dwllei5NoyR2ySjfhYTdaxmWsxXEj52ovTz7mCBa1JC8F4FVX
         qN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sDllzFsBHZPyzu3AXJKIrXB/1lUAjyHJuSQk9xHlHNQ=;
        b=KssRLg0gz9Qs0WgK4yGWTsmPgtKptqdKNzzvJ8KJNVMqlbVD7O3h3ImEs+5shsGDTU
         0UJr7Ur0blgehDE/3nGeNeDKkDJvO/gDS57qLnWdGwXUhbMzEb8KcfeHdJM6uh3g0ucq
         0IYaoj3FfzYSivKf1aEEoOTNGaJo2lRrRhHRmIq7q8KeTIXTzl/giS9cAcI3lPssDGVt
         9xkp8CC89NchVLok0Mjn+CuWWA4jOMkfM7+v0emahFvrhYk9gQ8iHOwGpdBB1KxvOC+6
         rnrL7nxSI4pTjSyrQBHfw/Yg1bmwAf1saUxguxwXPiV6EAZ5K7s82DddIBUu8p/yFwgK
         1Reg==
X-Gm-Message-State: AGi0PuatkudFufwAKiUDLVkuKONuZGnGqsrcFBepIvudRU0Lm4ap7umo
        X3BP159Jprq24hIIGOXfy5dVK9hj34Rl
X-Google-Smtp-Source: APiQypJvUWR+vtt1MwPMwz9EAnmfbaVX7c3szY5KnMLNgLD/6RlREpPcv7pnpkkvTZIWlRJ4XS35HA==
X-Received: by 2002:a62:7656:: with SMTP id r83mr19972450pfc.71.1587449321441;
        Mon, 20 Apr 2020 23:08:41 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6289:7463:c15b:2de1:b77e:d971])
        by smtp.gmail.com with ESMTPSA id p189sm1367714pfp.135.2020.04.20.23.08.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Apr 2020 23:08:40 -0700 (PDT)
Date:   Tue, 21 Apr 2020 11:38:35 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Bhaumik Vasav Bhatt <bbhatt@codeaurora.org>,
        Hemant Kumar <hemantk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] bus: mhi: core: Handle syserr during power_up
Message-ID: <20200421060835.GD4327@Mani-XPS-13-9360>
References: <1586278230-29565-1-git-send-email-jhugo@codeaurora.org>
 <1586278230-29565-2-git-send-email-jhugo@codeaurora.org>
 <1768ba6e-12c2-7b4f-0f17-44fecc6473b9@codeaurora.org>
 <11d9f35b-b911-7985-8846-0a45904ceed1@codeaurora.org>
 <5c4efe13-42a4-e802-4070-5d9d30b8cac2@codeaurora.org>
 <79feeb0b-0837-c5b6-087d-856c3e238c67@codeaurora.org>
 <20200413133447.GA19124@Mani-XPS-13-9360>
 <ee51ae8f-5826-5402-9178-3f2fba1358f8@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee51ae8f-5826-5402-9178-3f2fba1358f8@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 13, 2020 at 08:01:36AM -0600, Jeffrey Hugo wrote:
> On 4/13/2020 7:34 AM, Manivannan Sadhasivam wrote:
> > On Fri, Apr 10, 2020 at 03:39:57PM -0600, Jeffrey Hugo wrote:
> > > On 4/10/2020 2:37 PM, Bhaumik Vasav Bhatt wrote:
> > > > Hi Jeff,
> > > > 
> > > > We will always have the mhi_intvec_handler registered and trigger your
> > > > wake_up state event when you write MHI RESET. BHI INTVEC IRQ using
> > > > mhi_cntrl->irq[0] is _not_ unregistered once you enter AMSS EE.
> > > 
> > > I understand it is not unregistered.  However mhi_cntrl->irq[0] may be
> > > reserved for BHI, and thus only exercised by PBL EE.  Where as,
> > > mhi_cntrl->irq[1..N] may be only exercised by AMSS EE. mhi_intvec_handler is
> > > not called in response to mhi_cntrl->irq[1..N].
> > > 
> > > Additionally, I re-reviewed the MHI spec, and I don't see where the spec
> > > requires the device to issue an interrupt upon completion of the RESET
> > > request.
> > > 
> > > Under section 3.5, step 11 states -
> > > 
> > > "The host must poll for the value of the RESET bit to detect the completion
> > > of the reset procedure by the device (RESET is set to 0)."
> > > 
> > 
> > If this is the scenario then we need to change all of the wait_event_timeout()
> > implementation for MHI RESET in current stack to polling.
> > 
> > Or the interrupt generation is not defined in spec (sheet) but part of the
> > existing implementation?
> 
> It probably could be considered part of the existing implementation, but I'd
> like to hear from Hemant/Bhaumik.  Wherever we end up, I'd like to have the
> spec match.

Hemant/Bhaumik, can you please share your thoughts?

Thanks,
Mani

> 
> -- 
> Jeffrey Hugo
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
