Return-Path: <linux-arm-msm+bounces-103637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBhhJJRZ5WnCiQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 00:39:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA027425B4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 00:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CBE663004C1F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 22:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D760A2FB969;
	Sun, 19 Apr 2026 22:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dmn186nE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585D925EF87
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 22:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776638352; cv=none; b=P3byYM+ougWIaKtmUHG8n1K2AFSf8DjcKvRL2dklxnFPD0I9qIfxFQQ59xePyk/bE7lksEztxqoTRpN1dTYdJJLKTj+yYNQgGcLSAgOM7rZB9y4vUeOx0eg2fV21iq9KFL0P4pDo+pc3xH9QL0VkM42q1ZDag8rLKHh3Dttr++g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776638352; c=relaxed/simple;
	bh=22Lj690Gzt9GJNADN9EbtC4X0CbXbhABySU67c5PTv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ddcOvHBIUt4iXmP0x9Su2w7FW12VC5wFW9qqWWvGzHkKvgJ5zDermXURQbTFcWzrYPJDsLo3/bnT8DNqcpmbxo5AJzFvgqkiXPq4SpnVYX3WD4wSEneIMaHJrDsblqtP7Ywu2clbq4DfpjvDpfh70Qoblv83Q9/sGu9/CDMKwQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dmn186nE; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d03db7f87so1457028f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 15:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776638350; x=1777243150; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQhdJsnkr0r1ZwZtJ8Tk3lop3elWReVVZAk8IPtXPWU=;
        b=dmn186nETOcsIMnL7sU3Wf/XSxap//F0ppIeezrpHq3OUkTa+vVn+Vb1/4mVjPYIwj
         q1UcukVAl3tOWKalP2IrEiOC+DzHBTvhuYTNM6QJG42iWNtT1FE/115rj3cTyC3VF0mO
         3YMaOT7n+LArjUEvSPuO4K37ZAKwgGkqKEEx0BBTaWBOybvH+xD4QSUqCACkrMOmc7Qj
         xGNDauTqZL+p5DNSfejF84WkKVQKJjPZcuAoqpAl6wA+rYfYiFGpkpz+CB7w73GqFEn6
         sI4kDieGtoR3gut7xo2XTDaPGEWEIWkELkPrC2gY389a+22vlqnM3FhZwhf/ClAurFcX
         nYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776638350; x=1777243150;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQhdJsnkr0r1ZwZtJ8Tk3lop3elWReVVZAk8IPtXPWU=;
        b=sjh3Zv19nPRePbwAlx/k3OMYk+PzvlkI2iqzaisx7N8QA9Z0ZQ2SXfuy50TMiLx7DN
         8Xz3KqHOF9ycPG+8iMwSNEUlOOKt+qaNeG3pOZeVfAlrLZ/B5cly1q4wQdDhbp9XqRzv
         7OudAk4tvHPZI0xOQaEr9H6gOd6lFt8bD34GsLDeDva9AILyxIfnqbKr5N8s+clvq1Np
         JbBeYi6jPPratlSPZLnBzbFkbkTYzJAHXatSkwQ85xs3Qz5/Rfz+JEfz4T1dCMG1ANtA
         2JFvPpQkwVpUrrWukycUyEfY7woLh5bAbyFnYtdPk1ShW4ufAD+5F4zhTtg/B3TKz1B2
         KsBA==
X-Forwarded-Encrypted: i=1; AFNElJ966WDoKABQagRuXsRjncOS/Fb0pi/PTI/cbGnf4ww+WP6q/yOCAC5iaTRLH+XG8wNrVvVYeAijZ8LtUwkx@vger.kernel.org
X-Gm-Message-State: AOJu0YwYkC0EDS39k0G57eBtbjhQ/HYd3BRhWQSbEVJxmFaDKC0lULQu
	fxon9cGJvILvV2folhtX7vKMbFydU3ANDR4w/RAM6dCCdisyN4xnDXiYW7HOD2mANR4=
X-Gm-Gg: AeBDietIKlbN1vIGY7+Q5VFsyklL1tznSozPqFimJMt+Q0tCe95kuOS9LVCik4Hy9fG
	71X6JiayJ57SU8sk8IKVWh66+YnQM7r6COy01c/t0LvTCtBgEYIa9UJCPf/+D9XNQMuzu0aAR6G
	wy91wLHKqmeFyRgWnVRjHs5ZT9GUINjzlks516X3mNKmupmZDOmDRBoZQVEec0EOs4/a21twsyD
	vimSphmunlKdmoPaZkfJpCXoIelV9DwEEMKYgf/q1Vvr+BnE0VBlfqHUHopPbe7aRvZTXhaUh0N
	QDxPeoqdBeQYvwKbZsvTfym1eOFe3kLhwKE8vPWJNYTodivhO+DQrFrZYQdSxau1WQDScvIBegx
	0fVCT56xfH6aC5hu8+ZEzYeGWWz/nHblKiU12aImwiRdTO4eW8m/qUVc2Okw3NS2Gl4IgnviofY
	XkRI45gZ2qCZum3JS2UyEoSkFZW8jQqzoZO4flLDejADDNs4jave30Sx1VQ+nO63nS6x7Kttbhi
	wIEM17bAKEi6HFZckpYb0c=
X-Received: by 2002:adf:f148:0:b0:43f:e413:f6fe with SMTP id ffacd0b85a97d-43fe413f7b5mr11668013f8f.0.1776638349661;
        Sun, 19 Apr 2026 15:39:09 -0700 (PDT)
Received: from localhost (host86-170-11-80.range86-170.btcentralplus.com. [86.170.11.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1682sm25088519f8f.1.2026.04.19.15.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 15:39:09 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 19 Apr 2026 23:39:00 +0100
Subject: [PATCH] media: venus: declare firmware files via MODULE_FIRMWARE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-wip-obbardc-qcom-venus-firmware-v1-1-08a0d3cf056f@linaro.org>
X-B4-Tracking: v=1; b=H4sIAINZ5WkC/x3NMQ6DMAxA0asgz1gKoSC1V6kYnMQUDyTUEQEJc
 fdGHd/y/wWZVTjDq7lAuUiWFCu6tgG/UPwwSqgGa+xoHt0TD9kwOUcaPH59WrFw3DPOoutBykg
 uhH5wZiBroVY25VnO/+E93fcPSK7RlXEAAAA=
X-Change-ID: 20260419-wip-obbardc-qcom-venus-firmware-abdd35b05a22
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1588;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=22Lj690Gzt9GJNADN9EbtC4X0CbXbhABySU67c5PTv8=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBp5VmH3F7n6CA1KM9RB//pKQblvm1Q0iLJgVD4t
 lm7KZCZJJGJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaeVZhwAKCRBjTcTwaHBG
 +DOjD/4tpb10t1YhrA+qs7WvJq0/OXQhNa8zxjbhM9pG6sDeEwBIOO2bY/QNJ6YyW5W74AV6teo
 OwOsD7HtGruOJ0g9XuAhEwNII0APkxpKnzfmG+1N/k1QIZTUEW0tzDZSF5D744Rlos65dIQvDnz
 PNGdJXDBJTyuYDVG63JBOQLaN+F2KFqEnxYblLzZEIcKC1e4HX36AHtC+6iByQEX3rHRVds0z86
 AGb9rrCUBHCCUJoJj0lzvbr0PRv1Q2DxU+S0OhHlCMyaTQggxmgJivIB/VGidipTqrfGY/020FW
 ElhA38DSTT9hZKQOsTRzaJ0bXIKm2/dwcm9AJO9WqvXPBux26vgDsqth3Shofrpqe8LJnVn/dJ4
 qvRurr+QoIlquJtFGank/D4+51jOdZ+U8iMSxIxTG9jsjBTYGICTDICYkYpW2ucYdKWNlglY+UN
 EI6TnIKwEbgrfpVi0un6gUwEcP5GLIApQ+Ii0J0xTga7Gv5knnnOTEOhIAq56n2waJdS6EoyzC5
 7nIbGXffJ/5j8nAm38a9fwNPS3v2AU5UlxkfIlskfYwRJIIXo5F7JyFGkTmeJwnNR/egUT4YZlY
 zHTx0P/3iS+ea19zUsK9AMx2ckt7SlGiraM68NWTh+I6h1MJNLgroUsjH14HIL+fenGMUE2i+96
 2QFbgKHsE55Wu7A==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103637-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: EA027425B4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver loads firmware blobs at runtime via request_firmware()
but does not currently advertise the possible filenames. Add
MODULE_FIRMWARE() entries for all known firmware variants so they are
visible via modinfo and can be picked up by user space tooling.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..7ed7cffb333b 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1119,6 +1119,16 @@ static const struct venus_resources qcm2290_res = {
 	.min_fw = &min_fw,
 };
 
+MODULE_FIRMWARE("qcom/venus-1.8/venus.mbn");
+MODULE_FIRMWARE("qcom/venus-4.2/venus.mbn");
+MODULE_FIRMWARE("qcom/venus-4.4/venus.mbn");
+MODULE_FIRMWARE("qcom/venus-4.4/venus.mdt");
+MODULE_FIRMWARE("qcom/venus-5.2/venus.mbn");
+MODULE_FIRMWARE("qcom/venus-5.4/venus.mbn");
+MODULE_FIRMWARE("qcom/vpu-1.0/venus.mbn");
+MODULE_FIRMWARE("qcom/vpu-2.0/venus.mbn");
+MODULE_FIRMWARE("qcom/venus-6.0/venus.mbn");
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },

---
base-commit: 4f5b4b748ac75683d61c304ee3ee0db235e8f312
change-id: 20260419-wip-obbardc-qcom-venus-firmware-abdd35b05a22

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>


