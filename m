Return-Path: <linux-arm-msm+bounces-52446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D29A6F46E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 12:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 635777A3C9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 11:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20262566F2;
	Tue, 25 Mar 2025 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ffWRSv8J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F2C2561B3
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 11:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742902868; cv=none; b=kld/i+BR+C1gxRtBFDfXda/CF6N8lMZ8HLHZ3iTLZPFjJRDa7jCE+0fG38k5TDcJhCZufI5VUFPwClhpbOmlmErMHAEtQBgIOEtrY1oN4m5LxH1O7lRQi4Uov/ar+n8n8cc/2wgdo9RlSG6eX0wU5lUyil48kVsZWPSqlh/oZJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742902868; c=relaxed/simple;
	bh=nzVmJfufed+ekMZEjdRDlysNfkHvhI2RIGmGqRITGrI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uD965V0+Kgmtka4EGSO+vFu50ZSR//2UImZDWPcOncQSKPvqWXRHW1Rw2K23kLSzGTfbYFKYLYOY6wJ2STFGPVymNj1xBN+uPOwQ7eZnE5jePs5dn5p+BnLpRqWUh+K9hvbwduISXOSkCfWKFJw2QkjK7c2lgp7TJFUf30qV/kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ffWRSv8J; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so37598515e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 04:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742902864; x=1743507664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGhDhYESbCVLGZrKJ7EvUOhY/AIfq8zAGCvPtzsm0PA=;
        b=ffWRSv8J+GPpoy6DbNK+oKp1tY7WD4lq0zW2WzZjKmfy9AqtHmFqar8PY63iyhyqpY
         IJ3v31dtWrDJ8IGoUkGogdK1ezqGXD/4+8flP3qusj1Sdn4m4cQVmxmZHFm5Mg9VY49G
         Gw6+qTpu41rj4/dc3srTpCkgaV+SjikJw//DNigemL8yyZNXLVuo3u4/WVAgBYQmMial
         7WyPLZuIZjknB3KQTQ4M2Yh/oH1cqUaZh2lObK/ug7O5ouDCvXxoSOumxIlloOyQ5gGM
         j8AhfR2J9xgSlJkekOtSVcglrViP+rnDcwH2ZX5+YfSoO/wpz0WAJUCav2irLGm4l4zb
         SPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742902864; x=1743507664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGhDhYESbCVLGZrKJ7EvUOhY/AIfq8zAGCvPtzsm0PA=;
        b=RC67tuybMMb2eMI3945wybUW8IBTxeDD496bfIlj+stz+X+xcOEMxZj+3eF6Vl+exD
         hOGBb/MZt8GktiyVFc/iZhzOJe6Pnx25gEmCHOPPaGD0Tc1o50ctjGq6Qz6AianXe7oy
         6L39OIvb/RceuQue7ZSAAaa8u5i4ZnyO8xtRRD4PcBBGflQume0yoY7fRRhRHQv6XAl7
         DKSX7bT5nYw+xBqx1MgT1lHAaLstFwD8yShYfDxgmbmo8BVUWxNqezBr6knPZlwb0ymc
         8AbTcggO7mmTAb0tpOX7bIpwy4Kkao19SikjRb0yQCIbX9FiuZyKxfDah7EYSHefS3Bq
         0bhw==
X-Forwarded-Encrypted: i=1; AJvYcCViwruaowdIbanuTZh94uoOp1+v/J2DG8XMAxLaeCGG6RrDyfso/vclShxkUhZB9CkOCcOz+AHTJt6RH1hC@vger.kernel.org
X-Gm-Message-State: AOJu0YzARKeJIToGyLHuTQZPsaiBy1xgqxPEIn+3hp3kC/TjRyrMUOa5
	9d8y8aEOkrPRB/Nal9jfLmZlHnML3G399QrfdK1q0bQdhul9mwJmJuNuatBq22o=
X-Gm-Gg: ASbGncv1cYIMertNo7i5vjar0XRiydrn6f9VoRB5m24Zq7x/4ZaUodHP+Ukaa/a12/G
	ZFS3bSmhFtlkaMf2rmd57Ixobz1KaOcb36LCTiar291SoCNpKEOA8I8wYM65I3hxeAG9I3Rfp7u
	I6B9qrNs7SsFXjaY/QkgF3kYQRugQA0M9sSK5pg21/Rt2pkNRz/s1veO/k9XTtuLaG6Aeep9Ftc
	hNOS9TPnSxjIsoo47q/d2MiImYF1kQ6LRMqLL2v9XK+bEhAPilVXVth6GuyJk0UtWeUaUch4ctK
	JXDfj+Jwv0LOizFNSYnkGDEolaxfOUeNb5oi9N15PpJW7CJraAxFEAzKwFjqj6VAIhO/IQ==
X-Google-Smtp-Source: AGHT+IHnXTKa7PclIfoxNwdAn+abeRK1ZHaSvsObkxA3nuEMe8tz977mZM57XF3mqVcCCaA/t91RfQ==
X-Received: by 2002:a05:600c:5021:b0:43d:1c3:cb2e with SMTP id 5b1f17b1804b1-43d509f6788mr171568615e9.17.1742902864348;
        Tue, 25 Mar 2025 04:41:04 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm13213330f8f.29.2025.03.25.04.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:41:03 -0700 (PDT)
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
Subject: [PATCH v5 1/6] dt-bindings: mux: add optional regulator binding to gpio mux
Date: Tue, 25 Mar 2025 11:40:53 +0000
Message-Id: <20250325114058.12083-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
References: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On some platforms to minimise pop and click during switching between
CTIA and OMTP headset an additional HiFi Mux Switch is used. Most common
case is that this switch is switched on by default, but on some
platforms this needs a regulator enable. One such platform is Lenovo
T14s.

This patch adds required bindings in gpio-mux to add such optional regulator.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mux/gpio-mux.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mux/gpio-mux.yaml b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
index b597c1f2c577..ef7e33ec85d4 100644
--- a/Documentation/devicetree/bindings/mux/gpio-mux.yaml
+++ b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
@@ -25,6 +25,10 @@ properties:
     description:
       List of gpios used to control the multiplexer, least significant bit first.
 
+  mux-supply:
+    description:
+      Regulator to power on the multiplexer.
+
   '#mux-control-cells':
     enum: [ 0, 1 ]
 
-- 
2.39.5


