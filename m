Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76F4F6A01F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 05:23:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233366AbjBWEX3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 23:23:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbjBWEWo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 23:22:44 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D427498AE
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 20:21:38 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id s5so11330630plg.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 20:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BeIqkvXT8qWDWnWahXlO5BININY8QSy5XMW8WdqWuPM=;
        b=DhD2exAoC6i/QJooHe0EazMuwjjMaq4JiVz/2h1J0I2AA5gcTLEFq8VEr1p8oItWoO
         fl9MRWGlgkaZiReHFnEGXH9vJ2uDBUtGKa+zFZq8SGrBKOVsO/7TkSz26ufgfC01n4JI
         xnyXV7t9XiY9FxbQTFlnJeqHPEY05ex4bCWiHCXcrfhMhkxV4c1euPyF0GBwM4UcCt3+
         J8NzNSOb/0PiCoaaVrFHa8lObd+r/gV4nr3K+goulQBp+5cyuRKsQlYOvdIubJ8oxl/Q
         AS/jE7od1nqR43jfoFks+OpO0pPLYDRY9pBcG0JjvdcrZgao+iwylykidzmH4ZWY3hGT
         rC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeIqkvXT8qWDWnWahXlO5BININY8QSy5XMW8WdqWuPM=;
        b=Sy4VgtnOW1I5j3Jqs7ShgT79t0rtZEsY9BJEMlN10r5bIDcj2gZk3sp5knZl0NPnAm
         b4+urDK/9hC5VAv6tMQqyzbqRcdc4MmabuLCWYUXL+IJI0UHxXToIrEVjQpSIF9OGxWN
         +AAApyNOPnubSQZ1YO563rLFetZIPvATO1lZK2MBhlMAbxwu9UCtYIoViHuKcPI6wID9
         7t4O9w4fJNWxTq9U6fJFLx/KhNAPEy8mHWa/xS0VOvwt579gln81L/R+cDBpbRwMonVs
         i7eMWHHN9C/qoJ+GXPx3nFxPR9mE+lEUBhsw0htZhfS/lsk1H+C6xs8FHbIifEQJ5jJp
         W+Sw==
X-Gm-Message-State: AO0yUKXE/vK9/AiNRiTsPk8zXLlFazobm6+88UtnqoMGau09bgTJg7Yw
        hJde+QYt1Rmpob8axtOt/4W+vw==
X-Google-Smtp-Source: AK7set8ZU+CVB/QGSlqPKrK72sbOFFUsAFkmuMH6fP+3ZO/jOAfYbtKM9wdir3sIC7PHI6xxxXauAw==
X-Received: by 2002:a05:6a20:cc44:b0:cb:c6f4:62fd with SMTP id hq4-20020a056a20cc4400b000cbc6f462fdmr4383006pzb.18.1677126091633;
        Wed, 22 Feb 2023 20:21:31 -0800 (PST)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id c2-20020aa78c02000000b00593adee79efsm4597666pfd.55.2023.02.22.20.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 20:21:31 -0800 (PST)
Date:   Thu, 23 Feb 2023 09:51:29 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        marijn.suijten@somainline.org,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: qcom-hw: Simplify counting frequency domains
Message-ID: <20230223042129.b2uvykoq4p6uiig2@vireshk-i7>
References: <20230216105140.3938749-1-konrad.dybcio@linaro.org>
 <20230223032730.fhnxjzfwralkexun@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223032730.fhnxjzfwralkexun@ripper>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-02-23, 19:27, Bjorn Andersson wrote:
> On Thu, Feb 16, 2023 at 11:51:40AM +0100, Konrad Dybcio wrote:
> > For quite some time, this driver has been performing some quite
> > low-level DT operations. Simplify that using platform_get_resource.
> > 
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Applied. Thanks.

-- 
viresh
