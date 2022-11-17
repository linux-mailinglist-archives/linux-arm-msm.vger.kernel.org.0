Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C03B962DA04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 12:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239613AbiKQL6Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 06:58:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239583AbiKQL6V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 06:58:21 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 365906E558
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 03:58:14 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id k5so1446288pjo.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 03:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GLoVFChROJ5V36ljC1bNCZRvnBVgO9ssi1DRcUAdvAk=;
        b=NJGWsdluGlnqtVYNGjjNX1DFoLalmku5FeE/yJwRBIyMjzN4IDelPx29JMqCdCKP78
         B8y6LxM56UiJqigX7MDHT4BYu56C6F2XUSLBJHvveMztS/lO2u3HCnALmkO9sO1O+WRA
         mCWXfDQ2QohNau6Qv+0Fk2qOvd4krKcr3VMe/5dv3RHZjiB0q3dzu+w5QBH6iheLztkl
         UC/Eyfzz6oz9qpvvRFj2lI5SK+IwaN7XZIjO0jWi0fV8YDhYDQueq/6PYt1vTCnZEooN
         iQ2N89hs4AuIEAvo9fK6z1/eYlgW1IjEkTBU/PZsEtLIhv8GX60uARcUaF7HPW+y7cH2
         eJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GLoVFChROJ5V36ljC1bNCZRvnBVgO9ssi1DRcUAdvAk=;
        b=TDMmdYHTEealVLw0NGq5sKC5r57+wHAYpbHsMieOuaLB0lp+0bIStIgx/uQlCpfGSu
         OlG4YZ7hz2UTBuVchlK6mgxbHmCBNk2qETFFJ2KwKyy5RG0p4BH4gnbBIi+tDuLEMoy3
         nYmr4JvbLpdDue4bd5MpPEBEgMbOW32GoHRT1Ig8VVBhRNfSAPtrAoaE3VZs/A+R0ZRX
         sApqcEMxuBl1XM7/jB2dgtNvR+gr99feg9Oj0MVdcFkKttQq+N/FZwWdQFnnZEdAyGPM
         rHgZIGCA2BDA/IVwdfJUYfw8iAiL50T+RTA0cXRQ/slG8ER/hTgCNhE7Njp12HmbdogD
         CpkQ==
X-Gm-Message-State: ANoB5pkHt736TZfduO1Zi4aduLT1o2vukIMgqHVlXB2zUbGaLUyn2RCp
        w05al6WxRqGfGOHwUlXjv1PU
X-Google-Smtp-Source: AA0mqf7s25sxpfJwk+zLTPv7ei4nidM08tgz478Muexp4BmUxkF4n60Adpc43Uzd2cOb0eK8kwVAjQ==
X-Received: by 2002:a17:90a:398f:b0:213:5a55:7dd2 with SMTP id z15-20020a17090a398f00b002135a557dd2mr2559599pjb.50.1668686293696;
        Thu, 17 Nov 2022 03:58:13 -0800 (PST)
Received: from thinkpad ([117.193.208.31])
        by smtp.gmail.com with ESMTPSA id z4-20020aa79f84000000b005626a1c77c8sm952665pfr.80.2022.11.17.03.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 03:58:12 -0800 (PST)
Date:   Thu, 17 Nov 2022 17:28:07 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     andersson@kernel.org, viresh.kumar@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, rafael@kernel.org,
        robh+dt@kernel.org, johan@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v7 0/4] qcom-cpufreq-hw: Add CPU clock provider support
Message-ID: <20221117115807.GF93179@thinkpad>
References: <20221117053145.10409-1-manivannan.sadhasivam@linaro.org>
 <20221117101903.sw3hxaruj5sfhybw@bogus>
 <20221117111207.GA93179@thinkpad>
 <20221117115203.356vexlpca746o6m@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221117115203.356vexlpca746o6m@bogus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 17, 2022 at 11:52:03AM +0000, Sudeep Holla wrote:
> On Thu, Nov 17, 2022 at 04:42:07PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Nov 17, 2022 at 10:19:03AM +0000, Sudeep Holla wrote:
> > > 
> > > Why do you need the above 3 changes if the below(4/4) will ensure
> > > cpufreq_get(cpu) returns the clock frequency. I was expecting to drop the
> > > whole "confusing" clock bindings and the unnecessary clock provider.
> > > 
> > > Can't we just use cpufreq_get(cpu) ?
> > > 
> > 
> > This can be possible for OPP implementations for the CPUs but not for other
> > peripherals making use of OPP framework like GPU etc... Moreover this may end
> > up with different code path for CPUs and other peripherals inside OPP framework.
> > 
> 
> Fair enough, you can use this for non-CPU devices. But you are adding this for
> CPUs here. Is the consumer unaware that this is a CPU or non-CPU device ?
> If so, make sense. Otherwise, it is unnecessary to go through the clk
> framework to get CPU frequency.
> 

The consumer here is the OPP framework and yes it doesn't have the knowledge of
the device it is dealing with (for this context).

Thanks,
Mani

> -- 
> Regards,
> Sudeep

-- 
மணிவண்ணன் சதாசிவம்
