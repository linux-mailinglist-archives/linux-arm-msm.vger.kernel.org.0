Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7D190CB1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2019 06:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbfHQEHV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Aug 2019 00:07:21 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42245 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfHQEHV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Aug 2019 00:07:21 -0400
Received: by mail-pf1-f195.google.com with SMTP id i30so4104331pfk.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2019 21:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=1HgC5/QNAOHXCXC2GEYSZ/KGai77GKdH3Ngn3CXwIzc=;
        b=VPQQT7J3PEmdCd3GM/xLhIDrESV9wDUf3xiB3hUTDuucsu1hmkhVyE9M1GllFjqdck
         dv/tV00ZiIWa4reQQbxhLFnt/wxQkqVaYZycgOvlyNLpc/VhProajbVUCh9Imtt9N1Ir
         nNj66Vh1q8ib47FRZ9hwmcQUSKesHnhINywlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=1HgC5/QNAOHXCXC2GEYSZ/KGai77GKdH3Ngn3CXwIzc=;
        b=US0u19SNrKTEQdUXWwc5dRa8PV9a0xEnksR/IA6LM0WPJUeVt5B52LB2wGoW40WDSk
         xkKRskYEvcUA66LRNC56Boyxvuu01L0YcXcDI3XAY96V6kLsUfZe/DfLWX2Fa8CpuqVa
         gYH5LSJlroMnYUmcWnC+y3dsGuYfgOfEoR779CcpiLHeYFMn2dprSP74r7NckzUtHbT0
         zjeEazmBOLxJBIbFwJVRI/Q+RP93q6A2un4b5JEWq/IO2wYSbnbHSzpyZtJ+TnlznxoP
         SHgJzN5ofBygRlG9dBJK+VhrevdJR6uLPAWBrin09UM/QaTQtLB+4/o591v6u/ewo26G
         JW0g==
X-Gm-Message-State: APjAAAVTDeNYGL3rIlqmht3iHmhM/QUnCf1nNeC9sW4WTooWzyGO8MjM
        LZ93+7yrGZt8ezm0ORFHCKDNfNDQI/Jx5Q==
X-Google-Smtp-Source: APXvYqxqM+gga5VFOHVEO361fIeq4LdLkS64PIcxrfhM7a1uQGpK//k+xkw/q++kL9P7UQhU32ej3A==
X-Received: by 2002:a05:6a00:cd:: with SMTP id e13mr14540751pfj.202.1566014840127;
        Fri, 16 Aug 2019 21:07:20 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h197sm8195139pfe.67.2019.08.16.21.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2019 21:07:19 -0700 (PDT)
Message-ID: <5d577d77.1c69fb81.b6b07.83e6@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <534b5017c2210ba8d541c206dace204d6617b4c9.1564091601.git.amit.kucheria@linaro.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org> <534b5017c2210ba8d541c206dace204d6617b4c9.1564091601.git.amit.kucheria@linaro.org>
Subject: Re: [PATCH 04/15] drivers: thermal: tsens: Add debugfs support
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-pm@vger.kernel.org
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, andy.gross@linaro.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Fri, 16 Aug 2019 21:07:18 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2019-07-25 15:18:39)
> Dump some basic version info and sensor details into debugfs
>=20

Maybe you can put some sample output in the commit text.

> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  drivers/thermal/qcom/tsens-common.c | 85 +++++++++++++++++++++++++++++
>  drivers/thermal/qcom/tsens.c        |  2 +
>  drivers/thermal/qcom/tsens.h        |  6 ++
>  3 files changed, 93 insertions(+)
>=20
> diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/t=
sens-common.c
> index 7437bfe196e5..7ab2e740a1da 100644
> --- a/drivers/thermal/qcom/tsens-common.c
> +++ b/drivers/thermal/qcom/tsens-common.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2015, The Linux Foundation. All rights reserved.
>   */
> =20
> +#include <linux/debugfs.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/nvmem-consumer.h>
> @@ -139,6 +140,79 @@ int get_temp_common(struct tsens_sensor *s, int *tem=
p)
>         return 0;
>  }
> =20
> +#ifdef CONFIG_DEBUG_FS
> +static int dbg_sensors_show(struct seq_file *s, void *data)
> +{
> +       struct platform_device *pdev =3D s->private;
> +       struct tsens_priv *priv =3D platform_get_drvdata(pdev);
> +       int i;
> +
> +       seq_printf(s, "max: %2d\nnum: %2d\n\n",
> +                  priv->feat->max_sensors, priv->num_sensors);
> +
> +       seq_puts(s, "      id   slope  offset\n------------------------\n=
");
> +       for (i =3D 0;  i < priv->num_sensors; i++) {
> +               seq_printf(s, "%8d%8d%8d\n", priv->sensor[i].hw_id,

Does this not have spaces between the digits on purpose?

> +                          priv->sensor[i].slope, priv->sensor[i].offset);
> +       }
> +
> +       return 0;
> +}
> +
> +static int dbg_version_show(struct seq_file *s, void *data)
> +{
> +       struct platform_device *pdev =3D s->private;
> +       struct tsens_priv *priv =3D platform_get_drvdata(pdev);
> +       u32 maj_ver, min_ver, step_ver;
> +       int ret;
> +
> +       if (tsens_ver(priv) > VER_0_1) {
> +               ret =3D regmap_field_read(priv->rf[VER_MAJOR], &maj_ver);
> +               if (ret)
> +                       return ret;
> +               ret =3D regmap_field_read(priv->rf[VER_MINOR], &min_ver);
> +               if (ret)
> +                       return ret;
> +               ret =3D regmap_field_read(priv->rf[VER_STEP], &step_ver);
> +               if (ret)
> +                       return ret;
> +               seq_printf(s, "%d.%d.%d\n", maj_ver, min_ver, step_ver);
> +       } else {
> +               seq_puts(s, "0.1.0\n");
> +       }
> +
> +       return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(dbg_version);
> +DEFINE_SHOW_ATTRIBUTE(dbg_sensors);
> +
> +static void tsens_debug_init(struct platform_device *pdev)
> +{
> +       struct tsens_priv *priv =3D platform_get_drvdata(pdev);
> +       struct dentry *root, *file;
> +
> +       root =3D debugfs_lookup("tsens", NULL);

Does this get created many times? Why doesn't tsens have a pointer to
the root saved away somewhere globally?

> +       if (!root)
> +               priv->debug_root =3D debugfs_create_dir("tsens", NULL);
> +       else
> +               priv->debug_root =3D root;
> +
> +       file =3D debugfs_lookup("version", priv->debug_root);
> +       if (!file)
> +               debugfs_create_file("version", 0444, priv->debug_root,
> +                                   pdev, &dbg_version_fops);
> +
> +       /* A directory for each instance of the TSENS IP */
> +       priv->debug =3D debugfs_create_dir(dev_name(&pdev->dev), priv->de=
bug_root);
> +       debugfs_create_file("sensors", 0444, priv->debug, pdev, &dbg_sens=
ors_fops);
> +
> +       return;
> +}
