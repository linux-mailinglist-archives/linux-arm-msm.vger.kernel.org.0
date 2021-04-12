Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD02935D0CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Apr 2021 21:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244297AbhDLTIB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Apr 2021 15:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237016AbhDLTIB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Apr 2021 15:08:01 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CE59C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Apr 2021 12:07:43 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id y32so10123106pga.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Apr 2021 12:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=fGFsEf2waKmATyDTmIPSf2vH9tJLpaBpDVEvMFYclPQ=;
        b=a0Zx8muzk5ffoAl3JaWLGtZeYp+ZhL5gt9rAVl/PoDSzD5t+gB11BQJB9RTsflD6F8
         IlLeBRMCtlYBckyKzfUhWmRhLq38R0Ef+CpCevrcr4Iw4hwfTe30Yn4bdAa4Yhzpb5ua
         NZJmrfXfPY/X+TLIqCweDkOPR6evP3xkHN6TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=fGFsEf2waKmATyDTmIPSf2vH9tJLpaBpDVEvMFYclPQ=;
        b=MCYVdhtXAPia6Z48T/x3QCqgWHkHZ1D8t7AfPQjRXyUmpat0iW6tkwUQsl8ODG2pP8
         IeP6FYewnh3iTRhzvhe3JsxIqDkJYT24NfBHogWBPjeIuKvzyoxuujSTpkhegpvqSvRu
         NPlkVU6WHHFTt9rkWJ3uua8MtHl05g7ckdsMU/Re784gFIxqNTcx191t9SdF7EJqPt9u
         J84/OeIUbyBSYSTfK0lW8anRXuKu66afXk+qmD4oNS/u1L+sGdJXJTbwbLIiqnHgV1eT
         Em6KVGZeyWRQKxM5zjDTdG9OLsxSx5iqae0furhYdTj07y5oCBWov/UklP6R7qdWaks9
         kFfg==
X-Gm-Message-State: AOAM531Tf3HIuet0ZqDlqqKa1VdbxafkYvW7Ex9RZXfBdRoyFhuRA9Gt
        58xbqf0wU0ioewxuD7GjaIwygQ==
X-Google-Smtp-Source: ABdhPJzfrn/TxexcPy6Y9yiMjPc35mWCvUjp3BGV6LLcJ1iEFS/dX+dS1rN/yWePvaBGrHrwK3BtXA==
X-Received: by 2002:a65:57cb:: with SMTP id q11mr27731841pgr.183.1618254462693;
        Mon, 12 Apr 2021 12:07:42 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:1d18:a339:7993:e548])
        by smtp.gmail.com with ESMTPSA id z195sm9859497pfc.146.2021.04.12.12.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 12:07:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210406163330.11996-1-srivasam@codeaurora.org>
References: <20210406163330.11996-1-srivasam@codeaurora.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: Update iommu property for simultaneous playback
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        judyhsiao@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org
Date:   Mon, 12 Apr 2021 12:07:40 -0700
Message-ID: <161825446055.3764895.18297761573300175565@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2021-04-06 09:33:30)
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>=20
> Update iommu property in lpass cpu node for supporting
> simultaneous playback on headset and speaker.
>=20
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
