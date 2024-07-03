Return-Path: <linux-arm-msm+bounces-25058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 665C492571A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ED0C28201D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 09:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191F81422B4;
	Wed,  3 Jul 2024 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYN6Dsf/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B99113F01A
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719999782; cv=none; b=Xri5yB84Y+RaAn8nBzIFJVNaOg2al3WvvDm0wFwFf2MZFt8k/jBszgkogupdZbsNZB47yCLXRokVRD6wWCCpkUZSRBZ18Mim+NWcUt/DStCrCrR7/BO9cthCAonRjFX2LT5c4O4fgbViNEJffBSdIgn4RcRagnSrU1R3lgKoqMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719999782; c=relaxed/simple;
	bh=xi1mYXDi2Ujb+2Jpd3mF9lwbKV+pBoSnnqh1EQ2jopo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=orJIYJoNCebcoy6zAvaXvUrXBK8cvgBC3pjYND8vCSViL2FzyO4nA7PsZeAYnh8pqvi0tB3nOPMEHDRiajwYSNbp1qed1Mmo1bFT+hWy1LRHdKrtPYoxYadHPTE629NS+485Ehd1OBfjyUVITIm6WNNqwhLnTbCTvbc9ECVdoPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYN6Dsf/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42573d3f7e4so34613255e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 02:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719999779; x=1720604579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJ9yEubK6nQZcmF1Fd1PJ7crkziQ0G5lQAl3Cg7RXd4=;
        b=jYN6Dsf/vIiO2atDfVGjubJM//i3YXUf2W99sZ/mX0XVteMpNHhLD1x80/SC0R7vsz
         cgT+dOnpQhnsNqp35Fg17cHp7e+8M0mZfb+zpRZ8lKfVjEg3roTGR9AXGYIVZu0IC0lS
         rZzskuoyLOXoUeG8G8S0vbXWJTRnj854YxW1RY80eMGd23ePJCUPAJXWaxvqt1oXL28W
         GDYi22RH3mzV7Yc69GfC1kr/OOVQuoVKcgOH4awB10B0gyRA/YE0yWy8HJnT83w/HCJ4
         DCszkJNEwsUOvXsfIW0pluQknF0SpDPYWXYQ9D0RQRs43pgYnIy1Ws3stLGgLUUF7o0h
         WmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719999779; x=1720604579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJ9yEubK6nQZcmF1Fd1PJ7crkziQ0G5lQAl3Cg7RXd4=;
        b=lu3vjWkptJL1uYWdHx/9Jefd6o1vygcrCUcjHnNuCVQBFKIqGaf4N8rnKcNpb00Oyl
         ySqzWJrmLPWPvC3DL6+M35owwmAIeX0q20+SBq5krnxuRLXZ0eaBo8PzqmJPLRXA7FVE
         /kBBkB0U0kGN7GEjb0Gp6vJYxANHUP7mSVXCmsDl9y84L0nH6pNeHE+Y3JABnX7b4N8U
         TMm2DJpRqTvppA5VcM6BjWKSkA4FB7dSGEsVCBnfQEsOOQGNS/kNe+DY6piRLiQQzGZK
         92RdpSIsDH4TXsKludKXGBfpvmXkqz2vAw3agJmC9ExP5D1dcTrhUxNKVw0xjYg1LXeZ
         yMNQ==
X-Gm-Message-State: AOJu0YxbhKtgpcV4AT20qdql80DAHK7DdkMUnArG7hhKoQfYRppyMDsn
	PY5SSPxflKVQJxcXmqOgK2pwU0cqJfMUaSTYnIXGAVjjXa+UiSahdZD7br5VqLU=
X-Google-Smtp-Source: AGHT+IEz/oufuXWx2hMPprHshGaK+rfrUD2zHGYrpR2jyMXO/HMOcgcTp7mp8IYi68R36onkTLyYPw==
X-Received: by 2002:a05:600c:33a8:b0:424:a6ae:a25d with SMTP id 5b1f17b1804b1-4257a03aa57mr80741845e9.24.1719999778638;
        Wed, 03 Jul 2024 02:42:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a1030dfsm15341394f8f.100.2024.07.03.02.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:42:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 11:42:38 +0200
Subject: [PATCH 3/5] soc: qcom: ocmem: simplify with cleanup.h
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-thermal-const-v1-3-6e59e139c65d@linaro.org>
References: <20240703-thermal-const-v1-0-6e59e139c65d@linaro.org>
In-Reply-To: <20240703-thermal-const-v1-0-6e59e139c65d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=xi1mYXDi2Ujb+2Jpd3mF9lwbKV+pBoSnnqh1EQ2jopo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhR0Z8FIA+vE9wJWcgTbRn9pBuP8u4C9VMI7Dq
 hQTgI9y9XiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoUdGQAKCRDBN2bmhouD
 13ziD/9XiwMQphwEh0MSBUOKdtCYETK/7KQlCOmDHrxh5UTQExKpzpA88LBrC0WVNPzC+ar7kYH
 J38kU6lO3XjwsQ8cJoDOUw6mgma3ayOF8gWMU7RjjyEwjZERO81cLgRGaZHtG7MVrTbaTWv2Z7Q
 6PCOBfHWJxQYslLPQoUX/PV64xWn94AUq71qDFDULrX56L+5dkSK5EFc9+71p0gRRlYPbSaKG+u
 Fn+debhtWgFXrG3M15IUS0dLtTqyrwO8f7rUxPw6cvZcXY7SXwstw/eE6bBrINOkCSr0r7NY/q8
 MkdvQdMkTfNDNv/IdOTmHYUGVeMOQNNaF8m3dWvUG822wSPEpGzL9W0DnmwgoT53fRHFTmLD9ct
 BySL9MCzQ/I7JU6Pq21OLI8jaxoxhq7xzyWy+YhaOrhTA4A6IY+hV9NxpfqoAScVFsiEogneusc
 xP0m7f7/YJuTtCEtjonUmYKrD9OPlICZPGMSwwRmk7kUgEh+rjKtY8ngHL2KVNrG6SsT5UFq+NI
 h4z+ObLdY3GcoTs2q6jwtSVkBqLZE53BjP1ek9akpD5T1B3V/gDgdlG0Ii63v7U2eDE5bu7ONyU
 7ZuzLiO7mhkyVu0tp+pz3+eEJsxsmD1OxSPFhoJYkv/zg01bjwhkBrQ/BSviGnSLN+dsWAk55If
 K2P6WqZ0r22Xm+g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Allocate the memory with scoped/cleanup.h to reduce error handling (less
error paths) and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/ocmem.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
index e8841d247953..6b6dd80cbc0f 100644
--- a/drivers/soc/qcom/ocmem.c
+++ b/drivers/soc/qcom/ocmem.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -216,7 +217,6 @@ EXPORT_SYMBOL_GPL(of_get_ocmem);
 struct ocmem_buf *ocmem_allocate(struct ocmem *ocmem, enum ocmem_client client,
 				 unsigned long size)
 {
-	struct ocmem_buf *buf;
 	int ret;
 
 	/* TODO: add support for other clients... */
@@ -229,7 +229,7 @@ struct ocmem_buf *ocmem_allocate(struct ocmem *ocmem, enum ocmem_client client,
 	if (test_and_set_bit_lock(BIT(client), &ocmem->active_allocations))
 		return ERR_PTR(-EBUSY);
 
-	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
+	struct ocmem_buf *buf __free(kfree) = kzalloc(sizeof(*buf), GFP_KERNEL);
 	if (!buf) {
 		ret = -ENOMEM;
 		goto err_unlock;
@@ -247,7 +247,7 @@ struct ocmem_buf *ocmem_allocate(struct ocmem *ocmem, enum ocmem_client client,
 		if (ret) {
 			dev_err(ocmem->dev, "could not lock: %d\n", ret);
 			ret = -EINVAL;
-			goto err_kfree;
+			goto err_unlock;
 		}
 	} else {
 		ocmem_write(ocmem, OCMEM_REG_GFX_MPU_START, buf->offset);
@@ -258,10 +258,8 @@ struct ocmem_buf *ocmem_allocate(struct ocmem *ocmem, enum ocmem_client client,
 	dev_dbg(ocmem->dev, "using %ldK of OCMEM at 0x%08lx for client %d\n",
 		size / 1024, buf->addr, client);
 
-	return buf;
+	return_ptr(buf);
 
-err_kfree:
-	kfree(buf);
 err_unlock:
 	clear_bit_unlock(BIT(client), &ocmem->active_allocations);
 

-- 
2.43.0


