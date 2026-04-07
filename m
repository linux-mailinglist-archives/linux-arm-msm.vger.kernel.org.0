Return-Path: <linux-arm-msm+bounces-102247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFZRLA+C1Wlr7AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 00:15:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF503B5474
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 00:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24DE4302E31F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 22:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B0037E30E;
	Tue,  7 Apr 2026 22:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zio7D+me"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4516737DE9B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 22:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775600140; cv=none; b=N+qz63436qi0OU0LOOPXNC2sB2KY15f0fOq+1vMjX3PoeNu2gpXBAqSySRwh4ToPDoKBacz+SbUFCxz21jHZ5YBA/DO2ihmcr6gbNWeI4r3Q1pSk8ndUd6l8890Ryj2KtDnRDHhKUPuCYO2nXNh44U51POsXV2i2sVJIvZr3yTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775600140; c=relaxed/simple;
	bh=Brbd0a0BybC/brQQ4C85GAHNIG8AVtq/UF8mJOCDY64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VpzSmby+G2pUJ4xWYLZAZgLra7WMEyZWmXsqQrBU0lxbUa90XMDhBnexWr82rxhPBVu8V7I3VYbk/mY7Obaf4uPhvBN1YOafW9kr2p7a091HjcrVwOBYh801k2X76V5WKBdwzhDCPJZsKfRxytRZ2Lk4xgLUoD55X/do2UwcXlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zio7D+me; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50d75bfb259so28779961cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 15:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775600138; x=1776204938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y+hmC6Or4+fAjdiMPYIn47F9W3NDLyREzEC4/7QicQE=;
        b=Zio7D+meHAb4XfBssU8FUYtiM89B99QQ4hbKCbVLx6vbREktHU4rRZ3sqKPJhDkJSh
         Uqe8Jg98g0K3TIOYdWwHeciQrzI8ChrGdFZvBjKtFh1F0DNbV9HUZgFjtAia7+RFeYcP
         o+tVth9gb3RvsGpFzvim8Ojubhj9cfO9KAhgeAdXNOR7ZE4kNO0BaUaPUB29PgkVzmww
         FXAIUQfIvsG+rMz9aU+z02IMV0S8N/G2pmVli98SkdPC20pLeBNIwNTrdD0l4+6sd/9s
         PugS/Kah+eAH4N7jna/c2pPzmzvyvRtnnOc08ML1v7KBIeBDsRgEnpzggXw35pFv3D8R
         L43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775600138; x=1776204938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+hmC6Or4+fAjdiMPYIn47F9W3NDLyREzEC4/7QicQE=;
        b=fBxBIAfR3nR+ay6x3mfIOhI9fpWwUKeA+PoDqq9rSaW3AZreykKO2d1d0H8SF35pje
         fGSFip6cLFOe3hotQifMBA16y53b6aVurNQBRnpaVx9dc8MDxjzxMMHjEnD5wsETUTH7
         ymvqDDfeqhCrVvwHYjlfYJsggdYWwsUe2/o7Xpu7UV1Kzo70hhaHgJmKkP451L7tp6DU
         PoQbHih4DGKV7bGZ3chvvKUcRdbLCbVuehJ8I4tgEEDkldV67c9Fg7fg0rqQBFFyy8U/
         ppY+byXGcfFY4BX+V3i4bFz9TsbfW2SkyEhvG0NInvJ8bOZ1woGNHnShl1vcM1ny5O6g
         C6hQ==
X-Gm-Message-State: AOJu0YzAFK1WVK90Y1U/C7DUbL66l+PnvW3TIxdzKTQX95CjbHCuQiky
	1MXMC9bthJpBsHhuyMQMe+N3uKdxa+3ujKGncPWLL1JNw0wjC8qH7XKx+6gz0g==
X-Gm-Gg: AeBDies1kx2VSoaQVFE/WY9n76hX9+dSzj/6VA/1/5oFA7XGISiPgeR3qChz93Nfs+N
	CsIr1JiFGJGmIC704vdNvMFH5pLBjeeeEfGliBGeOXCilmDXf5J8N2uObNAM7DnUkxD/dBiHrQm
	ZtiwX6IQNewGrxVG7qyhBc/XM96NYUx2xfiUbmIgqYC+lHPiWwBBIheCcuDJTgSqTzxMGhnbwiY
	ZcrCP70LSVLinyakkk/3i+1viSD/QWXYnb/zLnNdrj9BdU0GI78Q2Wdgw7aJqhp+5QkG+VW/CFq
	slUC3ezwZD5jPRjv765GjcnszDoU2Gwjp60zMm3ZRUhw8Hknjiy9isWBas9Kq0Qe4b7wdHuhVxq
	OsyUYqCZwQNDF1uMo3xKSFhhvTbPWQwWfz98ByWklo9A6rBWwFR/BdZKihmQAYzmcfhQxm4PoF+
	onWYaF8xBcg4anrk62+I2IcIWJH/SbspzyMZg3keQOoWt9DgEI2aO8SxA=
X-Received: by 2002:a05:622a:a9ce:20b0:50d:b084:588a with SMTP id d75a77b69052e-50db08458e6mr19280781cf.42.1775600137792;
        Tue, 07 Apr 2026 15:15:37 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b73e7e5sm145380941cf.17.2026.04.07.15.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 15:15:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] soc: qcom: wcnss: fix leak of fw
Date: Tue,  7 Apr 2026 15:15:19 -0700
Message-ID: <20260407221519.6824-1-rosenp@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102247-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 2AF503B5474
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The kzalloc_flex call needs to release it, not just blindly return.

Also move kfree up as it is allocated after fw.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202604060902.awXdPsBh-lkp@intel.com/
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/soc/qcom/wcnss_ctrl.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/wcnss_ctrl.c b/drivers/soc/qcom/wcnss_ctrl.c
index ffb31a049d4a..942e11feba65 100644
--- a/drivers/soc/qcom/wcnss_ctrl.c
+++ b/drivers/soc/qcom/wcnss_ctrl.c
@@ -221,8 +221,10 @@ static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
 	left = fw->size;
 
 	req = kzalloc_flex(*req, fragment, NV_FRAGMENT_SIZE);
-	if (!req)
-		return -ENOMEM;
+	if (!req) {
+		ret = -ENOMEM;
+		goto release_fw;
+	}
 
 	req->frag_size = NV_FRAGMENT_SIZE;
 	req->hdr.type = WCNSS_DOWNLOAD_NV_REQ;
@@ -243,7 +245,7 @@ static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
 		ret = rpmsg_send(wcnss->channel, req, req->hdr.len);
 		if (ret < 0) {
 			dev_err(dev, "failed to send smd packet\n");
-			goto release_fw;
+			goto release_req;
 		}
 
 		/* Increment for next fragment */
@@ -262,9 +264,10 @@ static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
 		ret = 0;
 	}
 
+release_req:
+	kfree(req);
 release_fw:
 	release_firmware(fw);
-	kfree(req);
 
 	return ret;
 }
-- 
2.53.0


