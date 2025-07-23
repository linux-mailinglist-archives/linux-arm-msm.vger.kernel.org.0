Return-Path: <linux-arm-msm+bounces-66321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 606B4B0F4D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 16:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53D9C17CE91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 14:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534592F2C68;
	Wed, 23 Jul 2025 14:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="G+hMqo/v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2582F2718
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 14:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753279452; cv=none; b=lo2Ezgj5By4HQflS4nXDxXJ9VVcnir6+TCYIPjxjil69R9gAOhY/T2K3FZuXIzimGpvtfEXHSno2wfvZXZczLHxXMCi2EZJ/b6KLmXwQ44tCAQKIOOBceuGRwxfwWZt5xdV3Yos9t8ennzr9qWUP9f7wfDTOSsZFgz3z69BlatM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753279452; c=relaxed/simple;
	bh=iFrv0UOBrWQDOMIVYCVEkyIJ0o38UILWsfNE6sREkpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E6OLHXMg4fLXU0XQDdEYj80wqUi+GYDH16ylBCpZxDq4ns45C00ebTLXh2Ibl6ymaRcHusl+stJL1x86lB9dXzcJGhcn8xYkW2K6IS+Dn0HC8wgGBJs0map4HDGv0/Yby0Y5m1XZYdS+Hm1ql63Jdd+TpVZaXtUFpHt2nIVTkp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=G+hMqo/v; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so11937665a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 07:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753279448; x=1753884248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIayvnL52YWH7X/Cr5CMXwZtJGZyuDUcKNZ3PxwKQms=;
        b=G+hMqo/vNEw56CMZ2SofiexvS8vVbsxq+zeSEnAWJFNJK4+tVGgJoAZuOy/t9EOjNv
         6D6cdLkm8tes110bKGEuoLyFhbeWRPVzDwKV+ubTf8JT29smqb6LjDXhtixgo1fPtcrc
         TZCk7hZTdvrRMJPBAFOI4+jZjFiJT3NxG6NnuxulPeDAkjpsRADqJw/rTVyklPq2dwYC
         ZGIwoi4UNcVY1nJm0180ZBoKj1t3EsFOtA1mWl7ztghaBK+PHG1WE/SDmiZ+ehv1ADE7
         ZcaytxTrSsd8NAyV1w5fwotJByOyjqLfJTA7BrrIrOANIC/jKOxV47CCt10Whwy12mju
         FwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753279448; x=1753884248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIayvnL52YWH7X/Cr5CMXwZtJGZyuDUcKNZ3PxwKQms=;
        b=DQjF/aw5jh0522LC/sU08XImDVJK3AjDNdgicspzcL3l4fsOM0kMGP+2D1eYTowgqW
         Jwx5dfNXj74co17bd3nFHoiUMebJBhJxHrREU5RZcF4GZuv+5RVAaBJi7JL20fs7E9yc
         eWorEbBN09dZoNVsuyUuSAXlpW6ClSpGFI4c9ueF04JUAmMza9g/5bHow0xlOG8rk9Bu
         13kp3MuyNecaBKtaruTZ/PqjTSJro1G/pQO5WJ7J0US1YKZGVxS4Zh8u5V5dv0oenRhD
         muPMp0sxLI13tNPh+WPTI4FHz4Aya/Ayc0hI/o8rVj7p2lrYx882PQ02yb4XZ8bS1s+8
         XDow==
X-Forwarded-Encrypted: i=1; AJvYcCWDVJ0HzegQmFQWEtJ59jhP61oM/3ge6W0uD0ueDAi0nX9C/UEqtT2F5JP9DY4AEP8Utemtyx6CUTnwrOCZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzuzRT7EXl2jeiqTT9mLptGcGu8AAM5J1eky9mpunMiF4D3LDOT
	viQEsoDH9MrZ6JbAYPw0mG0C0/aIC9PTx9lw9zjXjACeGoJ63wVWBVB2MEfZXK84z6IztjEK7KF
	O/WqdVDo=
X-Gm-Gg: ASbGncv6uK1r6TLujRkZtWU39ZvK0pMrD4vRu/q1VOfA5JFd9ETHqmOzcfsQPi8LSAk
	ZOEhIJIAhEZjqA+yrhAy1qgPEIPUwYoNDiXQAyMW/+BoTL0JhO34M9EO6dvtlvHAFfPAxSbeu4A
	TyOUUV+4zvLDocszDe6x1i/xqUX9SglpaS++HoTYVkdLha9Un/osWMZUp/rJMNxSOUIUPIN/CLd
	TC/yO0kJSXrwtCxIv0vnZiTwPnlxB/vMX8JwxiCzBoJfvQ5O3XfNErpcdz33NotlXn4d/Lq6pBm
	dDKFgjL2s5xZ0PLjF8u1TSp57xEoKm9TNgCNGfdcPRFGW2V6gliUS9mgD0ebV0umtAudFIw9HO/
	pFwV9oxRg+Q8JLYkBcTU23qg4nAKvgdEfrUa8fp4C78fRT5DDMiG/YJOn69jZBnHg7ehO
X-Google-Smtp-Source: AGHT+IGR6BvCSuwozQuhF+JK63ZdSllhSvwjucskJLyJAXnOTc2Yf1K6fqw2IyjVv7b8YJWo3DFKzQ==
X-Received: by 2002:a17:907:9813:b0:ae6:efe1:5bb5 with SMTP id a640c23a62f3a-af2f67dff36mr337902766b.7.1753279446731;
        Wed, 23 Jul 2025 07:04:06 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d46ffsm1054830466b.42.2025.07.23.07.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:04:06 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 23 Jul 2025 16:03:38 +0200
Subject: [PATCH v3 1/3] ASoC: dt-bindings: qcom,q6afe: Document q6usb
 subnode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-fp4-usb-audio-offload-v3-1-6be84ed4fc39@fairphone.com>
References: <20250723-fp4-usb-audio-offload-v3-0-6be84ed4fc39@fairphone.com>
In-Reply-To: <20250723-fp4-usb-audio-offload-v3-0-6be84ed4fc39@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753279445; l=1387;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=iFrv0UOBrWQDOMIVYCVEkyIJ0o38UILWsfNE6sREkpI=;
 b=Ztq41RZXSMGO6exUAOuQ4XQcdpBry6H1ciTLjtAknNQkm9moDrjoxqdKldMAFo0BxG/t8N6Qw
 UOlP27CPefLBV/wj79OId5uHt7EjrKLju9XrZCiuJZQRup7OWYCuFaK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the subnode for Q6USB, used for USB audio offloading.

Cc: Wesley Cheng <quic_wcheng@quicinc.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,q6afe.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml b/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
index 297aa362aa54ab41a956b3ceda73d4c7027d72a7..268f7073d7972da2ef46d36264c0f7d8f648071b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
@@ -29,6 +29,12 @@ properties:
     unevaluatedProperties: false
     description: Qualcomm DSP audio ports
 
+  usbd:
+    type: object
+    $ref: /schemas/sound/qcom,q6usb.yaml#
+    unevaluatedProperties: false
+    description: Qualcomm DSP USB audio ports
+
 required:
   - compatible
   - dais
@@ -64,5 +70,12 @@ examples:
                     qcom,sd-lines = <0 1 2 3>;
                 };
             };
+
+            usbd {
+                compatible = "qcom,q6usb";
+                #sound-dai-cells = <1>;
+                iommus = <&apps_smmu 0x180f 0x0>;
+                qcom,usb-audio-intr-idx = /bits/ 16 <2>;
+            };
         };
     };

-- 
2.50.1


