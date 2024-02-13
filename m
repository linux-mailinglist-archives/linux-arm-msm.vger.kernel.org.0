Return-Path: <linux-arm-msm+bounces-10895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 920CB853215
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 14:38:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B631A1C213F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 13:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E11E56440;
	Tue, 13 Feb 2024 13:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lMZaZzs5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B335755E7F
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 13:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707831509; cv=none; b=r29H8uBU8RjnALw+Sf377CGKBZpYF8SOzhvsuve22QUsRma6nZI9eo/IGL+STQdmN6ef6Bux1I3GOfzsMXXpjdl10zpBCBfEtc2nEA/4VXN1u70cE9sdbi+QlBv89jWKeQFrbgW/osBunrEmsAX2B9sJPze1CdSwJnE9mm9Kw0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707831509; c=relaxed/simple;
	bh=5/iWu1j4QnIEs8QxSJD+hdSrsVOH41rvGwDOCY2SnYw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LrQnSPMIvQ06bKxiZRYUjNXadzRNXPRQKAzLbu1Z/wnN+/nAyqOYj549xNc/rQX6suM+K2EQKsKKEGJ59WP1Wq+FxeHowor/E/SUQ/zne4X8L+45xS6eTcpx384J8JrWJLyiOmVJwi8lINnK/chgD6m4mwXBcu1Zii9mNDsC7r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lMZaZzs5; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-511490772f6so5376594e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 05:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707831506; x=1708436306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Zb8wAvFeeorGx6LWVz5UtbVfmgXSiLzvpa9AtKSuSg=;
        b=lMZaZzs5kV1cEJzasgdwh7rNp2ehoS4gLt7iT+sf3J7ihc+b6Q9m7riOsGFaPUgXcz
         ND0JbU7PkoKrn/vXJ7OKOvgkORHu8oDcWQScwWLECrDfv5GYYMf6OgoT2TdgZxJOMm6N
         h10uWtIZbOQEu9gc/FGIYWANGZ3NEaox07+M0/Oj6CoOUaQK986DrOg99LYj+G75qD9c
         HDFDP7Fh+4m9s38jRR2BhhNBr7PmUacW2hc0OGmE+ZWC/iXA6rInKTXDCM7PGPfa4Xgr
         jw0m4MlqDaOHqfJ9mCJqM02kVe5ZlsAypC7FU2rBuIDVAIxn8+c4C+iPaaWzxhxL5vaU
         FcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707831506; x=1708436306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Zb8wAvFeeorGx6LWVz5UtbVfmgXSiLzvpa9AtKSuSg=;
        b=vd12zdKlWpApzOkngIvi4AhfkGXYlnw0IBAd6oZa6gjwQbYBMuzyMpLluQX2Nu5tZ3
         dyYvLTlIvZs4jpwCnG2DszFJ/y+hT1rupVQiMlPMlrZjDbM8rb1Qjh/GUMxL62K/QIaF
         W3kl9SRXzNESLV++nPXvRzr2oml6kg//f3dSOzYdFZ5sho05mXg1GXOKI+tXAvf4dHrt
         M7SwEcZZbFVVHbtbZ9ktDfH/e8GYSOlznGClKeC0o7np52HTHSiE+qkh1apY0fk1kMp9
         u6gewQX4kEGjI/y4GmTbSVZI98xuvFW8iwv897Be8ejs5OtrCU0+PkShXUmbAw5hgc4t
         HAmw==
X-Forwarded-Encrypted: i=1; AJvYcCVyXznN93OiUMZaVwdO32WplyYhxyEJvsuuEirMReDiHHr4E9x7EjcXhuv3IQG5EZlnOjRCQm9LdeVbx84g7yY/0d0cGWk2LwHT0E1iPw==
X-Gm-Message-State: AOJu0YwxfJDcI00sElBMpxlo2MKCSNooxmSby5f8HXyhGSrV1V+tAi6X
	4kdR5uEdts7LwxFG4H9WidUFFClo35J6o8bhRZhiAf4xBwxBtb1ExXMjBl8d/6XssSdoTAoEUry
	7
X-Google-Smtp-Source: AGHT+IE7yw/lFv7KE85EgKrLu+fqIGLfS6/cTqI1wzx7FRZK261L2SlKG1mPKKPHgc6SYCq79Zdvmw==
X-Received: by 2002:ac2:41c2:0:b0:511:7021:9418 with SMTP id d2-20020ac241c2000000b0051170219418mr6331796lfi.69.1707831505809;
        Tue, 13 Feb 2024 05:38:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURggPapZEk2u9sEIEP05tNN+oit4tz750l3gXkjJuiQ8zV+3bvMFkOWt+mIns2GmitMJT9g8QjgCEhxqqxgndP1yc/qHjnlYmll5EH2hBER0QR0i0BfRA4QKeLCN9Sx/MNHN/+SvZLIL3fI+WhOdeaNHzHDH9gbDOpeqPglJvzTa/dFgNVOPMfkyMbRaRzODQuESa1NXz8N/2O50psNdE3Xjk8BvBoGECmbsM=
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d30-20020a0565123d1e00b00511907736fdsm685142lfv.105.2024.02.13.05.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 05:38:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH] phy: qcom-qmp-usb: fix v3 offsets data
Date: Tue, 13 Feb 2024 15:38:24 +0200
Message-Id: <20240213133824.2218916-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MSM8996 platform has registers setup different to the rest of QMP v3
USB platforms. It has PCS region at 0x600 and no PCS_MISC region, while
other platforms have PCS region at 0x800 and PCS_MISC at 0x600.  This
results in the malfunctioning USB host on some of the platforms.  The
commit f74c35b630d4 ("phy: qcom-qmp-usb: fix register offsets for
ipq8074/ipq6018") fixed the issue for IPQ platforms, but missed the
SDM845 which has the same register layout.

To simplify future platform addition and to make the driver more future
proof, rename qmp_usb_offsets_v3 to qmp_usb_offsets_v3_msm8996 (to mark
its peculiarity), rename qmp_usb_offsets_ipq8074 to qmp_usb_offsets_v3
and use it for SDM845 platform.

Fixes: 2be22aae6b18 ("phy: qcom-qmp-usb: populate offsets configuration")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 6621246e4ddf..5c003988c35d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1556,7 +1556,7 @@ static const char * const qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
 };
 
-static const struct qmp_usb_offsets qmp_usb_offsets_ipq8074 = {
+static const struct qmp_usb_offsets qmp_usb_offsets_v3 = {
 	.serdes		= 0,
 	.pcs		= 0x800,
 	.pcs_misc	= 0x600,
@@ -1572,7 +1572,7 @@ static const struct qmp_usb_offsets qmp_usb_offsets_ipq9574 = {
 	.rx		= 0x400,
 };
 
-static const struct qmp_usb_offsets qmp_usb_offsets_v3 = {
+static const struct qmp_usb_offsets qmp_usb_offsets_v3_msm8996 = {
 	.serdes		= 0,
 	.pcs		= 0x600,
 	.tx		= 0x200,
@@ -1624,7 +1624,7 @@ static const struct qmp_usb_offsets qmp_usb_offsets_v7 = {
 static const struct qmp_phy_cfg ipq6018_usb3phy_cfg = {
 	.lanes			= 1,
 
-	.offsets		= &qmp_usb_offsets_ipq8074,
+	.offsets		= &qmp_usb_offsets_v3,
 
 	.serdes_tbl		= ipq9574_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(ipq9574_usb3_serdes_tbl),
@@ -1642,7 +1642,7 @@ static const struct qmp_phy_cfg ipq6018_usb3phy_cfg = {
 static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
 	.lanes			= 1,
 
-	.offsets		= &qmp_usb_offsets_ipq8074,
+	.offsets		= &qmp_usb_offsets_v3,
 
 	.serdes_tbl		= ipq8074_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(ipq8074_usb3_serdes_tbl),
@@ -1678,7 +1678,7 @@ static const struct qmp_phy_cfg ipq9574_usb3phy_cfg = {
 static const struct qmp_phy_cfg msm8996_usb3phy_cfg = {
 	.lanes			= 1,
 
-	.offsets		= &qmp_usb_offsets_v3,
+	.offsets		= &qmp_usb_offsets_v3_msm8996,
 
 	.serdes_tbl		= msm8996_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(msm8996_usb3_serdes_tbl),
-- 
2.39.2


