Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD152D6AF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 00:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390397AbgLJWax (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 17:30:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394007AbgLJVYg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 16:24:36 -0500
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF79C0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 13:23:56 -0800 (PST)
Received: by mail-vs1-xe42.google.com with SMTP id s85so3673002vsc.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 13:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7mhjTRkoHG5wDB6hSuZ/aPIC7H/s0skSuoErD8uNBws=;
        b=Mk0qsv8nQsIb+74vLlttYyB+sauWfKgHNsogJv1aie+18w0M3Qt7pPiZtt3aTWwfau
         8SizigN8Zf9VFxFgSDbBcEAXw45HsRgJGbE6fmhqqt74pJM8FhSgNf3+hqNOw0DqMHiQ
         riKNI5bvy+Az1UUENpaPsMTQNH9v/HcbODbcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7mhjTRkoHG5wDB6hSuZ/aPIC7H/s0skSuoErD8uNBws=;
        b=regCfijJnRZV8YX9ADkqDvq7NNp8/3UVcrKY1EVmwmxW23vZKsvVTFX35DHQsfETeV
         QCDH3FYE5560PDCt7jEXx+HWX22rEkW62R1wMLXCNg5G1l8Q0+XlcOTSoet1c0mTndd1
         bUzU+pJWs9+mn7skx5b5toNg0gvh05S6oFYcATV3daUZ9bAqKcktylSpIgK35MzBeCBO
         YmC14TVDjzJWf3hpaDMjch+A1/nXQyMyOmwN9ku1a8d13CB9IAn/YV2CMwxBvmEMsfkC
         vtl4BrlrivKKm3jRqcs7WZlLRHKGMzWQnnAM9qUTaaG4p4LuqE8UXpKIPnf35zxGnGyE
         vxyQ==
X-Gm-Message-State: AOAM5320SFqnR0bLNNnIvt50auCJTJEAN/4RM56Noqv9j2aDATVhQsM+
        f2NsU9sIq9/6RQEAlYXF/LD8An9/B836vw==
X-Google-Smtp-Source: ABdhPJzLjHSxFfXWgzcwHBJh2J1397rqsWYaoiPp4xF+XYkb4niOn0PHdMWtX/neWHFL9BaP8lwzeQ==
X-Received: by 2002:a67:ff03:: with SMTP id v3mr10125821vsp.48.1607635435808;
        Thu, 10 Dec 2020 13:23:55 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id r144sm744426vke.9.2020.12.10.13.23.55
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 13:23:55 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id q10so3648878vsr.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 13:23:55 -0800 (PST)
X-Received: by 2002:a67:70c6:: with SMTP id l189mr10697172vsc.34.1607635434758;
 Thu, 10 Dec 2020 13:23:54 -0800 (PST)
MIME-Version: 1.0
References: <20201210131913.v2.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
In-Reply-To: <20201210131913.v2.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 10 Dec 2020 13:23:43 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U5AvDR0mhaGH77QKTvPCAMH7fc5eCNFPcSqnSbrxKMhA@mail.gmail.com>
Message-ID: <CAD=FV=U5AvDR0mhaGH77QKTvPCAMH7fc5eCNFPcSqnSbrxKMhA@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: sdhci-msm: Warn about overclocking SD/MMC
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Taniya Das <tdas@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Dec 10, 2020 at 1:19 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> +               pr_warn("%s: Card appears overclocked; req %u Hz, actual %d Hz\n",
> +                       mmc_hostname(host->mmc), clock, achieved_rate);

Ugh, multitasking too heavily.  Clearly this is wrong format codes...
v3 coming shortly.  Sorry for the spam.
