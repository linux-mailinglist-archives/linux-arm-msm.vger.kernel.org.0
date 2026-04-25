Return-Path: <linux-arm-msm+bounces-104537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKVoBJIJ7WkEegAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 20:36:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E5F4675E0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 20:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1F483059778
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 18:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B614378D98;
	Sat, 25 Apr 2026 18:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhL0F4Cu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6163F353EC1
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 18:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141899; cv=none; b=Ep8Fgi2v70p1Dviue0tPspCyYguhj/msJFGkY9F8qP9bghzTezytoTHq4Nqt7ykiWgSEmadgfyBKOVIwB1cYAgSAHwOdMC0dirDIv+TDdPAHzH8yashF30/b9/YTO6VVtwth/pVmDPAEN6PqO9Xz1HCA8m0vZhoth2RDQbsX1hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141899; c=relaxed/simple;
	bh=tDAlsKcDHucm0PMV2skHLBx8pgweOOd/KInCPeBESn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DbGPYHizK5xd/qQT90JQzgW9dgVayVXizeRbajebMQZoG8URBxJKipGPDWSSZ2tqxpI7wVwESrvR+Uk1NVeUoN6v+jN4Nkc592zPQQF+TA2Sa1MhkVe4kxfmCC7BYbv4Sx2YfjkmFlHz0MHrvYR5NnB7ggMdj7NHbQyFusP5qXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhL0F4Cu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488d2079582so104052425e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 11:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141894; x=1777746694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVSdZ3ozKGtw/DqweO5GvX1Ke0Cy808rQFC/VvXkjos=;
        b=bhL0F4Cuhij0g00JTwrvocAdkSOsjDTaw7hE++UVsu6HLQ2jaiXFLNITMyMRikYCNc
         jIdO5qepEk3mZWXEfgsmOGE9UMclCvh0KkCE7dXKKSB1U7I/pdm90MfKXNd6JHSmrcyS
         MSi9xzVoGEfbEqA5i0nOnFZwsjl6k0g8vK3K4yxw6ohmiRPKOjvskA/r9XsUMnw0Bs1x
         nNEsqw3K6BivPUV8UbLD1trTmIknRA7OrrsT77HUo4f5t2woEaAFuYy7s8oYLcTpiHeS
         VYYB70aSec2M/ka1sbtSgdHeUpJFPkUhk/BeyV4CvfY1cLeGClce36RUmmWjQz4tj2cW
         JnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141894; x=1777746694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aVSdZ3ozKGtw/DqweO5GvX1Ke0Cy808rQFC/VvXkjos=;
        b=ZiPNca29d/qP++dKDkVmwGj9J+AVFDExSnk2OZ2biESAGc4t5I/71K7kYj/U5+z7Fu
         pJ5L3HhO/xnm5XicnhMv4IXWeYPbPEqVDaSIjxPXRWaB/YsgScXiwrMRzIVNNw6Krf/G
         t1fuSAlx9I6PyS2lb3YsSYXv/w/92uux+wd7RGJqVFKXdoEoOpWEFjpatjVxI8s1HTBu
         Rx3iGFYeDHNlleCqQtcnbYHeJDkMsvUgzL9Irpv8I05Hzyy7sG50BWCl9t6JJ0t58S/f
         fkG3sRd8bTAlW4O/uxBZKkaylomyTfMGMju4W6JPUvQKXJIxLUoV5ZsyPLUfsT5I1aoH
         EzVg==
X-Forwarded-Encrypted: i=1; AFNElJ+6Cw4Fa8VMdTzlIB/+N9AhXHF4HWontsTz1KVfZv+S+4zmEyoldjVaXYf065/D1QTAAuJhWWuV7zY6MFSz@vger.kernel.org
X-Gm-Message-State: AOJu0Yzin4fdJME7hkgwL6vNjrWuwBDUBj+fR0mZralExaOwknOjDpoQ
	6iyXWWS+d7MuWVEiWG3qy6au4Wj+tZH0+cLlt7WcTLqunEAJirn6SojB
X-Gm-Gg: AeBDietD2nvMVcRWiIG9PelRnHhEm7kxm++8IP52abFp0B5Id3KsK5N/WQlwpX1juLD
	9QFUhAdMq4WQv0o6OPUysOPjCdmW1fHQkPLzBahFsDDK9U8bMMuYzM77F6jwCJUDE5A45Wgi+30
	88GD+bN/YYRslmWfv1meVdH4fXuBiSgZf/L1lPJhynO/3H1BZ0dBstRt4v09LwkUzhaTDn/O6YJ
	UJDrrpVC9iB1fGS1begwEmV2dq9jpkZLyhNYWthC3LeDj3GTehQz3Jccrmvc/MXvR8nunyxvjnC
	G2dWomC061YH8O91At1Q5EsRREszS4w+4l95oOl4U0AMbPrXfzLcSBkG2B+QGituBX0MuMcKJyB
	La7RvcDr0ZBWKfHcmnUD4Qo0QSxodVu7yA0zBoXf9H+6+gxBjhlvPUdFRJrF0sEWJwoSIBx7sNM
	tDoLQpXnvoQRKNjz9zQaXpz+zJsb1pcwNpQNc=
X-Received: by 2002:a05:600c:1993:b0:489:e696:836f with SMTP id 5b1f17b1804b1-489e69686a7mr348688125e9.10.1777141893727;
        Sat, 25 Apr 2026 11:31:33 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:33 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:09 +0300
Subject: [PATCH RFC v2 08/11] media: qcom: venus: move getting vdec and
 venc for later
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-8-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 89E5F4675E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104537-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Call vdec_get() and venc_get() later in the probe so dev_dec and dev_enc
are initialized when getting clocks and power domains. This allows us to
attach necessary power domains to dev_dec and dev_enc.
This is required for the subsequent patch which adds power domains for
HFI v1 and attaches them to dev_dec and dev_enc.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/vdec.c | 12 ++++++------
 drivers/media/platform/qcom/venus/venc.c | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index daa8f56610c7..a4aacf5e535b 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1792,12 +1792,6 @@ static int vdec_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, core);
 
-	if (core->pm_ops->vdec_get) {
-		ret = core->pm_ops->vdec_get(dev);
-		if (ret)
-			return ret;
-	}
-
 	vdev = video_device_alloc();
 	if (!vdev)
 		return -ENOMEM;
@@ -1817,6 +1811,12 @@ static int vdec_probe(struct platform_device *pdev)
 	core->vdev_dec = vdev;
 	core->dev_dec = dev;
 
+	if (core->pm_ops->vdec_get) {
+		ret = core->pm_ops->vdec_get(dev);
+		if (ret)
+			return ret;
+	}
+
 	video_set_drvdata(vdev, core);
 	pm_runtime_set_autosuspend_delay(dev, 2000);
 	pm_runtime_use_autosuspend(dev);
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index bf53267cb68d..5f6844d3d9d0 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1568,12 +1568,6 @@ static int venc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, core);
 
-	if (core->pm_ops->venc_get) {
-		ret = core->pm_ops->venc_get(dev);
-		if (ret)
-			return ret;
-	}
-
 	vdev = video_device_alloc();
 	if (!vdev)
 		return -ENOMEM;
@@ -1593,6 +1587,12 @@ static int venc_probe(struct platform_device *pdev)
 	core->vdev_enc = vdev;
 	core->dev_enc = dev;
 
+	if (core->pm_ops->venc_get) {
+		ret = core->pm_ops->venc_get(dev);
+		if (ret)
+			return ret;
+	}
+
 	video_set_drvdata(vdev, core);
 	pm_runtime_set_autosuspend_delay(dev, 2000);
 	pm_runtime_use_autosuspend(dev);

-- 
2.54.0


