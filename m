Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11FC63EAF0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Aug 2021 05:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238648AbhHMD6X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 23:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238634AbhHMD6W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 23:58:22 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B085AC0617AD
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 20:57:56 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id oa17so13441791pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 20:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MvmuwhxcqYAbdPmkTIufV5uQRwUnrxELEdSjPA9KrXo=;
        b=eOwiRNh4MUanAxbqTJMBRZCZfu41L9y7gdH60FKetDLsqWzSItkABZc2JszeZ82opI
         bfkEzhtcD2es9gu2FAoDAUD+8r0bgLFFKMlRuYwEIbemol70oWZxCO31WcLOv5eMCRNa
         CJz0KsyMOp6WuJk25J8DqIzQcqdedVyC1mhgHbhFE87rdyadBI69e49/dXtQgjr5nbwK
         VwFZ8KAWt5PmbX1zUdzO5/uHS77AD+9oVD4cjLD1dgCyEgN0HdYt+pNQ9evzQR5Xju/D
         A2Cbwl1uAfUjP6ecqadlbt+ewPMPfQYRiHSWmx1YWwU4/vp+unPk39FFAHC70KWSX+1c
         sUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MvmuwhxcqYAbdPmkTIufV5uQRwUnrxELEdSjPA9KrXo=;
        b=PYLIcNfAfjaYvLj0AFKoEa9TRT3rzHilZUgHL/B4vTKl/0wX58VqIdPecuUv4NfAxl
         XJyAcQXllMzH975+lqBaS78V7vhZHZaeGomF8lER8b/x4FfQCqbkc0Sr7RRT+aiMpwYx
         Cc462Ps3n0OyyBkHPagz74kObuY9+8DL6gIa7zmFNyd5JT3uOG5l4K3OJWbC66zGo6m7
         OhpkhBArY9lgj9xrlT+w2YO6jqMVN5WFWUSLc261MX30z2kAWx0HqKpaloPUgmcH70nl
         ih0xFLSibPbRfZaFx0mfl2t0gcN7ysROvSTgCQIIJ/tXTyRpnu7Q3d8fiBIkFKtXfBq0
         tyAg==
X-Gm-Message-State: AOAM530wbIeZFVxE/ae4eiiLZr2zCRu7pM05L0hA8zz6yjnFkATD+9W5
        j5XYmv0O2ohDIx5vRC7j//xVKg==
X-Google-Smtp-Source: ABdhPJxRDakJcVqHqBRWt5r47fIPr4C/oo8C0jNq80oWE8P2YNHnQVm97OlAzna+HWJyBkUGtgz+2g==
X-Received: by 2002:a65:44c3:: with SMTP id g3mr421133pgs.233.1628827076146;
        Thu, 12 Aug 2021 20:57:56 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id x1sm299780pfn.64.2021.08.12.20.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 20:57:55 -0700 (PDT)
Date:   Fri, 13 Aug 2021 09:27:53 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     ulf.hansson@linaro.org, bjorn.andersson@linaro.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org, rojay@codeaurora.org, stephan@gerhold.net,
        digetx@gmail.com
Subject: Re: [PATCH v7 1/3] opp: Don't print an error if required-opps is
 missing
Message-ID: <20210813035753.7b6ye4yzztmp2ly7@vireshk-i7>
References: <1628767642-4008-1-git-send-email-rnayak@codeaurora.org>
 <1628767642-4008-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1628767642-4008-2-git-send-email-rnayak@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12-08-21, 16:57, Rajendra Nayak wrote:
> The 'required-opps' property is considered optional, hence remove
> the pr_err() in of_parse_required_opp() when we find the property is
> missing.
> While at it, also fix the return value of
> of_get_required_opp_performance_state() when of_parse_required_opp()
> fails, return a -ENODEV instead of the -EINVAL.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/opp/of.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
