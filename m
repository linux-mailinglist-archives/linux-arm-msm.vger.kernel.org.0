Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D79A1485C5E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 00:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234795AbiAEXl6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 18:41:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234791AbiAEXl4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 18:41:56 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 696D3C061245
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 15:41:56 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id w19-20020a056830061300b0058f1dd48932so1141857oti.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 15:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Hstj2R8ZmDxCXTF3eKwARX+HoUFN/nENk0GAyIL5MUk=;
        b=R1bNiB2DVLPtk0pC+nYr0JETj8iD7Na0JRRE7r3kga+8WkotyJaQPtwWSLJVQxO1f7
         8Uyo38opmG91aKbTd2xzMWir+ZtyLgYiSutKosW7rWM80bgdKx1sjxsIyoCmSBjha1kX
         mB3g6wq5D75vojqUUajcNA/TtGt++GHEsD/qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Hstj2R8ZmDxCXTF3eKwARX+HoUFN/nENk0GAyIL5MUk=;
        b=71/sJbTwuPZk2TrFjsO7aYkXwnhPASV4gX6TQ43IUtlkNQfhpA7puApvCzyGw7xBsk
         CkYxWlqYonBp6/KNw1xq94NBiRhvSSMRuzrWtn8pYhElHvMnZtBFccMV99vlVdIesmxo
         QRv1GPP+k/SSw0C/2VmS9ywFrSfVofSXBO3Nu5dVd1UXRkOTXpdQHThyEIin6ukSsg7Y
         BOYyIJumVJfUOWB+C30sB0yE7uKBmYM6oPUGbCRCVQNJixZlvWIY92cKijQcf/Lb3rEp
         brvruOBQ9G6mChSnBlgvEhU13QMJjsZT4oUsEJ5Xcn3hlA4dSRhRIHF4h/zgEhrmNv25
         mCSQ==
X-Gm-Message-State: AOAM531uc9U4QDiCn9alRcwbl+7CpK6e6rsliZZWPXD/6bUU09WYts+E
        Fzl+r/SHi7963uMS0mPOwZIc2MMUO2ExQrFPitKqzQ==
X-Google-Smtp-Source: ABdhPJyOYuLpjO8gx43wP3pSJEOgxI2mVBjPwuzV0elz1fKfcWpdtbXdmFtiv+OxpNlVj7M6KhNt8ts3ZTRl21NiPQE=
X-Received: by 2002:a9d:1a6:: with SMTP id e35mr482422ote.77.1641426115544;
 Wed, 05 Jan 2022 15:41:55 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 15:41:55 -0800
MIME-Version: 1.0
In-Reply-To: <20220105232700.444170-1-dmitry.baryshkov@linaro.org>
References: <20220105232700.444170-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 5 Jan 2022 15:41:55 -0800
Message-ID: <CAE-0n52df=QXPkiQG5W1E51sOHb5kX0+J0qLpPN9NKV36TmN6w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/msm: drop register logging support
To:     Abhinav Kumar <abhinavk@quicinc.com>,
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

Quoting Dmitry Baryshkov (2022-01-05 15:26:58)
> Register logging was used during early stages of msm driver development
> to compare upstream and downstream register traces. However the tool was
> never updated to work with mdp5 hardware. Later it was dropped
> completely when Rob imported freedreno tools into mesa. All this makes
> DRM_MSM_REGISTER_LOGGING irrelevant now, so it can be dropped.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
