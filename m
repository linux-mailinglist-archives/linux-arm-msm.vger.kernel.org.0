Return-Path: <linux-arm-msm+bounces-3262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E78D8033F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 14:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAFF3B20A8A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E622555B;
	Mon,  4 Dec 2023 13:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IVg5eeVm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1021E189
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 05:08:00 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40c0a03eb87so12386075e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 05:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701695278; x=1702300078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cwBpTlor8QGPHD6RCGBwXqu4uW7ps+IkBJil9Sq0JkQ=;
        b=IVg5eeVmzutPkuos9vw4nUZlIvJ/Qec5pTXWc9AVy8VqLyu//QXYfe3+j28Rf+GPuM
         glvYcUDb8Smz69QmDf8sLFf/igEKaRBDxLy+Liq0Rf53shhkP2BVHh9k9SCTQhD+3HJU
         aV6M22F1aVLOn1ZyswAh6Kb8A3tX0EXiAUK4cCOPBffsPlHQKCFNwhWuQbMiGjPhPjJ/
         btaHcQFXOMtV3wkA+J9C8/kV5UpkwvK60B2IzmSgCD42tzkNeAfzeS50S3A9t+lHn3JN
         L3XYqabZimOC4VUiB4+epjniXm2WZHJWZoyJJMNDtAjCSxtLk/JtOZy/0mHEozwCRuYX
         KVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701695278; x=1702300078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cwBpTlor8QGPHD6RCGBwXqu4uW7ps+IkBJil9Sq0JkQ=;
        b=fKSQ3wiex5GOP9+bRE1G4fVzoZ9NBqHVGh5CeXahx3ECMs+oN3hSajVZRtZjsR1sNp
         0kXrcBxM0Mjxrm3nohdfumcSh8tCIPRfMKb0uMmtKb/kI2YTMRO9TYBstmg8DAS5i3pl
         Mw7WpwkmwIWSe7wtMIPppHVgdgY7uPSxOubKmA1//zmttnd8iVxMZcgRxJl9hDT3NHnc
         BtafP+vAdkhZELa3DHMzHvAu7JI495/GTnlY+D23EwjaevDXEogrtYpeTMsqfH24dev5
         lmc9FNdTX5A0LS7nhF0yqwUU8vdOwlB9hX+HkOPKVRb5UAEb1r2BsoyD9MzJAq25lwQA
         31+w==
X-Gm-Message-State: AOJu0Yz0ca8k5/rPYSj5qzaeL42OtdG50/FJ49R5hh3Uti9xzpDnvAPa
	3NYObTH0zvLLz+s9mfSzC7dsUw==
X-Google-Smtp-Source: AGHT+IHz6z9FNxdUY89GlaEKZKo9VT8cN4GSZp+9MkJvNXaV2qURb9hzGEg+cOJVQYnkAzpc1YZTTA==
X-Received: by 2002:a05:600c:4713:b0:40b:5f03:b3db with SMTP id v19-20020a05600c471300b0040b5f03b3dbmr1123061wmo.253.1701695278472;
        Mon, 04 Dec 2023 05:07:58 -0800 (PST)
Received: from [127.0.1.1] ([82.77.85.67])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c4f8a00b004053e9276easm18494166wmq.32.2023.12.04.05.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 05:07:58 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 04 Dec 2023 15:07:38 +0200
Subject: [PATCH v2 4/7] phy: qcom-qmp: pcs-usb: Add v7 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v2-4-21956ae0c5c3@linaro.org>
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v2-0-21956ae0c5c3@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v2-0-21956ae0c5c3@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1034; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=4M+XfVf6Rbtz4QjGiR/Rgm75VNvkMBMlXyXrx+AsN/Q=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlbc8jlAoI7yS4kGdu5+tw6hM+aSjBAPwyaEbTx
 SwXDvPLVRiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZW3PIwAKCRAbX0TJAJUV
 VoLCEADHCXTn+LJx/Z0vGhTOpLqN5JAUkTvZLybJOk3hlMamTWm00izxsZhkYrnJoj2q0jx3aAS
 +XEC555bIMY3TZ5XSUPRxHomlLpWZPjGUqDhQ+d7nWXI5S3haKfA3eRQPKnjOvQpwO1TNpX1Orn
 HMP6gQw66LoCVgQqbKHqFIOp7mnCMpPab7jzgvKcNhYKDvMMWQ+VlI5tSALlwh7j1K7gA/9eED9
 sjINJ4MjgpWnAivi8OcgalTLAJRLvyfZ/xjaS3tkevTRb8uIKCeDO0+TqE4cTDnTu3J1CQy3uib
 67Zwr8bV2HeHsZatkNGYRa+fnuWVkiO7mYyO2/1IfPVlJ0VMG3CsiyUGDLUJHua8Pq2H3I6GN8S
 B3hO0/mkaA0crGmi/0DhWUMOj06rPJv0VA+mgi2YpRVOG3OEe7YPVXRiTyfj8aBfy2Uuz+B5dup
 ikBBb8ntBjwcy3N4T9L4hwM8j7Qe3p0Hfy0jaCwZfhYFlT5XPCZc0hj8znCHYBwDdE4+1AcEwnl
 Dg6yG3WLV8aJk8KiUxN/mBtjudEiwiys443mQk3zgCx+29etM/3LzkOv1sK+eya5OtidEhpiCg+
 GvInk2ac/f9XhSI6zpj+uE7zrwnqefqJg8UKWO7Bugso7RBiaLCZrbbKUJXcAGWps1HpVrAHiAr
 PhlcqqREJq6Kyhw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The X1E80100 platform bumps the HW version of QMP phy to v7 for USB.
Add the new PCS USB specific offsets in a dedicated header file.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v7.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v7.h
new file mode 100644
index 000000000000..6e785c73f4da
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v7.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_USB_V7_H_
+#define QCOM_PHY_QMP_PCS_USB_V7_H_
+
+/* Only for QMP V7 PHY - USB3 have different offsets than V6 */
+#define QPHY_V7_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x18
+#define QPHY_V7_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x3c
+#define QPHY_V7_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x40
+#define QPHY_V7_PCS_USB3_RCVR_DTCT_DLY_U3_H		0x44
+
+#endif

-- 
2.34.1


