Return-Path: <linux-arm-msm+bounces-20110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 872728CAB19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 11:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B57F8B226CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 09:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8A0763EC;
	Tue, 21 May 2024 09:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yndy3JFS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254CE6CDC4
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2024 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716284735; cv=none; b=ARnMKwzNvZButUzfq7zZe0HHbfOBh/ymYOaFK30B9Ks+6rNYGw5xM295GGH9BayiwPuKoA0pjqjL5REA0ojMN9YlqVW8FXshahkRyiJS1K7nk3dChhMLl3Kd4efe9R+6CQtijfnJOT7eKIwcjgpXrvCsNeY5egRa1G5jTotq3qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716284735; c=relaxed/simple;
	bh=LXkde7roNdCA5RiqXlZv5DapdIAdFkD6mr6zmTWtmTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RGt1HuNdOajSkHk5AdNsTvsoLnRbYP47fZ+gUIMP5akF3eRAdJr+TrnPftLBnJEQBi2DFA7a8Bl9ZKJw7aKzdGavj+jztMZaTJ3lK4vxmPDwtz6ucb8kxUivtL0ptXZ3pkp4fDSYCUXjpfO3SD0HN5/w3ijVdHexA1JSOYaYv2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yndy3JFS; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e73359b8fbso15562851fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2024 02:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716284730; x=1716889530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h832anITW8A4X0+wlt4pMVjTXDOHgXNK3h0zens11dU=;
        b=Yndy3JFSQOK8ny5Pjqj5nRkt2vny6dpLUXXXajJmx8M7GHuFDBkLbbJk7le/dF23ZN
         8rEAEV5I6S12E7DYa370A5wOK7NgqkwSq5Q6FLg64J5cu3HcCNy5CtsT9KHl7YPwe4SR
         XlW2nidcTnpmvBu5glUx+l0Ul5V3QXPZre0iSHFW6yDy7l0suy3B1Xf5uOR/C688KgaZ
         1Puguzb4C/gI/nfoW488rytuMAr/su9BSgU2wsN0Gd2XW5MeiqXGgoT/l3UC6mbGY09f
         mw/JUg4bdl3QxSpgakGE1MpyNXnAMCz0Q55/yU/pirrzynkJMzJyk4u4L9BaWl93G0eS
         ja6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716284730; x=1716889530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h832anITW8A4X0+wlt4pMVjTXDOHgXNK3h0zens11dU=;
        b=P0J39GQyucCI4S5kP7yaq/egdVEEWIOdkCIIJXFlUFN8HTCGmgcBW8vfHoyEhb0gX2
         gHDZID8rY5eo/QJ3XTb5foltc9UtCe38tWju+nrRje4TLU4aG+JLBF16gPfkejvz/gNv
         AJeMZbJ2rVvSf4GStcXpj3N+s0J/Wi85RvUW8/qxX+IqjUp2KwVEXdHWKsgRz3emtP64
         bwNZdd0S5byPNE5obtKhqviPbpf8WL8XhSIc0zTjUmENNcA14OryMK9TROWuOeGlw7fM
         LovMaZ58lFdXosW5r/QrxPATWqkt5S9qLznnYpL6Lg3rOVDOCn8JZSiSYUCSoCMyJfa1
         m+lA==
X-Forwarded-Encrypted: i=1; AJvYcCWN3VoY/jeIzgEuOo9Cwnsa/0WL2BjKc/kM/CSh1nYap9HP4Rp+0RfYXEJf4KWf8/5rKV7slmgzPkOudk3cIXhJC4mJ7lqWyPlAbVpQIw==
X-Gm-Message-State: AOJu0YwGICeN4sX5QcGuagyfd/wg8kVTzDJtDPeKTQdS/+CbYBL1hEuX
	11ssYfALog6DBdGuTXCVgUix7Ai1FoIFmea/VU2EDv/LClzD9+ANvr5JuLu1u5o=
X-Google-Smtp-Source: AGHT+IEcIY8h4MViTxQwWwqeUoj25uDkIjguJWgmCmNuJWowFj8tcwGKQRvY8Y2jNkYsGpgXWPLuiQ==
X-Received: by 2002:a2e:9f4f:0:b0:2e6:f51e:ec1b with SMTP id 38308e7fff4ca-2e6f51eedd3mr168497591fa.3.1716284730390;
        Tue, 21 May 2024 02:45:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e706ee0a65sm13906261fa.112.2024.05.21.02.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 02:45:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 May 2024 12:45:27 +0300
Subject: [PATCH 07/12] remoteproc: qcom_q6v5_pas: make use of
 QCOM_FW_HELPER
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-qcom-firmware-name-v1-7-99a6d32b1e5e@linaro.org>
References: <20240521-qcom-firmware-name-v1-0-99a6d32b1e5e@linaro.org>
In-Reply-To: <20240521-qcom-firmware-name-v1-0-99a6d32b1e5e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Loic Poulain <loic.poulain@linaro.org>, Kalle Valo <kvalo@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1771;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LXkde7roNdCA5RiqXlZv5DapdIAdFkD6mr6zmTWtmTw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTG0ztEDbiBUwdFTHantDBNI67jC6CkE6jTStI
 DUBBlDj+sKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZkxtMwAKCRCLPIo+Aiko
 1ateCACA8fdJTGUFyqavoy+BefLiojGkW0ckGZOdHnmEcupX4OyFqKuRYWb7RFv2x1GQO/175W9
 /j+8Q82CAXNCl5roYzW2GnFjcWa5NnHHjk97bGbJcVvgAvLfUNSbT6yCC8gfIgj3LMdrSk5Tsdq
 PnFP4zQ0ugU2Et2RUt6lwTkZRPRUevmxbwH4t+qYJgxebP/+Upic1FWXBJpuyWuEmJxgaQYb/e2
 nH7vXuWfB7jwmOkCCk3zP+bdH99GLKAq02xWCp+f53Jvlck2j+V5ssX2BfWQX3v+i/E40qfgLgB
 XCJQt8z1tUODh2nOnLoqSa/KLd1yQ3pwCZQMmVw7vK/qGVzw
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Make the driver use qcom_fw_helper to autodetect the path to the
calibration data file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/Kconfig         | 1 +
 drivers/remoteproc/qcom_q6v5_pas.c | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 884e1e69bbb6..7bb22fdb64e4 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -223,6 +223,7 @@ config QCOM_Q6V5_PAS
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
 	select MFD_SYSCON
+	select QCOM_FW_HELPER
 	select QCOM_PIL_INFO
 	select QCOM_MDT_LOADER
 	select QCOM_Q6V5_COMMON
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 4694ec4f038d..893fda54b598 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -22,6 +22,7 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
+#include <linux/soc/qcom/fw_helper.h>
 #include <linux/soc/qcom/mdt_loader.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
@@ -705,11 +706,19 @@ static int adsp_probe(struct platform_device *pdev)
 						    &dtb_fw_name);
 		if (ret < 0 && ret != -EINVAL)
 			return ret;
+
+		dtb_fw_name = devm_qcom_get_board_fw(&pdev->dev, dtb_fw_name);
+		if (!dtb_fw_name)
+			return -ENOMEM;
 	}
 
 	if (desc->minidump_id)
 		ops = &adsp_minidump_ops;
 
+	fw_name = qcom_get_board_fw(fw_name);
+	if (!fw_name)
+		return -ENOMEM;
+
 	rproc = devm_rproc_alloc(&pdev->dev, pdev->name, ops, fw_name, sizeof(*adsp));
 
 	if (!rproc) {

-- 
2.39.2


