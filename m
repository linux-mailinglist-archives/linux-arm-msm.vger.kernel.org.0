Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59EDC303468
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 06:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732509AbhAZFYX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 00:24:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731449AbhAZB42 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 20:56:28 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD06BC0617A9
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 17:55:46 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id d1so14784819otl.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 17:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9KzooEzNJudfs8vdN5QNNjT5ojSccFf8tRCUDI4AzCU=;
        b=DrrZxszCva3FTmhjfGLJzJrc3wB1j9Eo1KC1LtQ1FsXEAot/Ybv1blTIhPyYfOyNgm
         T+EnnqpzXEgGxvkc5i5z3xWPJFSweRtK1ezOLRhZqB9KkPfVkAJgZe+QbwttIrq6o+KV
         P037KGFPglzPjXgxTXJS39oLXUzxdz5TXf6EzvuL3hKV7vjf1eejNoUmuw3U2b6RzyQZ
         L6Q3IVVx+LIhLxC56CMMwW7q/y3HgIeMJ1R3w4HPKVYpiGvapKZzdhqMPfXaWX6WiDuO
         WGSGo6/tKzYFvFHEgNt/XsbxjzZZ32UPz4bALilazsw8kaZcw0CPfmpBk9M+MS0mnh39
         dFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9KzooEzNJudfs8vdN5QNNjT5ojSccFf8tRCUDI4AzCU=;
        b=ShoukFSGZJzQjr4YNCBW69tEOCym+SfDqgP0JoxP2cu2idYLfhXDb5ogfCHmBmIhGx
         QLDqBm1MyTYaL9yMrHqRO4+9dskM6QKk6RYn0witDRFQIambDimdjEjt9g2urUxcFr2U
         8V3a3tAFn4pNCU9CdbQ8G2+NXH3hLJWTKyALypGF6sOj8/HUAX6N5g4Eqlpm2FrMGlOH
         RsK7X2UPqV1nTj744diwYrncIIUtpII8F03fCVs5YvFtEH+Kt7j8ADfNFVgdZlHg3lpo
         1Hlwmkbf77wanJddQm1p4H4yc95xI0/1xEmg4U3El5mouTzyofwsdeX3MP9mYylpRUY5
         YTvg==
X-Gm-Message-State: AOAM531t3kTmcf2kAr/TfMVTVQePzNtpbHQXZAzPyL8ajRn2YOaxElTN
        Fb8idjZnUkh4GhLwiCbEcYir3V2VVxBXBQ==
X-Google-Smtp-Source: ABdhPJy0I4DahIrO5X9v/d1v+VookruyQO2N2rKgJW3rTf5Kc3BH3ob0xCJT8rOz43pd7Lzf+gYM+A==
X-Received: by 2002:a9d:4e89:: with SMTP id v9mr2322939otk.171.1611626146046;
        Mon, 25 Jan 2021 17:55:46 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id d10sm3570160ooh.32.2021.01.25.17.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 17:55:45 -0800 (PST)
Date:   Mon, 25 Jan 2021 19:55:43 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, peter.chen@nxp.com,
        jackp@codeaurora.org
Subject: Re: [PATCH v6 3/4] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
Message-ID: <20210126015543.GB1241218@yoga>
References: <1611288100-31118-1-git-send-email-wcheng@codeaurora.org>
 <1611288100-31118-4-git-send-email-wcheng@codeaurora.org>
 <YAsHbj/mITeiY5Cq@builder.lan>
 <724cb274-36ce-fb48-a156-4eaf9e686fdf@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <724cb274-36ce-fb48-a156-4eaf9e686fdf@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 25 Jan 19:14 CST 2021, Wesley Cheng wrote:

> 
> 
> On 1/22/2021 9:12 AM, Bjorn Andersson wrote:
> > On Thu 21 Jan 22:01 CST 2021, Wesley Cheng wrote:
> > 
> 
> Hi Bjorn,
> > 
> > Under what circumstances should we specify this? And in particular are
> > there scenarios (in the Qualcomm platforms) where this must not be set?
> >The TXFIFO dynamic allocation is actually a feature within the DWC3
> controller, and isn't specifically for QCOM based platforms.  It won't
> do any harm functionally if this flag is not set, as this is meant for
> enhancing performance/bandwidth.
> 
> > In particular, the composition can be changed in runtime, so should we
> > set this for all Qualcomm platforms?
> > 
> Ideally yes, if we want to increase bandwith for situations where SS
> endpoint bursting is set to a higher value.
> 
> > And if that's the case, can we not just set it from the qcom driver?
> > 
> Since this is a common DWC3 core feature, I think it would make more
> sense to have it in DWC3 core instead of a vendor's DWC3 glue driver.
> 

I don't have any objections to implementing it in the core driver, but
my question is can we just skip the DT binding and just enable it from
the vendor driver?

Regards,
Bjorn
