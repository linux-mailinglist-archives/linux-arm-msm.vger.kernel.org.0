Return-Path: <linux-arm-msm+bounces-52343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 252E0A6DAAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 14:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 042563B0743
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 13:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D76025FA14;
	Mon, 24 Mar 2025 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ans7DUZR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD16D25F979
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 13:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742821275; cv=none; b=eHZPnLgooqK1AhKvJQO0JZ7tcR5cTgivkRK2l+ZUT8fc1CFogIlpPMN90uOC3dWPHKtHGtKAsmb9ziX9JLszGg1evAorSR/HybA3XZ6oV+Je2N/OYyzSW/iE6+wCLorHDtTFCsedKgXQIyKPCMFUq+0th7zPv7OxzRlh4DcPb0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742821275; c=relaxed/simple;
	bh=SaEurHg9my0SgGDfooWj4uP1HnHehhMQjbSphU85xtU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ut+hCSRzQkICuHYqy5YXerwv9sNTnE/Og8F+FmT6OPwJB4h63vkiRti53H0ry4LAO/Vi5/N5HQ/g3GCKrMvF40QbYRxZTVPWbE7UEu67LMY1uMUlJMuV1rhFmvVcDP3XXawU5/VVSQLWTKVAqHmkmqg+ayYOtsDxnKhcvIJCGPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ans7DUZR; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3913d45a148so3525399f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 06:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742821272; x=1743426072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZ6QvHirUebkLT0cLpo0Lkee0nQc81mUaPIyQl+HrrA=;
        b=Ans7DUZR7qXgluMtEIn9P64PZkNjsyxvWBGuWYRTGRpKPojYSC+tH9ThvN56z13Y7t
         FoMtvrwDuAGRtPj33qnkvOqazL7LfiJi4lq0qKI+2lFTx7aHrXElIbAfSGf0bdgLc491
         oF5FlkYpHgki7vIung1WuRiEwoB+WGko2vGnv54UBUqfbk6VkduALElcJtx+tGbfR63s
         B6mBC1Z/P3lroJjQh2KZKlPyZB2CE5XLgJBnQKLATrobbFexLzab0RcfEcAwpwXw9oay
         w96vtdEoqL0rIYhm88JZoGO7ZYvgXHZgNc9pohYI7O56DnG9MaiY3gu8TXqm1GpFka+N
         qiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742821272; x=1743426072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZ6QvHirUebkLT0cLpo0Lkee0nQc81mUaPIyQl+HrrA=;
        b=JHYNdYH99Ga+iIHO/Wf4BGbZDqorkdVJ/lW9OGIS8bXr7G8Sc3sWUPnuqheC2I6QlW
         OaSG4x8NN/oOyRIHoVCK442KLK0mqOVpoAmMVN1LYW8VkY3gIhfM+4OALx5DqioRUcGl
         YdMx+P7VDamrBDmclcAUYlnc1nbHJSQLURmsqX/yCtXQbuWcwwVqdP+UbHq6XpiSkdBg
         a68EIf+KBeiEhF8w06Tj6EIkHhNMmlUQ3VWzyaCDVLUV6d8xr4ysk0FMNrtCi2zX/Ncy
         U0Ker1faAistLVU6v/+YDHzOqjtwfg5nKM5Md6nOSJqzq/XSqS0U4oOzHy3FEf9P5Rr/
         TDag==
X-Forwarded-Encrypted: i=1; AJvYcCWVggX1jpx8cDvPTb24SQhUKhq8/6MSjaQaT1Iu7IsGMFQUYMbkzZcQ5/nIpiaEyTnJzHmjfSEbVGePY6Kn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2KOuc3kC0DO7K0Zqbv2bNXV5BZ61yhpTfbyhrXKXSgHMrBvpZ
	QntSHUrLrHmRBXC21AmjjBPhFqOWZ3eOwFCQPsqkmJFknZblrasdfvGgu14MVNs=
X-Gm-Gg: ASbGncuo8gb80qG3LaYc2Hjt/nF6VwuoXRh9MePzAHpGdr+zGdcljaNv50TJnm3NAAj
	gYVamD0NZxeS7LTCFeEk83gXEowbtZaJR9ulmiN+W42ZFjQsQFsejprnK8f5dpHsS3xkjyEeP88
	Bmvek3246LQu8ksy5FEAPrQExP7o0gmTa7BZ1uy1pQly6zrAf0nTe66ZbIzcLWtkcO4piKxcPmg
	KZgaL8+3P80TsM+66nKRB1IrjqyNxDWsdt030/+go82H1lY0NUeok9Sx2zmIbiLEOnuHsg+HD+O
	xhasVeQSxI1TCCVrjKMP/3udBXej0TNtpqSA0RxPXRobRdMQVrkddM7D1r86pCZE0OEXyo18SU8
	dWZc+
X-Google-Smtp-Source: AGHT+IHcZdjKo+W60+E0889CUCSjzvCnQTNGHROcaLcw11SC7gzeWcB55np64KwhSuLoUJuyekwy5g==
X-Received: by 2002:a05:6000:2107:b0:391:3d12:9afa with SMTP id ffacd0b85a97d-3997f90391emr10016304f8f.21.1742821269598;
        Mon, 24 Mar 2025 06:01:09 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbd1c7sm122275975e9.40.2025.03.24.06.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 06:01:08 -0700 (PDT)
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 4/6] ASoC: dt-bindings: wcd93xx: add bindings for audio mux controlling hp
Date: Mon, 24 Mar 2025 13:00:55 +0000
Message-Id: <20250324130057.4855-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
References: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
index 10531350c336..ab1c6285dbf8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -23,9 +23,15 @@ properties:
       - qcom,wcd9380-codec
       - qcom,wcd9385-codec
 
+  mux-controls:
+    description: A reference to the audio mux switch for
+      switching CTIA/OMTP Headset types
+    maxItems: 1
+
   us-euro-gpios:
     description: GPIO spec for swapping gnd and mic segments
     maxItems: 1
+    deprecated: true
 
 required:
   - compatible
-- 
2.39.5


