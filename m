Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 680DB3F19F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Aug 2021 15:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232821AbhHSNHJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Aug 2021 09:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbhHSNHG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Aug 2021 09:07:06 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 560F5C061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Aug 2021 06:06:30 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id y11so5439287pfl.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Aug 2021 06:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZUuW6CkvogNC0GIMX+IQPONt7G2cLV90jQ7k/cU6WLo=;
        b=tf/HLOQY/32g5RxLsMgCbrCbZDkzKVH4iF2ZSAmdbBGISvFXk9vHoSL1dg+SMbm6DU
         K9N466tC0ovKSLD5KJUcWVpfkJLxtbwo+YRofnPuoJmXRYYMMsq4SBMaUltyo1CuQQpl
         mcrDXXXbp4YABMQIGyEoWivERBzrMDTZ5BguFUgUz4HS/cbshGswy45BDPPCs22wDTLp
         NsCMUe1NXh/npYtCMmJdNRs3xjVMx0yODbOwA7p7VMiIGhmJ+4ICdfqf8J4ZCsNTA7mB
         Hdw7Cf8Gapq8zasc/36S79LXnK/9TgBtVg8TWswH4MbTMiobLZ3ed84BRCkOC3IaCbDu
         nwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZUuW6CkvogNC0GIMX+IQPONt7G2cLV90jQ7k/cU6WLo=;
        b=XWkwhhNJd53OgYG2Um4dfM0PfEV/wGY4WCRn8ig5svMIu3nr2bBzi73Qm8QdmtTJKP
         vxJjU/OqVBrcg6C1CKAQujtZpVEnGH9N+ShijUev1NATJ/71zpw2+pr458yhMKhOUWDz
         R9yLcbQE9romq8xjmR41ei80N9jZmpAtdYetgOld4xFXhfcnlDjKw3SJLF2ApYBGhfOx
         ZPT7PK2IRC3vp01zTTLdJ2+ULJoXrC1MWQY0fdFr5QIn9kFxHEdPDViLVDqhvCDROO0P
         p7qbp7hB3zmvIZi7ob6YmyfOPUpIi56JPQjq8sTv5+wumReQL7cUuWrkrYASuLuSr9Gy
         Srhg==
X-Gm-Message-State: AOAM533gX0IS40sgzCs1jkqtGv+1PSx5qquTEG3AviEHJoBpwk51ijCx
        y9rELdcwQ2KuzqgwYsiv8qDn
X-Google-Smtp-Source: ABdhPJx0Esfl/ZnW3okg0FVANmoc2rkKbzXPAvQstEHgv6gVgEP8FpM2X783udwvgLVHUTym9ud0Uw==
X-Received: by 2002:a63:510a:: with SMTP id f10mr14064796pgb.249.1629378389545;
        Thu, 19 Aug 2021 06:06:29 -0700 (PDT)
Received: from thinkpad ([2409:4072:6298:4497:5a1e:ff34:9091:5bac])
        by smtp.gmail.com with ESMTPSA id oj2sm2944717pjb.33.2021.08.19.06.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 06:06:29 -0700 (PDT)
Date:   Thu, 19 Aug 2021 18:36:23 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     kishon@ti.com, lorenzo.pieralisi@arm.com, bhelgaas@google.com
Cc:     linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        smohanad@codeaurora.org
Subject: Re: [PATCH 0/5] PCI: endpoint: Add support for additional notifiers
Message-ID: <20210819130623.GB200135@thinkpad>
References: <20210616115913.138778-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616115913.138778-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 16, 2021 at 05:29:08PM +0530, Manivannan Sadhasivam wrote:
> Hello,
> 
> This series adds support for additional notifiers in the PCI endpoint
> framework. The notifiers LINK_DOWN, BME, PME, and D_STATE are generic
> for all PCI endpoints but there is also a custom notifier (CUSTOM) added
> to pass the device/vendor specific events to EPF from EPC.
> 
> The example usage of all notifiers is provided in the commit description.
> 

Ping on this series!

Thanks,
Mani

> Thanks,
> Mani
> 
> Manivannan Sadhasivam (5):
>   PCI: endpoint: Add linkdown notifier support
>   PCI: endpoint: Add BME notifier support
>   PCI: endpoint: Add PME notifier support
>   PCI: endpoint: Add D_STATE notifier support
>   PCI: endpoint: Add custom notifier support
> 
>  drivers/pci/endpoint/pci-epc-core.c | 89 +++++++++++++++++++++++++++++
>  include/linux/pci-epc.h             |  5 ++
>  include/linux/pci-epf.h             |  5 ++
>  3 files changed, 99 insertions(+)
> 
> -- 
> 2.25.1
> 
