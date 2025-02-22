Return-Path: <linux-arm-msm+bounces-49046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 422D0A40B81
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 20:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2980B17FDEC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 19:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206E9200112;
	Sat, 22 Feb 2025 19:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="PM2MDlNP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0529E1D88B4;
	Sat, 22 Feb 2025 19:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740254147; cv=none; b=Qomq3YHmav+9QjzQLH9UQP5KPOfWVHLtF0GcR6JfJI0xMlgA01jcVyT9VRvt9JGJYQFEDzofQ/UVFnNylNy35wdQNO7B34sNV4pxiugo3x5L0QRz2LPM6i81zSk99MXYTdEk5q/QyuC0fMbjG6fRcjMD/LomgzHH5T3021GhFik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740254147; c=relaxed/simple;
	bh=UaONxZHrIkQdwjdaIA92qutGOMkPFTSXdH4J/zbT7yw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TUKhhICtx5sMFgW4zt9OZf9/S9RJUMNPIWs9re9ifo6D8HAK6YZQnzEdoo75VuX69d/1b1jIwjZarkNObw4AXMZNzQeKl851mvy1REQ9Q1pi/IxyV03ZSQMngGckvM+Xn4zR/xtlo/hcYXsm3pHuyaxhTjWTkkhNupnUwgBt7po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=PM2MDlNP; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Z0d5f6y8Cz9sRl;
	Sat, 22 Feb 2025 20:55:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=MBO0001; t=1740254135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fT1wsd1pyY3tybKJU0jZhvDhCC3s6dxKcQvCiDTMJY0=;
	b=PM2MDlNPSxxclBlRE/u5cezRl2sXUjlPolEy/HxoXno77rkfymoyY9xN5073KJlzX5uc6d
	bfbx5CAkOxprSUI2Xe/uSMyXuvOnGmeHD6B1JjKnI6yTq3M9ap+6tcNL+ufgGDfHyqW3x4
	tv2mg1OUbkBBan3b9AvkPV01JhmdzVY3iirrPDCnghXKkVA0bAJnq9b41OxeAoXdMxmncD
	GC5wNS15ApyzxTUCQRgjw5tipuDBcXSFoRD4+AAfp3odUQDrm+iI4F5BQtIKrlpK8zLMc4
	QY9d3HlvfmOW/xsSuQVPlNyYvudxJ3LPInqd14rWmVl+g0TB/CgdMeoOyP77/w==
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Date: Sat, 22 Feb 2025 14:55:20 -0500
Subject: [PATCH] ASoC: q6dsp: q6apm: replace kzalloc() with kcalloc() in
 q6apm_map_memory_regions()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-q6apm-kcalloc-v1-1-6f09dae6c31c@ethancedwards.com>
X-B4-Tracking: v=1; b=H4sIAKcrumcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMj3UKzxIJc3ezkxJyc/GRd05RUg7RkC5NkE0tjJaCegqLUtMwKsHn
 RsbW1AKSps71fAAAA
X-Change-ID: 20250222-q6apm-kcalloc-5de0fc84c493
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Ethan Carter Edwards <ethan@ethancedwards.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346;
 i=ethan@ethancedwards.com; h=from:subject:message-id;
 bh=UaONxZHrIkQdwjdaIA92qutGOMkPFTSXdH4J/zbT7yw=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkp2QXk4ekFKWGJEOXFoNThlVGp6e
 GhQcXlVeHBPL1MzbmlFajBIc3VmV3YwOWtTRE44blRzbG4wWlFPCm54ZjBOU0IxVWRhM2I5czF4
 VloxbExJd2lIRXh5SW9wc3Z6UFVVNTdxRGxEWWVkZmx5YVlPYXhNSUVNWXVEZ0YKWUNMdEx4bit
 HZXp0YTFrbzArdHplUDFzZC9VZG56N01sTW02WDNMZzhOSWZiZ1dMT2VXbDFqQXlIRjl5Yk90YQ
 ozWFBmemVJZml6enJtczI1Z01uN0h0ZWI3NHN0bjYwOEdkTEF3UThBWG54T3pBPT0KPWtWZDQKL
 S0tLS1FTkQgUEdQIE1FU1NBR0UtLS0tLQo=
X-Developer-Key: i=ethan@ethancedwards.com; a=openpgp;
 fpr=2E51F61839D1FA947A7300C234C04305D581DBFE
X-Rspamd-Queue-Id: 4Z0d5f6y8Cz9sRl

We are trying to get rid of all multiplications from allocation
functions to prevent integer overflows[1]. Here the multiplication is
obviously safe, but using kcalloc() is more appropriate and improves
readability. This patch has no effect on runtime behavior.

Link: https://github.com/KSPP/linux/issues/162 [1]
Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments

Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2a2a5bd98110bc70c2a164efb22df4147979d295..11e252a70f6972ed8527a0a70a5a3dcf37dfac31 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -230,7 +230,7 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_a
 		return 0;
 	}
 
-	buf = kzalloc(((sizeof(struct audio_buffer)) * periods), GFP_KERNEL);
+	buf = kcalloc(periods, sizeof(struct audio_buffer), GFP_KERNEL);
 	if (!buf) {
 		mutex_unlock(&graph->lock);
 		return -ENOMEM;

---
base-commit: 5cf80612d3f72c46ad53ef5042b4c609c393122f
change-id: 20250222-q6apm-kcalloc-5de0fc84c493

Best regards,
-- 
Ethan Carter Edwards <ethan@ethancedwards.com>


