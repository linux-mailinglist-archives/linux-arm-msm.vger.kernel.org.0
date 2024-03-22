Return-Path: <linux-arm-msm+bounces-14799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 597C6886973
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 10:43:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B75E1C214D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 09:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512A423778;
	Fri, 22 Mar 2024 09:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bxSbVXBJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FF61CA80
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711100570; cv=none; b=kShYXZ7cCj42szw1bCEt7LveSFj0knl+6lMbnfD3si9DUzV42SgTxqjfB46KYi4tZKKaqdJjG6kN+aCw6TwhUbCb2WCgcDDtFl6x+/jSueXQVZDz0V0Qgk/ayObk3hiW2xsAIR81VmW8djN7sLXWo+I54zwofXi2kqdQ5r061I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711100570; c=relaxed/simple;
	bh=Kx4iMHJO5z5RGLzsJX88ltZJ+Wx+25o5A/I8DsYjDng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGVwDtrdRalLQa7O69nB4SpW7ShT4XUYkJDy0SlK1JXrZj+BTZVGIW74jFdpB4o2SELsDsAGFvrlOE5LxYcWbf1rTJX0lt2mQwPjpQxYJfSH/O8bDTh+d+yUes6aWUWeyg77OO8FjOQ45XhYbrZwkIqP36gNQYWgqlCXDc1i3jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bxSbVXBJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4147c4862caso2909435e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 02:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711100567; x=1711705367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCVeYwWPRSz03B1OM4VXzQEUZALrlERjZIgaPDXj1aU=;
        b=bxSbVXBJws315bLuoeUeFTBDZEWNGletHf3hZXt756ZSPYO/tHmQCp8d95iZQPDGuO
         IEvGOlWotNdEDYVkAD8hLK4vqiD4mylz0NbP+WgV04EJGPmkfFUi2QBuwFgZBQ3dxzhQ
         bqgi9WhEEim0Q1BdiMHjyvtD8gFLQkBTX81x+5cKCEFWOPa/tT0XsrJCKAb80Hv9Tc4s
         LGB90QS87nxNAAmm5ea1HpM8tW0csCl2QhWtOZ7E36a5QiEPGIDkj2lQ1SvMSqWP7U6o
         wm5L7jQZzRuitUUoxGYFACcxr9ObhqkLSzOk2iK8ZGI+flwx6shxLXCAhcraVjrpacOX
         JP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711100567; x=1711705367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCVeYwWPRSz03B1OM4VXzQEUZALrlERjZIgaPDXj1aU=;
        b=BClcbdMB5AlxFsJvEygdvwjXrSnJo7UsRQVwyFAYLLBvKCyu2HA1k47r5RTOmNH7iU
         4B4+5Rx5q9DPuHrlzodjrMMRbz1ZctN8XG9ghAzmqtpfB/4m2XUIako4ja0a4Mo1fPJj
         //wN4QFe+fV7cwFh2vJB31aCUJYpgmq6qMYcVaewUlxVSoQR01bFNHZtZgDjebf3v/7C
         ovFOSwkKNzl1+RNvSftwx6Vm5ThE/8gjA5qZNfMqkLUUm/8rmtgorc8rGksqipOKDzbk
         rRNDOelY+9t6qYLdg2/FzEomIILIbTiSRF4hCtxzYD7z9cYhEobN5iXqJ3o6OrXNDF9H
         vhdA==
X-Gm-Message-State: AOJu0Yz7ap5N6Y5XuR5/qezdbQkLjgIDzrx+BTq+DeFBXiaD3J4InBgW
	SJqoKnm+WoF4u/zld9N9FhgvIsudwQ5xPPzb4a+Gn49x/757nMujoW2LZCiw8K0=
X-Google-Smtp-Source: AGHT+IHuvX98vufxnj4c0MPkLoSPVwneu2E3xOT/4wRhqnWE78lQbmyGtmWzSybZTB5mt/SGHh2JpQ==
X-Received: by 2002:a05:600c:3b99:b0:413:286c:4fc0 with SMTP id n25-20020a05600c3b9900b00413286c4fc0mr1244065wms.34.1711100566636;
        Fri, 22 Mar 2024 02:42:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c190900b0041461a922c2sm2547845wmq.5.2024.03.22.02.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 02:42:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 Mar 2024 10:42:39 +0100
Subject: [PATCH v2 2/7] phy: qcom: qmp-pcie: refactor clock register code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v2-2-3ec0a966d52f@linaro.org>
References: <20240322-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v2-0-3ec0a966d52f@linaro.org>
In-Reply-To: <20240322-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v2-0-3ec0a966d52f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1993;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Kx4iMHJO5z5RGLzsJX88ltZJ+Wx+25o5A/I8DsYjDng=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBl/VKRV3QKxg4v+M8JT2fAbX1GHt2A5QnD7QKumt8Z
 s4yRYgKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZf1SkQAKCRB33NvayMhJ0RfpD/
 4yoc9hDH+2tgpOUGvP8Jz8d3R1kJ7/9B9wDT3JPRVWRiBiP/dGO1eJl/Iwj+DgYHugvFp+iEPuCUHA
 /xOMr9SDEZy85xLhmLDBYZCHAQZtLyoYNi02ZwyHJ+cJM1MGMzq8H0NFLoDYVWxVkYJWzVAPOybBwF
 ojmpu7U1uJSMfycX6t9LfFetWI3+FUu0CZ+jchqV0vk9Io9hUEelywc7t7egRzf5r9XombNqjEaARg
 7MIC2yGMb4iC/0T8SOf8fE2w80fzJSgOQuF97GMuEsOCTagBoZTnk6bI8RgKoLbm3X1UewEQXIumaP
 gw975Bfz02lsG02mE+eeehjA5kiZ8cw4/CUysHJbBMFtvXaCV2pp1ldMpt8l5lgH//+lJFw9/+Cryn
 j5U9fJxmqF0Si79c1OPURBBqDp1/eluNm7MXx6eDBQ39NILu7Q3qtPolPXyhlQSnwJIz0+dKWkyS0m
 Zlc3vsrtaoVF3kKYoYios8inatr8RQ8gRd9t/FisXA2OXBU2ylgPMVaavxpeyaGxqKGCuk6g0/o/51
 3w6Z1plxH2RdQYlv47OYSI0wae7mKQjttKsd/Gi4opqjTbpWuOeoYaDcakKNAblF7ySlLHYz1Ck616
 N082i3ZTsAm26Wgulfz3NipQxmoU85imns6bilNEwAMOxMnuoxLnT4qvmfYA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The PCIe Gen4x2 PHY found in the SM8[456]50 SoCs have a second clock,
in order to expose it, split the current clock registering in two parts:
- CCF clock registering
- DT clock registering

Keep the of_clk_add_hw_provider/devm_add_action_or_reset to keep
compatibility with the legacy subnode bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 8836bb1ff0cc..e8da2e9146dc 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3664,7 +3664,7 @@ static int phy_pipe_clk_register(struct qmp_pcie *qmp, struct device_node *np)
 	struct clk_init_data init = { };
 	int ret;
 
-	ret = of_property_read_string(np, "clock-output-names", &init.name);
+	ret = of_property_read_string_index(np, "clock-output-names", 0, &init.name);
 	if (ret) {
 		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
 		return ret;
@@ -3683,11 +3683,18 @@ static int phy_pipe_clk_register(struct qmp_pcie *qmp, struct device_node *np)
 
 	fixed->hw.init = &init;
 
-	ret = devm_clk_hw_register(qmp->dev, &fixed->hw);
+	return devm_clk_hw_register(qmp->dev, &fixed->hw);
+}
+
+static int qmp_pcie_register_clocks(struct qmp_pcie *qmp, struct device_node *np)
+{
+	int ret;
+
+	ret = phy_pipe_clk_register(qmp, np);
 	if (ret)
 		return ret;
 
-	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
+	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &qmp->pipe_clk_fixed.hw);
 	if (ret)
 		return ret;
 
@@ -3899,7 +3906,7 @@ static int qmp_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
-	ret = phy_pipe_clk_register(qmp, np);
+	ret = qmp_pcie_register_clocks(qmp, np);
 	if (ret)
 		goto err_node_put;
 

-- 
2.34.1


