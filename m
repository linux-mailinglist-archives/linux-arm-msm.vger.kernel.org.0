Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07BA336026B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 08:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbhDOGcA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 02:32:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:34206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229731AbhDOGcA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 02:32:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BF51610CB;
        Thu, 15 Apr 2021 06:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618468297;
        bh=0YRXQV79o+0JhBwvL6NEeXyFlPks3OxrC+QdKHzGv8Q=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=r2KIbVg7hE1/nKY4cN5HntQ+/dBfKK39UmqjsydQf59RrqyIsf0gY/JQVBHnkyuoI
         DGKA18xTj8MhmESNYpeY8g3gAvMGACTExkrnL+Abb2HdXFiqx+58+497Zk9ePa3YUv
         +9qNka2zzydf6aLXjEzASGl/UGskdYod1YIytoxZtvWgJhFitxpRLprxeijX7e87yV
         48YhIGhyXJE2J6sLVynS3FfrFTV5YTEIejzx/y/xX68uiiKnsa2YOCySbaOlmSvSzU
         A/Ybs7IH3O4vdmo8MvTFON0IoMrHGgDkhLIQ5KbcE6a5Vjhb0j9CQpKPU/rIslYWrm
         8/Q6S4mJGo2eA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Souradeep Chowdhury <schowdhu@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Subject: Re: [PATCH V3 2/4] soc: qcom: dcc:Add driver support for Data
 Capture and Compare unit(DCC)
In-Reply-To: <59b2e83d5d0f435112f6ae266612ff91c85b120f.1618387606.git.schowdhu@codeaurora.org>
References: <cover.1618387606.git.schowdhu@codeaurora.org>
 <59b2e83d5d0f435112f6ae266612ff91c85b120f.1618387606.git.schowdhu@codeaurora.org>
Date:   Thu, 15 Apr 2021 09:31:29 +0300
Message-ID: <87k0p4njni.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Souradeep Chowdhury <schowdhu@codeaurora.org> writes:
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index ad675a6..e7f0ccb 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -1,19 +1,22 @@
>  # SPDX-License-Identifier: GPL-2.0
>  CFLAGS_rpmh-rsc.o :=3D -I$(src)
>  obj-$(CONFIG_QCOM_AOSS_QMP) +=3D	qcom_aoss.o
> -obj-$(CONFIG_QCOM_GENI_SE) +=3D	qcom-geni-se.o
> +obj-$(CONFIG_QCOM_APR) +=3D apr.o
>  obj-$(CONFIG_QCOM_COMMAND_DB) +=3D cmd-db.o
>  obj-$(CONFIG_QCOM_CPR)		+=3D cpr.o
> +obj-$(CONFIG_QCOM_DCC) +=3D dcc.o
> +obj-$(CONFIG_QCOM_GENI_SE) +=3D   qcom-geni-se.o
>  obj-$(CONFIG_QCOM_GSBI)	+=3D	qcom_gsbi.o
> +obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=3D kryo-l2-accessors.o
> +obj-$(CONFIG_QCOM_LLCC) +=3D llcc-qcom.o
>  obj-$(CONFIG_QCOM_MDT_LOADER)	+=3D mdt_loader.o
>  obj-$(CONFIG_QCOM_OCMEM)	+=3D ocmem.o
>  obj-$(CONFIG_QCOM_PDR_HELPERS)	+=3D pdr_interface.o
>  obj-$(CONFIG_QCOM_QMI_HELPERS)	+=3D qmi_helpers.o
> -qmi_helpers-y	+=3D qmi_encdec.o qmi_interface.o
>  obj-$(CONFIG_QCOM_RMTFS_MEM)	+=3D rmtfs_mem.o
>  obj-$(CONFIG_QCOM_RPMH)		+=3D qcom_rpmh.o
> -qcom_rpmh-y			+=3D rpmh-rsc.o
> -qcom_rpmh-y			+=3D rpmh.o
> +obj-$(CONFIG_QCOM_RPMHPD) +=3D rpmhpd.o
> +obj-$(CONFIG_QCOM_RPMPD) +=3D rpmpd.o
>  obj-$(CONFIG_QCOM_SMD_RPM)	+=3D smd-rpm.o
>  obj-$(CONFIG_QCOM_SMEM) +=3D	smem.o
>  obj-$(CONFIG_QCOM_SMEM_STATE) +=3D smem_state.o
> @@ -21,8 +24,6 @@ obj-$(CONFIG_QCOM_SMP2P)	+=3D smp2p.o
>  obj-$(CONFIG_QCOM_SMSM)	+=3D smsm.o
>  obj-$(CONFIG_QCOM_SOCINFO)	+=3D socinfo.o
>  obj-$(CONFIG_QCOM_WCNSS_CTRL) +=3D wcnss_ctrl.o
> -obj-$(CONFIG_QCOM_APR) +=3D apr.o
> -obj-$(CONFIG_QCOM_LLCC) +=3D llcc-qcom.o
> -obj-$(CONFIG_QCOM_RPMHPD) +=3D rpmhpd.o
> -obj-$(CONFIG_QCOM_RPMPD) +=3D rpmpd.o
> -obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=3D	kryo-l2-accessors.o
> +qmi_helpers-y   +=3D qmi_encdec.o qmi_interface.o
> +qcom_rpmh-y                     +=3D rpmh-rsc.o
> +qcom_rpmh-y                     +=3D rpmh.o

why so many changes?

> diff --git a/drivers/soc/qcom/dcc.c b/drivers/soc/qcom/dcc.c
> new file mode 100644
> index 0000000..fcd5580
> --- /dev/null
> +++ b/drivers/soc/qcom/dcc.c
> @@ -0,0 +1,1539 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/cdev.h>
> +#include <linux/delay.h>
> +#include <linux/fs.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +
> +

one blank line is enough

> +#define TIMEOUT_US		100
> +
> +#define dcc_writel(drvdata, val, off)					\
> +	writel((val), drvdata->base + dcc_offset_conv(drvdata, off))
> +#define dcc_readl(drvdata, off)						\
> +	readl(drvdata->base + dcc_offset_conv(drvdata, off))
> +
> +#define dcc_sram_readl(drvdata, off)					\
> +	readl(drvdata->ram_base + off)

this would be probably be better as static inlines.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmB33cERHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYb9g/6AlVEid6Xm67J2tMxsqEiDFdG/nE4bWAk
TQFltoYhu0Rr7tKfxUzrAZmJ7tOoEgBuYoWre+V5b/QIsmRsKNF7nJ9YdaK1wVYt
ebeVXYNtHpDhyiP/m+KNNUYW0dpC64RAeCh3rVsF5DDN/K3ePLo6bPp4UeXc/vfd
wCG5Ro5FxolTa/NnZLbxdDS6b7zUdI7XE1s1fTrASISIbIPCRfKn0LdFt9wi+JR2
C4CYSLypIGyr9JD9QecMrbMZtvSfSMrogw2c5gD+kAXviPx773TG2DTYgffS5bRC
P/ZnVuQr1MuOjiYj2jkp5wsVLb02Uf+ZXsZ51AgzKUKylBgICIjfMTRBp4WR78bY
a4A5bQ3SKW6S91Sh0KfsQjPGt9FuLml5ChjH48kGoukIyDAZT4cDiMMQKsaumEyF
Tx8bZTMF4B2eszWgX114fbULAYTMqTj8yJc4El8W4HZesB8VddWtoo33VIizntxN
Z0iwiSeHdWH6Ntc/RFhEnq+P3zl4Wi6Ht+RZRjBRBUVUbb9wanssqfylogd4z2O7
N5+QeuirjKu6YSaNQXjfVws2SPG3ZKLNl0+mcRZQGP7WBYHFtlpfCtAq5JHauiOB
5XJqKtYv9erlQ467UlMhiox/bpCHIYgJPlIbsqFlJxYSV4XCGBppQkETs4YlahzZ
tsZO2dNiwmI=
=O4zN
-----END PGP SIGNATURE-----
--=-=-=--
