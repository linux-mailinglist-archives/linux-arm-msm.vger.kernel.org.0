Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 302C71D0FEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 12:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729420AbgEMKgI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 06:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728258AbgEMKgH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 06:36:07 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D06CC061A0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2020 03:36:07 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t40so10781700pjb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2020 03:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bHAK9rmg4ihryn7dWy8ERefZSMD9WKN9yuq0hlEY9T0=;
        b=XjfoER6qp1iV1JqqLmfkTcI3Z7RDnvj/2ICf1lwSpxxHDE5FddSKtVM17vQO18ZZaN
         jnRbjSVlMNLVPTMuaIbpvO2MOp+Aq+wkqwMxJe5JSBicRPZ4dqx7sfodGdE8zHNVqAVz
         qGKaqSLtkKfJijyD5uPmde3oOXy/of90NOpokyBJbH1+8gfB1pVMRMPvAXepCPPhSni7
         M7subFU0CaX2HRWZT40mTwE5iXPwEWzeZupNafcYvP7tuN3xZnccEHpZDRUOu5V90uLo
         rRuqTZMAJzX4ToxZwFCJecpPJZhh0ULlTEigXSoYO23N/rMpuxAvu9XsePAUZQmtLLwd
         d81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bHAK9rmg4ihryn7dWy8ERefZSMD9WKN9yuq0hlEY9T0=;
        b=kKdT/39Elle3huLIJ+e75kYXTnv59k4bN3/0L7aedqf6JaYnUUkocHss+5ptiDun2F
         0PHNaQMLN17IzPWTM1zQAOlVj2xwVrbeHykkuWU832kUdNtAVGS6cRlG/yxR1SmSpKiS
         kvTKFDxtRyOOS9TOvXhLglQLZjbbUdeDnexs6nUeX3cdtACDA1QocdnBT5M+PqdsLQdy
         AT06trL2OIHrdsAKX03CvB2jZjfeMUfX9yTwrGK6Df7H84CwkcVd0ARiETs592qsDOTv
         UGGxhCPBbwJmHWEoF+jVVHeo8I6yzQ9Hpu67G/GeFFWzVVCCdCE9zfR01gmZF9GnQvaF
         mWPw==
X-Gm-Message-State: AGi0PuY6filN2cnqVCx2ezxes9lsY07qArgymkfp0ZziO/5+yTna4339
        WN66tgiEau+zWJ9Udxw5/iXc
X-Google-Smtp-Source: APiQypK3ZXYzJtX6IQyIn7TmvsTPLK4dq5VNn8Vas2uExOsTkKPen59d4IMG1DlB4FFPZW8xoS1NEQ==
X-Received: by 2002:a17:902:eb43:: with SMTP id i3mr22140341pli.299.1589366166527;
        Wed, 13 May 2020 03:36:06 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e1c:3d5a:d8ce:4edd:4c38:4a1b])
        by smtp.gmail.com with ESMTPSA id q21sm14208349pfg.131.2020.05.13.03.36.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 May 2020 03:36:05 -0700 (PDT)
Date:   Wed, 13 May 2020 16:05:59 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
Subject: Re: [PATCH v1 0/5] MHI Misc Fixes
Message-ID: <20200513103559.GB26866@Mani-XPS-13-9360>
References: <1589248989-23824-1-git-send-email-hemantk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589248989-23824-1-git-send-email-hemantk@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 11, 2020 at 07:03:04PM -0700, Hemant Kumar wrote:
> Patches are addressing MHI core driver bug fixes. Patches tested on
> arm64 and x86 platforms.
> 

Applied to mhi-next!

Thanks,
Mani

> Hemant Kumar (5):
>   bus: mhi: core: Remove the system error worker thread
>   bus: mhi: core: Handle disable transitions in state worker
>   bus: mhi: core: Skip handling BHI irq if MHI reg access is not allowed
>   bus: mhi: core: Do not process SYS_ERROR if RDDM is supported
>   bus: mhi: core: Handle write lock properly in mhi_pm_m0_transition
> 
>  drivers/bus/mhi/core/init.c     |  3 ++-
>  drivers/bus/mhi/core/internal.h |  4 +++-
>  drivers/bus/mhi/core/main.c     | 38 +++++++++++++++++++----------
>  drivers/bus/mhi/core/pm.c       | 53 ++++++++++++++++++++++++-----------------
>  include/linux/mhi.h             |  2 --
>  5 files changed, 61 insertions(+), 39 deletions(-)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
