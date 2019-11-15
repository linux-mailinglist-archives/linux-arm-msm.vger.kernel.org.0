Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C44A1FE8A6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2019 00:30:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbfKOXar (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 18:30:47 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46014 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbfKOXar (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 18:30:47 -0500
Received: by mail-pg1-f194.google.com with SMTP id k1so5362293pgg.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 15:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=gSbKMKql5sEqE07IQgKTqMTq9G16VWJ3CxdiQ6od//U=;
        b=NkQvKiCDlxAzjl0sBQbqPC6dIibiAXMCtybhHP7pvXnnksE9DrSG/C93e1uNoJxkEQ
         6BXQcgL/odCwAPKBSbE3r+5aBZgwxudDwH+fI1tnMB8hU6He3fi2Lk58Ag6BfJEyvqfU
         zMl+JEMn9ky8RPW1cru1G5BaEkpM0a301fGt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=gSbKMKql5sEqE07IQgKTqMTq9G16VWJ3CxdiQ6od//U=;
        b=SWXw45/7L8v2OEfnhQPcHBCd2BLNJBDEkQIJ4usH3mUXcG0gb/rjXfh6jbHf2mzR2I
         bMXRA73sCaPE87nbSA+ON24i4VwXCw/92Ni07ziRiXd7v1S5nLkED9bMncUYCwJpqLTA
         0iyw47+9eYoHiFHfmvWih25TlgC2FggLGh34DyhKAYONb/fjwFwO/Bq8mC3PONk2kHOl
         YEQepz7AYHwZ7n7ApvYt1eqVTva7nMadVKzMv6tjITaJgHmyNtrVXbtNaP647mIn4535
         zKou9vRn4LqQBUAlAimXmAjub0czfLLu1glJxZH70vX6cpKXMdz2a8CFbahz0t33s+Qy
         1uQA==
X-Gm-Message-State: APjAAAX++hLuXZru8f8Tx+uul6S21CfE35tcd9X43o3mIxSEENwMzmC6
        9p35YisBO2pJMxBk5aHsV6efH4wA8c8=
X-Google-Smtp-Source: APXvYqwD5U2lVQiKyC0uYB6z/gPgwJXPG5mK8PMHOR2GiQV3y/nT0jjVkvX/wzWRLSIZAwqGIprs+g==
X-Received: by 2002:aa7:961d:: with SMTP id q29mr19742795pfg.89.1573860646234;
        Fri, 15 Nov 2019 15:30:46 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id o124sm1832653pfb.56.2019.11.15.15.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 15:30:45 -0800 (PST)
Message-ID: <5dcf3525.1c69fb81.88c99.5986@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573593774-12539-3-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org> <1573593774-12539-3-git-send-email-eberman@codeaurora.org>
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Elliot Berman <eberman@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH v2 02/18] firmware: qcom_scm: Add funcnum IDs
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 15:30:44 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Elliot Berman (2019-11-12 13:22:38)
> Add LEGACY_FUNCNUM to qcom_scm-32.c and move SMCCC_FUNCNUM closer to
> other smccc-specific macros.
>=20
> Signed-off-by: Elliot Berman <eberman@codeaurora.org>
> ---
>  drivers/firmware/qcom_scm-32.c | 8 +++++---
>  drivers/firmware/qcom_scm-64.c | 3 +--
>  2 files changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-3=
2.c
> index 5d52641..5077fcf 100644
> --- a/drivers/firmware/qcom_scm-32.c
> +++ b/drivers/firmware/qcom_scm-32.c
> @@ -38,6 +38,8 @@ static struct qcom_scm_entry qcom_scm_wb[] =3D {
> =20
>  static DEFINE_MUTEX(qcom_scm_lock);
> =20
> +#define LEGACY_FUNCNUM(s, c)   (((s) << 10) | ((c) & 0x3ff))

Same name comment here. Otherwise

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

