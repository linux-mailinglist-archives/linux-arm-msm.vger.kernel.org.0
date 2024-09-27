Return-Path: <linux-arm-msm+bounces-32651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B19A09881B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 11:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E26A81C23321
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 09:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149311BBBF0;
	Fri, 27 Sep 2024 09:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROqMDf9O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9885C1BB6A1;
	Fri, 27 Sep 2024 09:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430373; cv=none; b=P315YC6razektco0MIQX+CVkscj3RxAJzfT5IRw3Hyv0f2lU0VQG8DFqsi18lKiffjE1MIvWKY16rkzUXX6xB9Dvi3DiNJEj8j1Paf7EKVT2zQBP2y1Op/tFBQSFfse7ZGtb3+1j+TwjjjIiL8amx5AlaQjpSB3R05hLiM47+uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430373; c=relaxed/simple;
	bh=hcPfFNJzZ0bXWhtjg3R57ip2PpzN0lJ5OVwc2TFHmMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CKgCl/l57Jri2mAsnURg9fzN7YbBpBHy12/NGi1GagYIXQBNmXRzZ59Ih6nyLt/9Jy6q+zDXk4ebzrJjPxbR+rbhh78P5SfFUX+HkNACrYWpK+qMXffLZ28gy6wLn0Ltto3qWQAiZroNyXE+cYTm735dCoeIOf7zLa55dJpf50c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROqMDf9O; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20b483f2c4aso1922245ad.2;
        Fri, 27 Sep 2024 02:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727430371; x=1728035171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwpScADP6tZYBMZzrgITYjvISRrQYHF5IaYK0Cs3rz0=;
        b=ROqMDf9ODQSt02XRgMsFff0+rxCW2ah9ladv7HTT7M6hFUOUnDyiRdHbofLE4J3+nG
         /ogwGMZtxdkw4aLmsQncOT7OGLTTkssAetCplrMMvpEp+Z2hNKfUIRZODXa9Tfgr3DtI
         SVHgX98CT1lNBSFYj7PQ4/WHWGoM4OEzWQpTXsA7U86lvHpB16g4YfRGC9nYTjPVOzUj
         J7cll/MX8RAKD2+VlxtcbKqLKIddpAalEWEXSV+5XhUvxWXWthAgBOv9q8HUwdYhOvYW
         0jXLQ7iLdKjt2uTb+1+EsenMio/lAWJnajMFOQAphUtPBBioVunnf2bTXQB4yV8swP2E
         cmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727430371; x=1728035171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PwpScADP6tZYBMZzrgITYjvISRrQYHF5IaYK0Cs3rz0=;
        b=aboPvDxjEUSd8c3Jff2B3d4XPsxcC0EDrI/gyBAor9ZUsPgoLDI6chzLY9eYcmUR0g
         QNAYl+AxkIfqS7PqTBSHsaLv2IHCstyHPYsj7lupCedG52psOFDSvQpsa+PNhqTOoaDD
         Va4Xw7HBCHbAHMAuVS2bh/NsTLTWeHv27NrXIeLVXVIpRd2gEuOCGEu0L2dsz39xUb/y
         cgIjMLCQdhmOZc522NSnrka6FuDMPqtAK+pR5CTEhCfjX2ZuypxpppNej/LCGDVvlRq7
         KlisCzoCQ6UZxVzZutOPzdEPRnHNw6tTDAftwRaQs9IYivKbKVuV0P1VH288il1FoFUN
         rUIg==
X-Forwarded-Encrypted: i=1; AJvYcCVlZMgoyIeVAtvxXfJ2N1YhCLvrYBHBdiPYNDUPoUldedqD5E+5rT9pWQd0DEGApfKSpm5HSExgyaSbvTtQrQ==@vger.kernel.org, AJvYcCVr2CuT2G3/dZHjmvzs/Rc40/LwGcL9Uq6gojtXh51qcv5pVFB78ZsOdHgYrkwX4KRrzF1xJaiqw9uh@vger.kernel.org, AJvYcCWwylLm7TVncV/0/4sNGFR5RitGIF0MFkH2ZZ1aUnvj8xxPMShPv1E9XrldJ/uUQu2EBfkUX86B3a4r1fti@vger.kernel.org
X-Gm-Message-State: AOJu0YyAw+xs7hjYjRplxY/aWU1FGPzfDesvkuX2s29X/ycUAJFGe9s5
	azbUfoxsTEs3rl5gPfdfFH97ley5qvNwUDoBeu6Yp8a8+XpNraKy5vB4xDuPPl6C
X-Google-Smtp-Source: AGHT+IGeWkpkR5rWvBUZnGdYbcqrDNUvooq8FQCVuV4Qqjo3jxmMOFtZIdyGAAxBF/j9sISPYN3WvQ==
X-Received: by 2002:a17:902:ecd2:b0:205:4d2e:e68 with SMTP id d9443c01a7336-20b367d018emr40770825ad.8.1727430370789;
        Fri, 27 Sep 2024 02:46:10 -0700 (PDT)
Received: from localhost.. ([42.116.8.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e4e61csm10533895ad.237.2024.09.27.02.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 02:46:10 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Add Dell XPS 13 9345
Date: Fri, 27 Sep 2024 11:44:18 +0200
Message-ID: <20240927094544.6966-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240927094544.6966-1-alex.vinarskis@gmail.com>
References: <20240927094544.6966-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the X1E80100-based Dell XPS 9345 laptop, platform
codenamed 'Tributo'/'Tributo R'.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5cb54d69af0b..a1ae01a9d581 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1058,6 +1058,7 @@ properties:
       - items:
           - enum:
               - asus,vivobook-s15
+              - dell,tributo-13
               - lenovo,yoga-slim7x
               - microsoft,romulus13
               - microsoft,romulus15
-- 
2.43.0


