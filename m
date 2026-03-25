Return-Path: <linux-arm-msm+bounces-99946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGBHFKNMxGn5xwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 21:59:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D3232C0CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 21:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60F7330066A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 20:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D152957B6;
	Wed, 25 Mar 2026 20:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNC7nu6f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE71371D1D
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 20:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774472353; cv=none; b=JfxCxp3YmgS/fiomrqs5ok7s1JuElKMAqUb/2yntXx8MnPcFlBf9koQObzF1NqgSiO5OB6vXeLlGLgJU1cMkqusH2w9mt4zriCb3MtyI4jBDBvLm94nm8DigX5/XxgJlyGa18fNpMTvD7GEEpciGBwfQFccsaM3UD5HOtZeifl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774472353; c=relaxed/simple;
	bh=OMqepNNi4k2gJtZUunl0zH6/viqlOmaZWVSdvq6mCaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Sdh9NlCE3unFnPyZsX31vKcaOPrFlPCdMdotkV5w6uMrqpfrxvA7wOAbw0+hRa6/U9uQtXscn12WaCUoxIpPxYblWCTZychA1vBdesCtrco2et6qntbx8hKqMXR877IrInK4vZ2wS6EhPkw5en9xQH9ePIUq4iJ1DFuY9tqTFJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNC7nu6f; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8d0089138f0so4446385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 13:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774472351; x=1775077151; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UcxN1+YGyk5SOfq/pCcmueMhLewrBa4a5Npnjyh8K/o=;
        b=TNC7nu6fOKW3ghOkyfU5J1ENcXrrvobjt6FS0qfXShSwE2qGOKvcqQUQTcqBG/D4Gk
         pjghGLNIhYRUsHWlhMZz9Uw0AoVRa158GdZUwDzOmeSa9N9zhivYDix9J6kweXnbsCn2
         elaDV9VhAHHqNahXkbjGCBGoOxp37VsLG6yq8W06zSyBmhBTUZkQng6lwY2GIHG2x/1f
         am5+TPHgTXWafPwLrisir54SsMc61ZUwk2ImBZQjLLvGNOc7bxoZ2OIRYSlVNYzNiMVx
         bjsrY0ai02GRkV0Txwlk5fhSXFRbycqr+GUPztrZwzCsIo4aXgZG5RbU9VDqI0KsKhKC
         OnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774472351; x=1775077151;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcxN1+YGyk5SOfq/pCcmueMhLewrBa4a5Npnjyh8K/o=;
        b=s1MYAiUVF8mPqEFArjaunArPNMr2gcy1Wm0sf2cBlsFcIQDMH4s97bttvLZ+VZkHKf
         cf8erIOC5RYVIRxxerYPuLXXQysS36lH1Ng9HUfFhPgbPeoAoevs9wU0vpJZIrUAMsBI
         FDfxyE0sefq52ZvA2iViOB0IkzjqeXC3oVDi4BnhmvaZ4USqt1PxaXijLLllwESO1oDD
         bvV2rUEEb2+exzmdzRPV3r1iCWPRCIej+byhp6fcsLomS+9+PgpT3QEBkteYgQR0kNxp
         3TJME/zfz+fh2x6dESO6GUIqUu1aWR3MZyvdyZsBe9KyXJizVrwbTIHRqDqZIfsAzENd
         I2NQ==
X-Gm-Message-State: AOJu0YzF/GxF/ZILTnNDnGiZZX2wlCPs2rB3Jwl3WoZQQcWDGb/aNieG
	08YILZ2Y9qlS9sjvmpFqqKwktQ8mHcI61YiZZMl5rE76SzWCgtdy+kDI
X-Gm-Gg: ATEYQzz+/0raDyCgsBPEXrkf9gKVYEdT9pyiNQDWduvO0nse3OBxf3uWwTr09cYLpSX
	YD5fLgi6xDfl8SSOBXXN2JSirfTwAkX+S6xuaPWqP/yIXMCOtnhShb3PlD9C1paUQpku6ke4QKJ
	5sojXBu4qkygCb6z4MxN4ne30OruDUr8jphexRbayZUlw40etVVwYlMyePPHvBJ39BUJBSSJ2c1
	6rCPp27ayhvQ/B31JaamCVhEJnTxcuIoSa/KnFRCf2kklSut5fMP6Dk4kgVeUkmwvt6BP8imWx+
	yYha21GUfmmzpeoylgnfkHJue62sJ0Qm5wvsN2yLG4xfiEYZ4Nr7Xa1T5cHZgwH/6YkhsLGS6Nv
	gGExT12bSSXxNBosTegjIsEvpDWmcHBF1pc7u3HLksmO3XHycxlCUlw4P4ccOyhjfL9HX81eU/L
	kHHlwpPVOPEn/QRdKQZ0DezWm/CA==
X-Received: by 2002:a05:620a:4706:b0:8cf:df37:4f97 with SMTP id af79cd13be357-8d0010fadc5mr560312885a.7.1774472351093;
        Wed, 25 Mar 2026 13:59:11 -0700 (PDT)
Received: from [192.168.50.55] ([67.243.142.39])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d00e532cfasm79548085a.44.2026.03.25.13.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 13:59:10 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 25 Mar 2026 16:58:37 -0400
Subject: [PATCH] drm/msm/a6xx: Fix dumping A650+ debugbus blocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-drm-msm-a650-debugbus-v1-1-dfbf358890a7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHxMxGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNT3ZSiXN3c4lzdRDNTA92U1KTS9KTSYl0LA0NDyyQzEwNTs0QloN6
 CotS0zAqwudGxtbUAQnMc92cAAAA=
X-Change-ID: 20260325-drm-msm-a650-debugbus-80119b64056a
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
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774472349; l=2027;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=OMqepNNi4k2gJtZUunl0zH6/viqlOmaZWVSdvq6mCaI=;
 b=20aMOCBhd3e0A8fwyna49ooZKCvRRkrMUNZ83wKTEQvpYYviGaFCZjOgRwkwXolqTYjTisao+
 cehsZ9r3Z6oAxRt9ROK1IjVSM6jycDwu5WKbM7cBSd/VfMiTcna6SQA
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-99946-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cwabbott0@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E9D3232C0CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These should be appended after the existing debugbus blocks, instead of
replacing them.

Fixes: 1e05bba5e2b8 ("drm/msm/a6xx: Update a6xx gpu coredump")
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index d2d6b2fd3cba303959bd037b60796341315079a1..9699a5b4754628023b67f0eecafcda728953e8d2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -361,7 +361,7 @@ static void a6xx_get_debugbus_blocks(struct msm_gpu *gpu,
 			sizeof(*a6xx_state->debugbus));
 
 	if (a6xx_state->debugbus) {
-		int i;
+		int i, j;
 
 		for (i = 0; i < ARRAY_SIZE(a6xx_debugbus_blocks); i++)
 			a6xx_get_debugbus_block(gpu,
@@ -369,8 +369,6 @@ static void a6xx_get_debugbus_blocks(struct msm_gpu *gpu,
 				&a6xx_debugbus_blocks[i],
 				&a6xx_state->debugbus[i]);
 
-		a6xx_state->nr_debugbus = ARRAY_SIZE(a6xx_debugbus_blocks);
-
 		/*
 		 * GBIF has same debugbus as of other GPU blocks, fall back to
 		 * default path if GPU uses GBIF, also GBIF uses exactly same
@@ -381,17 +379,19 @@ static void a6xx_get_debugbus_blocks(struct msm_gpu *gpu,
 				&a6xx_gbif_debugbus_block,
 				&a6xx_state->debugbus[i]);
 
-			a6xx_state->nr_debugbus += 1;
+			i++;
 		}
 
 
 		if (adreno_is_a650_family(to_adreno_gpu(gpu))) {
-			for (i = 0; i < ARRAY_SIZE(a650_debugbus_blocks); i++)
+			for (j = 0; j < ARRAY_SIZE(a650_debugbus_blocks); i++, j++)
 				a6xx_get_debugbus_block(gpu,
 					a6xx_state,
-					&a650_debugbus_blocks[i],
+					&a650_debugbus_blocks[j],
 					&a6xx_state->debugbus[i]);
 		}
+
+		a6xx_state->nr_debugbus = i;
 	}
 }
 

---
base-commit: e4eb11b34d6c84f398d8f08d7cb4d6c38e739dd2
change-id: 20260325-drm-msm-a650-debugbus-80119b64056a

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


