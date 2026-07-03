Return-Path: <linux-arm-msm+bounces-116318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vIYZDnu1R2p1dwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 15:13:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 807A5702B95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 15:13:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oFEFLmep;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116318-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116318-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76DFA300A607
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 12:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392F7282F05;
	Fri,  3 Jul 2026 12:55:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF97F34041E
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 12:55:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783083306; cv=none; b=dmU3yqr3Ok2IdVEQxhcQXfhU6KLuAezhaw6cXDjD32RC/78OVR35gtQ015cvDGYWlcmLRYfEbPh1empQvwrV9wp9P4Udn4+x+x3VqtOuGr4hEqhcT8Zd8R4wv7MxrDJMIQNUEsK2Gw/8igMa92OC0N7pRWdCS9AxyTb9E+qicZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783083306; c=relaxed/simple;
	bh=bdU5xdh0Tc/MPdcudIvPVvHcaR+4k114SWbdCZzN3IU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=liW1/678ekYGpu339ycLJyPEFqutVN1q7gnS4UFVG1hv7pBMJP20s7TD1U/AISN3x9+u9a7oROD6DC2Ja4t4WvfoosCwf4lyqz9PIseNw3bUjeOcT9xt4rcLsKrXqN5LWMIqarPJRrnSAx525PDDbIdUw6vByW/qTz6zSclePkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFEFLmep; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC011F00ADB
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 12:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783083304;
	bh=c75kjWTkP9f44+dLf5buuakgGrlKoWDYJf3mAFR9pPc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=oFEFLmepxsCwvE1Qv348g7an2YOgSJZcs9og7aKPnnUcNFcEEBuE9wdoxFjG08xCO
	 tkTZuIRumkCS+1S+LlhoqnqB66NIiIaSRiTRdqHfxrGAe8D69w1OU3haMre5B6PLE1
	 oWy2ZmaOpB8OBAb36rJAoGIWKlPgi5ypW32j+GioZTfpZ8Hmzkg3aupiDtVv8jTZ57
	 FQqTOgDF+seEDXCff77L7B70sn2USvL3EsEsDJIC35k5jentemF2YJc1vOeaBKHINg
	 Qsokd8GE44ekLZSFP9Tfv9CD8d6NPXnvpTQWImt3dNxzIqP+wF85HpkfFFRC5HHQSy
	 YyKuas5Ky87Fw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39b1eb7bd9bso4706641fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:55:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roca+cjl+ULpAlAg4C0wI2V7UY1MjJuWhAwYf/LOsQXJU2Zm/XvcJEZEE5tivTYHa8JJhEtyPsY4LZg5RyA@vger.kernel.org
X-Gm-Message-State: AOJu0YwOCpyxZQoyDoWAzKXyoWHfiRFLJicbml+mGRm/ZKq0biB5UkM7
	leSPdiwFwDff0aJzBALosrO1fNtHKmKvNs5grHWQyGdo3Y97F1LS8tFbiCGcyd4mbhJMzmzy47O
	iZsCR0i+2PPR6bp8XrxvpwajXv7crTj/A4UyFxxr/bQ==
X-Received: by 2002:a2e:a58f:0:b0:39b:2ff8:64ae with SMTP id
 38308e7fff4ca-39b33f7e610mr21068041fa.9.1783083303375; Fri, 03 Jul 2026
 05:55:03 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 07:55:02 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 07:55:02 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260703-ipq5018-bluetooth-v3-4-62da72818ab3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-ipq5018-bluetooth-v3-0-62da72818ab3@outlook.com> <20260703-ipq5018-bluetooth-v3-4-62da72818ab3@outlook.com>
Date: Fri, 3 Jul 2026 07:55:02 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mda=t_ndCGKwFGLq529QGkeWayhKzqnfeyO1CckDFgLAw@mail.gmail.com>
X-Gm-Features: AVVi8Cdbe92Pp63-wnnrvVfXEFdbZSbcghifFWVZYjARCA6v05lMUDAiRtMVOVw
Message-ID: <CAMRc=Mda=t_ndCGKwFGLq529QGkeWayhKzqnfeyO1CckDFgLAw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] Bluetooth: Introduce Qualcomm IPQ5018 IPC based
 HCI driver
To: george.moussalem@outlook.com
Cc: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116318-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:devnull+george.moussalem.outlook.com@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:devnull@kernel.org,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,outlook.com:email];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,holtmann.org,gmail.com,pengutronix.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,george.moussalem.outlook.com,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 807A5702B95

On Fri, 3 Jul 2026 07:01:52 +0200, George Moussalem via B4 Relay
<devnull+george.moussalem.outlook.com@kernel.org> said:
> From: George Moussalem <george.moussalem@outlook.com>
>
> Add support for the Bluetooth controller found in the IPQ5018 SoC.
> This driver implements firmware loading and the transport layer between
> the HCI core and the Bluetooth controller.
>
> The firmware is loaded by the host into the dedicated reserved memory
> carveout and authenticated by TrustZone. A Secure Channel Manager (SCM)
> call safely brings the peripheral core out of reset.
>
> A shared memory ring buffer topology handles runtime data frame
> transport between the host APSS and the controller.
>
> An outgoing APCS IPC bit and an incoming GIC interrupt handle host/guest
> signaling.
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  drivers/bluetooth/Kconfig     |   11 +
>  drivers/bluetooth/Makefile    |    1 +
>  drivers/bluetooth/btqcomipc.c | 1041 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 1053 insertions(+)
>
> diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
> index 4e8c24d757e9..c9785f43c87c 100644
> --- a/drivers/bluetooth/Kconfig
> +++ b/drivers/bluetooth/Kconfig
> @@ -413,6 +413,17 @@ config BT_MTKUART
>  	  Say Y here to compile support for MediaTek Bluetooth UART devices
>  	  into the kernel or say M to compile it as module (btmtkuart).
>
> +config BT_QCOMIPC
> +	tristate "Qualcomm IPQ5018 IPC based HCI support"
> +	select BT_QCA

You seem to need to depend on CONFIG_OF.

> +	help
> +	  Qualcomm IPQ5018 IPC based HCI driver.
> +	  This driver is used to load firmware and bridge HCI data onto shared
> +	  memory between the host and the Bluetooth controller.
> +
> +	  Say Y here to compile support for HCI over Qualcomm IPC into the
> +	  kernel or say M to compile as a module.
> +
>  config BT_QCOMSMD
>  	tristate "Qualcomm SMD based HCI support"
>  	depends on RPMSG || (COMPILE_TEST && RPMSG=n)

...

Sashiko already generated a wall-of-text review but just a few more nits:

> +
> +static int btqcomipc_probe(struct platform_device *pdev)
> +{
> +	struct reset_control *btss_reset;
> +	struct device *dev = &pdev->dev;
> +	struct qcom_btss *desc;
> +	struct hci_dev *hdev;
> +	unsigned int args[2];
> +	struct clk *lpo_clk;
> +	int ret;
> +
> +	desc = devm_kzalloc(dev, sizeof(*desc), GFP_KERNEL);
> +	if (!desc)
> +		return -ENOMEM;
> +
> +	desc->dev = dev;
> +
> +	ret = of_property_read_string(dev->of_node, "firmware-name",
> +				      &desc->firmware);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = btqcomipc_alloc_memory_region(desc);
> +	if (ret)
> +		return ret;
> +
> +	desc->regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
> +							    "qcom,ipc",
> +							    2, args);
> +	if (IS_ERR(desc->regmap))
> +		return PTR_ERR(desc->regmap);
> +
> +	desc->offset = args[0];
> +	desc->bit = args[1];
> +
> +	lpo_clk = devm_clk_get_enabled(dev, "lpo");
> +	if (IS_ERR(lpo_clk))
> +		return dev_err_probe(dev, PTR_ERR(lpo_clk),
> +				     "Failed to get lpo clock\n");
> +
> +	btss_reset = devm_reset_control_get_exclusive_deasserted(dev, NULL);
> +	if (IS_ERR_OR_NULL(btss_reset))
> +		return dev_err_probe(dev, PTR_ERR(btss_reset),
> +				     "unable to deassert reset\n");
> +
> +	desc->irq = platform_get_irq(pdev, 0);
> +	if (desc->irq < 0)
> +		return dev_err_probe(dev, desc->irq, "Failed to acquire IRQ\n");
> +
> +	ret = btqcomipc_init(desc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize\n");
> +
> +	hdev = hci_alloc_dev();
> +	if (!hdev) {
> +		btqcomipc_deinit(desc);
> +		return -ENOMEM;
> +	}
> +
> +	hci_set_drvdata(hdev, desc);
> +	desc->hdev = hdev;
> +	SET_HCIDEV_DEV(hdev, &pdev->dev);
> +	hdev->bus = HCI_IPC;
> +
> +	hdev->open = btqcomipc_open;
> +	hdev->close = btqcomipc_close;
> +	hdev->setup = btqcomipc_setup;
> +	hdev->send = btqcomipc_send;
> +	hdev->flush = btqcomipc_flush;
> +	hdev->set_bdaddr = qca_set_bdaddr;
> +
> +	ret = hci_register_dev(hdev);
> +	if (ret < 0) {
> +		btqcomipc_deinit(desc);
> +		hci_free_dev(hdev);
> +		return dev_err_probe(dev, -EBUSY, "Failed to register hdev\n");
> +	}
> +
> +	platform_set_drvdata(pdev, desc);
> +
> +	return 0;
> +}
> +
> +static void btqcomipc_remove(struct platform_device *pdev)
> +{
> +	struct qcom_btss *desc = platform_get_drvdata(pdev);
> +
> +	if (!desc)
> +		return;

This is only called if probe succeeded so desc can't be NULL.

> +
> +	btqcomipc_deinit(desc);
> +

This is a different ordering of cleanup from the initialization, is this
on purpose?

> +	if (desc->hdev) {
> +		hci_unregister_dev(desc->hdev);
> +		hci_free_dev(desc->hdev);
> +	}
> +}
> +
> +static const struct of_device_id btqcomipc_of_match[] = {
> +	{ .compatible = "qcom,ipq5018-bt" },
> +	{ /* sentinel */},
> +};
> +MODULE_DEVICE_TABLE(of, btqcomipc_of_match);
> +
> +static struct platform_driver btqcomipc_driver = {
> +	.probe = btqcomipc_probe,
> +	.remove = btqcomipc_remove,
> +	.driver = {
> +		.name = "btqcomipc",
> +		.of_match_table = btqcomipc_of_match,
> +	},
> +};
> +
> +module_platform_driver(btqcomipc_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm Bluetooth IPC Driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.53.0
>
>
>

Bart

