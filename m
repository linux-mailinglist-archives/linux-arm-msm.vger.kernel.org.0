Return-Path: <linux-arm-msm+bounces-2354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEF07FCD27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 04:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B7E41C21015
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 03:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49F54C8B;
	Wed, 29 Nov 2023 03:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hs8pfRPG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C2611990
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 19:04:46 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6cdd214bce1so156149b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 19:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701227086; x=1701831886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tJGxAu392s/bORKdAjJBrcSJ8FzTjUlfAs3pgZbxfG8=;
        b=hs8pfRPGFma1EueAR2BfbQu6ZGHmezoKnRYlJB+1QWez5uW4HNwTgrlzZEKSaM3hOV
         7PAiCLSZu7G9sli1ScVvO6EHxvxuUo+tbOCjgCJGGWgiyDjanQ6N1IUkzxMK9uOumoo8
         Gq6In8LxsytvM8HW3Q+dNy2uyenZB/lahzkP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701227086; x=1701831886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJGxAu392s/bORKdAjJBrcSJ8FzTjUlfAs3pgZbxfG8=;
        b=s7c1SHaFu//Nfi4XrGrZqBF0dEWnLlNE9JB2qgUlFIgs6PVcNpl41EdKKzsqla1DdY
         nl5wUo5zwNkvQb2pDCdXTYZ3lnjF/FZOguOlhQvbwre7baUam+nEN1Gw3KySQRuRMviX
         AWPeByISnoZhA42Yg5HsYNyJDIvw+5b018CnSetFdOaWp3F8JJ5cmndEWvNhdKMQRmcD
         Z44zkqnyPSOWk0o0bxHrEXVALndEBdAiJeYA4UiOAn5gjHU+9LQx4FMg2OnvHSPrpuNP
         M9fLm1PEj2buzlPwZyOL0f67uvs2b30EyFbTTzwgswItlejt44i495cpUvwJyQVsgull
         DRhg==
X-Gm-Message-State: AOJu0YzG+zzBsNncFsLj8DlS6AcMdljzQPcRoajD3Z7xDqArYpW8tk/Q
	u0Jq0/sckeSAUK2dGX/Z76J2arszfsJWJBvMSE0=
X-Google-Smtp-Source: AGHT+IGygOdS0FDYG0MeUfrKyvdo448ZeERsKbGVJU3tooOdVfsvGLB+9h5K3ZINX8K1tfa6iwgshw==
X-Received: by 2002:a05:6a00:10d2:b0:6cb:4bd5:a4c5 with SMTP id d18-20020a056a0010d200b006cb4bd5a4c5mr20961101pfu.9.1701227085930;
        Tue, 28 Nov 2023 19:04:45 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:11a:201:d7b2:b65d:af69:8a53])
        by smtp.gmail.com with ESMTPSA id u12-20020a056a00098c00b006cd88728572sm4847426pfg.211.2023.11.28.19.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 19:04:45 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Alexandre TORGUE <alexandre.torgue@foss.st.com>,
	Yanteng Si <siyanteng@loongson.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Douglas Anderson <dianders@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: arm: qcom: Fix html link
Date: Tue, 28 Nov 2023 19:04:41 -0800
Message-ID: <20231129030443.2753833-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This link got broken by commit e790a4ce5290 ("arm: docs: Move Arm
documentation to Documentation/arch/") when the doc moved from arm/ to
arch/arm/. Fix the link so that it can continue to be followed.

Fixes: e790a4ce5290 ("arm: docs: Move Arm documentation to Documentation/arch/")
Cc: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: Yanteng Si <siyanteng@loongson.cn>
Cc: Jonathan Corbet <corbet@lwn.net>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Please land this through qcom tree.

Changes from v1 (https://lore.kernel.org/r/20231128002052.2520402-1-swboyd@chromium.org):
 * Pick up tags

 Documentation/devicetree/bindings/arm/qcom.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7f80f48a0954..8a6466d1fc4e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -138,7 +138,7 @@ description: |
   There are many devices in the list below that run the standard ChromeOS
   bootloader setup and use the open source depthcharge bootloader to boot the
   OS. These devices do not use the scheme described above. For details, see:
-  https://docs.kernel.org/arm/google/chromebook-boot-flow.html
+  https://docs.kernel.org/arch/arm/google/chromebook-boot-flow.html
 
 properties:
   $nodename:

base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
-- 
https://chromeos.dev


