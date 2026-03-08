Return-Path: <linux-arm-msm+bounces-96091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBhWA4sErmlq+wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 00:21:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 703C2232A6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 00:21:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFCC9301053D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 23:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1560B1862;
	Sun,  8 Mar 2026 23:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="oeFBkwoh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928F535A38B;
	Sun,  8 Mar 2026 23:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773012044; cv=none; b=LelPM8v/8AaV7mo2wyFzf0dKROq3KtCutDXecbDLyyaOYtvMsduzD2qBjVYgFkSf045Y1UG1R7EKWIBqNAudr8c+E6gKhDYpQvlATG5ab/L6stRoj1rfwR5W+/025D5D5PUZpJM8CsC49ruPSBnFNxW6YKFbu2hRDpnZApNWhcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773012044; c=relaxed/simple;
	bh=RgJOa6yfBGNiuGxmhUx322FszEHIkBe5nei3mIBdkcU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qoA3hmnOY5grIqLOUhFwQqC05MDFuFSdcqC/oTOsyb/6KBh6NajfInH/yVHbhwgrVB6Zra36DHOoJbArei5oUywuGkoqqQ4QVX27xo/M+wOV3DQmChZMmgzQZ01cmBz9s6Eg9/t2QojKvwKi/DkTTZHJr2lXOGDmgzGByiwotWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=oeFBkwoh; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773012040; x=1773271240;
	bh=E7aiP89oHRHkEkAMRjtP39QQVm2BmjvpXh/hYVnCB7M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=oeFBkwohkQAheIMz+n0M+NKgnLQ2+0yKiamkEtI8nllzYCwNY/TXxqo+aUlFmES+g
	 tkgxxFAjWm4Njol8VaLe9/PREt1KhJO+KmSKYM2vTTPEUyjVivJZHv1vMASJHBZBWF
	 quyi6Uo1+DXClQtzVqM0JefXSv53qgQgAl+GcnyraXAizt4zoo1F9cTb00vQGg2kTP
	 YmeH1/cKOuLaAGKjfH6ihA8Nf2ktBU1joo+i8kVSeVhyfM5ap6+8pWvgzsLo8AUN6d
	 VvGT8Nu/tnrXKSdsGmyHp2cveuN2HOrH6BoG1Gm4Wed8qlwtT8z8ziiNXA1+nhpB6C
	 0Dxl8V+YFLWng==
Date: Sun, 08 Mar 2026 23:20:35 +0000
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH RFC 2/2] usb: typec: qcom: Add support for shared USBIN VBUS detection
Message-ID: <20260308-qcom-typec-shared-vbus-v1-2-7d574b91052a@pm.me>
In-Reply-To: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me>
References: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: c1613f5bba6ccfb0859cd0880c9eeda82a1dd53e
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 703C2232A6A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96091-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[AKoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Action: no action

On devices with multiple USB-C ports whose VBUS lines are wired to a
single shared USBIN input on the PM8150B PMIC (e.g. ASUS ROG Phone 3), the
Type-C port controller cannot distinguish which port is providing VBUS.

In practice this shows up as being unable to use the affected Type-C port
while the other port is connected to a device providing VBUS such as a PC
or charger.

Add support for an optional vbus-detect-gpios property that allows the
Type-C port controller to read VBUS state from a per-port GPIO instead of
the shared USBIN input. When present, the driver also bypasses VSAFE0V
checks and switches DRP toggling to TRY_SRC to avoid false source
detection caused by VBUS present on USBIN from another port.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 46 ++++++++++++++++++=
+++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/u=
sb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index 8051eaa46991..c338e26651b0 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -5,6 +5,7 @@
=20
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
@@ -176,6 +177,8 @@ struct pmic_typec_port {
 =09bool=09=09=09=09vbus_enabled;
 =09struct mutex=09=09=09vbus_lock;=09=09/* VBUS state serialization */
=20
+=09struct gpio_desc=09=09*vbus_detect_gpio;
+
 =09int=09=09=09=09cc;
 =09bool=09=09=09=09debouncing_cc;
 =09struct delayed_work=09=09cc_debounce_dwork;
@@ -277,7 +280,12 @@ static int qcom_pmic_typec_port_vbus_detect(struct pmi=
c_typec_port *pmic_typec_p
 {
 =09struct device *dev =3D pmic_typec_port->dev;
 =09unsigned int misc;
-=09int ret;
+=09int ret, vbus;
+
+=09if (pmic_typec_port->vbus_detect_gpio) {
+=09=09vbus =3D gpiod_get_value_cansleep(pmic_typec_port->vbus_detect_gpio)=
;
+=09=09return vbus;
+=09}
=20
 =09ret =3D regmap_read(pmic_typec_port->regmap,
 =09=09=09  pmic_typec_port->base + TYPEC_MISC_STATUS_REG,
@@ -307,6 +315,13 @@ static int qcom_pmic_typec_port_vbus_toggle(struct pmi=
c_typec_port *pmic_typec_p
 =09=09if (ret)
 =09=09=09return ret;
=20
+=09=09/*
+=09=09 * On devices with multiple ports sharing USBIN, VBUS from another
+=09=09 * port prevents VSAFE0V from being reached.
+=09=09 */
+=09=09if (pmic_typec_port->vbus_detect_gpio)
+=09=09=09return 0;
+
 =09=09val =3D TYPEC_SM_VBUS_VSAFE0V;
 =09}
=20
@@ -589,7 +604,14 @@ static int qcom_pmic_typec_port_start_toggling(struct =
tcpc_dev *tcpc,
 =09=09mode =3D EN_SNK_ONLY;
 =09=09break;
 =09case TYPEC_PORT_DRP:
-=09=09mode =3D EN_TRY_SNK;
+=09=09/*
+=09=09 * VBUS from another port makes EN_TRY_SNK falsely detect
+=09=09 * a source. Start as Rp to reliably find sinks.
+=09=09 */
+=09=09if (pmic_typec_port->vbus_detect_gpio)
+=09=09=09mode =3D EN_TRY_SRC;
+=09=09else
+=09=09=09mode =3D EN_TRY_SNK;
 =09=09break;
 =09}
=20
@@ -677,6 +699,20 @@ static int qcom_pmic_typec_port_start(struct pmic_type=
c *tcpm,
 =09if (ret)
 =09=09goto done;
=20
+=09/*
+=09 * On devices with multiple USB-C ports sharing USBIN, bypass
+=09 * VSAFE0V so SRC attachment can complete despite VBUS being
+=09 * present on USBIN from another port.
+=09 */
+=09if (pmic_typec_port->vbus_detect_gpio) {
+=09=09ret =3D regmap_update_bits(pmic_typec_port->regmap,
+=09=09=09=09=09 pmic_typec_port->base + TYPEC_EXIT_STATE_CFG_REG,
+=09=09=09=09=09 BYPASS_VSAFE0V_DURING_ROLE_SWAP,
+=09=09=09=09=09 BYPASS_VSAFE0V_DURING_ROLE_SWAP);
+=09=09if (ret)
+=09=09=09goto done;
+=09}
+
 =09pmic_typec_port->tcpm_port =3D tcpm_port;
=20
 =09for (i =3D 0; i < pmic_typec_port->nr_irqs; i++)
@@ -724,6 +760,12 @@ int qcom_pmic_typec_port_probe(struct platform_device =
*pdev,
 =09if (IS_ERR(pmic_typec_port->vdd_vbus))
 =09=09return PTR_ERR(pmic_typec_port->vdd_vbus);
=20
+=09pmic_typec_port->vbus_detect_gpio =3D devm_gpiod_get_optional(dev, "vbu=
s-detect",
+=09=09=09=09=09=09=09=09 GPIOD_IN);
+=09if (IS_ERR(pmic_typec_port->vbus_detect_gpio))
+=09=09return dev_err_probe(dev, PTR_ERR(pmic_typec_port->vbus_detect_gpio)=
,
+=09=09=09=09     "failed to get vbus-detect GPIO\n");
+
 =09pmic_typec_port->dev =3D dev;
 =09pmic_typec_port->base =3D base;
 =09pmic_typec_port->regmap =3D regmap;

--=20
2.53.0



