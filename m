Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69747843EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 07:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbfHGFjy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 01:39:54 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34494 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727187AbfHGFjx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 01:39:53 -0400
Received: by mail-pl1-f195.google.com with SMTP id i2so38962649plt.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Aug 2019 22:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PtD4kVuMP62M8z8TfrTANyGVjPACMbwaEsr3rVieEXs=;
        b=t0ISAbXeSaPvfdlidC94DFCEL+uR6mZHC8q7ZvIX58dgbq8WgM8xBaCIE4XaxFya6z
         8nEKRwo9q+R6sN0sV7dwExFSNd7k3yIRS8RTsfKOIwv4vvQeX1wOHQvydZO/G1nE5HJu
         gRLfzzYLc8hMpSchbKxO+aooyzRCIeDt9+m//fO6V2OL3Kta58cFxLfOajfTJcth1i1V
         IRHuh8VkJf+JyXvNaJTeK6i47vqB3+YRuZEW3giFTe/eJXdColYu7dF7GrMYJYMHmus4
         NUoNMYbJpjnZTwHmv0tt82p081flHa4WPZ/PEYvyNI6kHE1dhkWGoCUQTtMM7jzcdHZ8
         RSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PtD4kVuMP62M8z8TfrTANyGVjPACMbwaEsr3rVieEXs=;
        b=eAJ/HagCVHSJFifw8nWYt7xRmVHkvr/5qsOCzw9mMGR8i4MhCXqs5soKRlbJTA8HlJ
         eghtXrcopLj4rRVA0o3XNRb3wJAanf4jE4y2IRaB3dxFpwEDoFBZ0mSQukFIeh6X9ZEj
         pGpKaw4e4tp+PrA+zjO2XowoyGBMNuIpY4vcze4JRC4lOImwCW0cOchlsVCqW7wY+43W
         zhDtR5CkT/5IPhfiFgV4D9VQJOWGgiqjKoaMye0z31wgkHLGAEXRtC8usetDgw6y+dQa
         C4cuU2fo+ppOw7eOMpT4XGdynqgVeF4WRLKlsGkN0Xy7s4cPvO9NI3VLMy+uRCfpdVOL
         cFgQ==
X-Gm-Message-State: APjAAAVqBjsreMwvk9XDulp0bJt0/bicv6eSSgoXsX+jfhS1LqzoI/8T
        oVbzoDkgG3lkq/gNi2z7jYbHUQ==
X-Google-Smtp-Source: APXvYqwp4Je0AaxMcBaoABd/4NVbB7F+zYuCe3c+QTEfgFQqSKjQ4ov5rj52FIdOy9DdfB+uOMHIIA==
X-Received: by 2002:a63:dd16:: with SMTP id t22mr6263088pgg.140.1565156392905;
        Tue, 06 Aug 2019 22:39:52 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u7sm86070777pfm.96.2019.08.06.22.39.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 22:39:52 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 6/9] arm64: dts: qcom: sdm845: Add IMEM and PIL info region
Date:   Tue,  6 Aug 2019 22:39:39 -0700
Message-Id: <20190807053942.9836-7-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190807053942.9836-1-bjorn.andersson@linaro.org>
References: <20190807053942.9836-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a simple-mfd representing IMEM on SDM845 and define the PIL
relocation info region, so that post mortem tools will be able to locate
the loaded remoteprocs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index c8ebe21f7673..38a6b304dba3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2456,6 +2456,16 @@
 			cell-index = <0>;
 		};
 
+		imem@146bf000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0 0x146bf000 0 0x1000>;
+
+			pil-reloc {
+				compatible ="qcom,pil-reloc-info";
+				offset = <0x94c>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x80000>;
-- 
2.18.0

