Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3DFD3343BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 17:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233135AbhCJQxr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 11:53:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231645AbhCJQxQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 11:53:16 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC6CC061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 08:53:15 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id f8so11975577otp.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 08:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b5OsFLsp7m56spdf12qcM4cWVfhM/nC3ar1492J4bBk=;
        b=pSY+USRY/5bSpl876jK0iO9ZgJvP3YuC04e8B1CFzOjuqi5+zg4dIcnftxorVCbJFV
         jLb30qzPKlbmV3hVrYPauzB8OCJmooVeqwQHuqb9QxDiYUQC6Cv3hhnIFOcbKUa05RnO
         jtha2uWfmW45eX3N2mXn2rq+DnLOL3QP9c4BFq4qlOdwSXSZrbhcU8evktEtoSSpFaLm
         HN82GR2oTwuu+uS7wiFXxqbozYPM9/LoiWd9Xx4g4nJkEpGS1kzzFlAk6k0Upq1AFob6
         dFU2Vo9evZsQ1qNCFULuPK37t3BjQmTmvyLvDbtABNstuZi/4b3quV/Nvk7dRaAIEgoI
         lsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b5OsFLsp7m56spdf12qcM4cWVfhM/nC3ar1492J4bBk=;
        b=kdEKEDUcQ1W1bY3Df/vS51zyiZkmjJWRL1x6d/A6S7xuauo0idF3BF/mk5Z3AQJLLA
         tgJpvgh6vh/upQzXVhWydZXNOcmTTAltEvM0XMKm7jijheNWjLxdGYAZQgXqiYACoT8y
         xzVKgoxdOyx+SNQQ4Iecr7pte7IDmKnVsnRxbXzsm8kqltlAz8X+7Zzq1tVnRJDW3c48
         vtiz4N9i68Gfb2kfoCTs5MxVtADDnSHWhr2YMAHpdXQtKPZmVQ8K5DPmbpWK4uZzfdpf
         7+VoFgxAaJjAhQlyczRBdT5pvii0CABbrsDK0M5j5oafZ/JAnN71k4Et1TkLSF9BJtPW
         LO8A==
X-Gm-Message-State: AOAM5303v1SmUUngvyJlBkRij4bW7vV45yPdN4+IyB4hw/1gT4x4rYv7
        UAX6qQ2r8wXDlxpD35v32bN6sQ==
X-Google-Smtp-Source: ABdhPJyybtwilEZ80NzuRpbhuS30jVwwphHuM/KGS4ql9S4ZQIB+z+pvLnynfcBC7ti7yN9UJXBnFg==
X-Received: by 2002:a9d:86c:: with SMTP id 99mr3198096oty.71.1615395195080;
        Wed, 10 Mar 2021 08:53:15 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l71sm3943136oib.30.2021.03.10.08.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 08:53:14 -0800 (PST)
Date:   Wed, 10 Mar 2021 10:53:13 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Shawn Guo <shawn.guo@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4] pinctrl: qcom: sc8180x: add ACPI probe support
Message-ID: <YEj5eXKALP43Cf0F@builder.lan>
References: <20210310111210.1232-1-shawn.guo@linaro.org>
 <YEi3D2fCBh/azOnb@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEi3D2fCBh/azOnb@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 10 Mar 06:09 CST 2021, Andy Shevchenko wrote:

> On Wed, Mar 10, 2021 at 07:12:10PM +0800, Shawn Guo wrote:
> > It adds ACPI probe support for pinctrl-sc8180x driver.  We have one
> > problem with ACPI table, i.e. GIO0 (TLMM) block has one single memory
> > resource to cover 3 tiles defined by SC8180X.  To follow the hardware
> > layout of 3 tiles which is already supported DT probe, it adds one
> > function to replace the original single memory resource with 3 named
> > ones for tiles.  With that, We can map memory for ACPI in the same way
> > as DT.
> 
> You are reinventing a wheel, i.e. MFD framework. Can you simple utilize
> devm_mfd_add_devices()?
> 

But wouldn't such driver need to do exactly this, and then set up the
mfd cell and register it? So the new wheel would still be there, just
wrapped in more code?

> Basically you may write an new pure MFD driver (drivers/mfd) that will
> instantiate properly the pin control driver.
> 

In contrast to typical MFDs this would still be a single mfd_cell, just
with different set of resources, derived from the mfd device itself.

Regards,
Bjorn
