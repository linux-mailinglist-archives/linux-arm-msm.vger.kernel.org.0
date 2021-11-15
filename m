Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4E345283B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 04:09:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239736AbhKPDMm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 22:12:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239824AbhKPDMk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 22:12:40 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6474CC10E5C9
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 15:39:28 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id z2-20020a9d71c2000000b0055c6a7d08b8so30298304otj.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 15:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=0r6JTcdejGzU6nsZn/1Xqgl+XNT+bHSUSIJqwEF6P5I=;
        b=HWhPucp0iue/5BCvKtcMziH/SE9slJFIAE5tlwez/Q8+1HJGha6SJ8GlkG1CmG6s2+
         2R8+3Sl6It+RGVDcidgJqLZWNNfZsyBtflsD+zEJGUXer2TuehVftpnXkA8dIPYwAinn
         N29XMNSd/DijdWsqj5XEMxPosQuePaHFfYE5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=0r6JTcdejGzU6nsZn/1Xqgl+XNT+bHSUSIJqwEF6P5I=;
        b=XChfqJIy1lYPsyEybCYYPR1sx358/JBkP/4jGyQAOLZHUsqJE602uwBMBLy6WFaCKA
         QzRYuMTvUuoZUISUWsl0qLmbWl4X46QFUaGJVi2sMu6aX+iN1rGRAN+nkk9/8/uaM0pn
         NQ9975HZG7/eBfCg9gYcBu9MB1BOKDM5konn3/ysJG2n2zxhJIvS0sUWU1Sg9ljT2O18
         Lvs+JCndzcJzb+nNkHFZqlP4cUxwjATNKH7nUuUMFSvrhPjcE+xmoBJDHZsrjRSwUCff
         1HewdvftwYRtlcGrJs9u/A2LQrmovoe5aPktxIK0tl14ETQcVwwn+lfU0JUizN/AIumc
         PeXQ==
X-Gm-Message-State: AOAM532O234LmINwnIlpKPoVPCwNuNod4MFmqse/ffyxkjMFec3q/0yj
        CXpNu1edy3w2xZ8Rg6ve2PP/6EsXgPQMKtY2kuqCjw==
X-Google-Smtp-Source: ABdhPJzC1gjX/8UQ6va8Dux2WwnKx59xgq+wgXAUVpZ1ewPHwjoYDMuhWR0XxIu9/V2evROn1oFvLn8lYWyyy69HTTs=
X-Received: by 2002:a9d:7655:: with SMTP id o21mr2383170otl.126.1637019567581;
 Mon, 15 Nov 2021 15:39:27 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Nov 2021 15:39:27 -0800
MIME-Version: 1.0
In-Reply-To: <1635896673-5841-1-git-send-email-quic_khsieh@quicinc.com>
References: <1635896673-5841-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 15 Nov 2021 15:39:27 -0800
Message-ID: <CAE-0n53ArJSYEAtLbc5dFrPspKhi3Kv=hpu=wS1TMsOWcmz6pw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7280: Add Display Port node
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        robdclark@gmail.com, robh+dt@kernel.org, sean@poorly.run,
        vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, aravindh@codeaurora.org,
        quic_sbillaka@quicinc.com, quic_mkrishn@quicinc.com,
        quic_kalyant@quicinc.coml, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuogee Hsieh <khsieh@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-11-02 16:44:33)
> From: Kuogee Hsieh <khsieh@codeaurora.org>
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

What tree is this based on? I don't see edp_phy upstream for sc7280

Otherwise, looks good to me.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
