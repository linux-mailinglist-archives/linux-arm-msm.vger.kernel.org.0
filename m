Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4158644DA90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 17:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233966AbhKKQi6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 11:38:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233128AbhKKQi6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 11:38:58 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EB8EC061767
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 08:36:09 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id y5so6062015pfb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 08:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LfjMdYTkRtSg9vqoefxU1BZpX0CO1104WkyQpurjrWY=;
        b=WXNvcv8XRto1O+lXQtJsWd0YOaNuqJ/LuV3eNp7Z7t2ZYyqYsvtoxaHh0SGvGISwzP
         9xu/dFAVIEvyVBTYEwgWvt97MKxW0KqNpvOml79QxD/j4pHEHiwggPwZD8dvAPCLAZ7v
         0ma860WdIZOrw531taynzpHpq71Mnq3kBp+Gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LfjMdYTkRtSg9vqoefxU1BZpX0CO1104WkyQpurjrWY=;
        b=4NxtM+OHHZK9j0xyB6c8g6koH3E792krmMTVto1B03PhzPC7v/Nmxq+uiq97kpWgoD
         gR+IcorioP0+4wtkNP3hSIm5zGVQZg/aJzoz80Rxl3pRFlw97gMPpDiOeXbde949X355
         wCYoyv+Al5F90Xna7GvSdEXGdNMhtmbdDnldrWytNHUYbj8hbssObF8t+KroVlfO1Ghi
         mvj+IP1L0bUQPZJjh2DeOdLCqRXa3BDZPrHrHNMBQ/1rsVwy7oIiqplCEQ1NZNFjWqtR
         TxN28kBeJ5nAZvu5BNYu2DSs+1JVNaBPxjee08kX2JdfLRA+aDrmT477q1WxC62Rn+LH
         3vNA==
X-Gm-Message-State: AOAM532yT5MB6Mqyt9mdT1MF0F8A1oCLAtohentQfZ2h/tuh/TtEZb78
        Vp8p4/KzGHSBINwosl69pSTQBQ==
X-Google-Smtp-Source: ABdhPJyf1ScnuC6QULfERaqTkSjsGJR+nT428EdPFKuVJCeg6JM6CMlZ66KTcnmUC2NJEIiCfnANLg==
X-Received: by 2002:a63:d313:: with SMTP id b19mr5387847pgg.64.1636648568804;
        Thu, 11 Nov 2021 08:36:08 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c0a9:ac53:7829:6af7])
        by smtp.gmail.com with UTF8SMTPSA id v13sm4085560pfu.38.2021.11.11.08.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 08:36:08 -0800 (PST)
Date:   Thu, 11 Nov 2021 08:36:07 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Steev Klimaszewski <steev@kali.org>
Subject: Re: [PATCH 1/3][RESEND] cpufreq: qcom-cpufreq-hw: Avoid stack buffer
 for IRQ name
Message-ID: <YY1Gd7qfRRU2UJ6h@google.com>
References: <20211111154808.2024808-1-vladimir.zapolskiy@linaro.org>
 <20211111154808.2024808-2-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211111154808.2024808-2-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 11, 2021 at 05:48:06PM +0200, Vladimir Zapolskiy wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Registering an IRQ requires the string buffer containing the name to
> remain allocated, as the name is not copied into another buffer.
> 
> So let's add a irq_name field to the data struct instead, which is
> guaranteed to have the appropriate lifetime.
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Reviewed-by: Thara Gopinath <thara.gopinath@linaro.org>
> Tested-by: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
