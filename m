Return-Path: <linux-arm-msm+bounces-100637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJVtDwhxyWl9yAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 20:35:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4143C3539DC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 20:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2DAF33002515
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3EE372684;
	Sun, 29 Mar 2026 18:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="eDwXr71O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F3F292B44;
	Sun, 29 Mar 2026 18:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774809346; cv=pass; b=CkJcEPGobOH3aieuyF+i6Y6QcyRfBxuQFTXYz4Mtw9YVrcSdYJI4bswWWNL8vb2CIDDjRytnpM032WoytyD03foQamhZBuCq0OrskVIgkPyprdnKaMJr1dU+37XXJvNcaa+YZ5qmBNKUVR1iIg6rVXMbPT/2OoMVmc2VDq1UY4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774809346; c=relaxed/simple;
	bh=KluLD3an1m/I8Sen+H17GNazb32lFETpVx6pJs3U9ME=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d1aG2cAl4qiUbsgvE3qh2JBIYxBIqGXM47g3iVntF1iv+2p81c6ETN/t6SaUyMAOhqmpNT7hHaqBMlreT/R2aS/h5MnAS6epqbwrkdH7AGwuPduvQauwvS3dFIL66JCj1syrKkhhXNBEFPQqyhGbFsqD+kEt4UlL8TNoIk9ou80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=eDwXr71O; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
ARC-Seal: i=1; a=rsa-sha256; t=1774809319; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=Xlgf/zP4Zhg3LL2LW0Op0TSG9Nm5hWiYheaXbjH+NN/hGPyHIfgMoGfZZZah/tnsF5l4Cu/8qfuz4T6HOnNF76dpJmUjvAoKaRUDibX+B3W9bVvmZr7/PT604iSnNfIuUkVDzf0T+u7oXwgUrRnWVHshJiCqVa821ZETXecFUU8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1774809319; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=P5Yc396NflXhsxNKiiVfi/eLQprdlVd89Ih6i/8GNks=; 
	b=bG/FJSMztF6SpPZb6xQdBynzPuetwgETeOxzOrtwn244Tz8snqCW4dwV3wttPa9Bp8USDDdR14pm2sdYfcRnIE9AMnIUUC87iHH7I3Z9+iBMGg99jlFcpQQoQo68UOFps+IRAuhX8uLBbGPDdIHWfpIqYh+6pXLW727i4JNNIMA=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774809319;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=P5Yc396NflXhsxNKiiVfi/eLQprdlVd89Ih6i/8GNks=;
	b=eDwXr71OS+h9uUzgbiwPai8/lq8kFoAy6Ev9E75kzC3IiI/JQKgkS3AXVyYXXurl
	mb6YTEABYN8aXRY68gKXLp9NRouzpEcj9Brvje6XJ0k3cxS0i/rmbpENATZQGLwORbG
	fI7KtmgmlRg+hp4AAfnSCLxjroRMscxnoLrfriHA=
Received: by mx.zoho.eu with SMTPS id 17748093160311013.9868925616536;
	Sun, 29 Mar 2026 20:35:16 +0200 (CEST)
From: Josh Law <objecting@objecting.org>
To: Manivannan Sadhasivam <mani@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH] scsi: ufs: qcom: stop ignoring hibern8 exit failures
Date: Sun, 29 Mar 2026 18:35:14 +0000
Message-Id: <20260329183514.133412-1-objecting@objecting.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[objecting.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[objecting.org:s=zmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100637-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[objecting.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[objecting@objecting.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,objecting.org:dkim,objecting.org:email,objecting.org:mid]
X-Rspamd-Queue-Id: 4143C3539DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Right now, we're blindly returning success even if waking the link fails during clock scaling. This is a mess because the core then tries to send SCSI commands to a dead link, causing huge timeouts.

Just return the actual error so the core can catch the failure and roll back properly.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 drivers/ufs/host/ufs-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 375fd24ba458..5d33a921a22f 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1750,10 +1750,10 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 		}
 
 		ufs_qcom_icc_update_bw(host);
-		ufshcd_uic_hibern8_exit(hba);
+		err = ufshcd_uic_hibern8_exit(hba);
 	}
 
-	return 0;
+	return err;
 }
 
 static void ufs_qcom_enable_test_bus(struct ufs_qcom_host *host)
-- 
2.34.1


