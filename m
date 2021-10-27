Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E65D43D377
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 23:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240937AbhJ0VFc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 17:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234360AbhJ0VFc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 17:05:32 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A6D3C061570
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 14:03:06 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id n63so5281635oif.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 14:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=K1cJbfN0OSOMsbFbVCJ0EO8mI0HlFfWYSQvqTD00ru4=;
        b=e35MzeQrMXHSsSdMjyOv+zh1luLWn9GrVbs5Hb4Oy5C4QMhydNIfOOCx+V/4wuT2OA
         JpTpTEp4av9Ds5cnAqZqJVPlFqwB9A1Ib8loZUcuXgaKd/EJzTs9oikW/u8LH6DR7IdR
         hSoYLWZ60pjeAEQxTcKpMn041AieviHlkwWbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=K1cJbfN0OSOMsbFbVCJ0EO8mI0HlFfWYSQvqTD00ru4=;
        b=hdy/Ey0fAjseXwvzDwsXogGuaQZ0VrI0UvowZ/t+PsKGcJMJFtNDNyk107lx891VhU
         oDo9UdEzsF4bcu0CMC6/NZHBamEdhOnrgyvXLjxIlJcWHjkbU/+7mxEd+zx5nf5zyvvL
         JGBRbqcTmlC4WpTSE92Y0MFtJNnkzwj1jac6fJVdd0KM7RLCb0Rkqcek5GgUWjZheWkY
         bD9tCY+fB1nZCYQ1tAryEGI+AH0aiL8xOP5bW9t0q1mDVLGU3hdIjHBk+a1RjPC4sApW
         q1hQJ5UqDincEGscMTNJqDbUuN+lSyqRES4hhO3geW35uqWcKHxahGqqS9P16/UxCvGr
         yB1Q==
X-Gm-Message-State: AOAM532MfllFOXxYpsaCG5Eq/ZTDqAoZRr/YnIqbnMPUpRO3nZBbEupy
        XNaI7wtyKwG5SsgTuLZTAnKcYDyY4uFgmn73tmpj1g==
X-Google-Smtp-Source: ABdhPJxHw7dmKoTIvG/anG/8Dw0L4C9jo9mZ+kAZqCRF0a97PQ4X738EkYlKk/qVhI6mGSLA+AD4D7F/zXlNIYK+1ME=
X-Received: by 2002:a05:6808:23c2:: with SMTP id bq2mr5657582oib.32.1635368585748;
 Wed, 27 Oct 2021 14:03:05 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Oct 2021 14:03:05 -0700
MIME-Version: 1.0
In-Reply-To: <1635250764-13994-2-git-send-email-srivasam@codeaurora.org>
References: <1635250764-13994-1-git-send-email-srivasam@codeaurora.org> <1635250764-13994-2-git-send-email-srivasam@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 27 Oct 2021 14:03:05 -0700
Message-ID: <CAE-0n51A80C3J6t+GeADU8e4dVJBu6JX-DmVXquWK+a9ysfyWg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] ASoC: qcom: soundwire: Disable soundwire rxtx cgcr
 hardware control
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, plai@codeaurora.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
        tiwai@suse.com
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2021-10-26 05:19:22)
> Update soundwire master rxtx cgcr register field to make clock gating control as
> software controllable.
> It is required for soundwire v1.6.0 and above for RX and TX path to work.

Why not do that when the clk driver probes?
