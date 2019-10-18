Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEA7DDBD78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 08:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404548AbfJRGFd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 02:05:33 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35931 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387805AbfJRGFc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 02:05:32 -0400
Received: by mail-pf1-f193.google.com with SMTP id y22so3183534pfr.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2019 23:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kV1HX3xh/tQvI6WiE4yR07HXyvimZNgOnLXkscZ88j0=;
        b=rNoBCmIeaRcA1mrVqUxdH4pw/8j8IkEbk/qw1GX4lANW4AX0Dk5+RJOhz36wh9oq7+
         MlNa34bkncIwzByQSEY7SGN6S3l2b9voQ25gO6CTHGdrMkHziCSO/G+rYztKGsdG+Kc0
         W5bEBveWq6xSfTorbPOyy9Ghsr5c4df/muiu2SZXdq2tuJ+nvMVyxpeesVh8RmTUaEfw
         bnRS3c32sRD4Kg8FxY2QpzCI8WLLlE4wIK6CAYgwCxK/wu5ta0K2LT5vx4Q0ZPDcMQZy
         sxBHPnVcsw5RnJ0L8kMJhv6CdtY8Gbd8uGinnz70GAlqYaHuPSYxpei2xNm1aFCVaOdo
         7a8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kV1HX3xh/tQvI6WiE4yR07HXyvimZNgOnLXkscZ88j0=;
        b=QVt9fy59Ultj9Jmrcoo6P3fatI9eOtjcudyJ4PmAV0GDInxO2vMAFaf40yUO4DKw+C
         g/xSml7IZZRwoc9b3M8hsOpS8eiO2Pq/i0KDpL2QiVZkeOrMMuBQ6spiUrYY8cf0sybA
         9s6oO+9SE5oDEQF1f1RDU5i9c+A6BjZXHix18iN87nHYXLP7cjc5HLOxPBwCThyM+mlr
         zWxQnG+hON0YuLIrcFWFsV4Ktkax0FGZvt1GCQHFKbBDtd9r1MjM3I4JsRcXcW2zjSBD
         5nuX5hUTIp8UtxwpwJP9q6ZKsDrGkbPeE6lvh83CCHzbo24hr1VDY/+TE0UVqCfMDXh0
         O0Mw==
X-Gm-Message-State: APjAAAXSqsMbyf6OJeJBFBWU++HU1DEW3SOmjeEHmIj07N3EdJOLmRAn
        NvCmnuGhJnCvHlILuM3O4R4KIQ==
X-Google-Smtp-Source: APXvYqyAFLFmNyiYOrRfv+ueuvIzGLlZ4cM1uXHv4BljYJWlUgaHvWI4mlFH93ITuT0Ecs9zIOHg+A==
X-Received: by 2002:a63:4525:: with SMTP id s37mr8470239pga.148.1571378731948;
        Thu, 17 Oct 2019 23:05:31 -0700 (PDT)
Received: from localhost ([122.172.151.112])
        by smtp.gmail.com with ESMTPSA id s10sm7537837pgn.9.2019.10.17.23.05.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 23:05:31 -0700 (PDT)
Date:   Fri, 18 Oct 2019 11:35:29 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, sudeep.holla@arm.com,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        tdas@codeaurora.org, swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>, linux-doc@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 1/6] thermal: Remove netlink support
Message-ID: <20191018060529.a5dmredz3baotaaa@vireshk-i7>
References: <cover.1571314830.git.amit.kucheria@linaro.org>
 <cc1b26eb9efa974bc4d36a2944d4064df0c37983.1571314830.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc1b26eb9efa974bc4d36a2944d4064df0c37983.1571314830.git.amit.kucheria@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-10-19, 17:57, Amit Kucheria wrote:
> There are no users of netlink messages for thermal inside the kernel.
> Remove the code and adjust the documentation.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  .../driver-api/thermal/sysfs-api.rst          |  26 +----
>  drivers/thermal/thermal_core.c                | 107 +-----------------
>  include/linux/thermal.h                       |  11 --
>  3 files changed, 10 insertions(+), 134 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
