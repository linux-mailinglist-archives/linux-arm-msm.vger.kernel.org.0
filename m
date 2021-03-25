Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29DD4348690
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 02:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235870AbhCYBtY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 21:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235831AbhCYBtK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 21:49:10 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F60EC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 18:49:10 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id h3so354047pfr.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 18:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=lTT11oRd2IP/7R9HW0QYaEhU1Zlu1DFDIzRADDCnLQQ=;
        b=Z+z2A1yAfmKe+FCUbdH4KIOqFTHUUfHCkPioKvw+4xukLDm9HfIDtt02qZwkXLM/SK
         ND1RSq9RFZF3e2qR+20GVfw3hsd6gQ3zn0Q2XZVOLjqr/OmTdYw3vScyzdWZWEhGC9rH
         TlLUDd8ocYtWZsjnlzybGhQpOat8bCD3oD5gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=lTT11oRd2IP/7R9HW0QYaEhU1Zlu1DFDIzRADDCnLQQ=;
        b=M808nG2seQUybyhoeV2pNfUbka5E8wNRyjN53oLsV/CgL2aG4v3iZj5YuOcqL65BgK
         EAx0n38tGeOwv58Fz49zFwdPY7oTqf44JqLujUW1XGjWUb77sh3s93kipN88pVbYD3Bb
         2sR9ueDqAS5dHvzD6ZiVXlpCwIfmxNDebesnDzuUPnPyXOjB228AIPNDLCq2JhT1L2bX
         GtMNXtwyk7Nje/rK+t+5gsneGZg/N0pXAlgdJaboD1KN/GgaqEWMINV3pJW9pEHixW6Z
         pOr560caUkAZrZI2oaUJmfJUeR90IzDAPkRqGuhIYb2wZ8zRBvvhEduuExiv57ctK7e5
         hxfg==
X-Gm-Message-State: AOAM532N7vN8iZFlEeB5EhWGENQMr11ogoK2o+uksQpxKRbGTtRY5HES
        t1V/y02wCtgMzvGfwzX4qN3DLA==
X-Google-Smtp-Source: ABdhPJyy21bCd9n+vhHQdGXzdNqyTIFIwyuAXQ2gaSqWta5/XpKxeLBm8XOfJtheWbAiseDrIDousQ==
X-Received: by 2002:a63:5924:: with SMTP id n36mr5562187pgb.183.1616636947460;
        Wed, 24 Mar 2021 18:49:07 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:84ac:62f7:16a8:ccc7])
        by smtp.gmail.com with ESMTPSA id s26sm3750220pfd.5.2021.03.24.18.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 18:49:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210318200544.2244007-1-dmitry.baryshkov@linaro.org>
References: <20210318200544.2244007-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2] gpu/drm/msm: fix shutdown hook in case GPU components failed to bind
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Date:   Wed, 24 Mar 2021 18:49:05 -0700
Message-ID: <161663694524.3012082.11889553997747135632@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-03-18 13:05:44)
> if GPU components have failed to bind, shutdown callback would fail with
> the following backtrace. Add safeguard check to stop that oops from
> happening and allow the board to reboot.
[...]
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 94525ac76d4e..fd2ac54caf9f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1311,6 +1311,10 @@ static int msm_pdev_remove(struct platform_device =
*pdev)
>  static void msm_pdev_shutdown(struct platform_device *pdev)
>  {
>         struct drm_device *drm =3D platform_get_drvdata(pdev);
> +       struct msm_drm_private *priv =3D drm ? drm->dev_private : NULL;
> +
> +       if (!priv || !priv->kms)
> +               return;
> =20

I see a problem where if I don't get a backlight probing then my
graphics card doesn't appear but this driver is still bound. I was
hoping this patch would fix it but it doesn't. I have slab poisoning
enabled so sometimes the 'priv' pointer is 0x6b6b6b6b6b6b6b6b meaning it
got all freed.

I found that the 'drm' pointer here is pointing at junk. The
msm_drm_init() function calls drm_dev_put() on the error path and that
will destroy the drm pointer but it doesn't update this platform drivers
drvdata. Do we need another patch that sets the drvdata to NULL on
msm_drm_init() failing? One last note, I'm seeing this on 5.4 so maybe I
missed something and the drvdata has been set to NULL somewhere else
upstream. I sort of doubt it though.

---8<----
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c842a270806d..895d74aa8834 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -577,6 +577,7 @@ static int msm_drm_init(struct device *dev, struct drm_=
driver *drv)
 	kfree(priv);
 err_put_drm_dev:
 	drm_dev_put(ddev);
+	platform_set_drvdata(pdev, NULL);
 	return ret;
 }
