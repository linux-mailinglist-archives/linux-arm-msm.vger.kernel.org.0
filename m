Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C794927F676
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 02:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730128AbgJAAHW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 20:07:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:34292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727210AbgJAAHW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 20:07:22 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 263DD2067C;
        Thu,  1 Oct 2020 00:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601510842;
        bh=mxHwJtix2oePz5Y9t2+7oqSmrOrDdzGdUegooLeZXRg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TggYMSF97Vr6v945B53ghryBpD4/zASFXFa14LjZYicweDEigAZx84+11vHZg5IrS
         Or+LVtIT4AsKw13BRD/lw9ocHc0clF443zrit/J5NCFC3PTluDtsJeUXXPlXMKMG+Y
         c7jEWg74Tt1w6ciTZ4suf+8XGQUEfo8XiK+2k8Yo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1600812258-17722-1-git-send-email-collinsd@codeaurora.org>
References: <1600812258-17722-1-git-send-email-collinsd@codeaurora.org>
Subject: Re: [RESEND PATCH] spmi: prefix spmi bus device names with "spmi"
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Collins <collinsd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
To:     David Collins <collinsd@codeaurora.org>
Date:   Wed, 30 Sep 2020 17:07:20 -0700
Message-ID: <160151084091.310579.3876905878885019200@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting David Collins (2020-09-22 15:04:18)
> Change the format of spmi bus device names from:
>   <spmi_bus_number>-<spmi_device_sid>
>   Example: 0-01
> to this:
>   spmi<spmi_bus_number>-<spmi_device_sid>
>   Example: spmi0-01
>=20
> This helps to disambiguate SPMI device regmaps from I2C ones
> at /sys/kernel/debug/regmap since I2C devices use a very
> similar naming scheme: 0-0000.

Can regmap debugfs prepend the bus name on the node made in debugfs?
Does it do that already?

>=20
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> ---
>  drivers/spmi/spmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
> index c16b60f..ec94439 100644
> --- a/drivers/spmi/spmi.c
> +++ b/drivers/spmi/spmi.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2012-2015, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2012-2015, 2020, The Linux Foundation. All rights reser=
ved.
>   */
>  #include <linux/kernel.h>
>  #include <linux/errno.h>
> @@ -62,7 +62,7 @@ int spmi_device_add(struct spmi_device *sdev)
>         struct spmi_controller *ctrl =3D sdev->ctrl;
>         int err;
> =20
> -       dev_set_name(&sdev->dev, "%d-%02x", ctrl->nr, sdev->usid);
> +       dev_set_name(&sdev->dev, "spmi%d-%02x", ctrl->nr, sdev->usid);
> =20
>         err =3D device_add(&sdev->dev);
>         if (err < 0) {
