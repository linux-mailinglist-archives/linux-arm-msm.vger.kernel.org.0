Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E08EDC1D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 11:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633109AbfJRJwQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 05:52:16 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40556 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633085AbfJRJwP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 05:52:15 -0400
Received: by mail-pg1-f194.google.com with SMTP id e13so3072371pga.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2019 02:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wtCCjDsxUW2f7hUMgiF/lhUDNP+eblATwyQXoaxQPFk=;
        b=Wltgfp1pRzOmQKZFcjNgOouPgbf2eUSJYhtjDuyyXGv7vJSSTSu0vasW7MlUVNQTD4
         DeUcGwnAuqncGmxTmK2pKrlyRmn2SaKZluwJgIsstd4tmo4Vk9DMmBentAt5U5YDtAd5
         8oL6KTKrp/xc3aYZktEd41bBr+uDOfEerZcF3muup6By6oAx6YybLI67W1ItqWsSww9N
         JapikXnjK6jl1K6iIoAOJzvXJd1g2oWH4ut503hPMwgdAQF5b0aBq+7ZJBshy/ve1bNu
         +/UBnOGIqMlUwL4p5rKeanvouZNG7xCoAjlhqPru9+xZG+VJ8deIr1WsqcJval7/LoQq
         jKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wtCCjDsxUW2f7hUMgiF/lhUDNP+eblATwyQXoaxQPFk=;
        b=KwRIT1BtPO8IMcI35h9VX0pavfEVbs9mpJoFxazB9nlJrz8YLahO0VWMqJ2mWP8xFJ
         0qblNTaIAMYmAhKhMmRueouAiyw4Oulr4SVc1I4rbL2VkBHR1zXLYaQKhVVwMIK4+Gpr
         RMOTlcfiwfVPHprFVHQGQHMEn463sBnWuR8U4SQOx5PH4zlUOj1qLeJt6J6y41Hd4hFR
         t/GEo93Y0YO03IUS8wsW3vfL9G2d6DMOcdkt3PJhEzwbs2DFczc3251L4F8i7xocfP17
         NdrSH2MOIULNIyXvDOwC6WH05mADzestf97WniWc06zNkTQV/jB2og9900cYNbM97W7g
         FoSQ==
X-Gm-Message-State: APjAAAX7SinfJlWgpGQ+UOynl5sa1W9mBXHfOqkRL9W0hrm1h5KTXEbw
        WbvEw37T65G0/I9hLeFN6O8djg==
X-Google-Smtp-Source: APXvYqwrm9QohNHq0++rIl5Gykt4pMddHMa4LN9dNpYpqce8aMlV5KSJv4ChUb7fQ5cVJlnArIAL1A==
X-Received: by 2002:a17:90a:fd8d:: with SMTP id cx13mr9965664pjb.66.1571392334920;
        Fri, 18 Oct 2019 02:52:14 -0700 (PDT)
Received: from localhost ([122.172.151.112])
        by smtp.gmail.com with ESMTPSA id l184sm5575252pfl.76.2019.10.18.02.52.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Oct 2019 02:52:14 -0700 (PDT)
Date:   Fri, 18 Oct 2019 15:22:12 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, sudeep.holla@arm.com,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        tdas@codeaurora.org, swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Ben Segall <bsegall@google.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Mel Gorman <mgorman@suse.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 5/6] clk: qcom: Initialise clock drivers earlier
Message-ID: <20191018095212.7hpherdgzxhqzqjz@vireshk-i7>
References: <cover.1571387352.git.amit.kucheria@linaro.org>
 <a59321a1016de3f08098739b6db5d5190ac1c85c.1571387352.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a59321a1016de3f08098739b6db5d5190ac1c85c.1571387352.git.amit.kucheria@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-10-19, 14:22, Amit Kucheria wrote:
> Initialise the clock drivers on sdm845 and qcs404 in core_initcall so we
> can have earlier access to cpufreq during booting.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/qcom/clk-rpmh.c   | 2 +-
>  drivers/clk/qcom/gcc-qcs404.c | 2 +-
>  drivers/clk/qcom/gcc-sdm845.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
