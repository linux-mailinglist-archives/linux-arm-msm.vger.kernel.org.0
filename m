Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDE8F4CC7F0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 22:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236498AbiCCVXz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 16:23:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236500AbiCCVXy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 16:23:54 -0500
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89FDFAA006
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 13:23:08 -0800 (PST)
Received: by mail-ua1-x935.google.com with SMTP id 63so2727565uaw.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 13:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=7SgYE66lSNBfbXKtYfPMd2eJnZt2Qn9IBmBY69OkvEA=;
        b=c52FFpOC3IxjlPN+Nc7NzY/iyzvsZNDOgW787F/Z/O1kbfR1FINg/yN3D3g9pSTbn1
         Z1WmCOZw0/B0jL501VnE78SO4m/3NAkK5Sf7tfJwh+fUBxvsu6k4sDzrzklX/73lba+A
         5O7cTjy06XwKfomgibRsaCoG8vXusZ+PyNcuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=7SgYE66lSNBfbXKtYfPMd2eJnZt2Qn9IBmBY69OkvEA=;
        b=hrtl9LqHNknfm2po8W2vN6Frb0UUfimu8A22ZkfvN0UAJR0ke7HuLNS4lwJxYQMlot
         wnMqFf9Xdv38Rj2XMAtYvTRate6T5qHADKKdcFR6rJbRtz3+kfeeiYDLT5jQGT61h/fW
         Bz9n8TXRUAnDsy8NyLjOmjHRSQ1S/TyboCNN7/c80rdQXfS97p50q2w3gecopqNsrdxO
         ZwoQ5lC4pIu2D7fwKKO6BmP3hV6hEwAZ2+5G7FDqf2/vXOgUaIGOUUDyup3BnwcyOe4M
         Ov9gusFF4fS+bwupPjc8jcpiH6qAtIyoNhx+G6zsuZF7wMDEiGwTvVtsU4AzGHcGltGC
         56ag==
X-Gm-Message-State: AOAM532mqT7v0PE4FndurCelkQcRR8PckQ3XXbPFuX6ET8yIw6e49JKN
        ioo5OCAKR6trvzOZ941Z53KJP0f6+0JuSWQM8DYXyKgmaIM=
X-Google-Smtp-Source: ABdhPJzKDqUE8CMsgi/yYVdb41bUuclCz1cIqjPcyZGDL4j77+L3k0NvYP8fE3Y23DScOxA2sEpMU/dHPZTeU3/V3IE=
X-Received: by 2002:a4a:a9cf:0:b0:2e9:5c75:e242 with SMTP id
 h15-20020a4aa9cf000000b002e95c75e242mr19679471oon.25.1646342577179; Thu, 03
 Mar 2022 13:22:57 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 13:22:56 -0800
MIME-Version: 1.0
In-Reply-To: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
References: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 13:22:56 -0800
Message-ID: <CAE-0n50+s_FSgV5q21DduC4=QFWhsO6WPqENJyM7xF218ec7Cw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] drm/msm/dpu: simplify IRQ helpers
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-16 20:31:42)
> This is the second part of
> https://patchwork.freedesktop.org/series/91631/ reworked and cleaned up.
>
> Changes since v1:

v2?

>  - Fix warning ins dpu_trace.h related to
>    dpu_core_irq_unregister_callback event

Any plans to migrate to hierarchical irqchip in here?
