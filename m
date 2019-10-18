Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F766DBD76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 08:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392090AbfJRGDt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 02:03:49 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42512 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407026AbfJRGDt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 02:03:49 -0400
Received: by mail-pl1-f194.google.com with SMTP id g9so1005213plj.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2019 23:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BSveiQwGviuEcR4ypuqkpKzuxRmA0+9+mStZkF3vzJg=;
        b=VKMuvXcvvGP/FnfbPGGafDTQqvKt58hQ9JwZCL1mJZYoO07SWVM8V0Ao+3xvwMFVC0
         z1szGW4AdBK1zXzKQzlZbjQoBRZaBONjgZQimxNr41BG9T6IeKw/9hkmO9Sqta1bGlzT
         Q5XB32NRXux2YSw9RcXoriHC/Vjhn0qOZ/ISgp0wWDGqbKienY0ipkB7LDONW5/T+jrE
         4dDadRRatqlloFFaGg1WkY05ct4gjFWBfmecZUPSM/VFh7F775hKspvL+1fr7c+1BDyX
         65nI2n4AtKgw8neyAPTA5SpITv6wQmqQqH4QW2Ln9qa/tgsBr895fpJSiQd2CDvuAKdx
         7Hzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BSveiQwGviuEcR4ypuqkpKzuxRmA0+9+mStZkF3vzJg=;
        b=PPFr2pxaJCO9Bu17sHn8qXeGKbSyYYdX9wnRjqP92DFWDLMjyCEt4/KIkdiVsGK0zh
         U8nXqOMi4Lo0D2qixQwvM89M207Iffr8Guz0gjJEsPqqTjQILrHoQKiHe0gEk7iV8fl1
         AI9NawaKSyeKOxd3KY42wL49ydoOu/kYqwUCHTpGeIF374z4zgwCuwUV0Sr8bE9oSgwW
         kwTmRDu9RswPruzWYiqUIE6FwlOv3qJgQoXhRsiT7sOCk3lhopsKOXxY/NWM0hLk03xB
         pU5WDVmish/Adiup5OKIB45suaFkmlV6xT6BXI2smTd9+KchddAcway/OgZzf2lMWkmm
         n6UA==
X-Gm-Message-State: APjAAAVdhqF6mMQeURuHebnIrMFPDx2LP2HgqDrnN/Fu1T5AJ3UhDb6k
        csUP7hjFgiKematejc8LdQZ5Gg==
X-Google-Smtp-Source: APXvYqwbsGOB5qsGmti/XnQXORN6qlEqa1yTSNYtvcSbP0L/Gu/byaAudi/utDrAhgQkCMHVo3tdpA==
X-Received: by 2002:a17:902:b08f:: with SMTP id p15mr7786915plr.229.1571378628231;
        Thu, 17 Oct 2019 23:03:48 -0700 (PDT)
Received: from localhost ([122.172.151.112])
        by smtp.gmail.com with ESMTPSA id 199sm5541685pfv.152.2019.10.17.23.03.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 23:03:47 -0700 (PDT)
Date:   Fri, 18 Oct 2019 11:33:45 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, daniel.lezcano@linaro.org,
        edubezval@gmail.com, ilina@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        sudeep.holla@arm.com, tdas@codeaurora.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 5/6] clk: qcom: Initialise clock drivers earlier
Message-ID: <20191018060345.wjflngfdnqa3gbsu@vireshk-i7>
References: <cover.1571314830.git.amit.kucheria@linaro.org>
 <5f1ca3bfc45e268f7f9f6e091ba13b8103fb4304.1571314830.git.amit.kucheria@linaro.org>
 <20191017174723.8024521D7A@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017174723.8024521D7A@mail.kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-10-19, 10:47, Stephen Boyd wrote:
> Quoting Amit Kucheria (2019-10-17 05:27:37)
> > Initialise the clock drivers on sdm845 and qcs404 in core_initcall so we
> > can have earlier access to cpufreq during booting.
> > 
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> 
> Makes me sad again.

I am wondering why it makes you sad ? :)

-- 
viresh
