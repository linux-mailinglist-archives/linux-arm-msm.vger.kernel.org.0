Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE1D436ACE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 20:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbhJUSrj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 14:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231611AbhJUSrj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 14:47:39 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9415C061764
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 11:45:22 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id e19so1334585ljk.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 11:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=9MuLW1yfrGnnXorHHuXQXcRAluIurMXU5vrmf/nqkGE=;
        b=FITLZmM/2oE6KZ12z4Oo85YoKei0F42uWLMnZ7ontaKS8PHbrY0Qfaugi2465wnXNJ
         1fFUxxF/tZhW4Jpy10fPp/i8kRij5Z3QLe/WsNl6HLtGtkS1hF7li4+I6pV6tN9PY62O
         zmWUJ18OgEvHA+oSZ3HmZPt7a8MHp05RfAqfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=9MuLW1yfrGnnXorHHuXQXcRAluIurMXU5vrmf/nqkGE=;
        b=bsZ4WkxpkNFh2tHEVLbt8sQzqkjiLjd4C9uGYcw5P9ZqfI9Rc+nklJ703bgGrc2WTR
         lW0wXhlEO3rJNpuP3uhiC1vdzPoCIm0VHlWysnUBf1/TGOY5cVJ4PWGJ9dVvD1cvBJqK
         7oBync6sK8Lwb8cg/rk8LVvodkMw8q+yIb32qlBJ5NgUt1EDxZuB1JUAzUaou/M/g7ub
         gzyh3Ko80YZYbcMBI04JW6/234Ab150M0fn1UcGTDiPl+TPHQNbgA1D7hmEByjM6tWky
         JbH2wtp9Z6PlrcfszYRT6LgnTj4yyPeIc9RZsJ+Oy5xwZS/pG5Koee9fdf0nuW2iAxcU
         S5aw==
X-Gm-Message-State: AOAM532OvcbUFz7LEOhYP4vA4W/ohABkp0Xoo0ewyewPHzj839/76uz8
        AgS94O717PomC4cBdWjM7lgJ7UgJoaMK+Q10fkLXUA==
X-Google-Smtp-Source: ABdhPJwpbVQtsFa1/rdGMFSiAHJ/DrNi3DxrP6HwLnRItX7TvhyyMIFGC8yEIl690fJTmadvvpEHD+Ho6z6kxVBZMW4=
X-Received: by 2002:a05:651c:283:: with SMTP id b3mr7755337ljo.459.1634841921121;
 Thu, 21 Oct 2021 11:45:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 Oct 2021 11:45:20 -0700
MIME-Version: 1.0
In-Reply-To: <1634738333-3916-3-git-send-email-quic_mkrishn@quicinc.com>
References: <1634738333-3916-1-git-send-email-quic_mkrishn@quicinc.com> <1634738333-3916-3-git-send-email-quic_mkrishn@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 21 Oct 2021 11:45:20 -0700
Message-ID: <CAE-0n51Q7Uir5LvmU8MJG-KmNsiYN690xr5svVv8_H=de-EkpA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sc7280: Add DSI display nodes
To:     Krishna Manikandan <quic_mkrishn@quicinc.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kalyan_t@codeaurora.org, sbillaka@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, khsieh@codeaurora.org,
        rajeevny@codeaurora.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
        Rajeev Nandan <quic_rajeevny@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-10-20 06:58:52)
> Add DSI controller and PHY nodes for sc7280.
>
> Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
> Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>
> Changes in v2:
>     - Drop flags from interrupts (Stephen Boyd)
>     - Rename dsi-opp-table (Stephen Boyd)
>     - Rename dsi phy  node (Stephen Boyd)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
