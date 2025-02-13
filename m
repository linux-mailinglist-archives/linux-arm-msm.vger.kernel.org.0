Return-Path: <linux-arm-msm+bounces-47915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA2BA34A66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 17:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 015541762EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 16:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8620E266B7E;
	Thu, 13 Feb 2025 16:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dEVuCa37"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEE5266B6F
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 16:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739464087; cv=none; b=gu2c35OfhbfNUUolnoPXokkiaRP57F/Vqtg4a1ACvV4pnpyqug38ArpYm00XmXmsGSGFG6aXz6DJ6g7VAtA81dctrN5IAvg0wQGPWs5N8sB6FE6g6OUR3kgZbWmWadqJ4b+oZ2sYih/QldpQsLQ67jQk0FsWHti06tcmDb20Fog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739464087; c=relaxed/simple;
	bh=oNd12i+2YmkCuPYQliiOZGjMa/GCFMaAOwx4UZry5cY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IrVxZhX4cJksJwPBVkZ2rFCt91BEfNrnBCLSSst7V/vy4Fo0e7fVVTtShrsi6P3XTFSCsfsVPaZ73fUs2KWNsFgLofhw6lJ8JQslz5oSSkcj81BnV5WgoR3TOP0TbdhNCNJfLFTz7fluXPHt62men0keFkd/+6DaNKzrJeSHgSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dEVuCa37; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43948021a45so11691405e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 08:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739464083; x=1740068883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nckyoaf9WMSwIR46ubTH6va+VexZaxBrD6oq84P05tk=;
        b=dEVuCa37xF94crz1EBsIxH0OLchEiFA+EpYWKLk0sxfWJnNxZyo0/7E3yQbx8OW0DA
         V17YsF/0oLClf7g3wBubekl6hX7yl/BYvyKWDRVQWlK6Oq4UQlu1kNi9Olrk7Cc1On1X
         fEV2gav6/Wh1xlb13XaZJzugKAb7VT+TuubGk1AWcrWraLsSmknj0cUc7tIhnMPqc1Em
         LW96lt0ti1cBeZpxtNKZSyBP0cyV6TyKgfdLy8lX0CU0RwHkzsbdpTVshrjN1vKT50D8
         OcRbz1TcQ/Lg6eUZJ/6wg7WPH0CKKpvBzfH+JPZMT3dV1o0J7p6QLggyVeHinsHNAOrM
         NERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739464083; x=1740068883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nckyoaf9WMSwIR46ubTH6va+VexZaxBrD6oq84P05tk=;
        b=jIxO37NJurVw43hEMe8UxyTYCB6Kkbd0JAYEilwte54rpiDYqlXigvPTDhp6DDWaX2
         gOMdh8DKOvDbipgUbE+IzNhsFGkFxpmJiikknOvdZTknP9uBBkASznHL+oppKNDa/J96
         FqfkmT8CruBk5oha7bJ+MqeSjKFAqQ9nNAYj7VCnFp2iTZ2JqmEm9fMZeMIbmDfn57Rj
         bZxDoZMxaebzOx3jiruvMHJwjUby/WrjRLZinZ6c0YaImAubj1DALqUxmzLd5HsREbdw
         KsSAIB9Ysrxw6f3fnVj4w2OjAFijdcJQSRmNLb9cml9GM5Grq669aYyTD0SSm9cwkQX+
         CJGg==
X-Gm-Message-State: AOJu0YxCIzapcAQT804wrhn70B6xnZkgYWVC64MpBtH/Ni3zpm2VFJns
	qcZJP2nMIGvw/972JmPF8TAgGsdmJy6j6rnAxw4UvhfdkDhRzbbkQ3qOrOZ5KgI=
X-Gm-Gg: ASbGncuXzgRaob2Up9GHBIFBvpoZGIlrZ3xRxRxj9uKnnEAM6meAH1w4aR4djvV8KzR
	OVKjEroTb8hsBsqQLo+/jyxZIE9K9fg094g4gxBgyp52cfw0lD1+ctAuFovXak3t40gwInmeI43
	zRR/cGOF3hIYtpomwHBBBHWTrvLvxRKoorBsf48IzdpK+R895GZ+o5CLYm8YWzL0CEcWWJlwEeS
	dmmDxXCVWSqz9kIDXuilTfZ/0t2SQK+24AJZn4zBtb6OPoxJvMX+s7oKHy+pM2IT5WE1GltItFU
	D+foF0W+Jnx87GGu05mif7113x94CeTsFzlq
X-Google-Smtp-Source: AGHT+IELeKCADQgg3H5ZzZcXql0ZPJ1C4Uvb1zOBpoOn1s+Bz0PEz8ZZ92bF4HPtyxGd27LfKSXksQ==
X-Received: by 2002:a05:600c:3544:b0:439:57bb:2aa with SMTP id 5b1f17b1804b1-43958166727mr107502195e9.11.1739464083323;
        Thu, 13 Feb 2025 08:28:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b412esm2274382f8f.1.2025.02.13.08.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 08:28:03 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 13 Feb 2025 17:27:56 +0100
Subject: [PATCH v4 1/4] dt-bindings: display: qcom,sm8550-mdss: explicitly
 document mdp0-mem and cpu-cfg interconnect paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-1-3fa0bc42dd38@linaro.org>
References: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
In-Reply-To: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1989;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=oNd12i+2YmkCuPYQliiOZGjMa/GCFMaAOwx4UZry5cY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnrh2PxgSsYod7hW5BPfhjvjXJr3Hpc/Y4nGjmbpLq
 /LWeb26JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ64djwAKCRB33NvayMhJ0Q0WD/
 4qd13mpilaLgIGAOQgbLY3IKdNqPNm5kMS18FEVqOC1wxxdtMXcWQ2TV916MPWxwLWyZ0V+Ogkc7Vm
 wj7AE90w09sWjRWMNFJAaevlVjzFtRj7tg8tLEH2WaojWU91xJZZZxhDjnNImc44IiO4fn0OftaVmo
 2J3PnvAEDJpeDqfcDgBr3MWEm9wHjT/kGPjr6Ahi6f7dKqnFqMKAVBAmXEUx82IxzCaJDdnAoxZAlI
 Dx3TVYX5ofK3S3RyvhvJ9Wj8GwF+I8Apc14DU9RQZyBrtw+1Do6t598lCEFkf5UKGoc2WKNknHRoMS
 VmpNK1g+E9t32NnlryQo/qdHVcNuvEw35dcQe9Xhk2J0gYSiJO1ERiD5D6iCZAoFjwWiqw0JV/QlWk
 ENCrWpIIx3f+xkO2O48CRatyzt/5LHDLM9sprI3wfkgo1IdVeOmjDUzqdgQ6l8P/q8pF6out0DEETR
 apeKJV3LdWurx4UNkET5DYpweh4Gqo4tQLcKHrka/6Nw7/TPoVVTfk19sUnvOgA9GS7U+mkdsT+fqo
 xtRoN+LAo3ESej07wlqYf9wx+qprBUirXwTFlTC3QSOMU3aqiQrC8h5LaoAeYjRswn/7dSfjD+Xclh
 AEW9bbl3X2yhN+fPBK0yTONibKBvxtZ7jAeopKOWiGtzNr7J8t17swEwq47Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The mdp1-mem is not supported on the SM8550 SoCs, and having maxItems=2
makes the bindings not clear if mdp0-mem/mdp1-mem or mdp0-mem/cpu-cfg is
required, so explicitly document the mdp0-mem/cpu-cfg interconnect and
add the cpu-cfg path in the example.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml  | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
index 1ea50a2c7c8e9f420125ad30a80b4ebd05c9367a..59192c59ddb9c126ada43ada1430fa7569651f99 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
@@ -30,10 +30,14 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
-    maxItems: 2
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -91,9 +95,9 @@ examples:
         reg = <0x0ae00000 0x1000>;
         reg-names = "mdss";
 
-        interconnects = <&mmss_noc MASTER_MDP 0 &gem_noc SLAVE_LLCC 0>,
-                        <&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>;
-        interconnect-names = "mdp0-mem", "mdp1-mem";
+        interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,
+                        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
+        interconnect-names = "mdp0-mem", "cpu-cfg";
 
         resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 

-- 
2.34.1


