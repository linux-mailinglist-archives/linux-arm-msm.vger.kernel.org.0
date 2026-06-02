Return-Path: <linux-arm-msm+bounces-110814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QONXFubkHmomYwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 16:12:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BD53C62F300
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 16:12:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=rDidOvTd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110814-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110814-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 732EF30732D6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 13:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BF63E7159;
	Tue,  2 Jun 2026 13:59:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBB319D8AC
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 13:59:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780408767; cv=none; b=DGpCQ4YMg8VybkAwsKmPzhBTupBqOXZdpIgwaGAW0GUVAesHodoWCROUU23DpCAB/n08h+Dpc4mQw+iidnb96dk4vnxoZQz+qCmFZz2SD1kgdAIGoipwDiBuwdah7Wi2mVeI9/LCOkzRHulw8bKJ0OJLrfRs3DDwkv6LwHUMQhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780408767; c=relaxed/simple;
	bh=jHLJzttbBKgSP3b8emxFkW7pBsHdjYr4SjpKSIbN3cQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PxHW3FRCHUtk09jEyrsgONeo6Fv/WI/ijXFsB2NZi+MWmm/AKS6+RwejtPeQ/apVi8nYhse/VGjjGJG1fJfR+S8f3xpPMVaQvk2+xN7mxYf228o2p5xOAWqTcr2w9NpYc2+5xVyy5RNRyD8QReq5mrg2oTMV+UCgPzyZ0vMXDDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rDidOvTd; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490ac357c55so20810785e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780408764; x=1781013564; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ntGmS1r7qZz7Yt3+q7IMJ/TmsGLT+m13augHi6PYpE=;
        b=rDidOvTdOHI8MiX9QhHaGMfVGrEHKJIkaibOZYR4nFoLn+TAYNSnSdhexkCQMXD8pq
         BDJbo2kIxqJriZzoKFPm1ipdImbes22GRh6dlwrIrPGOs6UB6s6qvOi0LkQ0Qn1w2BSe
         NW5h7klAsM6YCl6n8/uZGWmWddS3eHC1OSIBWjLMXsqyG97pcptY+EgoDywG9EPD90CR
         0ZcM/ICCWQbdlCDGuKabbevvFkQ1pVoVz86YGSe7FLZ6CVxDoYQza3sMuYd8KK3cH+CM
         t4Q9YAL+bF/IdPT4UJcEeeQ4wkqnusKA9dRSQcwbCtxJFhm9icFDhqJ36xPedqyaG86F
         6XoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780408764; x=1781013564;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ntGmS1r7qZz7Yt3+q7IMJ/TmsGLT+m13augHi6PYpE=;
        b=Wu6oNPUd1DkE4nAJ2SiOoL86hL/Aro6pEAC0YQfxSMjbMvWBUEPBkMUqX4SKsyBm1e
         TSpiygJOb6hIDtWfyKsUI0F1g3ssYyNlpxlVLpblofmMrNTvahgzWuS5hWJITuW+S5KC
         WmKLBKZV0qS1HnP3GdFlXBzZVsU+P+4lC4p9lFohZ9/lEPuCBxHU8+FWB0sEOthC3bgq
         k3M1FgZdBLo20CaoRIzG2Y/Hn/DDSq2jIQK76GHVcztjrricFd1dPxG447YD03fEt1YG
         5CM7F756gPqEqnOYLk3UoPrD9NeZjZ2DLmmMEFwFa9ZehIoS/4PetRVqYb8QrFWX36+U
         rdBg==
X-Forwarded-Encrypted: i=1; AFNElJ/bYcUGMUDOw52SOZ3nvaCN+qeWVF+yCz623aLkKzx8Ko8fM+b93nXy4U9TrOacuOOtIOONWCyYvFVZbs7a@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxvdl7C3wTA/lac3G+YQ8SIFSUdH1x+FkIlNMyKRbATztgwWSQ
	3hR/XTvJ+4wivYjMuX6Pj1WpeELvhdJEefjX8emRvFn+V2B234cZq9E4IeSOshI49T0=
X-Gm-Gg: Acq92OHHv2jvJJR/ez/vF3e7l/vMSyHfTiOOHh3Gx5g5yJQa86MkEN35UZCE2vRNbqc
	IknOIDmiQWuIb4RTqyx5+ls/uWofC5p+6JqrtyIVyu6jDemCB/YnREU93ga2h0PAcZ1Jrv1JEkB
	3YlKhkavzYMGJ6tg5NjCBTnxFsc6aCu/ZQROcnLbUSLTLKhKEMvNVtwKbBIx2zw36fSV9oIzHli
	1ABswbslIlTng91Wmp1yqwNE0lybVD/MMMtxNi92fWeunHHTJo4NrsKHUYzs/KftLD3kZ6e71Zj
	dIwBiqTONEqPduQ7JtVtRjfUFpCndBlnLvALPArdkXzuwOXxdGeNTtwh28R0307Z7kpdrYTnjDi
	KAh/ufmx4+gsyN+iNZZf8vfmcnwnuGtI33+FwKK2yIfru7UChqMFsNTW/Z8ZzjcQsEgjQtQr/4V
	R3P8KA4AmNjyfJ++2ZgyplddzHL1LOGK/W5q1Vh13K/laC
X-Received: by 2002:a05:600c:3552:b0:488:78f2:6b0 with SMTP id 5b1f17b1804b1-490b0702b0bmr78788275e9.29.1780408763979;
        Tue, 02 Jun 2026 06:59:23 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.42.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0af2d6sm118070015e9.14.2026.06.02.06.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:59:23 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 02 Jun 2026 14:59:21 +0100
Subject: [PATCH] media: iris: Enumerate cap->bus_info to differentiate
 between encoder and decoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-iris-simple-name-fix-ci-check-v1-1-5ec9d0d00983@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTuQpjSoVxEX7fjHjtpYMlqE0
 rs36vLjwVvIkBVGx2qhjFlNn6mg3lUkQ5euYL0Uk3c+uOA8a1Zj03F6gFM3gqN+WJRlgNy5bmI
 TDxLafYhUHlNG6b//6fy3vfsb5PWd0rpuI7OxD4EAAAA=
X-Change-ID: 20260602-iris-simple-name-fix-ci-check-13f3f9c6586f
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2210;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=jHLJzttbBKgSP3b8emxFkW7pBsHdjYr4SjpKSIbN3cQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqHuG6tKOQdHYjCHrYMWiHw1dLU7cNZyKRopMuV
 v1Zj+3hiYSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCah7hugAKCRAicTuzoY3I
 OqchD/0cDfYAvJ1vdBY7ZwJEuj76iq/4fAc6YVN0+4Kk/0Ea8BUxHy0oMadKaZqQ1Awqtq+71J4
 WNHqVlCdb6lucLEwRY1d2G9AV/xinLGxc12ZzKpr4ZKktNxSxdWC2EmthYoqUDQcL8XJzW5xlET
 tX3DsAEnl27dfJdiJqv/HWL/6fcrk+9VarBr1q0UyMqCapFS3L06CZ39PhcXXDnhZf5kttVdP5/
 NI4E3XPna4hyIEP95vilDQnkBFGTwpZHwVUXGzmxlbkLG1I2nXWv1f2iPamxF2HII7zKz2Vrleu
 pcJioVydB0R036//vvWdn13KCv9d7jPt1YequVxsjYO5CBRX1vZggZfPd/6mIKsahdf622OJMK8
 Bbtz/knvUiiRhrYRjwlCiZ2K/uEKl2QUiG14t/YzLzm73ZpI5isFuRh0n1QPCYxqLc7kXewZ4Gj
 p9tl4Ec2+R08SkliXYvHPKHy35uMD6RKIfDNL1HcZWBwGu4IAl9K4dFQddXDIN7T/0LG20+bTEW
 qnn3ftEMJ1R7T1t0mlWGHMaJKikj1FaQxyFr0NZYf9UgWcTl3HVxpAIBkZ8zvU+E+AmgK6O9vRv
 XiuPQ377icO2LZiebTEDr/1q7dCT6lxZGuEDikeFfIu/Trb/cWoKOwnLBy/zHFX1ADwXswvWADv
 AbTxs41WxKXap0A==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110814-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:mid,linaro.org:dkim,linaro.org:from_mime,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD53C62F300

commit 66c744e28b69 ("media: venus: assign unique bus_info strings for
encoder and decoder") introduced the naming convention
plat:node-addr:video-codec{enc|dec}. Right now Iris does not replicate this
naming convention.

When we do v4l2-ctrl --list -devices we see:
Iris Decoder (platform:aa00000.video-codec):
	/dev/video0
	/dev/video1

Enumerate the bus_info field of the capabilities structure for namespace
parity and appropriate differentiation:
Iris Decoder (plat:aa00000.video-codec:dec):
	/dev/video0

Iris Encoder (plat:aa00000.video-codec:enc):
	/dev/video1

Fixes: 5ad964ad5656 ("media: iris: Initialize and deinitialize encoder instance structure")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
A really simple fix to differentiate encoder and decoder in user-space for
the Iris driver as we have previously and recent done for Venus.
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 807c9a20b6ba1..3105583cbdd1d 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -451,14 +451,21 @@ static int iris_enum_frameintervals(struct file *filp, void *fh,
 
 static int iris_querycap(struct file *filp, void *fh, struct v4l2_capability *cap)
 {
+	struct iris_core *core = video_drvdata(filp);
 	struct iris_inst *inst = iris_get_inst(filp);
+	char *info;
 
 	strscpy(cap->driver, IRIS_DRV_NAME, sizeof(cap->driver));
 
-	if (inst->domain == DECODER)
+	if (inst->domain == DECODER) {
 		strscpy(cap->card, "Iris Decoder", sizeof(cap->card));
-	else
+		info = "dec";
+	} else {
 		strscpy(cap->card, "Iris Encoder", sizeof(cap->card));
+		info = "enc";
+	}
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "plat:%s:%s", dev_name(core->dev), info);
 
 	return 0;
 }

---
base-commit: 6a75e3d4f6428b90f398354212e3a2e0172851d6
change-id: 20260602-iris-simple-name-fix-ci-check-13f3f9c6586f

Best regards,
--  
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


