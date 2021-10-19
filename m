Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 764DE4336FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 15:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235466AbhJSN2a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 09:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbhJSN2a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 09:28:30 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E726C061745
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 06:26:17 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id n11so13664540plf.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 06:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=or8Ipmp1IuPITyJB/TiRcaMpJVnR5kcP60YFXBqqS1I=;
        b=cu6g7VaBRgn01oP0CdKLJmYNPxNd3Kgi5L/EcqgU37OBmWA6eLNW6m+Hv2oFmpDtEI
         QzJip+Zu7fpPjUg0tXw6yDHZR17UqSfXF/VjmfkKwnqSuTcxjk0RPYAAnR/6Hi+PR+7+
         tQQhIBBQ2J361Hnz9a34IoNxzNymtOBG+reymAWl5Etqw9xkykMNIz4Pze26IiYw0XZJ
         mhA+HLRXSBP3POw44j0ljWh1dTo1wZq++P1MxrOIj0m66pOvQxnb4g5JhYLqj7d17A2y
         McT1ftuwiGB4jzdSxCkafEB4uR4d6KC5GOdarnP7MmgJg88hxgcRadJdHvwAM5NULrwt
         TGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=or8Ipmp1IuPITyJB/TiRcaMpJVnR5kcP60YFXBqqS1I=;
        b=m4CczJXcg1tCh+pV81xPV/9PpiMymy0WKELKSXkHljcQzzSCkSFN4q/RRZuTk8SEe8
         eRQFjPB4OP6O+bBUAyQrxmMF3qpVAYkzbwAnv21zDp0XCdQ4Af0fxO0F9a0RAR9Oq/t9
         O3dWuZ3tfTO1yOmru5Fr4ecSvyqDKl3pkwNgmepQ+wOC4Ldhq9hW71h3UwEJ0Nh1OaGM
         l2JdwF9vOtLEBPTktuc0taQhzyZzKKsOGyRlo/0k2pt7iymGOE48uPMmz2Cq3mqpqaVo
         RxESVEqbS8BGEkiz/Qlf9UVzTsC8rjOFTl2CtOG+vAEvOHdcKLTYPvHGe6MH2JA4DYow
         m4Tw==
X-Gm-Message-State: AOAM532kWwJxlZrXyyT5bX+VlT/DvPKxLWhUCyvPj0dA9fClb7oQebkG
        HO66g+TDDjj/8YdRMh20emB1
X-Google-Smtp-Source: ABdhPJyt+9QxKogVBYcrXpPsn8dfe3yEg3R/m+Q+od/qJUlqh62gci/1z6OjYVgpks85+cnyqHC6UQ==
X-Received: by 2002:a17:90b:4c8d:: with SMTP id my13mr6687112pjb.101.1634649976785;
        Tue, 19 Oct 2021 06:26:16 -0700 (PDT)
Received: from workstation ([202.21.43.8])
        by smtp.gmail.com with ESMTPSA id g11sm15993807pgn.41.2021.10.19.06.26.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Oct 2021 06:26:16 -0700 (PDT)
Date:   Tue, 19 Oct 2021 18:56:12 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, wangqing@vivo.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] MAINTAINERS: Update the entry for MHI bus
Message-ID: <20211019132612.GA4851@workstation>
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
 <20211016065734.28802-2-manivannan.sadhasivam@linaro.org>
 <661c564c-e6cd-cbd4-0b17-a7c230d911b2@codeaurora.org>
 <YW64/hzKom7MiVDV@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YW64/hzKom7MiVDV@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 19, 2021 at 02:24:30PM +0200, Greg KH wrote:
> On Mon, Oct 18, 2021 at 09:19:16PM -0700, Hemant Kumar wrote:
> > 
> > 
> > On 10/15/2021 11:57 PM, Manivannan Sadhasivam wrote:
> > > Since Hemant is not carrying out any maintainership duties let's make
> > > him as a dedicated reviewer. Also add the new mailing lists dedicated
> > > for MHI in subspace mailing list server.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> 
> Great, Manivannan, can you resend just this patch with this reviewed-by
> so that I can apply it?
> 

Sure, will do. I thought I could also send the modified version of patch 2 of
this series but we ran out of time :/

Thanks,
Mani

> thanks,
> 
> greg k-h
