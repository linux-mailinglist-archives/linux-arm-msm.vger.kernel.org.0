Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4492480CA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Dec 2021 19:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237113AbhL1Sto (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Dec 2021 13:49:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231658AbhL1Stn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Dec 2021 13:49:43 -0500
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37011C06173E
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Dec 2021 10:49:43 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id n3-20020a4a3443000000b002dad63979b8so5063110oof.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Dec 2021 10:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eXhwfFLm6xuRXH07dJ43yJ+pTlr8xJ8+NlyVlndnfCM=;
        b=tsMCTyQL8yJvHEdjhTZNmLbJ57UAa8DmU4t+AJIjvr371gGhUD4TpfUfYQ+wQ74Imv
         GaoTxx0a03liOrWDFTeLIJCz1QWWvFJ0G6VIj7rkBgnwyPISmapj8NcRCURqS5IQ7I/b
         h8pLQWqR15McqilHIGRd9jtVaklDqDJRvrIC5hueGCx4lw0QBN/tFoe4Hbp9z4QxCkb5
         C1seEJxP7fvY6+cfZh4ZxgXtihTJjJP5yHQfR3pcueda7gQu0CypJ/kHPJVXWCsbN7hB
         iOezJZgrSR1fEP5Y+xvs8FkNRG0xJcHg6n8H/elrrOeVVr+F83OilwPLezSr1XU7Kha4
         t8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eXhwfFLm6xuRXH07dJ43yJ+pTlr8xJ8+NlyVlndnfCM=;
        b=aNGpxy65F4MHXUrb9X/En0yfv3+OhnO5oy+zbcHgRRGDADFF9nk2nGicX2Ir3dfomL
         fnGFEpkaHm1Erqpv9obAB5QTfFYqYUAk9EnjxhKRhzBb0HkEzgEwDHjQbDnEJFLvxoYj
         /ajCclIKCAD2hYBtNNLl97/L+SnbmDEig0VxvR03rDCY7yhNf6XkzSImXOXCO1ODSfWA
         3KnOQzVnBPrqMufk4eibLQYmZRZuFcgmxRvN4qQJHaYanDKmznjhlhD0jMdIQXAdn0tm
         Fqh/SBxKg/u37swJ/px+36V5ZrRHzTWikcdwELu+0B5hXbb6EKo+s+ueruvbtNFcrBwt
         900g==
X-Gm-Message-State: AOAM533/PZY9xkCX9AN84EBBH0Hpo3jqwBFzCy31NhobZMNeJ8OqaWo7
        lQSc6LfJyjiyyJ2Af/rHHhzmSA==
X-Google-Smtp-Source: ABdhPJxFcz2lm2/hfGgOO3cwto/v7M4ze2hWUHK5rd5mQN6CYOKVEj4fK2UGpbvGa7fyTR5s1kvLFA==
X-Received: by 2002:a4a:a4c9:: with SMTP id c9mr14129371oom.21.1640717382428;
        Tue, 28 Dec 2021 10:49:42 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 90sm3133883otn.59.2021.12.28.10.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 10:49:42 -0800 (PST)
Date:   Tue, 28 Dec 2021 10:50:42 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com, aravindh@codeaurora.org,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: populate connector of struct  dp_panel
Message-ID: <Yctcgslq283lZXW/@ripper>
References: <1640713908-7453-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1640713908-7453-1-git-send-email-quic_khsieh@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 28 Dec 09:51 PST 2021, Kuogee Hsieh wrote:

> There is kernel crashed happen due to unable to handle kernel NULL

It would be wonderful, for my understanding today, as well as people in
the coming months to be able to search for the callstack etc on the
mailing list, if you could provide some details about the crash.

E.g. a callstack or description of when it happens.

> pointer dereference  of dp_panel->connector while running DP link
> layer compliance test case 4.2.2.6 (EDIDCorruption Detection).
> This patch will fixed the problem by populating connector of dp_panel.
> 
> Fixes: 7948fe12d47 ("drm/msm/dp: return correct edid checksum after corrupted edid checksum read")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 71db10c..6a938a2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -197,6 +197,8 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>  	kfree(dp_panel->edid);
>  	dp_panel->edid = NULL;
>  
> +	dp_panel->connector = connector;

So you have a dp_display_private object with a panel and a connector
allocated, but before you manage to associate the two you get a HPD
event and call this function, so you decide to stitch the two together
just here in some piece of code unrelated to the initialization of your
objects?

It sounds like we're lacking synchronization between the initialization
and the HPD interrupts and this would not be the correct solution.

Regards,
Bjorn

> +
>  	dp_panel->edid = drm_get_edid(connector,
>  					      &panel->aux->ddc);
>  	if (!dp_panel->edid) {
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
