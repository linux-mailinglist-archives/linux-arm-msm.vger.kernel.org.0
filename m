Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F20F3D2CCA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 21:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbhGVSxH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 14:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhGVSxF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 14:53:05 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E03C061575
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 12:33:40 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id t6so7852427oic.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 12:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=6sZ7huFu4QsNFxnrBDafBDlbHlNytaLnm0nq8FswDwU=;
        b=WymYdktUlRBmMKQLtjkvozdpaU5i/01Ctu/IIM4hIiKk7uvJhsJPUu24DoxwIWa0So
         0gqburhQ2PKtCgdQEfnB239f1zQZIHbA0RY6AUJNrI4cXXHMnTB1rINT9SSQ7pb3XMWP
         dUMxTtzSoIoVYaLSrWkEi7gBmIhEBfuQ5v4bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=6sZ7huFu4QsNFxnrBDafBDlbHlNytaLnm0nq8FswDwU=;
        b=MVfzD+a3/m+m5ihlLBv2Sgyu3ifcef18A2DbQ0F5NLpwaN5c4Jf39ljkiCXdKjZHs3
         hlWdhxWvrUtoDvVK+GWWdt5GhTo+tvr8XCY4plBenW3nSMtOh/PA0rKueTYlbAzK47Md
         zCMy6qzfWFCKlxVNh+FGIsTQ5OQ3qzU6n6YrVBv26qDzPnUk4hVh1S3U9N6/GpM/fQZJ
         udoE2qfc6M1/otMvKy1EBcuaMUeefpRSOvHOKeEht8lFRbybQSV0+++Qb8rLwt1II1Fl
         SO972p0XPSx3n6O7KzLKyR5zzZ2Jrx2zCU84oo6SIY8rJxtpJdOyj8lQPo8014rFoDoS
         I44Q==
X-Gm-Message-State: AOAM530NnsoSUhJrnWgcH9YhpW3GGrV0XzyQiy60ogz52xG2fVyxWsu1
        bL8b6Mne1/TquxP7eCB3B2FPRZ99lYa8LwkjTdwB7A==
X-Google-Smtp-Source: ABdhPJwqiAw4oHcAYrmnpJwwnDQOY2aWE8FH1iTkin5KHAN8tJqKjH1PqHmOGxwIdHQS6uWixabWA+4VT4Apg9rNolM=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr1094329oiu.19.1626982419605;
 Thu, 22 Jul 2021 12:33:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:33:39 +0000
MIME-Version: 1.0
In-Reply-To: <20210722024227.3313096-2-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org> <20210722024227.3313096-2-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 22 Jul 2021 19:33:39 +0000
Message-ID: <CAE-0n52g4rxdcLbLBSOqoFywUJUYw6MRtBLv_41MtZSo8AGHnw@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: msm/dp: Change reg definition
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-07-21 19:42:23)
> reg was defined as one region covering the entire DP block, but the
> memory map is actually split in 4 regions and obviously the size of
> these regions differs between platforms.
>
> Switch the reg to require that all four regions are specified instead.
> It is expected that the implementation will handle existing DTBs, even
> though the schema defines the new layout.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
