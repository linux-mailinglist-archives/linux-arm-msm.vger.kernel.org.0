Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECD71A73EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 08:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406158AbgDNG5g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 02:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406135AbgDNG5f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 02:57:35 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 934C7C008748
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 23:57:35 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id y25so3374514pfn.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 23:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=q2jESVtXxhYH38LYW9tkhMflmHCStmCuPZYYIP7Auok=;
        b=lgU7dLDZ8GPd6/o+FxoFGW0xrmikpr9pxTDLUBLibyeqY52c52/V07LWzf6RywRgPx
         mGBr0lzXgLr+eNrQQGaVIdENtypNYRQDn9Tn/mW4E0L47bHx2oVpHXJAI5mREArUxqIa
         b/ATkvIxN22ECDKbLOxDDC1Qa/mPLLllnA1k4wMeOZeSImuf2kSRLYWC0W5A4dJbziUA
         H/o9kuft8xCN3F4h6Sqh7h7TahnKSRTsDa5a1HgLHpJ5i20Klq63aM9L9/XWb/EI+GXo
         7m2XCuCdlKFoXiF/33tM14AnPy9A++lFhg9VG54Wl+YrkoSn/+Ieiz/QvV5umWkAJEyA
         RdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=q2jESVtXxhYH38LYW9tkhMflmHCStmCuPZYYIP7Auok=;
        b=lqg7hWGdT0nwRUtmJziwKpZpvM/V+u3gt3dLr7F8YI0MeHn2p7hbSfZIIy6nK4CY6a
         rRepgBqaEuUdHLCZohZvTd3I906wYiE+YYmTYCVyI+opEOhaEzqjgOQO7mbGRg1bqneN
         11AJXLtobYOsEo7YoS+rH9O3LuTokfe19tnYsvNISV6LRWAQPLUesGpEA/GpJvzqcoMX
         hTUKfTbyfmagVRUXMvuygzcnHweCrnpvV2Cn73NKpT1yaD7z7t2Su1trYd+7htTll1A8
         vUnOqQ7XLEvrOyTOMH1Ca0anzqa0A4LP4jQh9VG+qvXHt/lTlhyAuBrWcgyxL9LpYkPd
         no1w==
X-Gm-Message-State: AGi0PuYsBwUGAMn3hY7U01zg2OuJX+cTH0joiOMjww+8ne9Q2PJfWYZ2
        op4ql6OeYLJRs2ouvaWrPLWQArjm4Gk=
X-Google-Smtp-Source: APiQypLz/nfBSW1lBv6C3GbzFRvOoPqv/0+vewJdOT2t7iCez7rtRBzCKxhQU28JpU/IUwWN0VWF+g==
X-Received: by 2002:a63:140c:: with SMTP id u12mr14135300pgl.243.1586847454873;
        Mon, 13 Apr 2020 23:57:34 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id w5sm10358588pfw.154.2020.04.13.23.57.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Apr 2020 23:57:33 -0700 (PDT)
Date:   Tue, 14 Apr 2020 12:27:32 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     sboyd@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/21] opp: Manage empty OPP tables with clk handle
Message-ID: <20200414065732.rwrbiv7ke3kwgeti@vireshk-i7>
References: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
 <1586353607-32222-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586353607-32222-2-git-send-email-rnayak@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08-04-20, 19:16, Rajendra Nayak wrote:
> With OPP core now supporting DVFS for IO devices, we have instances of
> IO devices (same IP block) which require an OPP on some platforms/SoCs
> while just needing to scale the clock on some others.
> 
> In order to avoid conditional code in every driver which supports such
> devices (to check for availability of OPPs and then deciding to do
> either dev_pm_opp_set_rate() or clk_set_rate()) add support to manage
> empty OPP tables with a clk handle.
> 
> This makes dev_pm_opp_set_rate() equivalent of a clk_set_rate() for
> devices with just a clk and no OPPs specified, and makes
> dev_pm_opp_set_rate(0) bail out without throwing an error.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/opp/core.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Applied. Thanks.

-- 
viresh
