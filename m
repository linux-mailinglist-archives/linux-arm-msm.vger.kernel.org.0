Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E602194564
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 18:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728428AbgCZRZ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 13:25:26 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36220 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgCZRZZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 13:25:25 -0400
Received: by mail-pl1-f193.google.com with SMTP id g2so2400651plo.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2020 10:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=C0aXSSH6jnOuUiW5h4DP/qn1ilfkml9FjlWglQ0fxfY=;
        b=BuCpeTuJxIHYhgM4pr9GuJi+J095SECgRli1HbHzufUokL+dDm6MI9L2ct7BzLGsef
         oMPXccVhCwoz1uAtaANBM/UPQVu9sDWOBp/KwPpphKJi1Q7VP0HAkIPsgUDvFo8GqOOv
         a5YgVJ2b2PSwo4DPUW/CzJeEFSHF6lhmsqZPqYeODJQ0W9x5OgqOkVW4Ls8xlv92asFM
         6v5W3KjvceL15B5biEq7kfxv//LzRrI0svHbskXkxKjXxVOFfehm5mWH4Di7p/AQ9/RI
         c4BSjcJVhYP7TZAPcRkEa2EsF9RT6N5aq3FfFngWenTLPBiQLHkdtQ/thAsc1g//9/zb
         fREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C0aXSSH6jnOuUiW5h4DP/qn1ilfkml9FjlWglQ0fxfY=;
        b=BEglsV+jQaKnKN88r3aVE5TLHTIBzADeLn7ZPfzc/X5hdfPErvK5ItWvgtQyzVsEeK
         cpmQ+r9qrq/JI1BeC/1Qt+XlZmJAXxhnz76PGcmiEEGQe34P5eLHVPHoEX011WTXcp+2
         GsD9BUNJJLd1K5G4RkHVOXMJQDaEsXhDd2lcQwbRruXiaBasDdciIbJgmNs73rcTtcd6
         OxitM0Dh0nFA7QAQWu9Vv7iS3dxL0uAFYD31g1l9cOG9cN8r3Fhvwa5LBdz4Rbq3oOb7
         TMBwu9vSv44JNakFCBIoj8FhnpQXk6DoRLG8e69uYS5lxQXaZPEH2N37jqLDzLONN3WJ
         w/kA==
X-Gm-Message-State: ANhLgQ0ixrUXMC+nTj9chKHO8/wcjm2l+ckAoDk/ILk11rb/A1D/H/4u
        sxPyEUuI98lpm+lK2ClC9F+o
X-Google-Smtp-Source: ADFU+vseVdsHmsCD+UdMKpGktH3crnbZk2+DYLHURuVVukZble7QaNRJjwqQF55+XnCJWXdc2ZXDHg==
X-Received: by 2002:a17:90a:ab0a:: with SMTP id m10mr1054838pjq.173.1585243522867;
        Thu, 26 Mar 2020 10:25:22 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:518:654f:ac72:3cc0:da67:5ad7])
        by smtp.gmail.com with ESMTPSA id z7sm2129001pfz.24.2020.03.26.10.25.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 10:25:21 -0700 (PDT)
Date:   Thu, 26 Mar 2020 22:55:14 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     davem@davemloft.net, smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] Improvements to MHI Bus
Message-ID: <20200326172514.GA8813@Mani-XPS-13-9360>
References: <20200324061050.14845-1-manivannan.sadhasivam@linaro.org>
 <20200326145144.GA1484574@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326145144.GA1484574@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 26, 2020 at 03:51:44PM +0100, Greg KH wrote:
> On Tue, Mar 24, 2020 at 11:40:43AM +0530, Manivannan Sadhasivam wrote:
> > Hi Greg,
> > 
> > Here is the patchset for improving the MHI bus support. One of the patch
> > is suggested by you for adding the driver owner field and rest are additional
> > improvements and some fixes.
> 
> I've taken the first 4 of these now, thanks.
> 

Thanks Greg! For the future patches after v5.7, how do you want to pick them?
I assume that you'll be the person picking all "bus" related patches, then
do you want me to CC you for all patches or just send them as a pull request
finally?

Thanks,
Mani

> greg k-h
