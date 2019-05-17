Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25E4421C8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2019 19:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbfEQRex (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 May 2019 13:34:53 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36342 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727966AbfEQRex (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 May 2019 13:34:53 -0400
Received: by mail-pg1-f196.google.com with SMTP id a3so3623872pgb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 May 2019 10:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EQJ+i6iyywaiyvPH5Ae01aI539IGazdRX+wyFdAqzQ8=;
        b=aanZSxafrgKwxWZXR9j39vx1sCu33cNvgPcDwT6PxgjwJRrkJcbhwxhh51PE7RY2mz
         AY5Iycj6ZTO24RiG3PvHwStotGD451nVBIT6sjLw6Ynr4Ou4WW/nHdGQxnBOVgBrZ5wt
         ozAo5veCyhAikOq+8aWu4Ey164M3K+n2/Wa+P9oxiTOfyjTCPDn4hdKDtmWCFA86qyo1
         Axb84Btin+aZNsep3wfDD5JVAmugrkNPhN/KuwEUOBZq2kj1b2YI8MshZNcuDk1JxQjf
         NjjY5tUquuwM1gJhMUS6g7ErT/4PZfCb0DdUm/Ng7BhHzt3u3Jsd4i59RFgcck4Z4OUL
         UBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EQJ+i6iyywaiyvPH5Ae01aI539IGazdRX+wyFdAqzQ8=;
        b=bTdAqGAeVxt9oNUEZ9zYoEbKb9B7KZ8znGsX644UqXbooiMgiLFwW8VoqbYslq2HpM
         WpiYyKb/b4O06NbEHf8wlh7g3UzvrsyumWi6Prs3y95Wsy+/6b+6u/Ugwvp3yGF8kqNj
         jXoJn4fhy9MVc5J4g0qgTt44ChXdSeKuyQ5I3WhloAoQqloQPRGmxk9XcAFOO0R61QIB
         FKe9rPW8Y8mtGK7xRJHSDx1eQN6mQxCW+eWwDuTcds7iEEGWBQ5EpTtKDzxwmPti+6AI
         /ks5CO6cCWF63oEme+8bNEaSn4BsK9kzUdiXNCo4sDK73zOSgUsUe3Ku4psFh4njVP0l
         m4CA==
X-Gm-Message-State: APjAAAUgdNvCqUTiPvPp79NJj4V8vSmcw9+CfnwbJqPDrcKeTBUf4kbK
        6itsLJ7Ilq2oz6e7mTH5KI8ETQ==
X-Google-Smtp-Source: APXvYqwAR5v9g9Pj7oAhKsdMTbRAYpj8+edIonWgSGveknrjHzEQSgArD/o7pgLUsetiE0m+QRPAzw==
X-Received: by 2002:aa7:8e59:: with SMTP id d25mr61042439pfr.24.1558114492292;
        Fri, 17 May 2019 10:34:52 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p16sm26875608pfq.153.2019.05.17.10.34.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 May 2019 10:34:51 -0700 (PDT)
Date:   Fri, 17 May 2019 10:35:14 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [RFC/PATCH 0/5] Read-only memremap() proposal
Message-ID: <20190517173514.GM2085@tuxbook-pro>
References: <20190517164746.110786-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190517164746.110786-1-swboyd@chromium.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 17 May 09:47 PDT 2019, Stephen Boyd wrote:

> This patch series implements a read-only version of memremap() via
> a new MEMREMAP_RO flag. If this is passed in the mapping call, we'll
> try to map the memory region as read-only if it doesn't intersect
> with an existing mapping. Otherwise, we'll try to fallback to other
> flags to try to map the memory that way.
> 
> The main use case I have is to map the command-db memory region on
> Qualcomm devices with a read-only mapping. It's already a const marked
> pointer and the API returns const pointers as well, so this series makes
> sure that even stray writes can't modify the memory. To get there we
> introduce a devm version of memremap() for a reserved memory region, add
> a memremap() flag, and implement support for that flag on arm64.
> 

I have a few places where the first patch will be useful, and the rest
looks good.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Cc: Evan Green <evgreen@chromium.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> 
> Stephen Boyd (5):
>   reserved_mem: Add a devm_memremap_reserved_mem() API
>   soc: qcom: cmd-db: Migrate to devm_memremap_reserved_mem()
>   memremap: Add support for read-only memory mappings
>   arm64: Add support for arch_memremap_ro()
>   soc: qcom: cmd-db: Map with read-only mappings
> 
>  arch/arm64/include/asm/io.h     |  1 +
>  drivers/of/of_reserved_mem.c    | 45 +++++++++++++++++++++++++++++++++
>  drivers/soc/qcom/cmd-db.c       | 14 +++-------
>  include/linux/io.h              |  1 +
>  include/linux/of_reserved_mem.h |  6 +++++
>  kernel/iomem.c                  | 15 +++++++++--
>  6 files changed, 70 insertions(+), 12 deletions(-)
> 
> 
> base-commit: 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b
> prerequisite-patch-id: 62119e27c0c0686e02f0cb55c296b878fb7f5e47
> prerequisite-patch-id: bda32cfc1733c245ae3f141d7c27b18e4adcc628
> prerequisite-patch-id: b8f8097161bd15e87d54dcfbfa67b9ca1abc7204
> -- 
> Sent by a computer through tubes
> 
