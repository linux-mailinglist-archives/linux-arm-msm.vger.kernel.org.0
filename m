Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA4430A5F3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Feb 2021 11:58:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233419AbhBAK4q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Feb 2021 05:56:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233301AbhBAK4f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Feb 2021 05:56:35 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA6B0C061574
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Feb 2021 02:55:55 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id w14so11337398pfi.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Feb 2021 02:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x7smZfimq5VLvYtCOtxuqcYm6UGTkSi72soXHLRKTpM=;
        b=DQ3r1LWiwzFfAiJ7brDLovN9fhCmXBJvXP8DhmLrln99xmgoK5Bdyyyxdhm+lymxGH
         UmyjKKBQ8acggZ9DSFWmdJ4+nsOR4h1fFe2NjETITaHBoQ2UwGJXjBYCaORZYbWxZdo1
         LO26V9TGnbgz0so5+h268EYiNeGO3gxzkKgkJB6qEJXGInsCs921NLBLgtFVX2YMJTFC
         Okbpg01Wb8SsUkVncyrVGx1FApUw1tk8lbevVPgab9M+fdLJB2j+EIrWuEjuhKlI27ks
         xGRifxQ/SIJcHvf9xbdUxsDPbr7iNPPrdl531lTHQt4RotDRJTWrMh9aH+THi3phlexN
         dSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x7smZfimq5VLvYtCOtxuqcYm6UGTkSi72soXHLRKTpM=;
        b=OkrUOIwZhHXESPylXoKj7U9hojr/AqdV8nr5ts44dArX7Wrp7vwgt3h606vLZVi9fI
         F39gMSVSj+y+s92x9mlwP5CcHy60Xyuyd95XOk/IWjt8REQeVhgyD9se6zyOe8zoRiad
         GNfSEsmAppAfGkytBcQG6SBClsj1wqs74mpDY9PJI0dtrjXl6kjL97+T5BGAtNuDaft3
         xCMGUjiFsOzUyaT8/VVnDHIBx2GThCO0YeHL/LTwrEtqyZWmducqbZasjV9COtwztSoP
         wG8y6A8B/EBzUWeCrVde6tdGJK3NkFgYVzssoNmflPHfkSwLOpOvLMDO4jK6GTYIqe3J
         1m9Q==
X-Gm-Message-State: AOAM5329DEbnWr4JMoiksNH8xkoYxHv0ilSQvNdlbW+9xU+hT4y6Upno
        rI7eSHvQoRSk+mP8t8UoCfmI
X-Google-Smtp-Source: ABdhPJwdwkB8dARMJd4TwgHuzrbJxC6Lu0ODqqjS+qd6SixZZjR3QBz+GEifNBBKWapozQYkQEaYmg==
X-Received: by 2002:a05:6a00:2127:b029:1bb:b6de:c875 with SMTP id n7-20020a056a002127b02901bbb6dec875mr15682597pfj.72.1612176954812;
        Mon, 01 Feb 2021 02:55:54 -0800 (PST)
Received: from thinkpad ([103.77.37.179])
        by smtp.gmail.com with ESMTPSA id h3sm17375621pgm.67.2021.02.01.02.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 02:55:53 -0800 (PST)
Date:   Mon, 1 Feb 2021 16:25:49 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, netdev@vger.kernel.org
Subject: Re: [RESEND PATCH v18 0/3] userspace MHI client interface driver
Message-ID: <20210201105549.GB108653@thinkpad>
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

Hi Greg,

On Wed, Jan 27, 2021 at 04:15:42PM +0100, Greg KH wrote:
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

As discussed in previous iteration, this series is not belonging to networking
subsystem. The functionality provided by this series allows us to configure the
modem over MHI bus and the rest of the networking stuff happens over the
networking subsystem as usual.

This holds the same with USB and serial modems which we are having over decades
in mainline.

Thanks,
Mani

> thanks,
> 
> greg k-h
