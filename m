Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEB939AE85
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 01:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhFCXVG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 19:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFCXVF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 19:21:05 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343F2C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jun 2021 16:19:10 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so7365669otp.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jun 2021 16:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=hQgUp3SEy3n12KWwuAp4G7saP1ifGjcDT5qP0d3bq/E=;
        b=dMw4w7yxFEkhi6vIaddcnLjcLM9HD7Bdor+5wMklitaNgESzmyjwbVCYp83kEgr808
         KSntBQqo9bbbM211K4tkXi9sNUjE4f4PhDVmPJ/Rn2H9Hth+OVAUF0PFVTncL9x5lUfr
         5ZkeZ6HA0BvpA07a1Zaq9BDmGimZBL3vm3qpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=hQgUp3SEy3n12KWwuAp4G7saP1ifGjcDT5qP0d3bq/E=;
        b=foYkxIaMSsvbmJq05PP6VLNDYODv7HkTP+4OYhQcUw2+3MtuNkf3bQZ22ai22DuNuV
         qG+XWGqjvM4KTJssknQbi5Bwjaxg5j9NJ73ZQ5ru79GxUp5hTrRBvePkJl0qT9zN01Ry
         YI3YylXX3LQP04fYrlAMdC42bWEs9iXnO8gOsuRQCh87xU0DWdNj3RQn8ihyQkO8Wqc5
         7RXjvWYWAHJgJszxkTK+kO7CZaC5elYQl3aj1mfpls7mIIyDxi3kdsciOrwWtYwU2Uyl
         GrseFAb97dCbi4we7m/WhBiGVcNVUL3+EevCUt2H3y7hQosnf+CYqPmg6j9poRf77psf
         GsOA==
X-Gm-Message-State: AOAM53125dSdUlP9JiPhWBn4c/pCH9x194LokMrbbKQuEias2Z9Mb+Mm
        kmLAXYqAik3QosbyV/qGnkTDfHUdZiOU9ZBej4bEj6Z9Bns=
X-Google-Smtp-Source: ABdhPJxzdb4WdqDahQ8sBCMrVHSxCw07OebJeAIROoN0SDmUX2m3leUZaXQLLfQu8qBsngegdJHo3AzpwpdErBvGuxA=
X-Received: by 2002:a05:6830:1f51:: with SMTP id u17mr1428545oth.25.1622762347800;
 Thu, 03 Jun 2021 16:19:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Jun 2021 23:19:07 +0000
MIME-Version: 1.0
In-Reply-To: <3f62fc2142f6089c43ec3a4b7b10cadc@codeaurora.org>
References: <1622734846-14179-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n51-CsHPwYmceUq1kTaG=L+ifG3kX2pxJxTG_=r4Xm67_g@mail.gmail.com> <3f62fc2142f6089c43ec3a4b7b10cadc@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 3 Jun 2021 23:19:07 +0000
Message-ID: <CAE-0n52P+xZwL5xWnEnj3qQpmrhhLhXnaYvJST_-NM8hnXZdvQ@mail.gmail.com>
Subject: Re: [PATCH v5] drm/msm/dp: power off DP phy at suspend
To:     khsieh@codeaurora.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting khsieh@codeaurora.org (2021-06-03 14:59:49)
> On 2021-06-03 13:22, Stephen Boyd wrote:
> > Can you Cc dri-devel?
> >
> Sorry for dropping this cc.
> Should I re submit this v5 with cc=dri-devel?
>

Yes please. Then the patchwork stuff will catch it.
