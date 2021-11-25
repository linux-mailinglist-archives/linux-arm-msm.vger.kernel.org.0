Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242E545D4FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 07:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346776AbhKYGzt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 01:55:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347543AbhKYGxt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 01:53:49 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A393C06175D
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 22:50:18 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id gf14-20020a17090ac7ce00b001a7a2a0b5c3so7013147pjb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 22:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aLZTzdqAHN4njzqIicuAT3Ic+Y2XtUxhcUjJQMOb7xs=;
        b=Oe/lr717vm9ZmunvbrWUJEHX1jGZvSJbm3Y05EH9Rhle3p07RjPuGDyL1eUzHS+TQH
         Br7MfMZK4yoFD7yxQHBxKwjVcViyJhhnuRn3R1dTPbEuNGtwUcsuaSTNHp5vV6sxuzZe
         LyyySc4RfViFjrPbn7zYCOfy03OhuDDOVqdV0/P4768viANopPp3Tj06bUjngyt59rIV
         sJ+z6rzgZbh04cspJL2ZwpKbue3Ik9Pe4ZMFTddlEaQAHHR3AvLgItFMIWYmjHapvqEC
         JwR0FDv2w2XJ0cXz5gXLKt1Mhks2DcagQMgGk8ydf0srGGbm2T9jkVZt3FxHhKC9vjur
         TMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aLZTzdqAHN4njzqIicuAT3Ic+Y2XtUxhcUjJQMOb7xs=;
        b=UIwvF5uoRePlKxn3esxLgYeEsVQTmPqnundDHVE2oT/YBgRWwiy0D8hnYnBKqafK3F
         BBP9W87RBFcV4ge1Q3pzNsiPuQbe2hwy6Pa6fFHCzLvT703smWJqAA3gIIRd9A/6c9X3
         7cX9p9IQOpwBqUlTe/Q41Nsc6x9o2dj7n6iyL0PdBTb6qXkAVCIRWA9sCDH5q5V6AbZ9
         lPlVDuFvzjS2S0Wg0+pm0c//nG0wQVX4d+MsqGeSy7v+Y8WvpUpsTmg2gfh9RXH1bUMY
         lnWmj01WeGATN4OzYSduYWXaK3V21nriscLJOJ+72O210Y1P3+o+Optom0S2bZu3JITi
         881A==
X-Gm-Message-State: AOAM530e315vSaQCQrntUNZfZO2agDHe54viYdNwmpHXxYc6BhT5t9t9
        AeIiKy4jp+6EdyJTqieLSWGEsw==
X-Google-Smtp-Source: ABdhPJwUQbsuqcx0cjo2BNSLjskMS4com6gMFeSOWFH+slwNWFckXWeCVRDPV0yGUjpDLtzxQKmEsw==
X-Received: by 2002:a17:902:e547:b0:141:ddbc:a8d6 with SMTP id n7-20020a170902e54700b00141ddbca8d6mr26876899plf.27.1637823017721;
        Wed, 24 Nov 2021 22:50:17 -0800 (PST)
Received: from localhost ([122.181.57.99])
        by smtp.gmail.com with ESMTPSA id q17sm2154062pfu.117.2021.11.24.22.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 22:50:17 -0800 (PST)
Date:   Thu, 25 Nov 2021 12:20:14 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/3] cpufreq: qcom-hw: a few fixes in qcom cpufreq driver
Message-ID: <20211125065014.phkfugo2wptosrgv@vireshk-i7>
References: <20211111154808.2024808-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111154808.2024808-1-vladimir.zapolskiy@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11-11-21, 17:48, Vladimir Zapolskiy wrote:
> I find it essential to resend a fix from Ard and also add two more
> lesser fixes to the set, review and comments are more than welcome.
> 
> Ard Biesheuvel (1):
>   cpufreq: qcom-cpufreq-hw: Avoid stack buffer for IRQ name
> 
> Vladimir Zapolskiy (2):
>   cpufreq: qcom-hw: Fix probable nested interrupt handling
>   cpufreq: qcom-hw: Set CPU affinity of dcvsh interrupts
> 
>  drivers/cpufreq/qcom-cpufreq-hw.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)

Applied. Thanks.

-- 
viresh
