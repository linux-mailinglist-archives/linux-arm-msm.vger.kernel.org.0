Return-Path: <linux-arm-msm+bounces-52083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF52A6A59C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 13:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0445248342C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 11:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF9A221DBA;
	Thu, 20 Mar 2025 11:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ifyhp1oR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6C0221564
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 11:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742471808; cv=none; b=jh9UTi9nVnia7iYg3nLVqUCccVf+pYxaHtGRzQJwz0HImnaWJ76CyEJdE9GrPcqJbpxU5LERRqUP1YsJvBSnqCjAxOH6cdJJjtCSaaoh5DBsVUyCaQqEDIh2yDZA3ypcAiJ5z+2NlgAOfw1IdFMKxksLoM0iYMzvssxYHV6vNVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742471808; c=relaxed/simple;
	bh=4AJV0s7mSzqRnod0IJbbhHfzS3X7gQWivXwTjoNldIA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=InQhCKZ4vYmZhMbShXxsJwlfOHAe3T8BJ0XqGmLnzuanLdTcl3MyD67O84MmOfzACqQF7ocHf4MvjH4yJv+am3FsiZHntOGS0DuNrmxzXDFQOwkNxj41KpEsCBIngmG6u+q3a+BXnnK5fhRMMpsqVzNotzVQYEV6bSbbhTwcKKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ifyhp1oR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so3040765e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 04:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742471804; x=1743076604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBCmNhzniHSIN+wQEnk2+nLTiD4hT6KTCngq0hI3lqc=;
        b=Ifyhp1oRnnC4sN62R/WptYeQvZGEUBpVOp9IwgCL0J8Vbdffj5mff+BZtCOQ+lZzcx
         Ve40B7EKCfFRP5gtqLTHBYTOHjs8B2LGIUNgHgoLX3koqGe77jL6oZw1obd3U2cwKslz
         PIzq+RqYnlATD9rqzv8+n0jzuY9RLPe25dVoViMDxWhln+xMBtMxOO7GlJtxcK5FZMGS
         nt3iy+W7AWV2lAjt7EeoEAj4TqdaLx8TMuA3FUSA9MH10NDOblmLp7BnOcMjLXLUBJMF
         hmSjEcQdNG7BNO06qQfDGndDp2MDHNqoo7G3sns2l2JAYNko4km5Q+9+NJKbaW84GO/p
         hqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742471804; x=1743076604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBCmNhzniHSIN+wQEnk2+nLTiD4hT6KTCngq0hI3lqc=;
        b=qdrQ3Xx97VpfJqvKF+oJ1Ml9U6EiuMGkFSNn9NlJhsBQCetUXffpv3HC6+4PZK3McL
         59SJCUzD+400Fk1khdbX6VIw1VnlOHvDdcI8OTraNkMad/xOOX1OgF0tI3z5ijhQicsu
         WSboMhm0wLjdRaev+GUxmI+k6FmQUKbP0uu0Q4POvB8QmvMGq0bSJdX87tXrSifmLRGs
         rjTxN6Rm0LTCTS7EXJ8ookNSNbSKuFLfGDxXLZyrdnB6jwvislNw9Ehrw5ErMUE0lQ2p
         asEp+FB+T32vcUr7k8lg6kgtyJn2NRVDJqBiNVh2Ujjrx8wqe3/ZgZ2RtCSzGnbjr73t
         2bmA==
X-Forwarded-Encrypted: i=1; AJvYcCXSIdyEP47eh0wjN0FO8sDRfCGZECpZjiGfBFj8JQRVdU2l7X8zmeagrjapG8iFOkKaoYjeHjgltNpcVOUo@vger.kernel.org
X-Gm-Message-State: AOJu0YyyoTSiZwdsGeQmeCXMabKSdmmtYw5BHLO3DyKxk2hjtzglfZYe
	kQEAqOk84Miiq7uju6iT9oP2VO5hxdksJ91emqO4OKEzKZbbp0nFtJTyrLPhadE=
X-Gm-Gg: ASbGncvOG4ys4VQhDMQwikuebX9w6IE5ezu7IgMAivB++jVvISwbAsfDpuH19ho44yU
	7VAV9UPRakOUqSc04wmey4eRheDUPLF/zZwz/K6sfu13LSm2hfr1tcYuLAr7wSBEs5vOgqr/Blb
	2Dd5QW9SGC5k/seBM1Cf3Q01t12YXQ8EG4WNy73viXLbt1huYkEwi9Wey7Je4v+lWgIJoYQ0Vn4
	OmNtzj6UEU0GHm68UDweTKr/ir6n5qqZeETD7QPftBls++4DYFsy0i32VGQjuaDWoSva37jqTVm
	XgQfUoBth0YLtnUCSfcamMPl7X7G+8wTb3DQ775fWnphzrx9sbDpyKthiGMWxfdPndVsyg==
X-Google-Smtp-Source: AGHT+IEr/g/3zNNGsPb3MI+p5RQqCRdJkhbtB0m0pNpWH0rWHF6Zo3XyME4aG36BJnRg/WaBJjs9sw==
X-Received: by 2002:a5d:5f8c:0:b0:390:e7c1:59d3 with SMTP id ffacd0b85a97d-399739b63abmr4972255f8f.2.1742471804493;
        Thu, 20 Mar 2025 04:56:44 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c888117csm23257857f8f.44.2025.03.20.04.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:56:43 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 3/5] ASoC: dt-bindings: wcd93xx: add bindings for audio mux controlling hp
Date: Thu, 20 Mar 2025 11:56:31 +0000
Message-Id: <20250320115633.4248-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On some platforms to minimise pop and click during switching between
CTIA and OMTP headset an additional HiFi mux is used. Most common
case is that this switch is switched on by default, but on some
platforms this needs a regulator enable.

Move to using mux-controls so that both the gpio and regulators can be
driven correctly, rather than adding regulator handing in the codec.

This patch adds required bindings to add such mux controls.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
index 10531350c336..e7aa00a9c59a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -23,8 +23,13 @@ properties:
       - qcom,wcd9380-codec
       - qcom,wcd9385-codec
 
+  mux-controls:
+    description: A reference to the audio mux switch for
+      switching CTIA/OMTP Headset types
+
   us-euro-gpios:
-    description: GPIO spec for swapping gnd and mic segments
+    description: GPIO spec for swapping gnd and mic segments.
+      This property is considered obsolete, recommended to use mux-controls.
     maxItems: 1
 
 required:
-- 
2.39.5


