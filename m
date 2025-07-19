Return-Path: <linux-arm-msm+bounces-65753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B786B0B19B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 21:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 016143BFDD3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 19:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC7028B7FD;
	Sat, 19 Jul 2025 18:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="WspLDH8S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA9E28983A;
	Sat, 19 Jul 2025 18:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752951587; cv=none; b=FxHFAtXKtcxZNbKmsTgMkH4INWsf+WkojW0POJAjo3+xLkI14CGzR0nxYi7me8SnNJBe9TWNRMzWgFEew5KUUpkoDrMYc3cY5p7//0qACHS2aqfsQuLcBI6PYB06jRNklSEgomlc1fn8gYl03jTZxQX4ifEejTOtp45YqBruRvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752951587; c=relaxed/simple;
	bh=zBfaiZsRaBX1mtg6/PbLsiFZPxTKFf0eWcU8N5i1va8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BTNcywtNYfZpLQCTPoc9eYiv9GGVUpSKV4jVJD4z683og2rx6/YmQUzUS1OqhWbZTsTNyqnrqzLnswHrVnG5en5EDAp8YOJqSS9qzsZMnGVBAyDQUIUcRrCAmvuYJYfquCJxV+Bh0ds46BkfVg26w34LbUb3D0soKombS/4Hhg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=WspLDH8S; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1752951579; bh=zBfaiZsRaBX1mtg6/PbLsiFZPxTKFf0eWcU8N5i1va8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WspLDH8SSU2tVrQQEDz7/WV1OTAC6k6rAZzUXRjWnsjUoMRSuDQmN3PRXdfYphU/g
	 XBXo93oOlq3D7gFkYdEItvu6ms3OgJC7qga5hcU7wKLQPMJyoQ14mMBKYJViFPHJbo
	 rHPpk1xnDTuvD79bBVgD+UHtrniu/hAdXOZ24Nyk=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 322C3148A06A;
	Sat, 19 Jul 2025 20:59:39 +0200 (CEST)
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
Subject: [PATCH v2 10/10] net: qrtr: mhi: Report endpoint id in sysfs
Date: Sat, 19 Jul 2025 20:59:30 +0200
Message-ID: <1a49dec96d5c2c5258c9df935d8c9381793d4ddd.1752947108.git.ionic@ionic.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1752947108.git.ionic@ionic.de>
References: <cover.1752947108.git.ionic@ionic.de>
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

v2:
  - rebase against current master
  - use %u formatter instead of %d when printing endpoint id (u32) as
    per review comment
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


