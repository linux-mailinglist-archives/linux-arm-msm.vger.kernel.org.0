Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48B08454113
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 07:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233781AbhKQGqk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 01:46:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233761AbhKQGqj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 01:46:39 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0ADC061746
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 22:43:41 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id t23so4292228oiw.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 22:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=yTAfmJ0bF8bSpAIUOFMDRewe/b9IF2HUsW2XZzfQGbY=;
        b=cDTxUGFgV+D2sWJDHB8Zi9H3rp6GLIGbwCi5qGeau2co/SriSjaDiymu3yDRMT1rF5
         4a6UtJ7a6xWVyKz8fWziI1O/HDtR/5w9dXosg9B+rWhGtewQxhYEoSFzoY1eyJMEaqwK
         nwkal6A6S+uqNqnk52M/yvJgNQF8JtK9UimdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=yTAfmJ0bF8bSpAIUOFMDRewe/b9IF2HUsW2XZzfQGbY=;
        b=gjwtXJWRgCNZO2yH2VYbKgVT/e7lvdv/3s7a2YljzpCjfrAsbqlVTC2RqDmX2cfPO8
         f3jfks35+tfxH4xMpEgNkXmVKo7oynOOd9fFQTIyONL3HfDaQW74qQPJtrTZ+taA/3Qc
         xUvG3+QuI73KYww2ExYG1hM0VSuHF+cAA4mWeoxyQ0OnDy4xWpWRNiiU/CZf245j0qWc
         Ba99Bz/2e6AcmInhlFtI7krCheiKF95Mm2TwMY31VZ0CZ/GWwyhDOEPBhHXeHAAxtEYD
         eG8AK7XxAYvUMyTSSzJJLJNyRA9v7yZFCQKI38figFwfe5+9fX17y2S86g6bKroNc6xf
         xzTw==
X-Gm-Message-State: AOAM532eVQxOb+XQIpwQ7FdlY/IKVovpCx37NNgqsGLGoVzoKHfMArW/
        ljZWz/w/SWdmhUyi5Gt0wAcWU6nEQcrm/GVFL2HGlg==
X-Google-Smtp-Source: ABdhPJy9zCKUwdtUbQh78Q+Mv0EaKjj2J6iuCujpOCBSenzXXg7GYdTuGTdgDNcZxW1F9VTN+CjK8QtCOOdSrwB/lfM=
X-Received: by 2002:a05:6808:211f:: with SMTP id r31mr12120140oiw.64.1637131421167;
 Tue, 16 Nov 2021 22:43:41 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Nov 2021 22:43:40 -0800
MIME-Version: 1.0
In-Reply-To: <1637046458-20607-3-git-send-email-quic_sbillaka@quicinc.com>
References: <1637046458-20607-1-git-send-email-quic_sbillaka@quicinc.com> <1637046458-20607-3-git-send-email-quic_sbillaka@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 16 Nov 2021 22:43:40 -0800
Message-ID: <CAE-0n52n1qzrODJuFN7pnWvj-31uGop9h+HTUY7wXuuX_sO2SQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] phy: qcom: Add support for eDP PHY on sc7280
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     robdclark@gmail.com, seanpaul@chromium.org,
        quic_kalyant@quicinc.com, quic_abhinavk@quicinc.com,
        dianders@chromium.org, quic_khsieh@quicinc.com,
        quic_mkrishn@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sankeerth Billakanti (2021-11-15 23:07:37)
> The sc7280 platform supports native eDP controller and PHY.
> This change will add support for the eDP PHY on sc7280.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
