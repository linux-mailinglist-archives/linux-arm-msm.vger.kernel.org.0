Return-Path: <linux-arm-msm+bounces-57326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBE5AB0460
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 22:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79D7A7A25DA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 20:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A5F28A1D7;
	Thu,  8 May 2025 20:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlC3RW+U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B5A1946A0;
	Thu,  8 May 2025 20:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746735165; cv=none; b=Ar7VBhdXeq3y2Y4TdYa649nZvZfkavWgmc+jEF+UjEbWRZ/AInqOCgucBsYj3FdJC609I3rBDlS/Avx42QCkQTHyP9DTAgxyGafq1upfgkeK87xnqNi7mv6/AYchot5Y9+nPQSx/In5IMvpUwSDqaIJCgHOHXl/0afIJpnrjKGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746735165; c=relaxed/simple;
	bh=DtD1iqT35y3CGZBB6T1SSJcp3JBxXUvzlajKCvyKK1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhTE8Y8ksALFMr6bnC1hUPLfxddMIt9F7ag2SDXNw+j7RO4S/zfknPI96S6C6R2SFCJiaeMmmncqhHTm+CVyqDYQRXhaU8Ru2D+gPBnrI83BK/2drdBadvibkx3uDcKHs56v2w+r5xmnJBICBRqBI4uHEZ+z0zzlE+I0vdCu/xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlC3RW+U; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af5499ca131so104942a12.3;
        Thu, 08 May 2025 13:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746735162; x=1747339962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMf96FXuSnX5qhllALH1Rp7ykWLVVc//J13jd72kjmw=;
        b=IlC3RW+UU4IuSX5JujLavMqGwkArOB2BarBXkTXU54NNWguAPfK2C//6kCCRjowb1u
         BEePCnm/MZLscd/sa2ycQynrdX+DCwXPtZ2smY+kIWxeXg5PX38eenSQElsJPdoaESUM
         sAU+OMge543j38SlZhVKjbzMrH5nysanFmhEr3kgJeRNxxjT1MaUQX6uBmha+8y64piW
         EKt7n9KQ6hHJ44t/iW8TeYsy1QYckFXw5AY5K1205ljJz84Or4K1Jllf+AgGz8ZKJyEe
         HgxgplKAzl6vs3zh+1qIu0nuaplyZ3Ao2l9mfRkleD5BY8WFHeLlOrTKC5K3yy3T2UlV
         YE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746735162; x=1747339962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMf96FXuSnX5qhllALH1Rp7ykWLVVc//J13jd72kjmw=;
        b=NI1D/zZjt6vZGeR4ABSy0s6hK8VwExoDID+bMIM7bOYSGG9W3kuyLx3d5VXMQiB7GW
         c3c10V81Im6zuTn2Pr1C6QoOdD+mFFO5BA14Kns0RT0ddccR/5vTgJ116pbfmYBKd6lL
         eYZHPft4/ra1XIBvhdthfcfUGuQnr69kMZlwCQZ9tR0anIW5IH5TEY8m/InzXP17YuNo
         PTm3sn0e3fkUPCe2W8Ko2yV5EttjVwrelt93ES1JyafAv0A3vzkLSPeyUcV6VFWjF3Lm
         Ap99VD3w3L57XupNc/GhqaECwXPUZD/liqe7YHPo5mTLtG3Fb8iY73lUQbg6EvT3OJJp
         wH2A==
X-Forwarded-Encrypted: i=1; AJvYcCUVFn4TyPUgnSTCglCzSCx8ns50/XmVk/kKWxOTzfXEceD77y3LhXlLlO88BhDnCo+tL1o/VOLAYle6BOzQ@vger.kernel.org, AJvYcCWKlbz/1s2Y7ffqHhyIQXmNGyZ9QL7RS19ou1xL1tLzrG1By0sqs/17IVPPR+bGGMsY7VpoQ5MEJHum7zQs@vger.kernel.org
X-Gm-Message-State: AOJu0YyG964lJlZY9wP8IMOIYuwZ76KW8XlAvTwkj++8ylWRb+tIO0Aw
	FLTciPAuhdJ5cohgeVYmza+C1o6LQPEFN7/Mg6miKGAkMu0en8fGIZ9clYgW6POqPkxe4/efRbu
	hHY/8BrvKftPlGZiTLd0bbnIWvww=
X-Gm-Gg: ASbGnctg9xMvBcD030FXFiXlW9i1qEJzWDFmEHD/fmWaoc1UyLgXAg4ZomZ32resTrt
	4p7BEErZTHThoG3gVjPg2waGbL/FnbtOBQp+D8+bLK9Emlp+8xXCbf4An1jTUiUHIOS3BxaSVKJ
	1ygJcYxA+H2A8n/FLp4mqEnA==
X-Google-Smtp-Source: AGHT+IH6e7+ed1G549/Z8OklJ1akRAitkFCuoHZTNQf9ToGv6/llgXkTnKyiPfQLlz+Ew6c4JK4FwZ+5NaQf2W/o6dQ=
X-Received: by 2002:a17:90b:3e83:b0:30a:a50a:8c93 with SMTP id
 98e67ed59e1d1-30c3d674dadmr436380a91.7.1746735162384; Thu, 08 May 2025
 13:12:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com> <20250508-topic-ubwc_central-v1-1-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-1-035c4c5cbe50@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 8 May 2025 16:12:31 -0400
X-Gm-Features: ATxdqUHnQejBvfmedAIjJ-kKl1wBYL5mqv2oNp-sfYWhNCI_Ftp14XuxAX2kJ04
Message-ID: <CACu1E7H6FGm0npQnG+M3Jzn9RSL9CYkkDg3rtH+=on4_caPTZQ@mail.gmail.com>
Subject: Re: [PATCH RFT 01/14] soc: qcom: Add UBWC config provider
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 2:13=E2=80=AFPM Konrad Dybcio <konradybcio@kernel.or=
g> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Add a file that will serve as a single source of truth for UBWC
> configuration data for various multimedia blocks.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/Kconfig       |   8 ++
>  drivers/soc/qcom/Makefile      |   1 +
>  drivers/soc/qcom/ubwc_config.c | 255 +++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/soc/qcom/ubwc.h  |  31 +++++
>  4 files changed, 295 insertions(+)
>
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 58e63cf0036ba8554e4082da5184a620ca807a9e..2caadbbcf8307ff94f5afbdd1=
481e5e5e291749f 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -296,3 +296,11 @@ config QCOM_PBS
>           PBS trigger event to the PBS RAM.
>
>  endmenu
> +
> +config QCOM_UBWC_CONFIG
> +       tristate
> +       help
> +         Most Qualcomm SoCs feature a number of Universal Bandwidth Comp=
ression
> +         (UBWC) engines across various IP blocks, which need to be initi=
alized
> +         with coherent configuration data. This module functions as a si=
ngle
> +         source of truth for that information.
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index acbca2ab5cc2a9ab3dce1ff38efd048ba2fab31e..b7f1d2a5736748b8772c090fd=
24462fa91f321c6 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -39,3 +39,4 @@ obj-$(CONFIG_QCOM_ICC_BWMON)  +=3D icc-bwmon.o
>  qcom_ice-objs                  +=3D ice.o
>  obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)        +=3D qcom_ice.o
>  obj-$(CONFIG_QCOM_PBS) +=3D      qcom-pbs.o
> +obj-$(CONFIG_QCOM_UBWC_CONFIG) +=3D ubwc_config.o
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_confi=
g.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..3f81fb2aab284dc9a5bcf53e5=
d638aaba44b6f2d
> --- /dev/null
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -0,0 +1,255 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +
> +#include <linux/soc/qcom/ubwc.h>
> +
> +static const struct qcom_ubwc_cfg_data msm8937_data =3D {
> +       .ubwc_enc_version =3D UBWC_1_0,
> +       .ubwc_dec_version =3D UBWC_1_0,
> +       .highest_bank_bit =3D 1,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data msm8998_data =3D {
> +       .ubwc_enc_version =3D UBWC_1_0,
> +       .ubwc_dec_version =3D UBWC_1_0,
> +       .highest_bank_bit =3D 2,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data qcm2290_data =3D {
> +       /* no UBWC */
> +       .highest_bank_bit =3D 2,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sa8775p_data =3D {
> +       .ubwc_enc_version =3D UBWC_4_0,
> +       .ubwc_dec_version =3D UBWC_4_0,
> +       .ubwc_swizzle =3D 4,
> +       .ubwc_bank_spread =3D true,
> +       .highest_bank_bit =3D 0,
> +       .macrotile_mode =3D true,
> +       .mdss_reg_bus_bw =3D 74000,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sar2130p_data =3D {
> +       .ubwc_enc_version =3D UBWC_3_0, /* 4.0.2 in hw */
> +       .ubwc_dec_version =3D UBWC_4_3,
> +       .ubwc_swizzle =3D 6,
> +       .ubwc_bank_spread =3D true,
> +       .highest_bank_bit =3D 0,
> +       .macrotile_mode =3D true,
> +       .mdss_reg_bus_bw =3D 74000,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sc7180_data =3D {
> +       .ubwc_enc_version =3D UBWC_2_0,
> +       .ubwc_dec_version =3D UBWC_2_0,
> +       .ubwc_swizzle =3D 6,
> +       .ubwc_bank_spread =3D true,
> +       .highest_bank_bit =3D 1,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sc7280_data =3D {
> +       .ubwc_enc_version =3D UBWC_3_0,
> +       .ubwc_dec_version =3D UBWC_4_0,
> +       .ubwc_swizzle =3D 6,
> +       .ubwc_bank_spread =3D true,
> +       .highest_bank_bit =3D 1,
> +       .macrotile_mode =3D true,
> +       .mdss_reg_bus_bw =3D 74000,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sc8180x_data =3D {
> +       .ubwc_enc_version =3D UBWC_3_0,
> +       .ubwc_dec_version =3D UBWC_3_0,
> +       .highest_bank_bit =3D 3,
> +       .macrotile_mode =3D true,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sc8280xp_data =3D {
> +       .ubwc_enc_version =3D UBWC_4_0,
> +       .ubwc_dec_version =3D UBWC_4_0,
> +       .ubwc_swizzle =3D 6,
> +       .ubwc_bank_spread =3D true,
> +       .highest_bank_bit =3D 3,
> +       .macrotile_mode =3D true,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sdm670_data =3D {
> +       .ubwc_enc_version =3D UBWC_2_0,
> +       .ubwc_dec_version =3D UBWC_2_0,
> +       .highest_bank_bit =3D 1,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sdm845_data =3D {
> +       .ubwc_enc_version =3D UBWC_2_0,
> +       .ubwc_dec_version =3D UBWC_2_0,
> +       .highest_bank_bit =3D 2,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm6115_data =3D {
> +       .ubwc_enc_version =3D UBWC_1_0,
> +       .ubwc_dec_version =3D UBWC_2_0,
> +       .ubwc_swizzle =3D 7,
> +       .ubwc_bank_spread =3D true,
> +       .highest_bank_bit =3D 1,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm6125_data =3D {
> +       .ubwc_enc_version =3D UBWC_1_0,
> +       .ubwc_dec_version =3D UBWC_3_0,
> +       .ubwc_swizzle =3D 1,
> +       .highest_bank_bit =3D 1,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm6150_data =3D {
> +       .ubwc_enc_version =3D UBWC_2_0,
> +       .ubwc_dec_version =3D UBWC_2_0,
> +       .highest_bank_bit =3D 1,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm6350_data =3D {
> +       .ubwc_enc_version =3D UBWC_2_0,
> +       .ubwc_dec_version =3D UBWC_2_0,
> +       .ubwc_swizzle =3D 6,
> +       .ubwc_bank_spread =3D true,
> +       .highest_bank_bit =3D 1,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm7150_data =3D {
> +       .ubwc_enc_version =3D UBWC_2_0,
> +       .ubwc_dec_version =3D UBWC_2_0,
> +       .highest_bank_bit =3D 1,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm8150_data =3D {
> +       .ubwc_enc_version =3D UBWC_3_0,
> +       .ubwc_dec_version =3D UBWC_3_0,
> +       .highest_bank_bit =3D 2,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm8250_data =3D {
> +       .ubwc_enc_version =3D UBWC_4_0,
> +       .ubwc_dec_version =3D UBWC_4_0,
> +       .ubwc_swizzle =3D 6,
> +       .ubwc_bank_spread =3D true,
> +       /* TODO: highest_bank_bit =3D 2 for LP_DDR4 */
> +       .highest_bank_bit =3D 3,
> +       .macrotile_mode =3D true,
> +       .mdss_reg_bus_bw =3D 76800,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm8350_data =3D {
> +       .ubwc_enc_version =3D UBWC_4_0,
> +       .ubwc_dec_version =3D UBWC_4_0,
> +       .ubwc_swizzle =3D 6,
> +       .ubwc_bank_spread =3D true,
> +       /* TODO: highest_bank_bit =3D 2 for LP_DDR4 */
> +       .highest_bank_bit =3D 3,
> +       .macrotile_mode =3D true,
> +       .mdss_reg_bus_bw =3D 74000,
> +};
> +
> +static const struct qcom_ubwc_cfg_data sm8550_data =3D {
> +       .ubwc_enc_version =3D UBWC_4_0,
> +       .ubwc_dec_version =3D UBWC_4_3,
> +       .ubwc_swizzle =3D 6,
> +       .ubwc_bank_spread =3D true,
> +       /* TODO: highest_bank_bit =3D 2 for LP_DDR4 */
> +       .highest_bank_bit =3D 3,
> +       .macrotile_mode =3D true,
> +       .mdss_reg_bus_bw =3D 57000,
> +};
> +
> +static const struct qcom_ubwc_cfg_data x1e80100_data =3D {
> +       .ubwc_enc_version =3D UBWC_4_0,
> +       .ubwc_dec_version =3D UBWC_4_3,
> +       .ubwc_swizzle =3D 6,
> +       .ubwc_bank_spread =3D true,
> +       /* TODO: highest_bank_bit =3D 2 for LP_DDR4 */
> +       .highest_bank_bit =3D 3,
> +       .macrotile_mode =3D true,
> +       /* TODO: Add mdss_reg_bus_bw with real value */
> +};
> +
> +static const struct of_device_id qcom_ubwc_configs[] __maybe_unused =3D =
{
> +       { .compatible =3D "qcom,apq8096", .data =3D &msm8998_data },
> +       { .compatible =3D "qcom,msm8917", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,msm8937", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,msm8953", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,msm8956", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,msm8976", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,msm8996", .data =3D &msm8998_data },
> +       { .compatible =3D "qcom,msm8998", .data =3D &msm8998_data },
> +       { .compatible =3D "qcom,qcm2290", .data =3D &qcm2290_data, },
> +       { .compatible =3D "qcom,qcm6490", .data =3D &sc7280_data, },
> +       { .compatible =3D "qcom,sa8155p", .data =3D &sm8150_data, },
> +       { .compatible =3D "qcom,sa8540p", .data =3D &sc8280xp_data, },
> +       { .compatible =3D "qcom,sa8775p", .data =3D &sa8775p_data, },
> +       { .compatible =3D "qcom,sc7180", .data =3D &sc7180_data },
> +       { .compatible =3D "qcom,sc7280", .data =3D &sc7280_data, },
> +       { .compatible =3D "qcom,sc8180x", .data =3D &sc8180x_data, },
> +       { .compatible =3D "qcom,sc8280xp", .data =3D &sc8280xp_data, },
> +       { .compatible =3D "qcom,sdm630", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,sdm636", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,sdm660", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,sdm670", .data =3D &sdm670_data, },
> +       { .compatible =3D "qcom,sdm845", .data =3D &sdm845_data, },
> +       { .compatible =3D "qcom,sm4250", .data =3D &sm6115_data, },
> +       { .compatible =3D "qcom,sm6115", .data =3D &sm6115_data, },
> +       { .compatible =3D "qcom,sm6125", .data =3D &sm6125_data, },
> +       { .compatible =3D "qcom,sm6150", .data =3D &sm6150_data, },
> +       { .compatible =3D "qcom,sm6350", .data =3D &sm6350_data, },
> +       { .compatible =3D "qcom,sm6375", .data =3D &sm6350_data, },
> +       { .compatible =3D "qcom,sm7125", .data =3D &sc7180_data },
> +       { .compatible =3D "qcom,sm7150", .data =3D &sm7150_data, },
> +       { .compatible =3D "qcom,sm8150", .data =3D &sm8150_data, },
> +       { .compatible =3D "qcom,sm8250", .data =3D &sm8250_data, },
> +       { .compatible =3D "qcom,sm8350", .data =3D &sm8350_data, },
> +       { .compatible =3D "qcom,sm8450", .data =3D &sm8350_data, },
> +       { .compatible =3D "qcom,sm8550", .data =3D &sm8550_data, },
> +       { .compatible =3D "qcom,sm8650", .data =3D &sm8550_data, },
> +       { .compatible =3D "qcom,x1e80100", .data =3D &x1e80100_data, },
> +       { .compatible =3D "qcom,x1p42100", .data =3D &x1e80100_data, },
> +       { }
> +};
> +
> +const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> +{
> +       const struct of_device_id *match;
> +       struct device_node *root;
> +
> +       root =3D of_find_node_by_path("/");
> +       if (!root)
> +               return ERR_PTR(-ENODEV);
> +
> +       match =3D of_match_node(qcom_ubwc_configs, root);
> +       of_node_put(root);
> +       if (!match) {
> +               pr_err("Couldn't find UBWC config data for this platform!=
\n");
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       return match->data;
> +}
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.=
h
> new file mode 100644
> index 0000000000000000000000000000000000000000..450106e6aea06f9f752bb7312=
ec3074e375eee4d
> --- /dev/null
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2018, The Linux Foundation
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QCOM_UBWC_H__
> +#define __QCOM_UBWC_H__
> +
> +#include <linux/types.h>
> +
> +struct qcom_ubwc_cfg_data {
> +       u32 ubwc_enc_version;
> +       /* Can be read from MDSS_BASE + 0x58 */
> +       u32 ubwc_dec_version;
> +       u32 ubwc_swizzle;
> +       int highest_bank_bit;
> +       bool ubwc_bank_spread;
> +       bool macrotile_mode;
> +       u32 mdss_reg_bus_bw;

This doesn't really seem relevant to UBWC?

> +};

The comments should be copied over from the Adreno struct. That was
the main way the meaning of most of these was documented and you're
deleting it here.

> +
> +#define UBWC_1_0 0x10000000
> +#define UBWC_2_0 0x20000000
> +#define UBWC_3_0 0x30000000
> +#define UBWC_4_0 0x40000000
> +#define UBWC_4_3 0x40030000
> +
> +const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void);
> +
> +#endif /* __QCOM_UBWC_H__ */
>
> --
> 2.49.0
>

