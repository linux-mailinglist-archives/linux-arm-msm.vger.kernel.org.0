Return-Path: <linux-arm-msm+bounces-8655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D7583F2BE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 02:33:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7BCD284D73
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 01:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70791139D;
	Sun, 28 Jan 2024 01:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S82W5RFe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863771373
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 01:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706405577; cv=none; b=Vwjrgu0V0/hl1TdLJLi1TyqebeK2kL7faWSWWbFZUkJ8OVpUo0mrLGqHpXbHL+WA7pHocyVc8w7Y/08W6GvAmQBsKJNUQ78fuHGuSBEAH95ko14k3pysygXFAQGdbqIqZfEk3TBvBS9bGYTLZybrqd2ocCtDn885izrAJyZx1zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706405577; c=relaxed/simple;
	bh=JaKT94RptCBEHogJS1KEczwM4Kx5YqwwDyj+Pj89O9c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JzmG5yAp+x7CBxOHlkuKG+69DSwmWPv6XGGCiR3bm2OOYiy3fErCVojnpo8lIf/ltF6A5kkSh162jJbTXhQTIzy4nbdDNeYnY9QVXWruxu2xqSmSy/5bm26EJ7+LQOJIIheTVCsmNGQrNEz2J2VBLua8K3JpMSYFWMBRJ/RpvVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S82W5RFe; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d041df72afso2336551fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jan 2024 17:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706405573; x=1707010373; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WsoiAQCfFV0sJjZnlPvgAEXM1QdLcaV3g6qtEIJ5xps=;
        b=S82W5RFeJLG4WStwKSpFhlkJr7ujYJY/QSoCmeZ/QxQsQXsIlBypb06F42k996jYkP
         Nmwu3wSov685tOSU7ZPVZEUz1yM5I7awNhkF2eRdUzkMHgEuRDWq3jNOz5fAqSflzOKd
         BaT+0AZMXfnXwhGYEEoTX1jydrHOeA1A0YGK28GjIyeFt2YPZIs5xwPa8CsF2zx7JK8c
         9keZqLqr5KQHJXkrnXhf/wQVZXvw0HNYCyZOpqKbsSfufIQkRceSaJiMhIoYxAS+lp23
         hcBtCl3FNYqxYLpEj4b7nMmT0qgHre34Y4va3p5TyQGP23WouXUkytwZ9ou0eHbO5412
         1FFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706405573; x=1707010373;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WsoiAQCfFV0sJjZnlPvgAEXM1QdLcaV3g6qtEIJ5xps=;
        b=ixRm7hGNPEbFmcZim4eDCXSEfHX5/VEdp3xptie1ZpPKlupXHDD+P/CJ/r7gEnXcgn
         Z5RBd9Txh0ZLwM3M4DEKz8J/IOQHYhOaj2kLtnhSiKggq01ax6nXXpRRWoV9p2EJsoJ1
         wI6fiAaVN/KbH8JYkFaVt35/B+rlF7gBhUCsaxmKFOe24Idz5O3rDMXnkZ70eAMRp10T
         u5TdYQIUWhEE4K0+rIq8+pj/LrpDLX4AEPx1ptoHjdSkmSidUrBTLGFSKsXxFcZISUXS
         LbcPiCzunULgaIeuXhsxYB0YmZ1nkljQRhM1KFOJw/Jl66Ed59Sqftt3AR64Uj7kg5vt
         QveA==
X-Gm-Message-State: AOJu0YzJbuIH51CNFNduCTkfmEqtGhxy7MQkqlQrp9CiqGwONvHk2iTb
	qciaT35lKcRUe8kJzETfye/i2a2dpnu2vodWHcyJ+odwypveRxSR+ePWY82cc28=
X-Google-Smtp-Source: AGHT+IEmIq+1+AR9VxbTbavhkAGBVoUWo72nExx2zLw/wmd/3wBtaysEcX/ghN9epg/6cei0OuAf/g==
X-Received: by 2002:a2e:9b51:0:b0:2cf:4b6d:3629 with SMTP id o17-20020a2e9b51000000b002cf4b6d3629mr1714580ljj.9.1706405573249;
        Sat, 27 Jan 2024 17:32:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y14-20020a2e95ce000000b002cef959509asm662150ljh.24.2024.01.27.17.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 17:32:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/2] soc: qcom: rename rename PM2250 to PM4125
Date: Sun, 28 Jan 2024 03:32:43 +0200
Message-Id: <20240128-pm2250-pm4125-rename-v2-0-d51987e9f83a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALuutWUC/4WNQQqDMBBFryKzbkomJrV05T2Ki1RHHaiJTEpoE
 e/e1At09Xkf/vsbJBKmBLdqA6HMiWMoYE4V9LMPEykeCoPRxmpEq9bFGKdLWDROCQW/kCIcrWu
 aa/3oL1Cmq9DI70N77wrPnF5RPsdLxl/7R5hRadWg1x513deDa58cvMRzlAm6fd+/b3fCGbkAA
 AA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1249;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JaKT94RptCBEHogJS1KEczwM4Kx5YqwwDyj+Pj89O9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlta7DFjNEQZo6kPJixFkabtPgYSnb3kXGOfP+v
 Ua215pzaUOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbWuwwAKCRCLPIo+Aiko
 1dGsB/0VhOvpL444kUz/LaHPcc9n1SFMOr+aWVuACam4eBKZkQ4U+LFmZm0BqwiESOSUseFyKkF
 lpKrg++Nd4fm250CKEoT+Xh9DubunSMiJ3pmrkZiaq8T4weASw1iyQSS/qEx6xboG46urqJLOkc
 3ZwgxLVR/V5bm5Sv622Hn0okizP6K2tQ/RRBTnm5xvJGb9XRcaaQoZ/ZMVjuQyayIC5UAZvPuro
 CAKp+7zFdLtq5e2aZciDo41xO/w+tQF6aq/iVkAA9bZUCPt3x7CqQDx3RFM/DWZGs1kjJBWmupV
 8/piaW8P0fOjpZ/G+MKgb/ltOrzHuhaefg6r6LemDM0T94Cj
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

It seems, the only actual mentions of PM2250 can be found are related to
the Qualcomm RB1 platform. However even RB1 schematics use PM4125 as a
PMIC name. Rename PM2250 to PM4125 to follow the documentation.

Note, this doesn't change the compatible strings. There was a previous
argument regarding renaming of compat strings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Rewrite commit message to mention that RB1 schematics uses PM4125,
  while DT uses PM2250.
- Link to v1: https://lore.kernel.org/r/20240114-pm2250-pm4125-rename-v1-0-71a0a103c3d5@linaro.org

---
Dmitry Baryshkov (2):
      soc: qcom: socinfo: rename PM2250 to PM4125
      arm64: dts: qcom: rename PM2250 to PM4125

 .../boot/dts/qcom/{pm2250.dtsi => pm4125.dtsi}     |  8 +--
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 78 +++++++++++-----------
 drivers/soc/qcom/socinfo.c                         |  2 +-
 include/soc/qcom/qcom-spmi-pmic.h                  |  2 +-
 4 files changed, 45 insertions(+), 45 deletions(-)
---
base-commit: 01af33cc9894b4489fb68fa35c40e9fe85df63dc
change-id: 20240114-pm2250-pm4125-rename-e1f457783bc6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


