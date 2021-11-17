Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6F354541C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 08:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232881AbhKQH1J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 02:27:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232792AbhKQH1G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 02:27:06 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECB3EC061746
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 23:24:08 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id np6-20020a17090b4c4600b001a90b011e06so1773012pjb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 23:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kji+SUoneEhDpvHW6mGuFpq4rQ8F1rfzbU8c63R1UU4=;
        b=fzMiVi/GNYynU/MBd7H+eL91mogPSBPffkoMBm+U76lHfMjnvkn8SjAunSOiW+HvQ6
         knYQkQVFVXs5jLX3h9rkiSpB90rehqMUjpggSN/8oOlvJogd/KFrSvExH4hZ0Gllmzih
         Pl6YaoJh9exMYNHviALVwKTk6VHsW49ea7Ci3gmwAuEm1Ppv8ahwYcThFCIOxXVI7YHM
         xYB1um6fYsbWdOE/k3T1o+gMxx/+8gaDSGy/uPta+2eGOQWSjVxHCtrFleGfI4IsH3/h
         gvB4ureSX2G/SViPiL+B5P+tOIYLZ18bMZhv4LO22OGQww5S+LVwfRIkmsa7hbvzNlF0
         Z9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kji+SUoneEhDpvHW6mGuFpq4rQ8F1rfzbU8c63R1UU4=;
        b=1sB5ObUW5ahsL4cW0TKrlAePH286u6PL3Txtf9ljpp/c4oij9Rl6b7YkKPq69cCAuJ
         uno4PYpRLvqTDPxaQzCSg8CYnKfh+Ypno43bHP+vWNfXUuRoVcIlYt2CAjUC5ZFa88Br
         jf4jP7bbZQN1uCCTZqKlx5j5vmdQYujzpcRCUSyP4mgjxCF7K4F9+AevSqSZMaGAbfxN
         q6u+DNqXzDtYWnvwCt9Fgy/3VlifxZgxJJKWtsmNlYWtNH4bLkHyAAHIfQjOUKHrjdSg
         JklMPWCQfVq4ulXnJ01A+ZubxBntxpAGuvC1YgyN0ThkqTkNzFXFEcH9Gyq2RQ4fxicD
         +rSQ==
X-Gm-Message-State: AOAM530sSh/umoGw7JqjA92VBXyYSvTIHbeOrDlnBDNX+rCURBmzEnDa
        yKIWJiVd+L3jv37tZO4AXduPNg==
X-Google-Smtp-Source: ABdhPJydpmGz72MxmCjoi6KzlOeAtz2KJzNgrhdhdAk7RLpBL3S4vMRwMhLcw17gnChIA2zHhp/Elw==
X-Received: by 2002:a17:902:780f:b0:13a:3919:e365 with SMTP id p15-20020a170902780f00b0013a3919e365mr53356829pll.63.1637133848491;
        Tue, 16 Nov 2021 23:24:08 -0800 (PST)
Received: from localhost ([122.181.57.99])
        by smtp.gmail.com with ESMTPSA id q11sm22237671pfk.192.2021.11.16.23.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 23:24:07 -0800 (PST)
Date:   Wed, 17 Nov 2021 12:54:05 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     Steev Klimaszewski <steev@kali.org>, rafael@kernel.org,
        bjorn.andersson@linaro.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: freq_table: Initialize cpuinfo.max_freq to
 correct max frequency.
Message-ID: <20211117072405.yqrn23ria4snrjda@vireshk-i7>
References: <20211115195011.52999-1-thara.gopinath@linaro.org>
 <5ae2c644-4743-c62c-b17c-96945a0e6a01@kali.org>
 <20211116035935.wmazontuznhys6qu@vireshk-i7>
 <fd153d84-411a-c843-eab9-2dc66940a3d3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd153d84-411a-c843-eab9-2dc66940a3d3@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16-11-21, 10:27, Thara Gopinath wrote:
> 	policy->max is unconditionally set to max_freq in the line before "if
> (policy->cpuinfo.max_freq < max_freq)".

So the current code is not correct then :)

-- 
viresh
