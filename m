Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B80645410F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 07:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233763AbhKQGq1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 01:46:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbhKQGq0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 01:46:26 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B23F7C061746
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 22:43:28 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso2956707ots.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 22:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=//I1TVp7dTuZFMgwOKyJoAu2cQfvXhC1d7f5K65wAYg=;
        b=W4+dGHWHFret9QtsEmcwlFjLqGEyyi9t7/oCkJZ/TwkTYuYEa/jV1aBJZC87aZFH+Z
         ZcwfLRewlOAYtKlQcrcRTwVVUovIj8uV2Ks+n5lVYIbDuJKeK22Y7wufVsX+8XFaMG9j
         x8SAYO9b7shYj3pUqD4qzMX1wOtDq01iBWKQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=//I1TVp7dTuZFMgwOKyJoAu2cQfvXhC1d7f5K65wAYg=;
        b=E1LWNwBy6iY5OIo7cMoK7zh9msxlLMSWbxSFVMmwwv0pqstxvjUdy3OkxG2MZK5Ium
         7kazeYTmKFcF5aD1K/0uq/R4XsLUEIciTJ6CKpQm0aacO5b8n7moasVKB5WP/kRfNuEn
         m9DVKIbjhPTZJeEOxdSXtCK4TOE3StrHlLWaRUM6rmtwSbanVy4ar6rpcPOvdfLIOZEe
         pZIqmStE0gymAvx4YkGM3nAzw7QSYAAkG6aPdAv+zpDFEDrhhIW6o269nWVdkMIA7/3v
         dKBpy+RDz4RF7AsUzHN7KV1RZxdkdBld2G2F5fT0VjO/IQwWubX3GXqxIrzB6fxo1xa1
         JRRQ==
X-Gm-Message-State: AOAM532jWmIh2QvFJ190OkVoHdlyThdOKprtoKIHy9m4Aaip/ODIaQSh
        QR2Zz+e2Bvl1o7qnx9voqDi7PzTdnSpNRVrxloYQ9A==
X-Google-Smtp-Source: ABdhPJwsKo1fEanM9NX3oCL5hyNK8f/aAd2sJcSS0+gxRvzjdO1BOo0snB/j/kUcnxhMJsS/ejuxg0vZQzHnPyroIEs=
X-Received: by 2002:a9d:7655:: with SMTP id o21mr11596628otl.126.1637131408127;
 Tue, 16 Nov 2021 22:43:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Nov 2021 22:43:27 -0800
MIME-Version: 1.0
In-Reply-To: <1637046458-20607-2-git-send-email-quic_sbillaka@quicinc.com>
References: <1637046458-20607-1-git-send-email-quic_sbillaka@quicinc.com> <1637046458-20607-2-git-send-email-quic_sbillaka@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 16 Nov 2021 22:43:27 -0800
Message-ID: <CAE-0n50cjm3O+i12Jxvfe6DdVDVG3cRrmz0ej6bMCKAeL0zHCA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: phy: Add eDP PHY compatible for sc7280
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     robdclark@gmail.com, seanpaul@chromium.org,
        quic_kalyant@quicinc.com, quic_abhinavk@quicinc.com,
        dianders@chromium.org, quic_khsieh@quicinc.com,
        quic_mkrishn@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sankeerth Billakanti (2021-11-15 23:07:36)
> Add compatible string for the supported eDP PHY on sc7280 platform.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
