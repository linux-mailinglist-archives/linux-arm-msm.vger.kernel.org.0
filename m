Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EBDDB4911
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 10:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730143AbfIQISO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 04:18:14 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33097 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732005AbfIQISO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 04:18:14 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so1716699pfl.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2019 01:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ccksZ0DIr5YuOlmKQ56MKQuO6sfHn4/cYWLl1y6ZJss=;
        b=Os/OjkFdbkxbCMGYZNy/HnlfvRLdNhVDvO3OQ3Tjqp9ysoWyo0oM4s2SSDCAzouHsz
         gkjFk4cddTJ2rUMcXLsrmoS14Xcns241t9TBp2xl4Ltya+LciRWtEQ58XqrCB+viuEx7
         Xghm6/lG8f6ZFz2ZU4/8yigRh6Xo6AZmD5tcBL7R/PVjNIiv+hOwCPRttq4vURDrB2U9
         vVogGNoMgz30xlAJB7P7ThuBYG3OVdHfPB9AqNgQHkt62TSyfWxjkstqzWvMH0v+KetM
         TDXnzs7rLDW60zjQDKVvTA0qCV9uV+ENswqS425WgupE4mmBCfMyiGcnJRNzzZkvqwea
         1Xaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ccksZ0DIr5YuOlmKQ56MKQuO6sfHn4/cYWLl1y6ZJss=;
        b=UvHwaaciSuAb7dCFF2P6vJzymK2LwUuD3K6dk0l0OeT0ZcUYCqUE9HAlre5FnGeHCI
         iF9pJtH00+j1stngaWtV7BsiPiLRJFcDE9yT9BAeqpK/jYJpcW3fdZKMwrWXOAM+FjHh
         6x0uwmJIiwSyMsLad0u/2d9UEybAQcq2rHEeJN2VWc6/lFOtezITCPPV0uF5NgH+RYoy
         jD8lgpltXxw9PJKfDJH437jBSueh9YwX3ELhqtpI9kkFjp4+J9LcATbU2dhJpvB8ZwCe
         rTl7ac5yh8pGHvs0PyhI2ef4ECJOaxUAnY3dGEba7hJCMO6zzQ31fytNwfFRhiv3dy77
         iO5w==
X-Gm-Message-State: APjAAAXBTtWz+HnyZs186tDNcNyx12RwW2kL+JqR4HXOcPzWU7BmgFX0
        +6KxvEloSBIFct8NKkGdbSdp1vzztOI=
X-Google-Smtp-Source: APXvYqwpy0WS+QkLpZKa7+H9dnq/Maul15NnA8yNy5WichOtA6IyRwXpsp5wW9igskBRzYgp3hRJ5g==
X-Received: by 2002:a62:1955:: with SMTP id 82mr2836635pfz.256.1568708292663;
        Tue, 17 Sep 2019 01:18:12 -0700 (PDT)
Received: from localhost ([122.172.73.172])
        by smtp.gmail.com with ESMTPSA id v44sm4392124pgn.17.2019.09.17.01.18.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 01:18:12 -0700 (PDT)
Date:   Tue, 17 Sep 2019 09:18:05 +0100
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        tdas@codeaurora.org, swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/5] cpufreq: Initialize cpufreq-dt driver earlier
Message-ID: <20190917081805.kmhu6zcdo6akbqe3@vireshk-mac-ubuntu>
References: <cover.1568240476.git.amit.kucheria@linaro.org>
 <23d3ed7edc8b859da8e7640f77cf3028ad5804f3.1568240476.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23d3ed7edc8b859da8e7640f77cf3028ad5804f3.1568240476.git.amit.kucheria@linaro.org>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12-09-19, 04:02, Amit Kucheria wrote:
> This allows HW drivers that depend on cpufreq-dt to initialise earlier.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
