Return-Path: <linux-arm-msm+bounces-101397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GWHIwyXzWkffQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 00:07:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08072380D33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 00:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C63B6302FE8E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 22:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C7C317159;
	Wed,  1 Apr 2026 22:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SD09SWne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE38E31A56D
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 22:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775081224; cv=none; b=VIFrDwoPPXdWZf9SAqGOJ27XLNmpIZasxyOPgWVDtZqIrUyI6XooPghGihudMFOwLYV4IeNy31gTuIbudSNOM19KSmkmG3ryIEL/VcxS597LKr1mVDUIX0C3v8xUyN/UvbFYY8KXR90n5ZJmS+amxGqlVuuo54zyrSeoFKmxLgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775081224; c=relaxed/simple;
	bh=4isAXu8GsEMTQ84+cb9goVx2QJXHy/pHRFXm2xfgkYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gqCOv6Iu2uZv7mjg4lYn7P2Nmo5Lq42r67KVkkcWgQC8ghkfPKs1rFkn05iEboY7JAjI6J14iq95O0CvD2aipQ0ahr6sLRnFiKELy47ooN63T2atyjxzxidc6e539pQR/Y28crY0ltnj0sVAdE+pd64B5vTmlBce1vc555bvEug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SD09SWne; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-128b9b7e3edso790662c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 15:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775081222; x=1775686022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rRronI06lIok0fDejOYVVuN665UjtkDK5qK1tzC967Q=;
        b=SD09SWneYcrJ80k1idCFzG/Vv270DRTdPP37rUKtxF1VlkSMLQF/LyCpCMWl292W3T
         ySXAmkqJx03qZ0jvZdays/2WxgWIRwekCqS18dBOZIslhz8gSgcgm5CrdIwvYrU79XFQ
         xDweVnVdjuMmpsZqVe68hdq9LWo1hxhxaURE/TuWuiUNwGDI2k+S9fSj3TcgToGu9a6y
         2HWeWGnqe2BUXAef7Rw88sSG+/hW81Bjvs0Lkiq4Lr+1xokxdiHqImsWL6wpJ/hq+Avr
         A1ieubT1sgQuujNXBBmSkG2m1YDuiWKpArK+aBfYVCw+Xx6vawmmHQAxy75etWWE3jMn
         iuzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775081222; x=1775686022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRronI06lIok0fDejOYVVuN665UjtkDK5qK1tzC967Q=;
        b=ZM+7vOdYtJmHefgDH26gaTjO/7PW5a0EvNeLJn/ocBs0bs195wsffVHgz5ZwHc6AN/
         FbsnbiECorSeQYdT7wrWkDX0FO93h4dlLq7sSO+wB18B7TZLDzmpJ7tDH1EMZVVxyrh+
         8Lq+TbqY1k+wFwWyLyO9q9F19ErL4X5eWI30ICfEou1z7L10IXQt38ZcqI5nMwbfOXRy
         HX1yz+4ZogY1ukpY59gjX8D9zZe6LC7uqUMH2kL9i6ora8F7nNLDfpW7K/DrUhijVmW9
         yl9STHmxOL5jEZyqGujxezfNeLzSWszoXKyArOLAlDHMDLFhVqA8aJZ+bmszvYInjhC5
         F6AQ==
X-Gm-Message-State: AOJu0YzYgTIvs9SVdzsbxnfzpA7AJ46KpAS8k4BEyCrkmL5fD0ysOWqu
	F88brPIcKslk2Q1fqdI00GSLsX5Iu2eHGoZcTMNIoqiV45HU5pD1CZdiff6C/1xZ
X-Gm-Gg: ATEYQzxn095N2hxT/HDllASBziNheSAQQOobvFUCwID4IufQ2s0HYA7gc+TMW7Z1A3t
	Sn/8bOFZ0KCtpH0q+KRnzj74xz6NvMf1qZNvhUlFOstEJOJSEsT2SRMxstkfa4pRogTGVR1RECF
	UDmAqJd2EUHxvRTh6CVVZ8IWBvUSqz5/o8A96yRyMzMHTHxkXBasuemr50ueCLUk8E6MxQxxhdS
	70lPDExFFd8oWZReXuGYwfrOIPPETn4HkI+M+OOkI5SFLF4NtgJD70nu17YzYcWwtWJ5trqiS4T
	eOnkmfF3Pn24jYckQrRfLfzRVJj/kByf6JbHkv0DOMUGGL0VE7ookIzkY0edWRibvOTimMwMbWi
	zxWEFotUu05vSJh9t4tEv7GK8ulba0juQz0iHg8ZKnCjPLHeD5Btlk2EUixQMyeqaGxebyTGKb3
	iZrrmktyKFOF0NDnnj+IQGmTiA9lxy2yHXqWmJrdrmVfq1S78mO291aXcFPTqY63ZC+w==
X-Received: by 2002:a05:7022:698b:b0:12a:7165:7405 with SMTP id a92af1059eb24-12be640d75amr3359834c88.8.1775081221588;
        Wed, 01 Apr 2026 15:07:01 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede54ba8sm1605984c88.10.2026.04.01.15.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 15:07:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	dri-devel@lists.freedesktop.org (open list:QUALCOMM CLOUD AI (QAIC) DRIVER),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2] accel/qaic: kcalloc + kzalloc to kzalloc
Date: Wed,  1 Apr 2026 15:06:43 -0700
Message-ID: <20260401220643.12802-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101397-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 08072380D33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Consolidate the two-element allocation into a single allocation using a
flexible array member. This reduces memory fragmentation and simplifies
the error path by eliminating the need to check for allocation failure
between the two allocations.

Add __counted_by for runtime bounds checking.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use macro for number of elements. reword commit message.
 drivers/accel/qaic/qaic.h     | 4 ++--
 drivers/accel/qaic/qaic_drv.c | 8 +++-----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index fa7a8155658c..e237020f6aa9 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -152,8 +152,6 @@ struct qaic_device {
 	struct list_head	cntl_xfer_list;
 	/* Synchronizes MHI control device transactions and its xfer list */
 	struct mutex		cntl_mutex;
-	/* Array of DBC struct of this device */
-	struct dma_bridge_chan	*dbc;
 	/* Work queue for tasks related to MHI control device */
 	struct workqueue_struct	*cntl_wq;
 	/* Synchronizes all the users of device during cleanup */
@@ -206,6 +204,8 @@ struct qaic_device {
 	void			*ssr_mhi_buf;
 	/* DBC which is under SSR. Sentinel U32_MAX would mean that no SSR in progress */
 	u32			ssr_dbc;
+	/* Array of DBC struct of this device */
+	struct dma_bridge_chan	dbc[] __counted_by(num_dbc);
 };

 struct qaic_drm_device {
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 63fb8c7b4abc..1dda8dfea5a4 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -43,6 +43,7 @@ MODULE_IMPORT_NS("DMA_BUF");
 #define QAIC_DESC			"Qualcomm Cloud AI Accelerators"
 #define CNTL_MAJOR			5
 #define CNTL_MINOR			0
+#define DBC_NUM				16

 struct qaic_device_config {
 	/* Indicates the AIC family the device belongs to */
@@ -405,15 +406,12 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev,
 	struct drm_device *drm;
 	int i, ret;

-	qdev = devm_kzalloc(dev, sizeof(*qdev), GFP_KERNEL);
+	qdev = devm_kzalloc(dev, struct_size(qdev, dbc, DBC_NUM), GFP_KERNEL);
 	if (!qdev)
 		return NULL;

+	qdev->num_dbc = DBC_NUM;
 	qdev->dev_state = QAIC_OFFLINE;
-	qdev->num_dbc = 16;
-	qdev->dbc = devm_kcalloc(dev, qdev->num_dbc, sizeof(*qdev->dbc), GFP_KERNEL);
-	if (!qdev->dbc)
-		return NULL;

 	qddev = devm_drm_dev_alloc(&pdev->dev, &qaic_accel_driver, struct qaic_drm_device, drm);
 	if (IS_ERR(qddev))
--
2.53.0


