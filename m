Return-Path: <linux-arm-msm+bounces-64497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D7AB014A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02460581245
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 07:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693301EFF9B;
	Fri, 11 Jul 2025 07:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="na8xgHUb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F501E9B08
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 07:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752218933; cv=none; b=CnAj4d8k3jGIKDPuFPxyLuXwAykItMCOlpdtvf3b+aUpYz1cl+Bf6H8zkLGxCkftIRuysBS9yzD0swaCQUkHVAoVKQ47CQBRoD0IUN9dcxvMZD6vXzAJg3dfzd8whsbLEgONZd19/nMz7pF+G3vihZRrGeXPzdGa4jOwtMVzh6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752218933; c=relaxed/simple;
	bh=EKmtMeO9d4o53Iz5HZIpIvx8pwH5I0jiXMr35PqyHMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=psx1WQAgr4vHR/KLzyJ45XScDzEx7+5H3Bn2fmMgY2PV/CZNF6PqjAkVF0mTRRpgv/XLNo/5dDOx94aao8NSbRTfQKiSTGSeHMxW+TkFeMTOfCLGBYdjl62wunStxV1ufGQbvOiOVzl0U6mLqLi4fPsFvDuN0n8IIa9h7X7hZAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=na8xgHUb; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae6fa02d8feso109300666b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 00:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752218930; x=1752823730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmR+8t4m9xzVFLz/MFjX7NJ/hYnQDOG3m6K+KjW/M5Y=;
        b=na8xgHUbIjCoSd1ZFGiWwnhoN1HT8lWqgqUTQ5PQ4yCLzuYl/8RvdPJWGErGhxdlkc
         YzRScJu/AkRtM09B0cVk87klIbIp7okZMEKV8UMMtFEneleRinwBhHMrDeMAoA7mYahT
         GyqQXFmyXy3Yh+k7/Damc0sn8GtRp2a5fEoxsKB62MP7oNrKQ/xbnUmy9DwsolDaLu7z
         6Lu4yMCFsLGPocmslmU/UEhcmWJXhnJ1dNUya3WbmVzQ77KZdQqlsSOUXiOf8boOXO03
         QY7ujlyO2oIO7fwbYLB8w2b9ob7rJxt25vJr/L3z0E6/pHH6yt+IEo9lTSAFGiHE8Pqx
         UHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752218930; x=1752823730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmR+8t4m9xzVFLz/MFjX7NJ/hYnQDOG3m6K+KjW/M5Y=;
        b=tbpVOWnmHfFN48VUu8TAADeD2v354WeOnHnuG/9JRg4U00LsCZnvq2EXeVh1sPTHPK
         LiFliYrt968yi4KYCwe+42GQfcib8C4EWHO03C/YIvcYo70qZmjUTzZbFMtpEC7PmL1I
         fDduYe4qtP7Pg0stwIZt5mqbKVnOSkSXbPuY402ui+y5lftTk64gKGi/ab0lhSyzJG6h
         FpatFW/DhCVpb0zhhI/+UvtHNiMFdlz5wTSIsq6/7nwjsAdv8xcuiKC8YpkNsYoPVjrO
         j4BVkH2ls+UgnfvUETpeAU+bFNObSxKoQyBLINAjuBTNZ136YPuGl2DVDloFZirpcypI
         s5ug==
X-Forwarded-Encrypted: i=1; AJvYcCXB+89AItjVf8ZqZbZlSjTUB1TztQF8IKtby95B41m7Epqu5YXyYaR69ruQDoW074mJeVkXHBKm2FFd6RG7@vger.kernel.org
X-Gm-Message-State: AOJu0YzASxmociHCt9A09JEm3D7Bqhwr0J0fNNkDQVmjH3bo2Sv1G3lk
	nFMtMp5sSi2H2Z8m/UITJrkY07xC777tgVrC6ELfeMr3WZvcEs2+Pw+rVEzqIKHTKHw=
X-Gm-Gg: ASbGncukptVTE0vbx4eD7EJyHrEWABVRFpSuJNOcDoTfmAtwH0zQfniu8UbVhzxV/Bm
	bro7OTM1xv41DUDQ9opl8dI5iICb5eeIO+TAc2VYDzpLTjJ2yMtpkIG0uVCjwAlOjoEChWvwHzK
	P4gRh3CP9YJZTb3QLI2tGH9gsFI03pMI5+YungkmTybEOnJsPvpacHqk4DIGeVLXfuPtS/grc1H
	KGl36P0NoVUnNDI2GmK2SbB1Hex/l04S5CULTG9ReAvpWglVgm6wOvngzMzYvzeK2Npl1u3BkjQ
	IHDs+FIWJ2B5SVl6zYyehA2sxDFbYcCYhSmiO2sjFp2BddijxkQ8iKJfg9NclP+WIqD4m2MBX9v
	NJOnWpMwMsQzIFKSoQyMqhe5Gdvp9bwIZ+vTO7ATzvSz5bx8CiL6BgCWuCLJUEqBl4kGybM9Y7a
	kntw4=
X-Google-Smtp-Source: AGHT+IHjO6Cuy6N2NIyzNBY0zWndZlpasi70rEDQjthIjEIVfVhTG7c9KyNKyXzWl/VgKcWGqir0fw==
X-Received: by 2002:a17:906:7956:b0:ae3:cd73:e95a with SMTP id a640c23a62f3a-ae6fcbc356cmr192188466b.36.1752218929870;
        Fri, 11 Jul 2025 00:28:49 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90c1dsm252600966b.4.2025.07.11.00.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 00:28:49 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 11 Jul 2025 09:28:39 +0200
Subject: [PATCH v2 1/4] regulator: dt-bindings: qcom,rpmh: Add PM7550
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-pm7550-pmr735b-rpmh-regs-v2-1-bca8cc15c199@fairphone.com>
References: <20250711-pm7550-pmr735b-rpmh-regs-v2-0-bca8cc15c199@fairphone.com>
In-Reply-To: <20250711-pm7550-pmr735b-rpmh-regs-v2-0-bca8cc15c199@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752218928; l=2150;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=EKmtMeO9d4o53Iz5HZIpIvx8pwH5I0jiXMr35PqyHMk=;
 b=TfACMMKlpTyBL6dkzahid7p42TBAErawN089xboN4nevPOFohNrTf14tInQWkOngwzOeQDzoo
 qa7jLfUrBLjD6LzHO5bmHXDRANgZaFPf5HdTN8nG5vYQMj/stihk8Jr
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the PM7550 compatible for the regulators in the PMIC found with the
Milos SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/regulator/qcom,rpmh-regulator.yaml     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 3a5a0a6cf5cc7090f3e09850e9a13b7e6eeac68e..3dd150e5dad897eeb46e13dce5bb2726fdb90627 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -40,6 +40,7 @@ description: |
       For PM660, smps1 - smps6, ldo1 - ldo3, ldo5 - ldo19
       For PM660L, smps1 - smps3, smps5, ldo1 - ldo8, bob
       For PM7325, smps1 - smps8, ldo1 - ldo19
+      For PM7550, smps1 - smps6, ldo1 - ldo23, bob
       For PM8005, smps1 - smps4
       For PM8009, smps1 - smps2, ldo1 - ldo7
       For PM8010, ldo1 - ldo7
@@ -66,6 +67,7 @@ properties:
       - qcom,pm660-rpmh-regulators
       - qcom,pm660l-rpmh-regulators
       - qcom,pm7325-rpmh-regulators
+      - qcom,pm7550-rpmh-regulators
       - qcom,pm8005-rpmh-regulators
       - qcom,pm8009-rpmh-regulators
       - qcom,pm8009-1-rpmh-regulators
@@ -218,6 +220,25 @@ allOf:
         "^vdd-l[358]-supply$": true
         "^vdd-s[1-8]-supply$": true
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm7550-rpmh-regulators
+    then:
+      properties:
+        vdd-bob-supply:
+          description: BOB regulator parent supply phandle.
+        vdd-l2-l3-supply: true
+        vdd-l4-l5-supply: true
+        vdd-l9-l10-supply: true
+        vdd-l12-l14-supply: true
+        vdd-l13-l16-supply: true
+        vdd-l15-l17-l18-l19-l20-l21-l22-l23-supply: true
+      patternProperties:
+        "^vdd-l(1|[6-8]|11)-supply$": true
+        "^vdd-s[1-6]-supply$": true
+
   - if:
       properties:
         compatible:

-- 
2.50.1


