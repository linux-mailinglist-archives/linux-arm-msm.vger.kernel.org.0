Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBC752D1F42
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Dec 2020 01:47:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728801AbgLHArM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 19:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbgLHArM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 19:47:12 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B61C061285
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Dec 2020 16:46:22 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id u19so20757100lfr.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Dec 2020 16:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iMeYx3PuOFeT/ou7cP6t4OiaQH+OiI6hASKT4SyHXP4=;
        b=plXKbgH1XkCLdCGGiX1O46e+mERn8lchrvrv9dK3Sr9L4mOghPw5HhQz4rIoKSTLnp
         HxU9mdDKOZAIxt8F1nNvYFP7AT+4aXhBMrJWGJl7UI79BKrx/UquQ83wkYpFx1fKuscP
         LAJ4vVdSc8BMznhZpiofqLHte19wz4EJ3Nzl9wDFDpLMW63gLVLuHTDCdq0wmmw857s2
         ULxEEh1u3nZ5tkYQQas/vDC1g7AtbcNDQ/0RJ8BsJRBrKEYSC2ax65ka6DVZwopNdtyJ
         n3ZilaKXXuJxj4VsQBAsHp4fsrrOhBqMfF6MUhcl3CTkU9uEblsDfs4y8D9qCXbt8nxY
         jnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iMeYx3PuOFeT/ou7cP6t4OiaQH+OiI6hASKT4SyHXP4=;
        b=bM0XEbKe5+lbXnt7fLmM6bSWL8xUBfMOTbecMcyA2ws98HHe8uNJF/xVGnW1xV0ax3
         zwpdfmJQIL/XodX0YQHFcPdDk4MGmc9gaDwyTpzpXSs3QmwzAwaWjn2an3C7nshi+UL1
         oxByg7EQJpx8D2+Y5icoTD2RVvDFikmJhYP2r6qEtuf9mwpDbGsVyilhCtXCqhV9hRhW
         Ou3EWhFzaG6M6QUPMlAxZRHpPa/zC05LyluJrPYv1zlSS6y8R3NSoeSxtJlP1Cfg0xfh
         NeBL2JJUmn6bN1/6qO+/8a1vk5SwnJG+CklYFA3UWYmkpytIkXveRFFFyFEnw+5OpUl3
         ex7A==
X-Gm-Message-State: AOAM5333Fv0vXx3HPptuQBQmMC7aAtpw4EGHlv0c5+lDiE/AcAWdBi5x
        RfurB00ixBhttt/TVAmd0qAoQg==
X-Google-Smtp-Source: ABdhPJwbvUrdi5CDciG/D+wS0Nn+liIRxKlNfGmYY+fFeM4F89RLWMsV50NVfh/HO2J2V8kGqAafxw==
X-Received: by 2002:a05:6512:3690:: with SMTP id d16mr10009389lfs.321.1607388380637;
        Mon, 07 Dec 2020 16:46:20 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.229.141])
        by smtp.gmail.com with ESMTPSA id d3sm3028229lfj.206.2020.12.07.16.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 16:46:20 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: pci: qcom: Document ddrss_sf_tbu clock for sm8250
Date:   Tue,  8 Dec 2020 03:46:11 +0300
Message-Id: <20201208004613.1472278-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208004613.1472278-1-dmitry.baryshkov@linaro.org>
References: <20201208004613.1472278-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SM8250 additional clock is required for PCIe devices to access NOC.
Document this clock in devicetree bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
index 3b55310390a0..c87806f76a43 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
@@ -142,6 +142,7 @@
 			- "bus_slave"	Slave AXI clock
 			- "slave_q2a"	Slave Q2A clock
 			- "tbu"		PCIe TBU clock
+			- "ddrss_sf_tbu" PCIe SF TBU clock, required on sm8250
 			- "pipe"	PIPE clock
 
 - resets:
-- 
2.29.2

