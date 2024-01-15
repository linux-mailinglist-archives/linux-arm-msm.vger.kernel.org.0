Return-Path: <linux-arm-msm+bounces-7245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C97BD82D572
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jan 2024 10:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B80021C213BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jan 2024 09:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59190BE74;
	Mon, 15 Jan 2024 09:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="aCqBXiAb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F202C120;
	Mon, 15 Jan 2024 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1705309228; x=1736845228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g6PvM5PZ5lAwk5blKzy9Iw4vRtHOu2phSirCBIVrkLg=;
  b=aCqBXiAbxocYXze22dXVsEeep/pieVdfxtp9tPGz24shcBwa+iItmfuf
   K//P4XW3GeYx0y5J/6yy4o3R6s3JcgSrWdgg4wWikvtGSGeWXi9ZYXMqt
   ZHGNk+OfMIkTxRQcrFKUSTDJmE4FIkRk0C8M8LCpyno0uoTyFfyLjyEzi
   HsbksytW2zFXJuSM3I4gZwS/vL+AXqeO//6jUEHsUutUiSDBKX3LuM9rF
   JXBt+fHwbpi0RvXq8wnIGOIFy9ic3um0dR/QDBanA5FYdr+PmeB6B/SE3
   EDPdzDpP26IhKmoxMTdjE5tsJTvwvI+ZT816wfSZxUrrvlmI6tBPORQl4
   Q==;
X-IronPort-AV: E=Sophos;i="6.04,196,1695679200"; 
   d="scan'208";a="34890230"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Jan 2024 10:00:20 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4A7BA280075;
	Mon, 15 Jan 2024 10:00:04 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 05/15] usb: typec: tcpm: fix the PD disabled case
Date: Mon, 15 Jan 2024 10:00:03 +0100
Message-ID: <12361952.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240113-pmi632-typec-v2-5-182d9aa0a5b3@linaro.org>
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org> <20240113-pmi632-typec-v2-5-182d9aa0a5b3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Dmitry,

Am Samstag, 13. Januar 2024, 21:55:48 CET schrieb Dmitry Baryshkov:
> If the PD is disabled for the port, port->pds will be left as NULL,
> which causes the following crash during caps intilisation. Fix the
> crash.
>=20
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000000 Call trace:
>  tcpm_register_port+0xaec/0xc44
>  qcom_pmic_typec_probe+0x1a4/0x254
>  platform_probe+0x68/0xc0
>  really_probe+0x148/0x2ac
>  __driver_probe_device+0x78/0x12c
>  driver_probe_device+0xd8/0x160
> Bluetooth: hci0: QCA Product ID   :0x0000000a
>  __device_attach_driver+0xb8/0x138
>  bus_for_each_drv+0x80/0xdc
> Bluetooth: hci0: QCA SOC Version  :0x40020150
>  __device_attach+0x9c/0x188
>  device_initial_probe+0x14/0x20
>  bus_probe_device+0xac/0xb0
>  deferred_probe_work_func+0x8c/0xc8
>  process_one_work+0x1ec/0x51c
>  worker_thread+0x1ec/0x3e4
>  kthread+0x120/0x124
>  ret_from_fork+0x10/0x20
>=20
> Fixes: cd099cde4ed2 ("usb: typec: tcpm: Support multiple capabilities")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 5945e3a2b0f7..a0978ed1a257 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -6848,7 +6848,8 @@ struct tcpm_port *tcpm_register_port(struct device
> *dev, struct tcpc_dev *tcpc) if (err)
>  		goto out_role_sw_put;
>=20
> -	port->typec_caps.pd =3D port->pds[0];
> +	if (port->pds)

I'm wondering if the check should be for port->pd_supported instead.
Nevertheless this works on my "pd-disable" platform as well.

Best regards,
Alexander

> +		port->typec_caps.pd =3D port->pds[0];
>=20
>  	port->typec_port =3D typec_register_port(port->dev, &port-
>typec_caps);
>  	if (IS_ERR(port->typec_port)) {


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



