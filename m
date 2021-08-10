Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 719423E5056
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 02:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235701AbhHJA3K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 20:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbhHJA3K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 20:29:10 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE494C0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Aug 2021 17:28:48 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id d10-20020a9d4f0a0000b02904f51c5004e3so15702234otl.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Aug 2021 17:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=HRoKBbC120mpZO7Rwf3yY2Wqv2ZDw0SsZhaaP3iG9Kw=;
        b=b7oTI7pXK4UvT/slNhXBHpYCZP7+MeBmfeSSbjI/aKYSqGEunyiYcIMcqA1eq8BC+H
         oBPqmdPIA6cv0p6LCUDFdtUC2mXrZd5B+ZzB5di1KJyFAwfYBrwtoEgy2bp7dQ9B6FCr
         yJ+hAioIV+wD6A0vvTE08xu163VL+w/zKRi7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=HRoKBbC120mpZO7Rwf3yY2Wqv2ZDw0SsZhaaP3iG9Kw=;
        b=gTgZE0KwW1M3pFwhJc2hFJvEWVOLLw01dkgTOCbva1/SdwYejbFRUpqEw/NIRr7FJe
         bnWyZq7tk5R1S/rGJ7c44iFZ21HWCQXfKbuOzb91WiPBTAArVjcLoequS7Ad66fr/Bru
         TEFP5qG8ZbRiGKff5M+eA8xKcwAlDipDCkefWMWgmmp0oA8Y9HG5MKFcEg6XqM4roskf
         6elhEF5W0zmDDBN5wSuMLAELoeyf5JHvn22SNrBhRKHpiPxc+RECbOTGDbG7VSuWY96G
         YYKMkrwloh//ex8KrxYjEo5expbsAz7F/8TOFnjvEpc5/fOtMwMUFXsaZfJpj7I6pqDN
         Olbg==
X-Gm-Message-State: AOAM530WPa3r0vzBxZL/ZgVDHaUxKwEYx8Jdh4Hkf4MxkNAR4KoAOkk+
        ERTwoSyqfK3709NBgJGB+GD8r/o7JOtGKEX2+Gc6NQ==
X-Google-Smtp-Source: ABdhPJxoo8NK9wFlwHerqC8A8M68otlXDKJXzE8FXoEI3Z9Tb47KJ4Do1b1frIJJ5Zy4cKOXDh55LHg6NY73iIRVaGI=
X-Received: by 2002:a05:6830:1490:: with SMTP id s16mr19010939otq.233.1628555328400;
 Mon, 09 Aug 2021 17:28:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Aug 2021 17:28:47 -0700
MIME-Version: 1.0
In-Reply-To: <1628546337-15517-1-git-send-email-khsieh@codeaurora.org>
References: <1628546337-15517-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 9 Aug 2021 17:28:47 -0700
Message-ID: <CAE-0n52Ebezuek_HrBHRFVyUv28aj=F+6FqnBkZZLMYwUa8veA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: add drm debug logs to dp_pm_resume/suspend
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

Quoting Kuogee Hsieh (2021-08-09 14:58:57)
> Add drm debug logs to dp_pm_resume and dp_pm_suspend to help
> debug suspend/resume issues.
>
> Fixes: 355ab7428f09 ("drm/msm/dp: add debug logs to dp_pm_resume/suspend")

BTW, I have no idea what commit this is. Best to probably just drop it?
