Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FFFA1E1A9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 07:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725771AbgEZFOD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 01:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbgEZFN7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 01:13:59 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9F27C03E97E
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 22:13:58 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id a13so8190411pls.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 22:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4VaJbqmoVs3kDuOV3hXkyeC/R0SlSKpA5bywa/qymjU=;
        b=Pe7iiJlfYaBthFYuPgYlsz4js7ZWiC+r3tQx/ZOWc52ffKkHYtL1RmTwQe4u0aRZmO
         5w9qjfCF79uHcDBBk/J5R4iOKY5335vnRwjQGdkznOpJIrGKAfMvBPscq/JRLaCZg+wI
         FZY+wlQPugQ3vm0GMW/omwGEDc5Vk1lRzDDeEjW3AUyGHoFOomfwN9MzPKDWEXUMSdh5
         zJ0MbD96TNPVOKUcufQqIxX3m85Ml8ED7rYHI4/xmmiTzipoPQlDTOQLE0k0JgR/pubK
         49dLZjMCMKKR69p6FzrNl1tJ6zHmOxcpQXmplbGxVf+Y0Z8FUT95nVGwCCWDJ9Y+5X0V
         71gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4VaJbqmoVs3kDuOV3hXkyeC/R0SlSKpA5bywa/qymjU=;
        b=QYVlgt2LFtFYXeF430S9uzR0/D7q9N/Px/UzgsE4oxuZaYmoSCDI0pTZh6lqsiNf7r
         KBZ4kaBzdklqB2ug+oHwBpWKaoLp34DQXIw+vHcrQ9dgEfU2F0CrgS0PyXcyglbtQGor
         3HmXNgKpw3DN7wjUDsQ70EYrjbzYAPNuWda888VgTKB6+AHkr+RPYZR+hkIr92k2V/Bl
         aYVQtGG31duzsXiCH9DQDsXQ+b5yv6lFJAZneeRTa/7ntndzSM9skg/Z+z3FkM6JfYQn
         q9UhtFep9ZBHsjNSvp8WEMInjBrQFuohgzXpJ+t1T1iqlPwjFm+A2oqon68pfH4xpbnT
         ej9Q==
X-Gm-Message-State: AOAM533G6Q6MJ5/CuYTs2H5SZPTlcjV5+lCVAOwKN8A1pWmCF67SMFly
        4o/uM5GqFdTD90dDH9VMes5d
X-Google-Smtp-Source: ABdhPJyyMIty4jsOfOOrU0Ey9Jkv8FD2LtJiWhFTz7CiCSeSOhSjti+s/rvDzqQMkSYvVQK/V/usvQ==
X-Received: by 2002:a17:90b:f0a:: with SMTP id br10mr23781612pjb.145.1590470037786;
        Mon, 25 May 2020 22:13:57 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:206:d4db:a08d:52b0:cfbb:a01f])
        by smtp.gmail.com with ESMTPSA id 84sm14041092pfv.157.2020.05.25.22.13.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 22:13:57 -0700 (PDT)
Date:   Tue, 26 May 2020 10:43:50 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     jassisinghbrar@gmail.com
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org
Subject: Re: [PATCH v3 0/3] Add Qualcomm IPCC driver support
Message-ID: <20200526051350.GA8131@Mani-XPS-13-9360>
References: <20200520084854.19729-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520084854.19729-1-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jassi,

On Wed, May 20, 2020 at 02:18:51PM +0530, Manivannan Sadhasivam wrote:
> Hello,
> 
> This series adds mailbox driver support for Qualcomm Inter Processor
> Communications Controller (IPCC) block found in MSM chipsets. This block
> is used to route interrupts between modems, DSPs and APSS (Application
> Processor Subsystem).
> 
> The driver is modeled as a mailbox+irqchip driver. The irqchip part helps
> in receiving the interrupts from the IPCC clients such as modems, DSPs,
> PCI-E etc... and forwards them to respective entities in APSS.
>     
> On the other hand, the mailbox part is used to send interrupts to the IPCC
> clients from the entities of APSS.
> 
> This series is tested on SM8250-MTP board.
> 

Any update on this series?

Thanks,
Mani

> Thanks,
> Mani
> 
> Changes in v3:
> 
> * Added Bjorn's review tags
> * Few changes to DT binding as suggested by Rob
> 
> Changes in v2:
> 
> * Moved from soc/ to mailbox/
> * Switched to static mbox channels
> * Some misc cleanups
> 
> Manivannan Sadhasivam (3):
>   dt-bindings: mailbox: Add devicetree binding for Qcom IPCC
>   mailbox: Add support for Qualcomm IPCC
>   MAINTAINERS: Add entry for Qualcomm IPCC driver
> 
>  .../bindings/mailbox/qcom-ipcc.yaml           |  80 +++++
>  MAINTAINERS                                   |   8 +
>  drivers/mailbox/Kconfig                       |  10 +
>  drivers/mailbox/Makefile                      |   2 +
>  drivers/mailbox/qcom-ipcc.c                   | 286 ++++++++++++++++++
>  include/dt-bindings/mailbox/qcom-ipcc.h       |  33 ++
>  6 files changed, 419 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
>  create mode 100644 drivers/mailbox/qcom-ipcc.c
>  create mode 100644 include/dt-bindings/mailbox/qcom-ipcc.h
> 
> -- 
> 2.26.GIT
> 
