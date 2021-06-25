Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9BE3B43FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 15:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbhFYNGN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 09:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbhFYNGN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 09:06:13 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92CEEC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 06:03:51 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id c5so7991930pfv.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 06:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Rtsnu8VD33EKMaZf3cpQ8efCBZxp+xhAKR5JoGpX5Eo=;
        b=QyicnVxC5A1fEGp5XtFu3wD2OgDufaG+KE0JJ9KpzGa7lNZMm/POMik2AXOxX1zkTG
         3J1IUFt9eeLSs/W1TxbtnzkxWiHFHRoseNrxBhaRZHMOz6MBCT6fQt7ROrqIOUqttUZw
         QU8itF6xaMwH0rMf7sAxh58f2tTPEKeert6XLTeTlx+kPxk4jBP6NSAlQUCkl/f4Rl/o
         tvN7rnm43Rwy6RxxZbZnRGq2tHOSGNX4NtjwUxcvJixa4Efap/fpKanlZ1kQGKEU1pLX
         z1blAIpYshe2WZpwUDCgSw2TaFR3hgGkF+y0iIHjiodOYRZzn+PQyEuiGu3LF/YpNVya
         xC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rtsnu8VD33EKMaZf3cpQ8efCBZxp+xhAKR5JoGpX5Eo=;
        b=BelCnOcIZHI6a9F/2TAifGpC9ehJ6Lb7CHzUgxAVEsI7bYYa/JnA9dtEWADC7N/C+e
         GfzU1KXnONYmaK8Tq1oWTQt5a3BoHJMOG0gVEB4iK9wfZUDOKtiX8eNcGor7l4e+nHGI
         pySqZUPx5DVaTimno6p2M1iwpgTsDdzXc2aLXZ1W4sCja2SAFMFdgLxaUkcI+kN0Ysyc
         CtHX1uW2vbDHMZZP+eJpEMRoYq7K+Z52LwZrdKMlacJV8ZAgDdfn7qdzfPTZ9GjqPJkn
         wc2P8GyG90Qr5NIMIIWxbJAKib3AxHky5xGS7TGalpqpLip1giew9G1J5JN0zIGauguU
         qlxw==
X-Gm-Message-State: AOAM533Fa3za9NjBmCU0C2GN3ofUChol7N6JUwDw+wV/wVedI1/V/6Rf
        JIxisSJxyRT8uRqyi7xAGlbG
X-Google-Smtp-Source: ABdhPJwUAHDHJd41dGZtRGQ/ranfWCHDBM1qzYWPFiEQHKE+umUBbxrpcg2Kbl/SsPWdegV92WZ1kg==
X-Received: by 2002:a63:185b:: with SMTP id 27mr9809644pgy.164.1624626231083;
        Fri, 25 Jun 2021 06:03:51 -0700 (PDT)
Received: from thinkpad ([2409:4072:600b:2a0:ed5d:53e7:c64e:1bac])
        by smtp.gmail.com with ESMTPSA id e4sm5903958pfa.29.2021.06.25.06.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 06:03:50 -0700 (PDT)
Date:   Fri, 25 Jun 2021 18:33:43 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, ath11k@lists.infradead.org,
        stable@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 06/10] bus: mhi: core: Set BHI and BHIe pointers to NULL
 in clean-up
Message-ID: <20210625130343.GA13833@thinkpad>
References: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
 <20210625123355.11578-7-manivannan.sadhasivam@linaro.org>
 <YNXOYkj9TWZgYAG3@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNXOYkj9TWZgYAG3@kroah.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 25, 2021 at 02:38:58PM +0200, Greg KH wrote:
> On Fri, Jun 25, 2021 at 06:03:51PM +0530, Manivannan Sadhasivam wrote:
> > From: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > 
> > Set the BHI and BHIe pointers to NULL as part of clean-up. This
> > makes sure that stale pointers are not accessed after powering
> > MHI down.
> > 
> > Cc: stable@vger.kernel.org
> 
> Why is this needed for stable, but patch 5/10 is not?
> 

Shoot! This one relies on 5/10 and fixes a corner case where the BHI/BHIe
pointers might be used after MHI powerdown. But this requires backporting
the patches 5-10 cleanly (a series).

So I guess the stable tag should be removed for this patch. We will test this
series on stable kernels (on how far) and make sure this doesn't break anything.
Then we can share the commit IDs to be backported with details?

Thanks,
Mani 

> And what commit does this fix?  How far back should it go?
> 
> And is this really fixing anything?
> 
> thanks,
> 
> greg k-h
