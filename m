Return-Path: <linux-arm-msm+bounces-46984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1CBA29C4D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 23:05:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 912041888F7F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 22:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F210E1FECB9;
	Wed,  5 Feb 2025 22:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="iVqlA+1F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0609E1DD526;
	Wed,  5 Feb 2025 22:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738793100; cv=none; b=ou1bnV8beGstrmbgu9WDeJ0GSWzQpaXazKZXv4ymTlUqc58fneOqtKNFOgu0ZTxtTyYPgi4A835AmnHsJcRQdiHCRy7Zpj5E28UH4h/G5ZGVtSFN665E9vEbIIWw1sTyhjqljwmcza0DDFeuJy0SAZku2DUvYpCnB+JrC4yB5Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738793100; c=relaxed/simple;
	bh=yJMg2ZBvwkT3zCgdqcKmlAIgezVEOkoh2lo+NtL4bC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ChfanbknwtAsqDXVHoGBuGYyz/GSzOlLOUAHR/NnxnKz8uTHdqjJKv2/77ezdc864jBBtAV4qkDJd8KS4OKa3NAGUvH5f0J6fBD8qEOFopI4F3OlX+DTxhSV9ogmQYvgfnCC/XGgKuoQQTkjr+h7YGRQGYBlg4/lFe/uL/rXALI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev; spf=pass smtp.mailfrom=oltmanns.dev; dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b=iVqlA+1F; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oltmanns.dev
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4YpDcS2VFtz9tHd;
	Wed,  5 Feb 2025 22:57:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1738792664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UqYbUTh8thO1AlbZZU210FEG8uNuLp5a4wrA84GCEUU=;
	b=iVqlA+1FcQ0qOauiP54x9hx2FgR/4JDjt4pR4+p+zXtb8+1UP/0I9QuCMRG4GnkJ6+i/zU
	s0swWuQaSUkAx1huBElbhzvFjDQEM8vTVj4kDxgxUACqi4J8C29xrdv8+2aefIr8C2bXlk
	xjzUhhJgbFXdb5nDxkK81sNscg13x/t8vik/QCaD4ihEOLOLF2m3U8F0hVJKD+E3r0V7Mm
	yKrndRbj1ghuXDiwYMUA0o2tZeD8xPoGajsTVJZ+O3MS63BJKccyg7H6vnSFWIIbPPJWIV
	H66EAfIVj4amcxRAiSulEq+0vWBVxYsWl94zZpqb8piJVcZisECJdoN2sZBQFg==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Wed, 05 Feb 2025 22:57:11 +0100
Subject: [PATCH] soc: qcom: pd-mapper: defer probing on sdm845
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250205-qcom_pdm_defer-v1-1-a2e9a39ea9b9@oltmanns.dev>
X-B4-Tracking: v=1; b=H4sIALfeo2cC/x3MQQqAIBBA0avErBPUEqmrREg4U81CK4UIpLsnL
 d/i/wKZElOGsSmQ6ObMR6xQbQN+X+JGgrEatNRGamnE5Y/gTgwOaaUkOvRKW4W2xwFqdCZa+fm
 H0/y+HwJiKqBgAAAA
X-Change-ID: 20250205-qcom_pdm_defer-3dc1271d74d9
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Chris Lew <quic_clew@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>, 
 Alexey Minnekhanov <alexeymin@postmarketos.org>, stable@vger.kernel.org, 
 Frank Oltmanns <frank@oltmanns.dev>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4891; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=yJMg2ZBvwkT3zCgdqcKmlAIgezVEOkoh2lo+NtL4bC0=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBno97UhiqS0YfoUn/Md4OCAQxlqZQUxMpJJwzI9
 BYJchr+87eJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZ6Pe1AAKCRCaaaIIlErT
 x6suC/9QFZ2bDJNbCGtWKcq7JLqZaTGViklx9ojelt08o9MrZopv/oEWBbVddXIprhZkAWsCqKJ
 tl28fk+o0+jEMsFR7eTV83MKpec0Njs/W/e9NA0QTbD5wk/NVdbr5QE+notw+cO5B9zFZyhubW2
 U9zuMp4yc+6mraMXoiTUkOJBaOcvfNjUOfOGHSZFTTd0l9UJ44ZF1qefx/8HwE7m1fHB+yhOIqr
 BT0fxz7sxyOx26myEGjFh2dttFsnsCC8Z1jqc0YeVtlTfVOQeObQ2igWV5Yyf81F033YD2DyyEL
 eWvxyrpTu4KPk/045rW7zhAQfMPgsFFDZ5sQprAbnEGbA5+Fnna1TWzelpNpbkHM/HLEsiG5d9+
 x3DIetzaAhMFFv3GNGHCzUmMYbEVXvf7euVomBKnuHV0gfikWbAgoxuoFostaXoQH085I47oFRI
 nxTZfWYi50AjoSaY5IqF5X1Jna12G57pKCdnzajGUz9mzZf8lJjOWeIP0DtV/iQO8BW6k=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
X-Rspamd-Queue-Id: 4YpDcS2VFtz9tHd

On xiaomi-beryllium and oneplus-enchilada audio does not work reliably
with the in-kernel pd-mapper. Deferring the probe solves these issues.
Specifically, audio only works reliably with the in-kernel pd-mapper, if
the probe succeeds when remoteproc3 triggers the first successful probe.
I.e., probes from remoteproc0, 1, and 2 need to be deferred until
remoteproc3 has been probed.

Introduce a device specific quirk that lists the first auxdev for which
the probe must be executed. Until then, defer probes from other auxdevs.

Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
Cc: stable@vger.kernel.org
Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
The in-kernel pd-mapper has been causing audio issues on sdm845
devices (specifically, xiaomi-beryllium and oneplus-enchilada). I
observed that Stephan’s approach [1] - which defers module probing by
blocklisting the module and triggering a later probe - works reliably.

Inspired by this, I experimented with delaying the probe within the
module itself by returning -EPROBE_DEFER in qcom_pdm_probe() until a
certain time (13.9 seconds after boot, based on ktime_get()) had
elapsed. This method also restored audio functionality.

Further logging of auxdev->id in qcom_pdm_probe() led to an interesting
discovery: audio only works reliably with the in-kernel pd-mapper when
the first successful probe is triggered by remoteproc3. In other words,
probes from remoteproc0, 1, and 2 must be deferred until remoteproc3 has
been probed.

To address this, I propose introducing a quirk table (which currently
only contains sdm845) to defer probing until the correct auxiliary
device (remoteproc3) initiates the probe.

I look forward to your feedback.

Thanks,
  Frank

[1]: https://lore.kernel.org/linux-arm-msm/Zwj3jDhc9fRoCCn6@linaro.org/
---
 drivers/soc/qcom/qcom_pd_mapper.c | 43 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 154ca5beb47160cc404a46a27840818fe3187420..34b26df665a888ac4872f56e948e73b561ae3b6b 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -46,6 +46,11 @@ struct qcom_pdm_data {
 	struct list_head services;
 };
 
+struct qcom_pdm_probe_first_dev_quirk {
+	const char *name;
+	u32 id;
+};
+
 static DEFINE_MUTEX(qcom_pdm_mutex); /* protects __qcom_pdm_data */
 static struct qcom_pdm_data *__qcom_pdm_data;
 
@@ -526,6 +531,11 @@ static const struct qcom_pdm_domain_data *x1e80100_domains[] = {
 	NULL,
 };
 
+static const struct qcom_pdm_probe_first_dev_quirk first_dev_remoteproc3 = {
+	.id = 3,
+	.name = "pd-mapper"
+};
+
 static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,apq8016", .data = NULL, },
 	{ .compatible = "qcom,apq8064", .data = NULL, },
@@ -566,6 +576,10 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{},
 };
 
+static const struct of_device_id qcom_pdm_defer[] __maybe_unused = {
+	{ .compatible = "qcom,sdm845", .data = &first_dev_remoteproc3, },
+	{},
+};
 static void qcom_pdm_stop(struct qcom_pdm_data *data)
 {
 	qcom_pdm_free_domains(data);
@@ -637,6 +651,25 @@ static struct qcom_pdm_data *qcom_pdm_start(void)
 	return ERR_PTR(ret);
 }
 
+static bool qcom_pdm_ready(struct auxiliary_device *auxdev)
+{
+	const struct of_device_id *match;
+	struct device_node *root;
+	struct qcom_pdm_probe_first_dev_quirk *first_dev;
+
+	root = of_find_node_by_path("/");
+	if (!root)
+		return true;
+
+	match = of_match_node(qcom_pdm_defer, root);
+	of_node_put(root);
+	if (!match)
+		return true;
+
+	first_dev = (struct qcom_pdm_probe_first_dev_quirk *) match->data;
+	return (auxdev->id == first_dev->id) && !strcmp(auxdev->name, first_dev->name);
+}
+
 static int qcom_pdm_probe(struct auxiliary_device *auxdev,
 			  const struct auxiliary_device_id *id)
 
@@ -647,6 +680,15 @@ static int qcom_pdm_probe(struct auxiliary_device *auxdev,
 	mutex_lock(&qcom_pdm_mutex);
 
 	if (!__qcom_pdm_data) {
+		if (!qcom_pdm_ready(auxdev)) {
+			pr_debug("%s: Deferring probe for device %s (id: %u)\n",
+				__func__, auxdev->name, auxdev->id);
+			ret = -EPROBE_DEFER;
+			goto probe_stop;
+		}
+		pr_debug("%s: Probing for device %s (id: %u), starting pdm\n",
+			__func__, auxdev->name, auxdev->id);
+
 		data = qcom_pdm_start();
 
 		if (IS_ERR(data))
@@ -659,6 +701,7 @@ static int qcom_pdm_probe(struct auxiliary_device *auxdev,
 
 	auxiliary_set_drvdata(auxdev, __qcom_pdm_data);
 
+probe_stop:
 	mutex_unlock(&qcom_pdm_mutex);
 
 	return ret;

---
base-commit: 7f048b202333b967782a98aa21bb3354dc379bbf
change-id: 20250205-qcom_pdm_defer-3dc1271d74d9

Best regards,
-- 
Frank Oltmanns <frank@oltmanns.dev>


