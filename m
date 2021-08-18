Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503C53EF8BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Aug 2021 05:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236456AbhHRDi3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Aug 2021 23:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236297AbhHRDi2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Aug 2021 23:38:28 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED29CC061796
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Aug 2021 20:37:54 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id m26so774364pff.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Aug 2021 20:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CIqXxZQMTfYf4KMWVdTMecbn2bp1Cy3dF+snZnUCor0=;
        b=M4aL//HWus/ItMfUDjKFkNtL6bXZ+RaJqIQS2scGji60+vB4vhgzGtpnPTCO8fvrTr
         bRLJwf0SDFdMZh0b/z/T/Og7loudWl/gY4/scDaiXq1N26UH19zvEEaYg7MUJPpqlZ3a
         XIjQdgc3G77Tm5K/f/fwD4RNjzVcbQuyCAA1yeavivJz/6xpvhUO1/iN/tvjYjCm6zcF
         XUdaKe/Ty30DX5wiDKtJ2KAg45mm3+ec7gc7O8Yofn+L/rATdz0E4/I4j0pPKqYf7cVx
         q0BUYgmvmVqdgwBgSalrYNsB0z/TU8At6SFePmn/lJPAGBhCujBgA3Gd6b917AqUxklw
         M5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CIqXxZQMTfYf4KMWVdTMecbn2bp1Cy3dF+snZnUCor0=;
        b=fiPu06XpeQt+MCoVT0M75wq+0O3gJi9QKBYH8/4hOsnwPTiZ6pmPLSb1nyCpsQSQfn
         Qw4veIFoYkQkvgX1x8+bKb11NAmf3RidznqGwhQ7aOX5BbSn2bleoaOrFUE/ozRBcqYX
         BtnK7YZ6LQdQ3gFPKTB94LIP1VCpLBosSaN44pTPsTnhu8zesYpgZk/aKGS8cbPCsM3d
         GPftCUFgr9v4GjzT9o1tJ3lK6WEUOYUIi0R4V7gnEbaGnwWfqKKNKUpZ2Fc94OqATmZK
         iR6rHRJH7PicQLyIPLEvUYkiwYGpbUuMQamrWRBQlcQaE4nctZNtdfe7QBVVPlzu5Ep3
         //lQ==
X-Gm-Message-State: AOAM532bhVOocd4HFFqA1KJwdwDzMXAW46HI9tL04fEt7wUbYDgIgTkt
        SdywSRcdlZHtVsowtmuL6YWZWQ==
X-Google-Smtp-Source: ABdhPJzOGxsw50WI5481yu1W8E5V0EvRZ+mP8uNqjTo8rrInZA/Ke2EUBvabuKvfYMAk2yI2gnDwsQ==
X-Received: by 2002:a65:64d1:: with SMTP id t17mr6676899pgv.291.1629257874429;
        Tue, 17 Aug 2021 20:37:54 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id h22sm4018298pfv.76.2021.08.17.20.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 20:37:53 -0700 (PDT)
Date:   Wed, 18 Aug 2021 09:07:51 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, rjw@rjwysocki.net, robh+dt@kernel.org,
        steev@kali.org, tdas@codeaurora.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [Patch v5 3/6] cpufreq: qcom-cpufreq-hw: Add dcvs interrupt
 support
Message-ID: <20210818033751.uulg5tgwfddmwp47@vireshk-i7>
References: <20210809191605.3742979-1-thara.gopinath@linaro.org>
 <20210809191605.3742979-4-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809191605.3742979-4-thara.gopinath@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09-08-21, 15:16, Thara Gopinath wrote:
> Add interrupt support to notify the kernel of h/w initiated frequency
> throttling by LMh. Convey this to scheduler via thermal presssure
> interface.
> 
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---
> 
> v4->v5:
> 	- Changed throttle_lock from a spinlock to mutex to take potential
> 	  race between LMh de-init sequence and reenabling of
> 	  interrupts/polling after a thermal throttle event.
> 	- Other cosmetic fixes as pointed out by Viresh.

Applied. Thanks.

-- 
viresh
