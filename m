Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B81143AB762
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 17:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233271AbhFQPYx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 11:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233276AbhFQPYw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 11:24:52 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3F5C061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 08:22:44 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id g4so3996751pjk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 08:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MBGbqvseaowVXgAUsLtxjTmL1uju2aQqqvQPrdOEUMI=;
        b=HE2F97TOVFlVyHorUtSDPv87VQGzS+EG8uzGtZ9iJ/SPN5vRg9BJXjdhsHysIMT5vL
         RnMGklcRV5fYPciomdLDZQGbZ63cPWs7NqaPdH72A+bdeKMJhIjSQuex6+TXdIOg29Ox
         ffOezYXKeorOiCgIUgUuzCfPDYbc6xTz5iHr2qH9s6Xj7VngTfJtypZRqGeMULSgL+nw
         gzYLIht4/5QD2eb2ALIdS2g9Nv09mNUVZsr+YKh4aTv3xJC9WRR46W8Yk47bK/3zfgLT
         i8YMQ1m37rJbGmSV0B18SWLh3CyX6MfIri5tPDeFuOAZW3yQUN7cm0Q8MGBBIQkMJ3Fv
         DaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MBGbqvseaowVXgAUsLtxjTmL1uju2aQqqvQPrdOEUMI=;
        b=Gf39ol4lavsUHBmRKoQPC7XptZGt5SvnfUxk8ANKgq0UTsRl8rOTP53zwc1JwzvQKd
         6E9A+TGX43cCOwALazw55n7iPEbgX9/Iffz+MxiHlBBvIS7a9pqc0H7tZ3YsYmUc0xSj
         iD+4hglyHmjBAZZljQNqxL9v/fSCAcmKH/WOhLELSP12uCm07MsKDFDc9Qm0qggJ4KhI
         kvmRJ8JzPWQWx3ckhmedtdbhkkvJ2mnFtxxeO5orfybsIDE4rhSS0klyhrbqQDA8q0Bm
         +l7mMZe0/i4ow0M8wbORkudBxIJyokAUq5pw8+oVBVQGeUYKFP/oINFQSSktgVxTGg8H
         Zh+A==
X-Gm-Message-State: AOAM533MCaPv1032mrD2mFS8Ejau4H/lfwsFSk6IboyNtrbNyv7vQf/L
        q651iW+EGKsFXujR5ez9cQvC+FdzVxX5
X-Google-Smtp-Source: ABdhPJxFRZNfk3bxzecym17syOMw+PdHrMsWneLe7XMo51guW95xIB+Y+XkOdV/nbOkW7I6IlBxqPw==
X-Received: by 2002:a17:90a:aa98:: with SMTP id l24mr6118532pjq.156.1623943364299;
        Thu, 17 Jun 2021 08:22:44 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:601:a552:f5:b632:aa12:8667])
        by smtp.gmail.com with ESMTPSA id n69sm5639857pfd.132.2021.06.17.08.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 08:22:43 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     kishon@ti.com, lorenzo.pieralisi@arm.com, bhelgaas@google.com,
        robh@kernel.org
Cc:     devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        hemantk@codeaurora.org, smohanad@codeaurora.org,
        bjorn.andersson@linaro.org, svarbanov@mm-sol.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 3/3] MAINTAINERS: Add entry for Qualcomm PCIe Endpoint driver and binding
Date:   Thu, 17 Jun 2021 20:52:02 +0530
Message-Id: <20210617152202.83361-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617152202.83361-1-manivannan.sadhasivam@linaro.org>
References: <20210617152202.83361-1-manivannan.sadhasivam@linaro.org>
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
index bd7aff0c120f..cdd370138b9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14254,7 +14254,15 @@ M:	Stanimir Varbanov <svarbanov@mm-sol.com>
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

