Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE4B44DA6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 17:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234291AbhKKQbf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 11:31:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234267AbhKKQbc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 11:31:32 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE97C061766
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 08:28:43 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id n15-20020a17090a160f00b001a75089daa3so5034188pja.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 08:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6uwHJ0xj6Hj2rrXqAR11u7gcbD2tfZJ3+Qe9XeCjUXY=;
        b=gxsoNu5KAfKOnf0BCqoNqCUsYS7K7KAIoHyFACJkqyDRDjlgzDpPkaUohD/0pyxA6C
         oB+5EhS1HfSzqvSZqZCTZuz3lFWxEhIFbOZ47nlLlUTRNnoTrYzDxrPOoZSxSTCiEYhL
         gZASt6lhp4y1b/HYIz1pNXNSl7JmiOJ6qio1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6uwHJ0xj6Hj2rrXqAR11u7gcbD2tfZJ3+Qe9XeCjUXY=;
        b=4FpfdJaH9KPMeXZMfG9vSlMPBLVXcXhF7wANojIecgJBUfhgE8orOHFskRgfZg9H0w
         TKHSjnBffzdfwZf9TAiEAD40o7ml3Qml+4K2vguVB4ZERMmw6POTJw2dwtqmlUJX8j5I
         QHLnwSq0Mknm5V22Pg6jt/Ksvev5HDB+ukRJ4m3q/ODXv5v/NRjT5F3UeXm7TDC42bhr
         e7aqXEkp3v8DPgA+WFCr52SHOlgWToYjdZaCBs72/cZRBi7q2o0nGCrEynuniw2XkQHp
         MxL+3SSORlgdd+04N4ar2exa6wYCZaEUWegzNz/eD0xjuFd/GjoS9478YL43gztSkr/F
         wScg==
X-Gm-Message-State: AOAM531/hlH3AERgxmGetltAPFwXhvv2qc0ia+iLY4QEgmjKAtAmOwXC
        L0dncuQc3yAB0OmFEWnsS2qyVA==
X-Google-Smtp-Source: ABdhPJw/2rwsi6QclL5CMqZM6PUv88aktvlbkW2ximdu8Axd6jFjT0wHrOApAuskCsUABKMwN/K2Yw==
X-Received: by 2002:a17:90b:33d0:: with SMTP id lk16mr9587877pjb.66.1636648123027;
        Thu, 11 Nov 2021 08:28:43 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c0a9:ac53:7829:6af7])
        by smtp.gmail.com with UTF8SMTPSA id s2sm3861689pfk.198.2021.11.11.08.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 08:28:42 -0800 (PST)
Date:   Thu, 11 Nov 2021 08:28:41 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/3] cpufreq: qcom-hw: Fix probable nested interrupt
 handling
Message-ID: <YY1EubypukOK3Ux4@google.com>
References: <20211111154808.2024808-1-vladimir.zapolskiy@linaro.org>
 <20211111154808.2024808-3-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211111154808.2024808-3-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 11, 2021 at 05:48:07PM +0200, Vladimir Zapolskiy wrote:
> Re-enabling an interrupt from its own interrupt handler may cause
> an interrupt storm, if there is a pending interrupt and because its
> handling is disabled due to already done entrance into the handler
> above in the stack.
> 
> Also, apparently it is improper to lock a mutex in an interrupt contex.
> 
> Fixes: 275157b367f4 ("cpufreq: qcom-cpufreq-hw: Add dcvs interrupt support")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
