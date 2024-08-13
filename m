Return-Path: <linux-arm-msm+bounces-28414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 257DB950CA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 20:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EF2DB264CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 18:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96991A4F2A;
	Tue, 13 Aug 2024 18:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IGSMqVz3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094201A4F0E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 18:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723575519; cv=none; b=OmKzZcdN+C7hr4rdn750yhxGft/1vM1k5UTIiHXn9Wl0u+A8v0JFqJL1RdbAWCzTVSzDSaFoU2DGFeBWFl6pPycEqdyrjwAmTXfAue7HnoZL3yJpcCSNSn6L9tg6dXWnkfmggv0pZZ3Fuie5v7TTyjbr2Blc3DHuhoPjQCCB8HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723575519; c=relaxed/simple;
	bh=xb1X9sTHTknaC57AtSXTIM736W5+uYqdz9zT5MxOnyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ioBHb9pbwPRgf6tu/HiauLkws7rRGDGRlwF4Ec7z25AWBuISUP+5Lj+X7z3vd1JeVeX7U13jDt1t/re/OaQ2ICPVeqx/9CMDsILWA58I2kWGgRGc5OnAE+oDvGIqKZRg7a/BqjTj+HiEKhsV1VyRYa1A45paTg1j09Jlx+EobdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IGSMqVz3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so41087905e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 11:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723575516; x=1724180316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcl3zA4FgRUdr5ZygdjxphfXY88eP/BhUP2PF01mf3E=;
        b=IGSMqVz3j3o7Njp+C3V3Ye80h/DhvoNkUkb/ZcF/ntlbuackWFZ6dJh8lZIbUGBSd4
         gwRtfmdJi7qOP86kODA1lYDuK79ySjlB7lDrFJi5fbu5BvFj9tCU76xYof14SbkqKzRj
         WX7lJKkFm/NjnqtzuT4t5vb+hmGP3l5F/rvO61snmVbxixRpa+4eaN2GriMnjs7a1ESH
         b2YvEULEctPoRCiwZ0trEFOQp+PP8Tuudu5+5490Ry1L71wuN1nz7m7H7vpl+9HPojdF
         QM12XDppZC5i5pai6G5JMITL60LNksTvJQBJdWNyOewC1sIH6isFSAXRj6+WCDf3Vh+O
         3Pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723575516; x=1724180316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcl3zA4FgRUdr5ZygdjxphfXY88eP/BhUP2PF01mf3E=;
        b=m0YuNYkJ9yPo6Z4bBu/9j/6S/S68aeV8sEkiMvsQCwD4D6slppE+jX/Li3mAI7JSQJ
         HZpX96nRPsZ5SpHO9FoVvNMSY3tC+MM06YgOGEX2DvmbRygTlJ7HyBZd3EHDohoAHcAj
         MevwNjh3UoD6TaXZGB0lrNj+PCD9NIhgcTVTXcLRCZLRzw/W+OlWnFtGkDYcaYFOfIH3
         yCkuoAsgTva59NlcPwkK5KvpWezx+nMHCFCDzPXtlKG54hHIj8KFT8FlRyn9BE8fBGh1
         nXfLTEJw8sh6BbMnkzP154ZS1lXTCrB8n6V6b2x19t1WVO54qPZHPT+ExGYC5J5a1Y5K
         hwsQ==
X-Gm-Message-State: AOJu0YxOsgX/bojb+phcC8QWh23VIyjVB52Fb3s4n6oY3+aPiE8KdQwp
	6MGGO7ewO5pwGO3UB7hL/stlaMMQ+oA/JZ5hyHciwKL3T08gXa8JaNntG1g0c6KLZGoyxdmFkEs
	39kc=
X-Google-Smtp-Source: AGHT+IEgq6CVGttTellTVTWy6Kc2fSeSu7jNW/zDzxvJpBlhy4KnmTkocYLGHxOASyuobuObba4jYg==
X-Received: by 2002:a5d:420c:0:b0:371:6fc7:d9d9 with SMTP id ffacd0b85a97d-371777714admr373145f8f.23.1723575516292;
        Tue, 13 Aug 2024 11:58:36 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3979:ff54:1b42:968a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c775c509sm151208145e9.44.2024.08.13.11.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 11:58:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/3] regulator: dt-bindings: qcom,qca6390-pmu: document WCN6855
Date: Tue, 13 Aug 2024 20:58:26 +0200
Message-ID: <20240813185827.154779-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240813185827.154779-1-brgl@bgdev.pl>
References: <20240813185827.154779-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add description of the PMU of the WCN6855 model.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../bindings/regulator/qcom,qca6390-pmu.yaml     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
index ce7771f9fa36..6677939dd957 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,qca6390-pmu
+      - qcom,wcn6855-pmu
       - qcom,wcn7850-pmu
 
   vdd-supply:
@@ -104,6 +105,21 @@ allOf:
         - vddpcie1p3-supply
         - vddpcie1p9-supply
         - vddio-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,wcn6855-pmu
+    then:
+      required:
+        - vddio-supply
+        - vddaon-supply
+        - vddpmu-supply
+        - vddrfa0p95-supply
+        - vddrfa1p3-supply
+        - vddrfa1p9-supply
+        - vddpcie1p3-supply
+        - vddpcie1p9-supply
   - if:
       properties:
         compatible:
-- 
2.43.0


