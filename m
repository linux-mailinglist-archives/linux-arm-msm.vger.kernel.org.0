Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E250D31ED98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 18:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234650AbhBRRra (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 12:47:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232410AbhBRPqq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 10:46:46 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0FB5C0613D6
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 07:46:03 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id m2so1382073pgq.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 07:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Cn9DcIA9AN/PH1bnsLrw3E0sYTBmikm1mlLSEa4gBbY=;
        b=w4jPWHfJ0axD3jdPfZ9w/vGksv0PG41cYknVMb5Jus1JbW12FWeQDJF2+pcApVebQj
         jyHew4Ef8fcUlkrdj3IVLE5kg6FpM46q/z9aWvU84UJ4Wx+2BBvc/QSpVUoN1iZCBpfm
         xzrQyRp4cJ0n6k1CeV47QfXgzbe4MefUQ+rmuCdVvndjKGlQ189yhZP7JLd22vxdVvn4
         aeue3o/8M9lnnPjCuhQ7EswLzE/ey/HI56ScZ1VKKmFMpt78hr8jWperxv/IH+iu2xNm
         r1sfE9+w5X7ZC8eJfEq40J6SMm+EAiUU5XnwHEtUCnCcyfpMgiXYZE65KDMheWZmcaJj
         ouxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Cn9DcIA9AN/PH1bnsLrw3E0sYTBmikm1mlLSEa4gBbY=;
        b=SefMaAyrr/3KglcDJL/BLOVtd01nFJcQvxuyQbOf+UbTdiSTT8Lo9uEMCVUGcKXjcc
         qbyT58CgDVWH5NsMXlYoLoZD6Sf+bgFuX3YyG30baBf6Ukok9Tx2AL2nXCWEaE7beFLQ
         hLL/Q4EotfLj9BZkEuG2H4BwjB9uEBU40Pam28XPI3EXJPp3lN7aE9A9xaamhKeabr5/
         FAN32R5+poUQJ2Z0ec7THRUzFd3KtGZ7BM+HRk2DH517KFBCQc2RBWG77GE5l88Kgw1J
         DEvNz2AcrxDMC6J4IjH9bWlSioOVynGyGVclFTkXdMGj1ZxgJgxw6BPbI4yn8Fiduwo/
         U+Fw==
X-Gm-Message-State: AOAM532LQHS+SYJX2yRqLX2lNKXwiOETGeczxl72mTxCJxAD5r00BEqP
        NCJ4JledwOXHSX40h2xFIMjINw==
X-Google-Smtp-Source: ABdhPJy/ov6x/wJtjo+ZianbOXvKUJce+395QEvFvkq0/j4Yxe2OmzzygjWihqYA9y/RhdpiovURug==
X-Received: by 2002:a63:2947:: with SMTP id p68mr2677635pgp.113.1613663163320;
        Thu, 18 Feb 2021 07:46:03 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id s22sm6484397pfe.133.2021.02.18.07.46.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Feb 2021 07:46:01 -0800 (PST)
Date:   Thu, 18 Feb 2021 21:15:58 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     rjw@rjwysocki.net, bjorn.andersson@linaro.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: exclude boost frequencies from valid count if
 not enabled
Message-ID: <20210218154558.zrcymny7y64y3raz@vireshk-i7>
References: <20210217000013.4063289-1-thara.gopinath@linaro.org>
 <20210217055029.a25wjsyoosxageti@vireshk-i7>
 <4c9d9d44-5fa5-3ae1-e9bb-45cf6521b764@linaro.org>
 <20210218084847.743rttqwlmwyx6pz@vireshk-i7>
 <d693d999-7734-3e69-edb9-9e03fd2f0d1a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d693d999-7734-3e69-edb9-9e03fd2f0d1a@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-02-21, 10:03, Thara Gopinath wrote:
> Scheduling a notifier for max frequency change from the qos framework should
> do the work, right?

Not that, but we need to increase/decrease cooling states at run time,
create sysfs files/directories, etc. It isn't worth it.

-- 
viresh
