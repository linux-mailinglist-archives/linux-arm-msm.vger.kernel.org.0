Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAF7B373104
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 21:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232487AbhEDTtB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 15:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232560AbhEDTs7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 15:48:59 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB8DFC061763
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 May 2021 12:48:03 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id a18so7276888qtj.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 May 2021 12:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dLRKtbyO50ZwLbGZ3RGT/lGz35DJJd92L3sxN1YsG2k=;
        b=laSCr644OH3wrJ6rLbeSdBIYes8vO3VEwMCv+BerwVh5PMGVlK4rSZhtFDngmFMKgb
         jQ4U1Vdqq5qHLpzHYR0T+qBvogRxh5xcqorNf2qL7f7J7An22P2JA3wMWzEP7CT0G00c
         pvFBnSmuf7bR3zp+CdBeEbVr//XxFhekeVjM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dLRKtbyO50ZwLbGZ3RGT/lGz35DJJd92L3sxN1YsG2k=;
        b=JF0UTy49M8FhsBl8yHKQANa17RPtm7LYE9EI0wzQ93/XZtexgWtkoEFlc85qCCU64W
         lOqbGnlTnljfr0fZpez2ud1JrnuAaJ7AIgGK+IIe0ZX6BUBnm7PXxJvSN43KrxXljukg
         Sb4K+BhggwOQsmJO7ZW5Uah/VBPnnf0r7kPRj9FTN+QP7HNuGmlj/faGkAe0z+OxHu33
         mL8hKcR0TJesXQlDMvHMP6svQUWZRv7D2aoR3cuMEHoyVuLFQivajvelgd/YEF9BqBmw
         P7R8CoRC+jUY2cLjTcir4TzFt2BZ94lAws2K8l1MYJcKh8lIKAsdtTrmkCEn0Wd+9vtT
         HMAQ==
X-Gm-Message-State: AOAM530bTVeKqhQ0kB+OMZEKpoKufreHtoXarxO5sQ1Ssq5iE60x01qI
        BFASPYuDPfAChT8Mm5Ihrbv5krAGoYSbcw==
X-Google-Smtp-Source: ABdhPJziubgaqtWSHtbGmk1wATp0AGgXNM9m7/HMh6eK0/Hj/9L0c3L5W0XoR99QHc1Yu1zW1jmWTg==
X-Received: by 2002:a05:622a:1354:: with SMTP id w20mr24534338qtk.223.1620157682562;
        Tue, 04 May 2021 12:48:02 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id i2sm3236186qtg.0.2021.05.04.12.48.01
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 May 2021 12:48:01 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id h202so4738764ybg.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 May 2021 12:48:01 -0700 (PDT)
X-Received: by 2002:a25:9c86:: with SMTP id y6mr36946496ybo.405.1620157681041;
 Tue, 04 May 2021 12:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <1620111510-31455-1-git-send-email-sibis@codeaurora.org> <1620111510-31455-2-git-send-email-sibis@codeaurora.org>
In-Reply-To: <1620111510-31455-2-git-send-email-sibis@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 4 May 2021 12:47:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XNh63TTtCEO4gbRm3s6mJ0C9jiN=B58f5+5n1KZeAOng@mail.gmail.com>
Message-ID: <CAD=FV=XNh63TTtCEO4gbRm3s6mJ0C9jiN=B58f5+5n1KZeAOng@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] cpufreq: blacklist SC7280 in cpufreq-dt-platdev
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, May 3, 2021 at 11:58 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add SC7280 to cpufreq-dt-platdev blacklist since the actual scaling is
> handled by the 'qcom-cpufreq-hw' driver.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
