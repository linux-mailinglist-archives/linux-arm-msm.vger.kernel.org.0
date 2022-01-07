Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7DF486FA6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 02:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344362AbiAGBUy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 20:20:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344075AbiAGBUw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 20:20:52 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F45C061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 17:20:52 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id j97-20020a9d17ea000000b0059069215e85so4991033otj.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 17:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=CxOVaVhRsLRq4HYjShTRxL0ueYps3B6EUDEkdRDY66M=;
        b=Bc4V1bTXXuzXBKN/0105snRyrQuze8wvwlkzqC1644vLFWsn3zSMXhMAunlIfW1i/H
         H2iTVBRkzSk5P4Kl14I28gES3f/2FHaIuUHsqfrWbdlMKP5b1GUw+WYkFMuYk5kUQqwz
         dmHJRUMEqeILxaYz4K3Ga9ncN7YdfSOCSRoeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=CxOVaVhRsLRq4HYjShTRxL0ueYps3B6EUDEkdRDY66M=;
        b=hzAUpC2Jb2vAGuyDcC9il7YoUjhMcjGXUStCSY3FNAAKh8MicblYTbZY3VvIRYAQos
         D8ifJxiqE+BIbsb8MgYD/AElyxKymVFZmRR1iVOZDTbt3DKEh2PYOlAsR3vNIFix90UX
         PiZ/w3LQpVShCEbbtHaCEqlRqqdwLjf17pEpxKExYHPJR9M9QpyR3eomYvK9IEn9YFXB
         X0asy/0T3jdj9/OFk5fE+0PxXJw8zrFaGXpNxh5WpySzcRVzr1GB+MIGaIV8hRhRk6yc
         8ZcQPCruq4XI2spQ45BgmKPlP+b34H7aMgSRwMeXTYNbWCCZHXqgNrtjlYdj6NLjRnGI
         WARA==
X-Gm-Message-State: AOAM530jus7mKyuqjI83bQTcTqGCWO4cGCuS9wSuzsoEa4GbqSjmITU7
        +AQtE6Kk65JKFo/oEQIqJgGcf3cbAScFwtttftZuEg==
X-Google-Smtp-Source: ABdhPJx1QQDJrSBFz4xdC91jJMHJuO28JfFvcCm1pIgqyb9rNoMZxVNCuSqnuEPrtm/rE8qVSc3AUvrVc76Q71cv7Z0=
X-Received: by 2002:a9d:1a6:: with SMTP id e35mr3971287ote.77.1641518451931;
 Thu, 06 Jan 2022 17:20:51 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 17:20:51 -0800
MIME-Version: 1.0
In-Reply-To: <20220105231031.436020-5-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org> <20220105231031.436020-5-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 6 Jan 2022 17:20:51 -0800
Message-ID: <CAE-0n50SzQY1pujP5owR60CCa4at6mgpDXMqhwkwFnhQaY+Dqw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] drm/msm/dpu: stop embedding dpu_hw_blk into dpu_hw_intf
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-01-05 15:10:30)
> Now as dpu_hw_intf is not hanled by dpu_rm_get_assigned_resources, there
> is no point in embedding the (empty) struct dpu_hw_blk into dpu_hw_intf
> (and using typecasts between dpu_hw_blk and dpu_hw_intf). Drop it and
> use dpu_hw_intf directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
