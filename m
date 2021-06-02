Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C061398765
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 12:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232446AbhFBK6E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 06:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbhFBK4v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 06:56:51 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8DBEC061345
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jun 2021 03:55:02 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id i5so1957860pgm.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 03:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NZdovLMjeOEfJmAhmYGaJ31BCe71BNnC9oUwaJkqSrw=;
        b=O/1vU5AxxVDZZF1+hU/NgXTkHZ3FuCQYKTNDUSIdM+u9x8C76gjYFO9uifh/W01Qvg
         UP98RuizPULtCPTUlBwSfHnrxFEiByqVQTrdMNkBmI55odOzJnv6Ol9QUCKmtHmyCJUT
         6jqzEzOkniJcnI+KB7FjWgKJTf7Sv82q7ahlaXU57xZ0aj6M/I67a2xv29sl4/mxz3/4
         s2CF+cVaEfCS/g+KF/inXCV2Dm49w7NTLyiFctj73UIHqn74C7CZ75LxXvSlbDuKmnl3
         Dpbydm26eMsPrgqWTOAQik5nCAO9Wook0MMZzY3Cofwc0CEbbiguq9/5H/mhcUWK+7h3
         yRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NZdovLMjeOEfJmAhmYGaJ31BCe71BNnC9oUwaJkqSrw=;
        b=oy69heNLGMplnPgogRfmao5eaZKw4l1StPfmrq1oh5pTMGq4zLprzBCspxhtbJtMyp
         umFT9LEe0hLjcYZml57Ujbj01TvRTekvJhQfLh+2yWKBP2vmth3xI/vfU5WKO3QDuWQd
         sGZem1p2aA0vTBBdOZud8EMYGTdoIcRdC2E7ndsL+anAxYAhUnrWwubzDRUeyQmRiUpB
         jkd+79y59cgQLChSwMhsmSCcnGYAQzCWB7rMYE3KSChgfhOK6iGPnLz4M+mHaRyp9PHr
         6m1PqJ1+m1HjsErVz7IY88Emc58zkdojFBBWsM6oMPe9w6QZfNxPKMjfxHNpTkRlzIks
         Mglg==
X-Gm-Message-State: AOAM533TRrWL06/G5j6h7MO4JBYZllFbS4NG1LLO1SMZ8YDbMGSr4h2b
        e2RkRSH3rraIlE1LlT48xuz6FQ==
X-Google-Smtp-Source: ABdhPJzyaUtOl98TdbUkufZPcXhESdOOzueuiitqLnGjCTo4/ryVSeu+8QHy/+vUiSMwbrnzaFEgYg==
X-Received: by 2002:a63:7e56:: with SMTP id o22mr3361120pgn.278.1622631302311;
        Wed, 02 Jun 2021 03:55:02 -0700 (PDT)
Received: from localhost ([136.185.154.93])
        by smtp.gmail.com with ESMTPSA id p15sm16177139pjb.8.2021.06.02.03.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 03:55:01 -0700 (PDT)
Date:   Wed, 2 Jun 2021 16:24:59 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: power: Introduce
 'assigned-performance-states' property
Message-ID: <20210602105459.t3ptci42lgvrzqlx@vireshk-i7>
References: <1622095949-2014-1-git-send-email-rnayak@codeaurora.org>
 <1622095949-2014-2-git-send-email-rnayak@codeaurora.org>
 <YLYV3ov/iBffZMg4@gerhold.net>
 <20210601114426.3vhh2twocqx254b6@vireshk-i7>
 <CAPDyKFqmBoMwQkWHT-w8A2=PeXeDgxE8n=D4prdEyuxM+ZOAaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFqmBoMwQkWHT-w8A2=PeXeDgxE8n=D4prdEyuxM+ZOAaA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02-06-21, 12:45, Ulf Hansson wrote:
> Alright, so it looks like we already have the DT binding that we need for this.
> 
> That leaves us with the question, at what place should we parse it
> (call of_get_required_opp_performance_state()) and set the performance
> state for the device?
> 
> Does it still make sense to do it while attaching the device to the
> genpd, you think?

For parsing, yes this is the right place. For getting that into
effect, whenever the device is supposed to work, i.e. with runtime PM
somehow.

-- 
viresh
