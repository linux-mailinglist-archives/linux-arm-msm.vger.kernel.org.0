Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 725823E8561
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 23:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234146AbhHJVer (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 17:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233792AbhHJVeo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 17:34:44 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1706FC0613D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 14:34:22 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id t35so1211035oiw.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 14:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=bgpLmyHy//Rdaa2myVwlWVrvOLDfl36DscQjlx6Wvgo=;
        b=MzbxM7E5cFVw9K4JPRmW3EY6dt63hd511MvQfWIKO6m0qOos2mondDT1SaUGSMj7ht
         NcSJ+5X8jXuH9wVdMuQY72+kavtSYJu/hU+yxJfKkFWYi+IdZurvSzVj4LS7P834rcth
         5ly72EwOKQ2hAwWD/V6PLKThnQNH1Lowt9EsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=bgpLmyHy//Rdaa2myVwlWVrvOLDfl36DscQjlx6Wvgo=;
        b=dXhYijLH/xeh6nxwQ37dEda7TLVR/QimoWSXjPKS3Ka2k4QvAz6Tiez1CuNOnVua71
         nxikDGNSVKO2Au+CleGYlFSUovpSdDOfPnHKTGwkBW5pZ+ne+uQIalXABYgDEgf4Uc+K
         5p1rMJlVQXodmm8sW0v6DRTg38lWg5c5wmKOieG3k6VXsffagAc0EreAl5bj3G0zeCcl
         dCK7A7r4xk2ppRGrang0TqpBzkhStVc2k+q/PAoTmqCr3EoCIirr5HF4rbo2LIf7boBe
         V0UkpnuLVXEOodfFOrNZwDx0J2ghHNRiKTRYgUdg4dcYRUbpSTuseqwZGgUyESogICKv
         SU3A==
X-Gm-Message-State: AOAM531OhPgbsYEjuKCToBpmaiEQOSULNk+O/gXSxMVDjPda1Z7Sm/CW
        7XtJR8F3BrE2nNuW6L+hEQUGzPDi/drWRWNb57fXQA==
X-Google-Smtp-Source: ABdhPJwtDSdSAO44q6BeLqlIjD2XgZBA9t3YQSpodb5FKKDjqUdo86V5/S+6qFY8mQ16RmOc1Rkfqd+TR4TcPze1UjY=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr7816788oiu.19.1628631261456;
 Tue, 10 Aug 2021 14:34:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 14:34:21 -0700
MIME-Version: 1.0
In-Reply-To: <1628196295-7382-6-git-send-email-khsieh@codeaurora.org>
References: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org> <1628196295-7382-6-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 10 Aug 2021 14:34:20 -0700
Message-ID: <CAE-0n525MQTy8rFF1JDZTqDfGpWZoUTFkqA7Svk1CRkuDmioiw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/msm/dp: return correct edid checksum after
 corrupted edid checksum read
To:     Kuogee Hsieh <khsieh@codeaurora.org>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-08-05 13:44:54)
> Response with correct edid checksum saved at connector after corrupted edid
> checksum read. This fixes Link Layer CTS cases 4.2.2.3, 4.2.2.6.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
