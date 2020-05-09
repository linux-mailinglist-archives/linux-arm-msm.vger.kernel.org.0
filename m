Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3CA21CC19B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2020 15:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726782AbgEINI6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 May 2020 09:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbgEINI6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 May 2020 09:08:58 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B4CDC061A0C
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 May 2020 06:08:58 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 18so2426995pfv.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 May 2020 06:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=tpvIu9pcOwiZbdHf6pux4XnkT8udv6zekLOd+SK979M=;
        b=rJhyUkrYZ3RmXJD/52orkzxJL/BP+q8ktlC2WADmuvtVxA3cN8hDf/tsuRzD/njOvL
         BHQLhpUfu9oxNLBvQULDoiC9ATqShBVE/+KZeg4bvVw8pIIM1c9DvTePPhI5oHQSv6Y7
         SvMdM53bbBYhKQxky2GCfeFwI5vuStPZbOvgAax9/YaNY/l/LuZ1yfPLe3k0FqimNF0m
         woiM/L5h5EjN5Ke4HWc0MQT6XMrzxRjhUzQwBA0iKc8NqJfN7xmuXrfzYu8Oq/vVZftq
         mhyIoLjuF9cz8lUNgQsDnRJQeP31M+jmeJp3fvav+OnV0YY+wBfo9JPd4lIKolqtItBu
         MGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tpvIu9pcOwiZbdHf6pux4XnkT8udv6zekLOd+SK979M=;
        b=A02Z5GD1eLdgIBgq1IIVZ9QzavO2rFE8O3WjKYws+CpCRrQTzsgNEJi99ZjE2ekFr8
         0nTMRUXook/BhmRxGd/qPE5XQAqr+ILmMt0gqNE1tqAAj2esBVp3AHDFCQOx9cw76xJI
         UP5JZ4I8bcxeDxMQo3L6DKymmGbY4nxKKYdbKyC72JlldXACENY38HzczhMi/iB5hYK8
         DUVnnVM2bLwekkUx4Hihy2rDJjsmElqYLFstXlc1Xfi4t8lg0q7C0e/3Hu60Mobtf6vu
         WOcyd6rXFNM/wtQK39lfvA1DKG7zi96V1+aIxMqzXXwaDR71VzO3VSHJ02LHLRiYDOn+
         snsQ==
X-Gm-Message-State: AGi0Puas9Z3mq9HxAPwmVWxNOMcZM5pxr0Fn/fpyR9vmwhtaoP841qK7
        MMFrkdtonx0p2lurkp/25Sv1YA==
X-Google-Smtp-Source: APiQypJbFhAvXpUMh7O5IanP0e3Ci5MI661K8ttEJj4RMHlcFynTPtLeJ1jGd6Nk6w17VjghMlE5sg==
X-Received: by 2002:aa7:9904:: with SMTP id z4mr7805510pff.38.1589029737940;
        Sat, 09 May 2020 06:08:57 -0700 (PDT)
Received: from localhost.localdomain ([80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 9sm3612103pgr.17.2020.05.09.06.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 06:08:57 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Joerg Roedel <joro@8bytes.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] iommu/qcom: add optional clock for TLB invalidate
Date:   Sat,  9 May 2020 21:08:25 +0800
Message-Id: <20200509130825.28248-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On some SoCs like MSM8939 with A405 adreno, there is a gfx_tbu clock
needs to be on while doing TLB invalidate. Otherwise, TLBSYNC status
will not be correctly reflected, causing the system to go into a bad
state.  Add it as an optional clock, so that platforms that have this
clock can pass it over DT.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/iommu/qcom_iommu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 0e2a96467767..2f6c6da7d540 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -45,6 +45,7 @@ struct qcom_iommu_dev {
 	struct device		*dev;
 	struct clk		*iface_clk;
 	struct clk		*bus_clk;
+	struct clk		*tlb_clk;
 	void __iomem		*local_base;
 	u32			 sec_id;
 	u8			 num_ctxs;
@@ -643,11 +644,20 @@ static int qcom_iommu_enable_clocks(struct qcom_iommu_dev *qcom_iommu)
 		return ret;
 	}
 
+	ret = clk_prepare_enable(qcom_iommu->tlb_clk);
+	if (ret) {
+		dev_err(qcom_iommu->dev, "Couldn't enable tlb_clk\n");
+		clk_disable_unprepare(qcom_iommu->bus_clk);
+		clk_disable_unprepare(qcom_iommu->iface_clk);
+		return ret;
+	}
+
 	return 0;
 }
 
 static void qcom_iommu_disable_clocks(struct qcom_iommu_dev *qcom_iommu)
 {
+	clk_disable_unprepare(qcom_iommu->tlb_clk);
 	clk_disable_unprepare(qcom_iommu->bus_clk);
 	clk_disable_unprepare(qcom_iommu->iface_clk);
 }
@@ -839,6 +849,12 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 		return PTR_ERR(qcom_iommu->bus_clk);
 	}
 
+	qcom_iommu->tlb_clk = devm_clk_get(dev, "tlb");
+	if (IS_ERR(qcom_iommu->tlb_clk)) {
+		dev_dbg(dev, "failed to get tlb clock\n");
+		qcom_iommu->tlb_clk = NULL;
+	}
+
 	if (of_property_read_u32(dev->of_node, "qcom,iommu-secure-id",
 				 &qcom_iommu->sec_id)) {
 		dev_err(dev, "missing qcom,iommu-secure-id property\n");
-- 
2.17.1

