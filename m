Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C11530E7C6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 00:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233452AbhBCXnl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 18:43:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234064AbhBCXnR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 18:43:17 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E9ADC0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 15:42:37 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id b21so846943pgk.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 15:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=yHURpLyu/TquLwx0y6eDJwaaKqJ+uw0cFvyf4JRgnoA=;
        b=Xbu8iTy1ZRPuaYXRVmxobKDV5EKGQvnequV/L0RekgYt4FzgK9lp0xnGDN73+uQyoI
         ytcu36a54c33UIBrX2kuE3aKpL+gwWCeMAsiadVMATEvvyhykfzqXLIj75BPw6+eCBgM
         +vD8KVcdswPshqB4gWnt5M3kUDKl0LXXsgLx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=yHURpLyu/TquLwx0y6eDJwaaKqJ+uw0cFvyf4JRgnoA=;
        b=uO5mYhmB6mW0ihVU17LXM99eZGZTeI+Khs+GUPT8+ZqEi9p99uo3HFYIic+GJJnC86
         fGSZnQQ3ps1PG7CHKwilKeWsmRQxl0vP/e/4XTV0dQ84kSmUhuLTMJBZAEKyRymm4zOl
         /AYEvSM8bEpb1jwAiGtqVdV+4TeQ+9MN6mekaXjeU3j+nzyGjqVEIL5b4hyewtS7tnvK
         VJ+7ibCdgMPowuxiJJfprE0YW2vQ1EhuvaK7OInsT7bC9P9nwbiVfdeVPC5QdAP155EL
         LYdf3EQqaSxqT6gaYa2r5cCZUnKXZjTM4txf+OwUt1K8yw4x7NRqaz3jzrCteorvKJDJ
         oVpw==
X-Gm-Message-State: AOAM532dUklReDMNRR/2r9pX43WrCa1t7lv7WjlngTn3ZyqBIz57Nv0R
        hP80PWKqyOD1vjXQMXwn+nGQLv1pc24x+Q==
X-Google-Smtp-Source: ABdhPJwhsJh7E/fIDVP54k0kiykGJypLBRTzhIYCPpD8yyPHqosMKVlqghMEgmQEviD79/BVAuLORQ==
X-Received: by 2002:a63:454e:: with SMTP id u14mr5968407pgk.113.1612395757069;
        Wed, 03 Feb 2021 15:42:37 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:59f3:e03b:c082:48d])
        by smtp.gmail.com with ESMTPSA id r189sm4026820pgr.10.2021.02.03.15.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 15:42:36 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210129094416.53601-1-vulab@iscas.ac.cn>
References: <20210129094416.53601-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] drm/msm/dp/dp_ctrl: Remove unneeded semicolon
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
To:     Xu Wang <vulab@iscas.ac.cn>, airlied@linux.ie,
        chandanu@codeaurora.org, daniel@ffwll.ch, khsieh@codeaurora.org,
        lee.jones@linaro.org, robdclark@gmail.com, sean@poorly.run,
        tanmay@codeaurora.org
Date:   Wed, 03 Feb 2021 15:42:34 -0800
Message-ID: <161239575441.76967.11776777354164899550@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Xu Wang (2021-01-29 01:44:16)
> fix semicolon.cocci warnings:
> drivers/gpu/drm/msm/dp/dp_ctrl.c:1161:2-3: Unneeded semicolon
>=20
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
