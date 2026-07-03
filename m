Return-Path: <linux-arm-msm+bounces-116365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GdAzKj7bR2qIgQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:54:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D567040DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:54:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=tb2kYVKA;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116365-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116365-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAD65307CD34
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 15:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F65C2F7F09;
	Fri,  3 Jul 2026 15:52:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B5F2EA468
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 15:51:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093921; cv=none; b=a64CliEAv9tife2hWPD9Xjna4iEuwQOd3FkyFouDGQdbGbxVz7yKU8wE5Cwcwq23grTUQZEtkdtpZZ4D5ANGR57fwECQWgKThO8E5X39HL6yvu81J1G+mAEh8RaFddhu42BZLK0hUMEhRCuEEcR3/ChMTCybzB0oXg0jjTcV8NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093921; c=relaxed/simple;
	bh=lMEezlRl7UB8pNkOdE/LvPfi73YIs9Z7Z/E7bHKc93A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GDzEdHjXPliEjb3MjbfTiI1/trDH7Jx4JHRc9XRe4n8lV5uBdkY5JRv8czaYt7R8HRSicRJlTON0GKCgKRzFrkujSoYAJs6u9sPa1nyHJL89Z3jqADvoxx6OEVOMyJ5Kh4Q2fKlYZ4UrNF4xGDz5oawQOTL8hTlrRObb2BnYx5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tb2kYVKA; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b6f1b14bso3266905e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783093917; x=1783698717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBk6Poj1k6/y0ZxnA9P27hj+o9UIvkcLF1wC8BW5Ufg=;
        b=tb2kYVKAQADV56MR/OIaUCxvM+XBMsohaN3Qi5BHhbApXY9ztgRj3a5enr2MY18pa1
         mx8sSvLAu7KTQViy70BAPUmnQQ9CX/aEBZVuzFyZbSddp60l1bowxx3qT0Ss2v2g474N
         MsRTJ8kntU1VC1DHlNccC2h4wiHF04TGwiDcJV9xH10ly4C7ReEHfsf8I/U0sDkPa49H
         z+QTKsiBJ0VuGjiY+bp5xWZiu1Ep0W0f9qvWuW3ZXLUKiXbofUGCLn4aSQZ6e2I0Qzk8
         GBSS8C73N9cm4rxV8/9Fj+8Ml2git9O+CiUVyNHhBJyaJbergW5kglE1HQnGuZo9/5Qb
         X8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093917; x=1783698717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBk6Poj1k6/y0ZxnA9P27hj+o9UIvkcLF1wC8BW5Ufg=;
        b=FCjb0W4bII78sswpIG6QiLdATTVedKX02c66nv4MPKR1GXUk5Ez+hPG4Mf/N7uDlU8
         wGQbjXVybksLYrzD/KfQh41yzUYkfdcKwuqGUz12UVGMqUUQ8vw58ECeE5xdVrDUt2wK
         MoxqpltYSRAF0omAp7FauFsrTwpyMbNfLhWgl54epiB1jKSL4lLw58asy6zvXPzgdT4v
         KbglYiKV/NqBEDDvCoC+2hpXxaBwgFVbv/0kZ1T5bvqGyWfj/RYlresFgrk95GLJFVw1
         lCXWa0oHO1onMkx8dAckGOU0LCbl83OSynjQypa0QRfs0/TFrKVN0PySC/lFgBfPcumx
         4r9g==
X-Gm-Message-State: AOJu0YyxyylOcXjuvi3rQIc0qVzJaQ/QW+37h7fejJFoZaOcMLlODkiN
	zgQk+eQhFQkGbvIQU7sTwgblr9lG8ItdYnoldhIjZWIb1sq3VZ83qp6rHDSOsSagjlo=
X-Gm-Gg: AfdE7cnirw7fXEW5UeegjyXzyws0FDlVsDj9aQE3XgKAbVmGTKiabV1nMUYIXLH0bni
	NLgZ4bQ9j9k8R6o6hzfTLN7ZJXfQQn6wjDM86bXkoN1t4yBq/lkEA5+2g7mIyzgaEdiSxQ2uzAJ
	PbiXZWP3V9ehYBOQGGBz936kMQZ98ptaFzYNksij2i7acmCUQJcEQ9lfiCbB/UrQwG0Fw7p5YSr
	oVebVOKEZ97vUCigM9PCEmAOoqhMJpUPQvcWu9xlRDE7zvDxW3ZMGDSTRjKGFBvm6jckpGEjlwz
	ir/SJsv6jM2SQG3KZLDdcI7T+gTQonc3UquAB/GpOoPUZslvvTFJPPa3HcZ2LUpb4Bjc2/k06/4
	1/d14Jdv9tKOX/8WSeBNlYUo7azPfBClKRft83QaB1J6AzzVZ3yErV868qpGR0jr7pWTA9FIfcp
	wZ+cjFew==
X-Received: by 2002:a05:600c:49a6:b0:493:cb96:7658 with SMTP id 5b1f17b1804b1-493d0f097c1mr3391475e9.2.1783093917050;
        Fri, 03 Jul 2026 08:51:57 -0700 (PDT)
Received: from [127.0.0.1] ([78.152.220.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba97csm141294655e9.12.2026.07.03.08.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:51:56 -0700 (PDT)
From: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
X-Google-Original-From: Bryan O'Donoghue <bod@kernel.org>
Date: Fri, 03 Jul 2026 16:51:50 +0100
Subject: [PATCH 6/7] media: qcom: camss: Switch on ICP and BPS as make
 options
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-6-595df9e67790@kernel.org>
References: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-0-595df9e67790@kernel.org>
In-Reply-To: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-0-595df9e67790@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2086; i=bod@kernel.org;
 h=from:subject:message-id; bh=lMEezlRl7UB8pNkOdE/LvPfi73YIs9Z7Z/E7bHKc93A=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqR9qUdw/sqL1EwVcyotvmJX4pYXP7e3Hr8wFq/
 Pu2nPDDAK6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCakfalAAKCRAicTuzoY3I
 Ou9xD/9Pm444dRgXV6l59T2ETWbxdfNgvHfcZ5vMK6lKhmRKBGl65rJ5ire0kOJnY8NZpMZdV4j
 zCrZC/NMjSmNOBsK6IvosAlrvtaE11AlsZMawSv3vYeBrDvHdpsLF77Jt7Uf9Nv5unLGJkUZizS
 63X6pb1RqXqGclzs0xEryDZtb9M2HMdrzr2IuvyIw8EDJwyjhiKwmeRQgZ+wklPfUkgUZSv3V8A
 XxAFcEYpqPmlnzy+3EK7Zz7x98cr3IvP8XPx37+moEYDyYQzvW9NiEFMfQe4Lrul3rWZreFyicG
 +LYdqdBVfqHlvr+3tIdYKxVgMOyiclHWfjqQ+FOIwR5YmWT/U3LACtU+lv3YPsdyk2+KgB4YLv5
 cFpOFnO5HZQd2Ntf/3mANETMWAu9lg6Q8HpsHInal52K9Kz6VMpktn5erYBI3WLVj4jG8BLlF0m
 E42SFUG3XN067HqZNgOxkKghU9EtIEy25HMgjillMs/LTYYO9ldvouiB6Vt0XfSEJHrhlsgsijq
 2GjoxG4A5VB8diCuXV4WSI7fvoyWxXE7QlcUUYRGNa79IJJGJEAfNqp+NctzNxCB+FnBBzhHLAP
 GmWlbberksNQVaxG4HG5J2+7mKi7xhQzVPNObhaHVm3bp8p2HudP7BVFjchyXicVh2NH73hywgM
 1jBmPFw9avz0LmQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:bod@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-116365-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19D567040DC

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/Kconfig  | 24 ++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile |  8 ++++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index 1edc5e5a1829e..d62d5f6b383f8 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -8,3 +8,27 @@ config VIDEO_QCOM_CAMSS
 	select VIDEOBUF2_DMA_SG
 	select V4L2_FWNODE
 	select PHY_QCOM_MIPI_CSI2
+
+config VIDEO_QCOM_CAMSS_HARD_ISP
+	tristate "Qualcomm CAMSS Hardware ISP (ICP/IPE/BPS)"
+	depends on VIDEO_QCOM_CAMSS
+	depends on QCOM_MDT_LOADER
+	depends on QCOM_SCM
+	depends on VIDEO_DEV
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
+	help
+	  Enable support for the hardware ISP found in Qualcomm camera
+	  subsystems on SoCs like X1E80100. This includes:
+
+	  - ICP (Image Control Processor): Tensilica LX7 that runs
+	    camera firmware and provides HFI interface
+	  - IPE (Image Processing Engine): V4L2 m2m device for noise
+	    reduction, sharpening, and scaling
+	  - BPS (Bayer Processing Segment): V4L2 m2m device for
+	    demosaicing raw Bayer data
+
+	  If unsure, say N.
+
+	  To compile this as modules, choose M here. The modules will
+	  be called camss-icp, camss-ipe, and camss-bps, respecitvely.
diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 5e349b4915130..940af23da5675 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -29,3 +29,11 @@ qcom-camss-objs += \
 		camss-format.o \
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
+
+qcom-camss-icp-objs += camss-icp.o \
+		       camss-icp-hfi.o
+obj-$(CONFIG_VIDEO_QCOM_CAMSS_HARD_ISP) += qcom-camss-icp.o
+
+qcom-camss-bps-objs += camss-bps.o \
+		       camss-bps-cmd.o
+obj-$(CONFIG_VIDEO_QCOM_CAMSS_HARD_ISP) += qcom-camss-bps.o

-- 
2.54.0


