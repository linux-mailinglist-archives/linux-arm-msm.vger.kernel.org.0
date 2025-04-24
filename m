Return-Path: <linux-arm-msm+bounces-55458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EC4A9B36D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 18:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E19C1747FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D22427FD6B;
	Thu, 24 Apr 2025 16:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ag0ZPgs7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBDF280CE0
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 16:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745510860; cv=none; b=dlfvwl9nSOdPI9exsKukacZwA0qZS2ev66b08CI3VRUhL+f907FyzN+c4VhawMJtC3yl1gGj4rd92ZpiGeKO5IGX8tRI5G+NvBh+EUKVGX0zAYXtfTa5O92FrFBNY4+hKGsUT2BVwgj3qWrwtD8pbLNTK4O53r+6wuMBJ1V1B00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745510860; c=relaxed/simple;
	bh=13t0G+6cETyYOm4qxRCTFv0cuGZG4Jm1bu/20N6Ac+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jntCvjmKzXGTi/na6nL7kjesgWL2cwjBntEGVLLVeOMfxko8RaVqnIBEfNHWivKWJNMpNuHi+M3QiTOQ0nJ0m9mDxiTepFlm8I9S6aUe2lU3NCjGsnmdnDTR0ntLUtZCz52SpmNctuAiD3VP6ctv5x7plleBru/xkBV2PXGaNdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ag0ZPgs7; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227cf12df27so12271445ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745510858; x=1746115658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Hs+DElq3FESieGx8paocjJpcUpxIsb2z1UnlatNE9M=;
        b=Ag0ZPgs7EgTgboEc1Ud0Kj810ZtUor6arz0XI5fB+sO7CUBPHDwcKpYab01gxJDuf2
         wfJ6vRqOB08FAeZ0FMAzYnDTnYolszUbGX/ftVSPMNhiODc4A6b+0inTt9b5lVrSSSg0
         F9moSHczc8aEMcnpfvhkjD35SBJwmG4WDuPUsDeW+VudROXv1T+Xmn1PzfUiJChmuEKW
         yKVlZgHuYSWNI9xAGH59n2oj7pTphaSTTXJmr2U2/iSr6E4PFwrLWRhgfEKXPlNiVxP7
         fF5Z4IsuUzUKckLKAQqTYEuWJfi/tiFCx3YyddodvrdoF3L3QPhoQYxogU1QNP6LSfI2
         tdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745510858; x=1746115658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Hs+DElq3FESieGx8paocjJpcUpxIsb2z1UnlatNE9M=;
        b=UZyh/0WGCS9MCBRO+f4V+O3EikP5dYk1+cuab6PCoHgKfGr3rZxnssFadfTlWnnnaO
         M9AtT9UNo3k2ju/P6AYqt0Gt+jPZV2KOPVRpFjs2pPp8GJ+8w7az2YthFrKWBjoF6zex
         3+dIdwNFZYBcj8Z5KSNoOGWEcdUde5MJWEtf0lWJ5mMqgoZB5y8pHoseh5vgsWr++TEc
         cnuovubj7rUXCzgvRPn7Nnd4tsLYv0jVwcoYvYBf3HuHHCS8XfdcRXqw0jmvzDEDZjKV
         dYrwIzAT5PIjQU8C2xcCA4x2CNQGbdqmxNz9M43AbY0vhF9oMoRpuLTo9FjA6aiKZGBx
         u0ew==
X-Forwarded-Encrypted: i=1; AJvYcCW2bqyFLVghZz1sgd9rWZa1YP+4jyaHWwUTaM8eIzXDBI+ReZib5vDhI05PL1Ct/RTsxVor3IYuaatOdXLV@vger.kernel.org
X-Gm-Message-State: AOJu0YyoWvvJDCQ1SdxGbGoOyffxXP5x6PVAdNQHTNVVnbLfx295v+z4
	/wB0448+9h6F3VMn12lefoyiqF0aLsnLMLwBAtR1+2d0d7FaPAEEvTmUYS8IFg==
X-Gm-Gg: ASbGncvFTFI5wRPcjnnxbIJWIv7FKFTGzlKzU9hXK6l8t6YG7WUWVw1HTEp0f2qBKJJ
	1bFtIlJZXneaSXp0lfOXUznfHEQBsRsDV+qjH1c1mxnHmQjPDqlURRCHJjfuagXsyWDwwwgYkB/
	gr37H2p8p7yEXDjKppwkZaeAwNaAavkIgnVwyd/hk+1P3QcucomLv14EDs/MTS832jv3YhOgpAA
	iRPb060caz7iNaB+hteo8DYZEvU03Jwsko1UImQFvyrLJXa3n7XI7OTfXC26sfxk2Hj80RFKwUG
	xse4yAmjNxb0p12bWyldiRN++FGT5PpedG+ijrP7EVrZQ4qUYfJULIw=
X-Google-Smtp-Source: AGHT+IEDm5kq65ub+8obF/jK3dsKlPxHRZmI9IhjWYD3eVcDVpnCpZiA1pBPOcOzfuMr4TRpeAfMjg==
X-Received: by 2002:a17:903:184:b0:225:abd2:5e5a with SMTP id d9443c01a7336-22db4792f6amr39253145ad.4.1745510857899;
        Thu, 24 Apr 2025 09:07:37 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221656sm15262275ad.252.2025.04.24.09.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:07:37 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 24 Apr 2025 21:37:17 +0530
Subject: [PATCH v3 2/4] PCI: dwc: Pass DWC PCIe mode to
 dwc_pcie_debugfs_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-pcie-ptm-v3-2-c929ebd2821c@linaro.org>
References: <20250424-pcie-ptm-v3-0-c929ebd2821c@linaro.org>
In-Reply-To: <20250424-pcie-ptm-v3-0-c929ebd2821c@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3666;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=13t0G+6cETyYOm4qxRCTFv0cuGZG4Jm1bu/20N6Ac+E=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoCmG+S/JwqhnTTD83c8djAs8p3xfAC6vCY6459
 GFDYU5+em+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaAphvgAKCRBVnxHm/pHO
 9VSeB/44j5l7+iTd+EQG/fLPvZfK8MGLe+TfnEZvImHeshwhmtduYYp68oTWk5L4I/YqbVDIcOv
 tuIagzVFTKLHrEGlH+3XhJgqli5KeFRWP76ZdT1jK4NYSMRaCsxmpBn1dnjgILWKJigw4kKTNLf
 //t9x4SwZ627jUJqWcEZU5l59V81lrFtH0fl18rlEGpVxc/ye1L8rRwLKdzCOs/3t0UPhWmMTBX
 uToUZuC7Vk7BUMxDBMKSc0ULstcpRFyv70pu2dqxdhq3HWjN4rPyk2c36Qs2tR6GvIIv4mHfoWd
 EiDp5JsPcImzoNs0TuPIRQUJE3z63WNF6qy1O3K4TKwzSodi
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Upcoming PTM debugfs interface relies on the DWC PCIe mode to expose the
relevat debugfs attributes to userspace. So pass the mode to
dwc_pcie_debugfs_init() API from host and ep drivers and save it in
'struct dw_pcie::mode'.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-debugfs.c | 4 +++-
 drivers/pci/controller/dwc/pcie-designware-ep.c      | 2 +-
 drivers/pci/controller/dwc/pcie-designware-host.c    | 2 +-
 drivers/pci/controller/dwc/pcie-designware.h         | 6 ++++--
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-debugfs.c b/drivers/pci/controller/dwc/pcie-designware-debugfs.c
index 9e6f4d00f26298077c976c9e74d8616544f20ddb..896c387450ca45d979f6baa04e6b3ae3e4be167e 100644
--- a/drivers/pci/controller/dwc/pcie-designware-debugfs.c
+++ b/drivers/pci/controller/dwc/pcie-designware-debugfs.c
@@ -651,7 +651,7 @@ void dwc_pcie_debugfs_deinit(struct dw_pcie *pci)
 	debugfs_remove_recursive(pci->debugfs->debug_dir);
 }
 
-void dwc_pcie_debugfs_init(struct dw_pcie *pci)
+void dwc_pcie_debugfs_init(struct dw_pcie *pci, enum dw_pcie_device_mode mode)
 {
 	char dirname[DWC_DEBUGFS_BUF_MAX];
 	struct device *dev = pci->dev;
@@ -674,4 +674,6 @@ void dwc_pcie_debugfs_init(struct dw_pcie *pci)
 			err);
 
 	dwc_pcie_ltssm_debugfs_init(pci, dir);
+
+	pci->mode = mode;
 }
diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 1a0bf9341542eabc4d28070e3a2d6a8b0b444578..6ee14694372c70783c83c2c7483310f4cbfda078 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -1013,7 +1013,7 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 
 	dw_pcie_ep_init_non_sticky_registers(pci);
 
-	dwc_pcie_debugfs_init(pci);
+	dwc_pcie_debugfs_init(pci, DW_PCIE_EP_TYPE);
 
 	return 0;
 
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index ecc33f6789e32cd022a5e5fb487bdec5d7759880..17c78a3346512bef8319af2ff7b8c412d41394a5 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -567,7 +567,7 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	if (pp->ops->post_init)
 		pp->ops->post_init(pp);
 
-	dwc_pcie_debugfs_init(pci);
+	dwc_pcie_debugfs_init(pci, DW_PCIE_RC_TYPE);
 
 	return 0;
 
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 56aafdbcdacaff6b738800fb03ae60eb13c9a0f2..7f58c94b5b1e9a590692474d5efa80c5b5ed9b8d 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -503,6 +503,7 @@ struct dw_pcie {
 	struct gpio_desc		*pe_rst;
 	bool			suspended;
 	struct debugfs_info	*debugfs;
+	enum			dw_pcie_device_mode mode;
 
 	/*
 	 * If iATU input addresses are offset from CPU physical addresses,
@@ -871,10 +872,11 @@ dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no)
 #endif
 
 #ifdef CONFIG_PCIE_DW_DEBUGFS
-void dwc_pcie_debugfs_init(struct dw_pcie *pci);
+void dwc_pcie_debugfs_init(struct dw_pcie *pci, enum dw_pcie_device_mode mode);
 void dwc_pcie_debugfs_deinit(struct dw_pcie *pci);
 #else
-static inline void dwc_pcie_debugfs_init(struct dw_pcie *pci)
+static inline void dwc_pcie_debugfs_init(struct dw_pcie *pci,
+					 enum dw_pcie_device_mode mode)
 {
 }
 static inline void dwc_pcie_debugfs_deinit(struct dw_pcie *pci)

-- 
2.43.0


