Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBA4357426
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 20:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242251AbhDGSWu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 14:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239524AbhDGSWt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 14:22:49 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D468CC06175F
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 11:22:39 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id g35so8936330pgg.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 11:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:to:date:message-id:user-agent;
        bh=hi29bvNz3b0h+J1/8SmX9GkZQUb/KXU3bHzILeV7OBI=;
        b=dvwti10imC/5yBGONbIa6fAg6KAoYu+GkfwHaTpGSX9gtutrz8k4U53XVH8MoVEITd
         GR1KVJhoHM+wT5W+Uty0KbK0AEAIn/HWFUqDi6WdOdTZG6uPlMzd0Kfk0j0iLBoDSVsQ
         vIg31AGvFCG4zA4TvRIsdonHJiZecQ2nzu9vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:to:date:message-id:user-agent;
        bh=hi29bvNz3b0h+J1/8SmX9GkZQUb/KXU3bHzILeV7OBI=;
        b=CmzfyKi637i5Hop9L0hYJJZgLwz3xWFur8Zz+J9rBLGASg6LToV9Y2nF7ViPb/PfuA
         wZyI7zA07EYVoLwG5zzIUTFLN8jz5d7Klcnz3xVOLfLLsK3t8ry4G1KBHiBYFdWkVvEi
         liwGLdUgyaJeMyMmS/LJmY4BdylcRSNLUlaNPOKWROBgbi8CcIjZQt6AoxK+JbNqhc8+
         quP32hJ0IRFKSAcw30uijRaAWFobc4cqhMeRs03GMc1wg2t5ViqHf9YstzA1RR3thuPH
         2sJuQODVTfrkz/MqUEEKLQRlZmUi+Ju0ckeBjI+MctzuPle5qu/V08tjNTN/XaT42yaS
         Ermw==
X-Gm-Message-State: AOAM5313qqeXAvUjSLtq7II3CGfOPVthe7wTjZQe2UsKBSS3+iqokYMm
        G0qg6f07KY9cEmWX4O9joMcHA2o11fGOwA==
X-Google-Smtp-Source: ABdhPJwxFL0jF4wdaX8clJ5o9U99uJkosPvE3LRxErpWbXVIzWrheMp2PxRLqEGQV20+b4QUq6lrJA==
X-Received: by 2002:a63:6ec3:: with SMTP id j186mr4485221pgc.249.1617819759424;
        Wed, 07 Apr 2021 11:22:39 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e193:83c5:6e95:43de])
        by smtp.gmail.com with ESMTPSA id js16sm5777559pjb.21.2021.04.07.11.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 11:22:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210407130654.3387-1-bernard@vivo.com>
References: <20210407130654.3387-1-bernard@vivo.com>
Subject: Re: [PATCH] drm/msm: remove unneeded variable ret
From:   Stephen Boyd <swboyd@chromium.org>
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bernard Zhao <bernard@vivo.com>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Tanmay Shah <tanmay@codeaurora.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 07 Apr 2021 11:22:37 -0700
Message-ID: <161781975744.1883259.13405764054457057600@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bernard Zhao (2021-04-07 06:06:21)
> This patch fix coccicheck warning:
> drivers/gpu/drm/msm/dp/dp_link.c:848:5-8: Unneeded variable: "ret". Retur=
n "0" on line 880
> Also remove unneeded function return value check.
>=20
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
