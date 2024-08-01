Return-Path: <linux-arm-msm+bounces-27736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DBE944FB3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 17:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 801A81C22208
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 15:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA7A1A7210;
	Thu,  1 Aug 2024 15:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u6X1adDr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CFB16C695
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 15:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722527701; cv=none; b=gq2Yj+9fTxZ92wU85m2NH5oNLYloqub03QRkj/sgTQXLPhO/gNkc2nfjceWxx9xBI1ioLmKoqzq0pZ6O4iUWyfJu0xPoIv1+9QQ6/HHmpdyDLgPa2mn04TwPKSJ/slM8R8laOrH9e2Zb2OT0+du2TQKm4ux2G6jgtq81dqA9WxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722527701; c=relaxed/simple;
	bh=6cux3j6Rbu/wHTJmCgExjhUp2vSPFFkhvp5tKKzfVN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FDXHQxjpwB+naKWVtcZC8fAodvFOG2ShVZblVUgAKyNiJmoxyQsi6ytM5+oSFW1KA7Xg+5v1RYqC7EAD7V+ylKxf7Bf3G4KSYTFKlXThP8flJNIhSbcGS62ZcYgJd9vHpSvf1JS9XQdB/ZM9Lr3x0yQK4yxuTmvuHQVNXGyIFpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u6X1adDr; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2eecd2c6432so107039761fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 08:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722527698; x=1723132498; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x6BV9QmEAZjkiTMkmAiRBs64RxnXZNT8FECYjYvT1F0=;
        b=u6X1adDrxxTAYz+kVzP6m1V7Vko17wyGXdmVp0kxMoaI/T/e+seyTRSx1pGYwbF6NS
         yBSn0iNXW4d7Z7Uc9lMbAlSuoscIQmIGK8a3QC0J82tzNZPgt2pE7NNgdhEiaY1wj1RZ
         vR4vohw2SJQ9t9SX+1uDWGSh+7X8VvhLmecKbdhcrrooagAYbBX5t7gOqPcoCvYE43yh
         qH/Adb4d7tXDpvs41NXjxiw5sr50UMuhfAm3giCXiPoLx27QzyL8X0uvSWjCXvX3XfFR
         P+nEn95bG4yTl0KnS80Med+sKheaMEh/bKIlMB9vIfKF6zMrzM+icYmG6eMYHhaJs6vU
         Ibsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722527698; x=1723132498;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x6BV9QmEAZjkiTMkmAiRBs64RxnXZNT8FECYjYvT1F0=;
        b=c7hzx4BHFKjr8r5//POtEF4aQXxE22h6LwKwWeOf+L8QzX4ZY4p6njtw24ODqr0UQ8
         cBVux+QFldK69NLZEFN50v8yW8qIcVAp3BFVAvqspnDNTSrux43pyMw02S/0pyrcZ6/4
         PgKZaX6I8ZdD1bYGoFCoyhscdob893qW/oEmYdQfWv6GPmqVR10lvJPKlzqKGMz0gyMJ
         CEKAmb6EM1D8TQdqYckzV09ACEBPZSJvLap/6yBZgLJLi6BlyjRJOdH0FHUUIFsjkzG3
         hPm+0Lr5EqmEJC1K20qjJmmSBCGW66oxzHk5IsEg/9MqtenBvn5CzKTdlofnnzxc8R0K
         9Hbw==
X-Forwarded-Encrypted: i=1; AJvYcCUKZ+kK7mWeNlndd9fa8XbR0Vdq7gFjUfjchz7Xw8Me/3iUTsjTmMx8/gonCjU6A7sFwmKlZeaZZoGtw5t4ClH7WMg+1cU2Hpawg6pZqg==
X-Gm-Message-State: AOJu0YzHke+ghftg9sPTaghmbzoa0Oa/FzajELzr2FS6kQOFHj2vLsQp
	aUQ73Xqtu2nybU4zrHJXBXgnnPX0zsvEawmm0xBSuuxMt8V31/hWEgH5JvgvAYs=
X-Google-Smtp-Source: AGHT+IEEjZBfQbOJPlZJ3N8sVahraKT0zAt/ivfisM4qzDwzl2muq0nwL80YGhGbW+w6PuMvXZHNmQ==
X-Received: by 2002:a2e:9e89:0:b0:2f0:27da:6864 with SMTP id 38308e7fff4ca-2f15aaacbacmr7091571fa.17.1722527697759;
        Thu, 01 Aug 2024 08:54:57 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03cf0f9ccsm24420651fa.14.2024.08.01.08.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:54:57 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 01 Aug 2024 18:54:53 +0300
Subject: [PATCH v2] phy: qcom: qmp-pcie: Configure all tables on port B PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240801-phy-qcom-qmp-pcie-write-all-tbls-second-port-v2-1-6e53c701e87e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAM2vq2YC/5XNTQ6CMBCG4auQrh1DG/505T0MCygDTFJomTYoI
 dzdSuIBXL7f4nt24ZEJvbgnu2BcyZOdY6hLIvTYzAMCdbGFSlWWlioHN26waDvBMjlwmhBeTAG
 hMQZCazx41HbuwFkOUGGPGruqLNpexEvH2NP75J517JF8sLyd+iq/6w8q/oNWCRLKXLY3xFTKK
 nsYmhu2V8uDqI/j+ACLlmHo6QAAAA==
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Qiang Yu <quic_qianyu@quicinc.com>, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2344; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=XPR2+c0CCvO/jb49BCvHwzlLdwGhGzTkMytpHJm9U6A=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmq6/PS2cKrlgInaIucMJcEQ35MEy17OMJ9rgv0
 4MAsT2BI2CJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZquvzwAKCRAbX0TJAJUV
 Vr6kD/4wVS5T+zFHq5JDyj2hySYykL00I1IFS7CCBxStgcguN5ewuQvxdyLmsHVLfuBLEJ+xdAx
 1VKz0GHe0UfzpcZXJEMGLH0mt4gnuK3R5GQoaaInrFogmt1UOcNzk+3s02REOo4/KK74yDydi/M
 pzTWpo7aqwNW6PJ9A6g39RSRY3AxcjIpCWUfmDewOrtcail7rViP2/sdVsuzmMrJk4LxMAbSqLX
 6VozCuLBO1mlvPHVOBXJriH3gycIMPrEI+/5rxNw6qNKrpgHale0Z67kK5APay3yCPGiHbVu3S+
 LBfrXlwo5b4n3ERbJbN0jqHhAiAXR+L0np6hOuxYMvaqmLXuL7hEYH+7z33i7/ycuQy4u5ILVmv
 QMmRjRWoI26B6B7utDzbiG9ADi/9e3f4FEsjWUCRCQGw/yQco+CaWIQX+v112sA8MImZ47eAe9I
 YTwMlACKh80oSxYgxLSNcJj/le5lsEj2/GpOJTSovmJ5ENkgB1pOZ6Han69AnXIhMpeU3I81HLe
 K9e6NTnZ9qP2ZCgAWpmanlxKOWFGtTJ1oGDIQmINzt/effBIf2/iy+B+sAYt10PsOp4OztsUPOt
 /ZjOlWHkNp0p/cg4q3EhInpplh5A1GK9u4T37RzyPOALIc/+v8GmCT5NpZHQjDIhwQfntkiC4HO
 Szjf559b7S5kgdg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Qiang Yu <quic_qianyu@quicinc.com>

Currently, only the RX and TX tables are written to the second PHY
(port B) when the 4-lanes mode is configured, but according to Qualcomm
internal documentation, the pcs, pcs_misc, serdes and ln_shrd tables need
to be written as well.

Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Reordered tables as Johan has suggested
- Link to v1: https://lore.kernel.org/r/20240726-phy-qcom-qmp-pcie-write-all-tbls-second-port-v1-1-751b9ee01184@linaro.org
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 5b36cc7ac78b..c0f4bc6b8ebc 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3660,18 +3660,30 @@ static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_
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
+	qmp_configure(serdes, tbls->serdes, tbls->serdes_num);
+	qmp_configure(serdes, cfg->serdes_4ln_tbl, cfg->serdes_4ln_num);
 
 	qmp_configure_lane(tx3, tbls->tx, tbls->tx_num, 1);
 	qmp_configure_lane(rx3, tbls->rx, tbls->rx_num, 1);
 
 	qmp_configure_lane(tx4, tbls->tx, tbls->tx_num, 2);
 	qmp_configure_lane(rx4, tbls->rx, tbls->rx_num, 2);
+
+	qmp_configure(pcs, tbls->pcs, tbls->pcs_num);
+	qmp_configure(pcs_misc, tbls->pcs_misc, tbls->pcs_misc_num);
+
+	qmp_configure(ln_shrd, tbls->ln_shrd, tbls->ln_shrd_num);
 }
 
 static void qmp_pcie_init_registers(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)

---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240725-phy-qcom-qmp-pcie-write-all-tbls-second-port-8efeced876bf

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


