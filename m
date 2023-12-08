Return-Path: <linux-arm-msm+bounces-3879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D06D3809CC0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 08:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DC1C1C203A7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 07:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B033101D4;
	Fri,  8 Dec 2023 07:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TcHOM3b8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A8CE172D
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 23:00:17 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6ceb27ec331so1191358b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 23:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702018816; x=1702623616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6ZqhhOHk2iNfWUUPqiv/O7Z6HQrUwIXBT8R8ig4LQ0=;
        b=TcHOM3b8w6bUNscJUzlIR2LKRSMxUkzNx+FmyjKZRgrwr0+tmAMBrnKTamikcxoaIQ
         oBBelnXaUJQC1JDVRBQmkTej2FaMoE5srNZ+6PVdPVYdozpMqYvS8D1qux6xRtsxChVA
         sGxFZmR8MnqW7ogOcf6365wzn+9mBQ0S0nhCRuBk7NMrdY+WeZlGdSLEiuqNajiMU7MB
         OKz6l/HmoHy14HAZXokfk7R2vmGRe7KlDJ20JwHpfc5vUTSWJ3F4BvYDIRRgJ4/kEZa1
         8NZEHdP6J/HqDdchbgZ9qN+ZieTKGHDTFYr5o9jrwpd4Io2tzKoGpm7iFAACwLERmDVQ
         6a4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702018816; x=1702623616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6ZqhhOHk2iNfWUUPqiv/O7Z6HQrUwIXBT8R8ig4LQ0=;
        b=dZ9mAFb7gJtFtLTTbHJlHuALo7l3m3ND4ZzlD3o/S2PnAqDNL+e/EOlsT7kY3fIk6a
         fNL14qwtEiaCWJfxYku7vN86M7FbdC59N1NdZnTxavjLZFDxukVAdIz6FgxtKhpmGLMQ
         uHeP1+Wm5Sr/UsP2+RIDcm8eCNQyoQPwM4r42cSP1OaoP5je75IJj+7co/739oNTsBfY
         GXQzELzzuW0vgaNKL1y/bd4VkN+Sw1VHEBdMua/sA9JdGvAuEAxyjM+R4uufcqafpZ1r
         gIzH3zAv8ffdMYG34FBM3nmy2Nv6HwpEdJVTF+Wt4SauM2q9j8jJgm43Hi4KEZwZ5ZAZ
         K5cg==
X-Gm-Message-State: AOJu0Yz6Xfx5L5e+1/cMta1rNWf0xElaiCkdzWde5u4sV48BXwoQnoAt
	LfC0lqTmaqg5JzbNRzMZpKfL
X-Google-Smtp-Source: AGHT+IHGJSyyR4qnCzZSWOR7Wvf2gGJRyDqvdyimicieitTIKsqODVDkpz0nWgn3k5ddWRH7obqebA==
X-Received: by 2002:a05:6a20:8f05:b0:190:20d:5b94 with SMTP id b5-20020a056a208f0500b00190020d5b94mr2195421pzk.27.1702018816569;
        Thu, 07 Dec 2023 23:00:16 -0800 (PST)
Received: from localhost.localdomain ([117.216.123.142])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902e54800b001b03f208323sm934263plf.64.2023.12.07.23.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 23:00:16 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: martin.petersen@oracle.com,
	jejb@linux.ibm.com
Cc: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com,
	ahalaney@redhat.com,
	quic_nitirawa@quicinc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 12/17] scsi: ufs: qcom: Sort includes alphabetically
Date: Fri,  8 Dec 2023 12:28:57 +0530
Message-Id: <20231208065902.11006-13-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231208065902.11006-1-manivannan.sadhasivam@linaro.org>
References: <20231208065902.11006-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort includes alphabetically.

Reviewed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 18ea41f5bae9..7fbd35a3eb81 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -4,26 +4,26 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/time.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/devfreq.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interconnect.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/platform_device.h>
 #include <linux/phy/phy.h>
-#include <linux/gpio/consumer.h>
+#include <linux/platform_device.h>
 #include <linux/reset-controller.h>
-#include <linux/devfreq.h>
+#include <linux/time.h>
 
 #include <soc/qcom/ice.h>
 
 #include <ufs/ufshcd.h>
-#include "ufshcd-pltfrm.h"
-#include <ufs/unipro.h>
-#include "ufs-qcom.h"
 #include <ufs/ufshci.h>
 #include <ufs/ufs_quirks.h>
+#include <ufs/unipro.h>
+#include "ufshcd-pltfrm.h"
+#include "ufs-qcom.h"
 
 #define MCQ_QCFGPTR_MASK	GENMASK(7, 0)
 #define MCQ_QCFGPTR_UNIT	0x200
-- 
2.25.1


