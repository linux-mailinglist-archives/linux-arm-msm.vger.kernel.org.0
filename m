Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAB231A6E10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 23:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388876AbgDMVRm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 17:17:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388875AbgDMVRi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 17:17:38 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3810C0A3BDC
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 14:17:38 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id m21so1261222pff.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 14:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=DkFXK9v0exA4G4YcoWc+xbEiRjzLLK+eOt9DRlAzn/0=;
        b=W/IJ9QtzeOvKUPUFofeH1yOLCsu6opUycc0sSKNqLwR+8qN+dHPEgUb0NDdg0oFUYy
         wNXoH8vH5uwI5EbvAnjV48iAY3AGoM8NSqSPlUn9R6Zxh46gtVVwInbFrmMikazboleB
         ByR48x+7toeu9FRO+FZGFHBsnRHm65xR0715k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=DkFXK9v0exA4G4YcoWc+xbEiRjzLLK+eOt9DRlAzn/0=;
        b=BiMpOEj2NU9IvMcU1X6FtHZ3czHgwJXuKz6wSZCtQ+wK3rj6I84OC8/biELP8Egfq0
         BPo3UCdGklo1c+jgSW4qWIab8DgkRDVj3zFl2SQTvJSp4kJw268epPG6Ha7iKOtv+gK3
         thfZN6O5e7sMQLcFEavMOGm+t4A53wjeumjrzGxnkwYbRAGT9SuGWcj8ndeafl++ht5t
         rwfa+2uJ9U4ITMScg0t3m/hP6v9AdBYqtyD++7us7zbt+7tcwllFJyaprG+5EA8rVj7X
         iXVU7pWbTRmVHEm4lfnm92IYdPtkBm3ivSqt2LMtys10DnK09ehyoXgoDH5tj7dGUIgM
         MmyQ==
X-Gm-Message-State: AGi0PubcghDqg/ZralnNLS9nIu5eQSFIg+ZRK4PwXQfDzbcG96XSJ2jH
        CkekmCB17SEcEPMIiW4mFU0Wlg==
X-Google-Smtp-Source: APiQypKMJYVEMRyl16Tv6WhTVZnxVKiOSOT3Awd2c9FyrCwjVEiri7UREk8AA4GygsU6Ta+uW0b4yA==
X-Received: by 2002:aa7:8101:: with SMTP id b1mr20026578pfi.322.1586812658266;
        Mon, 13 Apr 2020 14:17:38 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x3sm9071634pfq.95.2020.04.13.14.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 14:17:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1586703004-13674-4-git-send-email-mkshah@codeaurora.org>
References: <1586703004-13674-1-git-send-email-mkshah@codeaurora.org> <1586703004-13674-4-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v17 3/6] soc: qcom: rpmh: Invalidate SLEEP and WAKE TCSes before flushing new data
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mka@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        dianders@chromium.org, evgreen@chromium.org
Date:   Mon, 13 Apr 2020 14:17:36 -0700
Message-ID: <158681265694.84447.13031031594080430034@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-04-12 07:50:01)
> TCSes have previously programmed data when rpmh_flush() is called.
> This can cause old data to trigger along with newly flushed.
>=20
> Fix this by cleaning SLEEP and WAKE TCSes before new data is flushed.
>=20
> With this there is no need to invoke rpmh_rsc_invalidate() call from
> rpmh_invalidate().
>=20
> Simplify rpmh_invalidate() by moving invalidate_batch() inside.
>=20
> Fixes: 600513dfeef3 ("drivers: qcom: rpmh: cache sleep/wake state request=
s")
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
