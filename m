Return-Path: <linux-arm-msm+bounces-14299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B50B87DB65
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Mar 2024 21:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E4DE1C20A8C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Mar 2024 20:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7351C28F;
	Sat, 16 Mar 2024 20:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sh/uKQxB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0981C280
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Mar 2024 20:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710619692; cv=none; b=t6baT3czQtkXePK1tK7QbxA/apXPnacKoE+PP4+TNHbs8kxDFU5k7nEkiENC0RX5EuBE10AzzapdbXcG0F5GmCOZY5nF1ghpDfzRGgQI/PtRsWJtSzFTB3sbVifWUuGLWkckLqEfDkTgjBZYLYOlv6Fi/v0tjJjsWX262NZc+DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710619692; c=relaxed/simple;
	bh=U1gMh+s+a7WJQ50TlopQKqfh4iRR1YUGrowPcQJVT98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MHZubvbNMOoNA1avtSE4EPipvqeV3/OE4hrJa7q7H5DFYnenEB1oI3byFx9EwY8gf18L/d8TK19wisP6ARxBXdAq+5RQ6XcXobreBJnlnDAPP3q4/Pp4s70kcWGW6cU4nlEBxI2QrPoa0OTm4g9/dTSKzfFfz/8k/12V0ZZKLF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sh/uKQxB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA0DC43330
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Mar 2024 20:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710619692;
	bh=U1gMh+s+a7WJQ50TlopQKqfh4iRR1YUGrowPcQJVT98=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sh/uKQxBuPBBW6j7uzDAo4Yc7ANSRoSglrD9g87E9arQnQZtljDZaEZPAYkPF2vki
	 OKrlZQm84TnvpbjO70TufmXGB5BrB5NH2ymK6TlJHxwIe3IADobHQac0XXEtAptBnP
	 UCAaVYz9z//I5sj2ck2bCp3D736vHXU8iTTh3IlwfOVPYNMOq30EShcj+32IXmhsjW
	 KOExFltZ4SpjHLy4GLB0ptqGEq1yrMVus9+qfdq7jYJIF2VotgDqZp8AeriL2lSjp8
	 YQU5ukPZm+pt2/4yZOpmZDw9iifzMjpFyX2ZLev/H76dBesSyZRfBOEpqr2Wu3uyqw
	 qkjtxJqESY80A==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a46af3ede0eso18041766b.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Mar 2024 13:08:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCViKOEpVIxKiaS6iZ1j2MBud26L5RbXk4MbbQMcBbNexylMy0u+BqBmGmEEfPfiDeOpZCVmG2fPSHGd1NGjzpvU4wXMV0NboJds4qCWeA==
X-Gm-Message-State: AOJu0YxD017E+6uhXq3KSLkTcMrjDsjHC/SzYUVrQJ/woNSJ2P7tUAb4
	YGxjdzBkR+SOvIIQZY2vFrDgWoLFfcj6cEbGWXWJVCGzscMT8398WkNpFZTJGuliPQpqG3Ma+92
	Re2X7/1lyB9CVnngRqFAi9unyDWvfNw8+yhU4dw==
X-Google-Smtp-Source: AGHT+IFSfMUwxOtll9dxMiGj6hSds8Nzq39+yhJMmOycFs9JN1BVr+RjJUEDs9GFIDRdqXd/S1tEfHo8p6Jpw3fDQaE=
X-Received: by 2002:a17:907:60ca:b0:a44:5477:bb46 with SMTP id
 hv10-20020a17090760ca00b00a445477bb46mr7125461ejc.61.1710619690358; Sat, 16
 Mar 2024 13:08:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227160928.2671-1-quic_priyjain@quicinc.com>
In-Reply-To: <20240227160928.2671-1-quic_priyjain@quicinc.com>
From: Amit Kucheria <amitk@kernel.org>
Date: Sun, 17 Mar 2024 01:37:58 +0530
X-Gmail-Original-Message-ID: <CAHLCerModb=01WX=q6XU0XO8dr5EaSQ5RaBoFLFc_=vpOGAgaw@mail.gmail.com>
Message-ID: <CAHLCerModb=01WX=q6XU0XO8dr5EaSQ5RaBoFLFc_=vpOGAgaw@mail.gmail.com>
Subject: Re: [PATCH v3] thermal/drivers/tsens: Add suspend to RAM support for tsens
To: Priyansh Jain <quic_priyjain@quicinc.com>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_manafm@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 9:40=E2=80=AFPM Priyansh Jain <quic_priyjain@quicin=
c.com> wrote:
>
> As part of suspend to RAM, tsens hardware will be turned off.
> While resume callback, re-initialize tsens hardware.
>
> Signed-off-by: Priyansh Jain <quic_priyjain@quicinc.com>
> ---
> V2 -> V3: Remove suspend callback & interrupt enablement part from
> resume callback.
> V1 -> V2: Update commit text to explain the necessity of this patch
>
>  drivers/thermal/qcom/tsens-v2.c |  1 +
>  drivers/thermal/qcom/tsens.c    | 40 +++++++++++++++++++++++++++++++++
>  drivers/thermal/qcom/tsens.h    |  6 +++++
>  3 files changed, 47 insertions(+)
>
> diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens=
-v2.c
> index 29a61d2d6ca3..0cb7301eca6e 100644
> --- a/drivers/thermal/qcom/tsens-v2.c
> +++ b/drivers/thermal/qcom/tsens-v2.c
> @@ -107,6 +107,7 @@ static const struct reg_field tsens_v2_regfields[MAX_=
REGFIELDS] =3D {
>  static const struct tsens_ops ops_generic_v2 =3D {
>         .init           =3D init_common,
>         .get_temp       =3D get_temp_tsens_valid,
> +       .resume         =3D tsens_resume_common,
>  };

Please add resume callbacks for the other tsens hardware too and make
sure that your reinit function handles them too.

>
>  struct tsens_plat_data data_tsens_v2 =3D {
> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> index 6d7c16ccb44d..396c1cd71351 100644
> --- a/drivers/thermal/qcom/tsens.c
> +++ b/drivers/thermal/qcom/tsens.c
> @@ -17,6 +17,7 @@
>  #include <linux/pm.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> +#include <linux/suspend.h>
>  #include <linux/thermal.h>
>  #include "../thermal_hwmon.h"
>  #include "tsens.h"
> @@ -1193,6 +1194,45 @@ static int tsens_register_irq(struct tsens_priv *p=
riv, char *irqname,
>         return ret;
>  }
>
> +#ifdef CONFIG_SUSPEND
> +static int tsens_reinit(struct tsens_priv *priv)
> +{
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&priv->ul_lock, flags);
> +
> +       /* in VER_0 TSENS need to be explicitly enabled */
> +       if (tsens_version(priv) =3D=3D VER_0)
> +               regmap_field_write(priv->rf[TSENS_EN], 1);
> +
> +       /*
> +        * Re-enable the watchdog, unmask the bark.
> +        * Disable cycle completion monitoring
> +        */
> +       if (priv->feat->has_watchdog) {
> +               regmap_field_write(priv->rf[WDOG_BARK_MASK], 0);
> +               regmap_field_write(priv->rf[CC_MON_MASK], 1);
> +       }
> +
> +       /* Re-enable interrupts */
> +       if (tsens_version(priv) >=3D VER_0_1)
> +               tsens_enable_irq(priv);
> +
> +       spin_unlock_irqrestore(&priv->ul_lock, flags);
> +
> +       return 0;
> +}
> +
> +int tsens_resume_common(struct tsens_priv *priv)
> +{
> +       if (pm_suspend_target_state =3D=3D PM_SUSPEND_MEM)
> +               tsens_reinit(priv);
> +
> +       return 0;
> +}
> +
> +#endif /* !CONFIG_SUSPEND */
> +
>  static int tsens_register(struct tsens_priv *priv)
>  {
>         int i, ret;
> diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
> index cb637fa289ca..7a147d9d8544 100644
> --- a/drivers/thermal/qcom/tsens.h
> +++ b/drivers/thermal/qcom/tsens.h
> @@ -635,6 +635,12 @@ int init_common(struct tsens_priv *priv);
>  int get_temp_tsens_valid(const struct tsens_sensor *s, int *temp);
>  int get_temp_common(const struct tsens_sensor *s, int *temp);
>
> +#ifdef CONFIG_SUSPEND
> +int tsens_resume_common(struct tsens_priv *priv);
> +#else
> +#define tsens_resume_common            NULL
> +#endif
> +
>  /* TSENS target */
>  extern struct tsens_plat_data data_8960;
>
> --
> 2.17.1
>

