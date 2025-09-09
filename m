Return-Path: <linux-arm-msm+bounces-72696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3414AB4A3CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 09:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E234168021E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 07:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBEB125A320;
	Tue,  9 Sep 2025 07:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CAnx/uxW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EA8310764
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 07:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757403255; cv=none; b=KcWcTELMsNu+yinXOGvlJil3HCNKLCVu1IHMY0AmKHjuyte98mUtk3caKgK7/9RgoM5rfLq6WteyXntUDWxdBIZiLOKdDo+QSwpDUkg1Ou9adRdcdo9J3ohN83wxD8PlsjN8OYf3Q2THRRV6Mw5v0+MPXQBbxk8CfEARUnJHoTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757403255; c=relaxed/simple;
	bh=xcF1+MEKiAWyH9x4MCi0tNb/KeZNSRVxlLDPwVgV2eE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C0FZO1cZBzb1Ebn3PJAFF1ovbkpGSl78DE2fc7wDkXOO+Szf8UjTm+mi1QLBgiiAPGZEgfh2jbTlWFBC3qheRb7OY6eORs/6TTCjY9UwGdLuEoDtmRlDrv8mDofZe1trFE8cMCSNNdyT6lZDo+KbKikEesQeQmTZYsnkxUrvXgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CAnx/uxW; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so6348275a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 00:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757403251; x=1758008051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rg/RhV2e1lLuIc3WSHEgsNCRdRmHci46R41Lm59lsc=;
        b=CAnx/uxWXdMFelJ8qG35f9qp0Wbj0xvDdjm4QCXOymidSdgMuD1a97CMOiluJeaEES
         vObZ/YnX69Rcv/66QOHrGXlh3Y7jPQMi6iqPAg1UjoEChFxPV0/qusknYP6W0Mkww53n
         vJjmPA4uvNLMWVYRRFpFWkA79OpbCmrOtYEU9aMM4oz1FNEcQcjDHs+v5yfccnXdgk9I
         MusuXp9HHObF84KikgWl7TNcMZyrZlJL+2wo0B34nKdLPSTvWNZDPAn31uSTgDPvxJ7b
         yeZifwK8cMGl23nxzxBPA0pa6ZCtCu4lXKXpUhpGRBG7P8rkSIVSRPMofvqdw0jh9iUQ
         lIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757403251; x=1758008051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rg/RhV2e1lLuIc3WSHEgsNCRdRmHci46R41Lm59lsc=;
        b=tCIu6ciDltOA/fUjrWgMBKH6LSIkiigKrV5mXKH7Ko8KJky8EdgLnAYHe9OkGLwiVY
         EeOb+DeQdIc8/m/aLEHMODsZ+u1t17MhqplSQsqY4iqr6kjLpOg4zOvr7u7nH/fkldni
         4Qa7laP/31kzD9uBbv86jisUfKx3ISoGrf9OGIqK09MT8D++LO6vu9DT99nYRqj/cgZm
         3J0w2eb5Bw0yz9FxLT1HEX/pJH0LBC895FMPsyaw4swxzLjAOWH9BwINBQqjofz6bq8Y
         qQAZTAXpz15Vbq3m19Yddj4QAVIjYoouyPQfaS6p58mtgq+pnuKqX3tBTPACxarpV3/J
         xGUg==
X-Forwarded-Encrypted: i=1; AJvYcCXPrNmMBzdERzn9F/ror0VOXzS/0sx2ec15HZ0ZCLKYE0R84h+K6kHnYS+mLnPRfcFCXUNkXNJp9KU5InZo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw67MOTCNLij1yq3sSpS1oYxvORyV4IeDv1yi8lMvjvTQM3MASW
	gKB8WOrl1fSMGAKIPa7wCitkzVus4RUDF8wAJD/Prvb1Gwo1WKWQrjAYrQv6WFiOtE8=
X-Gm-Gg: ASbGncvONoMHCXHIeptq0p6583AQHAKJBEiIACyFckGy6z8s5KFztckcOyE8vyeNT8k
	oX8JvfyQYn14DTNk3uvtCha0uv/am+NmRlrT/HeiD4RcnviSP48amtavpMXD+Xhmv4zn4HoSyeL
	bF4b5yR7pSHQ0KdbpvcKuMiGVuLWZJrOzkz+wL+UAGzQXrAoYqMNUVZA0fgxMxmCydoNmh1+BoX
	p7rrUMgn6RKRBUYnxxn+mCkXjaL0OJvPYodQ/ftupHRpYUAE+TGlBdTVCTsfFs9Pf8ScL+Pxs2V
	guGN76IdJ0iDAljAio6a+iIlmijhwU1x15QtUhL+M6cTU8JmEfo/QCHyDg9jTmpI+7GA/BPDCeN
	evbtewDxCBvnEnDcQmrRKk38BeoYDW4kFzA==
X-Google-Smtp-Source: AGHT+IEoui16Wu4c8S3L4aHsSGtceBy3SbjTMaW7kjjsQ9z2Qa3g8mOzn+XgsCcLq1MlKKPXh9Gwyg==
X-Received: by 2002:a05:6402:2553:b0:617:b28c:e134 with SMTP id 4fb4d7f45d1cf-6236d2ca6cfmr10693352a12.0.1757403250815;
        Tue, 09 Sep 2025 00:34:10 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c6a264285sm226976a12.2.2025.09.09.00.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:34:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 09 Sep 2025 10:33:34 +0300
Subject: [PATCH v3 2/3] phy: qcom: edp: Make the number of clocks flexible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-phy-qcom-edp-add-missing-refclk-v3-2-4ec55a0512ab@linaro.org>
References: <20250909-phy-qcom-edp-add-missing-refclk-v3-0-4ec55a0512ab@linaro.org>
In-Reply-To: <20250909-phy-qcom-edp-add-missing-refclk-v3-0-4ec55a0512ab@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2533; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=xcF1+MEKiAWyH9x4MCi0tNb/KeZNSRVxlLDPwVgV2eE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBov9hl9iMYgZprCt2bHiMuwgd4ZPePSdJzf62ZJ
 eLdCNWJWCGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaL/YZQAKCRAbX0TJAJUV
 VqEmD/91wM0XInBFmJjGixObCmJt3LI6LtRwaMv7DYq8yi7Urs/r7nnqxLAWlld/oCqPy5X7R6r
 Z9DqqQY5lkXKkB0ZB3rzG+B1/47QzK7Af2ZemX/wcxrYjBF1yfUiny+o0GQMZOigHxCuIOOL4uE
 voV59gKu4yfUMRO0Rr5tDsMFn78XK62mqEAHPvR7Iqk2u95696YDkDTsWthBfjUo8HZPLT12AH1
 z/oV2pg5T4RLoc/dVqdsS6gA5jJnvbqAONH/02oR8cMBurgK3cjE4CdvbZq6AxMr5vF/7hmns8N
 u+RKa03rubq3Skz60I+yCGEPjj64MyMwL1EvgkXSBHEkDfYtxcncR7Y2FQccds8vbZ/tIS/mkaT
 6WkgvTpyqda2PrF34ySWs5W5kULwBbBJhphbQzTZAGg+utlHIKy2lOava9Pw2KY/KxYPioEezGH
 wnvMdE5kT8Zu2npz5RHpEKJUXXWJsH523G5ev6a/vfh1TTTt92Okll7cR36c9qAN5jkDD7V85mU
 4kHQKPwFFC4edr33nBvpYMEEtcIWGk6i73T2tBZlm4SRA9/ufooi5bKGiMATnmV7A1+oF2owvZl
 pEaAI3/75mejOyR03EJXciZLY7WlLX+ssdHJCdfuEGmWIv+nUA6+XWnXXTKHTmeIo6ELKMAXZEk
 +uObN4KalA/p8Hg==
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
2.45.2


