Return-Path: <linux-arm-msm+bounces-78871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B721C0D26F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 12:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD69C18885EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 11:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFBF2F747C;
	Mon, 27 Oct 2025 11:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aSg3R5sA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D0226F28B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761564692; cv=none; b=joLRXm8bRLgl9NqigPGt96MZYPrZp2tDODMVVxuOsJppsOnttMXRjwAuRDsXJUAro3kuj6SUWoq9xy7pdDljrj4r6dsJm1+cslP/d2znW4DvcRQRQ6sXt6ztcHNWPCyMGt2Kmdjq653D3qQDhtP+s3z4sZu8wuzWRfe2DI+EWig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761564692; c=relaxed/simple;
	bh=LHPhOV0gpy6e0X3PqYPMlaEtQLXlGi+UHQ9Bc94bXXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JvENRX3Oc8ZABM3JSh0NCxVytfNrG7oP9qzLEI3RuuaZKsRzkGvBJiXgH038yila8rVtTUbx6QMgWoeq1f5LgdR91IyIF/9M6kfSwVp6ahHUXYIQDXlD4qY5MTjoX8Tno8x9F3/vX2m7bs6sDWJ0+Q9UM0S68qa1msKvYGnUJB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aSg3R5sA; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3f4319b8c03so625538f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 04:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761564689; x=1762169489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gkdBVE0BY9SVhHYsmymJ7t9CcB8wdxkdpKo/Zx6qBfk=;
        b=aSg3R5sAo6Gr7VQQbGOTTJz6FAZIhiQ9prZGGoeuV9ELd4fuJqDKSzuH3Mq741Ta53
         1N/L74M+W2UGdZiTyt7DQv4pf80BeVWnKNZGnIVxRzkykpIFamY4ntE/8usF5OP9+zit
         zTPndRNME7lhUYkbZ5e8c+WCnVJB4AAAaFXu2GdeqZCztn6wlf+I7pectQ8/rmL1y3W/
         8NxdEoRBYirL0/Su5MwX5hhHqK8QcFRrrQGupK2vYfaMLab+Fn9R30Q8layQrXL31mZ8
         AxP95kZ0xDraV4AjITG8Z9mul57OwtiBKIqS7gKpknF8FIKxlucYFVcGYf/vRScjPGlP
         zDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761564689; x=1762169489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkdBVE0BY9SVhHYsmymJ7t9CcB8wdxkdpKo/Zx6qBfk=;
        b=c8RDQWB/1QnsydiRfQ/KKOi2hbDCWQJttS3xCBHrorTGforunX8My+AGmnNmXKcBBO
         4D0V0qja+f83OQqKyixY2R6HC/4wENpA05dn9Eg14e94M6oTWdGYXgcTFJJZcAHIhQGu
         V+xqWALF+JZRro1PDlLhfCTnpf9CbT7TZ595zh3G+sxtxRkL4Q6V6YWcGevX0GEF+dvD
         QLjiCbBX1Hp4CsLwb0FyjBIU5vMiYf7pqcz6qiZIe1//ZAlRWhWXE2C4jG1Vbld5PFlQ
         xaTEMewnvzyTaPePWu6FlLxnd23nx35XKxnAcWp5Qb8/F//scRCRuj1hyc+jxH0pAn7j
         vc7w==
X-Forwarded-Encrypted: i=1; AJvYcCW7xgdPJB4krl478zwMUvjVAQLSXLLpsL6lL0a1ICclPhLyoPNE+XKrUcW8VwgzDhb0VbC6PfEScs+dqFZE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz63BFFSAjklCI3xoJeBRZvfrRB8o/uyN7TNFt2U/oHSD+kb4PZ
	GTUb8bylzFJWq3jAesG41Zk5o39h/DnQCErVPqBCtzENzHQ5c77nfMef/RJR1+CWU5I=
X-Gm-Gg: ASbGncu8JyJbElVYQA/h9/dh33jSYVd/XxJrsXoG+OlMR+4wUA94HDeybqbGFSrazGw
	P85bNuKg3dKE6YVvT0uYmHelWv0FKr2KW+DEVGnk84pZqkXrttRdkW08Rjctr/qTaFtzM5JJZB5
	KrXoVfH3G/j7nNp1o3PUKFmwbfVocSOMD0l7YxJ/e6tjpBe0Vs/v4cuR2wqsNfau0qxoeOMV7XZ
	c9/FXQemMlLCAIvbD++N4C90vl1diKAGax74qSrR97QwBaAtHv+OSmkV8ldXRpw7QO8Hv3p/6SW
	ov89y5BAaopm838p2eI5uMXizrHtk2iG1qHw8IMmcB98HMFhjO3xfTC+EvmDc0A9LCIxU2HjmJB
	L8lNI1aTy+MX/LeySfMk/PwsiFwGE/qFO5pT/YRc9f2Y1yKT4IzDV/BYOmucxEB2pyakVTEWJH+
	4oGyRKsNKowdXEU1kLYTrPZA==
X-Google-Smtp-Source: AGHT+IGz6GD3y6+cDG8Os4GrrgdKI9eH0xfE/xqR67GYStPwZccvbqYVtGigldNSOQfDk9DvMczWPg==
X-Received: by 2002:a5d:55d1:0:b0:426:fff3:5d0c with SMTP id ffacd0b85a97d-4284e531afamr8104494f8f.1.1761564688605;
        Mon, 27 Oct 2025 04:31:28 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952e3201sm13885403f8f.47.2025.10.27.04.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 04:31:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: ufs: qcom: Drop redundant "reg" constraints
Date: Mon, 27 Oct 2025 12:31:08 +0100
Message-ID: <20251027113107.75835-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "reg" in top-level has maxItems:2, thus repeating this in "if:then:"
blocks is redundant.  Similarly number of items cannot be less than 1.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 1dd41f6d5258..516bb61a4624 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -88,7 +88,6 @@ allOf:
             - const: ice_core_clk
         reg:
           minItems: 2
-          maxItems: 2
         reg-names:
           minItems: 2
       required:
@@ -117,7 +116,6 @@ allOf:
             - const: tx_lane0_sync_clk
             - const: rx_lane0_sync_clk
         reg:
-          minItems: 1
           maxItems: 1
         reg-names:
           maxItems: 1
@@ -147,7 +145,6 @@ allOf:
             - const: ice_core_clk
         reg:
           minItems: 2
-          maxItems: 2
         reg-names:
           minItems: 2
       required:
-- 
2.48.1


