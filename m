Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC2C3D2D8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 22:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbhGVTj0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 15:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbhGVTj0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 15:39:26 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC331C061575
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 13:19:59 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id a17-20020a9d3e110000b02904ce97efee36so1179880otd.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 13:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Fe8pajUE7NDpP+KFoDH14YyaziM8HYOjmxDI4HcE0+Q=;
        b=MrwpkA0AeKDnvtOPhOU+UgtudfAtOHCjLbSpo3JiDU9qOHMaYB8ODyTaQa2sdqp2SR
         izy7tedILcpoCkkMAX8UpYpLS25bl26x1U+mXQo/9n7204kVjnVmNMwqnRTk+SnilJ6p
         yLBa/1IdvxnerBSnyho0pG+5tT5P5QtxJGemY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Fe8pajUE7NDpP+KFoDH14YyaziM8HYOjmxDI4HcE0+Q=;
        b=n2QQPXMcZGTQf3cxqFYQ09Q1fzqD7nfxoPRFLFKltWHK/dL+T39usYxzhvIm6VmVTz
         AWHHzInriIQDXKOkJogLWS1akoK+XlGxSlKt+PdDWJSW/V1u6aHUhv9Qleu5QCYE3d3i
         H1vU3ILr6bOv6WDPksCS1G1S5zb4Mf3qbSg2xUSXeZuJCzTh07AgExrRBMmWx8d8WmmP
         qfhOFLIvpelYs3PwNpUBacrci6/SqI7gXvePnWxDKCNxiiflnUIL+7Imn6i7ZbfizGaV
         0b96WWKyVuv4cEzPNdZlY962IGMjOnUSo2/0KNmy1tMnBtfk8+Or2s6+WzWfqK9V9qfm
         GgDA==
X-Gm-Message-State: AOAM5308b0k6eN3iEPBGFIYzgnuFVGXsXvy/z0rMY1K5jHR/QrUylsnj
        BTr9fk4GNEvsZNkrwoY4XFm0Mix0enc8Wno8m6Y3rA==
X-Google-Smtp-Source: ABdhPJwt7g/hkXpMcwuy3NhbJrzVZd1klNp7hUF1Csjwy5CxmWyIavZZtANOEVOAjS1O5p8mwwxI8J4B3J06pIKbg1k=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr1004458otf.25.1626985199252;
 Thu, 22 Jul 2021 13:19:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 20:19:58 +0000
MIME-Version: 1.0
In-Reply-To: <1626922232-29105-1-git-send-email-abhinavk@codeaurora.org>
References: <1626922232-29105-1-git-send-email-abhinavk@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 22 Jul 2021 20:19:58 +0000
Message-ID: <CAE-0n52zudM+tiByvhNbiBeoYwb+hSqtH0yDgSPU1oTinnSO+Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/dsi: update dsi register header file for tpg
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org,
        dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Abhinav Kumar (2021-07-21 19:50:31)
> Update the DSI controller header XML file to add registers
> and bitfields to support rectangular checkered pattern
> generator.
>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
