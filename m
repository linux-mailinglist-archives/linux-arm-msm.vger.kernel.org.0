Return-Path: <linux-arm-msm+bounces-85943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD65CD122E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9522830A4207
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 17:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10E833C52A;
	Fri, 19 Dec 2025 17:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SFZxQ7/O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D0B33C1B7
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 17:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766164984; cv=none; b=nmo6y52QoL/KtDRJ1rlUjKomJr511sWFlISK9mwOtSRXiDVDQAQNuc+yIIFmDS39FGiGytykSxF40AeLtiAuTyo74mEA7yXX2unQDtjISK/WxmG2U7rVKL/PxaJ26N/OImpVqkaDMzI5YKc3Z5iw0Olr3yEcqy7xN2f4bBEHt0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766164984; c=relaxed/simple;
	bh=rqWrSMew6XyEzaPTznoF4DcdhsODTjm9f+jrUcnb+fU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BSx2SZWCW7c7coIpeJE3TYoZMJahOOCciCgpVqlhcs1mmfn8BGKjfQGbIni+SyWWj2O9dV75nA5R4IfvlGz/H+tUrcgqok+VezdptH/MszDU7B22JasCbOVTRhZTXl5KnUZvgY30qndbK9aTTdzUPiUmvSALNKWUWRa7h0KmyM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SFZxQ7/O; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766164963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NLv+6Y1jID9UqiQBaxZlHhtwEVIiDEDZIj1f/I2KpDo=;
	b=SFZxQ7/O9zmfmzbn8w1Af2UedAsTgWDT+fYupnVWzl2dNEwZNoEVD+3c4j4mkOG5OxBbSX
	toDBX+LNwNLSy0sTDm/rQf6r9WDsg4WLXGsujgYlPU0GBouDjJSLmOdmQ91pnm4INubqMN
	Sx7nADaWl1Tz2yf+Lp3zocyAUaJgeUA=
From: Sean Anderson <sean.anderson@linux.dev>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pci@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Brian Norris <briannorris@chromium.org>,
	Niklas Cassel <cassel@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Alex Elder <elder@riscstar.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 1/3] PCI/pwrctrl: Bind a pwrctrl device if clocks are present
Date: Fri, 19 Dec 2025 12:22:20 -0500
Message-Id: <20251219172222.2808195-1-sean.anderson@linux.dev>
In-Reply-To: <39e025bd-50f4-407d-8fd4-e254dbed46b2@linux.dev>
References: <39e025bd-50f4-407d-8fd4-e254dbed46b2@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Since commit 66db1d3cbdb0 ("PCI/pwrctrl: Add optional slot clock for PCI
slots"), power supplies are not the only resource PCI slots may create.
Also create a pwrctrl device if there are any clocks.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/pci/of.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 3579265f1198..07546a16ac86 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -847,7 +847,7 @@ void of_pci_make_host_bridge_node(struct pci_host_bridge *bridge)
  * @np: Device tree node
  *
  * Check if the power supply for the PCI device is present in the device tree
- * node or not.
+ * node or not. Clocks may also create a device.
  *
  * Return: true if at least one power supply exists; false otherwise.
  */
@@ -860,6 +860,9 @@ bool of_pci_supply_present(struct device_node *np)
 		return false;
 
 	for_each_property_of_node(np, prop) {
+		if (!strcmp(prop->name, "clocks"))
+			return true;
+
 		supply = strrchr(prop->name, '-');
 		if (supply && !strcmp(supply, "-supply"))
 			return true;
-- 
2.35.1.1320.gc452695387.dirty


