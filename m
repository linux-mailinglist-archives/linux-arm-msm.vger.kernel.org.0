Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2F516EEF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 20:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731436AbgBYT2B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 14:28:01 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42450 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731270AbgBYT2B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 14:28:01 -0500
Received: by mail-pf1-f196.google.com with SMTP id 4so55177pfz.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2020 11:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=4tK5dhNanRBX4RJaY81MXL5uMw9VPzyZ3UaipGWjTeA=;
        b=ER4Hn5y39DsTdFq4OIFR/dyYBA/md+YMiH6Vlftw5sX/8I8svVtJwDWrl+hIbHDMI+
         9DIcp5qY/z7utP3Wlsfmi7SD9FiFgaz3JqHR/5d8KjPWEgJS68eSS/70DaFi0VVUDqjx
         qsRNASKUBSfoa6zYDICVI1jWv5RUSbtgDxLeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=4tK5dhNanRBX4RJaY81MXL5uMw9VPzyZ3UaipGWjTeA=;
        b=hTl+Z27X8SnIfH/2jNKmg2D1oOXH2jhrC/JDHuMdPkGM6uQ7OLj5sl9arzIA8cW37k
         HibUUMOue/0E0tPnRoYGkeSiYUnm2jJC2dslSrgdD6JvpzUFJf6B1fSzpwletbMNaBAd
         e9br7oTWGpzVCTnLo2VP0/FKX84MThdA8iXMvZqsKV8NGTsolUc9gElvOIkx4bcMs4ZM
         l9mFDcLJOuTRCx3XnLsJ9Mh+oBqxWjqZ3RyMZ55VV0Ajhl+raEimoCBBw08ZvLn4e7Jp
         S1f+Q7UvOAv4821Ay1POa4NIRIc8vBvMz529bu9Ul+c7ZLZq9biD41YYEOZpU6EW5ayI
         t9dw==
X-Gm-Message-State: APjAAAV1IqhCp4zoPhG9mOjEdXySTa0n3dCA+QQm+6Rf5FS+lS3u/Ae3
        pHG8gN2iY3n32HuuHUiqV2HrEw==
X-Google-Smtp-Source: APXvYqx/CuR9tWXGTo9ivBHMqDj/j7Gy5ChN3CDCAyQZMV9kpz8TazoKp8muVVv6CLf1YgtUt+g7UA==
X-Received: by 2002:aa7:9808:: with SMTP id e8mr299103pfl.32.1582658880299;
        Tue, 25 Feb 2020 11:28:00 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id c26sm18406262pfj.8.2020.02.25.11.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 11:27:59 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200219104148.1.I0183a464f2788d41e6902f3535941f69c594b4c1@changeid>
References: <20200219104148.1.I0183a464f2788d41e6902f3535941f69c594b4c1@changeid>
Subject: Re: [PATCH 1/4] drm/msm/dpu: Remove unused function arguments
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Drew Davenport <ddavenport@chromium.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Thomas Gleixner <tglx@linutronix.de>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Drew Davenport <ddavenport@chromium.org>,
        dri-devel@lists.freedesktop.org
Date:   Tue, 25 Feb 2020 11:27:58 -0800
Message-ID: <158265887882.177367.3011043098001339741@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Drew Davenport (2020-02-19 09:42:24)
> Several functions arguments in the resource manager are unused, so
> remove them.
>=20
> Signed-off-by: Drew Davenport <ddavenport@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>=20
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 37 ++++++++++----------------
>  1 file changed, 14 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm=
/disp/dpu1/dpu_rm.c
> index 23f5b1433b357..dea1dba441fe7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -144,8 +144,7 @@ static int _dpu_rm_hw_blk_create(
>                 const struct dpu_mdss_cfg *cat,
>                 void __iomem *mmio,
>                 enum dpu_hw_blk_type type,
> -               uint32_t id,
> -               const void *hw_catalog_info)
> +               uint32_t id)

It would be good to use u32 instead of uint32_t in this code too. The
kernel style is to use the shorter name for that type.
