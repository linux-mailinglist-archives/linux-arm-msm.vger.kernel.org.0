Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBD42F9010
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jan 2021 02:32:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727407AbhAQBcC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jan 2021 20:32:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727520AbhAQBcB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jan 2021 20:32:01 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 302D9C0613C1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jan 2021 17:31:20 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id f17so14498989ljg.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jan 2021 17:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tf8Myeu0NiVasaQllGDJf9giDfGqj4Lr7pfXB9rMYOo=;
        b=SUINPn4nDwhozYtpjAYsdnMatmtyWqHA6TxOdxuoy66Gg//CsIyk/0UP5HlNlxe0WA
         2HQGxdrqNP+dBZ1JmwWKwoCWXpmql1QDN2NkExL7SzEMas7auT73JQ/EZjIrwl15dlLC
         Jr6ulZmwqC3IuPL/lC0SVx36WrNATUjdHDg5PBDGaOjGQcAOgPD057tYKf55Z2YbRcKR
         ATQERCJSRvK9z0NUAvGYre3baY52oiGlR+SnPwsKvirN0oU7k3Ab+Jwt5awYTuPVm7YQ
         J7KO52y3q2hI4FFLg40Kxt+rDgTQga42FiDilL3fW3QBg6Eh70pDLZHDqWfJTeTaTz1C
         h+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tf8Myeu0NiVasaQllGDJf9giDfGqj4Lr7pfXB9rMYOo=;
        b=VZSm+QRqujPbk1P2dVeVwvfs7TR4Lx7pxdvckKOTllCwt68A53G+5L5T2OLTBu2wAb
         9QbP/foUC9rnHVKd3vfm2E1jIqumkPy2qHJiulFmuCap2zU51caOAGDDeeXByvXJ0d8h
         k5FwjOHeKQApA11O+VLCTcuy+2Vxuq4i1Luh7QWlc8uw5X6O+wVTKJlY2isFym+Y4kzz
         jZkKOSj5ckrjaXvxrOqM7oZzAoFAAblHCK2PGWD5/kJ2G+GmnriMg0A8XKlXyRLsNaUO
         zz7sEC9mGEYNo6+DwX149T8U/FP2Z7hQ8MdJ4VoUnd1DZzag6p3qnO633SpaGZQYINwt
         Yh+A==
X-Gm-Message-State: AOAM533hcroQsF4/j0wwL0K4ybKoSATqpS81423YOD8s53ouBJuHUyHY
        21SXlU7W/SuO1d8M2EUkALj1VA==
X-Google-Smtp-Source: ABdhPJxCQoQi5eX6x8dtjhEPZ/R38mG5z7G4Vj9Sh7u3S7dHXvKe6mzmI97nOXkWNrLDX4Co6I6BUA==
X-Received: by 2002:a2e:80d4:: with SMTP id r20mr7822175ljg.495.1610847078683;
        Sat, 16 Jan 2021 17:31:18 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.101])
        by smtp.gmail.com with ESMTPSA id c1sm1286298ljd.117.2021.01.16.17.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jan 2021 17:31:18 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-pci@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: pci: qcom: Document ddrss_sf_tbu clock for sm8250
Date:   Sun, 17 Jan 2021 04:31:13 +0300
Message-Id: <20210117013114.441973-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117013114.441973-1-dmitry.baryshkov@linaro.org>
References: <20210117013114.441973-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SM8250 additional clock is required for PCIe devices to access NOC.
Document this requirement in devicetree bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 458168247ccc ("dt-bindings: pci: qcom: Document PCIe bindings for SM8250 SoC")
---
 .../devicetree/bindings/pci/qcom,pcie.txt       | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
index 3b55310390a0..0da458a051b6 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
@@ -132,8 +132,20 @@
 			- "master_bus"	AXI Master clock
 			- "slave_bus"	AXI Slave clock
 
--clock-names:
-	Usage: required for sdm845 and sm8250
+- clock-names:
+	Usage: required for sdm845
+	Value type: <stringlist>
+	Definition: Should contain the following entries
+			- "aux"		Auxiliary clock
+			- "cfg"		Configuration clock
+			- "bus_master"	Master AXI clock
+			- "bus_slave"	Slave AXI clock
+			- "slave_q2a"	Slave Q2A clock
+			- "tbu"		PCIe TBU clock
+			- "pipe"	PIPE clock
+
+- clock-names:
+	Usage: required for sm8250
 	Value type: <stringlist>
 	Definition: Should contain the following entries
 			- "aux"		Auxiliary clock
@@ -142,6 +154,7 @@
 			- "bus_slave"	Slave AXI clock
 			- "slave_q2a"	Slave Q2A clock
 			- "tbu"		PCIe TBU clock
+			- "ddrss_sf_tbu" PCIe SF TBU clock
 			- "pipe"	PIPE clock
 
 - resets:
-- 
2.29.2

