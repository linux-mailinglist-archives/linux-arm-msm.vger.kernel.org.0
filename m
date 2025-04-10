Return-Path: <linux-arm-msm+bounces-53818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8B3A840DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 12:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EB7B7AEC4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 10:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE78281376;
	Thu, 10 Apr 2025 10:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gnqMRPJZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C56B26B948
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 10:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744281447; cv=none; b=cDpfhIGs3dNZg+iUSQ4NflRDZ61V5U+42p54SZXfrn+PV9RgXosO+PTfJlTGVYys00O1YiBl4WKYFiHFLu/cqlGH6kUUyvp61Ailyju7vksXSgwofcBuHMyu9rAPlSIN4/LB6Pnxjunb5Mp6eNX8klscOx2iJT4kybZxEVeGHxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744281447; c=relaxed/simple;
	bh=g82gY1xhxcNU1gWfdeY5y//QX6zBB8SepcGIdHSH0QM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WBkuCGU2DZUABz50Dyj/dp9SJ4P9l695uPSaEKiF7S8SQjmC9KrnhirJ6m9kUDnmuOJD5OIluPye5i1VVd2O3SzjawTlmByxCqUzmBFaFse/B10CU3epk/nSlw5XWIZd6HiD6egJzzTC/V6EuFPvjX/1dB0shr2Yqm5S/dwLVBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gnqMRPJZ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c2688619bso330602f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 03:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744281444; x=1744886244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Nnbd5v6TVKVB045KCik5mojpozdPs3L2r4qsLSnC+U=;
        b=gnqMRPJZo5aP7o1vHEGfuK3h1pKekorBctl3L/20jw5ufFR2kDHg9CL77aSlk8btZw
         b1LLvj2qG+E6z6UCKjvhxuosRqEWrU/Da/S5l9uNaG/YDMCxAS5KeBx9np1OacMzN0/z
         ohYwwktv2wLlUT1/glp3j9pQTNlXqBXlpOnNwsbtzMk+veCXv+IxHoJb+CNP7FBu3f6/
         +9qpsYJMVDJgAhtjlO7VgPPCqZ6tYZbFksLZQrhXuDorsctfwaQ/suycI5+MZKtPVsKS
         vWL0UIC4Em54EyL+Sk6rA5388WFyNuPSu6p3CqtvrzoqRDICwRMdTE4dcTimLLgKrsLe
         8pmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744281444; x=1744886244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Nnbd5v6TVKVB045KCik5mojpozdPs3L2r4qsLSnC+U=;
        b=QYNcKcH6qjgqM8h5QhXRhBBnyzGL7SNCbkxRLHSriWEhHW6TKhWMLPnuchB75p4Lgz
         YawNygN8i0k/AqdJg0LM1WMnaj/d5K5EsOLvUm7D8AGWF9ApT5x3ntrcKysZv8vu3wb+
         ac6O+L5EbYGr/XjVNlVSq1on8A1m3jc3pRXBX1Hm8UB0kfI2DLaHYPbPOBAIArpEocBM
         xMM5XGurbVclWqtd2J7IJUo9pIcuFJ77lRVho87FaSdCWrPb6XOCR1+LdTzG02xkH0q7
         h7JGx/4HqhBHhQTs5PS6Yy33Qb1pSM9Yw5kSnzo/VyvcW6tCs7IRKRmQndkq9qXGPX5b
         s7BA==
X-Gm-Message-State: AOJu0YzMXhmn9wSWaHif4I5f7lhIgeHW4J3NEUo2EBgyo2b5OpzQAD4J
	L8zVJ5wI9cj/WfGmgB8YHio5pIO3sRq6S9Er2HMA99QLZKBfk+nVN1R4XqG2Kww=
X-Gm-Gg: ASbGncvKx4leuhPlI4AtV0Rb0Kv6EFpfIkeyrTjiX5WI6yc9fWFpQ6RrqEhYVY6VSrb
	ZkKISU3EYQG95ukBfDvf/zJ05ev654keuRTzGMBh9joRzdgvmQ8PF5+P9ZVEX5D4teGVgSIvLaq
	a1z0SyxMbs53lF9XQcDB3N7r8rGToetsr8JisYJBn1O5aOkuIeOHynajgSHsghcGeR7iT6Mvim7
	kbrxX3OZCshy5iSCsM8QMJB8sdosL2QUDdU7jtxULg0meH9jC7KtQJQv36R0WrK3Mogo5dkxbXO
	uDfu9+WpyRdvrUL29Y1JRZc9pItaBFxHQeVwEOoNwc+O/ietNdk8w2AcMYlUgGTrvA==
X-Google-Smtp-Source: AGHT+IEHtath/9fjeA3GlI+26reTGsqkfkI9JQfy2xnJmqeyhEm1jWIGOX2/OQqJlhE3Dk/VrZDbzw==
X-Received: by 2002:a05:6000:4383:b0:391:3157:7717 with SMTP id ffacd0b85a97d-39d8f491bcfmr1794974f8f.34.1744281443890;
        Thu, 10 Apr 2025 03:37:23 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893612dbsm4309388f8f.1.2025.04.10.03.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:37:22 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	srini@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/2] MAINTAINERS: use kernel.org alias
Date: Thu, 10 Apr 2025 11:37:12 +0100
Message-Id: <20250410103713.24875-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250410103713.24875-1-srinivas.kandagatla@linaro.org>
References: <20250410103713.24875-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=X081G5b8ZJlECnTTMUpLb1rMWL1BAhU9ovFKI7eRRN4=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn959YJ14iAJU7//C7aknncCha6Mtq08dvOrWyn /HNnuNGqKqJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ/efWAAKCRB6of1ZxzRV N3txB/9AnD2EaTyqWg9hTGWre3HhXjm+e4ArOy4+kihuI5qZt/0DIFRwwhMl5TagJHghVSfRqDI fgFMaFEx/F3yTAb+6B7jGn9MWe0GMteRQL/MysODm5+PBjeuYckxpEUsO9hcaI60xzkXcVzUGye a4vxJ0ozhUaROwiAPId3n2aPFUfHG/ko8X5KCSLrFCF5QRBOy3A1apUomNvdN4MhMoNTY2QRpWO hUih2OClr3o2uTC2eYmSNAw/FhE3tk2WpA3g53iMViuSRvQrVgTrm6ubCUZL7g3CHEF3mk6fuAl 2zu6QU2DVNut+mt8rwLSWlEwmydhaJP2VaekFFSSeVeuuyse
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

My Linaro email will stop working soon. Use @kernel.org email instead.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..f9a9d3dced67 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17368,7 +17368,7 @@ T:	git git://git.infradead.org/nvme.git
 F:	drivers/nvme/target/
 
 NVMEM FRAMEWORK
-M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+M:	Srinivas Kandagatla <srini@kernel.org>
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git
 F:	Documentation/ABI/stable/sysfs-bus-nvmem
@@ -19573,7 +19573,7 @@ S:	Supported
 F:	drivers/crypto/intel/qat/
 
 QCOM AUDIO (ASoC) DRIVERS
-M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+M:	Srinivas Kandagatla <srini@kernel.org>
 L:	linux-sound@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Supported
@@ -19873,7 +19873,7 @@ F:	Documentation/devicetree/bindings/net/qcom,ethqos.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
 
 QUALCOMM FASTRPC DRIVER
-M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+M:	Srinivas Kandagatla <srini@kernel.org>
 M:	Amol Maheshwari <amahesh@qti.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
@@ -21921,7 +21921,7 @@ S:	Maintained
 F:	drivers/media/rc/serial_ir.c
 
 SERIAL LOW-POWER INTER-CHIP MEDIA BUS (SLIMbus)
-M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+M:	Srinivas Kandagatla <srini@kernel.org>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/slimbus/
-- 
2.25.1


