Return-Path: <linux-arm-msm+bounces-70482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AAEB329E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 17:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA9967BAE6D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 15:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA4C2E7BCD;
	Sat, 23 Aug 2025 15:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ME5bT/ld"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112EB26C39E
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 15:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755964441; cv=none; b=p+3NLiBzL/hTBFtkEPr8mc7z3IOmIQCT1FvYY1oMnUT6QZK6A7M1WDM9yGcShvnxVztbU4speNfLcjiaCBiFbAW+tBjQYit9AIYodYk1+e62bkEfktizs55IyjUgDLMiy17soKLQtCMZ4te9esMP1jqd9lcKIsyqBj3W4OvQ2Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755964441; c=relaxed/simple;
	bh=BEBwXHerw3ntKO8As508E0PNezsgrG0rfZYdMmUmjv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vEsi6hnh9h2pHRTB3KJGr3lXkCszta/Wud0GB7vDA8HDXWNg84FBbd0YeeKF2nElxjhNxzaPPE4aC40SwNLJw1l+yj+Xu9VGqrWt0YXcRYzqceuz70RLfbWxivrP54sa4KAdOGjP3Ty6fFBvxcNkdg2Ibos9Hrns0EPuqX0nnnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ME5bT/ld; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afe48fe3e70so17829466b.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 08:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755964437; x=1756569237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zt9xEnK/GMUK8D+qIpymS0lulZPj2RfyNpNrWhUY2cw=;
        b=ME5bT/ldwKFVylukKYI1Mfwv5ms3nQgJoVpPdNmHrduHmfZXcwbqnmEdvi+/gLFYSP
         bs5aQrhMuc3DIT0BCw5K1zWfY/T9EnV/R7CRFJaNBaKR8wPTtKpkm4e3LG5mDnrRyvMH
         6XxIl/tEkYeHxiZQVWK0yWM1D6PYJydGp59arPEVlXIgQEYUp73EHMZSd96tGCcUqBY0
         ZRdRblfGk5XGZZ3rmBWStx6b9UJtOIfR5woMlRQk2NOXlwwr7PoGyor8FZC0IHtSHKdq
         B6FA76tknJcu3JZ2vL66BDO4F7G9Dz4MIDiAgrJHIWnH6zt/lonpPmsawCghjjKEr9pA
         z0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755964437; x=1756569237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zt9xEnK/GMUK8D+qIpymS0lulZPj2RfyNpNrWhUY2cw=;
        b=DFkGvFZOBgZIHRn9x38iPS/pWTbCB79jpr68s+ZrIBtn3O2PjnA0l6E7KXjh5gP/VM
         sbBCB1RdBLF+d3VSF5mU8+jGQ29FOIGwUlHJNX/tq/fHtxEDhTJB6/SE+IJAZ7SCjJoU
         oZnfhXpSyXkiYyqiRzNKYQIJPry7TbBuD7p6duVGfAoJrY/io92bqCZ3m1ql1qxPTC/B
         MW1fmIwyE9WjN/1ASAcIrv/TELxAqcwrl6/+vYzCGI4tUrrWZb8bchQ8bEJbi9uFQL8l
         mYaKuV/eKfn2kql/4O2Q3C5XjtYbI699Ke6yd8mrJy2pgCmsINa1tBPU76MucENtbbc2
         tuZg==
X-Forwarded-Encrypted: i=1; AJvYcCWUeaFng7MWI2D5cXNWazYmkZe/VUqbtU8h52eaDj2nWnh9k/j/AMveQ5F7OovDpqwdBEgqHYiVXhDpUdMz@vger.kernel.org
X-Gm-Message-State: AOJu0YwAPyhjVC6D+D06A9JN499CNa2/O1zQI4mHTBABvAM3/ClaoHDq
	nCFVyy+ZzZqwds+op0JthLdUZjVDTUvebgMwgn5SU0TkZHCJK82LH0BZsb6ZeCeLirI=
X-Gm-Gg: ASbGncu77H+Frj2U9hXfW8R36w83CZcIVafTnGNdQk2VjeLOLDDLUIyJ1EAO1r/4XFa
	lJ9jy30bjQjJpOGdxDFXDFhVejrpKkf+VgDjQ1WrYCQM1DLKc/DgE/6PQmrMdhNqOkp2qNCyias
	wIftkOZAiwP0H/0+aRGPUg2HXw+il2ldir1FpgH9dK/jQbDiq5PjyrvO+X2oJUeeiDDtPFVREr0
	gQHwJpRLXHi0DpPIt110/0D2zMlHIg4+4R/Qflh3vjAeFGqVpfabNK4yCOAvvhSoRcWbQ0IXVr3
	dTNZ+GU5CZLDZOOukjmcIA/hH5UXBpQdmnAM8VKaQr34vEozGz/Ugbt850JfXCFEvEaeM/IyhKU
	p8FAtSg5jUoNcnPx8GbTPMb12RSwxEQbqjA==
X-Google-Smtp-Source: AGHT+IFx1wcVLNhS6MBGIutE/EnJRngjDp/qfQ6MpvV6BFouq2K1E1mpaTjSPi2NhS8iAUEG5SPpyg==
X-Received: by 2002:a17:907:6094:b0:af8:fc60:5008 with SMTP id a640c23a62f3a-afe28f09244mr306080366b.4.1755964437314;
        Sat, 23 Aug 2025 08:53:57 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe4937a15asm189236566b.115.2025.08.23.08.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 08:53:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] media: dt-bindings: qcom,sm8550-iris: Do not reference legacy venus properties
Date: Sat, 23 Aug 2025 17:53:50 +0200
Message-ID: <20250823155349.22344-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=BEBwXHerw3ntKO8As508E0PNezsgrG0rfZYdMmUmjv8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqeQNhzvYWTV96Z2wePTHgAsg+wDg0fw28p+mM
 oqvJpaQEHaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKnkDQAKCRDBN2bmhouD
 14K6D/0XM7xhbbPWhNOrngsV02OIU+OD4BrFRZoMj9RvaiNDicnJQ3tq4bUf7TNBkhIdbVjQ339
 KLDDxSYa/Kbg4IPo8CNYpzNFBcgMmR0seGyjS4CPMMimCl3P73+PV2vsGdCJMSKTisPwrT/P6yh
 6mNE295Z7uDPPKaethoNziW5KtvB0PwSWsSDPjCejD6+nfmtuYM0Iyys16+zPZmCl9MSTWUPYt8
 K+E3Z7T430XoCYi19JbevyJn+Udv0Cb8wQFLfq/eYUGF4Bt2MrEruLacnIvNBKow1hkdJ7ZJqTi
 6U564isiBJts6WDHoSMYGubL+ha4zjbUIChF2xAYEOWxv+V681pMmO/96x7ONB6ukGICM2P3qqn
 tnwLaEfV0dXJhAarm7KQZf3t6NmB5krs2mylYyrifcfabmK0r+fN8dyLoWvoOTSRTkeVpgEtmPS
 qrvP+fdsCWW1T1a7zG0PgQNAS4S5DO1VKsSzUQ4hYjE1qDzTOgJmI1I44EabQLzLQ6TkTuGbrHr
 p2SD31IDxdh6Vjc2OKiLleXSkw0zLBJR2afj5VsDP99tq7Yk4zkAhaL+mxfTIxTbBZk/XZSdFMv
 LuuMzx+2fbZEBPHaNHSt7A9+4D2bTByfNcvl90uaic4gxWUZA7uCniWIRGfWc3jShsvo60NQase rcweX2hLXnAxytw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The Qualcomm SoC Iris video codec is an evolution of previous Venus and
it comes with its own Iris Linux drivers.  These new drivers were
accepted under condition they actually improve state of afairs, instead
of duplicating old, legacy solutions.

Unfortunately binding still references common parts of Venus without
actual need and benefit.  For example Iris does not use fake
"video-firmware" device node (fake because there is no actual device
underlying it and it was added only to work around some Linux issues
with IOMMU mappings).

Stop referencing venus-common schema in the new Qualcomm Iris bindings
and move all necessary properties, except unused "video-firmware" (no
driver usage, no DTS).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/media/qcom,sm8550-iris.yaml | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index c79bf2101812..320227f437a1 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -26,6 +26,9 @@ properties:
           - qcom,sm8550-iris
           - qcom,sm8650-iris
 
+  reg:
+    maxItems: 1
+
   power-domains:
     maxItems: 4
 
@@ -45,6 +48,12 @@ properties:
       - const: core
       - const: vcodec0_core
 
+  firmware-name:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
   interconnects:
     maxItems: 2
 
@@ -69,6 +78,9 @@ properties:
 
   dma-coherent: true
 
+  memory-region:
+    maxItems: 1
+
   operating-points-v2: true
 
   opp-table:
@@ -85,7 +97,6 @@ required:
   - dma-coherent
 
 allOf:
-  - $ref: qcom,venus-common.yaml#
   - if:
       properties:
         compatible:
-- 
2.48.1


