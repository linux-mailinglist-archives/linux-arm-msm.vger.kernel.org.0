Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 346E135068B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 20:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234940AbhCaSll (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 14:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234511AbhCaSli (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 14:41:38 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60C38C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 11:41:38 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id kk2-20020a17090b4a02b02900c777aa746fso1726821pjb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 11:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eHryObDlQoQqR0/siBVZr1azXXg1oRB2Pr3besjuv5A=;
        b=tDAfMMzWp+hlRWjqlF4Wbdu9lbQyszPH6+Ywc8iiAbuDVbHYQcmDCCWlreLSn+XS5M
         h1UxPmzArbJktkOy5Xe3KZwlz5ANn7ZhP8d6PGq4MQ7oO+wCHs3XNw39FTiNmGhO4Xou
         nYOabDBXb2+FEYrTByhef4pSOZqh1oqi1dYe/UphRtCwF2hG3ASmvg51B+17YhcFBtxk
         Z5vh43fOFoOHCbnR5aBzODiuqkHyLZ4LMKMB8yWNSMYK7Vc/4vPAxkwd1CuQUPjRA7wQ
         Io6i5VpuIXK8V1C2rDercATpcuATIJzs7s0jzQfNop7HSluY1GT6Rb3iMIPpr8qn9vq0
         hU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eHryObDlQoQqR0/siBVZr1azXXg1oRB2Pr3besjuv5A=;
        b=oHJKKOytm9gWQOpc964DnLZ3807IDR4cAQoOKGwHc28Bp9qXMnup+0Jn+FnLSND2AH
         4VXSkziwBggeZCGS93W1tB2kMmWXmYOiQAD+Aj0c/GrfvwtRt4P1JxGW6nE3D9RmJeZ9
         RNkvtx4CYq+t3fo60IibR39qoBMvDApTkeP7VShqOd20r7YFqFJzlXMk6GLL5XgUrtZh
         2N92ugU6mlTwtCh8i4K+3FK2tQSSATgp/7YYok6P/3reXvTeh1PmFCx1P6qJ/r/LNThw
         z0ykj6OBVPiUg/ZmzM0AkmuCUhMPkwjn64JE/J0FxFGdO+KxWbBRyEpDRBAgtyOpwvND
         h4yQ==
X-Gm-Message-State: AOAM533hcRZFmvflIoWGXmMAWWGiMKbP7UB0gq2WKVwbdd2D5EiF56BJ
        JBmKbYHs881mmCifL/Zstltm
X-Google-Smtp-Source: ABdhPJyfFJXLvpW4VVw7TNint36ZkQW/r0lzFgCZVObif5MG9HkcA/tQIAeEn1CmkSSnqogtaoWtnA==
X-Received: by 2002:a17:902:ec89:b029:e7:1052:afef with SMTP id x9-20020a170902ec89b02900e71052afefmr4459903plg.64.1617216097895;
        Wed, 31 Mar 2021 11:41:37 -0700 (PDT)
Received: from work ([103.77.37.129])
        by smtp.gmail.com with ESMTPSA id t205sm3165176pgb.37.2021.03.31.11.41.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Mar 2021 11:41:37 -0700 (PDT)
Date:   Thu, 1 Apr 2021 00:11:33 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org
Subject: Re: [PATCH v6 0/2] Polling for MHI ready
Message-ID: <20210331184133.GO15610@work>
References: <1617215665-19593-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617215665-19593-1-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 31, 2021 at 11:34:23AM -0700, Bhaumik Bhatt wrote:
> v6:
> -Fix return error code for mhi_poll_reg_field()
> -Do not recode when returning from mhi_ready_state_transition() if polling fails
> 
> v5:
> -Use fsleep in place of udelay or usleep_range to accommodate better delay use
> -Drop patch for polling during RDDM panic path as new API cannot be used there
> 
> v4:
> -Added reviewed-by tag
> -Return appropriate error code from mhi_poll_reg_field()
> -Fixed bug where mhi_poll_reg_field() returns success if polling times out
> -Added an interval_us variable in mhi_ready_state_transition()
> 
> v3:
> -Removed config changes that crept in in the first patch
> 
> v2:
> -Addressed review comments
> -Introduce new patch for to use controller defined read_reg() for polling
> -Add usage in RDDM download panic path as well
> 
> Bhaumik Bhatt (2):
>   bus: mhi: core: Introduce internal register poll helper function
>   bus: mhi: core: Move to polling method to wait for MHI ready
> 

Applied to mhi-next!

Thanks,
Mani

>  drivers/bus/mhi/core/internal.h |  3 +++
>  drivers/bus/mhi/core/main.c     | 23 +++++++++++++++++++++++
>  drivers/bus/mhi/core/pm.c       | 34 ++++++++++++++++------------------
>  3 files changed, 42 insertions(+), 18 deletions(-)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
