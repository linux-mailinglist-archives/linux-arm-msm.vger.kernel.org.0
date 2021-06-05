Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD8A39CB2F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jun 2021 23:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhFEV1c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Jun 2021 17:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhFEV1c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Jun 2021 17:27:32 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4394BC061766
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jun 2021 14:25:43 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id t40so712303oiw.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jun 2021 14:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=nDGVMkwUgwdjkEH0hG7ASi22La0UWmLtqIvR+gpN50c=;
        b=BTK1W0VgQTwdsUqPJC2JMeWQHe/oG0sV0uSI7t/AuJN4FhyLldkvR/V50OgZ1WkQ3Y
         E2KIBDbE8jzDxK1L8GQj9FHWF9sbHqjk03gw52+j1vksR4WcFb8pBAhOtA6ILoPRRF/5
         Fu0bRbfzhLXQVRZQLg4nMWzU19aRBMl0wGMo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=nDGVMkwUgwdjkEH0hG7ASi22La0UWmLtqIvR+gpN50c=;
        b=KlsMuM2YIo8Q1/VdFY+Uh1LCDAhUUcLag6X3U4YMA56MXZ3/NU5c1Ip8Yz8Q0wxm54
         OqDZ/NSTDucFGowD1tMXoNxgAO7oqel8A5GvzyLtLwdVL+5zw962YW9x0iH/SS40PG/+
         2JHiYSEHmDTJVIFCFnnpza7Z2ECQMcyD1oNPLYhJkK33dYw66HzSOeRP+dB8IEvDW8Aq
         t7EkZCPztuKknOqpYCbUPHcXx4aNFNu0qpr4vlTxarLPtmbbVZdYBSPXpJURYedT97oE
         jfp3dl8PTGbIGpcnubo1qGy3SdimaE1I5ZPmsbetWsRsEoCYsKT/QzFPIP2jwWhtTiVv
         lGeA==
X-Gm-Message-State: AOAM533Wq/oAT5kRO+uGIPXL2lF57dYVF0mNDMVWXDoTgnoDgCxtJIl3
        9FAeHmCkJsibAHuctVNfwGtoPB4oizqb5kN1RWLvfg==
X-Google-Smtp-Source: ABdhPJwqWjgtkV6EVmyoaOkoIT65rH0dn9l4jgw00hx1mo9ouL6X8MY7KOpfRx2AQCm8fVUEz37W3iRqokSQ23ETSXo=
X-Received: by 2002:a05:6808:144e:: with SMTP id x14mr15519145oiv.166.1622928340013;
 Sat, 05 Jun 2021 14:25:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 5 Jun 2021 21:25:39 +0000
MIME-Version: 1.0
In-Reply-To: <20210605123543.8986-1-bernard@vivo.com>
References: <20210605123543.8986-1-bernard@vivo.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Sat, 5 Jun 2021 21:25:39 +0000
Message-ID: <CAE-0n513KEA+_5m=X1EKjnAbVVAeGXADqJ+S=Hs+E9cr7gEzJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: remove no need local variable
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bernard Zhao <bernard@vivo.com>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Guenter Roeck <groeck@chromium.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bernard Zhao (2021-06-05 05:35:20)
> Unneeded variable: "ret". Return "0" on line 880

But the variable is "rc".

>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---

Otherwise

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
