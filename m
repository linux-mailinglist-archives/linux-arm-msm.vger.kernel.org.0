Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEF914A7AA6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Feb 2022 22:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347722AbiBBVyb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Feb 2022 16:54:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243787AbiBBVya (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Feb 2022 16:54:30 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F4BC061714
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Feb 2022 13:54:29 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id t199so922701oie.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Feb 2022 13:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=acQVjWKYeBqrGlT8JOrykVFoHSpHX2aivgX9GnGPvpA=;
        b=glPjxi0FLwWoVIiT2y7b8kOIkcA9TF/pKVsHM9W0Zem+9ykyw9JzBn8zEDLt2JWJro
         F/BUIhr5UfohIABInMTnoImT3QnU2yn6ANnzds6M+bl1A7vapMNlYmQbXBvjgj6Lg67P
         pLjUc5PxvQfKPiA71xqKgBwfyLpD/tChQl9pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=acQVjWKYeBqrGlT8JOrykVFoHSpHX2aivgX9GnGPvpA=;
        b=kHACZ3PM2BybdD3D9u1vF/grAiJ3hjUfNoqvc02RqIPPj6QwhzFj2jvfFWAHc0i30q
         XUnoCF7v2m1+cabkVFU8iG5HbNTAsxdCptsLe4xhDZ2FgA/P2ONAV9EU+87IGo75O2PL
         KHQBSYeqSTjsAVg+MBwN0SMNPnZ/ihCiuFedjoF/b48i576S3IxHeLq1Q4TCukbWLA18
         2eg4kdsBRTIz1VrdlP/daiuhb+NOUNxhUI4uJeFbMJi6asgofqiBgEsYpza7/NvGnQ3Z
         nnd84NOZ4Bj53N5/Jsap8b/TZILpW0Rxy0JBmIIca99c/kcD9a9rAIqVYVQqw+5wkLLn
         qw4A==
X-Gm-Message-State: AOAM5300yGKW4E16v5RdBPBlibfl9iMPyS07Tq+vEcFTC0r+rWUR6NQB
        Yypgu8VIUr+Haukok4QTgs9QSeHByh8WZm3pc7Slkg==
X-Google-Smtp-Source: ABdhPJwVCGpwPJV5uL/f7GjdcYlEJfYQrgUgFJZ4EiR58PChWsEuL/zlZA+IBfjxEJ7UVpn0w1ICD/1eyHOUY8+ny4M=
X-Received: by 2002:aca:df82:: with SMTP id w124mr5918431oig.112.1643838868851;
 Wed, 02 Feb 2022 13:54:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Feb 2022 21:54:28 +0000
MIME-Version: 1.0
In-Reply-To: <1637046458-20607-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1637046458-20607-1-git-send-email-quic_sbillaka@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 2 Feb 2022 21:54:28 +0000
Message-ID: <CAE-0n50sONq+URcWwvDH=UPshgy6+XZEB3sK_4n+5jNktHsEhg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Add support for eDP PHY on SC7280 platform
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     robdclark@gmail.com, seanpaul@chromium.org,
        quic_kalyant@quicinc.com, quic_abhinavk@quicinc.com,
        dianders@chromium.org, quic_khsieh@quicinc.com,
        quic_mkrishn@quicinc.com, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sankeerth Billakanti (2021-11-15 23:07:35)
> This series adds support for the eDP PHY on Qualcomm SC7280 platform.
> The changes are dependent on v4 of the new eDP PHY driver introduced by Bjorn:
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=575135
>
> Sankeerth Billakanti (3):
>   dt-bindings: phy: Add eDP PHY compatible for sc7280
>   phy: qcom: Add support for eDP PHY on sc7280
>   phy: qcom: Program SSC only if supported by sink

This series was sent to the wrong maintainers. It's in the phy
framework, not the drm framework. Please use scripts/get_maintainers.pl
to find the right email addresses and send this series again.
