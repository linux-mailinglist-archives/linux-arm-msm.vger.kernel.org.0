Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06A3DAA5F8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 16:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732134AbfIEOe1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 10:34:27 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35101 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731769AbfIEOe1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 10:34:27 -0400
Received: by mail-wm1-f65.google.com with SMTP id n10so3368770wmj.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2019 07:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=DyTw9eXVQm1IWrN4WvbcEFv8xvh92gzUp05Bd1JROcs=;
        b=ko7ppxFDEAiwEELcyPLL5C3zPAEAP/lMXO+uEQEqEAh/yKcsyqip8+coBqZyqHjIFA
         M/2KxCRWGsALtstWQHuhxG6OQ3n9laBE/K9F04K5QJsO6nsOrYGdDP89FSVEPuNc1psY
         alB+gYnUEsvkUM7/zE7NQQW5cPDjZC/G9qM9ZKAG8o/wrFHFu8Gnnaydw1BjmoJfJS/9
         gxCgfejK0r/KxwyHjLNRb4jS3IbGmc45eY+YSQqAiy05rtyZoX7zwYaNx7Phu26maV88
         J2oUrNbH9eKAU8a5SX1eDBj5LyQDjPmkrYu6XHAF8ojfHZxzwRwVDEPhEJhthkDOyRol
         kTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=DyTw9eXVQm1IWrN4WvbcEFv8xvh92gzUp05Bd1JROcs=;
        b=mt7Fk0app/z3H+VQKYaSj17eKgI4FHfpv55DWawWaMbDrOf5X9FSGk1Q48tvbEzaLL
         NVm77/KoXs7Hg1IYTji4SHEIv2MsM+4QTwPncCDkCqkJpgY0Wl+hSVwzTXVTmUNA/zGw
         BxVg1kCnXEopXdnrOorEDkNEEnLiRy5uKzG0Y1zkr+CQSfSG3vsyYnqJXVqgxyUlzbTj
         JI/rMuthLVC47vR/OwHoIXqmryEwPRDIFOARGx1Ls0QG8/sPq3Iz7zCyY5cpmjrr8qGf
         adj5ik8Ez/7iSd8n+KCxgI1Pz4r60hKyFv3M4nsZ2c2AgOk+6s/052gnRHJ0UEX6DPa6
         F0Hw==
X-Gm-Message-State: APjAAAUSEX4YPA5PeNBTLvzi+1+w1Sl52d8ydZl11FNHdQF3hl3jf82z
        hHCvfbdyuSGqxKYBINuBNCMvrg==
X-Google-Smtp-Source: APXvYqypIINRLr/tdc6ZE4OP7FqGeS1CGF1Dknw14T3cDFuJ3wEbHIo7XY5x44yBErUXQfIEAM9puA==
X-Received: by 2002:a1c:cbcc:: with SMTP id b195mr3552405wmg.80.1567694065295;
        Thu, 05 Sep 2019 07:34:25 -0700 (PDT)
Received: from dell ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id l1sm3058017wrb.1.2019.09.05.07.34.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2019 07:34:24 -0700 (PDT)
Date:   Thu, 5 Sep 2019 15:34:23 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     alokc@codeaurora.org, agross@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, vkoul@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: qcom-geni: Provide an option to disable DMA
 processing
Message-ID: <20190905143423.GG26880@dell>
References: <20190905075213.13260-1-lee.jones@linaro.org>
 <20190905075213.13260-2-lee.jones@linaro.org>
 <20190905091800.GD1157@kunai>
 <20190905092816.GD26880@dell>
 <20190905134338.GF1157@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190905134338.GF1157@kunai>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 05 Sep 2019, Wolfram Sang wrote:

> On Thu, Sep 05, 2019 at 10:28:16AM +0100, Lee Jones wrote:
> > On Thu, 05 Sep 2019, Wolfram Sang wrote:
> > 
> > > 
> > > > Fixes: 8bc529b25354 ("soc: qcom: geni: Add support for ACPI")
> > > 
> > > Are you sure? From visual inspection, I don't see a correlation between
> > > this commit and the fix here.
> > 
> > This patch should have been part of the commit, or at the very least,
> > part of the set, alluded to above.  Unfortunately, I was carrying
> > Bjorn's hack which simply returned early from geni_se_rx_dma_prep()
> > with an error, so it masked the issue.
> 
> I still don't see why this basic ACPI enabling code (not touching DMA
> but only clocks and pinctrl) causes and additional handling for DMA. Am
> I overlooking something obvious?

Please ignore, I'm discussing with another patch in mind.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
