Return-Path: <linux-arm-msm+bounces-98044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1OTrJcGguGk2gwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 01:30:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A4B2A2444
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 01:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD586301ABBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 00:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9CA81E7C2E;
	Tue, 17 Mar 2026 00:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPr75XCq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD064146D5A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 00:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773707453; cv=none; b=TwKn5vGn7MdKRHdUN6yhhxbuQpaYAf6v4yFxYKVTTAlDrKgoZONM5FXlKPLrFfVwsbsy/+FIEWBj1+deyTQWWbHhHV0QBA4gvfEjDhV4li7AxewWhaGz5SKo9RaSU0GlMa8vS1YR9lKsbX5hMS/Wz1+TUeOkmgkuqkDxalCeRkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773707453; c=relaxed/simple;
	bh=Mx0l2NxLKzer7ADCbLsi4hxQxnDoZ0MKjOO+1vhGXy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KYPzAO2c+Jq70SiogZDPmFHJ4ylI11s+5nQIntoCoIYr9chEnPMcEZiO5gvb61KgQxV+oo2JjDRP/V9xdRdOkC5nsZxQj+9yskMMJb8sR6tlH6jW3miR+g0b3EKUlQwUfv9+1YzZh+2e+ejkG1DhiUwC0IUrcOGHStgFq2ljkaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPr75XCq; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82a3d3235c9so1436946b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 17:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773707452; x=1774312252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PMczMzhV3A2GonGYjmIFHjc1BY+/VEDhWUtNnoc7Cvo=;
        b=lPr75XCqF6GDfeAyItC3R2jSd835lFwfig2+XZLM4ammQ2RGCh/l9Zgx2FeFLjoK2z
         OG/U0xOBbDzBCzXjh5nzFmBD6zg/+Xx04rDcH+6xYSfHvJSABall7uoIII1dj66G1RtU
         F5rPVZvb7USEwya3i3p+SR4HbrqDY8NEHuOKZk23MpDNfFqIfVjCS4bJQNgyq4ixXf51
         D6lUA9NHtGNTwE9gvP5rZL1L8Wqw9pBNWMhM7iM+oj27Vw5h1ETgmITM4RWre3ziMNfN
         IprK/EKo/H2Xdf/XzhguLqyr1hsSWPkl82tEqAG5VQRluwdtW/Q92WUj8RMLG/bPSuoi
         2zUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773707452; x=1774312252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMczMzhV3A2GonGYjmIFHjc1BY+/VEDhWUtNnoc7Cvo=;
        b=SHeGpxd08jzn+1OL1cn4UQ5pK22pJSG+gypYi72RaVnw/zG30RKNlSz2WJxXCtJU97
         V7+VWyTuplkXLZjXhT4Bcn/DxZlsJdf4SzKRJlnYdmgJnZKgWkX/+xWphzFE1RaNkT9g
         DWc6BeCR0F2Fksv7luxCW+wWJSnzNeHgxwLWjVuRne3qBLE+09PgKAKkgceakhUxHxqG
         6Z64UB4NPXOXaDphMqlNf5VaAMwfUSZThoqEFG8A2B4J4Cm39uYZ2P4/jlrNhJTrNtwZ
         i6whKn0u5cbUptRdnfQak5GQIilNqZj+23udVXuACv/eX7tGH3ckbakkqr8WM66Qg6fi
         cZLw==
X-Forwarded-Encrypted: i=1; AJvYcCWxAvIvVxENONk6xBDlHRbmsoWJBNQmWXpf4l2KKUZfu+77MXTXxdygCag2IHYokOc09CSH6VrH7HbOz7X3@vger.kernel.org
X-Gm-Message-State: AOJu0YxIKNxghGWGILLbTvI2ELomIOZbcerjtdnumxIq9e78nn2cTsxK
	NWRjj1IZ/Ap5QPkFUbwVGV8bSVJB0NVRzsU/zI7eVa5mnn4pP0FxqdVz
X-Gm-Gg: ATEYQzx4IaXa1HAiYKnhYBbzmSjdPr2aIcsrOgktZrw7atEq/7BEHRuvJVWiQTHnNVs
	2l4dqPDyocdvIg4WqWmEnvQepssfDWZxPxNvCq91NGmX9MytTGyL5S8onC40kTQBuH37SgXPPvx
	QVTdmZskpei/3z6io7xPgKK78Chb3qZ6PTsYkiTpP9uwb3vP4WlWdas/7G+PYob0P9ekEKEWroI
	hEP3OH9YT9RVLYATuYE4cu6dg+uaC8byiJWr5fOPobmZRYZauGDa+n6LVcBQrM7PlH9xqARZ8Dz
	JkK0nkTwOZ1qU5gBSlwhmmrt8+42hIPSQXhtwY+Ze3qXUguVcbA74qnofAOjdDPZbAVWDs2HO/X
	00wWOs7fi41eJQmaFAreNNJRQF9XL3rHD+9m+iWm9rd6u41Q37lND8p9zQ0ChsExeuujSBZN3Oh
	mQUadg3W0bX208zHNimodcuXLUkgPhBySUuxiGLPRtdRCUCaeHj2P3kz8=
X-Received: by 2002:aa7:8896:0:b0:823:1212:8e87 with SMTP id d2e1a72fcca58-82a198d7220mr13987513b3a.32.1773707452151;
        Mon, 16 Mar 2026 17:30:52 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0736deb4sm14420074b3a.44.2026.03.16.17.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:30:51 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:QUALCOMM CLOUD AI (QAIC) DRIVER),
	dri-devel@lists.freedesktop.org (open list:QUALCOMM CLOUD AI (QAIC) DRIVER),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] accel/qaic: kcalloc + kzalloc to kzalloc
Date: Mon, 16 Mar 2026 17:30:34 -0700
Message-ID: <20260317003034.71618-1-rosenp@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98044-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 02A4B2A2444
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Combine allocations by using a flexible array member.

Use __counted_by for extra runtime analysis. Move counting variable
assignment as required by __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/accel/qaic/qaic.h     | 4 ++--
 drivers/accel/qaic/qaic_drv.c | 7 ++-----
 2 files changed, 4 insertions(+), 7 deletions(-)

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
index 63fb8c7b4abc..ab428ecd26f5 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -405,15 +405,12 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev,
 	struct drm_device *drm;
 	int i, ret;
 
-	qdev = devm_kzalloc(dev, sizeof(*qdev), GFP_KERNEL);
+	qdev = devm_kzalloc(dev, struct_size(qdev, dbc, 16), GFP_KERNEL);
 	if (!qdev)
 		return NULL;
 
-	qdev->dev_state = QAIC_OFFLINE;
 	qdev->num_dbc = 16;
-	qdev->dbc = devm_kcalloc(dev, qdev->num_dbc, sizeof(*qdev->dbc), GFP_KERNEL);
-	if (!qdev->dbc)
-		return NULL;
+	qdev->dev_state = QAIC_OFFLINE;
 
 	qddev = devm_drm_dev_alloc(&pdev->dev, &qaic_accel_driver, struct qaic_drm_device, drm);
 	if (IS_ERR(qddev))
-- 
2.53.0


