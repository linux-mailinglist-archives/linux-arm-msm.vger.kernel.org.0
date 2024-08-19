Return-Path: <linux-arm-msm+bounces-28961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5392B9567BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 12:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F19E21F228EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 10:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F22B1514C8;
	Mon, 19 Aug 2024 10:03:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BF033C0;
	Mon, 19 Aug 2024 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724061824; cv=none; b=ggsq5Y3qAAJxIW+b3upLT3Xp1ggWK5AEPpNBE9C6cG9uTMpdAUwuw0Kd64mg26Rhl49+3LW/WjMPqPU+0hev2+I1e73TzJkgX54T8jiN9nSegGP5bOD2rSj3kvS5BR3IqyK7bQqlXVcq1KUvlGPP+9H3qlU2o58e37GIaFQxtSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724061824; c=relaxed/simple;
	bh=vKxt43l0OwvJY5pOsltXEYOqsDQ7ksufql72nzGBt5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=drDT+Bsg3k6J6EUsXQ0JStXtNfoLKval9VFujmm8MYwQTYU1QvDPD+FL7oQ561s/PmPjXHjcXZOcgOzZcNMHWEkrm6OhUrPHYPKiwor2RCa7dSzViWaWro0fBGBd6uqXCeS9ir9EAlDBuItZrdkEwTWSfhJkJg0WIrXpFosJbYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8fdc65be5e1111efa216b1d71e6e1362-20240819
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:0d267023-8f1c-4590-a5e5-11990b87f65d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:82c5f88,CLOUDID:e841c5a9961d80c9f7a7a15340738a8e,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,URL:0
	,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8fdc65be5e1111efa216b1d71e6e1362-20240819
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <xialonglong@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 193915827; Mon, 19 Aug 2024 17:58:19 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 21C5616002085;
	Mon, 19 Aug 2024 17:58:19 +0800 (CST)
X-ns-mid: postfix-66C3173A-9875491417
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 49C2F16002084;
	Mon, 19 Aug 2024 09:58:17 +0000 (UTC)
From: Longlong Xia <xialonglong@kylinos.cn>
To: quic_jhugo@quicinc.com
Cc: quic_carlv@quicinc.com,
	ogabbay@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Longlong Xia <xialonglong@kylinos.cn>
Subject: [PATCH 1/1] accel/qaic: Change to use DEFINE_SHOW_ATTRIBUTE macro
Date: Mon, 19 Aug 2024 17:58:16 +0800
Message-ID: <20240819095816.447096-1-xialonglong@kylinos.cn>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
No functional change.

Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>
---
 drivers/accel/qaic/qaic_debugfs.c | 43 ++++---------------------------
 1 file changed, 5 insertions(+), 38 deletions(-)

diff --git a/drivers/accel/qaic/qaic_debugfs.c b/drivers/accel/qaic/qaic_=
debugfs.c
index 20b653d99e52..ba0cf2f94732 100644
--- a/drivers/accel/qaic/qaic_debugfs.c
+++ b/drivers/accel/qaic/qaic_debugfs.c
@@ -64,20 +64,9 @@ static int bootlog_show(struct seq_file *s, void *unus=
ed)
 	return 0;
 }
=20
-static int bootlog_fops_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, bootlog_show, inode->i_private);
-}
-
-static const struct file_operations bootlog_fops =3D {
-	.owner =3D THIS_MODULE,
-	.open =3D bootlog_fops_open,
-	.read =3D seq_read,
-	.llseek =3D seq_lseek,
-	.release =3D single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(bootlog);
=20
-static int read_dbc_fifo_size(struct seq_file *s, void *unused)
+static int fifo_size_show(struct seq_file *s, void *unused)
 {
 	struct dma_bridge_chan *dbc =3D s->private;
=20
@@ -85,20 +74,9 @@ static int read_dbc_fifo_size(struct seq_file *s, void=
 *unused)
 	return 0;
 }
=20
-static int fifo_size_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, read_dbc_fifo_size, inode->i_private);
-}
-
-static const struct file_operations fifo_size_fops =3D {
-	.owner =3D THIS_MODULE,
-	.open =3D fifo_size_open,
-	.read =3D seq_read,
-	.llseek =3D seq_lseek,
-	.release =3D single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(fifo_size);
=20
-static int read_dbc_queued(struct seq_file *s, void *unused)
+static int queued_show(struct seq_file *s, void *unused)
 {
 	struct dma_bridge_chan *dbc =3D s->private;
 	u32 tail =3D 0, head =3D 0;
@@ -115,18 +93,7 @@ static int read_dbc_queued(struct seq_file *s, void *=
unused)
 	return 0;
 }
=20
-static int queued_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, read_dbc_queued, inode->i_private);
-}
-
-static const struct file_operations queued_fops =3D {
-	.owner =3D THIS_MODULE,
-	.open =3D queued_open,
-	.read =3D seq_read,
-	.llseek =3D seq_lseek,
-	.release =3D single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(queued);
=20
 void qaic_debugfs_init(struct qaic_drm_device *qddev)
 {
--=20
2.45.1


