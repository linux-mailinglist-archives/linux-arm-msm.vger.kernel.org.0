Return-Path: <linux-arm-msm+bounces-6707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1CC827D32
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 04:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 212F71F24419
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 03:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F51B566D;
	Tue,  9 Jan 2024 03:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p3GU7ofH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BEA46A8
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 03:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ccea11b6bbso23421761fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 19:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704769447; x=1705374247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alovHn4hmb7hvQy6aNFD+aPuQpoI08VPnMAPPHVIIwM=;
        b=p3GU7ofHhigJGrCQaGyBV5kL9zeg6Q4DmVDqAczx6LP1F4YBNKiMPsVfNq/+Vc15CZ
         ypfdC1+42lbNqMk1VRGEeAAiAW1P3nm3edLcoFMO/6v4+sE2tMdxwY32t9q1natR+8nG
         GzTflRLWV76CEkfPd0JEOOr7onX4+w8SJ9NPma4cUo4YhFTRR7Og/ApjmM0EMco0idsc
         SDlompqo+F24cDlMOYKZm4ESVu9cncXwn9MC5ODJ3SYH3M5mfZ3EEhA1awRKN5fonXzk
         o/QYfH1DwQdtPZcMkicpEJf9YPn/wzP6HdcjLC07XbEMrrufnknrCCxnu9TVq+oV3Y2R
         +0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704769447; x=1705374247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alovHn4hmb7hvQy6aNFD+aPuQpoI08VPnMAPPHVIIwM=;
        b=egQMeH+oALrmgaczThAUevphJhNFg7S4QW0n3qIDOF+JdoOGOSbQHuMF2DVqhBgjZ1
         2T0Kg1cS0fbeaQdjL8srIDiZ/qMphQOp4Syunv8soPAQOdh8EX94b7+IqbcJqL5v6/9C
         XSyaixsLgAIEZfFRsYc+3vYfbnh7aoEQuYNl9ptSDNSZJi/M0Lfe0lKzXPqQRd2kNJSd
         slZ0PziYeBcCP+mcGOFHF7yRfx1p1ldwsSwWEkiTsone3iydvz86V+7tERToIOGjrB8C
         RfLwJEKUbFgul9i+zevfgPpw7GXhdNZtpB+JasiUDDcu6Xc6QL04UNnI8CeCX5o1NXJG
         2gvQ==
X-Gm-Message-State: AOJu0YwwSbqHjEzXprNPQQPPR9CdRMWYqm7mI2wureycJsH5EOS7WJRc
	a6q6opil8oF+MoSkTGivKtPW+rxtpIwvr/DXJBNDBtxB1Xmtbw==
X-Google-Smtp-Source: AGHT+IEsWDRoPSgQN1kf1KTYevfCIGvYTMbY2mAgpUaaRtApfQy2dzd6ZQdhKdncGdBX8tMAHrWfkg==
X-Received: by 2002:a2e:8e8f:0:b0:2cd:5686:e1df with SMTP id z15-20020a2e8e8f000000b002cd5686e1dfmr42636ljk.19.1704769446909;
        Mon, 08 Jan 2024 19:04:06 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g30-20020a2e391e000000b002cd1ad3b11csm176920lja.42.2024.01.08.19.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 19:04:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 09 Jan 2024 05:04:04 +0200
Subject: [PATCH 6/8] fixup! phy: qcom: qmp: move common functions to common
 header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240109-phy-qmp-merge-common-v1-6-572899a14318@linaro.org>
References: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
In-Reply-To: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=547;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rcJAxtEJnmouZxii2mlKa0hu6MYFXr3EsWm72HzlcLc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlnLehfK+mKKGAY03uC9miW8I9Q850avOgEbZSh
 lPbMBrJRJ2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZy3oQAKCRCLPIo+Aiko
 1WM+CACo4Ut90S2nh8laHY+Qpi1Y2WfVPzI1jW20T5rpqLgfcQE8YMf0BfkWx7ZjZbL5Su0372z
 gsSH30/h+P9K5tl6phESAUp38iv5KA4YvCtRJg2kb2VOSxU/Do951rwA7q8fdMWhJgHmX1FSKVi
 TswALBEdS92xtDghIsONuOZq7O7YcvImu78JehhrsMSfvzbWFBEqCKcE7hY4lcg/65vkHzIz4/Y
 iITUszuVDwxIEFz6PVZHF8ikWnDRwcPIPGmuO/MOhi25s/k10stEx5K70JFjAxmsPlIkcLUZn2A
 0sEjS0pBwJsC3ZHm6ewdBz5Cvbao+1iMZk3KO1zcuQlbl/Dv
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-common.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-common.h b/drivers/phy/qualcomm/phy-qcom-qmp-common.h
index 45cc5b795f58..799384210509 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-common.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-common.h
@@ -56,5 +56,4 @@ static inline void qmp_configure(void __iomem *base,
 	qmp_configure_lane(base, tbl, num, 0xff);
 }
 
-
 #endif

-- 
2.39.2


