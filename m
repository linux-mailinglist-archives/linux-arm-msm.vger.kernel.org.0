Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337F1204F6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 12:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732227AbgFWKoh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 06:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732172AbgFWKog (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 06:44:36 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771C6C061795
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 03:44:36 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id i4so1388262pjd.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 03:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dqfTmGA2mr5owmX+JGgs4wffhJI7qn1ybWwfAl5Tutk=;
        b=qEhagxofi4lJjgjFsYM/B4xrt5iSXZggcDW/kcsd+R9YlLkUfQ6qUaM9vbBGQchmRq
         UKJPIpGbwvei4iG3Q2PHL2yOADHfnNxAvy+q+ZEL1N/ym8vu7FGmA3Mif+7VIpVKqB/A
         UkwROGWtz2qkjpSJ3R7vXdhB30+TsJdvlPvi0630ubrDAfwhayEUYp7t0nX1GTOCIoKa
         50x1AYl9qqHgwJtoVqgmR+L/7VkoFMLfsuP16aEg2CRfwQTfflF+JBY6KzfSJozQZJJO
         mcoOR7vA98wtpPeKHaKdgEHntcZ7RS5iQjei36/YlU3tvaenW8Y36whnb2nlaF2JUUlm
         rT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dqfTmGA2mr5owmX+JGgs4wffhJI7qn1ybWwfAl5Tutk=;
        b=Jp3WfJQGz+JIDSm/w1XnKYl0+I/CIXfT6g2E8z9Zb8YZ9hoLMhdS2fUtoem8d3ArzB
         bvnLahXsF0hbDBnC3/1I/RX2RQBWYGKNR1/W8LB6KkrIRel9hndF3UXPy2HgzDCaU8e8
         UyeBPPNlT4SD/3pVmYee7ynyLFLL8Ncq9OeymPpFUBhAfpjONftJp3DOZS1RQsM2nA03
         DXNK2eToP7yXxkl8hfSxbNCk29dOGivQXJfFAuBKRCT8Rmxuos0RL0nt8S/p3S8/wIGK
         OkzgcrCPpr1eGZkBph611chB5ixYoZqB3rYJuVCrcO/l0M7WIX7qbUcLWVPXI5tcykTV
         4wLA==
X-Gm-Message-State: AOAM530h9iwmpemUBqMuJqgkho7qvCqyxt4t/gZvPchrZDsTULBhJWhO
        3mvDeCuNhrrJCYH3QYULYUDAig==
X-Google-Smtp-Source: ABdhPJx9+rNoGm24t+RpfH7bcHHY3qoa0VPMsj1T3NW/lZd6uiuTe2Ua9qxjs0tXPhyzFqgCwOhM4A==
X-Received: by 2002:a17:90b:1292:: with SMTP id fw18mr21924791pjb.183.1592909075801;
        Tue, 23 Jun 2020 03:44:35 -0700 (PDT)
Received: from localhost ([122.172.111.76])
        by smtp.gmail.com with ESMTPSA id j19sm16484355pfn.109.2020.06.23.03.44.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jun 2020 03:44:35 -0700 (PDT)
Date:   Tue, 23 Jun 2020 16:14:33 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     sboyd@kernel.org, georgi.djakov@linaro.org, saravanak@google.com,
        mka@chromium.org, nm@ti.com, bjorn.andersson@linaro.org,
        agross@kernel.org, rjw@rjwysocki.net,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dianders@chromium.org,
        vincent.guittot@linaro.org, amit.kucheria@linaro.org,
        lukasz.luba@arm.com, sudeep.holla@arm.com, smasetty@codeaurora.org
Subject: Re: [PATCH v6 0/5] DDR/L3 Scaling support on SDM845 and SC7180 SoCs
Message-ID: <20200623104433.ok3vepuc55m7bxoi@vireshk-i7>
References: <20200622081649.27280-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622081649.27280-1-sibis@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-06-20, 13:46, Sibi Sankar wrote:
> This patch series aims to extend cpu based scaling support to L3/DDR on
> SDM845 and SC7180 SoCs.
> 
> Patches [1-2] - Blacklist SDM845 and SC7180 in cpufreq-dt-platdev
> Patches [3-5] - Update bw levels based on cpu frequency change
> 
> V7:
>  * Fixup comments for correctness [Matthias]
>  * Initialize icc_scaling_enabled to false [Matthias]
>  * Make use of the increased per line character limit [Matthias]

Applied. Thanks.

-- 
viresh
