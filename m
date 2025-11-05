Return-Path: <linux-arm-msm+bounces-80452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A521DC36058
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 15:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8F3E54E413D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 14:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9ED2D193C;
	Wed,  5 Nov 2025 14:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIteuqAq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25AB21CFF6
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 14:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762352437; cv=none; b=b9OmAP6o9JALLV7IA8QpC1I78+BjaUmsJsfm9Hg1FDd6unMXbXbZr9eA3Vm9GjxbtU7GqdT4JNd+04GfA3em4y/t8o9DuB/5c9pMx2pui4XdCC9d12RtKrYaXfvWM5jGTmLkOEv30+bK8LlErR32kaT2xzPz7PXyWrccoHNatns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762352437; c=relaxed/simple;
	bh=2bydY0FEOcssCU3jumasSDa5bWFLWCHjfTYBtgqnKTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LVXpPvaMbFvw5uXW62fPZLRzvkvTiIoAFzzfKspQgaVDdPEpKdixi2lOtmP7bdKCoXGP6tbId8HGEnUtNmd+rZmyaXhGMcrx3yo1n4o7KpyeDOIMuEw+++wrfknzV/iceb6xWHkuaqvLIJSRDR+voqgBvtzdadw4OYBR2oYgJqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIteuqAq; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso3526598b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 06:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762352435; x=1762957235; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lKHHVea8wTIQH463SPis4pm7eX04G+ekedJN9dG7siI=;
        b=BIteuqAqsJRbkO2aBuNMzwCpeewN0+L2ujCWedng31IpnBdqxRHuJAe3Og2SG9jUmd
         bQTQdTEnBTdKLmSpgAZFSij71zpaqGiuBrd3ZAYWtKEGMuAmZ7fHIq6Qupuhan79hOtL
         lh0dRyDCwkxKEr9pprsVj/K5Y68rTU6vstbd/M/tQCoAsGQlzPqYHnN2R89XSnQjTYsl
         iGlL4xc3U411u24B61v71cx7CRSe5PBb0KjxEkkK7w3Krf2w/sRgsD53I6c6CNsgP2HH
         EUjJ7bxGf/EmzJ7Vuk/Dj7UFH8wEu3tDrBYqFilZkOas9iTjEgVP3GOPLhrGTmQ06aZi
         E7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762352435; x=1762957235;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKHHVea8wTIQH463SPis4pm7eX04G+ekedJN9dG7siI=;
        b=h2AziOxjplY3BCk2GYgaj2w62vxvNrOhXm/obA5ObaV2Csl3PgpzEqVPDTztTRqhpD
         /vpt1RsTNnPPPxYx1Gkjx5wPDzRnP7CqyS+MMvbIOPRR9f72Wmjx+2/NAeAlC7WJfaEa
         77Vo3Sz+v62XjctIRXGtoHQLQuK/1F0MbX1OdyUiSbUW5Abo3n9i88QxbErnUDCM7Lun
         OnOiG/CD8H8+cqLnqbKWoDuhJfZtWdAsuRTMw03DWLD2hsmKOA67N8Jy1xxqEJra9SSZ
         X4f6h0oE5+AGRfxG6P0DTdI6sg+VoHsItBuuepzzSWdvUZIOmtE9QimEkw5WVFSYiCGS
         u48Q==
X-Gm-Message-State: AOJu0Yx6wpuyBeuIsP4y3E1JvIKB3LjS6856lXXbfirgy66YVQLB5pfD
	mL5k8B6fGSBdg5kP+A+RCLPkCZzu5FrGhR5OG4Ra3fhqFASwLlRUbJe0
X-Gm-Gg: ASbGnctVzt2M02daGLvvLiWgR32g6JG4o3hJInB2sofBMe/0hiy5S9eUoAeUEjXgtkk
	VJH1ckX0F9wp1hheJ87HaELJq8/0dtp5+D7JpStIDsikmVuirqMOZdfM89GSKjmXWLkc4d/UorY
	sifaOTYCDKO3JnuZ7uY4EmeSvXVhpPIizzDIqPCA45VkTrSNq9cT8icOomLk+53aAQtS4kK3GoJ
	kvzHa4oPqazTLYFuB16yGu6tiYyYJMgXnjaT2o22d6CugijB9eeU/1CLQ0vWv505dl8VayLshcy
	RzffpPtxqM0L4tyYrMMbC1JkrR7pdnCF2x5oSkGpyY4c4AZbfj6Vf+QWbCtq+vGhEsX6JJOeGVv
	fR+UTZU4oFLI4epC1xjcRcTzYDBna9QzfCfXe0dHsr19cle8xTXCabjIUcqOcug0ayYu3XWpmsF
	Q=
X-Google-Smtp-Source: AGHT+IHzTTnPsxUzWsrmGxTIjfu7iWPk+D21UhbLo2AmmafmiFkrQxFxAHL2VAWLOH/Cs1o9hs8q3A==
X-Received: by 2002:a05:6a20:3d23:b0:342:1aab:4c71 with SMTP id adf61e73a8af0-34f839f5a40mr4658333637.4.1762352434947;
        Wed, 05 Nov 2025 06:20:34 -0800 (PST)
Received: from aheev.home ([2401:4900:88f4:f6c4:1d39:8dd:58db:2cee])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a67e2f82sm3198879a91.0.2025.11.05.06.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 06:20:34 -0800 (PST)
From: Ally Heev <allyheev@gmail.com>
Date: Wed, 05 Nov 2025 19:50:28 +0530
Subject: [PATCH] tee: fix uninitialized pointers with free attr
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-aheev-uninitialized-free-attr-tee-v1-1-2e1ee8483bc5@gmail.com>
X-B4-Tracking: v=1; b=H4sIACtdC2kC/x2NwQqDMBAFf0X27EKyNJf+inhY9FkXSpRNKkXx3
 xt6m7nMXFTghkLP7iLHYcW23CT2HU2r5hfY5uYkQVKMIbGuwMGfbNmq6dtOzLw4wFqrc20QRCI
 eCVNSodbZHYt9/49hvO8fhMJ3o3MAAAA=
X-Change-ID: 20251105-aheev-uninitialized-free-attr-tee-0221e45ec5a2
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
 Jens Wiklander <jens.wiklander@linaro.org>, 
 Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 Ally Heev <allyheev@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=allyheev@gmail.com;
 h=from:subject:message-id; bh=2bydY0FEOcssCU3jumasSDa5bWFLWCHjfTYBtgqnKTk=;
 b=owGbwMvMwCU2zXbRFfvr1TKMp9WSGDK5Y/WKKr4yXPn5c0ZQ2G3bhTJfr3T2H+FlvFrzm+2UY
 VRb8fQlHaUsDGJcDLJiiiyMolJ+epukJsQdTvoGM4eVCWQIAxenAEzk9wuGfyZ8RXmOCltyiua1
 Kr+MjrH/93OBS71P8p2b2r2nLl7d4cjIsPy2e3PVJPuES6Zzd3rm5T5IvbZZXNVg/eerInc03p/
 2ZgYA
X-Developer-Key: i=allyheev@gmail.com; a=openpgp;
 fpr=01151A4E2EB21A905EC362F6963DA2D43FD77B1C

Uninitialized pointers with `__free` attribute can cause undefined
behaviour as the memory assigned(randomly) to the pointer is freed
automatically when the pointer goes out of scope

tee doesn't have any bugs related to this as of now, but
it is better to initialize and assign pointers with `__free` attr
in one statement to ensure proper scope-based cleanup

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aPiG_F5EBQUjZqsl@stanley.mountain/
Signed-off-by: Ally Heev <allyheev@gmail.com>
---
 drivers/tee/qcomtee/call.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index ac134452cc9cfd384c28d41547545f2c5748d86c..8b7b4decddd8d1811dc0a7cc46a4a4fbada45526 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -645,12 +645,13 @@ static void qcomtee_get_version(struct tee_device *teedev,
 static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
 					  u32 *version)
 {
-	struct qcomtee_object_invoke_ctx *oic __free(kfree);
 	struct qcomtee_object *client_env, *service;
 	struct qcomtee_arg u[3] = { 0 };
 	int result;
 
-	oic = qcomtee_object_invoke_ctx_alloc(ctx);
+	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
+		qcomtee_object_invoke_ctx_alloc(ctx);
+
 	if (!oic)
 		return;
 

---
base-commit: c9cfc122f03711a5124b4aafab3211cf4d35a2ac
change-id: 20251105-aheev-uninitialized-free-attr-tee-0221e45ec5a2

Best regards,
-- 
Ally Heev <allyheev@gmail.com>


