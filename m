Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61D0342AAE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 19:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231945AbhJLRif (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 13:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230394AbhJLRif (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 13:38:35 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D76DC061745
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 10:36:31 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id u20-20020a9d7214000000b0054e170300adso232150otj.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 10:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=2BypScO76h55G7PPwXnggV0DBtGQ8bEd9vyWr6bUXKE=;
        b=Wk+QXyGeOJld76njFrWWdXYkW3GKfTQ/CyXWZkUGzuyWPJX+Pi+MoN3lO8gWfd27YA
         XEPw4irp+IJnOtcZz29Vo+/QPkJ65ex8DejKLsHs3fsas3yab01i91K14MykMq+BJyb+
         qrZxf95YrZgFCXZtjSdsJwzrWfJKTTJPnuGOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=2BypScO76h55G7PPwXnggV0DBtGQ8bEd9vyWr6bUXKE=;
        b=lF6J9VvwJQT237D+9825SJBYpMsghJx0FrXtBD7ZoXHAAPvtmOuVCv5cgqbs5V0pVA
         ciMjfYmC7qTOIvqMlwqMa+4m+6Ssxl9lL4Rbf/bWsC/zxOQRu8NliK73In7y2aWu6EoR
         YoeK4NE7rlY7NhgGr6hjJ5EPdcYH4WFScWLqcbokzr0YySVGkzmN6otG5qqL1z8SiVBR
         wJVlKrc8B9IiCuaIVed5HWhiXufVQrgP15cPZS8T9HIFypnQXmD+WeYWwv9PSX0pQw3F
         qBctFAQ2kn2B5jo8jgsZh2F/wsYhgFEJA4fCzlxrV7uOpE/8OUzS03INHrjnYNEY+fP4
         im4w==
X-Gm-Message-State: AOAM532o0PPaWgX/+DIpI0UCGbEZHA5d5d6ZO3UaqOyXtQ7+3LU0Pv2n
        aEjnmXFQvS2XAF8NRT9+Q9fKVNvwxZMwSOMOF0RTuRzgiAw=
X-Google-Smtp-Source: ABdhPJxNOhgeqTAMjp5PAp6NyMFEPhaSaElT5ghTzkghPyWvKz0oqRQxrlR4ntBvFAX5KBLIMoaGbJbsJGSY5ELjd44=
X-Received: by 2002:a05:6830:2317:: with SMTP id u23mr12874222ote.126.1634060190606;
 Tue, 12 Oct 2021 10:36:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Oct 2021 10:36:30 -0700
MIME-Version: 1.0
In-Reply-To: <20211010030435.4000642-1-bjorn.andersson@linaro.org>
References: <20211010030435.4000642-1-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 12 Oct 2021 10:36:30 -0700
Message-ID: <CAE-0n51CoX131DsDWZUxWoCu6c+HEm4HbK=SrKraqhDqFkc6ww@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Use the connector passed to dp_debug_get()
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-10-09 20:04:35)
> The debugfs code is provided an array of a single drm_connector. Then to
> access the connector, the list of all connectors of the DRM device is
> traversed and all non-DisplayPort connectors are skipped, to find the
> one and only DisplayPort connector.
>
> But as we move to support multiple DisplayPort controllers this will now
> find multiple connectors and has no way to distinguish them.
>
> Pass the single connector to dp_debug_get() and use this in the debugfs
> functions instead, both to simplify the code and the support the

s/the support the/to support the/

> multiple instances.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
