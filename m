Return-Path: <linux-arm-msm+bounces-27932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ED1947F8B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 18:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36ACC1F23549
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 16:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E070F15CD4E;
	Mon,  5 Aug 2024 16:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="txN3Oxwq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1897B15C15C
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Aug 2024 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722876334; cv=none; b=hghvdg58QGeQfby50ugDApniPAIaJQpfHODzNNhO3Eqi6+DzLRcj/EgFLIePVF99cP4YAtBmXevUfW/u2NgRp5dSmiQthwqXbfuqmNJcCQkbCjJ9CtVmvAccbiuxHuXed5BgAWd1wRyCKJbni0GKq4Ja8YEE9dd4uxiNQ5X2eVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722876334; c=relaxed/simple;
	bh=sJWzkvl/aR7f5GrnGGB8vkEg31mGwtIkJRIwBBb5O3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=czzrJdlxp+EbXkQBoKisqNKXusfQAdnAE2IAkW2X9RKtGP1hVOGT+3MiYr3k1sOu4bcuZAw+0UtXZ0nPowBvmCG0+SPUjyKuXbzq98GSyEMnO3klEoJDDX07/GCBNv6V/1//e5RoKukb8i/6riQNc43/5y9/c9BhCoosMtSLAOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=txN3Oxwq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-368526b1333so3458153f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Aug 2024 09:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722876331; x=1723481131; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ik8emwpg7EbHvzstVNP3zM7OlW0rWhbBN/nKCI4WHsQ=;
        b=txN3OxwqeHLOSluoni/joNTPfNAR7THbDtC6HaHY2n1wmEHK8xs1RxbfFn6TLzdB25
         RQBaoajDRXzt5WFDkzBUtzEGToBXA0o54eKP1iM9cyjb9uS1C20q58IT7x12+ejO7GYz
         HurKI6f9lD9xGlpKS8DBOXCAjjGVySVwa0zmBM5bubJjaVJGsxi8QbmMQfuN55baVcMR
         5LJkGoq0R5FKVeE9RZMChrxicmNcNzm6ys2g0cRywxEP6YRLmjDXH+jfT0+yoLWNtDvi
         XfQibwJVyFpWjdAqhhSyYdoVVJY/ASwC4o2XxGVbqf5KTzISb4AugPUMNVDXVrH4xQ2X
         5pqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722876331; x=1723481131;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ik8emwpg7EbHvzstVNP3zM7OlW0rWhbBN/nKCI4WHsQ=;
        b=JG0rwADmorBySRePWyUR710S3ui3eFMFaKbTnrS6ekj135P4fdYFTrwHLelELKGGCt
         otwJxfBENslnPMkd6yzPEgpZwtUxwFz1n9FekbS4vDmjUXMKQZ6h/HrRbqbjhlXkfkvA
         XA8z8JI7DtlsUyfqk2/o/Y7bpG16eov7uydFPzcFQXEnWkrMqVDQgAubQ4iqCR58X8Sp
         cRO+luvs1rDhJfpGYqtNTeZsNN+5no5PxjedY1t85XCrklUDAcoWCdoJ34nULPUZJD5y
         VZxbvaJWeFEPdWrqn7FuwX344TUvE6nbqCIkcFe5P27n6NVjfBFPdFJd1eH9KyFjJMRg
         KPlA==
X-Forwarded-Encrypted: i=1; AJvYcCW4UB9zpfwRGGFJD/+QSDOqUdF9c6PwBq+x06TVQUL4kV/AHrTJ4dDccKqpL3s4YqLvxDJT8diJl4i2AC22dw8feT14YPwOQQdSaSTOZg==
X-Gm-Message-State: AOJu0YxPmzHjDAWl5RU+VqNXarpMOIfOW+dqt5Kmi4bGFbY28ee5i0Xp
	cE4kCboxZI+ch8svRnd4U8947J1m1QjPcL3V4LrK+J0TAunUBlW7PeJNo3ZqDC4=
X-Google-Smtp-Source: AGHT+IHl+gYovfR74z6A+TtvK671+5vsMnn3duvbGqXdHqVfmO9kGsU0MyOwnZ+cfRHTSHRNsS20LA==
X-Received: by 2002:adf:f60b:0:b0:36b:aa96:d1e5 with SMTP id ffacd0b85a97d-36bbbe5b841mr10555387f8f.18.1722876331267;
        Mon, 05 Aug 2024 09:45:31 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd022ce0sm10391679f8f.55.2024.08.05.09.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 09:45:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 05 Aug 2024 19:45:18 +0300
Subject: [PATCH v3] phy: qcom: qmp-pcie: Configure all tables on port B PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240805-phy-qcom-qmp-pcie-write-all-tbls-second-port-v3-1-6967c6bf61d1@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJ0BsWYC/5XNSw6CMBSF4a2Yjr2mLY9WR+7DOIBykZsgLS1BC
 WHvFhJjHDI8Z/B/MwvoCQO7HGbmcaRAtosjOR6YaYrugUBV3ExymXIlM3DNBL2xT+ifDpwhhJe
 nAaFoWxjKNkBAY7sKnPUDaKzRYKVVXtYsJp3Hmt4bd7vH3VAYrJ82fRTr+4XyfdAoQIDKRHlG5
 ELo9NpSV3h7sv7BVmmUv7rmYmddxnqOWWIUF6gV/tWXZfkAJ68lT0cBAAA=
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Qiang Yu <quic_qianyu@quicinc.com>, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2688; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Pd8xi9GZtKKuLhG/bVw3bPRSLWuEht5PPded4uGZ9o0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmsQGkZGYeBcrws5JCeBcYC3IX2no9Y3tVI/U4a
 GybVRCD9rKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZrEBpAAKCRAbX0TJAJUV
 VqZdD/9/leWIILuTtcGIaBTHfLTtI0/fiTycKaPgdUgUOOfn9s+D2lpp+iYpo8Emup80azNIu46
 0fkFWCUb6eYfjsybaMYrmJYgzKsdEyVSgQwBZka7rvZqSzBRWzwXeZRX/4GYMmCg4O9w9bpSJpT
 KFj7rIn3RvT6IZRe/h7CYtTbzJ01kThmViGubrLg7DXOiCAFIwzlt0uWCLTyvfPsl6Eih0JZIIv
 0gmMUfNRIDUYIHTOIusBrvMLA3e9t4xij+OZmke8YM5zADK+sjoHXKPXuZeIkdxjdaEb0qQxxhs
 ycYZQix/ho+YeOd/Ur3J1TUyodszTjjHYeJ5QTj8UqkB2IChBSHXfQOF1NW8kDn+NeUZkHFQl1D
 B6ZAQhul+/zGVWffu+9kp0Fz/uB5BfgsmMHlJWPTqckgsQoJtB90t68EgfcGI4w+zsk57vhe+DN
 Uv43ma/YWi7KmMW+mqsEIWMrWCOwiJomXU8K7qM8fIeXMnH1eZ3ixTN+4y49bo8VwQOzg0DBKgx
 J9kjraINQx34O4Of2y40fLxqVHwFCXYze+OWtONnfOkzC87iEdXyli7TZcTIWt2H+lbUWLJU3Df
 TdXm7H/yNi7lpUZ8M7dGx+yxCADyGipb+p1exL1LPQ/aVbKWYJ71hv7W1PXa9z6em/xnvPJhJIG
 wNcxtSZVuigOUbg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Qiang Yu <quic_qianyu@quicinc.com>

Currently, only the RX and TX tables are written to the second PHY
(port B) when the 4-lanes mode is configured, but according to Qualcomm
internal documentation, the pcs, pcs_misc, serdes and ln_shrd tables need
to be written as well.

Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v3:
- Rebased on phy/next
- Fetched Dmitry's R-b tag
- Link to v2: https://lore.kernel.org/r/20240801-phy-qcom-qmp-pcie-write-all-tbls-second-port-v2-1-6e53c701e87e@linaro.org

Changes in v2:
- Reordered tables as Johan has suggested
- Link to v1: https://lore.kernel.org/r/20240726-phy-qcom-qmp-pcie-write-all-tbls-second-port-v1-1-751b9ee01184@linaro.org
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 4b4a10f7f6d6..a7e2ce0c500d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3669,18 +3669,30 @@ static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	const struct qmp_pcie_offsets *offs = cfg->offsets;
-	void __iomem *tx3, *rx3, *tx4, *rx4;
+	void __iomem *serdes, *tx3, *rx3, *tx4, *rx4, *pcs, *pcs_misc, *ln_shrd;
 
+	serdes = qmp->port_b + offs->serdes;
 	tx3 = qmp->port_b + offs->tx;
 	rx3 = qmp->port_b + offs->rx;
 	tx4 = qmp->port_b + offs->tx2;
 	rx4 = qmp->port_b + offs->rx2;
+	pcs = qmp->port_b + offs->pcs;
+	pcs_misc = qmp->port_b + offs->pcs_misc;
+	ln_shrd = qmp->port_b + offs->ln_shrd;
+
+	qmp_configure(qmp->dev, serdes, tbls->serdes, tbls->serdes_num);
+	qmp_configure(qmp->dev, serdes, cfg->serdes_4ln_tbl, cfg->serdes_4ln_num);
 
 	qmp_configure_lane(qmp->dev, tx3, tbls->tx, tbls->tx_num, 1);
 	qmp_configure_lane(qmp->dev, rx3, tbls->rx, tbls->rx_num, 1);
 
 	qmp_configure_lane(qmp->dev, tx4, tbls->tx, tbls->tx_num, 2);
 	qmp_configure_lane(qmp->dev, rx4, tbls->rx, tbls->rx_num, 2);
+
+	qmp_configure(qmp->dev, pcs, tbls->pcs, tbls->pcs_num);
+	qmp_configure(qmp->dev, pcs_misc, tbls->pcs_misc, tbls->pcs_misc_num);
+
+	qmp_configure(qmp->dev, ln_shrd, tbls->ln_shrd, tbls->ln_shrd_num);
 }
 
 static void qmp_pcie_init_registers(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)

---
base-commit: d6dbc9f56c3a70e915625b6f1887882c23dc5c91
change-id: 20240725-phy-qcom-qmp-pcie-write-all-tbls-second-port-8efeced876bf

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


