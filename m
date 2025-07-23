Return-Path: <linux-arm-msm+bounces-66406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C59B0FD83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 01:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE8F71CC458E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 23:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C36B283FFB;
	Wed, 23 Jul 2025 23:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="asNtp+zS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113B7278173;
	Wed, 23 Jul 2025 23:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753313082; cv=none; b=jL0DvsV+MBHwL/IEyOSBtQuffXSvT0yoYbZjJ8PUSoj+AYvqGPK85PY0wq+kO686x56qHVwv1QeeYkx3zbXK+sqkHyGC+skL+Rb2sgDwLnSbS+FdkKKrckFcW2r2w9rDWKECUy/o9iIiaAWpQdmyp82pxUbNV/aPEeR+kRztX/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753313082; c=relaxed/simple;
	bh=Ql4FgtdyxHPpEsyPALfJwfRxgETxiGZtEAUk0DPXDj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YSZk8XgxOIlRql5b88wjLr9RGprR5lt1KNcfFEm7NQfUflgbWDpLsgpFr20P5reoHVIuCseQcFonVrGt9zv8yfUx3s4q7EqgnKCpfF0KdDB/j0MLsn9QCluKvEI4yqJ7kfJhxsxeJL++73qt0b6MGI3+JgmgesGIlcnkVvYoyfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=asNtp+zS; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1753313067; bh=Ql4FgtdyxHPpEsyPALfJwfRxgETxiGZtEAUk0DPXDj8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=asNtp+zSVqpyog8Xkbsn3zVu8DE98CmR4Qd1b4odWH6lNXSuK5mzyHNmdXBLC07pW
	 1o1JSORptgH1X6oyz3c6PxFhIq0HSNxb9KZ1SvcaGRsRI24XXcriEgYzOrI1F+Yjt1
	 NNyD2HyfBJJ46fGp256jOpL0PICjtKe3uzNQqFtg=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 8E5E2148A06E;
	Thu, 24 Jul 2025 01:24:27 +0200 (CEST)
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
Subject: [PATCH v3 11/11] net: qrtr: mhi: Report endpoint id in sysfs
Date: Thu, 24 Jul 2025 01:24:08 +0200
Message-ID: <e1f5b82cd25b2ac433b1bd7e83e22604e6b24f03.1753313000.git.ionic@ionic.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1753312999.git.ionic@ionic.de>
References: <cover.1753312999.git.ionic@ionic.de>
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


