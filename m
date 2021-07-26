Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 005BC3D68B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 23:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231959AbhGZUuq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 16:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbhGZUuo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 16:50:44 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF93AC061757
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 14:31:11 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id o2-20020a9d22020000b0290462f0ab0800so6693495ota.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 14:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=2nXaLs/a4QnWZ6CsBprHQUZ0PT34FLzVCZM7MpduHa4=;
        b=gQGAGt9eEIgv8OU25omKBzR8PLkHSLWDrPryqtU60qn5PueYnFkrrRF5sZmw8zvbW8
         VNvqSxzJKU4JHj3qQjp0n6PyQtHvjicciYGeODKdQPIQW3jy2u5oycvxVco1k8n0Ln2x
         voLvNquo5k+uiomYEnvZohtgMYMykoPKM0dHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=2nXaLs/a4QnWZ6CsBprHQUZ0PT34FLzVCZM7MpduHa4=;
        b=VPKRYHGbf6V3MqzPrjRY8pknkGDaei8kRXSUqFAPF8b4IJJ4JikhaT6n8rL7yMdFxv
         drC+Px6G3bav+3kczJ3DbWEUm1L+Ey4EUROAHPGoCMa2snOXHdk5A+37CZXtBeelsG5Q
         kaMOTuuHKo8Ifjf7vrp4CGFlJk+k7QibgMmgI7FJ0CbpnQxW+oMneaVtZHHl+6ud/UZZ
         16m2bIwBXsduhHUjYAcgJ91ypDPMJdO8F7b6pcKpPyR5rGKrZYBOaFJ0JneTjUEAJeBC
         qcGdMJJGiJ3JZZ3RHgtNeUNL8fvrBWhrda0WW22Bo+PpqN1fEhYDf2sVV+20gXDW3Bpb
         5ZAA==
X-Gm-Message-State: AOAM531V1Wk2BiE09QMV7Ptwb1aqd2ZK7DZOIJ4TsBXXH6V29thbywiY
        Jo6VIyYUNVFXKkWfpwWbfQ5K9aS6FsroM/opFCZ49Q==
X-Google-Smtp-Source: ABdhPJxwnRHClL4PJXQ2kAmJVcUKbc5TCfHvRyXzHShrdN8UAJDxajrWEr88V72kZPeMp9GmmNEQVKgYIcGEH0FLNgQ=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr13316575otl.233.1627335071314;
 Mon, 26 Jul 2021 14:31:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 17:31:10 -0400
MIME-Version: 1.0
In-Reply-To: <1627320986-25436-1-git-send-email-maitreye@codeaurora.org>
References: <1627320986-25436-1-git-send-email-maitreye@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 26 Jul 2021 17:31:10 -0400
Message-ID: <CAE-0n50gGT8nfQ0KEnCG=g2DiQdCPpQZsFOVB_8iROmHXXjNFg@mail.gmail.com>
Subject: Re: [PATCH v5] drm/msm/dp: add logs across DP driver for ease of debugging
To:     dri-devel@lists.freedesktop.org, maitreye <maitreye@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org,
        abhinavk@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting maitreye (2021-07-26 10:36:26)
> @@ -509,6 +515,7 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
>                 DRM_ERROR("invalid dev\n");
>                 return -EINVAL;
>         }
> +       DRM_DEBUG_DP("sink_request: %d\n", sink_request);

This one is bad. sink_request isn't assigned yet.

>
>         dp = container_of(g_dp_display,
>                         struct dp_display_private, dp_display);
> @@ -523,6 +530,7 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
>         rc = dp_link_process_request(dp->link);
>         if (!rc) {
>                 sink_request = dp->link->sink_request;
> +               DRM_DEBUG_DP("hpd_state=%d sink_count=%d\n", dp->hpd_state, sink_request);

Should that say sink_request?

>                 if (sink_request & DS_PORT_STATUS_CHANGED)
>                         rc = dp_display_handle_port_ststus_changed(dp);
>                 else
