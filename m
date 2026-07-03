Return-Path: <linux-arm-msm+bounces-116361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tgYYF97aR2pvgQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:53:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFD570408D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:53:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=yjiNcwQo;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116361-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116361-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2080930409D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 15:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6538A2DCBFA;
	Fri,  3 Jul 2026 15:51:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616502D63F8
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 15:51:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093916; cv=none; b=i0o1IBQN3y9oino8qI83Z1jSyi8KZNfgg/7LGrCPoj04LyjLeAzv5cjyET0Bitw/RvRCw2pEp52k7N+W8kNYkOkTgKGoNM1Vp8Fimo08yfcTJfnXkNZetFglCt9UXXPOAmYuR2JhqoNlzzvyoqj69Rre8Nm8enU7hWDAzJy/6TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093916; c=relaxed/simple;
	bh=AWNdcWNoO0K/4Dz81ubcB66iaZ7bQRNg/Xv4aHd0AIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WavOiwcTOJFc/J/+ol1sBGHtKbajB3HzKT1ohBvdR7djZqs2TOE4mYj7+J4cU5kZ6+Movfqc8oijrpAUKyR0XWFexwSwQV6O5cCYVyoVJsSVmxvGLrQDNCYzWB9xiiyzBILoe/oxolfX2RMokd+u9XbT1+iKInT0DYzpRzzugkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yjiNcwQo; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493c00f74baso4421735e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783093913; x=1783698713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VTtyezqOtvqZjLO782drXUWeSl+rKs7UQO/GpaFditA=;
        b=yjiNcwQo/yMGQfecmtvWh6EAICn8WMfINjA0fsIhMh1F0UxNTBH1WOcztDN9NGdcEz
         uM/YnacFtxM6vws1JSCP9keRrQ2O4gogKRXKe/4KsYilUO+X7kcl941+hjL95euo90xa
         VR2zm+nO5hhTgpNYqDYgWzlVUr/3/CQy8GWUANlYDfiyTgtU3y3/TPW4OjyRf/ssGOPZ
         FfYhDzaH3Tw3Ht0mxMyB3GNq9g3CplKTcj0fayP8yu+fpW1wxCUulXg3+2D1WJ8nmq/C
         PBduil88C3xaCtZh++G3f5DD+W8wnezaNGW6Y9k8IBccq9qOO3BgwITV4604zCAT0EoU
         +xPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093913; x=1783698713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VTtyezqOtvqZjLO782drXUWeSl+rKs7UQO/GpaFditA=;
        b=gQFFsBtqVNuumEnzPjI7zzaExajkivaDLWLGcUhvQkJfhF1euSB/RkdwRWo2NH+Lk4
         MTU3mY5f8ITX5Kmmuj6t0ToZuucJ4CRDZ/OBZOUV07udxt2AozQD01/VGNYYFy+OFTQ3
         5o7jiCKCg0HasytS3vXJ5zw0CDPX7r7PyF2x3arCm9Q/qxfywIzNhrRVtCjlcdTrmUbS
         D7z3bfjEC5v76j/cLJAxooTgulD6X27kW6uPtWMlLRIdyVlVTODyOFtxCtU69eh5Gb4Z
         otVkgagmJwzb+S57HzaqIWveVxN5quhQt1SsZDK7w1zTD8EOg/vxMao/CbZgjtcXuV3y
         +S+g==
X-Gm-Message-State: AOJu0YyMBjqTrlVFnBqxpZ/maJX5A8ZnKRuHPMhTfhlBzyx/EPX4Bmyd
	JSljmVGnunUZKQjkZas2e605na1qv/aHtQnXkN/nJ1IW5uW59PZUn3dkdGzEGtLdQ7k=
X-Gm-Gg: AfdE7cmOu9M0NIHqyn4XBg2zmWTVayNDSRGIFkVkN+X/Gr1X2gxxIAsU9kjTJv3vNQC
	GOkxrMT2bXGXs9dgub6UjJAHgRpFGee8F+ItWWnKgHlUjUt3BQCCpt/zHu/0BfGWmW5kPnea3YG
	XWGA6tXp+H/txkEQlPRSujz9VYVhB++V7r/afCZdpQ+zCekfFcIqW1DtVN904qbdUFQKiuGTyzy
	EY6MjDNYPZo2pNIC2vMocKHGRTBk7WH5QjnoFGFKLS06CQkVHJbUHZ0cowul67Wn+mAE5LQQ8EP
	sFRvpB/dL4dtqV0sFPtoa0NU+G2BcXE7mS3Boy/IHvzzUSk9P9p5VvqyucJhpGxCciQoH6hfaOH
	GF19Tlpq0EDtzEzbVjAZkbIHO2Pw4n/uNZ7/S1asH///kf6L5VTZsZ/sxgl2TuckrQRoZeseoqL
	TVs6s/mQ==
X-Received: by 2002:a05:600c:4c97:b0:490:52fb:12dd with SMTP id 5b1f17b1804b1-493d0f0f406mr3259965e9.10.1783093912871;
        Fri, 03 Jul 2026 08:51:52 -0700 (PDT)
Received: from [127.0.0.1] ([78.152.220.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba97csm141294655e9.12.2026.07.03.08.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:51:52 -0700 (PDT)
From: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
X-Google-Original-From: Bryan O'Donoghue <bod@kernel.org>
Date: Fri, 03 Jul 2026 16:51:46 +0100
Subject: [PATCH 2/7] media: qcom: camss: Launch ICP from CAMSS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-2-595df9e67790@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2301; i=bod@kernel.org;
 h=from:subject:message-id; bh=AWNdcWNoO0K/4Dz81ubcB66iaZ7bQRNg/Xv4aHd0AIU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqR9qTLhQZXtVwPg5ioGs5M+J83wpyvYvCSE79J
 tuIY5NO/gqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCakfakwAKCRAicTuzoY3I
 Opa+D/9PRXVkg+cgf4LLsRa0XMrBKj6AU3EA9ubS9ReF3r59bMcKWaOJD12W40yC1M6Mwh0EuhL
 FbIT5RT0fRsZFZDf5Mn1/uDmrbGsKjXeInLVBE5UK12Q/B/g8urS4rQkLAK0WeKZDi8AdcHUk0i
 5W/aDtHQi+MkeDgcFTFNOgx4FgzFQRmMQvyW/noecLz7EFIxL6V3S8t2AFyD0K/qagP+FttZPPn
 TkkutgWeIJHVaDUN/g62f/EReaqnbRyaZ3gyD4IUpGw0BN2sjykEoyU0IZbnFdFLmczqdMEHJzA
 n/lQjWVwCsOJX7uHEJp1LX1HrIM5mK8ypXP/ddQk1mQVj54EDEFqk6hEOdh/m8NWGgQGw/L41/R
 RhsoYrouIJ9fNDqOW5kY2TFhT0Fo7e3soTlJa6gXKcE0otN04oaK94qkIcuugLLdW9mqnR/Oy0v
 vk5laIa3wUIpuuJWcDdMRQ9NO514oSD+aDmLGxQAoxFVCa11RCdDsF0Ce295hSINf+aJT2pTkxs
 aWPqPBY7zoKrOTG8xGX02CckCrcijV+73xcbWwdwugeOHcKKZ2Rs5YeIBeDj2eR+yOEU0JFncUE
 s1M/oBLTXn1fk9meoEndd7E2OYGNYcTtvQ66XuTVLah9HEt4+RST0YxxMTExguNz4C/fwAomGt8
 20Gi3U4Rl5toIUQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	TAGGED_FROM(0.00)[bounces-116361-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DFD570408D

Launch ICP from CAMSS.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 499e349aa4929..eafa8a1eaaa36 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
@@ -4962,6 +4963,15 @@ static void camss_genpd_cleanup(struct camss *camss)
 	dev_pm_domain_detach(camss->genpd, true);
 }
 
+/*
+ * Match table for child nodes that camss.c registers as platform devices.
+ * This includes existing nodes (csiphy, csid, vfe) plus the new ICP node.
+ */
+static const struct of_device_id camss_child_match[] = {
+	{ .compatible = "qcom,x1e80100-camss-icp" },	/* NEW: ICP node */
+	{ }
+};
+
 /*
  * camss_probe - Probe CAMSS platform device
  * @pdev: Pointer to CAMSS platform device
@@ -5043,6 +5053,23 @@ static int camss_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	/*
+	 * Register child nodes as platform devices.
+	 *
+	 * This includes:
+	 * - Existing: csiphy, csid, vfe
+	 * - New: icp
+	 *
+	 * Note: IPE and BPS are NOT registered here. They are siblings
+	 * of ICP in the device tree, but are registered by the ICP
+	 * driver since ICP needs to probe first to provide HFI.
+	 */
+	ret = of_platform_populate(dev->of_node, camss_child_match, NULL, dev);
+	if (ret) {
+		dev_err(dev, "Failed to populate child devices: %d\n", ret);
+		goto err_of_platform_depopulate;
+	}
+
 	ret = camss_parse_ports(camss);
 	if (ret < 0)
 		goto err_v4l2_device_unregister;
@@ -5079,6 +5106,8 @@ static int camss_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&camss->v4l2_dev);
 	v4l2_async_nf_cleanup(&camss->notifier);
 	pm_runtime_disable(dev);
+err_of_platform_depopulate:
+	of_platform_depopulate(&pdev->dev);
 err_media_device_cleanup:
 	media_device_cleanup(&camss->media_dev);
 err_genpd_cleanup:

-- 
2.54.0


