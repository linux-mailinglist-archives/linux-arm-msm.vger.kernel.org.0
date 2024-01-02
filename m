Return-Path: <linux-arm-msm+bounces-6203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A7982172A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 06:18:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 397E31C21151
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 05:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A606FB3;
	Tue,  2 Jan 2024 05:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B5LeHVtC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002612574
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jan 2024 05:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50e7dff3e9fso6181986e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jan 2024 21:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704172652; x=1704777452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0s8ie1PjI1oKX9gBOzs7J4z2dyEWx5VVzrDHYAu8WFQ=;
        b=B5LeHVtCwkFYcuIWUKNvgnwXMyhzQbDEGl4ym2Fy76jZrgzFZCsjQGucPkdeoWYTrr
         /Qzo3HK+anmRshtD5tyH6nJM+B/0ouuKfqye2aNvRAaIbDRkbx820u4qnTq2UD3zp9hK
         8p3O/Kc/6UY6Gs+2KnCNX1dL87jjxq/1gaoXFNvBQo6W2+CCcK9mrDSuuNxOZg3ibRtW
         +BUKdyy7GF9720MS5Kh21yUDd+dzP8zZkN3+pYbnNnYq/xMHdgpraxSKbxJt99McnuYh
         3c+pNhyBus7KNmF8mRekZgC5EQjejJkuOzk4fSqbr8bfcalJvQ8jHddxvzH56MFwHFS1
         4lsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704172652; x=1704777452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0s8ie1PjI1oKX9gBOzs7J4z2dyEWx5VVzrDHYAu8WFQ=;
        b=hHUlvhDTRp+TlaFAf99sKK5HIRoJJFnkoZUSYpfXEdn7xxExacEenykTXEaZWOvETD
         n/sJijse18gjqajO/Q4W0ulCHb3xS3jNPeCKs74RvS2yK43FtoUkiL8ETBQNQ+buszu7
         lr5dYcGhqgMPygXcs2+LWQjvmvCxE0dMtCbEixBHjo0CYGtaDLdqAuBLZXopFl2f2rO0
         rX2J0+17XjPLfuxzMocZSA/5iHRKdFfxL+FlYcPnEo/edzQ1vexFl9y8JtEjVQ0n7pOW
         +zVuW8xTqIa9yjhgdNrll2205dLEp0UP2CxdbTZs5I27O5zd8O81AfLXlT7Gx0RWmoUf
         7wjA==
X-Gm-Message-State: AOJu0Yw0f9tNuL2J0kGZKGn3XX5Kykshm4IboTvYCGoVrAXQoF6RS9XG
	pKHX0duYQjPCkNymyOdPfxeRuFbx/cdkNLkUw3ZSbtFwQflS+Q==
X-Google-Smtp-Source: AGHT+IFjE9aX5WKb8rVTdzJEOvfxYFGbFSqMV/6kvojxqS+3tuWnSIhQdmMKwRquDtr/xf39oSApMw==
X-Received: by 2002:a05:6512:1248:b0:50e:73b8:e8b5 with SMTP id fb8-20020a056512124800b0050e73b8e8b5mr7849370lfb.74.1704172651915;
        Mon, 01 Jan 2024 21:17:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r25-20020ac252b9000000b0050e810689e5sm2081827lfm.33.2024.01.01.21.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 21:17:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Jan 2024 07:17:26 +0200
Subject: [PATCH v7 06/22] ARM: dts: qcom: apq8084: use new compat string
 for L2 SAW2 unit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-saw2-spm-regulator-v7-6-0472ec237f49@linaro.org>
References: <20240102-saw2-spm-regulator-v7-0-0472ec237f49@linaro.org>
In-Reply-To: <20240102-saw2-spm-regulator-v7-0-0472ec237f49@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=813;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8GuI6R1Z5Sky6UvDI3XfT9bRtWbw10CudRtLo2djAe0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlk5xjrWjDjHzu+sHM1Q5JePKJVoPKvYK1/yiZi
 bOARYjlkQmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZOcYwAKCRCLPIo+Aiko
 1VbZB/wJ6/jIZgBut7SlYiceH0md0dAAeKLTE23Ad24kGQFVoU69PEfwCg4YBzx9/pOGwdaDguz
 N13fkC05Q1qFFhV3AqTjq0OPZ75JiGdgZmdA4Msfkc94LSrUwkw0kGUr6OkPAeqgZUTlAbmgn8i
 Yvp1gCu+0vCMbMup5zMoLlp0q9fyWGF4+CoYGKcyNtRNvAAnASom8YUIRIrQb8EtPzmq7VtjM4a
 Cx32mjgbQs57rNexMs3GAmYZI3YjkGuvOQIDJhU1m6PKnwyG1/S9I4Pc2TntOyx7wlncPrpNPlv
 KBuRDG6OG+PPSn9B1JjZ8WV1BTBQT+rU9rmrWRzJo0b2qzjW
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add SoC-specific compatibility strings to the L2 SAW2 unit. This is is
to distinguish the SAW2 units related to L2 cache and the CPU cores.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
index 2b1f9d0fb510..8d630db4005b 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
@@ -650,7 +650,7 @@ saw3: power-controller@f90b9000 {
 		};
 
 		saw_l2: power-controller@f9012000 {
-			compatible = "qcom,saw2";
+			compatible = "qcom,apq8084-saw2-v2.1-l2", "qcom,saw2";
 			reg = <0xf9012000 0x1000>;
 			regulator;
 		};

-- 
2.39.2


