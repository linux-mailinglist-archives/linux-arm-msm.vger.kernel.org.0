Return-Path: <linux-arm-msm+bounces-79698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EE976C20968
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 15:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7217534F3F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 14:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553392749CF;
	Thu, 30 Oct 2025 14:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MXENT0Il"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E62A270552
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 14:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761834532; cv=none; b=neNTbVb602v7UTAU1mS6rAuo7Ume+DN9UlfwLFjizRxQoI2SesAw4/tGOxtENZr7KGsOBL+U45sSVVKSe2fP2UVQhe1ACs4JQzkfFBj3FwAmKVoock2QH/76LdG3X2DIBapStEYEvx5gHKshXhBLaJcs6WWuZ695XrvFL6YqKX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761834532; c=relaxed/simple;
	bh=xPbBKFvyY3b0q44Ov1uGneaLSn235ugr8EcPIsxzZCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nlgNehH82mqKYkPhPrGCW8QKlsum6tIDbsvg5r0HkF7D/oFpCqlydGFDzhpWTheJYNemZvufIjjX17tnbICfzZZOLASgB0baezPFj+cHr5EbZjU33b9KIr0YMcHcJho0ch20NOqjfqdJsmwFQoa65R+MSBenBuUyLmjrxY2UyFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MXENT0Il; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-475d9de970eso8074575e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761834529; x=1762439329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMpLeMNH7sSwMA33xyRkgoL+sxT741zRGSIt87PkKn4=;
        b=MXENT0Il/tEXUBz/wM0v81XOnTThwKpFIj7WOYwqKe4h7usbDJ7RKx98krsKPkYtnJ
         XhQppG3L0UaJW++3f9cO11X0+a0oGRXi4kUXTBLds03YS9StVG3tBmhZXnt/ztGJIsgh
         nnIa4qcXC2RtehhwqcU1yPzs6X0Z8tX3ZTxcKu6dDP8mRiQJpoM50s208Y8bN6FHIKBK
         yECDZscrNmmR+Imp+IPuvYdMRlDT3NZRtLeP4Quiw1Dawg/FGun0G+BEFAXbtzhXMc/G
         hzmh5vPOLSc4OLpR6l7+ApN98PQ+YWYTwbf8hJWeAtBTxaYvnL3OG58lFVXE1cccCMxN
         pWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761834529; x=1762439329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMpLeMNH7sSwMA33xyRkgoL+sxT741zRGSIt87PkKn4=;
        b=TCx/XQEobkz8eheitCrxxRCrPTSU+gWEr38V7qzQ+jQ3UNmX/5tVS5pSW6qpD2E2jW
         o8kwpmgXln35NOffaJfWVR+hD2Ta4vYBsIWsyKujGHdO9W+7msQVV3syFfSAMaWN9dpB
         UjYorZDEObeAXu+vIeuWuZmfBo6rbD4jywQB4WRDiqs+piD19Ev9tpoeMlw9o12kIalD
         AIjhMdxv0ymlLdC7WGMHADexcJKdvO+XD5S40AwXWSS5ocs7jXXemri1m6wmgiA0tNzq
         8QCt+Vf1hFXMnRkBdFBxJ2fVYnMxn6YidiaXaOAVHDkNwP3Vb7CkhubmjCmk1D+WUZGB
         NJHw==
X-Forwarded-Encrypted: i=1; AJvYcCXviIo2TM/08bOPMuUZAqzeSgOBGFqUulk9Y9CmULIeBTyG155JV+6lrci7XGpxsTBHCmne8yD6bW/kkF3r@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+GdCws5ciovGfhL/ygmkjKlrB+BqUpxZaFnZILZimA8KYkePA
	osy0bDHemjUsxyorcajxGmI03j22ey64bB/fZCioNAay1sg0FTSzIfaLPv/vwzMnOSU=
X-Gm-Gg: ASbGncvkIRJRojP3w3ksr5pC/K9e4bNMkBcdwkqwww/BrqH5ph0Al8Hp/52VS7j6CYQ
	+h4/9WUBDYEoWbzU+ZLZb9pf/a+VrPpu7g5eIPaHP2e370e52jyIF6sanVyYtVB51GghIvm+Gf5
	QNQb/C5AG0GOQQWv+u1ZmjMPz7+paWoZmpUZcnGId40JpHof6rAnXKou9Ej9eZ61g3JNA3lmtTo
	nQMy07mtM/h78kZFr88Z4/G2hLR9bj6e9vT0Wvy5B8/KorzrmLQJnapV5RSXVpbSAElRMPUni5I
	yDtEHKUndCp6tZcRKfW2IUo3bVQrwxe9A2jX1Sw+1h92E14pmPPjDKJsJ/ZrOz3TtzyCn9MgVdJ
	OtGMyaDObmgfrxVsLZKjwMYb6YvEtNQW6nI6vLKgNWib2+HxcsCgCKb30KJVq2R7wvtC2ovASpw
	==
X-Google-Smtp-Source: AGHT+IFvUUgJt/pBfFCRkI2lUvJeGd8kmVonHz+bVaufzA3NwxMJQo/JOQuLIQsN42Yu8n2Wf5HTQA==
X-Received: by 2002:a05:600c:1c16:b0:46d:cfc9:1d0f with SMTP id 5b1f17b1804b1-477267cd090mr38409765e9.19.1761834528540;
        Thu, 30 Oct 2025 07:28:48 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772899fdfbsm42230475e9.4.2025.10.30.07.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 07:28:47 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 30 Oct 2025 16:28:30 +0200
Subject: [PATCH v5 2/3] phy: qcom: edp: Make the number of clocks flexible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-phy-qcom-edp-add-missing-refclk-v5-2-fce8c76f855a@linaro.org>
References: <20251030-phy-qcom-edp-add-missing-refclk-v5-0-fce8c76f855a@linaro.org>
In-Reply-To: <20251030-phy-qcom-edp-add-missing-refclk-v5-0-fce8c76f855a@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2651; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=xPbBKFvyY3b0q44Ov1uGneaLSn235ugr8EcPIsxzZCg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpA3YXRyxMK4aGRKojtn6QDRiXbclf012HYvT25
 WCOAI+j3N+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaQN2FwAKCRAbX0TJAJUV
 VndFD/9OiCZq77cCkVqe2W7G0bhgx/Uo0ZtvIaadCqV1cMiOII57s9coJL9BN7vciu8wT8fYxol
 FDH11MlZSzdlGwritI3qsHNIYNa4osm37yz2zZKyo+Z6fh4JyRUePDyA2BJh7aoadejJ2FEKi43
 zAhK8h17ZT5jI5aT4NiMNifKQxNfM6AruXrl5XFAvj54dWwkaz78OdMySQG7vCbiV/qwkzW/Lhy
 EO/s0ZgrB568VC3W7dGbuU/ukD+JQctfBZ9Dbidtx9gLQP1kEuuOllR/CIYG52i08MmF/VqXDGz
 /SlEDzNzb3YSRmShPNfKyuvelvfE5rukVuF1KGqc1uiDrkTJLqaObruS/6CzVVwZ2AVbTQ722bz
 pIW9fRmxSGH6uzTvu8NmlGjx4E+kf66PElme/UCN20YtZ0/vbh5h5hJeQHUmNr1UWGxY1QqY4/X
 wNDLYM7ULoRJCb6klpgRXqwz8JKQqxH1By+EdC8WuB1YQf8ncL1puOzvLQ9EGCyv6OOJsGQeKFv
 Rt07HO9IyFrxTQ7YLiju3sLta8XoEbNJr3tD8ncfVCsaYOs3JyqcfP+mhe+LZ4hBRgmXOEna3CN
 UQQJd9hjzTM1N8siWbx6okvkneoaLQIKVoAFLgjb6ceZ92QU8PGVug2/Z322G4lC2RVJXKmKgsp
 2rby0e1q4ve453Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

On X Elite, the DP PHY needs another clock called ref, while all other
platforms do not.

The current X Elite devices supported upstream work fine without this
clock, because the boot firmware leaves this clock enabled. But we should
not rely on that. Also, even though this change breaks the ABI, it is
needed in order to make the driver disables this clock along with the
other ones, for a proper bring-down of the entire PHY.

So in order to handle these clocks on different platforms, make the driver
get all the clocks regardless of how many there are provided.

Cc: stable@vger.kernel.org # v6.10
Fixes: db83c107dc29 ("phy: qcom: edp: Add v6 specific ops and X1E80100 platform support")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index f1b51018683d51df064f60440864c6031638670c..06a08c9ea0f709106ceafa7b5f8c8c6856786a48 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -103,7 +103,9 @@ struct qcom_edp {
 
 	struct phy_configure_opts_dp dp_opts;
 
-	struct clk_bulk_data clks[2];
+	struct clk_bulk_data *clks;
+	int num_clks;
+
 	struct regulator_bulk_data supplies[2];
 
 	bool is_edp;
@@ -218,7 +220,7 @@ static int qcom_edp_phy_init(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
+	ret = clk_bulk_prepare_enable(edp->num_clks, edp->clks);
 	if (ret)
 		goto out_disable_supplies;
 
@@ -885,7 +887,7 @@ static int qcom_edp_phy_exit(struct phy *phy)
 {
 	struct qcom_edp *edp = phy_get_drvdata(phy);
 
-	clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
+	clk_bulk_disable_unprepare(edp->num_clks, edp->clks);
 	regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
 
 	return 0;
@@ -1092,11 +1094,9 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(edp->pll))
 		return PTR_ERR(edp->pll);
 
-	edp->clks[0].id = "aux";
-	edp->clks[1].id = "cfg_ahb";
-	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(edp->clks), edp->clks);
-	if (ret)
-		return ret;
+	edp->num_clks = devm_clk_bulk_get_all(dev, &edp->clks);
+	if (edp->num_clks < 0)
+		return dev_err_probe(dev, edp->num_clks, "failed to get clocks\n");
 
 	edp->supplies[0].supply = "vdda-phy";
 	edp->supplies[1].supply = "vdda-pll";

-- 
2.48.1


