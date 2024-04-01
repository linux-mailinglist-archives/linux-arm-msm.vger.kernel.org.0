Return-Path: <linux-arm-msm+bounces-15941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8374893C8F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 17:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10460282A21
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 15:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA66F46426;
	Mon,  1 Apr 2024 15:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W8oXkn7y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27D340BFD
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Apr 2024 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711984157; cv=none; b=KnQVb1jWcB8FSP75CjfIiXVX5QwbKl/kgfzZacbkMjFfhzAkT4GP+kvmOl7k7V1c4HQKxzb/PIZ7dpvDQqvmLpc00Ud0Hoiroo4txUB4pFbXluH2XqBuTiNgbREHy5Pt7P8nk8zvonlRuz8obe/C0q4b92RSdOOGjH2KCKwhbRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711984157; c=relaxed/simple;
	bh=Cty+UnQToC59kYZv18cUD97vngjCf03hJr63ChFyqoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MPmzY5o8dbMAgJ+uO/DlD5pxZdxClD9vEli/fjf8lF4iYHPAp7y1XOfORePzkvnogp/X2LH/58KPusFQfiSACXKc8HmTCXP0ffMc4238fajNv6/YAHH2F8eG4luEjDC3jhxjte0SAHlKVGfY/jbOlnwArrhtt05YZzqL5fJ7sIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W8oXkn7y; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e0000cdf99so33401805ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Apr 2024 08:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711984154; x=1712588954; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pVYU8GbKC7yGxger5d4I7Be1o72Atk8Z4mAA6WFepzY=;
        b=W8oXkn7yT0NPole+hobNWxtahGo2JONnmUh9n2CTchYBuD2iba5jqTb8BSG+qzCN4P
         lnZJJg7UcilNVI+s/ZHscCBBPwyrAyWlHWAgsMdb8ZfaGBbpnPXo8VehIpwP7NyYVH4c
         lbefectmX/3zPvCpNEN+kH8IPMvBJZ0q2CA8GDz4ZMc5lUgN3PWyhnTWxYHOOjacSwhi
         Ag8DV4HSjVp4s9jhMptI69h/7/4t2AP6QVL3RIGDIjwtigpC5f0RiQ3Yw4bOmHjKgnJE
         r0vPYLrr4S60ei6VeHnBam3rRDBOWYu+yyhNgKxTTFR449ZwO0skGCiGHUcm5hqvU3S2
         e1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711984154; x=1712588954;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pVYU8GbKC7yGxger5d4I7Be1o72Atk8Z4mAA6WFepzY=;
        b=oTSAP6jPzc86l62E3oYYMqb6SxWPLFM+GlkZzg5t0odM+FsrN5TXIvny17kLbSKis+
         EcuGCoFGNhrqtds1I3+4IFlVPtQ5BgJ8K66gPawKewl7l87FmuXY8fzMkXgv0YgDjBkl
         Ko4MXS8DYDOkcu9RsGw8gr5tlYgRyt2iPKJpmn3dPoLXR+M6q4gtjOOm74nlRiJ9ED0R
         93FEVYNdRsBIRNwKZJHJ7PLLbH6lbMBzxMwdQ9aMNscYKl6EkgYjR/7IdFI0awmZHH0N
         Tyd477hYiVKLSZ8PwaYC9160z3toawXz371/H5nD0oKIyTVbGO+dbxZ2jGqzpn1bHzXq
         BSww==
X-Gm-Message-State: AOJu0YwutmVQ3Q/50tAATBL0xOa+zGimns+ZS+1UgDUOCTr8BaLMYK47
	M3+Fdcsd700bSIGSz2Nxk1YYUQAH08ZlPhfQB3QHr2dJox7z76fX13ctd+cEMQ==
X-Google-Smtp-Source: AGHT+IFE9dNt0xZOH3qJyZit+jmNsMhFH7GbTknjl4uhmeiIrUFDsOOM60RHVWJaCdYlrFvJLcUd9g==
X-Received: by 2002:a17:902:684e:b0:1e0:ac2b:44ad with SMTP id f14-20020a170902684e00b001e0ac2b44admr10395300pln.35.1711984153872;
        Mon, 01 Apr 2024 08:09:13 -0700 (PDT)
Received: from [127.0.1.1] ([103.28.246.102])
        by smtp.gmail.com with ESMTPSA id jn6-20020a170903050600b001defa97c6basm9017045plb.235.2024.04.01.08.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 08:09:13 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 01 Apr 2024 20:39:08 +0530
Subject: [PATCH] scsi: ufs: qcom: Add missing interconnect bandwidth values
 for Gear 5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-ufs-icc-fix-v1-1-3bac41bdfa7a@linaro.org>
X-B4-Tracking: v=1; b=H4sIABPOCmYC/x2MQQqAIBAAvyJ7bkHNCPpKdLBtrb1YKEUg/j3pO
 AMzBTIn4QyTKpD4kSxnbGA6BXT4uDPK1histk47bfAOGYUIg7xobE8jebOyG6AVV+Km/9u81Po
 BqsZFLl0AAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2770;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Cty+UnQToC59kYZv18cUD97vngjCf03hJr63ChFyqoM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmCs4W5PnPP9s4qkoo1SJWJN/0ZpVQblpiyF1Vh
 BBFu4Rwm/qJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZgrOFgAKCRBVnxHm/pHO
 9ZrgB/42bVR2LhePhhSaPpHnN4F8xSPKlhq2wVgf4puXeFn0/pPug87DSVq7VMIok+2XnxYBFux
 09VhIp1r9d7LjJWQSus7mG/8ULc/glxdMLMbqBF4OaMqxDH5aR3IXRdxKus69xiIBhDSIGdO8Kd
 9PqtSG9DSZnSIBmXp0JZE0iI+9wZhnbnDj9ik2FNr934T92Z3Plaowp7ZQNGFdec5J9QKsJr5eb
 h/6+Ot9O/OLP0Vfvy318wKHT3IC+eGruaR6Z3WABwMnAK5eK3FadRFMr87xxomdlxE0UvVXJ5jo
 0T+46URwCyIhFI8lufqLqjWmE49uWeB8kY6BN3Jcy8WPWaL9
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

These entries are necessary to scale the interconnect bandwidth while
operating in Gear 5.

Cc: Amit Pundir <amit.pundir@linaro.org>
Fixes: 03ce80a1bb86 ("scsi: ufs: qcom: Add support for scaling interconnects")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 8d68bd21ae73..696540ca835e 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -47,7 +47,7 @@ enum {
 	TSTBUS_MAX,
 };
 
-#define QCOM_UFS_MAX_GEAR 4
+#define QCOM_UFS_MAX_GEAR 5
 #define QCOM_UFS_MAX_LANE 2
 
 enum {
@@ -67,26 +67,32 @@ static const struct __ufs_qcom_bw_table {
 	[MODE_PWM][UFS_PWM_G2][UFS_LANE_1] = { 1844,		1000 },
 	[MODE_PWM][UFS_PWM_G3][UFS_LANE_1] = { 3688,		1000 },
 	[MODE_PWM][UFS_PWM_G4][UFS_LANE_1] = { 7376,		1000 },
+	[MODE_PWM][UFS_PWM_G5][UFS_LANE_1] = { 14752,		1000 },
 	[MODE_PWM][UFS_PWM_G1][UFS_LANE_2] = { 1844,		1000 },
 	[MODE_PWM][UFS_PWM_G2][UFS_LANE_2] = { 3688,		1000 },
 	[MODE_PWM][UFS_PWM_G3][UFS_LANE_2] = { 7376,		1000 },
 	[MODE_PWM][UFS_PWM_G4][UFS_LANE_2] = { 14752,		1000 },
+	[MODE_PWM][UFS_PWM_G5][UFS_LANE_2] = { 29504,		1000 },
 	[MODE_HS_RA][UFS_HS_G1][UFS_LANE_1] = { 127796,		1000 },
 	[MODE_HS_RA][UFS_HS_G2][UFS_LANE_1] = { 255591,		1000 },
 	[MODE_HS_RA][UFS_HS_G3][UFS_LANE_1] = { 1492582,	102400 },
 	[MODE_HS_RA][UFS_HS_G4][UFS_LANE_1] = { 2915200,	204800 },
+	[MODE_HS_RA][UFS_HS_G5][UFS_LANE_1] = { 5836800,	409600 },
 	[MODE_HS_RA][UFS_HS_G1][UFS_LANE_2] = { 255591,		1000 },
 	[MODE_HS_RA][UFS_HS_G2][UFS_LANE_2] = { 511181,		1000 },
 	[MODE_HS_RA][UFS_HS_G3][UFS_LANE_2] = { 1492582,	204800 },
 	[MODE_HS_RA][UFS_HS_G4][UFS_LANE_2] = { 2915200,	409600 },
+	[MODE_HS_RA][UFS_HS_G5][UFS_LANE_2] = { 5836800,	819200 },
 	[MODE_HS_RB][UFS_HS_G1][UFS_LANE_1] = { 149422,		1000 },
 	[MODE_HS_RB][UFS_HS_G2][UFS_LANE_1] = { 298189,		1000 },
 	[MODE_HS_RB][UFS_HS_G3][UFS_LANE_1] = { 1492582,	102400 },
 	[MODE_HS_RB][UFS_HS_G4][UFS_LANE_1] = { 2915200,	204800 },
+	[MODE_HS_RB][UFS_HS_G5][UFS_LANE_1] = { 5836800,	409600 },
 	[MODE_HS_RB][UFS_HS_G1][UFS_LANE_2] = { 298189,		1000 },
 	[MODE_HS_RB][UFS_HS_G2][UFS_LANE_2] = { 596378,		1000 },
 	[MODE_HS_RB][UFS_HS_G3][UFS_LANE_2] = { 1492582,	204800 },
 	[MODE_HS_RB][UFS_HS_G4][UFS_LANE_2] = { 2915200,	409600 },
+	[MODE_HS_RB][UFS_HS_G5][UFS_LANE_2] = { 5836800,	819200 },
 	[MODE_MAX][0][0]		    = { 7643136,	307200 },
 };
 

---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240401-ufs-icc-fix-123c7ca1be45

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


