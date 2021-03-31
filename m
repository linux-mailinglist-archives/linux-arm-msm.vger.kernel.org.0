Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1543505A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 19:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234035AbhCaRjd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 13:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233900AbhCaRjV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 13:39:21 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B03C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 10:39:21 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id h3-20020a4ae8c30000b02901b68b39e2d3so4788642ooe.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 10:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=NkmFG1QTNaWLlvVjiv9pwliViB1M7jgJYDg2EZ3dMok=;
        b=TOLHVqL6Jx5pJUAWNL03GOlOr0ER1zBiBJAjBVnEGnlrF04kV320+FUpdYBKVW+egA
         jPCDUgkB4zCW/A06Ju7bBpMInk36eKdBlwd2d1RkNpPgfx59ptOfA1o8FJnDeN2wPIGv
         1kNbXvlMwzhLZe38pcCFWxsF1RJCHiLeYggDV7L/rNYO2iFjQAJ5p39gUmgU0SAOrlul
         8Xef2fcv6lZNF3J61QQfUEvfuIH4pgkvr4Axk5Ak2NCXXkRIgkQRHcXQKtVjmDhEp7NW
         4urErfWt521Hv9I0Js7wceHPr+SDyXeW5aR20MTOI4jQ5y0scz5QsY6gWCJNvyAjKF5z
         F7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=NkmFG1QTNaWLlvVjiv9pwliViB1M7jgJYDg2EZ3dMok=;
        b=TtIIvL/nC1c87BzoeZoBWnbxetLoGhpGKfVBAQL6R7a3fCGNI5vUB6/PaPDoQGVL9P
         9LeGk6SKiOwhrS2ZfQ3WpvtX2z6/HNl0N9lI1GPAH5StD6/zSZbjb9aH2+MpguV+02Yc
         6eZeyx/wJUJRWpvCGQi7b48kakoRZTh8MG4GU3+pzFdf4mpZYG+1FoB043phG3XhuAKM
         51/Awgx5q/5dmAeswRmEZwBQOZ2NCA/9qeORsaOO4QCTkrpwp7p6xCRtR57iQdQY5uhd
         POX5OSunxe6hJZHDziLOPoBSJBhhUpVJ7r3isaZrroxI1s+cx8DYsjGZuTIs9TFmj9Kv
         7E6A==
X-Gm-Message-State: AOAM5337efvRggTc/ST8/4SQhIIY+1oN1Lht6FGn9ZgrtE/LwKhIThf+
        1M8OtfgsbWLn8RV33LeN0IHFBg==
X-Google-Smtp-Source: ABdhPJxprMiF0zGDn3aiZrgY4HoSDJt/e63ieUbL0NnjzPGhqKsxJMPTarGSMdBCXnNl3lnPLITsxw==
X-Received: by 2002:a4a:2a46:: with SMTP id x6mr3638863oox.85.1617212360914;
        Wed, 31 Mar 2021 10:39:20 -0700 (PDT)
Received: from MacBook-Pro.hackershack.net (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id v1sm557900ooh.3.2021.03.31.10.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 10:39:20 -0700 (PDT)
Subject: Re: [Freedreno] [v1] drm/msm/disp/dpu1: icc path needs to be set
 before dpu runtime resume
To:     kalyan_t@codeaurora.org
Cc:     y@qualcomm.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, mkrishn@codeaurora.org,
        hywu@google.com, dianders@chromium.org,
        linux-kernel@vger.kernel.org, mka@google.com, robdclark@gmail.com,
        midean@google.com
References: <y> <1616404632-13693-1-git-send-email-kalyan_t@codeaurora.org>
 <823f7f00-444e-8e22-e8d0-2ced97e4c291@kali.org>
 <9847b4af5331f86641eb7be5a932078b@codeaurora.org>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <b98d5a32-1776-6ae1-69ec-e06bc7143695@kali.org>
Date:   Wed, 31 Mar 2021 12:39:17 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <9847b4af5331f86641eb7be5a932078b@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/31/21 7:34 AM, kalyan_t@codeaurora.org wrote:
> On 2021-03-31 00:04, Steev Klimaszewski wrote:
>> On 3/22/21 4:17 AM, Kalyan Thota wrote:
>>> From: Kalyan Thota <kalyant@codeaurora.org>
>>>
>>> DPU runtime resume will request for a min vote on the AXI bus as
>>> it is a necessary step before turning ON the AXI clock.
>>>
> Hi Steev,
>
> The WARN_ON is true only for the device with compatible
> "qcom,sc7180-mdss". For other devices its a
> false alarm. Can you please try with the below change ?
>
> https://patchwork.kernel.org/project/linux-arm-msm/patch/1617190020-7931-1-git-send-email-kalyan_t@codeaurora.org/
>
>
> Thanks,
> Kalyan
>
Hi Kalyan,

Tested here, and it does get rid of the warning.  I'll keep a copy of
the patch locally, since this is going to hit stable too at some point
it seems, at least until another version comes out addressing the other
comments from people way smarter than me.

-- steev

