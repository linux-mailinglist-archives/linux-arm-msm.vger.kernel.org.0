Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 680332CB3F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 05:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbgLBEj3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 23:39:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbgLBEj2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 23:39:28 -0500
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C35AC0613D4
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Dec 2020 20:38:42 -0800 (PST)
Received: by mail-oo1-xc43.google.com with SMTP id l20so73842oot.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Dec 2020 20:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x1J3oNmVed248Yr9F5ZYzVm9O5TAhAVtwD5WiYXieTM=;
        b=F+AKOO9pCQYn+/ifh4mIPLaNGJeZOmCjEmugX5tFpb9lYUHnjS2it5tO/q/+wG1ydu
         lFRspQVR9vHZESpQp704H+GmCG6Y2dZNpC1V7geaJ6Sfias1JxAVnZZ3nwM+nVKiHdFO
         jUJwHca8YVoRdcIbitwfD4fXb0kyD/4fFBouah6Qm8FkQF/3HrfJZiiOjyFvybA/KTh3
         iRTj4CoX9so9c979DLUpbErKqUIzfmFPW5oALfrik8Ff3DIukUryeeQH7C8NOPQW+PN9
         Gm6mhb/OT63IgVcQdbaUJIrPMqzAtxn3Lx72SKmAq2Kq/OUlrmqpwRnikidNZsieZTfU
         lusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x1J3oNmVed248Yr9F5ZYzVm9O5TAhAVtwD5WiYXieTM=;
        b=HBdPeh1jbOR+9yamPxaoO3rGA7sZJAFiCYPxH9vqtjbaxh8WswOl410HFQ4VA5N6Z8
         Si9hFK57bTjlPZUjt2pGMs61fTpFM/PIXvGd1bxsOwvtps38ML22MBKUcGdSq9B+PrrB
         rDGeTGwOcnYdigVMvKwvijhNaAeXHkmJLCgQgFwqZHJ/aTYAawUOX0MdvfSmDY/7krJw
         Bl4aZMPEiNOSVlAEgcZmRK1sSEWfpFPWLxZYlb0iotY3VD9xNVz26d3orpZJ9SP1WFmb
         Xf0MUTVlFhUFj3VFUOsJTopP976VvB7iYj76hcoy9sWX97Bg1PrZNhMzhFP/0NHNldWu
         OPtQ==
X-Gm-Message-State: AOAM533VNsY/vdsmuueuv08xAHzKrhwIzpqflNcadcAXKRaa6+U5k74i
        8tDOG8tGw4F8otnL89QZ+g9h2w==
X-Google-Smtp-Source: ABdhPJx3n5GPkA/PmFkRvvmtFHgXXxzuijf/+FpB+95yB2JyUbQkL9apmio7/pw3Zua14/43WG0sig==
X-Received: by 2002:a05:6820:351:: with SMTP id m17mr405037ooe.36.1606883921962;
        Tue, 01 Dec 2020 20:38:41 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y18sm122944ooj.20.2020.12.01.20.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 20:38:41 -0800 (PST)
Date:   Tue, 1 Dec 2020 22:38:39 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        manivannan.sadhasivam@linaro.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v13 0/4] userspace MHI client interface driver
Message-ID: <20201202043839.GL807@yoga>
References: <1606533966-22821-1-git-send-email-hemantk@codeaurora.org>
 <20201201112901.7f13e26c@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201112901.7f13e26c@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 01 Dec 13:29 CST 2020, Jakub Kicinski wrote:

> On Fri, 27 Nov 2020 19:26:02 -0800 Hemant Kumar wrote:
> > This patch series adds support for UCI driver. UCI driver enables userspace
> > clients to communicate to external MHI devices like modem and WLAN. UCI driver
> > probe creates standard character device file nodes for userspace clients to
> > perform open, read, write, poll and release file operations. These file
> > operations call MHI core layer APIs to perform data transfer using MHI bus
> > to communicate with MHI device. Patch is tested using arm64 based platform.
> 
> Wait, I thought this was for modems.
> 

No, this allows exposing particular channels from any type of MHI
devices.

For modems there is a legacy control path that uses UCI. But data
traffic, (non-legacy) modem control signals and e.g the bearer of GPS
data uses in-kernel drivers that are already in place.

> Why do WLAN devices need to communicate with user space?

They normally don't, all WLAN operations are dealt with within the
kernel. The use case that comes to mind for UCI when it comes to WiFi
products is to avoid implementing the Qualcomm debug (diag) protocol in
the kernel.


As such I think saying that it can be used to communicate with modem or
WLAN devices is misleading. Because while it could be done, it is only
used for dealing with optional side-band services on such products - not
the actual WiFi and modem functionality.

Regards,
Bjorn
