Return-Path: <linux-arm-msm+bounces-33310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 102AC9923CE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 07:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B40862821CE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 05:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DB2136352;
	Mon,  7 Oct 2024 05:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H+iptQHF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1523FBA5
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 05:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728277996; cv=none; b=b8QMsXgKc6Q+w21PWdCXuE3a0hsYKlqJbHZnner2mkwt2PXet3etOAl9W/0bFP6BO8gHcX1689e6AIm5ozaRO0c7h/vvVT95iQ9NfDlE4RbNJ8tqTjdHyYV4daHMHSSKhC6NALDXxKc36+CQqBGFadeDq81cBgkzm6fRF2s5TYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728277996; c=relaxed/simple;
	bh=Xl7npExBXXB/m29YQcRR5cFMvxfN8fXQJgX1ModzhYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Gr4sIkXWeQlEyaqeOpBJURSpkVRXLkdKcv35l+npAX9+s8GSFvp4oCEErLMGFzoRNYLzOudwaLY22UPtZtT8kqMWn0gvvY8Vp8Zw8/Bvd5YbyNn2W3LMcJGQTzA+51Kh22AwEo5bU8rv9B5XTFrOBA6RbQtUqAVrDU6QikZJBtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H+iptQHF; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20bb92346caso24925985ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 22:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728277994; x=1728882794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6jslguiZl6FGAJBiDxlsSwtiDEosNNmbWrk82rYwT2c=;
        b=H+iptQHFy13tYDdidpEyxRy+Zj+rRTj2uE9xeR9K5tcumR0vMrpmAWqhyxsIYbD4Mc
         PR8xgOPlcr76g6AF98DVR6iHqf6KruG1Hz5WH1KlacIZOwDhdY9F94qXI0UYtwbirOnI
         CfQ4yP6goWa3cC4yX0kj/TtpbbA9O25kEljjBC62WTvzFNZqWrqatpGMtxnE8LmaxK8S
         /qnhhlzyAShMr4MeE1BbsoaNueiiKLpCM6mWkkWityfQmYPFAgvupZ6QcSNF3/S2C79a
         eQ/mHrRYEaBuo1HcxXMqDruOJhZi3x/a+CHm2uHQ2ZU8bpiSL7Wg5/m61UhOt0SMv5Hp
         J54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728277994; x=1728882794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6jslguiZl6FGAJBiDxlsSwtiDEosNNmbWrk82rYwT2c=;
        b=lVnDv8jVp5azIVpPdm4blSCifS1bZ2LBjIHuG0Fxy+1ZMkYeWadXYL4NXO8i+8qJu3
         6ZcMJvxIE7ljO+lLwBmmFAdSAqPbHi7aJmMknwP+tSEPAzbp70nrYY6q/BGLXJ9PK7fx
         lrp96R0MLuX3G9f/PPE6BqK7v5xxhNi2WVBxHwwx63orcPFC7l8Q0hMxtZP+pPaVBJ0q
         zIVE/phjaVLqxJChKk0Q/TElpm+CjxthALaXfvuL4VNHAiDqHgj74YrPlNdPFcfWEO7c
         a9Gbr846NFmAKzojBYZW3l3M9FO3wGcMy2ie5IhXMwTTahVBkliJ0EwIcRWfcq8CsRVf
         kBBA==
X-Forwarded-Encrypted: i=1; AJvYcCXUYEzGW2/+1D1ZHTJ2ABj55wWNMxtlJq3N0wsZFZFJ2rklq7kcOft3NJqxAImqRKruuHtiY83MXbsPvlpz@vger.kernel.org
X-Gm-Message-State: AOJu0YycJcyRBpKJ5FLWkxNsDK/24v/WRu34bayD+RCUFv7gYz3QF5XL
	XQMXM8nWZEFcbuGgCGxODUSO9hOEBB61fWk7TRIAXvfAQqGMiOnXiJq7TxfZVQ==
X-Google-Smtp-Source: AGHT+IHAx9gVDA+7k4KjSFKdMpF9NHRdObEoyyAYXc7/CdU+GE9B2kUhrT0lx83zu20SnP8Zs8x+xA==
X-Received: by 2002:a17:902:dad0:b0:207:6d2:1aa5 with SMTP id d9443c01a7336-20bff49bc78mr146295585ad.13.1728277994500;
        Sun, 06 Oct 2024 22:13:14 -0700 (PDT)
Received: from localhost.localdomain ([220.158.156.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c139353e8sm32173535ad.164.2024.10.06.22.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 22:13:14 -0700 (PDT)
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
	Konrad Dybcio <konradybcio@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2] PCI: qcom: Enable MSI interrupts together with Link up if 'Global IRQ' is supported
Date: Mon,  7 Oct 2024 10:42:55 +0530
Message-Id: <20241007051255.4378-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, if 'Global IRQ' is supported by the platform, only the Link up
interrupt is enabled in the PARF_INT_ALL_MASK register. This masks MSIs
on some platforms. The MSI bits in PARF_INT_ALL_MASK register are enabled
by default in the hardware, but commit 4581403f6792 ("PCI: qcom: Enumerate
endpoints based on Link up event in 'global_irq' interrupt") disabled them
and enabled only the Link up interrupt. While MSI continued to work on the
SM8450 platform that was used to test the offending commit, on other
platforms like SM8250, X1E80100, MSIs are getting masked. And they require
enabling the MSI interrupt bits in the register to unmask (enable) the
MSIs.

Even though the MSI interrupt enable bits in PARF_INT_ALL_MASK are
described as 'diagnostic' interrupts in the internal documentation,
disabling them masks MSI on these platforms. Due to this, MSIs were not
reported to be received these platforms while supporting 'Global IRQ'.

So enable the MSI interrupts along with the Link up interrupt in the
PARF_INT_ALL_MASK register if 'Global IRQ' is supported. This ensures that
the MSIs continue to work and also the driver is able to catch the Link
up interrupt for enumerating endpoint devices.

Fixes: 4581403f6792 ("PCI: qcom: Enumerate endpoints based on Link up event in 'global_irq' interrupt")
Reported-by: Konrad Dybcio <konradybcio@kernel.org>
Closes: https://lore.kernel.org/linux-pci/9a692c98-eb0a-4d86-b642-ea655981ff53@kernel.org/
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # SL7
Reviewed-by: Qiang Yu <quic_qianyu@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2:

* Reworded the commit message
* Collected tags

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


