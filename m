Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB912F7DD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 15:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732038AbhAOONc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 09:13:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731957AbhAOONc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 09:13:32 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC77CC0613C1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 06:12:51 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id i6so8630206otr.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 06:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=408lnKE4uwqEZS3Lx4O9NO/RpZq3O+rWUdDPyfRlupI=;
        b=DnZoxc51s8XqlXus1kRsH/l2WSiexb/+Xw1xJkJHbF9r6ooRHLWHYha+uzcnEkwctk
         KGA4dJRz/Lb7yq/NutYm35X7dy6Cnh5+iky28vBj9vLrVIQ6NdXCWPHckzdbbwPyp+/T
         rToIaD9AWunaAlanQBbkiCQUMvkUAn8vVKnHVuHv7B3bPlvKiM5UJkvAbumSMbjT5Tpr
         PBdU0KF03alWtVUYdYajeVO3MLGdY79bE6kXv2poUfx4+4t1YpOZWUErzUQawLhNYSp4
         iAogSWtyJhTs7q3nUlM0RSkf4eFQJdvoTUO9m8Q3tlg5QiGRmJ/I9rhQ4t8fws5wMYf8
         z6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=408lnKE4uwqEZS3Lx4O9NO/RpZq3O+rWUdDPyfRlupI=;
        b=XWApcDtNVILekXcRzxkKfDmNPJy1B6h2bROCzn6RvtTHgqS6iwetqIuKt7L+EEuYYd
         lhJHoUCQt7Sf6GtKxDFspy7h1vL+WeqBkOtf5GKOM8VzwERXyaxQU52knMbqdkccCcqN
         a8W78WpoaG5YFz7Lp6Yi05qCvt164RlBSPXYwuvUi8AQs+gJhwxyxQ9qgS3Jt36s2qZt
         7KLezBkcsGSuGr1FtwKILxh3FMQcofNj+81xXCduskz1AJMd8C0CQ7kB1wXWwDWol4rL
         STgCXumdKXSNy7367VNZ0C4ubkUUT1Z6HTQx8cOAb6TEh7gQecv8EQpsHFG/1SqnPs4W
         IKGA==
X-Gm-Message-State: AOAM531+rP0dj617Pk71ns3w1ePtmanxQ2JshLGHJT4uvuEFfC5t8DS/
        JnzDXHrvSDkdnRwoTKjyfw2cRA==
X-Google-Smtp-Source: ABdhPJzOV2VCbP2OGrGHgdeSCFbvOuMGqpwgee0DF+7Ty59/kol2V6S2ApNCyNYHcd2JG9h8QGg7QA==
X-Received: by 2002:a9d:7f81:: with SMTP id t1mr8564174otp.166.1610719971063;
        Fri, 15 Jan 2021 06:12:51 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j22sm1906414otp.45.2021.01.15.06.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 06:12:50 -0800 (PST)
Date:   Fri, 15 Jan 2021 08:12:48 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: qcom: add URS Host support for sdm845 ACPI
 boot
Message-ID: <YAGi4N26BUdTeIPA@builder.lan>
References: <20210115035057.10994-1-shawn.guo@linaro.org>
 <87mtxa1gb9.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mtxa1gb9.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 15 Jan 07:27 CST 2021, Felipe Balbi wrote:

> Hi,
> 
> Shawn Guo <shawn.guo@linaro.org> writes:
> > For sdm845 ACPI boot, the URS (USB Role Switch) node in ACPI DSDT table
> > holds the memory resource, while interrupt resources reside in the child
> > nodes USB0 and UFN0.  It adds USB0 host support by probing URS node,
> > creating platform device for USB0 node, and then retrieve interrupt
> > resources from USB0 platform device.
> 
> just so I understand this: the interrupt was listed under a separate
> device altogether?
> 

Correct, this seems to be the standard structure for a role-switching
usb controller, as shown under "ACPI System configuration" at
https://docs.microsoft.com/en-us/windows-hardware/drivers/usbcon/usb-dual-role-driver-stack-architecture

Regards,
Bjorn

> Nothing wrong with the patch itself, but just curious.
> 
> -- 
> balbi


