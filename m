Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88E4F3060F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 17:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237142AbhA0QYq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 11:24:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235014AbhA0QYp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 11:24:45 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC4B0C061573
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 08:24:05 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id h6so2732242oie.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 08:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GG0TpbUNYlPSbaljbB2iMXCGWpl1mkIqLneVjeynSxI=;
        b=npClNprtbGHfrypkEZsUQ3PuSwXQh/fi4c9lfxGBu8Qlf+BnFeh9oIQvmaP8+8tbzg
         OrJYeUVHzkqZyImR8NflmYa+Nf/2SdI+04KTcORok44TGC8U7hWuCUOqAnULmmC+bm3g
         BDLTVwmayP5Udz9KShPPO+COQcGKnWFs2do7trrl4gyeWwakPc/ptYhAEhfOYopdewzO
         6jxINa3vHCn8lzo1cpnHuZB5Wj1lOQcZannAvGVnHMbnR23NBsU6qbpwkWxzSG+vc7hw
         Ft37CYTOrgCk5VaqjPiq5S5Nnp8QFfESwq971Zd5052JPOhEmAlvgnXgrzJAqssrsJlE
         zDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GG0TpbUNYlPSbaljbB2iMXCGWpl1mkIqLneVjeynSxI=;
        b=JfPYkBRreVdSJUMddtg1hJ+kPhmkCLXJugQytUge6Z1O8MTPdl4GU+Mnxcs+wPtlNE
         7Ij3Z08ycZrNk0jGDptDlZ5sMqeLU50noGPKFLJ2AUsQPCXaAyxRGPT2P1VnB8/+23Ff
         itC2VzClzgW3Lhi9Ce5jmwrvIGp0RMAF0adCxUCUab8e5SRdYqWlp4pKZjEOV8lvPkdH
         GYGut6IIaHTgLRPscCeLVR5+27dKnwDRev4tAUPsI7YiEEwAHGHFPT4rRPty/UYtXOEO
         EQqU47rlh+CbGnwjgdW+7tjbjMpCiPG4fvsxeGyYp9LBap0yDJ1vEksy6hbD1wdrBEB1
         DkKw==
X-Gm-Message-State: AOAM531DBTgPmWDJdJ6sPck0nu99A83BZAk7jgMvowMLtxh6WiEAYOMO
        AvJyijfv5OQB0aNte6SAbtrbUQ==
X-Google-Smtp-Source: ABdhPJxyRZTOu8oTpmszoVzALsoM139tiy9mfNWSYd34E76lJAP8S0iZ6e/JG3ZrP968DirOqzJ0Jw==
X-Received: by 2002:aca:4c03:: with SMTP id z3mr3710617oia.21.1611764645161;
        Wed, 27 Jan 2021 08:24:05 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w194sm503278oiw.39.2021.01.27.08.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 08:24:04 -0800 (PST)
Date:   Wed, 27 Jan 2021 10:24:02 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, netdev@vger.kernel.org
Subject: Re: [RESEND PATCH v18 0/3] userspace MHI client interface driver
Message-ID: <YBGTooJ5tVgf1u/R@builder.lan>
References: <1609958656-15064-1-git-send-email-hemantk@codeaurora.org>
 <20210113152625.GB30246@work>
 <YBGDng3VhE1Yw6zt@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBGDng3VhE1Yw6zt@kroah.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 27 Jan 09:15 CST 2021, Greg KH wrote:

> On Wed, Jan 13, 2021 at 08:56:25PM +0530, Manivannan Sadhasivam wrote:
> > Hi Greg,
> > 
> > On Wed, Jan 06, 2021 at 10:44:13AM -0800, Hemant Kumar wrote:
> > > This patch series adds support for UCI driver. UCI driver enables userspace
> > > clients to communicate to external MHI devices like modem. UCI driver probe
> > > creates standard character device file nodes for userspace clients to
> > > perform open, read, write, poll and release file operations. These file
> > > operations call MHI core layer APIs to perform data transfer using MHI bus
> > > to communicate with MHI device. 
> > > 
> > > This interface allows exposing modem control channel(s) such as QMI, MBIM,
> > > or AT commands to userspace which can be used to configure the modem using
> > > tools such as libqmi, ModemManager, minicom (for AT), etc over MHI. This is
> > > required as there are no kernel APIs to access modem control path for device
> > > configuration. Data path transporting the network payload (IP), however, is
> > > routed to the Linux network via the mhi-net driver. Currently driver supports
> > > QMI channel. libqmi is userspace MHI client which communicates to a QMI
> > > service using QMI channel. Please refer to
> > > https://www.freedesktop.org/wiki/Software/libqmi/ for additional information
> > > on libqmi.
> > > 
> > > Patch is tested using arm64 and x86 based platform.
> > > 
> > 
> > This series looks good to me and I'd like to merge it into mhi-next. You
> > shared your reviews on the previous revisions, so I'd like to get your
> > opinion first.
> 
> If you get the networking people to give you an ack on this, it's fine
> with me.
> 

Why? As concluded in previous iterations of this series this does not
relate to networking.

Regards,
Bjorn
