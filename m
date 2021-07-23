Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D21063D33FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 07:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbhGWEnT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 00:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbhGWEnT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 00:43:19 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B94C061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 22:23:53 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id y18so713190oiv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 22:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=QrIRJF9RofbYH9iU/wiHncDBO5Vg6i2VjMBiDfskl+c=;
        b=AaOHiU8hxeiJRQI/nQxcRonIBltBTvgos+tyJ2OweZKsTeBIweQGGChjgbH680rgGX
         NdHCLzFKNWs6wchpfAQzRRpRDTAXLFF9flDPZsfHr84g1AoSYW+nmKqKiiX3B0DsH90z
         HxXhUeRpjDvkik0rb3OX/Cwgv3gGa4O99n1fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=QrIRJF9RofbYH9iU/wiHncDBO5Vg6i2VjMBiDfskl+c=;
        b=a/hVhzCR1OlQQP2Cvuc6r7V5+gc/YAEdfJSqTpUtnIpceZNYzAIyTq5OA6hA9J7i8z
         Y38VBQg6nKRoFKiboiXP/jbKoqmWCbZIFTJTBBV16nKKIiJX1N/0FPPYh9JUJQ1dYQxp
         YBL+NFJcrCUVl1XbYMoVxqCp2NPLaBTKvzACx6Sn0hSiQdTsTpJp+ef161ZsH9tZVzqs
         itooV2z4W+Uz3rypHeiL3PUuPUqLPrU/h0S02NpD9aFVFN+h5VG4LWXTLfGVkBjV/KUu
         5ae+OEf5hLUQ1wiPOKQbvf3C9kxNrEl008SRao7m0gIcapSSpn1k/W9AGyLYWw1Q4rU4
         YwuA==
X-Gm-Message-State: AOAM530Li6TqTG+TPsMF7mmdaWe5QFWlFwIMq1oVroxziwjiEZ8aPXY5
        VVfKMb9fIY9Y5yQSdREmsm6SLuUQ7eQEeg+lmfxJag==
X-Google-Smtp-Source: ABdhPJx5qd3hiNyuX6akrBxVGshX+vTI7xdfErJFXbTfeV1Ph6BJBjuKjtmFvXf/oMSd23Szqu+9XGYUYZITAQzqg9s=
X-Received: by 2002:a05:6808:a83:: with SMTP id q3mr7787904oij.125.1627017832959;
 Thu, 22 Jul 2021 22:23:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Jul 2021 05:23:52 +0000
MIME-Version: 1.0
In-Reply-To: <1626992117-28887-1-git-send-email-khsieh@codeaurora.org>
References: <1626992117-28887-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 23 Jul 2021 05:23:52 +0000
Message-ID: <CAE-0n50QeAEbphveMJZrPFHg87AyZrTFQdGV2Makc0XJKgNfqg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: signal audio plugged change at dp_pm_resume
To:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-07-22 15:15:17)
> There is a scenario that dp cable is unplugged from DUT during system
> suspended  will cause audio option state does not match real connection
> state. Fix this problem by Signaling audio plugged change with realtime
> connection status at dp_pm_resume() so that audio option will be in
> correct state after system resumed.
>
> Fixes: bd52cfedb5a8 ("drm/msm/dp: power off DP phy at suspend")

This should be

Fixes: f591dbb5fb8c ("drm/msm/dp: power off DP phy at suspend")

> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
