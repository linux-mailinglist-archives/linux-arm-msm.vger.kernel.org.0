Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C35B5150EC4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 18:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbgBCRjs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 12:39:48 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41486 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728212AbgBCRjs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 12:39:48 -0500
Received: by mail-pg1-f196.google.com with SMTP id l3so4089079pgi.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 09:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8SjBXOY3uRTCT+6FTjNe2mLIwSVfUBt+yhLDpMSoa5s=;
        b=MT4xaDHTHHeUJv4+jorm+uJwLxl940jHZoT2OkFYfdt7ulAON26PYdfCOGw8np5NK9
         FzTVmxiegYkbp/9FE7VCDr5qjg4VDSaiy0Y33T9dqPyqwoO0ffogvcO5fhG8QNzjK6Pf
         YaI1O/A2d10lNU5BP+Yvj34UL754jPPLHbK1e5QZbTXt+/BjT9QFLCmA/EygymH6bCRu
         ZsbK+WEMcDJByo6j6NzjkUoTIwUGVGo6WID70v61ruNUGwP7pQm6bCTNBGzvWZ4FSJWb
         hL11nogwXAPtkSKWLK5DQIBDUBose7qu+zd3FISwpDpTPjvrdaXh4INHCJxDXI/C/JZA
         tlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8SjBXOY3uRTCT+6FTjNe2mLIwSVfUBt+yhLDpMSoa5s=;
        b=dpNbC+KHsGs3Nn80dVCKFaHIb5YNweuJ3+9SbfrtzQIKlpdT4jJG/YU54n00DK9d7G
         S52O1eg9bb/F1MCJRS0SfOL9AE1gnVlMlPDd9sGHuLjBrKeojyNEUgLToBfWxJfhIMWk
         irKzismsUu2viqiTtS23wc6JOuSplGUVwMZtXulzbrDed66Dfb36t0OMuMwlhEcc07pe
         r8THfEPwik7qei2ZAWX/R0ahSsd1syCVxk4qnWw6WMiB0tQOelw2IhY8U7mvZgIDLtD0
         6Qw/aZDGQDG2WESxh/rUDCw1SjvOCirFX032MwfawFl87TqS7LghaLOi0nFtEPaw2c31
         a8/Q==
X-Gm-Message-State: APjAAAVCl0f7c/VZEgx2H+9F8zm7a00VbPPkT9Llx0u4mifx7lKrXUOQ
        RoPZh4PJF1n2mWHkFDFJJPCjyA==
X-Google-Smtp-Source: APXvYqxGnYxuouypVln+vg5BXOsYjLKrNBTfeSXnORiI7w0QsthwJNyZxsFD2nFXEZ+tj3XVGfalFQ==
X-Received: by 2002:a62:e815:: with SMTP id c21mr12851690pfi.209.1580751587566;
        Mon, 03 Feb 2020 09:39:47 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m71sm552415pje.0.2020.02.03.09.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 09:39:46 -0800 (PST)
Date:   Mon, 3 Feb 2020 09:39:43 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jonathan@marek.ca
Subject: Re: [PATCH 0/3] ARM: qcom: add Nexus 5 bluetooth support
Message-ID: <20200203173943.GC3948@builder>
References: <20200129232031.34538-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200129232031.34538-1-masneyb@onstation.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 29 Jan 15:20 PST 2020, Brian Masney wrote:

> Here's a small patch series that gets the bluetooth working on the Nexus
> 5 phone.
> 
> For a summary of what currently works upstream on the Nexus 5, see my
> status page at https://masneyb.github.io/nexus-5-upstream/.
> 

Nice, picked up for v5.7.

Regards,
Bjorn

> Brian Masney (1):
>   ARM: qcom_defconfig: add Broadcom bluetooth options
> 
> Jonathan Marek (2):
>   ARM: dts: qcom: msm8974: add blsp2_uart10
>   ARM: dts: qcom: msm8974-hammerhead: add support for bluetooth
> 
>  .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 71 +++++++++++++++++++
>  arch/arm/boot/dts/qcom-msm8974.dtsi           |  9 +++
>  arch/arm/configs/qcom_defconfig               |  4 ++
>  3 files changed, 84 insertions(+)
> 
> -- 
> 2.24.1
> 
