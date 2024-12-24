Return-Path: <linux-arm-msm+bounces-43255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1016B9FBF04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 15:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B4421884722
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 14:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C09E1DAC83;
	Tue, 24 Dec 2024 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kw4xKlcd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B801D6DBB
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 14:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735049464; cv=none; b=U5dJzDrAqwRdKHXpnrbV3RI9mv6TSYjXKEa4y9lGuDy6XP9JkysdHsO6eJ/CMJnSYhwqsVSHAbV0WLa3qHcBHGjF8KOyEWWH4ypMI5DPkpXFAaz+Eg3/Qchwu03FmqJl7MEdrjvzuHaYpJeza9fV32L6/VQGPCgJbfGERzDbXBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735049464; c=relaxed/simple;
	bh=0Xx6GMsAw+JWlDoTPToHHqQOG07yIdiQ1yAV7t7FJ5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ngUyzdDe5xmS5YPd8wKkAChENy9Yxo+RvurIDhNY6amUEXR7oOFOoVqvxa4btuEjhhtvmrXKZp48+cL7a65uqABCU7bFI4boAJYTqWrrcOlwyYZUHNIHipWaI7fa+pOkzNbOMkBVL8TCbhXERHHePajpkVfuWF+vguEU6f3vKTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kw4xKlcd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BOD3gPr021056
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 14:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1HEWmjXS5JJuGEVhkOT6pTbnHC1543u6z3ZHIx/4YjI=; b=Kw4xKlcdv0q6shJr
	8wbDHZ4JxAhK8qDD89fkkmCAoW0eiB288/ND7iBJJUcyS6wgpvZb43pqBb4x1sV+
	x0ewTCdNGSqhr6tTv3AbKUzz5XWv0BoNmL9upGavoWT0Cld2FWh5rixMIL/A4S8U
	rZy0hnMifucNyFLXX6uPqGE0vgHg/2GM8njHpqqWm33+EKvI6mbvm8MjVDpKwkeV
	wHX9OXYVUQ5SQf9HCXkPiyRmWwM1GHCrOV12AOs7+KAXbOODE464jSCue9vI4WpI
	d6Qc+c68jK7AvxMm0GPwdVlENCQmWBoBwjxUKsDRaQF0xoP82UHDskzUqeo3Kkkv
	uyg7pw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qwgt8b38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 14:11:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2166464e236so90465525ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 06:11:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735049460; x=1735654260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HEWmjXS5JJuGEVhkOT6pTbnHC1543u6z3ZHIx/4YjI=;
        b=IaNfG48p1HCmFR9GIyBDQanpnziGd0EOrK/6dmHEiNqzZBF8DOt9DbBLt1SbCLhKpp
         UUyiP4LnUfWjBEfv7WogF34csB/5hGzJ+aKZ325ljKpOnXalBR/UCtoaDskKNW5dbUHt
         B34qnk11K3UsbTJR9F5C5Rd2nzc33xDygFO4XXYOPsMuwAvDaz5hikgETTI0xxGxq6KJ
         OWOEEpZCypzJmAX1VJzzGMwjKhkcLxgU/Q36UdtlqME2yI6K5DBmpVOCRADrkXhYZyfI
         cxh921MMP+Hdat6LTGrKWVrkR0Md1SZplH7lZzRIHE6UDLDNu+FV4jaxSNZHQlo8RUIy
         p8Qg==
X-Gm-Message-State: AOJu0YwPgIT2BD7fSJNESt9gYUg0SwnpTButxvdnoKFy0N/TMn9HyhOH
	/j4Bgo4FDSNVL2WVxkKZBd0EdObdVBimvlB7/jNNyn4ODUqF2JFkFhFdLASevYKumrY7WqMRsTg
	2o72obYR98nbTYnWPjmKLQnNLwtVOte7ptKpVobzlRP4evy7cIWkugQG4fPq0O+eR
X-Gm-Gg: ASbGncvGQrVTQMQF61KJfvUVPItaV1i30BfiCNWN6jFYlDzbRuKj/S40La85R7vMye3
	NCGe2TfMyrs/IljSdOpbyuBljhY5mJ6cyhjoYXIirKFCtOfAAfjp2kEOIaAwfwij9h5bWLK6E1i
	EQI24IHKnKDFi56aPHq9HjxZTAmKr0MUfG+kd2jrVxC2k87lb62ri8YUxla+VwI7mAqPY9zK5m7
	HMunN9nwAs4LDU6h488imJPKtnhcwCIbp3JaNpT/z8GvLs958awI5vvUnEBDdjtzKFjwoEvm8b0
	P/wjlQG2jeAiatOD
X-Received: by 2002:a05:6a20:c907:b0:1e0:e07f:2f01 with SMTP id adf61e73a8af0-1e5df939d84mr24516979637.0.1735049459528;
        Tue, 24 Dec 2024 06:10:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGxQd/3dtpr+emjaEkW2pVkPDwgEoBoiqsutuMOLha1DB7CG6CsiB1HWQkUaeJk6s/Y1o24Q==
X-Received: by 2002:a05:6a20:c907:b0:1e0:e07f:2f01 with SMTP id adf61e73a8af0-1e5df939d84mr24516828637.0.1735049457329;
        Tue, 24 Dec 2024 06:10:57 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90b8f5sm9691216b3a.194.2024.12.24.06.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 06:10:57 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 24 Dec 2024 19:40:17 +0530
Subject: [PATCH v2 3/4] PCI: dwc: Reduce DT reads by allocating host bridge
 via DWC glue driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-enable_ecam-v2-3-43daef68a901@oss.qualcomm.com>
References: <20241224-enable_ecam-v2-0-43daef68a901@oss.qualcomm.com>
In-Reply-To: <20241224-enable_ecam-v2-0-43daef68a901@oss.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
        quic_mrana@quicinc.com, mmareddy@quicinc.com,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735049433; l=1397;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=0Xx6GMsAw+JWlDoTPToHHqQOG07yIdiQ1yAV7t7FJ5Q=;
 b=7URn+oI+BDdjhibv3tPY1iSYtX0PuA28lSzDe0WICKdg6iuIrn2WCFUaD3YHsFVZ92oGowk1M
 0p7lFy9UkSiAZ77yj2PuzkIh0E0M25WXzVf5qzR5qpsJD8rfbc48KZP
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 2RvQp6mrbO8aO2uvAEY6fMZ53AVPJXqG
X-Proofpoint-ORIG-GUID: 2RvQp6mrbO8aO2uvAEY6fMZ53AVPJXqG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 mlxlogscore=889 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412240122

Allow DWC glue drivers to allocate the host bridge, avoiding redundant
device tree reads primarily in dw_pcie_ecam_supported().

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 4e07fefe12e1..c3f464f128f0 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -479,8 +479,8 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	struct device *dev = pci->dev;
 	struct device_node *np = dev->of_node;
 	struct platform_device *pdev = to_platform_device(dev);
+	struct pci_host_bridge *bridge = pp->bridge;
 	struct resource_entry *win;
-	struct pci_host_bridge *bridge;
 	struct resource *res;
 	int ret;
 
@@ -492,11 +492,12 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 		return -ENODEV;
 	}
 
-	bridge = devm_pci_alloc_host_bridge(dev, 0);
-	if (!bridge)
-		return -ENOMEM;
-
-	pp->bridge = bridge;
+	if (!pp->bridge) {
+		bridge = devm_pci_alloc_host_bridge(dev, 0);
+		if (!bridge)
+			return -ENOMEM;
+		pp->bridge = bridge;
+	}
 
 	pp->cfg0_size = resource_size(res);
 	pp->cfg0_base = res->start;

-- 
2.34.1


