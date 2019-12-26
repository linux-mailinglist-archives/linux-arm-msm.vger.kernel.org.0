Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF61512AE1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2019 20:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbfLZTBC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Dec 2019 14:01:02 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45139 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbfLZTBC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Dec 2019 14:01:02 -0500
Received: by mail-pl1-f194.google.com with SMTP id b22so10752262pls.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2019 11:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sKQGR3Y9ZuT+GSwwu9eznDqy2WWfte9UQ+0KNkkzAxk=;
        b=hs/GWraxJbhlVWLQfZcPf2AkuAt27ITg23eVhx5slTXjZDmmGDT18wTrueDpo8m0eD
         8d8nydd5QR4XNM4RlO0OI/H2a1NFTgxHehliFMY9dUOV0FnX722XY/AzHNyMTNOKskze
         /E/RT0Ktig+uyz3qru8cFDQRsT9VwFN3cw+wI6TpLLSnHoeonM+S6NRQvi+2fypakTkM
         PrUUoJgiek7czSCleZJgOzdjGXzkBRJH3QnkJ5ngcvkj6u6XoS9+f1jkj2Iqo7lQ5Irk
         zI9gQ2FQsUULdbacEegcJC2mNQge8fWvBNmK8wds1h3AOBjTI0R7QlvccbBfnSIHahdX
         0pcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sKQGR3Y9ZuT+GSwwu9eznDqy2WWfte9UQ+0KNkkzAxk=;
        b=VlhpucjJmyMtGDURp6LWGIL9mShj6X+NslCRlCOEFd03bk4f42PE081jiH+98MQCE7
         KCh1Z4oytCu1LNWH552yOIXL8U+C8V1Kx8rFl1Iheo1mZK/aByym9OaEZ272KKRIsOKg
         U1fdfsOAwGa/JY8iz+A0IyFFo3BahNVOqTCygXz0LbkBrvr9Hd2i1ie+VeXQOGfwr40u
         NEun797fbHqXPIFUDyrSwe/qbH3jj1+iQ0kGzEXMfNjvOIbWgti5DrLCRkKdeq8dcH16
         fdRKWYJlsCX/5h69CT8IvrKqFwVUaUcTi8hLMTtH13Y4CnR6yEVh8A0F3HCIIiQiC+lJ
         pDhQ==
X-Gm-Message-State: APjAAAXgncvoy3EshHb3aVxj9K8UJJICXH81gUVHWGubM/m2ioeD0hv3
        YC8GLpq+YPkc9tDnuPSs++/ogg==
X-Google-Smtp-Source: APXvYqzatM2elI5CdG4rtWQkuXM2/c5RjjfQZe6wfRlfMUYQEpcvtNgqLOYkooMoSJhAoTdOsq80fw==
X-Received: by 2002:a17:90a:3742:: with SMTP id u60mr21741452pjb.29.1577386861619;
        Thu, 26 Dec 2019 11:01:01 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q64sm12081353pjb.1.2019.12.26.11.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 11:01:00 -0800 (PST)
Date:   Thu, 26 Dec 2019 11:00:58 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     David Dai <daidavid1@codeaurora.org>, georgi.djakov@linaro.org,
        evgreen@google.com, sboyd@kernel.org, ilina@codeaurora.org,
        seansw@qti.qualcomm.com, elder@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 3/4] interconnect: qcom: sdm845: Split qnodes into
 their respective NoCs
Message-ID: <20191226190058.GL549437@yoga>
References: <1576475925-20601-1-git-send-email-daidavid1@codeaurora.org>
 <1576475925-20601-4-git-send-email-daidavid1@codeaurora.org>
 <20191226184803.GA26712@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191226184803.GA26712@bogus>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 26 Dec 10:48 PST 2019, Rob Herring wrote:

> On Sun, Dec 15, 2019 at 09:58:44PM -0800, David Dai wrote:
> > In order to better represent the hardware and its different Network-On-Chip
> > devices, split the sdm845 provider driver into NoC specific providers.
> > Remove duplicate functionality already provided by the icc rpmh and
> > bcm voter drivers to calculate and commit bandwidth requests to hardware.
>  
> This breaks backwards compatibility. Is that okay for all 845 users?
> 

Yes, based on our discussions surrounding adding support for the
pre-rpmh platforms, we concluded a while ago that we would like to
attempt to move to this structure instead of the originally agreed upon.

So we haven't merged any consumers using the current 845 binding in the
upstream Linux repository.


I'm not aware of any other public repositories that relies on the
existing binding.

Thanks,
Bjorn

> > Signed-off-by: David Dai <daidavid1@codeaurora.org>
> > ---
> >  drivers/interconnect/qcom/sdm845.c             | 1122 ++++++++++--------------
> >  include/dt-bindings/interconnect/qcom,sdm845.h |  263 +++---
> >  2 files changed, 606 insertions(+), 779 deletions(-)
