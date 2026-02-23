Return-Path: <linux-arm-msm+bounces-93601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENjeH7QJnGn8/AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:03:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E71FD172E02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C16E3301629F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 08:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC58134CFBB;
	Mon, 23 Feb 2026 08:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MN8TSthO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93028349AF6;
	Mon, 23 Feb 2026 08:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771833776; cv=none; b=XemAyukM4d8B/cs2HlFHSdu67wqLzGN3W0tNCTuEYyhHuEgLD/r5dNsiFwappMFOzUh9vJUHRqHiGnby0T7LC86n5YcdFHmKx+AqOX/yfl+pr1nkP4+NadWlM6tEywkVwMXQ9GvLm2oYF+BQtxtsCrMk/y0qhRDrSjESNi4uYaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771833776; c=relaxed/simple;
	bh=W90Ne2etUTbqI+qSxWnd/b1UbZmAjzL8o45ZvbcD5QQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T6JG+BhMOWTJ4sP6MBC0stSTXuaq/s+Etb3qZcAVVNegRgGMrNQneSC6CjGc1+yop7/ufqcJeJe1HzyAmYUQ2KTIbPqV3f/GQidSAu+h2d3LeKBmU+VWY9XmOf0yRUkUPtZJt2T45rJ5zwgu+dRExCltC9+43VgNw0Y7akwM32I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MN8TSthO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55760C19421;
	Mon, 23 Feb 2026 08:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771833776;
	bh=W90Ne2etUTbqI+qSxWnd/b1UbZmAjzL8o45ZvbcD5QQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MN8TSthO1vN+1WzfS0J2r87WlpZYXXbYp7aw3IxUDgrXKOc/VqPasklUey+cpCIRi
	 Yd4eLDHC56y4DgxoBpjY4cq+W4s1D4CA+U9SNolgHukRGTdhAwy96TsGOo2trVfUdW
	 h7MF1LmgPqaHOrqeAKjNurG3O5urOnP+Y2FjL/tGs84vug+WBtfN2C0XVx1OZ9aPAP
	 dvjCSeF/DpOKxM2+cOGBWWSpRroFNa5Sy3cK1VKiypkfY5k9N3dyFk1YN5AlnzYFto
	 DqvrQAGQgjnd4eB8BKsrWcg6vdVjd6wa47YC2gPGlMmGMHHDG0UNyeih9BMHGI1ex/
	 pqld/8anU4kDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 418A3E98DFC;
	Mon, 23 Feb 2026 08:02:56 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 23 Feb 2026 13:32:52 +0530
Subject: [PATCH v3 1/4] soc: qcom: ice: Fix race between qcom_ice_probe()
 and of_qcom_ice_get()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-qcom-ice-fix-v3-1-6ca5846329f7@oss.qualcomm.com>
References: <20260223-qcom-ice-fix-v3-0-6ca5846329f7@oss.qualcomm.com>
In-Reply-To: <20260223-qcom-ice-fix-v3-0-6ca5846329f7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Abel Vesa <abelvesa@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>, mani@kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4411;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=TpQjQh0YL/KxaPzHttAt0v5EwEXDrjcHE26RHpIWR1Q=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpnAmt+OqW5W1ojr/CHa44/Y3EkWD75xwuAoD55
 l1O/+nAhTCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaZwJrQAKCRBVnxHm/pHO
 9WsdB/47B6A4ppKmOIhFjWRIbNVMqY5407U61QnPN4p0d2kx4gyXSF0aSz/qcKyeu9dE4RPFGc/
 l4rlkkDqG/ry2+phiFxz+r85quTl+7U6sxXyiis4JIMaFUqHJpDxf92E5NpHGRaQGcH23L4VJTL
 H61CeOiNKZwcACUDGYl/qfPYhXE6PFmm9d5tdBtyRMqkMKD/+R1IUNLrfmIOzQvvKm7qBSmrWas
 f42QoOGcIM31oY+HaXxZF2reXLrGIITebMsS7lVkMclsqNRS5RTELVGyMO3/RSRy5IHri0JYDtS
 AVVUa0XWgNLCa3cs7zUioSPdWcZQf+Xi3CbGMo9ZgmYwQNme
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93601-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Queue-Id: E71FD172E02
X-Rspamd-Action: no action

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The current platform driver design causes probe ordering races with
consumers (UFS, eMMC) due to ICE's dependency on SCM firmware calls. If ICE
probe fails (missing ICE SCM or DT registers), devm_of_qcom_ice_get() loops
with -EPROBE_DEFER, leaving consumers non-functional even when ICE should
be gracefully disabled. devm_of_qcom_ice_get() doesn't know if the ICE
driver probe has failed due to above reasons or it is waiting for the SCM
driver.

Moreover, there is no devlink dependency between ICE and consumer drivers
as 'qcom,ice' is not considered as a DT 'supplier'. So the consumer drivers
have no idea of when the ICE driver is going to probe.

To address these issues, introduce a global ice_handle to store the valid
ICE handle pointer, and set during successful ICE driver probe. On probe
failure, set it to an error pointer and propagate the error from
of_qcom_ice_get().

Additionally, add a global ice_mutex to synchronize qcom_ice_probe() and
of_qcom_ice_get().

Note that this change only fixes the standalone ICE DT node bindings and
not the ones with 'ice' range embedded in the consumer nodes, where there
is no issue.

Cc: <stable@vger.kernel.org> # 6.4
Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 44 +++++++++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index b203bc685cad..3c3c189e24f9 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -113,6 +113,9 @@ struct qcom_ice {
 	u8 hwkm_version;
 };
 
+static DEFINE_MUTEX(ice_mutex);
+static struct qcom_ice *ice_handle;
+
 static bool qcom_ice_check_supported(struct qcom_ice *ice)
 {
 	u32 regval = qcom_ice_readl(ice, QCOM_ICE_REG_VERSION);
@@ -608,7 +611,6 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct qcom_ice *ice;
 	struct resource *res;
 	void __iomem *base;
 	struct device_link *link;
@@ -631,6 +633,22 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 		return qcom_ice_create(&pdev->dev, base);
 	}
 
+	guard(mutex)(&ice_mutex);
+
+	/*
+	 * If ice_handle is NULL, then it means the ICE driver is not probed
+	 * yet. So return -EPROBE_DEFER to let the client try later.
+	 */
+	if (!ice_handle)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	/*
+	 * If ice_handle has error code, then it means the ICE driver has probe
+	 * failed. So return the handle for the client to digest it.
+	 */
+	if (IS_ERR(ice_handle))
+		return ice_handle;
+
 	/*
 	 * If the consumer node does not provider an 'ice' reg range
 	 * (legacy DT binding), then it must at least provide a phandle
@@ -647,24 +665,16 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	ice = platform_get_drvdata(pdev);
-	if (!ice) {
-		dev_err(dev, "Cannot get ice instance from %s\n",
-			dev_name(&pdev->dev));
-		platform_device_put(pdev);
-		return ERR_PTR(-EPROBE_DEFER);
-	}
-
 	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
 	if (!link) {
 		dev_err(&pdev->dev,
 			"Failed to create device link to consumer %s\n",
 			dev_name(dev));
 		platform_device_put(pdev);
-		ice = ERR_PTR(-EINVAL);
+		return ERR_PTR(-EINVAL);
 	}
 
-	return ice;
+	return ice_handle;
 }
 
 static void qcom_ice_put(const struct qcom_ice *ice)
@@ -716,20 +726,20 @@ EXPORT_SYMBOL_GPL(devm_of_qcom_ice_get);
 
 static int qcom_ice_probe(struct platform_device *pdev)
 {
-	struct qcom_ice *engine;
 	void __iomem *base;
 
+	guard(mutex)(&ice_mutex);
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		dev_warn(&pdev->dev, "ICE registers not found\n");
+		ice_handle = base;
 		return PTR_ERR(base);
 	}
 
-	engine = qcom_ice_create(&pdev->dev, base);
-	if (IS_ERR(engine))
-		return PTR_ERR(engine);
-
-	platform_set_drvdata(pdev, engine);
+	ice_handle = qcom_ice_create(&pdev->dev, base);
+	if (IS_ERR(ice_handle))
+		return PTR_ERR(ice_handle);
 
 	return 0;
 }

-- 
2.51.0



