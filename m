Return-Path: <linux-arm-msm+bounces-12965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E44AC86C9B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 14:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FB922888F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 13:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C517E566;
	Thu, 29 Feb 2024 13:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XG+godrd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991217E0FC
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 13:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709212036; cv=none; b=QnjUW+32MpI/xTVhEvxHz2tzOfnHCi0QeXR2EHhJE1phlcT440hi1jUbqEEwjvqb+5qpvV7h63npnSwJ5Gwf9Xs5HH+bD1ZJPj7sriGdhNoqh0KkGK1VrIjysT201OSIocnnl9II+/KrHRn16t+6kG7GRBdDBDn+XNq6zaf4ohI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709212036; c=relaxed/simple;
	bh=cCW1iS1Wauzti7oU5CFmde3Uy5U4EhSg8/m1/ht6x1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iHHr7b8yz61k+HjqCN09zs273SvlKxk+RsLM9JQ0jZvwheeaU3ZVfodi8JcEYc0x27V0wmtRp0HJgEm9qslcW/qfScErHCtx4v4fGwGiwLRTzvoh1p42xyOXrRBR9dO4yJxjlXh74veMczt7w4Ho7HPbfGYgWOrO9c+TYu0HkGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XG+godrd; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d204e102a9so9081211fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 05:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709212033; x=1709816833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SE9xKWVsxs5pjWEcUUBayX/iRsKUyAQ4+9MJ8LDkXdA=;
        b=XG+godrdVhnwj75cwzMspkgqauyXhTZVuliIZe0QGCOApOtP7NyLV4DYhu98PXReee
         +JqsLFtQoxd70ItehI8NTAl2wWR+EJJK0QceIz1EwFhgnk78yBJ/itoolGt7mdJrGL0O
         w0IbDDmuYKnBthNnFmSGvA1Q6vL6FbegHswx2VbTQqwTDxqfWm5AgdYrAK1aWr+X9jx8
         vLWTMjGX0b89SaDc7mUdri3DmJYh4yjoMeNXp4957Dlt+OW0T9MnCqWitmasqZRHXEmi
         IWonMDZmWUlNR/C8zGij/v3Di0eSxnF0q2vsXYEyxkBNQZ1nfeilvmh+kHXJxSo0gjW9
         47YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709212033; x=1709816833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SE9xKWVsxs5pjWEcUUBayX/iRsKUyAQ4+9MJ8LDkXdA=;
        b=Kw/NRn3ILybmUOMzd5hr3aveefIsHy3zPnePd81dM4V7cHn75uiUvSc1bioXZ64+ag
         eFDTtQBrA8lyzqhenMLTpECYCXvJ24VXFY71mLASeKF4CQ9tQoLHw6PPwpCxq7+GYRn/
         hZiOuJDeTbk71wjazfEVhWYTnkz5DGsuXH/Y0IEGO7NgnD3o+k9syePHhjHUnU0MPCfL
         ZxcpR7NA4INeNM2kbQ37d5SN3uiENoBiEAdS2mC3BaHigth+vHNMdP4rBVQHjhW98epO
         2W5TD70YfMObfEK4UkQtESMlIHPQMZ+K+wR9CtQ8qCWioohzocx3LXQEs3Cl45nrPC66
         ND/w==
X-Gm-Message-State: AOJu0YwPiCUpZfJOy9JmNbnYVe3DUV4eoDiSRrrYty+wZgNWpFrZU0ls
	8JIfP5UdwPVrpheIjCxVOfYNjV4gmFK7qW1RhY5JX6MJwl/tnGz9pipCEu5IL/n8s3gWhhwrJEi
	rmSg=
X-Google-Smtp-Source: AGHT+IGn3VGQDNynXtqcROY+w95yeAvZysb2r3gp3IsB+wTNLRr3RGjZHc70TRsmgv+AcGSj2xhEsg==
X-Received: by 2002:a2e:9a8c:0:b0:2d2:3758:8c2a with SMTP id p12-20020a2e9a8c000000b002d237588c2amr1296864lji.9.1709212032736;
        Thu, 29 Feb 2024 05:07:12 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id t7-20020a05600c198700b00412a38e732csm2071473wmq.35.2024.02.29.05.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 05:07:12 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 29 Feb 2024 14:07:02 +0100
Subject: [PATCH RFT 2/7] phy: qcom: qmp-combo: store DP phy power state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-2-07e24a231840@linaro.org>
References: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org>
In-Reply-To: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1271;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=cCW1iS1Wauzti7oU5CFmde3Uy5U4EhSg8/m1/ht6x1w=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBl4IF7bfuu4oiH0n1J3IHdK+9gk2M/GXn3L4FSAJzD
 REKJ/kWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZeCBewAKCRB33NvayMhJ0f7PD/
 9B/AG0x9Ko77sX1GbvkvxzHtijD4Bw3hLJo76GiC/1U/uQL7+VmW/MeEUZaHPrMUswPByMjJ7HEZOA
 ri/6gD4+/LfMFbN6ehU8dOCbNSbmvTStcToPkSoLSYhrxpyRBdGWgBntHQKayPqJUPrKkv3SQ8xtdq
 kLuev342eIkjoALEKYA2xx1cs302o/4n4HNIrv/kEThLoUUc+5lMefqx+fhUoCt5MakeV0NJZ1UK/r
 tGuDqbtJRxfz+mdD7zjgkHZOpf9CGfAToix82dixhUHYeFlqKPd2QNPy83blIZcpUwcSYwdVOBq1u1
 aZ5XyfSEfuJxKASqrkQGGRGtUCj2XjG2W5qpFtx+3HHsFmQ5dz8WN+xG9lcg7O9ijLf0BrO2EA3Ft1
 jNnGLyuiWUNjCc2SCUO0SD9Gjz3v6Kx+i084vOjAsZUXlYwgr5PRlDmdvgGOsNMtcTMvCeUq5tn/4L
 ao2z/ZVCfVTc7bkAVVwW4Ve4LLw0Dprt+jCWuwtrG6fP5xGYTbJLrqpw+uTKQ0z5+moTFyMnhtGWhA
 dWYbv4XhBb4DD0rHDCyTurMl46oY2HtmVSUrc5mAg+VtVw8sTfN8ks82Wy1sF3XNdTLFj+sgtAwOyn
 waJt1tdhtHBaQppNM9XhU5RnMbh8GvrSAqIZsgewoG9JhfCiR0SVZoM4lfqg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Switching the PHY Mode requires the DisplayPort PHY to be powered off,
keep track of the DisplayPort phy power state.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 2f341613fd31..3721bbea9eae 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1500,6 +1500,7 @@ struct qmp_combo {
 	unsigned int dp_aux_cfg;
 	struct phy_configure_opts_dp dp_opts;
 	unsigned int dp_init_count;
+	bool dp_powered_on;
 
 	struct clk_fixed_rate pipe_clk_fixed;
 	struct clk_hw dp_link_hw;
@@ -2627,6 +2628,8 @@ static int qmp_combo_dp_power_on(struct phy *phy)
 	/* Configure link rate, swing, etc. */
 	cfg->configure_dp_phy(qmp);
 
+	qmp->dp_powered_on = true;
+
 	mutex_unlock(&qmp->phy_mutex);
 
 	return 0;
@@ -2641,6 +2644,8 @@ static int qmp_combo_dp_power_off(struct phy *phy)
 	/* Assert DP PHY power down */
 	writel(DP_PHY_PD_CTL_PSR_PWRDN, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
 
+	qmp->dp_powered_on = false;
+
 	mutex_unlock(&qmp->phy_mutex);
 
 	return 0;

-- 
2.34.1


