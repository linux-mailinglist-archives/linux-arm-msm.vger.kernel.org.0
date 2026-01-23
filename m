Return-Path: <linux-arm-msm+bounces-90362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLDrIN6jc2kbxwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 17:37:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9F078962
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 17:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB3303001C4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 16:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64AAB22D9E9;
	Fri, 23 Jan 2026 16:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MX5v/1T3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD9C259C9C
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 16:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769186267; cv=none; b=lCJz9GFOLar65P9a0yrlMk2iwGRcHPVw1Gi1CDRA6ZqkAJdYqEeb70fyJyrQcVa3BNA5hZbPhi7IYCJ+RVgMM4Hjs/QYvk0E7HrzwFbq1Rxik9Y3/pd7GOXUxyLYSpVEX0hSW94GsflnXkoDM9kBBACP3onb0snOqwOdfs65YYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769186267; c=relaxed/simple;
	bh=XfgJbaJiD7FxrM45vwdfh7MDrURrJgbbrXbkXomT15U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LocrHdlz5dV7wwt0NYYxqJ2hWiItHlVmZ/svVYLSW1zfzMbwMHk1/sb+bfK7tg6sPlPha+0v6eF1cYGvGtDk6nFRdFHDVBjlKVnGL51aus8n3gzxwUAFcsu2wIHEauBpEJqdp6LhcEpeyX6JEnye2660ZA/J3jp5cGTSpdMqm78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MX5v/1T3; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a77c1d5c3bso10705695ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 08:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769186265; x=1769791065; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CIf/jUCjzdJFezTzX6UtWeIusC7XBhWXZ9HJ+kURBZI=;
        b=MX5v/1T3krJC7rFGD9nwsXFR15I7+At5QWx0A1bPm6x9tvjjVv9boN/hGeAy7uh5/J
         UF9Va2PPQDqnVxe33thb3TmW5z9Ds35Cyzn7MMemHoQG3CrJ/ljW5TiMmQ4gMPeAZ5cW
         qCXW/DxSoij04SJKFRV6JnwDES8PpUVWg7/5tS9qvJgV+jWSks280yq0eKFxso0aSNsR
         oR8f8F234In9ws30dknarthbLUnUkyEJ/9RaobkX0aJWk1grysGt7/L7p8SC9nHGithI
         9kY35yPVJEgHNYZ4AenZwZJRHStDRb0TTQsIFt2/uq+ta+EK4xOotRirAEWfllggW8kt
         p5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769186265; x=1769791065;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIf/jUCjzdJFezTzX6UtWeIusC7XBhWXZ9HJ+kURBZI=;
        b=cuvNZ13nZeVu561FrLmS/x2CsDKdnmsHIc1AkBnicQHZyyzWbW7YHB8pPPUxhQZ0cv
         nRka2xo9/kC842fWEjXLI4eswsjVJvleGngS45v01B+S6R0wwoME76cHndCqtvLxWH4l
         hQB8KIK5nBQpcpB2z/HWSP0E9Cz5ytErJS2Orn8vIhq3Trnd5cv8aGQ3AhJBhJGcg0OQ
         h4jdNX6G/f+wAPNUbB79PoFwHD3WbY8xmvq5iMt9RA7hBqvRCwiX7/mxa2qVyCWYxYeb
         uvd65in8tef7M8DkCz4Bi/x55WYbbQZewKaf75j0CdX3iea/bs4/aR1m5bFEMAk41lWy
         6WtQ==
X-Gm-Message-State: AOJu0YxinDRH4JXCvr1Y27feCSHc3Tji/cPb8Fs3yB4G4fiW2f1Deebo
	TyRn3tv2cXgsBZ8y9oADWE0szYxdLkbrksscyNQ8SwoNR0ssmjI61N5n
X-Gm-Gg: AZuq6aKFLNG2rxAO+sGgbO82Q/JKx+ixKc1xrMVWPIiWZv3x07XJ5ba0qWmNIB5RtE3
	7sQLC1CwstzQ69JH/RBx+HKJQF1fq8iUhQ/eexep5Z2TZ3dCwnJH5ltEcX+kTrRL9vZl+/eswEM
	ue2dnW5S4MHYBrowY1+7jvbHAROTRQpP9Obw41sjWr+zE/98jda1v3jWMIbkUxLt4sFaldrlKMZ
	iMzpLEfCvZciv0DXR6A5jeTTs5jPS3VMRYDEp42j7Pcjq1fy+vdvy2Gg34DKAKt8TxL2LtLi8NB
	PtLYYSXlNV/uYDKSvfjvqZiRdAQsV4EcjCs4HpwuZeDeizR+0pmpllxPv4yExnrVbYYQ2vbgJ9J
	Viy7D5wrVK/VvoJgt8QgEoVGt4bLnGsvhW0ku8rjCqSaOstb8ZcMxgINtWXJ6kdu13dlV8EOKBF
	/YLppSpxE3naXoFJrMY31iBwkFLbwxwpwXTQ==
X-Received: by 2002:a17:90b:3a4f:b0:32e:3829:a71c with SMTP id 98e67ed59e1d1-35367603595mr3147765a91.16.1769186265087;
        Fri, 23 Jan 2026 08:37:45 -0800 (PST)
Received: from junjungu-PC.localdomain ([223.166.246.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536dc506d0sm2491488a91.13.2026.01.23.08.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 08:37:44 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 24 Jan 2026 00:37:38 +0800
Subject: [PATCH] drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com>
X-B4-Tracking: v=1; b=H4sIANGjc2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNj3USzior49IJS3eSkZANL05SkVBMjYyWg8oKi1LTMCrBR0bG1tQA
 maabFWgAAAA==
X-Change-ID: 20260123-a6xx_gpu-cbc095dbe423
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769186260; l=2013;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=XfgJbaJiD7FxrM45vwdfh7MDrURrJgbbrXbkXomT15U=;
 b=1+ZDVPOWVZlNST7+6jBAwaq3yRNaG1fjeNiRT/YcLb0Up78CXWFfBx8flp4p8vEci2TmwVfJO
 XI5Grri2JkUDp+6hfSBPACgFGrn8F9tDYJCXBa1wH/o+/Vu5zKokf3w
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90362-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE9F078962
X-Rspamd-Action: no action

In a6xx_gpu_init(), node is obtained via of_parse_phandle().
While there was a manual of_node_put() at the end of the
common path, several early error returns would bypass this call,
resulting in a reference leak.
Fix this by using the __free(device_node) cleanup handler to
release the reference when the variable goes out of scope.

Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2129d230a92b..0bc518d9fd65 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2640,7 +2640,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
 	struct adreno_platform_config *config = pdev->dev.platform_data;
-	struct device_node *node;
 	struct a6xx_gpu *a6xx_gpu;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -2660,7 +2659,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->registers = NULL;
 
 	/* Check if there is a GMU phandle and set it up */
-	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
+	struct device_node *node __free(device_node) =
+		of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
 	/* FIXME: How do we gracefully handle this? */
 	BUG_ON(!node);
 
@@ -2702,7 +2702,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
 	else
 		ret = a6xx_gmu_init(a6xx_gpu, node);
-	of_node_put(node);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);

---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20260123-a6xx_gpu-cbc095dbe423

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


