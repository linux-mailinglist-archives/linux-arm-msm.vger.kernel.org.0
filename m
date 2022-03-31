Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA204EE07B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Mar 2022 20:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234557AbiCaSeI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Mar 2022 14:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234548AbiCaSeH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Mar 2022 14:34:07 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD06C1C16FD
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 11:32:16 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id d15-20020a9d72cf000000b005cda54187c3so495010otk.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 11:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t6GsqwNN9llZCnAliYpOilY5j9SHoFYzbGwsekdtfa4=;
        b=XYn4Prc7x7Wi0lnnkWc4y98ocH9lAtL/28wpaZwgzRg4BI4YGIrPG7wIlzCXxjqyNY
         k3WGyiFN5UA9k1BmqJPJLUv8BPxVmuTpjSs+RZr3/VELAJ6Z6AcMrALui7s73PJjngT0
         0y44DKaVWVk5krVho5gepvYG6wgoCz+z/ME1/b3Pi1pM8kf8KmeCWA/xgS7X7sQz9TG+
         JchT0nwF9cTscAFn1bZrG2xYXqKQ/y3gDUMA3vye2BDSsLUtTbo4y7JA9/jSESu4ZJL9
         WS+V0bHPEa0qyul0WFwqAuU9CmAsXcfM0HTzQXpDOhQUN1RSwFQSbeYfxQLz6o+Q19DY
         +ZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t6GsqwNN9llZCnAliYpOilY5j9SHoFYzbGwsekdtfa4=;
        b=pyNfSlxGiwFI4KbhB56wbuZb3sd59NkzNPMxw/wanF0pseTwqUfIJ8GglSljgZMZpG
         ItbJMkzE/iQEzqDGedaMKhtuPazlQq7FpwAjP0u5Qrv0B9jMZ23qfJQM4z5bPZ3Oc4Qn
         EwA19lSQkH6g8trcVVE7tb/1VV+iGdKp4WqMtsZ9DS3cOPUyYMUjYfT08Tn7f4jXPxp5
         X9rvhrgd6FeQ0ibfUkMdCPxMUVMgh5W6uLjB36CGjc+WzB70hsxI6DgJanXFALhQmOUX
         En8+x1YGN6uT79CRHkgsAeMiiXq8kNfuK0y+w9eCaxs0Xd3BH56T24h6Lbew+oQfI314
         HNzQ==
X-Gm-Message-State: AOAM532Y6S8cmB9tjgwBBSdwH9OA0K76oXt4hy7qg2Zy63E0NJdTHduU
        0YUfuUIXHvwpAiBGx4goEpRLbQ==
X-Google-Smtp-Source: ABdhPJz26GMP6kACUt//jU5Az91bnlmsy5wYYd312LDn8aDW6jY3j9fs4jPdZV2Yqp9tCIl7SyygEQ==
X-Received: by 2002:a9d:6409:0:b0:5ad:2055:9bdc with SMTP id h9-20020a9d6409000000b005ad20559bdcmr6171517otl.93.1648751536168;
        Thu, 31 Mar 2022 11:32:16 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id s125-20020acaa983000000b002ecdbaf98fesm64878oie.34.2022.03.31.11.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 11:32:15 -0700 (PDT)
Date:   Thu, 31 Mar 2022 11:34:45 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Thara Gopinath <thara.gopinath@gmail.com>
Subject: Re: [PATCH v4 0/4] cpufreq: qcom-hw: Fixes for cpu hotplug support
Message-ID: <YkX0RQ7Re7J/iG+d@ripper>
References: <20220326155153.7377-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220326155153.7377-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 26 Mar 08:51 PDT 2022, Dmitry Baryshkov wrote:

> This patchseries aims at fixing and improving CPU hotplug support on
> Qualcomm platforms. First three patches are the fixes for the LMH
> support in the cpufreq driver. The last patch adds support for
> lightweight offline() and online() callbacks which are used instead of
> exit() and init() each time the CPU is put offline or back online.
> 
> Patches 1-3 being pure simple fixes can be applied during the -rc
> stage, while patch 4 is targeting next development cycle
> 

Viresh, please consider picking up patch 1-3 for v5.18-rc.

Thanks,
Bjorn

> Changes since v3:
> - Readd throttled_freq calculation disappearing from the third patch.
> 
> Changes since v2:
> - Point Fixes tag from the first patch to the correct commit
> - Replace huge patch 2 with one-liner thanks to being able to use
>   policy->related_cpus instead of policy->cpus
> 
> Changes since v1:
> - Update commit message for the first patch to describe why dropping
>   affinity hint is required (before calling free_irq()),
> - Fixed commit message for the second patch to include messages
>   generated using the mainline kernel w/o additional patches,
> - Changed third patch to use dev_warn_ratelimited(),
> - Reworked last patch to move request_irq/free_irq to online()/offline()
>   to make sure that the IRQ isn't left enabled after the CPU has been
>   put offline.
> 
> 
> Dmitry Baryshkov (4):
>   cpufreq: qcom-hw: drop affinity hint before freeing the IRQ
>   cpufreq: qcom-hw: fix the race between LMH worker and cpuhp
>   cpufreq: qcom-hw: fix the opp entries refcounting
>   cpufreq: qcom-hw: provide online/offline operations
> 
>  drivers/cpufreq/qcom-cpufreq-hw.c | 45 ++++++++++++++++++++++++++-----
>  1 file changed, 38 insertions(+), 7 deletions(-)
> 
> -- 
> 2.35.1
> 
