Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F70F200203
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 08:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728274AbgFSGj4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 02:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgFSGj4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 02:39:56 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBAC8C06174E
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 23:39:55 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id u8so3684079pje.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 23:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7sRNA5t46z2+Vw5dTLhOnt0D6hJ3/EDS35wJqG+ipTA=;
        b=u8PkVgISYK38GQgY9s9N3f4Rd7P8PjV7RtuSdmGHOP/LdQXvM655bHlscCJgr1CaEL
         qoaI62k9FQ3Di9E+3hhRaX2edgNfo7gKNZty8PFF1qewrysQaFeR1ITZfLh5hK/UGpWp
         1wzAz+Jd0UNwUhxjScqjgh0SEjPu+iJBSq8hyGGOgO+Zn/c8k/QJbx08hDwZxYCGiqB+
         vOI0W0YCf5UfoAtVyrmyRVHt7IldPigvJysylywAFKV134ixSwUpICz4SsCRfG/ilkmi
         oL048i2auZyv4GYtJcwUS1zkmnOOSIFeuItLM5ztPW+sncqlQzlwQCm8IYYh5apuoPYN
         bbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7sRNA5t46z2+Vw5dTLhOnt0D6hJ3/EDS35wJqG+ipTA=;
        b=GZ+7h9XKFtZqjkLuKUWLZdOgKt656Yh3hITJpUIh1cYhnPEsZ06YP1QFbHd8bU9iKD
         4toxWbe9pYhKWPfMAjBNTHHTrbVB3hOTvIBF6OTUe8ciww6wJpB7auj4eGXF0ReBazji
         kYP/96rzMVY+hx2igTLTtiiJcTa1qSyTgTmWk2U14fIF3LbgLzncp+ebaZ5JNcrZbzch
         d//B+gdzqPwLiROBBQIykTSvq1bzUODjAvHvButh4xZaRRY2FQZgjea3T03FeSWa9riK
         8vQLWVunon0WV9vuadckhm7uzabaLT8s1I6RwkD4rXqyWuTzXsrB74+E7D9rSbVDHJ9h
         1x8w==
X-Gm-Message-State: AOAM530Tt2QDhN6T4GYpxkWknTTbof7R/8k8fp0/anrbR1BKhDf00z0+
        LAxrkBO5nwJayst2qMuexekr
X-Google-Smtp-Source: ABdhPJx1kwwIfkS2hOuOlWMoEDDJMbQde7KpqQcHz0j+W8E5cq0kssU46YAqA5e0gM4Gx8ScKNL1pQ==
X-Received: by 2002:a17:90a:df82:: with SMTP id p2mr2090233pjv.217.1592548795242;
        Thu, 18 Jun 2020 23:39:55 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:59f:c065:651a:bc24:a9bb:ff41])
        by smtp.gmail.com with ESMTPSA id z9sm4161456pjr.39.2020.06.18.23.39.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 23:39:54 -0700 (PDT)
Date:   Fri, 19 Jun 2020 12:09:48 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
Subject: Re: [PATCH v3 3/4] docs: Add documentation for user space client
 interface
Message-ID: <20200619063948.GC3245@Mani-XPS-13-9360>
References: <1591899224-3403-1-git-send-email-hemantk@codeaurora.org>
 <1591899224-3403-4-git-send-email-hemantk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591899224-3403-4-git-send-email-hemantk@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 11, 2020 at 11:13:43AM -0700, Hemant Kumar wrote:
> MHI user space client driver is creating device file node
> for user application to perform file operations. File
> operations are handled by MHI core driver. Currently
> Loopback MHI channel is supported by this driver.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> ---
>  Documentation/mhi/index.rst |  1 +
>  Documentation/mhi/uci.rst   | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 Documentation/mhi/uci.rst
> 
> diff --git a/Documentation/mhi/index.rst b/Documentation/mhi/index.rst
> index 1d8dec3..c75a371 100644
> --- a/Documentation/mhi/index.rst
> +++ b/Documentation/mhi/index.rst
> @@ -9,6 +9,7 @@ MHI
>  
>     mhi
>     topology
> +   uci
>  
>  .. only::  subproject and html
>  
> diff --git a/Documentation/mhi/uci.rst b/Documentation/mhi/uci.rst
> new file mode 100644
> index 0000000..a5c5c4f
> --- /dev/null
> +++ b/Documentation/mhi/uci.rst
> @@ -0,0 +1,19 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=================================
> +User space Client Interface (UCI)

Stick to 'Userspace' everywhere.

> +=================================
> +
> +UCI driver enables user space clients to communicate to external MHI devices
> +like modem and WLAN. It creates standard character device file nodes for user

UCI driver creates a single char device, isn't it?

> +space clients to perform open, read, write, pool and close file operations.
> +

poll? Btw, you need to mention explicitly how this char device can be used.
You are just mentioning standard file operations.

> +Device file node is created with format:-
> +
> +/dev/mhi_<controller_name>_<mhi_device_name>
> +
> +controller_name is the name of underlying bus used to transfer data.

underlying controller instance.

> +mhi_device_name is the name of the MHI channel being used by MHI client

What do you mean by MHI client here? Are you referring to userspace client?

> +to send or receive data using MHI protocol. MHI channels are statically
> +defined by MHI specification. Driver currently supports LOOPBACK channel
> +index 0 (Host to device) and 1 (Device to Host).

s/index/identifier

And explain a bit on how this LOOPBACK channel is getting used.

Thanks,
Mani

> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
