Return-Path: <linux-arm-msm+bounces-79471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D711C1AD61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A59A634EEA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 13:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF263559E4;
	Wed, 29 Oct 2025 13:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cnZmI33y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C47B3559CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761744715; cv=none; b=X2Ysa/Pl3LAgWCIDgKElil+fUkDvb2aVFJlPm9ZmGSaETFz2TVuztJeKJLIUnhK/g1l9Bdcgy3o2Lw0+FqzVpb7zHAgXcVRKc4Jxj9Ag8daAhg0M3QTQLHNxKmKyUFCKBSidYhFKY5RrHI0pT/m00KXdqR1/dwY0xRUDB8X3obo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761744715; c=relaxed/simple;
	bh=8G7bBZM5fRStxMOcO22TYhdX2AnVHFbVN1k+A3ZBenc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p3ys6RrNQazH4Ay+HL8NlxSgWX4kT3AOUJvzBL5jtM4UxvK3YJc95KTjcnMGm1NJyx9RV5TQqATEbeDV7pHseEIxSLd9NgHdx6lAVaxARqF7y2WIJJ9kfg3m7KA2/HFzgmIVyyn/gVPXQugDAx/E9loXNV0N2m7zkUBr/XywDUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cnZmI33y; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-471b80b994bso99524755e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 06:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761744710; x=1762349510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cDnFmawmmprbP/aIYkdXiYRzW2ZBujViLSp90PI7KCk=;
        b=cnZmI33yXCjPWPt4nHtuXj+kCZ29CfTkcUUk3VDFGJqbn72pFlO5rRwVta6DDFlxKb
         yM+UMpYGPkWJsJlhrgbPts9CGVTBDPKeShjUn90Mshu0mqKSWVr4v57T4vNdQTH8hO0n
         ASRA5joUkfa4uSX5adjUA00W2CBxhDbJ1znMgKx2U2RMW1XN3VElk9qUxq2Eru4YdVda
         F2kHDO5EJhKpld/faSINFsVAsWYmNrRGx49f2txhicbpwOzSpeVp4pAQuhnNkJrveUf7
         n4khJxhpr1t9njy9t39o/w1sJB5++d7RDFCDrXIKtZ6b4M0s+sTV0E9wUA7TBnsVJsdh
         bYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761744710; x=1762349510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDnFmawmmprbP/aIYkdXiYRzW2ZBujViLSp90PI7KCk=;
        b=mQf21FtsQB4KiasGB5AZMCDzB08k/8Nyp5YPYJe8zm7O32uqaQXfpaP1fgabFmKfQy
         7Lz/0zq7QfYU0b7jPH18jghkhYRyODcxPjVetEdLnCpoW34HXlm3BAhvIATIG4/PuU29
         kmDuK+v5TOp/hGWgwN8nLxS3BznfOJEDXy1n4CtjRRnxFNbJ1DeE8oqs2B9PGJWIXNdP
         n8nRulQ2lWQkNNNf+Gh33D36opWXCqkunYJnglQPs/cEzjCkBDRFek3lcVEgR16/AH08
         b2SPHzBxlRt1msBGYUbnwltpGcHohzzeJPDW0qeO+aZkNae1hSUf3YRqFq4EqufzDPpf
         qLGA==
X-Forwarded-Encrypted: i=1; AJvYcCWmQf3HtSmMXR39oryqF5QLoKT3oNxWatdcNxCUAucOxnAnWbUr5u5onDmQjgE+v5E4O+DcutVwLY02/6Tt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4/SP9DvAQRDhahh/IDhWMmE5iHTkuAQtfygtt6jQaE6CrTGrt
	nM7SYs53eL8u+xZ/BMx+CxaCpBhklE8dFXT1jHu2gWjag9ZSpADc/+8+RCsCpH2WDRqu3tD9IAo
	pnYqc
X-Gm-Gg: ASbGnctjGzMmz4yDxxvd+5cSnYHu+gC1ix13yO1JQTrILyH7/9CV8cjGc4drZCzo1tU
	PfrGjqhxjHFeVDft7JqejuyWM8vwsyBv9I2NB9T+ypYp+7gonXZH1LnDcZKVB38T5pdhbi7VXyt
	sgYp1f2D/jmEkUIBlpJCocqeJ71hwYXSp/YwMmYK7DmNc2Rv2b96OjPQCIrmyiqQK5v4CajC1ef
	R/AYAkQD9DxxDuWIONKSk+E+pbgCfmkEIRNDHLwTHXl0HSgAXmkpl2dbG+mjKm/Cuj/l1EwTqlt
	kBdiamt41psR26KSmjMt8vMOhonOAIrLZZzTOAS+O9Y8RxMjcPXoNEG18PeyF5De7FXt/lZC+BW
	jOt1u4d0BtxTaIOnLID2be80u91vA00mZ9xi/F6av8S5ZYgPECTCoi1MR8HfixiFYBMHh36B6op
	kz5JNAl/HS
X-Google-Smtp-Source: AGHT+IFbg6BFEL/60ybW9+vLXJwBfQuA40HL8F0GZNxl3ke1BA0V2nBoyBT0JT9Hc1p/wv8b8DcZEQ==
X-Received: by 2002:a05:600c:46c4:b0:476:84e9:b571 with SMTP id 5b1f17b1804b1-4771e183b35mr31193495e9.14.1761744710195;
        Wed, 29 Oct 2025 06:31:50 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3b7cb9sm58273015e9.15.2025.10.29.06.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:31:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 29 Oct 2025 15:31:31 +0200
Subject: [PATCH v4 2/3] phy: qcom: edp: Make the number of clocks flexible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-phy-qcom-edp-add-missing-refclk-v4-2-adb7f5c54fe4@linaro.org>
References: <20251029-phy-qcom-edp-add-missing-refclk-v4-0-adb7f5c54fe4@linaro.org>
In-Reply-To: <20251029-phy-qcom-edp-add-missing-refclk-v4-0-adb7f5c54fe4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2600; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=8G7bBZM5fRStxMOcO22TYhdX2AnVHFbVN1k+A3ZBenc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpAhc6s4Uh/dUfAYZupYH9eljo7awvlT+dv+1e6
 RErvJ4IpzSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaQIXOgAKCRAbX0TJAJUV
 VjIUD/wOCZ2tSWzusRUJKd/vcgzBvxDU8jY9JQjwDoD9GHjINqFbKmkYTj5LVqVeXKpnET7fs1F
 94chs0bTrj+AOVZOq/3jz8Sxzg9sCvrwYBnhAMt2Dl8AoXf9r1b+dcnCq5bDV2mLQtVZYeCmljV
 rFKZ2DguPERu3m/vd1F5uPlQnM9nuHEYRTKEvmG3JhYWVwaqm6ssxYiqAWBTF7v8tsPO5BuhcYf
 ip4GgnypTrDkj3F3VNK4NH12mHNeagfsBbU2qw7qXQ9IUNyMGGS577/WhM4bC0z9xeBIfoNFO3n
 1zqm91VS1tKI27WFqb3RC7J/bgPvHUnzv0s0Bn4Pz8x43pmkbJSy5xdNEBaKl5FcTsmvATZhlzH
 mE2X4M5XMa6LDJ0J2N2g8TAk56Vi/9h5J7gBCN77NPjKErrPm3zHS2qSFCDEkNKsUdkRSve1oHV
 W2B/GUhH98W6POlqgQqNPiHKvtEKcDZV9pUBj9AiHtaJKjKU3hS4psPOBsafOstWL2HCcOMgAOU
 p+0EGJnYVo3s7MuiWiQRN6zNexjxJC0nLTlQcXwiPxC95lj+XiVd9EhLPHW50mFVw5pClLRvyX2
 D6EhVQpJjLW4TjYR3YLT8HgA/NvO5juEMNJROgvu4OrDy8EN/oJXqfcUoS+UGGVBA3Gl5q4phJV
 Rd1Ok9QEn26lofQ==
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
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index f1b51018683d51df064f60440864c6031638670c..ca9bb9d70e29e1a132bd499fb9f74b5837acf45b 100644
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
+		return dev_err_probe(dev, edp->num_clks, "failed to parse clocks\n");
 
 	edp->supplies[0].supply = "vdda-phy";
 	edp->supplies[1].supply = "vdda-pll";

-- 
2.48.1


