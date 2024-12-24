Return-Path: <linux-arm-msm+bounces-43220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D82139FBC14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C810163E2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60531B85C0;
	Tue, 24 Dec 2024 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="asG5TYMk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040631B6CF5
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035159; cv=none; b=dBL5KLXbuKjemJM1uzTsqevPeRnyD2Qjmq4CIMr9uuUrgQOJfdvLOkapwKH/IjYu2sQ5IyouGO/iWVll9mB/JKnrllvzhijbpqNODsm8QN7Yz5tlAeaqeVb+FS8TXWgpmoNd1sBLBKZenUDxfdPx8ieuC3ya2ZN2/Nibq7mxEuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035159; c=relaxed/simple;
	bh=fDugKsDeVD1y+LzqxMpm2ULzlklXCe9X5w6RlCG7Zeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CfiQCZ3/7iqQ2B4tnPCN2DsWJeBCLmXt5FefJ548txug/U2fJly31+03UXgak7YBmHzkPTGNS0t4ZQQ2OgtHXi79oTUb0e18/7dcATdgOAGX+D016tGH1V4I1mvItqsr7/91kXYlroili/vfciKzaTbq6jkDP0MTuB4nbvpeK8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=asG5TYMk; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e3a90336eso5484558e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035156; x=1735639956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSwKnWOLzkCsyJkMhnXokdr8YZs5LN4HoxuNCOPRu9Q=;
        b=asG5TYMkPjExmmE74OKhqY8ZUUaAi8JmTop2aTQWMR+eT/zIyed4eOcdZcZKBSfpt4
         IxuGBv5q1/PfreU1KBgIcuzQdxeRUwcrwiEqU20FdPk1YFfo22vRB1R1/ilA7nrvzVHK
         nKILQv7reKQSSZDFiw1pVSb7Cqa6HjH+IviktCe6KDUasl8QmirSULQAd7Eu4bjs1d9o
         d9X5EWBf038s+vJ1dVNHBiOMNLn04xkI2RuJKrUU0tdvAXckcis1UxsZq4AGyZqOBt3L
         z7vDdrviBSsvHZ5upJl7flR8s3TNScXZ5IsE5wU6EskvkQGnitz7ineuOtQu8HJiS2vS
         4cgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035156; x=1735639956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSwKnWOLzkCsyJkMhnXokdr8YZs5LN4HoxuNCOPRu9Q=;
        b=Al8ab8oBa+sfeKsUF7b2KyabtspCtNMzydmDQCPmoDKJA40cB0LlL6mc+s88OnsnzR
         2izXvzfgN+qYnVyMhRRkWGF6FHO/+rcfugpy28ETZwi3aOHJK5y+5HUyz8DgLvkiieS0
         HDUNwVYZoEKkZ0CIKuABNC4iI/ktEXV8eIPRt4/VRTH0KzPt6ZicPkZzkNyTbvntTWW5
         nkwDQx7us+Ttqe5gjoJYK0sPRA+IVtgGqw6akEtxFpdwf1BYQEPJj51yVfExECiKasca
         Iv9QMNzUGRKh3V6K6jKt9JaYmbXjX9kdzIRjH0ITvQVQMBtd5BRz/j7mCUH4951SYIQn
         lWFg==
X-Forwarded-Encrypted: i=1; AJvYcCVRlOt7Q4Z2tSEeAnLdOb8n6+YS3BVgQhGQKnUGlqSTqcD+WzFCS60hzVZzWVimCGsa9G8Gam+QTuYEEMm0@vger.kernel.org
X-Gm-Message-State: AOJu0YxHOAE6NFlfc6Q7K9DyF6pi2wqPeAEfs9c4a/1Juux7T4+TxJ4o
	qFFX312Rjtcb+V4uxQ8qrlMGVdXFNYIXwd6kpbqegsHzMv25aDzuxzJ2khb9o/Y=
X-Gm-Gg: ASbGncuaPku48MlcIVyVorMVyksQnQx01qxRyBXCZq1ImWHmlo4D26a4uPqpIaJGLZk
	PGfdAtET4wJCWfGSBjJLKx4ceiEI41hN55MPHPYR0sbUDTb9PdIQ6I/yWJTo5CZNKdaiWgg90SZ
	p1kKHprVuCZEOW7JweOTHjH4UUBZG9dQteA8egIk3yJMRvOZ7jgnFOS24GOL0GNHwimV8gE3pc7
	R+ybO5cCPk+3rsciIEh2foU0bgX4/qnHyjyYI6K5s3dyAAZg1G2LH4agwB/G5Nc
X-Google-Smtp-Source: AGHT+IECKNu67FWvHQ2QUifRTlJ037c4pteUklzWFsoIoNF4WT5PbdcpxFeMhO04XrfpCPUoVxMipA==
X-Received: by 2002:a05:6512:3d15:b0:540:1c6e:f040 with SMTP id 2adb3069b0e04-5422956040bmr4441373e87.45.1735035156215;
        Tue, 24 Dec 2024 02:12:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832073sm1574233e87.260.2024.12.24.02.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:12:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 12:12:14 +0200
Subject: [PATCH 2/4] dt-bindings: clock: qcom,mmcc-msm8960: add
 LCDC-related clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-apq8064-fix-mmcc-v1-2-c95d2e2bf143@linaro.org>
References: <20241224-apq8064-fix-mmcc-v1-0-c95d2e2bf143@linaro.org>
In-Reply-To: <20241224-apq8064-fix-mmcc-v1-0-c95d2e2bf143@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 Taniya Das <quic_tdas@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=809;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fDugKsDeVD1y+LzqxMpm2ULzlklXCe9X5w6RlCG7Zeg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaokMlip7bs0ty8+2O6ZJZqGn6PLk6+bLXnLc7
 tBdfVnA2j6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2qJDAAKCRCLPIo+Aiko
 1ejYB/0RXq3L3aWz7wWLSlNdpf03jkOd1D7/4rexEAxTxxMov83idgfrGiu7mDmn1FYnPPH8pUv
 BEsM2+xvqDdDaWqlIVYLYLAPGPzvRtwIMWnph6H8Rh6xVEiBgEvi+h3QhpL5csW9lGl1ZjsOGVw
 qQAi9RPU57hQBYOSg1a1W1wFFJixkhFRMBRQNf0yDWLvz7+CUTqtsj5qSnm7N/S5b2cYHUB6Gmz
 HLDO/wwB67dKOb5TXPRB5wrh7tDI6gjXkoyaaxgner1Me2ETOSpcUHuON1EtwFr//IEP/E2JgTt
 N1o9UtJwBzL7bRmYrxzcZMMAIKdwHj0W8zyeYYk2K8WlQcfd
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

APQ8064 / MSM8960 have separate LVDS / LCDC clock, driving the MDP4 LCD
controller. Add corresponding indices to clock controller bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/clock/qcom,mmcc-msm8960.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,mmcc-msm8960.h b/include/dt-bindings/clock/qcom,mmcc-msm8960.h
index 81714fc859c503cd865e61f78ba463dfa9431e8d..717431d735c18a14ed02502dd8796f7f135c416d 100644
--- a/include/dt-bindings/clock/qcom,mmcc-msm8960.h
+++ b/include/dt-bindings/clock/qcom,mmcc-msm8960.h
@@ -133,5 +133,7 @@
 #define VCAP_CLK					124
 #define VCAP_NPL_CLK					125
 #define PLL15						126
+#define DSI2_PIXEL_LVDS_SRC				127
+#define LVDS_CLK					128
 
 #endif

-- 
2.39.5


