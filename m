Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4113AED8E4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 07:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728200AbfKDGPh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 01:15:37 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:44591 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728114AbfKDGPg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 01:15:36 -0500
Received: by mail-ua1-f65.google.com with SMTP id r22so2033074uam.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Nov 2019 22:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9yIKhMPMljW03rsGEF8LljWFKxCpgqs32gHznOzRrkU=;
        b=a5QoL30HvSEZynCl/a1K6RSYVfhOX/6DM8wEnJNPYl1VWwe6nSWllO8JV7myjdbRQh
         t62rimg+Byea+5mVZX5GD6S/F9W/Y2Or8fhRGZm3AlG2qnfj8NCUmImGAQ7DMv8osiQw
         EmdxwKKoChB0+/iRdGQJhWzt4ZWTiSTiswywGX8X5pIxsOf+Kib6d6vghyZxugVK8558
         XKeFOz7xJH9hBzDGiPeaZOuwxfKO6EEOtuv9J044cs+U74fF7fLqm8DP0Hmo5Hnnb7Ei
         r5bW4eXGuf2lmI7ZBPTTOT2pNPzzPpxL4uw1GHGjA11VzU4JsmwCPfe6MI1tUEYNFcj2
         vJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9yIKhMPMljW03rsGEF8LljWFKxCpgqs32gHznOzRrkU=;
        b=eDUkl6FulGA8ikxh/3HL3AvNJh17NP+LX4sCx+Vj+GiZSVpRO/TJXlgtmssr0oWo7s
         G5L6iBRmcAOM/p90xvuBDdIVjZ+ImSP1E51vQ46H8qM6pjO/D4spqYF5UIcCxHBaSFMR
         3Sqwpi5dn5czk2rSoXKla5U/u2MBFWvkR0tzXK+JayofiwexMDoeDNwAk2egSK2XG/ey
         x8dN+AwIs+J5HhgGJi5Adf/PdPEk+BMYI2sVValtpZ6GEiLKy/+utz0MFZ0Yjv8LbsqS
         FHYqEJ48oXPtXfmf02hdrxZEu5ZPVSz42NEClgItD/GLJGrDAQKVi1G/tZGxQyCnRRIc
         ThDg==
X-Gm-Message-State: APjAAAV5Dbig8HWJt8tvQQqOXnWZpK47m86SIeevOpGoxrbLGDP+tYrG
        zmHC94L8NUMTKQ45On7vdpEtSUwkQjOgIYSEB0znbQ==
X-Google-Smtp-Source: APXvYqyYHUY+82qcl4WGZkgldt09N+9qQ36Lo/k74j/vgi+PP8mh49yZ4P0PxZK+XtAddRrpT8QrZOnayNJQbpG8XpU=
X-Received: by 2002:ab0:1405:: with SMTP id b5mr11166275uae.94.1572848134047;
 Sun, 03 Nov 2019 22:15:34 -0800 (PST)
MIME-Version: 1.0
References: <20191101100035.25502-1-colin.king@canonical.com>
In-Reply-To: <20191101100035.25502-1-colin.king@canonical.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 4 Nov 2019 11:45:22 +0530
Message-ID: <CAHLCerPX5WPvVRxfgAQyAguomBaEsCyncJUuOafkY2cMjQmsaQ@mail.gmail.com>
Subject: Re: [PATCH][next][V2] drivers: thermal: tsens: fix potential integer
 overflow on multiply
To:     Colin King <colin.king@canonical.com>
Cc:     Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 1, 2019 at 3:30 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently a multiply operation is being performed on two int values
> and the result is being assigned to a u64, presumably because the
> end result is expected to be probably larger than an int. However,
> because the multiply is an int multiply one can get overflow. Avoid
> the overflow by casting degc to a u64 to force a u64 multiply.
>
> Also use div_u64 for the divide as suggested by Daniel Lezcano.
>
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: fbfe1a042cfd ("drivers: thermal: tsens: Add interrupt support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>
> V2: use div_u64 for the divide as suggested by Daniel Lezcano.
>
> ---
>  drivers/thermal/qcom/tsens-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
> index 03bf1b8133ea..c6b551ec7323 100644
> --- a/drivers/thermal/qcom/tsens-common.c
> +++ b/drivers/thermal/qcom/tsens-common.c
> @@ -92,7 +92,7 @@ void compute_intercept_slope(struct tsens_priv *priv, u32 *p1,
>
>  static inline u32 degc_to_code(int degc, const struct tsens_sensor *s)
>  {
> -       u64 code = (degc * s->slope + s->offset) / SLOPE_FACTOR;
> +       u64 code = div_u64(((u64)degc * s->slope + s->offset), SLOPE_FACTOR);
>
>         pr_debug("%s: raw_code: 0x%llx, degc:%d\n", __func__, code, degc);
>         return clamp_val(code, THRESHOLD_MIN_ADC_CODE, THRESHOLD_MAX_ADC_CODE);
> --
> 2.20.1
>
