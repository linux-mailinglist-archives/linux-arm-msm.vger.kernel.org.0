Return-Path: <linux-arm-msm+bounces-3689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB47880877D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6D6B1C21C5E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 12:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F0D3B78B;
	Thu,  7 Dec 2023 12:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UwvpqHpz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B9CD7F
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 04:19:41 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-54cdef4c913so4049498a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 04:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701951579; x=1702556379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7On32Ao7taWCroDJzXI//r1UxZ6SeERvRI44tfdfGvE=;
        b=UwvpqHpzs6/+ieL8wNn4QJnj7vChjexHVFRCh1UxYg+56OpiXmpkyuKLsTNFGn+sSr
         gyCYWvPZVlG+7jtKwDyrb1PPw46oU/5VWtHUdpAc+13Bq345w74Ff5ZpJMc3GWYHW1sm
         DWCeGvEJISZdxa4yOg7ISfW59/A22RDHv0juxqhgIeJpkJaEiZWobxABZlu3IevfJ/w0
         OFtK7eMpiMY1Yw4KIxjqcKiFVao+o7SKzOh0e72wKa4ONc3FZbG+0OA22FJhEolgrxLH
         O1ccMi80jr1NxlbLTEAM41Coruy2mOyh4hssKMTqo6R6u/DcBek3YIQrj+3L62qn2F1K
         Of/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701951579; x=1702556379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7On32Ao7taWCroDJzXI//r1UxZ6SeERvRI44tfdfGvE=;
        b=EgzIk73ZzL2W5tIQrvHw0cTZ1kYBs+7XNgiqR5fNB86IWj2xN5DPMlQaTGUu+PcRT6
         pioTEe6dXHpjf/oc+ZINzbd9T6Necn8H4tlv6YxMBBiEeiqO7r6OgJRGoZ6DPE8QGwH6
         VwbrBE+dchvkLdQi5B2xlg/8JZwW2KhyXMshpovJ6jI3bNfRhsGTNJ0Xc85wiHdZdB/E
         xE5eAg83LA6ZP7ZItQbgFfa4nGPcx4x1wHLON7TWG1EMWCy3m+AoQIzhHHA3hpfHfCZR
         aHTE5wq9B07Z7ZiFgJqiVkIktiK0RodCMgX9w8B8qKeb1Bgvs/vmbiM3R30qLlRx48rz
         87/g==
X-Gm-Message-State: AOJu0Yx/XGzjaMWr9P6S+JMK5NkAYYzbHg9Ffp0QtMFsxWLoU8iRbkpu
	ESY4Pfu9WCyd7eLbaSGm2mm1A1A3mA2oJUQQQYo=
X-Google-Smtp-Source: AGHT+IF61+QjWE2AWz41aasoYB8cRvYzAzPEIV5U9doaUwbMp6/Fx2hixokB3I8/2YAu02VxHQVUYw==
X-Received: by 2002:a17:906:bc4f:b0:a1d:6780:8fef with SMTP id s15-20020a170906bc4f00b00a1d67808fefmr2619897ejv.72.1701951579736;
        Thu, 07 Dec 2023 04:19:39 -0800 (PST)
Received: from [127.0.1.1] ([82.79.186.233])
        by smtp.gmail.com with ESMTPSA id f24-20020a170906c09800b00a1e814b7155sm761394ejz.62.2023.12.07.04.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:19:39 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 07 Dec 2023 14:19:13 +0200
Subject: [PATCH v3 4/7] phy: qcom-qmp: pcs-usb: Add v7 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-4-dfd1c375ef61@linaro.org>
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-0-dfd1c375ef61@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-0-dfd1c375ef61@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=094Egkf62OVqF7D0untdpemc272H0gSJ6WbJhC5msA4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlcbhQMxZFgnrlpDPmWBSqqG6wCOokWQjV8TfhW
 YkzQvmz4pOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXG4UAAKCRAbX0TJAJUV
 Vr4rD/9LuG7frASaJswBxrabFG8ybpg4BmpxcBxFemfvMleShmPjSXU6i0D91hXkwFBKpWXgeFM
 750TMGcVrZQIDjV05bc5DwxAkGcbQPUX+zGHy6RsT8fZl5HVHn1h+ZCsYfAWd6T37AWNT/ju4Zo
 MsFyAqkHeSWAp/CiTyonIKIYBSPMCs9ohNrLcB1EXQgJCTrCwgKCfSHaq0cVOgV4gkPKhr+scL1
 faadenslWvQMLcFCiIJuJV939PnHavI6kTHc7TRG5QrgzJfOUNGYZqmZzE6p72gcyakznSc/KSQ
 YVaPe2HfGD3sx+1k6zuM74Ddf89NoGhRwuJdJ5wqSRg69VSZ2LTThGqJJmby8o5UTIQ19ohTfr9
 9jYQPCjFYui7I5RRxISp1qlvNzuFNF4BiCTrVVCcj8GjFgL/rr7EDBkAHH+tiRqTQYS09vF9TUB
 5cViI6ULLuLNM7EoWJIK8opvAjPX3+OvN6U3ob/qS8iVkbj8TJeUyuaNpElkzUWR+iBuMAxv8Qb
 YcZFVtPTBCl1zE4iabH+BTqnpwCfZ0H3T33KlOUva1WvYN8A4XP2BmZh36bDsC0gWOwnRw+kBNx
 AhZlBum8Wpj3wTTebkHrXXkNRWs98UsUYcAeXvad2a9xb/ujopTQS4bC+dtkyqm+gzPzs5xz7py
 DE4GK5p7nVKiwxg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The X1E80100 platform bumps the HW version of QMP phy to v7 for USB.
Add the new PCS USB specific offsets in a dedicated header file.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v7.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v7.h
new file mode 100644
index 000000000000..24368d45ae76
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v7.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_USB_V7_H_
+#define QCOM_PHY_QMP_PCS_USB_V7_H_
+
+#define QPHY_V7_PCS_USB3_POWER_STATE_CONFIG1		0x00
+#define QPHY_V7_PCS_USB3_AUTONOMOUS_MODE_CTRL		0x08
+#define QPHY_V7_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR		0x14
+#define QPHY_V7_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x18
+#define QPHY_V7_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x3c
+#define QPHY_V7_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x40
+#define QPHY_V7_PCS_USB3_RCVR_DTCT_DLY_U3_H		0x44
+
+#endif

-- 
2.34.1


