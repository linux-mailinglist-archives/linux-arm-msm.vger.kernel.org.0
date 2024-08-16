Return-Path: <linux-arm-msm+bounces-28785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C62E39546B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 12:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 057391C20BB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 10:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE4818D64B;
	Fri, 16 Aug 2024 10:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ouZk3cDO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A1018D649
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 10:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723803836; cv=none; b=ua3T9/JgNwOteDRGeFIVrcv6G8CBkjmQnYK73PDF5Lc+4QVVs5VnQgt//hvvtBI2IbCxuICYlwuClD1es451s1S5vOPyMPKGuDH03iZkshoII1pPPggAFzyX932uDIU4PIbd4VuwiUYb9APWN2757d0ezbGESua9sGtcvqmccCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723803836; c=relaxed/simple;
	bh=CaJnOyQue3Q9Tu676JMyTm4MNNEAGskyDjAkRRRIYg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qFvLWQ7zGWoV4WC49cLOUSru3MbKhWlhxajrndylHXWBZo0xPDyCftO/Fw1pfCeE7/j8e03BNWJaYbIVdheSz3vTX7xS6stOq2f+SWyeU60llP9gUk2LAgU5fn0w0D/Bl7UYj+NVoFk2X6sQu0rYGKGerYbiwMtJuqXzegzrSJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ouZk3cDO; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-428243f928cso13080885e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 03:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723803833; x=1724408633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8cRa80QxztxjicJF5rsAT8pzK6md8mByVXGfDIWdXzQ=;
        b=ouZk3cDOOHNodxIrDRR/R5l3UsfoMdXWIVb/tAzsl02tpWp0tovuZp+z+TxygB7LtU
         lplfs0UL1w77wS2kPpVEjQMj3aN/8JU00EAcV/p9uSerJyQ/cuF3wrLtvevO7+F4xRkD
         v61YwkPaHnbl6okCQPpyTObDhKprMmGLwYHdrDDnMfalqjCvDOXynXr8kC2VScaz7SX+
         qYwIyl+XSIqXFsQEcjfsfWIBGHr+IfZIrNFPXVYtOV1OYtT0IHPKCGyBPbRv778j32C0
         UQ5pKpXd8tieAYwl1cWc1q8OWbH3d9kSlrjgOjMbZFW3zf6Gu+WmUK6/PZ49oVgyQKCj
         kCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723803833; x=1724408633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8cRa80QxztxjicJF5rsAT8pzK6md8mByVXGfDIWdXzQ=;
        b=YRRqSxx2GBfL+6tw+Jh1q3vUoZZG9hE4BFFRr2gR5mIsICm38kMhtoBxEGyr2xFvZ2
         ypTyQL90DyunybBBUPWzKplDJzR3eoIx4cYmOrbTPSl0XbSm0Y8SeefssrP1+I5tY1in
         aucGiKye7s7P0+VmZYzjlQXkgU5ao2YbGO1r5s6QJ6MlVJIiKjFAfvzVgfsyV2azLr8e
         1bGu7GfFy54LC+bguNzXzGStMUWP0o2NMqzc7X04iy23eU011VFOuY4yxAZWv/vIZD5F
         GJXDtpWYDfze0Wmv/MMc+RDbPPmgM6Rk1upTm4HAg7lm9LeTT+8EqwkA0RzqtEAfMV7o
         Knxw==
X-Gm-Message-State: AOJu0YwJE2aR5zoFy13HwuPyIOD66baZ0+acOc1PyYAO13LxdEsAPwYd
	epE3fcDFEzDdPCYWwtN4ge1x1wkN2umL7z6HDPt+RE5RgQ6MLpMdFXBCE4v2M84=
X-Google-Smtp-Source: AGHT+IHiMiemHA0HDYK7fUySNf6tNACiyVMdxfcXAwZ7wf3FKOLNNg2TYqApmadNe4V2VEmyNHOi5w==
X-Received: by 2002:a05:600c:35cd:b0:428:16a0:1c3d with SMTP id 5b1f17b1804b1-429ed7ae16cmr14655845e9.19.1723803832385;
        Fri, 16 Aug 2024 03:23:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:aff3:cc35:cd8f:c520])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded18630sm72650125e9.1.2024.08.16.03.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 03:23:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Ling Xu <quic_lxu5@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: misc: qcom,fastrpc: document new domain ID
Date: Fri, 16 Aug 2024 12:23:44 +0200
Message-ID: <20240816102345.16481-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add "cdsp1" as the new supported label for the CDSP1 fastrpc domain.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index c27a8f33d8d7..2a5b18982804 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -26,6 +26,7 @@ properties:
       - mdsp
       - sdsp
       - cdsp
+      - cdsp1
 
   memory-region:
     maxItems: 1
-- 
2.43.0


