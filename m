Return-Path: <linux-arm-msm+bounces-66923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B9BB140AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 18:48:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06D2D7AAF7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 16:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4EC27E04C;
	Mon, 28 Jul 2025 16:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="CJA1sliy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C521277CBF;
	Mon, 28 Jul 2025 16:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753721152; cv=none; b=iy3CfaG5dKxGOtykPSXVyb3kNYYQyEJyQQ2yBf3aG4mPYGJi7WVZZz+JZ1k3y60BtAZG9mLUM+0MPkrM8ZAsPjnGmtf/Q84qLmMuZdVHoufJEbqmdJryCZC7Q6g2AI286toIggKieM+BwYQUG1vHfEqqxh+E9a34DLMELzeM894=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753721152; c=relaxed/simple;
	bh=8epHVsEtMy66kJ6BvBfg+CFKw+2BoQFPwomKVgFujng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ISLeIFrDGFAe6Me+PK+uQUs6p5F6D2xTvofZIQCGpfEUgd1Kdzz/R2VVB+YpSTjYkujRfTd20fndC+S1AmKTGCq94XB0RoZ+NkmML7E/v4FL5fU6TwKdFK+AXoKAOnCysYkOADkXh2Cr0+I3Bl68knG//DDHX+fQHIYsx+fzVng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=CJA1sliy; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1753721140; bh=8epHVsEtMy66kJ6BvBfg+CFKw+2BoQFPwomKVgFujng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CJA1sliyrrFiTr9GssmBOqcLgf84hr557mCiuztkXlfmvj8f0TGwijLnPT5sZl11r
	 EgUXOOCUpYil32H814PyOuYbVyWcUy41PijORFHgV5zvDcbbokhIwhQwxelY9NZHsB
	 /aCdMJHaVwn3QsIU2u0SDwnFUzoUR1CPysanbO2k=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id CFE1B14891BD;
	Mon, 28 Jul 2025 18:45:39 +0200 (CEST)
From: Mihai Moldovan <ionic@ionic.de>
To: linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Denis Kenzior <denkenz@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v4 11/11] net: qrtr: mhi: Report endpoint id in sysfs
Date: Mon, 28 Jul 2025 18:45:28 +0200
Message-ID: <462b6599fc713e8ee0950f08a5a176f12eb74555.1753720935.git.ionic@ionic.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1753720934.git.ionic@ionic.de>
References: <cover.1753720934.git.ionic@ionic.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Kenzior <denkenz@gmail.com>

Add a read-only 'endpoint' sysfs entry that contains the qrtr endpoint
identifier assigned to this mhi device.  Can be used to direct / receive
qrtr traffic only from a particular MHI device.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
Signed-off-by: Mihai Moldovan <ionic@ionic.de>

---

v4:
  - no changes
  - Link to v3: https://msgid.link/e1f5b82cd25b2ac433b1bd7e83e22604e6b24f03.1753313000.git.ionic@ionic.de

v3:
  - rebase against current master
  - Link to v2: https://msgid.link/1a49dec96d5c2c5258c9df935d8c9381793d4ddd.1752947108.git.ionic@ionic.de

v2:
  - rebase against current master
  - use %u formatter instead of %d when printing endpoint id (u32) as
    per review comment
  - Link to v1: https://msgid.link/20241018181842.1368394-11-denkenz@gmail.com
---
 net/qrtr/mhi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 69f53625a049..9a23c888e234 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -72,6 +72,16 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep, struct sk_buff *skb)
 	return rc;
 }
 
+static ssize_t endpoint_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct qrtr_mhi_dev *qdev = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%u\n", qdev->ep.id);
+}
+
+static DEVICE_ATTR_RO(endpoint);
+
 static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 			       const struct mhi_device_id *id)
 {
@@ -91,6 +101,9 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	if (rc)
 		return rc;
 
+	if (device_create_file(&mhi_dev->dev, &dev_attr_endpoint) < 0)
+		dev_err(qdev->dev, "Failed to create endpoint attribute\n");
+
 	/* start channels */
 	rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
 	if (rc) {
@@ -107,6 +120,7 @@ static void qcom_mhi_qrtr_remove(struct mhi_device *mhi_dev)
 {
 	struct qrtr_mhi_dev *qdev = dev_get_drvdata(&mhi_dev->dev);
 
+	device_remove_file(&mhi_dev->dev, &dev_attr_endpoint);
 	qrtr_endpoint_unregister(&qdev->ep);
 	mhi_unprepare_from_transfer(mhi_dev);
 	dev_set_drvdata(&mhi_dev->dev, NULL);
-- 
2.50.0


