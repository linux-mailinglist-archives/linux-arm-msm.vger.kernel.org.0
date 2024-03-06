Return-Path: <linux-arm-msm+bounces-13467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 277CF873408
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 11:23:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A85681F2B1C6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 10:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5B3605AE;
	Wed,  6 Mar 2024 10:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MxDnGw1r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15FE604DD
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 10:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709720566; cv=none; b=OUWBnmXBG58gvoFjiJqG3fYw9Vt+FTAN7q5VTwWT3bxLTFnC5x5Y2jEJh+3R/aQOhw5R8xtjouFq00FIcUR111T9M6drQbnNeyMMv/eF9QxMjlx+YcwIc7zGUPS67iGVXFUA8rT4jZ2mD8QWvmtKksFdrg5E/18HS8U7AQVrA3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709720566; c=relaxed/simple;
	bh=U8+MilrlyQLMqCKs6OSXrDnQL6lG3tUvuqNkFusZTRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n3ohnlZwD6ZqAc1zEoAFq9mdE/bdqviwNpe250mvYzC0CdLe7IuCSO5iQrEbA39wgPyCMlYxcbQH2ST1zEQZqThRLWCRZiXZkfcskSYqpvrVpGhsAVy0//iV68M1yfCkb2e5MsheEQlrNR5RG4+SF6M6ppJe7mN4/I9V5ryOY30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MxDnGw1r; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2997a92e23bso4364014a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 02:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709720564; x=1710325364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHEwlZG3mvwmMDQMT2HCEzxvwXSOeNme8F0oQ3C5z7U=;
        b=MxDnGw1r567ema+QyIwGgU6Cync+wxC2bQ8GraTGrqEWW2JJWNdJ0jwM+5RRwX9ulD
         bnGUBd05tEw7RY6RE/K8YGNGJmUBdQat5E5mPACGfVHTMaU7I+Q7vX+ZIJBDDel1lGGQ
         SBNmdU+gJ1h3M5l3ZBkJfmjbJP9V4fQoUiDrTiptTyYPSWn8V6MNUHLyynk9MG4vevH2
         6vwenZ+NbPzCEsIY/AdZitenNdym9ObqlynHNbkJpZBQPHFsDYkKeORiATaDl3LoYQHo
         fWOMr4+BpsZEx+bxb9kBNpIEVIMSSGs565KAdwr/MsKca/DGe/RAZ9R3L56h4Oi5iYY2
         B6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709720564; x=1710325364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHEwlZG3mvwmMDQMT2HCEzxvwXSOeNme8F0oQ3C5z7U=;
        b=RExF0M31sY337niU4SrnP6D7duDdBoYuetaRSyCQSL1dCebbb5gBiN11+BlXhrdlJC
         S+M3FKdnmRbW49XfwOb/nQ0eK+W2idqeT434v2QAcf4jacX1VWzLPsvDfU9upBpfNX6y
         8Har6HYuatVTkFH1paX/wcdpNNii2eZuqxaD680nnTnb99penj+mY3wX/w/xRS4fRQJA
         a8GhRw/woDynwVVpT2c9Qc2J6A3aoXWH/Yx87C+phiSyDicz3iT5F78g3UXpp8MlfN4i
         nGxBud1nSUPNiETDCzV4XkZi804qLF8mnRvwFInJgMxYbk6W6I+0/xlHQeuIPUVDsuLx
         owPA==
X-Forwarded-Encrypted: i=1; AJvYcCU2m2mZI9AtIsWu8OAgD/YlEpXgqauMH4Jpg+oqp0siuDUiwZykC+JOHlZiXH3w85/i48rjHRLyyn+sE5DtXLpcYf69YqS+CRdKwxhYvA==
X-Gm-Message-State: AOJu0Ywof1MrBHd+uxZ6gW5laGCT1SNKhIBkX6dgokBZLUuKH8/mUNUn
	3aD5piR8egIwQoq4TTOt7qjhusJnJ1gmjt7vTGRi5YWN7oAfa6xKsAF49sFR4Q==
X-Google-Smtp-Source: AGHT+IF8rDfZJIt86MXmm3NNVX3iMYcEEBEQhVqxtxh7WlEtk0uSWa+lKYrHKR61rYf8lI2654xteQ==
X-Received: by 2002:a17:90a:d392:b0:29a:a37f:22c6 with SMTP id q18-20020a17090ad39200b0029aa37f22c6mr11069558pju.28.1709720564128;
        Wed, 06 Mar 2024 02:22:44 -0800 (PST)
Received: from [127.0.1.1] ([117.248.1.194])
        by smtp.gmail.com with ESMTPSA id li17-20020a17090b48d100b0029ab96b13ebsm13339320pjb.40.2024.03.06.02.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 02:22:43 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 06 Mar 2024 15:52:01 +0530
Subject: [PATCH v4 5/5] PCI: epf-mhi: Enable HDMA for SA8775P SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-dw-hdma-v4-5-9fed506e95be@linaro.org>
References: <20240306-dw-hdma-v4-0-9fed506e95be@linaro.org>
In-Reply-To: <20240306-dw-hdma-v4-0-9fed506e95be@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Mrinmay Sarkar <quic_msarkar@quicinc.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=HBFaoOrEPY28OgpXbosd8HC8b9IU9rla4yFX01mozG0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl6EPR3LjKVzSqhLSTX52Xj52sP8auulr1YRKUA
 e7kAGWdmt+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZehD0QAKCRBVnxHm/pHO
 9ZXBB/4x+EAhH/4vRq8jl6l9OTtS8TpJ1OWU+CL5k04aHCII7oiapzr6jT0TU56ExlM0Fp+KVwx
 MvcGTaBu1oPvRhvxxi8Ya0sxBNxjDrGkJujhLtueKz1fJRKpfweL17BtDkn2t8qksxOBrRA9TUA
 UwBHwB6/HKXAKsCjctTYcuxmeAgj21s/GzhVoxR+HCrOSgR2C91gaGtINfsqZ6lz8Uf8ZBKZ3Sk
 lAMxv9bKabKiDJX8XvNAv30QxGagZ88OT1LtImQiQn2+0+PE1LDFdtvmUN6Pw901+KTTqA6vYOS
 iJ+AOF/p/jv6dYsAsJKaL5QiupeN0cZHqOwtJWFR0hDmtXQh
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

From: Mrinmay Sarkar <quic_msarkar@quicinc.com>

SA8775P SoC supports Hyper DMA (HDMA) DMA Engine present in the DWC IP. So,
let's enable it in the EPF driver so that the DMA Engine APIs can be used
for data transfer.

Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
[mani: reworded commit message]
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 2c54d80107cf..570c1d1fb12e 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -137,6 +137,7 @@ static const struct pci_epf_mhi_ep_info sa8775p_info = {
 	.epf_flags = PCI_BASE_ADDRESS_MEM_TYPE_32,
 	.msi_count = 32,
 	.mru = 0x8000,
+	.flags = MHI_EPF_USE_DMA,
 };
 
 struct pci_epf_mhi {

-- 
2.25.1


