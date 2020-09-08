Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2563261AB0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 20:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731354AbgIHSiz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 14:38:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731214AbgIHSiU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 14:38:20 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1B2EC061573
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 11:38:19 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id md22so140030pjb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 11:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=DjkIx1P1Yaxa+Auz4Hv5F6fQbSDCX4zGHI1CORxsnvo=;
        b=Ch5116YJyepkGpw+1UW17XG01LG/Pm90dnlvn725RqhqaU4K8logIxM79H9+sIUoQ8
         OiB2hKqFTTb/CrA4MTXj0FA17E0hyz3kemhaxUxNt+kgpXnoSGgFoS2faieUZXeiearM
         Bq3F/+1d+pj1Mc5PD3zu/eq5qxogXCWs0O71k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=DjkIx1P1Yaxa+Auz4Hv5F6fQbSDCX4zGHI1CORxsnvo=;
        b=It52CoiruB5Kacy+z4ZD4PyrpJTrnLzQwrWo0QPbFMy08NyNmfbikPRQaujGGJ6tX1
         5jBKKXZFyXT2cCY+aOEkrkFNewHg2HRCsy6/DGpcsO56bQO+CcAAIGWJEwqyf9wR4jRH
         xS9fuzeBp+ya9JIGgb6cuelExbsfHoJ5EtfjAkCtFvBqQ8qy4fIA8KhiKy8wZUArCmee
         G+gpPJ8T8n9YuKEi4KPWvmgDZ8VvLwxKmylEUI5DadfqGplZMDYqAGhMMFUixBI9jQyY
         B19EimaL0BkG/BopCqmPisOFzp4dK9YkrZAMBwSg2ughfxDynhZ0PDxNNlvVN5r4JooZ
         6JUg==
X-Gm-Message-State: AOAM530+U10RNa5Fr7uQbpdrIlfizB5ceBmr+rXctOsi5hplGchQZeSW
        Uw8HnYrVB3jvXSPWsvZgsSKJzg==
X-Google-Smtp-Source: ABdhPJxQU7U8Qy5RDG4z+Rc6wVE9+Uj/BS7LyHlH3lOBzdg4vrt5MnIa+fMmuCRzZtHg0Ko5860+sw==
X-Received: by 2002:a17:90a:930e:: with SMTP id p14mr171770pjo.49.1599590299498;
        Tue, 08 Sep 2020 11:38:19 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id e123sm133688pfh.167.2020.09.08.11.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 11:38:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1599536678-4666-1-git-send-email-mansur@codeaurora.org>
References: <1599536678-4666-1-git-send-email-mansur@codeaurora.org>
Subject: Re: [PATCH 2/2] venus: core: vote for video-mem icc path and change avg, peak bw
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Date:   Tue, 08 Sep 2020 11:38:17 -0700
Message-ID: <159959029779.454335.10674172341529908104@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Mansur Alisha Shaik (2020-09-07 20:44:38)
> Currently we are voting for venus0-ebi path during buffer processing
> with an average bandwidth of all the instances and unvoting during
> session release.
>=20
> While video streaming when we try to do XO-SD using the command
> "echo mem > /sys/power/state command" , device is not entering
> to suspend state and from interconnect summary seeing votes for venus0-ebi
>=20
> Corrected this by voting for venus0-ebi path in venus_runtime_resume

venus_runtime_resume() please so we know it's a function.

> and unvote during venus_runtime_suspend.

venus_runtime_suspend().

>=20
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---

Any Fixes: tag?

>  drivers/media/platform/qcom/venus/core.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/pla=
tform/qcom/venus/core.c
> index 4857bbd..79d8600 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -373,6 +373,10 @@ static __maybe_unused int venus_runtime_suspend(stru=
ct device *dev)
>         if (ret)
>                 return ret;
> =20
> +       ret =3D icc_set_bw(core->video_path, 0, 0);
> +       if (ret)
> +               return ret;
> +
>         return ret;
>  }
> =20
> @@ -382,7 +386,11 @@ static __maybe_unused int venus_runtime_resume(struc=
t device *dev)
>         const struct venus_pm_ops *pm_ops =3D core->pm_ops;
>         int ret;
> =20
> -       ret =3D icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
> +       ret =3D icc_set_bw(core->video_path, kbps_to_icc(20000), 0);

This also shows that the arguments to icc_set_bw() we're backwards? Can
that be fixed in another patch instead of putting it in this one?
