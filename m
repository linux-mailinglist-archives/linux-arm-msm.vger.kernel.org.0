Return-Path: <linux-arm-msm+bounces-16010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BBB8949C1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 04:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC5D41C20D62
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 02:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E428C15E89;
	Tue,  2 Apr 2024 02:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I0v8V7Hz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584511429A
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 02:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712026643; cv=none; b=RVOT2UcCyd2I3yksnsUcDKhI4ciPN0J5DU9vR2zPty2wHPJTfCsNMDA5UrxqPYakQGDtSGs1Dm849t7uvJHslLgKlzCFtEVgChdDWQllDc4v2AF+KEpP4PMtPiHrQADdo8bfKc16kpLpTzByxY7i2rCugBv6YZa2V8FZ8uxQ3is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712026643; c=relaxed/simple;
	bh=ZjqkKDc8DJv3bb82aWF6rG7TXxmc2eeO/VaiOfqbMnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cv58wGPdCi3jb74zjdsIYo0MOOeQOrDeyf81j6dUJTSReI8eQkPqpbGEP4SKNo3y/RWotRFhAhLFJXZu8mzDdkYUjCrNs4IDB4CFq3VpMFS9WgT3KezRYHD4GLhqMKogng5CZIAxvU3R+FYvpP21enwTq+F4DswqxQu12KCeFcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I0v8V7Hz; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d4a8bddc21so64640891fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Apr 2024 19:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712026639; x=1712631439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoUhYVZ2Tq2DHEccutZmGIwFijmsWdx4cLjCaahu8LU=;
        b=I0v8V7HzXUsEqDkUX7IXvWPaXacysRaSjAYlBjTy9amWLxwKgKbV6y7B08y+lYlVpc
         g49r5SkRI9YFSNzYy+v7xK+Xrl0g1uhywWG9OISg7EE3YbnyKotZwoJZJvI/CuRAjN79
         WjzzuEFLriYmS5KFw1HbYX0OguxSy098WSKwwfh4dJCr5RAmcbhxOJlLsV1PUjAvTxhV
         y5oGo3cEA13igGT7UjRo3Soen6MBJ2o9XTORmMyVZtB+VCAs4qREZNgSoNG1ny36pfst
         uml8x2wC5digYjIARg0R1OJTWWLqns03p7+Ly9DtLMoXoK0oTGDCa+j0dodzh0yqtbm+
         8UkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712026639; x=1712631439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HoUhYVZ2Tq2DHEccutZmGIwFijmsWdx4cLjCaahu8LU=;
        b=U2b8wSzoJHxHFYR4x8sK1gT5tWQGWXvzS5gGiPNqS7sSulbEAx3eU/YQvZbAq8jVv0
         bOGWuR/LlWW6Y3JD3Y5bdXEcEnqB1sxQakSIcngc7tCGZHUMzOsiX3wqQ+4yPBVfjzDU
         jyL3v6kFpFcvOVOGwf89mw8mebnpgp6CM02DS7MGrnW2+VzYgYTxY3EXUJbbdrn+grsa
         26wgy9ngGovhp1f9KK5E7YaX/UiTuUciiJwO/J3rQK0qwWUjZc2/IoczZr8RWPq7zZQU
         Y1LfXzFgt5qdMfCv2CDgtfpr6Lhs7U4fBgCDmlXvGTQne0Yh8ryOXL9/9fW4kqCgDXrr
         OyYg==
X-Gm-Message-State: AOJu0Yz/YVnmPwpMLoPrOOCK2jrlTSznyUyiS3IfQktXgdWtITnhZU2P
	t+wLTosMLV5KMEIZ+k1cBpe4GQKBc/a3H8twQ0owCJX2/ptKwDODQj14hVttQDE=
X-Google-Smtp-Source: AGHT+IFJ5b4AhghRvjiY6bcxsVFL8TOH0DAdoKTGPdBTFNnvgUWxMGtlzzmwG8CjNYgJGYP28s9edg==
X-Received: by 2002:a2e:a264:0:b0:2d4:2b05:a671 with SMTP id k4-20020a2ea264000000b002d42b05a671mr5942436ljm.32.1712026639627;
        Mon, 01 Apr 2024 19:57:19 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 14-20020a2eb94e000000b002d48dcd10a9sm1562356ljs.86.2024.04.01.19.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 19:57:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Apr 2024 05:57:17 +0300
Subject: [PATCH v3 3/4] arm64: dts: qcom: sc8180x: Drop flags for mdss irqs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-fd-fix-schema-v3-3-817ea6ddf775@linaro.org>
References: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
In-Reply-To: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZjqkKDc8DJv3bb82aWF6rG7TXxmc2eeO/VaiOfqbMnY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC3QM9Kxk3hwvb09OlJ9nDtKjXYTVkiYfBD7l1
 q9qbaQhvwiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgt0DAAKCRCLPIo+Aiko
 1aNZCACZyNclBB4r6VXGa7ois5UQYWKrwpfg4MWCi1QjvtaNWRUGu0ahjUzFifVlG/oTkTnKr2o
 3ykyzBrYFUixoTZmVwgdnUXZbAqN/Maexbh5o0ay1FWZHm27PsBbib89a1+YRGqsl8hI/k0JjK9
 KFI64XKlSrfRaQ09BepY/efhwZWwE722dwyA8dYPfqCHgq/diVX/GgoqoR16fyXJBOIjVesdJN/
 imkLZfO9XRI01HmDZZY1paUGm7i0tYWvtHm3DpWvJspUiA/56wGobJcjnj6kTkQpcLbnS9Btym/
 0cbDFE+5AAcJXY2oyl88/WiBDI72g1LE3OKWORC+dlQJZxHu
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The number of interrupt cells for the mdss interrupt controller is 1,
meaning there should only be one cell for the interrupt number, not two.
Drop the second cell containing (unused) irq flags.

Fixes: 494dec9b6f54 ("arm64: dts: qcom: sc8180x: Add display and gpu nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 99462b42cfc5..6d74867d3b61 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2804,7 +2804,7 @@ mdss_mdp: mdp@ae01000 {
 				power-domains = <&rpmhpd SC8180X_MMCX>;
 
 				interrupt-parent = <&mdss>;
-				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <0>;
 
 				ports {
 					#address-cells = <1>;
@@ -2877,7 +2877,7 @@ mdss_dsi0: dsi@ae94000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <4>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
@@ -2963,7 +2963,7 @@ mdss_dsi1: dsi@ae96000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <5>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,

-- 
2.39.2


