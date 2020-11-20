Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 977192BA23B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Nov 2020 07:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbgKTGXh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Nov 2020 01:23:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgKTGXh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Nov 2020 01:23:37 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30E89C0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 22:23:37 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id bj5so3530434plb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 22:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0/v7EN5qLaIP5deWAyiNGrCRTTWH3Pp/ZeqoRvM3lLY=;
        b=d/vV7bH+XJ2qqI4hEaxWCb6e1Po5WzFE8t5dkiLGLX7AmAaAiNmv5IFN8ICbJEHLP7
         IarMZt3oD7rsqRb8WDMtPJrJ5Doe9GrJYoygCOpvjYm5CvKyy/aPTUige0KhIANbKKQm
         kxu1S18YVG7O5XLCRg0BVcaSdgYuO/3vvn2aVIxFe+YQoKun3xCsEDBui6d3v0cEdpxg
         Lh+mGKnVrVxFzuA0Xsgeu9B9xoHxcw8tbHK2UcS2NHgy8Vok/LjT+VIGitrhWS/pI66V
         G9PHvp1K9QEM2TLJx6o7oPfawWOzqFZ3Iq5meLYQmwQzmMr2azFrQhAYL38TGNYObgtk
         19DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0/v7EN5qLaIP5deWAyiNGrCRTTWH3Pp/ZeqoRvM3lLY=;
        b=thT2U8BiZdoy/xyaxFZ0kh4IfWz0FeFYnpcwns3aq6kCNGfQWWVq5rMhdY+CG+XZYF
         bxgW65UjvFPyfTvRMq02A4cjNEkMmmgzDOpMRd7JjRGchs/GkyErWX1oyYfb1uame7kx
         bRcNGyxswMcj2/j3kojp3ibnN+pjctOFU88mnR2nOorDQAarivRpQyhl23NmTLBq7wUh
         /CytM3aTV3wXHNLw/i4LVq7I7BvkxH3Go9Fk5pO+eMa0lSyI5CmUDp+/Efb9n60fP1HD
         ej7i4RTWznbRte4LOa26Y5bXlFsy3KIxVFSvZSvvSMk+uE3S6cBtP2tFpsLsQPWB0Vku
         vfzA==
X-Gm-Message-State: AOAM532ltDHVeQpcVYnYiJ4SDUdH7WINmxYz4dvP6jLpR5vAY+4Vc/Zw
        LjPqOr4mjWhj5eqUO579hLUO
X-Google-Smtp-Source: ABdhPJwm8SV5lH/8B7IplWqFGpNc4kgg3ooizZUecSGSH56XRviUfuh71/2I3k8gYpw4BQpnvs5hQw==
X-Received: by 2002:a17:902:ba8b:b029:d7:e6da:cd21 with SMTP id k11-20020a170902ba8bb02900d7e6dacd21mr12352707pls.38.1605853416673;
        Thu, 19 Nov 2020 22:23:36 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id z17sm2168338pfq.121.2020.11.19.22.23.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 22:23:36 -0800 (PST)
Date:   Fri, 20 Nov 2020 11:53:29 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Bhaumik Bhatt <bbhatt@codeaurora.org>, kvalo@codeaurora.org,
        linux-wireless@vger.kernel.org, cjhuang@codeaurora.org,
        linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        clew@codeaurora.org, loic.poulain@linaro.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH] net: qrtr: Unprepare MHI channels during remove
Message-ID: <20201120062329.GC3909@work>
References: <1605723625-11206-1-git-send-email-bbhatt@codeaurora.org>
 <20201119211046.64294cf6@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
 <20201120061512.GB3909@work>
 <20201119221828.72ba151a@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119221828.72ba151a@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 19, 2020 at 10:18:28PM -0800, Jakub Kicinski wrote:
> On Fri, 20 Nov 2020 11:45:12 +0530 Manivannan Sadhasivam wrote:
> > Jakub, can you please provide your ack so that I can take it?
> 
> Sure:
> 
> Acked-by: Jakub Kicinski <kuba@kernel.org>

Patch applied to mhi-ath11k-immutable.

Thanks,
Mani
