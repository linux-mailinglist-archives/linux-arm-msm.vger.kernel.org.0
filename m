Return-Path: <linux-arm-msm+bounces-26318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ABE932474
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 12:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8C0C1F24012
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 10:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD1719939B;
	Tue, 16 Jul 2024 10:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aEqDs/i8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0776199251
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 10:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721127257; cv=none; b=NapC0zH46I3ZwB7iaBmZPVSpnG301A+VznzOej2w4V+0WpRmHJMx5G9MF0pvWI8VboKpyCsc9SfuGHK+WwXDqnR+WbpZTpvASJMAbrT80ujF4uqBv9jwprd0j0J8UJPh6KC9OoPxXPHJz4xxJqv7y9olb1AyXRW3K2NyPOLKGNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721127257; c=relaxed/simple;
	bh=fLnCOcn0YVyI228OI5sEyoJf3tCOMYcmsPToXiA0QJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uOj82MujQ6qDyc96MygYg0Pv0v/BWu9rEqUMMBkXm0YzWuWEjZrnzxZieGk3sKreP/xdVOLpG9qK2sqpd3MonNzKGxT8EejivtMuhHlfqG/255ElAKoSOAK57WpZ5cXWxyLDu6JVrmS4dBTWlWb2Trhu0WE1L9yjRSZinbkY3uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aEqDs/i8; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3678aa359b7so3860261f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 03:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721127253; x=1721732053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06/mGBoVpO/E3PxYGWvGUiycM4NlfZYrcU+JP01aYB4=;
        b=aEqDs/i8dlbeQAeafablfaFLtzNNEZ3Pt4sElSEcFyrIP7YCtqIj81tgCFfBsBT9g7
         Y1VQeKvqGe18DEVpaxOtyBUh5vRXKcdeAo0VOcSI81qDgKyxU0CmpyGtkuyGiMYYb2B1
         kKztuC8gt7qwXCvJ/PXdjr+Zdt0SUzIHSUIYG4Y0ufYN2SuSMVMO6Jhv6b9QCsXY1Hsn
         pSNferPzOSwOi1qHDIBxt3XXA22+E5bv/Hw9/IQv6ClTLSYiJcMKolXfTLr84vLOCB7p
         PMt0AcmWBwqU3N7dYUm9/66BldzBI0jcP29i61/ovPD2fg0plSuSpbynsjStWyMNnYOJ
         JfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721127253; x=1721732053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06/mGBoVpO/E3PxYGWvGUiycM4NlfZYrcU+JP01aYB4=;
        b=Mh6pNn5LNS75NZ3ETr8S4HnEDkoybFUwvsXjZ+M4vD8eAVFlB7x3omu715hE55ss+O
         14d+hr9fI/H+mCHSMF47junB/JCRz7xPkE80ZT7Tmz+OfU0MluKrrGVDenPQ3W5pLv7O
         +jgqunr088QMiT/Sv2TgeWNQ4kuVKHlCPmrQlrzjCLaRVA0dXxWXAtDX+gFZ5UoNqzKF
         DCPAW7d+oppP7WkHhSc3n2x7JOZ6jv1+JHR4OTymVQOT6qzqAso3FtJY1Xg7wJA8/opM
         kf3J17wQcmrqkZgMj/nFOCbRUP/RdKbzJ6KjYIB0t4qzVl/jjUi/6ikSJa6vz5FxEZyU
         /j9A==
X-Forwarded-Encrypted: i=1; AJvYcCUENyHWAjh8Ara3Fk+nB+eVFoJsfEth5PUw9XCyljut24Uj4Lmvj0hgLMtFdKHSZ1zCf3iQ12q5RTHzSwKiX5NLBFxvYQb3tvBmvPmXrw==
X-Gm-Message-State: AOJu0YyuMabcVYFcL3UewdPl/VEt5GsZhIwZ22QC+MUJ/zqqr6m5429P
	2sCFa/Fvx4G8qwcfG/jaBzzvKCDMxAr2pSIzFGrUdqshbvu0F0ny7bVzobgQDRs=
X-Google-Smtp-Source: AGHT+IF3X3X7MG4NMq7wMRsdQiUSxzDLW2vp7H8VSvOxK4xUxE4UVg727QPaetSCY5evGN2ShEnrZg==
X-Received: by 2002:a05:6000:1f8b:b0:363:776:821b with SMTP id ffacd0b85a97d-3682717a775mr1409987f8f.0.1721127253293;
        Tue, 16 Jul 2024 03:54:13 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccbafsm8608295f8f.51.2024.07.16.03.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 03:54:12 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	de Goede <hdegoede@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 3/3] dt-bindings: ata: qcom,apq8064-ahci: add to dtschema
Date: Tue, 16 Jul 2024 11:46:01 +0100
Message-ID: <20240716105245.49549-4-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716105245.49549-1-rayyan.ansari@linaro.org>
References: <20240716105245.49549-1-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The APQ8064 SATA AHCI controller is used in apq8064.dtsi, although it
was not documented in the old text bindings.
Add its compatible to ahci-platform.yaml.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 Documentation/devicetree/bindings/ata/ahci-platform.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ata/ahci-platform.yaml b/Documentation/devicetree/bindings/ata/ahci-platform.yaml
index b103d2c44421..51624406392a 100644
--- a/Documentation/devicetree/bindings/ata/ahci-platform.yaml
+++ b/Documentation/devicetree/bindings/ata/ahci-platform.yaml
@@ -30,6 +30,7 @@ select:
           - marvell,armada-3700-ahci
           - marvell,armada-8k-ahci
           - marvell,berlin2q-ahci
+          - qcom,apq8064-ahci
           - qcom,ipq806x-ahci
           - socionext,uniphier-pro4-ahci
           - socionext,uniphier-pxs2-ahci
@@ -46,6 +47,7 @@ properties:
               - marvell,armada-8k-ahci
               - marvell,berlin2-ahci
               - marvell,berlin2q-ahci
+              - qcom,apq8064-ahci
               - qcom,ipq806x-ahci
               - socionext,uniphier-pro4-ahci
               - socionext,uniphier-pxs2-ahci
@@ -105,6 +107,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,apq8064-ahci
               - qcom,ipq806x-ahci
     then:
       properties:
-- 
2.45.2


