Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F5C276B3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Sep 2020 09:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgIXHxF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Sep 2020 03:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727103AbgIXHxF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Sep 2020 03:53:05 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D13C0613D3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2020 00:53:05 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x22so1373566pfo.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2020 00:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Yv4LWoL/EotEUZL/RKuRP4UD2KLvMLmgrQWE3rymaHQ=;
        b=QTSYS9zsVnUIG2lRDVPd1H7PTGeRYkgK0TTJ176QNoMq0iZgGnPV0B6VbX8/F3Q8TZ
         GtJQ2xke2oUW7DklAhqKjnXfMdRmifsTnLvH8qt6MXM8ndMWk53zYrRUIYrAAm6Uu8jr
         jUrFxJWpk+ngtNg7ganJMqQ6eHYSldUQK69zQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Yv4LWoL/EotEUZL/RKuRP4UD2KLvMLmgrQWE3rymaHQ=;
        b=a7Vh0+2oNpTgA3T41nqfgzj++cZWkNsHUZi+5cE+SqheScejoRu7pMSnS/pl9DCxyo
         mxvpn7nHRqgKkLnmj1kMRejwmyXSC69Fkz1fU2tx0oY5M8N9IHRe8DrKEnhrljrYFEvx
         tsYjeiNTSNGGh+G4NM56tIcKQ66Jod1X0WuyzB/lTD8TnuFMCUYLfqepJfrmu86F8n1u
         TOgn1EMpkyTVdIO392iTMaGud6fDH0wo99oGXiih6g0kzqO8RNDQFmSvZFEuDOZecC9t
         HUpiZPFVRMFacx6apr3+75oIPwK8nzuFWSWHnoVPEWtfRf150Cf/nyMl+YADZ9VieLYE
         Hh0w==
X-Gm-Message-State: AOAM53151QTceVwLcBvoFj+oRy7Rd/kpWmWzo0lwKUDcKeug+GPkEJ27
        alka/pRftrXl0PCwhdaX+qunQA==
X-Google-Smtp-Source: ABdhPJw652M7uF3+ebs+rkXd6pvMrBXf3A7VMNdX8YdqKk5C2W3BugAS7vCpPyr/4pu/r6g/JE6bUg==
X-Received: by 2002:a63:3047:: with SMTP id w68mr2863262pgw.341.1600933984623;
        Thu, 24 Sep 2020 00:53:04 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id i25sm2100379pgi.9.2020.09.24.00.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 00:53:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1600930266-9668-4-git-send-email-mansur@codeaurora.org>
References: <1600930266-9668-1-git-send-email-mansur@codeaurora.org> <1600930266-9668-4-git-send-email-mansur@codeaurora.org>
Subject: Re: [PATCH v3 3/4] venus: core: vote with average bandwidth and peak bandwidth as zero
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Date:   Thu, 24 Sep 2020 00:53:02 -0700
Message-ID: <160093398246.310579.10928011770055575848@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Mansur Alisha Shaik (2020-09-23 23:51:05)
> As per bandwidth table video driver is voting with average bandwidth
> for "video-mem" and "cpu-cfg" paths as peak bandwidth is zero
> in bandwidth table.
>=20
> Fixes: 7482a983d ("media: venus: redesign clocks and pm domains control")
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---
> Changes in v3:
> - Added fixes tag
>=20
>  drivers/media/platform/qcom/venus/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/pla=
tform/qcom/venus/core.c
> index fa363b8..d5bfd6f 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -385,11 +385,11 @@ static __maybe_unused int venus_runtime_resume(stru=
ct device *dev)
>         const struct venus_pm_ops *pm_ops =3D core->pm_ops;
>         int ret;
> =20
> -       ret =3D icc_set_bw(core->video_path, 0, kbps_to_icc(1000));
> +       ret =3D icc_set_bw(core->video_path, kbps_to_icc(20000), 0);

This gets added in the previous patch. Why not put this patch before
that one?

Anyway..

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
