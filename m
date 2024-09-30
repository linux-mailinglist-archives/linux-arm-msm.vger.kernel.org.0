Return-Path: <linux-arm-msm+bounces-32774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8F898A5AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 15:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A73F81F2216A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 13:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B670018FDCE;
	Mon, 30 Sep 2024 13:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QkFcN88g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC9318FC93
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 13:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727703869; cv=none; b=TSJmsQm1qzxsUY2WhQv3K3BuF+0t39LIj3uYZxjRc5JrzSaFiuyEmrzZskNhqlpQIsYtL7vrIXSPUtGyAtZQ45bJCAVggDlUVSvSOqTIfHtTn+wJx0gPJ0yMMnBf35EZZhu56X8Q0OkvGNk+RXqvVnmui0R6xxqFqHND7ZfQQ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727703869; c=relaxed/simple;
	bh=Y5H0HrrQ6IglONoTkai/fYV+fWIuc5rbHPbApliW5Jc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=luarLYhxAk/mAG3h9dhst9rUUmgXZXXxDxKlbdr3O11Qr6ZhPo77pZEv+w07CsR+oI7dtrFVFZREr35oDKAs2x/qfcZNe12uvEf13FXekca/aqwKiq0uNzBXX8HxBAVkHzK+oN0jDgYlec0Ke/b5QNVaDzmNu6B9GByymw0UkDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QkFcN88g; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7db637d1e4eso3323412a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 06:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727703867; x=1728308667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DILVMKpFA5VjsR+vvQY53oDn4fB7zBWA61cme3tLjoU=;
        b=QkFcN88gSRrB65DN0b+E7RsF9pmQ0Tn4zlXbI7E8+mgznUpiYqe3Wcm0yLr05ydyYn
         6HLwtnBtc5WZ7uzGFkL7QvegzuRNjWUKX9LRE/RCi9zcoTRnS7nONU7k8mr/xidvvpf9
         fJJl7KhX0gduDoUwuy2mhu77VYwdtJoEtz8qzv8JWdaCstbkywhjc78DChaYvI8yS+1e
         k9ZPY3JFGaSYiBfYVPE/DZd3pLDVtKDe3JYMgWrm0r1v3uMtdUT79MaTARy6oJff7OKL
         UIBS2GfJSYGjIPi9KLmPvAzsqQx0CyHq+gVUBUR1W5A5fdaYpnpRJ0zYvqmEUL8F++b5
         eK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727703867; x=1728308667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DILVMKpFA5VjsR+vvQY53oDn4fB7zBWA61cme3tLjoU=;
        b=fvm4JF3PpY0/kZ3DmyPNvGL5bAWxQFctxxPCIFivcM1VqtnjzKfe/evSzQdxrOxVJ8
         yt7Lc2rMNj9AjJEk6ZQobQ8YFUqcNMDpCIvDv26FsrYLduk1P6I0FNP7yRUQrRuS9lyG
         8a9U79iAcSCZ8+auzW0Tl6WIJ+o3BcS/1zj1Cc8lhE18rsmEUyFB/IwZnVj7oDJxQh82
         4v9e5AakIoQ3NQMVDKVG4omeIY9Q7X2u0jvxIo7Fxl+ByTGjZNLSjbcuMlLLBGcRbRm3
         eotVJTb7WIKQjFz6tSSji76ZhJKvzu3TpvYvZ1GLreQGkzD2/34Z1etz2LhH+p88QhkI
         fjlw==
X-Forwarded-Encrypted: i=1; AJvYcCUI0sm63rEP/r3zyJfVuppkUMlj31esDKFJUYXIsiwjWcaEN6hP60m4CLnI23Cozz3tcx9ip1wBZZW1PBGU@vger.kernel.org
X-Gm-Message-State: AOJu0YwaQpmpSVTh4XWE/ukI9YcVntsECs93pGMDu0Kc8CJwhWgWZ2/t
	rKSh5J7j3a13EGqztpAslMxwhMTCWaPRwBubAqRxOW6feIMTvPgMV0nC9kxP1w==
X-Google-Smtp-Source: AGHT+IFF6pUHURVOksHtQIKlyUA/YLoNUWPw/ji+ioxk83gTs7yv5U2CiseMTE5gPA0f+REAwP04ig==
X-Received: by 2002:a05:6a20:e607:b0:1d4:e66c:2a05 with SMTP id adf61e73a8af0-1d4fa686b1fmr17150721637.7.1727703867258;
        Mon, 30 Sep 2024 06:44:27 -0700 (PDT)
Received: from localhost.localdomain ([36.255.17.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b265397d8sm6235674b3a.220.2024.09.30.06.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 06:44:26 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com
Cc: robh@kernel.org,
	bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_qianyu@quicinc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH] PCI: qcom: Enable MSI interrupts together with Link up if global IRQ is supported
Date: Mon, 30 Sep 2024 19:14:09 +0530
Message-Id: <20240930134409.168494-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, if global IRQ is supported by the platform, only the Link up
interrupt is enabled in the PARF_INT_ALL_MASK register. But on some Qcom
platforms like SM8250, and X1E80100, MSIs are getting masked due to this.
They require enabling the MSI interrupt bits in the register to unmask
(enable) the MSIs.

Even though the MSI interrupt enable bits in PARF_INT_ALL_MASK are
described as 'diagnostic' interrupts in the internal documentation,
disabling them masks MSI on these platforms. Due to this, MSIs were not
reported to be received these platforms while supporting global IRQ.

So enable the MSI interrupts along with the Link up interrupt in the
PARF_INT_ALL_MASK register if global IRQ is supported. This ensures that
the MSIs continue to work and also the driver is able to catch the Link
up interrupt for enumerating endpoint devices.

Fixes: 4581403f6792 ("PCI: qcom: Enumerate endpoints based on Link up event in 'global_irq' interrupt")
Reported-by: Konrad Dybcio <konradybcio@kernel.org>
Closes: https://lore.kernel.org/linux-pci/9a692c98-eb0a-4d86-b642-ea655981ff53@kernel.org/
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index ef44a82be058..2b33d03ed054 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -133,6 +133,7 @@
 
 /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
 #define PARF_INT_ALL_LINK_UP			BIT(13)
+#define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
 
 /* PARF_NO_SNOOP_OVERIDE register fields */
 #define WR_NO_SNOOP_OVERIDE_EN			BIT(1)
@@ -1716,7 +1717,8 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 			goto err_host_deinit;
 		}
 
-		writel_relaxed(PARF_INT_ALL_LINK_UP, pcie->parf + PARF_INT_ALL_MASK);
+		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_MSI_DEV_0_7,
+			       pcie->parf + PARF_INT_ALL_MASK);
 	}
 
 	qcom_pcie_icc_opp_update(pcie);
-- 
2.25.1


