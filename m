Return-Path: <linux-arm-msm+bounces-35341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D849A9A20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 08:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59DA81F216B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 06:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D51146D5A;
	Tue, 22 Oct 2024 06:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U5jpijqS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAFE1465B4
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 06:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729579354; cv=none; b=IezN5uXK4wVbW+/W2TogpzfyLECLwmA5I0lLvdbTveZCxj5LvZs78Oku0d52FmlYTeu+D1EFr1NsYwb6CJLOT2JY0iK+E26TgfkzY3L2PEF4CkF9QVO1ATsQ1NxkoAj/fhOF4ymWa8N6vFH9AKuupQqAcr/K9EVIT79OkGGtZSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729579354; c=relaxed/simple;
	bh=F/1AckOYpDpGQHp0y9iQKfxsX8A7HmSxmWRROwni/jM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OcbPxyFmAZRrB+aAnDifMXpSzguNaYZbOTqynHIG1OznzQKCEm+/Ifm8+TZPTwmgGGA9J+tC3M2XGpkkWdRIPemjXY1HbkMsCLwWHxK5MZgddkJR10i6ndNWRFzfQklhz8ocS7oLqhUM664x1srjEj7+FwMH71Ovyj+00rDDHyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U5jpijqS; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d5045987dso442892f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 23:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729579351; x=1730184151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P+s4T88prdpWLg5DqwQ71V3KjY1OGawDQVsKowQtLs4=;
        b=U5jpijqS8F8GtdkhmtoVMQK1sGGnMnOPtCcmWR9y7Ar9iL6mSxdo9P2Oqi4GGTHH5n
         LloW2GcC1Mv6mwT4bkJJMji934GDkFC5rEJT0kf9ktKg25wVeVYmyXmg7xpmjWwqLq9C
         GVKx36ad2iOFsaOvs8ATL+jbX1v16M9+I1YqpTcO8khJMLDXUvLiPKkPRgz5aigdCy0T
         E2bzwrIVfCuwZ8wDilXaPa2i6Oxr6gRJSOE7DgyKgmE1n4ck3KFPJScnD5vN2J6cA6Ne
         ObERXZD2TSQUZRVI6+18BmZlIMXZ7VHBji7oZBuDi4Yk3Tq099v3sTzQc7sMLWiKcoxe
         aatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729579351; x=1730184151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+s4T88prdpWLg5DqwQ71V3KjY1OGawDQVsKowQtLs4=;
        b=SrA1AkMKW+MuoQk/ku18Xu4a1k4ND6Cr1cPZAq2DroeXwKZk1duyydrNxWmt1oqf2C
         sdAYm1VxIw8wekD0KxoF7FTmfkwrcnT/bkWNff5osgWHzwdXCuwtYKL3pHGYO/jWoZX2
         zHAx6XvT07e8FKWSmFqWJxTYf0iZQzEZzU+k069ZjQDcCAA0nCVaGPWr807Fo1XMGlyF
         A6FE9zNqJnQBLLFCRasM9QzoLzQI4rOrv5nJTbDWADTK2rFk45E6umtiDOsvRA/c6kt4
         RDgnZjiYHEWH2koLACgsiKkGYyvd5R1hgE6Hd7Zp4j2A9ffKevo/T38ylbUpB4gayRI4
         U1qw==
X-Forwarded-Encrypted: i=1; AJvYcCWlDBUzFl5pIUtyiQy4MxctqRFOYpxvZJQBwT1W2zopHa6A3IqvI+U3cz8WME1fSYntVLQRJBckfj7yl87w@vger.kernel.org
X-Gm-Message-State: AOJu0YyF6+e+UXgTJ5Rp6Yb6mcyP/DYObEZe++p3gSJ/HxnBIAR7lqDQ
	G0qe2z8SaVQnhCwA/HYGAkZDkzAGycx3sF6eSiW2jjojsgcJ7n1ghDaKlNVb16s=
X-Google-Smtp-Source: AGHT+IHg3bKcy1Oyitoi2Czv/YW5n7GwdCJZBqX4GqsSCVT1MX+iLaofIcy5Mu1hGFlWMheumQOMog==
X-Received: by 2002:a05:600c:474e:b0:42c:ba6c:d9a7 with SMTP id 5b1f17b1804b1-431616857d5mr45780365e9.4.1729579350607;
        Mon, 21 Oct 2024 23:42:30 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57fe00sm79353395e9.20.2024.10.21.23.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 23:42:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] dt-bindings: soc: qcom: aoss-qmp: Add SM8750
Date: Tue, 22 Oct 2024 08:42:14 +0200
Message-ID: <20241022064214.22868-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document compatible for Qualcomm SM8750 SoC Always-on SubSystem (AOSS),
compatible with existing generic fallback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Melody Olvera <quic_molvera@quicinc.com>
Cc: Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 7afdb60edb22..2b90cbef9600 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -40,6 +40,7 @@ properties:
           - qcom,sm8450-aoss-qmp
           - qcom,sm8550-aoss-qmp
           - qcom,sm8650-aoss-qmp
+          - qcom,sm8750-aoss-qmp
           - qcom,x1e80100-aoss-qmp
       - const: qcom,aoss-qmp
 
-- 
2.43.0


