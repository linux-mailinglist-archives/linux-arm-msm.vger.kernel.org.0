Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E6644DA84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 17:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234183AbhKKQfk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 11:35:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233921AbhKKQfj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 11:35:39 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ACF8C061767
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 08:32:50 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id u11so6213991plf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 08:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H1yErXT4EpwpUbhpshtUdMiS4figBQYN9WRkNajA+aw=;
        b=iP+Te/2AarqvwmfzBqyhFxvKJcHUaPp0nZJw9QWNBt0F1dhshBB/cM9Q304a2syyxx
         NeRsxgbuPOhhtRlxksRi59BDIRYQ6QVYIdW1CaANk0G1ZEhOH16OaDHbaWm2qIuSWvB9
         eKb9IaoRiD7jcd46Vho+gJClp5ndQ4DKhvV5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H1yErXT4EpwpUbhpshtUdMiS4figBQYN9WRkNajA+aw=;
        b=tcI5FBOG5rmZEf8f5n58Ba6DqizKFxRlwI4wbNVw+XdUmHxJSWFgNdCb7BqoxFDst+
         dP4IPdqYxRyL8gVtafXA6xlDRVZ12gPfzY3ZU2kmcLvv/+JXozPmI1kLwdK+RWt2ikaN
         iKN/pUL945kxwqCWxy8rkw2SjcpSnewVGXRg10f+4RwvMA4ILnPIztPmt9ha9Dh7Ymvb
         POOKf9xaBZoEvZKox0rAv0hJDI/aGIzA3NpAcfLPfb2EZEQENKN17xaVrxp60PoSsiwS
         XaQi9+hv1mo7rtaLRmxJqe42HB4bBpUfqLM6qjNlVaQa/1gvapy7k/I4tuDdlkTksEEo
         +GzQ==
X-Gm-Message-State: AOAM533Q3NMhj0dPaXPw2SbSwXh6jMjlaBjyjaRFVDiXnkzwMeJsJlUo
        +MeOLhOf2luFpYXxUVyS4uU/fg==
X-Google-Smtp-Source: ABdhPJzXVf/0jnwa3cU1jIOBMG995/y5rYDNfR81sGfUqxxzlAWg6KQWTHL7MkfPvgAm9EunKKgUeQ==
X-Received: by 2002:a17:90b:4d0f:: with SMTP id mw15mr27671616pjb.0.1636648370062;
        Thu, 11 Nov 2021 08:32:50 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c0a9:ac53:7829:6af7])
        by smtp.gmail.com with UTF8SMTPSA id q10sm7691514pjd.0.2021.11.11.08.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 08:32:49 -0800 (PST)
Date:   Thu, 11 Nov 2021 08:32:48 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/3] cpufreq: qcom-hw: Set CPU affinity of dcvsh
 interrupts
Message-ID: <YY1FsAtiVyUdKRHI@google.com>
References: <20211111154808.2024808-1-vladimir.zapolskiy@linaro.org>
 <20211111154808.2024808-4-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211111154808.2024808-4-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 11, 2021 at 05:48:08PM +0200, Vladimir Zapolskiy wrote:
> In runtime CPU cluster specific dcvsh interrupts may be handled on
> unrelated CPU cores, it leads to an issue of too excessive number of
> received and handled interrupts, but this is not observed, if CPU
> affinity of the interrupt handler is set in accordance to CPU clusters.
> 
> The change reduces a number of received interrupts in about 10-100 times.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
