Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0195B410FC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 09:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234264AbhITHBk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 03:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234194AbhITHBi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 03:01:38 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 835F2C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Sep 2021 00:00:12 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id 5so10396221plo.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Sep 2021 00:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EHDB5GC+le5kBE+LB1as4U7MlTnTejIovyXG2VuBtF4=;
        b=szCTRoeHjh0Fus5h0DNXZTQSCWCNSGEQ7Em5z19BaB6MCkyQu6636+GcBYoKAaDjVY
         C57jZdDo1UwOjYBYhWXBvujEDBiL5XcU4QijRr/4uDjoZEKbzdVGUzOqV6tPJQlgMu1D
         9CtH/ivHN0JxQgaWzL7jKmAZjUrqMP5j8yR4NeuiRJ3mt0u/rS6c6tkl5bjEPafRbhok
         ESdcbwr09yBp+MZfRvUSs1c1cj62FKyZr/svgn79DgILH8XIL8oGiJ0DpfqF1Frz8p8C
         gE1Mvf0VxgfPkgp9MgDOTDQY0K5VYN2rsorqK49B/2Aj+xW5ZMdAds9Enq2Tnc8EkTWd
         oNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EHDB5GC+le5kBE+LB1as4U7MlTnTejIovyXG2VuBtF4=;
        b=UDn+RilmV/BmJKDqie4yxJ7JvQwGLeuPHiEfhZh1NUbQDWyWnG/lBCbWvt7Kt3txDc
         dOkETP9emQPBIvvb5ylWZdrQgQDtIuf/ggTUTs0nkkihD1AQBN0mpgDBOlR9Y6MDRVxf
         jyS4yWFr4j4+Oc8gcMG6Yjug6QIqOPwhDA4xuNSfAjYgLdZU46sVmmxCir36d6HeW2qo
         50dSatOQMImLiXGke5dqZ4dcasjv53vwKG1KhKZVuuCq5e57wdIpWcRwnvXTR+S6Xr6i
         Gnjz77Q0hxSt7KWbhxj097hV5vj9CnY86a2ltCjvmw7IVZkD9FUxDapa+d+5Ea+GQL3L
         WBmw==
X-Gm-Message-State: AOAM530ikNlN78Klxl+7fL6D6bqMKfT4FN6l1yrU4UsNbRFXsgCddlXD
        KzdjKI90WNf71H8zKD6cokk0
X-Google-Smtp-Source: ABdhPJzDldULHQETRi552+S6kYBF5i3BdNVdQCuvuaUfCI+07mlvWQL4Yq7JRNQEgEg+wdZ++eNK+w==
X-Received: by 2002:a17:90a:34b:: with SMTP id 11mr36761273pjf.102.1632121212043;
        Mon, 20 Sep 2021 00:00:12 -0700 (PDT)
Received: from localhost.localdomain ([59.92.98.104])
        by smtp.gmail.com with ESMTPSA id p15sm12768349pff.194.2021.09.20.00.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 00:00:11 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     kishon@ti.com, lorenzo.pieralisi@arm.com, bhelgaas@google.com,
        robh@kernel.org
Cc:     devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        hemantk@codeaurora.org, bjorn.andersson@linaro.org,
        sallenki@codeaurora.org, skananth@codeaurora.org,
        vpernami@codeaurora.org, vbadigan@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v8 3/3] MAINTAINERS: Add entry for Qualcomm PCIe Endpoint driver and binding
Date:   Mon, 20 Sep 2021 12:29:46 +0530
Message-Id: <20210920065946.15090-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920065946.15090-1-manivannan.sadhasivam@linaro.org>
References: <20210920065946.15090-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MAINTAINERS entry for Qualcomm PCIe Endpoint driver and its
devicetree binding. While at it, let's also fix the PCIE RC entry to
cover only the RC driver.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index eeb4c70b3d5b..2c9165e4e816 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14595,7 +14595,15 @@ M:	Stanimir Varbanov <svarbanov@mm-sol.com>
 L:	linux-pci@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-F:	drivers/pci/controller/dwc/*qcom*
+F:	drivers/pci/controller/dwc/pcie-qcom.c
+
+PCIE ENDPOINT DRIVER FOR QUALCOMM
+M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+L:	linux-pci@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+F:	drivers/pci/controller/dwc/pcie-qcom-ep.c
 
 PCIE DRIVER FOR ROCKCHIP
 M:	Shawn Lin <shawn.lin@rock-chips.com>
-- 
2.25.1

