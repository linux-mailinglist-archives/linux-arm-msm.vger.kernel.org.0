Return-Path: <linux-arm-msm+bounces-97133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEUkAOdasmngLwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 07:19:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E9F26D90E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 07:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 578CC304C953
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 06:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB2933D503;
	Thu, 12 Mar 2026 06:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="oP7xL2nA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BC21C3BFC
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773296233; cv=none; b=vDXauX4C74kgXN81ATYsMB/0Mbj3zURQkp6tp41pmDqt4hclAiUNTvRlSdJ/KChQCOaDIgW35PhndGvENDEMGBP1rowr3OK2i3uv4JQvo5fHIelor89pc12w8Ic1SmSeIZCHp0pFeAq1jZ/5bKu5NdOfrF0oeRssCfBW9HeojD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773296233; c=relaxed/simple;
	bh=RwETkPauWLPu8/cpRZEAFRTB7migRPlSchRkeRn0J1o=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FxiD4pKA6s1l+bMFgbitvWDB1tskTJSzwkpgQFdnr153wGfdWSgCpqu/ndjbP4J8VlqYsXmqF5C1afGsigJz4B5xfT5OS+mlQLsa1Zz8yS7lS4G8lDgcyXUkrO+JYRflcILMnJgiE/HFtLK72BNNGAKl8Pyk5ixTQuqLrJh6PK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=oP7xL2nA; arc=none smtp.client-ip=109.224.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773296222; x=1773555422;
	bh=3wBo0UCe9WJRN1U7aQiitye13RIjQxmKywtDbgS4TT8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=oP7xL2nA9DjztUMjAe5dQhSwuSorXZvftpvnowLANdn0k5It5BCi7s0Vbp706FXf6
	 j/o8gsCJkJ1QMRb8DD5Iy8O651Mn0KBy1tomUH1hDXWug3IABG0XYZsw0fJXl//e1H
	 1Q5uFb6DudQlO00/DBHWKFunpNO8HoMZVU6A7cao/oUtYKNZKqK6FGEAo3hPjYHzcm
	 PKzHyV0uYCxRCJQv5FelDRp9RdrqydJRJStXGLmJmfmPvUvUBLTRy7sIbRk7LoqLU7
	 TUdKg8p3iiUhsRlNfg17a/jqOMg8oUJgBoYS3YB3NM9ZkjsbYf+24ppogYne80cIa7
	 9UJPjZIUa1yew==
Date: Thu, 12 Mar 2026 06:16:58 +0000
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2] usb: typec: qcom: Add support for per port VBUS detection
Message-ID: <20260312-qcom-typec-shared-vbus-v2-1-99ed9e500947@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 96e83a83952ba69daff8dce48679cbb1f8b710d6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97133-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: 68E9F26D90E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is required for devices (e.g. ASUS ROG Phone 3) where more than
one USB port can act as a sink and both share a single USBIN input on
the PMIC.

Because the PM8150B uses USBIN to determine VBUS presence, a charger
connected to one port causes the PMIC to falsely detect VBUS on the
other port, preventing it from entering source mode.

For example, plugging a charger into one port prevents using the other
port for a flash drive.

Fix this by adding support for the vbus-gpios connector binding so the
driver can use an external GPIO for per-port VBUS presence detection
instead of the shared USBIN register.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v2:
- Dropped RFC prefix
- Remove redundant vbus-detect-gpios, instead use existing vbus-gpios from =
usb-connector (Dmitry)
- Updated cover to better describe scenario where this change is relevant
- Update comment for EN_TRY_SRC to make more sense
- Skip vSafe5V poll too not just vSafe0V
- return gpiod_get_value_cansleep (Konrad)
- regmap_update_bits -> regmap_set_bits (Konrad)
- Get vbus-gpios per connector (Konrad)
- Add bracket to if (IS_ERR(pmic_typec_port->vbus_detect_gpio)) (Bryan)
- Link to v1: https://lore.kernel.org/r/20260308-qcom-typec-shared-vbus-v1-=
0-7d574b91052a@pm.me
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 53 ++++++++++++++++++=
+++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/u=
sb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index 8051eaa46991..a8f6687a3522 100644
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
@@ -279,6 +282,9 @@ static int qcom_pmic_typec_port_vbus_detect(struct pmic=
_typec_port *pmic_typec_p
 =09unsigned int misc;
 =09int ret;
=20
+=09if (pmic_typec_port->vbus_detect_gpio)
+=09=09return gpiod_get_value_cansleep(pmic_typec_port->vbus_detect_gpio);
+
 =09ret =3D regmap_read(pmic_typec_port->regmap,
 =09=09=09  pmic_typec_port->base + TYPEC_MISC_STATUS_REG,
 =09=09=09  &misc);
@@ -310,6 +316,13 @@ static int qcom_pmic_typec_port_vbus_toggle(struct pmi=
c_typec_port *pmic_typec_p
 =09=09val =3D TYPEC_SM_VBUS_VSAFE0V;
 =09}
=20
+=09/*
+=09 * On devices with multiple ports sharing USBIN, VBUS from another
+=09 * port makes the USBIN-based vsafe polls unreliable.
+=09 */
+=09if (pmic_typec_port->vbus_detect_gpio)
+=09=09return 0;
+
 =09/* Poll waiting for transition to required vSafe5V or vSafe0V */
 =09ret =3D regmap_read_poll_timeout(pmic_typec_port->regmap,
 =09=09=09=09       pmic_typec_port->base + TYPEC_SM_STATUS_REG,
@@ -589,7 +602,15 @@ static int qcom_pmic_typec_port_start_toggling(struct =
tcpc_dev *tcpc,
 =09=09mode =3D EN_SNK_ONLY;
 =09=09break;
 =09case TYPEC_PORT_DRP:
-=09=09mode =3D EN_TRY_SNK;
+=09=09/*
+=09=09 * With VBUS present on USBIN from another port, EN_TRY_SNK
+=09=09 * keeps the port in sink mode. Use EN_TRY_SRC so the port
+=09=09 * tries to source first.
+=09=09 */
+=09=09if (pmic_typec_port->vbus_detect_gpio)
+=09=09=09mode =3D EN_TRY_SRC;
+=09=09else
+=09=09=09mode =3D EN_TRY_SNK;
 =09=09break;
 =09}
=20
@@ -677,6 +698,19 @@ static int qcom_pmic_typec_port_start(struct pmic_type=
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
+=09=09ret =3D regmap_set_bits(pmic_typec_port->regmap,
+=09=09=09=09     pmic_typec_port->base + TYPEC_EXIT_STATE_CFG_REG,
+=09=09=09=09     BYPASS_VSAFE0V_DURING_ROLE_SWAP);
+=09=09if (ret)
+=09=09=09goto done;
+=09}
+
 =09pmic_typec_port->tcpm_port =3D tcpm_port;
=20
 =09for (i =3D 0; i < pmic_typec_port->nr_irqs; i++)
@@ -704,6 +738,7 @@ int qcom_pmic_typec_port_probe(struct platform_device *=
pdev,
 =09struct device *dev =3D &pdev->dev;
 =09struct pmic_typec_port_irq_data *irq_data;
 =09struct pmic_typec_port *pmic_typec_port;
+=09struct fwnode_handle *connector;
 =09int i, ret, irq;
=20
 =09pmic_typec_port =3D devm_kzalloc(dev, sizeof(*pmic_typec_port), GFP_KER=
NEL);
@@ -724,6 +759,22 @@ int qcom_pmic_typec_port_probe(struct platform_device =
*pdev,
 =09if (IS_ERR(pmic_typec_port->vdd_vbus))
 =09=09return PTR_ERR(pmic_typec_port->vdd_vbus);
=20
+=09connector =3D device_get_named_child_node(dev, "connector");
+=09if (connector) {
+=09=09pmic_typec_port->vbus_detect_gpio =3D
+=09=09=09devm_fwnode_gpiod_get(dev, connector, "vbus",
+=09=09=09=09=09      GPIOD_IN, NULL);
+=09=09fwnode_handle_put(connector);
+
+=09=09if (IS_ERR(pmic_typec_port->vbus_detect_gpio)) {
+=09=09=09ret =3D PTR_ERR(pmic_typec_port->vbus_detect_gpio);
+=09=09=09pmic_typec_port->vbus_detect_gpio =3D NULL;
+=09=09=09if (ret !=3D -ENOENT)
+=09=09=09=09return dev_err_probe(dev, ret,
+=09=09=09=09=09=09     "failed to get vbus GPIO\n");
+=09=09}
+=09}
+
 =09pmic_typec_port->dev =3D dev;
 =09pmic_typec_port->base =3D base;
 =09pmic_typec_port->regmap =3D regmap;

---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260308-qcom-typec-shared-vbus-7d37c6b2d155

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



