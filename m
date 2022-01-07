Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 649A2487145
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 04:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237188AbiAGDhC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 22:37:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236277AbiAGDhC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 22:37:02 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B2BC061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 19:37:01 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id n17-20020a9d64d1000000b00579cf677301so5283842otl.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 19:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=V9mvsC6DGuIKmVWqSZ8Hh/LgnzR2ZGlGS22EsE3aa5c=;
        b=gSpK8J4n7dxUsqwALzCNvN8wJ70GBoGsNjlrkbbYhD6WU2pNysbn/qal1NnPO+NrFM
         dj8t9ARs4nKO0fUdROf18x6bcu2KIZdRw/sU8s2RfNKQ8xpYwtJtmpSEuRvmrD4yTf8x
         O9P2bBGAeDrkzbCwSyidZj3iKWyTSeh2rjVcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=V9mvsC6DGuIKmVWqSZ8Hh/LgnzR2ZGlGS22EsE3aa5c=;
        b=L4gaaRFOVJooTiwKb1bO/LIU37R2WUiIWzUX0GAScAlXnNwjWa7KOkR7Zc4pURqpVf
         OPR6hRzEN4+iOnhvw5lm92h4NiTxLvBcXRc1lRb2Xd+ElnD5l3QWF9jvzLpByb+08Xjp
         dCr4F8fp9jJB7sXh/pj5jhL+NtAvLlJtOIJ2OPHaB1tB6SMEo1kF5Z2AOoP2y1VrkFFD
         EQ2HXviPH2WiKU0htXv5wQkdCdwLgFiSRHyyWdkPPNqMKOpyXftMdp2as83u/kqZaJuQ
         5hP+Snbzx2gSUaO7lYkV2rcZU6w+sAKKUSAmHsSoeIZ69PUP5IGZcpl7BXvBGY9e0gAq
         RJ2Q==
X-Gm-Message-State: AOAM532UmDojfgk8KhdQlI8zjFbzLs+T12kM4PMjNsnfP1Tok+/xSUUZ
        DR/9xPw9YzfSrhwUMmou9c6Mr+O8+pmGv8vZAVPIqg==
X-Google-Smtp-Source: ABdhPJyU0TGUnomL9oIu+YtgauKLIsxl0/No+gbVlEzQt9cSRx7b2g8hXaUYCjWvRTpSAEFsVO2YQWTDsqh0nBzcZyY=
X-Received: by 2002:a9d:7451:: with SMTP id p17mr1037416otk.159.1641526621309;
 Thu, 06 Jan 2022 19:37:01 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 19:37:00 -0800
MIME-Version: 1.0
In-Reply-To: <20220107020132.587811-2-dmitry.baryshkov@linaro.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org> <20220107020132.587811-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 6 Jan 2022 19:37:00 -0800
Message-ID: <CAE-0n52vvqW7ba5zw_jrqpW=ky_Pas=binMe-nYbr=8OQZs_jQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/7] drm/msm/dp: fix panel bridge attachment
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-01-06 18:01:26)
> In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
> enable and disable") the DP driver received a drm_bridge instance, which
> is always attached to the encoder as a root bridge. However it conflicts
> with the panel_bridge support for eDP panels.

Can you elaborate here? How does it conflict? Could be as simple as "it
attaches before the panel bridge can attach to the root" or something
like that.

> Change panel_bridge
> attachment to come after dp_bridge attachment.
>
