Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 381A55A5B33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 07:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbiH3Fks (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 01:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiH3Fkr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 01:40:47 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 620D885F90
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 22:40:45 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id j5so6190491plj.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 22:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=/AXxGSKHD9gHotHgPkcKQJDg7QFNUaxs4G1mHC7A7EM=;
        b=GZdC/rr42yOk2UFksu/R3G3rPbI2L9UJtIKaPIria2iMwQfoKStV/mLDhnoeMiWHwT
         7u4Y7HYJD6VAZ7PmsZW1KcHuHnNAOtRAHAUA6mpvhVj2vskhNKnc6law/JlK2fu3+pVh
         6jRCrLuXzaGl7Gi8XzAeWCwDHtOEqwzI24b6Q7tiUqR9iVshq/DN9yD5dDLLaN7CUk+s
         12EjTAip3/Js0sVZ4iRH7jTIuo5GrPzOpZygmQPcTvqPnbB1R1GPTTRfm1qiToyL8Gy/
         pPBfE1kQK6420hWrFUeTgvDk3zhmmjeWmWzF8Tb9TTOpKwTIjFQJ3O79Lgo5ZgIf9uQL
         hXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=/AXxGSKHD9gHotHgPkcKQJDg7QFNUaxs4G1mHC7A7EM=;
        b=SzhpvmYzsWBkEgU1vQnT7GmgowKpmMXKR6Z3Pzbb8XoHPtLmgBCJMydG+y5wnB0vO1
         w3M6S4JODDqXnjcveN9NttcwHpPLSVI1UjAmOF5M5b5MvlJ+auhVJc1Tc7E/93zzit6o
         ONBehGn8Chv7PwWT10UgWo9/LI94UW4rA5vjEj5awjqRmglJiVD4vdDk/Ft5KUt2+4TP
         2hV+twsiQqbZkoKJDCFac1EncFg3v972CY+Q7+FiLaCz0kgiiDG4kFosBjVYiLOl+XSV
         74db68fjGNdfV1qgiXjOQi2ITBLDa7isViRpYqoksrUEicUdTrdWQ8svR39d6+CzEjzD
         UEbw==
X-Gm-Message-State: ACgBeo2Iglv9yHu2mnrsI1qhVbiOIMetJaEheXE8FZDpp2JRhPj3ItsR
        20hmpoaW9+U7PZPsNpFvCzdWgw==
X-Google-Smtp-Source: AA6agR4fz8JV9EJ3UVqdHB6K8oLv+ZN6CiYLpiAiB1jb8u1lfRtFBL6/xYco7Xh2MRfH9OHHAYnhzw==
X-Received: by 2002:a17:902:d4c9:b0:172:f480:bdd with SMTP id o9-20020a170902d4c900b00172f4800bddmr19669902plg.170.1661838044911;
        Mon, 29 Aug 2022 22:40:44 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b00174c1855cd9sm3787283plh.267.2022.08.29.22.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 22:40:44 -0700 (PDT)
Date:   Tue, 30 Aug 2022 11:10:42 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] cpufreq: qcom-hw: Move clocks to CPU node
Message-ID: <20220830054042.akj7pf366inelvpo@vireshk-i7>
References: <cover.1657695140.git.viresh.kumar@linaro.org>
 <20220715160933.GD12197@workstation>
 <20220718015742.uwskqo55qd67jx2w@vireshk-i7>
 <20220801023756.76jswkbwivuntqof@vireshk-i7>
 <20220830032456.z4olnogsyg32vhiz@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830032456.z4olnogsyg32vhiz@builder.lan>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29-08-22, 22:24, Bjorn Andersson wrote:
> Conceptually, it sounds like a good idea to express the clock feeding
> the CPU clusters, which is controlled by the OSM/EPSS.  But do you
> expect the OPP framework to actually do something with the clock, or
> just to ensure that the relationship is properly described?

No, the OPP core will never try to set the clock rate in your case,
though it will do clk_get().

> FWIW, the possible discrepancy between the requested frequency and the
> actual frequency comes from the fact that OSM/EPSS throttles the cluster
> frequency based on a number of different factors (thermal, voltages
> ...).
> This is reported back to the kernel using the thermal pressure
> interface. It would be quite interesting to see some investigation in
> how efficient the kernel is at making use of this feedback.

-- 
viresh
