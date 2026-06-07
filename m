Return-Path: <linux-arm-msm+bounces-111579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 16SZGOecJWqQJgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 18:31:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A12650FA2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 18:31:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="C8gnJ/pW";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111579-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111579-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F8993001007
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 16:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8DB30C360;
	Sun,  7 Jun 2026 16:31:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674DE2E1C4E
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 16:31:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780849892; cv=none; b=Gb3LG37PSp1hXBDUN7oJ8EMDG0jNjUBZibGZMK7O/v0SXgI4b1xNVelFBTFSgjJ2pjgfZFjinY0TfP8h1swleZN+1VpNpfS9yA3OELMTd1j//4us4nJHrgrxX1pG0XiDkK1yOzu3L5OExZfx8sc5/Zmvw+KYW0CEPd3xUGkQaAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780849892; c=relaxed/simple;
	bh=wimcoFeduwwwS/y+4oRKJmv0H4adw0OCIARl89GeYC4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F8WOGCchSgXdlx3arMSiaIg6rt8+uv9pmT0krP+qmbOoIZsrePkoKVTYYDDX/NRWJ0kVd7F2O2o0m1Zqikm2kmLf9HR8LSrWV7d/PlsfM7kj2piL34mxwVai3JkkG/ydkDBx9vBHLvHohUUESIabXpxwQmhbcnTyLvZUIH/tqqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8gnJ/pW; arc=none smtp.client-ip=74.125.82.196
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-304e83724bfso4124382eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 09:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780849889; x=1781454689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=99zC0kq72jgYAVQdZ1ccwSMj89YTa/EzOnilbO1qrX8=;
        b=C8gnJ/pWnqBeRkGUey20uoujuXcanRcSe5gq18RVuAUQnHeZqzNAymcSkh56Mluvcd
         jyXwxyv8M4FdKzF/T6imbzlKPH9woeGXxONKgNFi62lnjOuzQlpwmAk6A2ACkLGsF9xl
         8CDRhoVo+8Jb4H4YClNI7FWqzPRa/Hj/7cbMcmfXlNC6Da4Syh8lWzY7UNWBynrdjbAn
         J32e/oJRp2SAIzDGwW1Z062c3lc6TtUzkbqlEBY3xsGAe0Rf+XWCYjA2v0GhpzYKymCu
         GzGBzjvLYQ2fXHRc5bUuxQASPnOIq8hxMz1lKICr+qaCrBrYByVg+cFJDLICK20obz/V
         Wepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780849889; x=1781454689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99zC0kq72jgYAVQdZ1ccwSMj89YTa/EzOnilbO1qrX8=;
        b=DPS6GD4mWauUVY2JKfWMJ0CGhsHQsFlNxkx5P2nfUJjamtPCaVCbfdIHJBhrwcbrwM
         PZ5fu9rOp/cbNqpgXQ03DmCn4E+Xo5e6+9rQSYkPK7C/6vbLWTZfsoDZlGiRE+4E6vbw
         zkzmusns8jGA9s3+tqAqpT4RR5FjT7IjIgyx9Z22xL0dXxnVK9yqIWah608QqAYfRD1W
         MANbsNrbEjJyt68F7vF2DSKPKJrWFPlX5QVbqbxDvBDhK04Sly2Icah2coIMsmNm7T0J
         ntW24yWWixGefiuBINxr5q44w7THukr+I8wOz133x9zjY76eIQL1TVlu57PZ13Q6tnyn
         0nsg==
X-Forwarded-Encrypted: i=1; AFNElJ/x9R7NFkmgJe/lz4qUEluKMifow9rAuDmfu5wysAl6zmksaXWUbwU7UkSOoDD0J9yoIkWFdzvbls7VgdC0@vger.kernel.org
X-Gm-Message-State: AOJu0YxCEKvHPRTlnbm+IxEJfglTaSfma+pEYmfz2nR5+QFJTXUqxyZa
	V5Wi4WPn11Vnu1c2YK905mw3n4h2B//0+U/7Hlr/wMAMdMfV7R6YL7GBuwor7Emh
X-Gm-Gg: Acq92OHSXScEPaua0ag89fuRMzDK58zTFFozTyMuWFlr1sHJIWmD8+EEX7yxexdgDx3
	Dlu2CkMO4wSSJz09lE7AbMl0ZWzALYgAUxHr41cqqtr9Bbwgp0NSTVp2hXZV9/bTX6KEwZymjVr
	GzZFcWAKBWqdc5OUp0eoWqSPyv9lVS1oQhysmwFZX3qcRlcwHF+R3GDaxTciBO5rA8A/knNMkep
	PlqETggam/uRRfbbVDredoIbV7v2cVp+bI+bwxp1+V5sSWHCjxmejIDQ9rC1+Ku+AMILXvY2/3l
	9S9FoSWWJBY5NLOcpltyVkHs+OSAESWgxivS9oEPMdtjOgQ4i/rEXcqGE/HFTOoj8R3ozwtdSu3
	sH4icfq7W6zSFtZukmmRounG71FgTBCuVZ00BfNQPyXS2VrXIFRFrproAuihmqe8Cp9kMIQCX8y
	BwqcNpcDEn+AB/LUdrDKyr9zYFHsqYve49Qj1M8QUNuUyHnqaLl/m9xHSdVHshWnZxsw==
X-Received: by 2002:a05:7300:6d07:b0:304:df0e:9dba with SMTP id 5a478bee46e88-3077b79d271mr6580259eec.31.1780849889307;
        Sun, 07 Jun 2026 09:31:29 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30777ecf9e9sm8906108eec.28.2026.06.07.09.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 09:31:28 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: okaya@kernel.org,
	vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] dmaengine: qcom: hidma: use sysfs_emit() in sysfs show callbacks
Date: Sun,  7 Jun 2026 16:31:19 +0000
Message-Id: <20260607163119.78717-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.infradead.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111579-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:okaya@kernel.org,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3A12650FA2

Replace sprintf() and strlen() patterns in sysfs show callbacks
with sysfs_emit().

sysfs_emit() is the preferred helper for formatting sysfs output
and simplifies the implementation.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/dma/qcom/hidma.c          |  6 ++----
 drivers/dma/qcom/hidma_mgmt_sys.c | 19 ++++++++-----------
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index 5a8dca8db5ce..7a7f302a9699 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -624,12 +624,10 @@ static ssize_t hidma_show_values(struct device *dev,
 {
 	struct hidma_dev *mdev = dev_get_drvdata(dev);
 
-	buf[0] = 0;
-
 	if (strcmp(attr->attr.name, "chid") == 0)
-		sprintf(buf, "%d\n", mdev->chidx);
+		return sysfs_emit(buf, "%d\n", mdev->chidx);
 
-	return strlen(buf);
+	return 0;
 }
 
 static inline void  hidma_sysfs_uninit(struct hidma_dev *dev)
diff --git a/drivers/dma/qcom/hidma_mgmt_sys.c b/drivers/dma/qcom/hidma_mgmt_sys.c
index 930eae0a6257..9672ef9ee8fc 100644
--- a/drivers/dma/qcom/hidma_mgmt_sys.c
+++ b/drivers/dma/qcom/hidma_mgmt_sys.c
@@ -102,15 +102,12 @@ static ssize_t show_values(struct device *dev, struct device_attribute *attr,
 	struct hidma_mgmt_dev *mdev = dev_get_drvdata(dev);
 	unsigned int i;
 
-	buf[0] = 0;
-
 	for (i = 0; i < ARRAY_SIZE(hidma_mgmt_files); i++) {
-		if (strcmp(attr->attr.name, hidma_mgmt_files[i].name) == 0) {
-			sprintf(buf, "%d\n", hidma_mgmt_files[i].get(mdev));
-			break;
-		}
+		if (strcmp(attr->attr.name, hidma_mgmt_files[i].name) == 0)
+			return sysfs_emit(buf, "%d\n",
+					hidma_mgmt_files[i].get(mdev));
 	}
-	return strlen(buf);
+	return 0;
 }
 
 static ssize_t set_values(struct device *dev, struct device_attribute *attr,
@@ -143,15 +140,15 @@ static ssize_t show_values_channel(struct kobject *kobj,
 	struct hidma_chan_attr *chattr;
 	struct hidma_mgmt_dev *mdev;
 
-	buf[0] = 0;
 	chattr = container_of(attr, struct hidma_chan_attr, attr);
 	mdev = chattr->mdev;
+
 	if (strcmp(attr->attr.name, "priority") == 0)
-		sprintf(buf, "%d\n", mdev->priority[chattr->index]);
+		return sysfs_emit(buf, "%d\n", mdev->priority[chattr->index]);
 	else if (strcmp(attr->attr.name, "weight") == 0)
-		sprintf(buf, "%d\n", mdev->weight[chattr->index]);
+		return sysfs_emit(buf, "%d\n", mdev->weight[chattr->index]);
 
-	return strlen(buf);
+	return 0;
 }
 
 static ssize_t set_values_channel(struct kobject *kobj,
-- 
2.34.1


