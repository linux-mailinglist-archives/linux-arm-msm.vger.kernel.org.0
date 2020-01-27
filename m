Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD8F14AA00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2020 19:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgA0SqD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 13:46:03 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43457 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbgA0SqD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 13:46:03 -0500
Received: by mail-pf1-f195.google.com with SMTP id s1so4703389pfh.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2020 10:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:subject:to:cc:user-agent:date;
        bh=SAf0wlfw+TNd2DzftwsbonJldFJ5p2J5PC2nZzFZ18o=;
        b=J/lBecyP+6ceXQ/zWohjXYEmnPCnobOv9FN6yiXpAbDIqJTCdKTfi0gpkPgOTFJI8m
         tqCgE2PP3GVUwKlAePYObUsCJEijlnsNuYaVp+uiAfHxAcF8te0xzX1RKMfa6VxX+3mH
         vOguqsVESWgUG4oHCLa8o1N1lce8WIEqDbw/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:subject:to:cc
         :user-agent:date;
        bh=SAf0wlfw+TNd2DzftwsbonJldFJ5p2J5PC2nZzFZ18o=;
        b=TtVz7TWjHCvxJoSe7sQXbjXUgeHJDIP4ez8ka0D9vYAsRbSdV7I9CSt8fs0ha36m2s
         PgEno9Leaygnft4bb2KpLENqIb6qDoNHEmTlRcqWN6hGm+ZMUKb5IbasD0VdbsiwTPjg
         NC8bvm8swWD1rr5btJVDhJE3S4YkmYG+sYAmvTkfgSV4wipievZhADcvBCUxDuqN97cT
         1e2MBl3qRW2tHQZHfglZZirXG6ezhSZOACOkrG8IFu7znhLtgACmzmnNZ8NKJWzXg/1z
         vqbjvYzYeonypjIihaHG5ZPzNuuI5k6a2Oas4cEjJIhA4ayU4A/aTvz7MijEgt2dO5RS
         gI+w==
X-Gm-Message-State: APjAAAWrNHRsYdhYX56xNA9pRZvjqwoXOm7BBUrc/NZ6LwdKMJhVARyb
        PCNzz7f3nNBnuF21h4/2d7jZe3ErchYweg==
X-Google-Smtp-Source: APXvYqzpHq5KdTUu1Ff269ZBNEmFhjHamx/h+1X/OxalS68FdPJVJkwMOn9rEub6f5DtdzHNYxFPLA==
X-Received: by 2002:a63:5920:: with SMTP id n32mr20427594pgb.443.1580150762587;
        Mon, 27 Jan 2020 10:46:02 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id j14sm16858839pgs.57.2020.01.27.10.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 10:46:01 -0800 (PST)
Message-ID: <5e2f2fe9.1c69fb81.6d20f.a6b4@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1579819245-21913-1-git-send-email-abhinavk@codeaurora.org>
References: <1579819245-21913-1-git-send-email-abhinavk@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] drm: Parse Colorimetry data block from EDID
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        dri-devel@lists.freedesktop.org
Cc:     Uma Shankar <uma.shankar@intel.com>, linux-arm-msm@vger.kernel.org,
        robdclark@gmail.com, seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, adelva@google.com,
        Abhinav Kumar <abhinavk@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Mon, 27 Jan 2020 10:46:01 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Abhinav Kumar (2020-01-23 14:40:45)
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 99769d6..148bfa4 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4199,6 +4200,57 @@ static void fixup_detailed_cea_mode_clock(struct d=
rm_display_mode *mode)
>         mode->clock =3D clock;
>  }
> =20
> +static bool cea_db_is_hdmi_colorimetry_data_block(const u8 *db)
> +{
> +       if (cea_db_tag(db) !=3D USE_EXTENDED_TAG)
> +               return false;
> +
> +       if (db[1] !=3D COLORIMETRY_DATA_BLOCK)
> +               return false;
> +
> +       if (cea_db_payload_len(db) < 2)
> +               return false;
> +
> +       return true;
> +}
> +
> +static void
> +drm_parse_colorimetry_data_block(struct drm_connector *connector, const =
u8 *db)
> +{
> +       struct drm_hdmi_info *info =3D &connector->display_info.hdmi;
> +
> +       /* As per CEA 861-G spec */
> +       /* Byte 3 Bit 0: xvYCC_601 */
> +       if (db[2] & BIT(0))

Why not use the defines added in drm_edid.h in this patch? Then the
comments can be removed because the code would look like

	if (db[2] & DRM_EDID_CLRMETRY_xvYCC_601)

