Return-Path: <linux-arm-msm+bounces-47062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 144F3A2B698
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 00:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98F80167554
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 23:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73EB239093;
	Thu,  6 Feb 2025 23:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SNEWzWhx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8B4237718
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 23:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738884567; cv=none; b=d30WX19xsyYyn4N1E76cmbFzBtZ4izYg+FdafBmosmiuHKilOKeW/6YWLsdl50P6OjAQTZANJOgEz915KdrGEeFUMDIz4pjaBhMzdPKMxkMm17fdcb45hNUc6tY/PgEMtpIYYk6yhRRTDbDx/RxbkqwHhWRiw6BpX44ELvkZHPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738884567; c=relaxed/simple;
	bh=SWWzA0HUJcFMbO1HqY5NCoLambaGtXZLJb30DVpO5fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T5XbB1ddfTro41ugHjHktoU/Fs+SJxtFOO3DqZoKf7M4pnq/LqhVSdOZeGx1gFtrOYTvQBWooqSsYZqljiCVS2bVDOoUQ/x74fw7rYPW8+dzlGBbXCo9XOKSD5midIE28azqLxZrUyRd89sVfwmu9bV5mBLIQrZusn8x8g3T6mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SNEWzWhx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516IskkG022941
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Feb 2025 23:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z9b6+uWWlNVG1bR8nFXu1gMB9eppc8z9TSDppb/TGM4=; b=SNEWzWhxO+rHsHyP
	Duo7tdcMQ/jk1YS6ihmrXhXDoqm8VHhX4qQt4OtegyOSEwmI1+pM2Ut8JkCKlTTb
	557+iRiiDU0ZTW3izl1fUM+0z6NypsCpjo+ikQJWbNtLG0THcqv1N5XIdxnXyxCZ
	+2pDUu+o9u/j5m4cbFiiiIFCqyo+N2+CXBDThkdDCC4CARolROtAPiqfqPE5y9SC
	K3GreRs0rsdyEkFb/owO0+lHtm4JvzMXI7odsGI/GkmJ6eaJugVfnKV8fmbQkAQ0
	6TpikZaeQCqOoJI3jEZR8nhcAl7hMfY+nbIuLwnZ8iqalLMznyccHTHxswtNYZgc
	yDAPhQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n2rt8hty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 23:29:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21f1a7dc0e6so54837485ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 15:29:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738884564; x=1739489364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9b6+uWWlNVG1bR8nFXu1gMB9eppc8z9TSDppb/TGM4=;
        b=Xoa8Myd0B2du+YjCoKShJuS7CZ6EleckSg3vWDpmmTKtWFHtJGm/Z4NMFWzPf7e3wN
         dL61RVrVw42Axouar6XTzyEl0QQe03eiSfzoUHHlgNoQyx9NL6QYD4q9Pa4Dqh1tZoXJ
         bMbddCf/nBp4Jxy6HrhoeZb0NmMUebi5YV0Pw5Np6UerKkr7lQjmBlmwImGpLVBy/ck9
         awEDwzQvFuLXfyap78w0ZYKr+aktSGr+71umz8p6hpANnkGa3sXdJYat7YreF1GcHyu+
         oeKV3iN0eJvsDrwnFxygZtn+nQjMCpbbjBumFcsYaMMBIXl6iUJr1qnm2lWDFN72Kv2p
         FqXA==
X-Gm-Message-State: AOJu0YznHUVVEC4zIxXHhdq5WeOdI5LHb2lWmLb6TBZ2vsMYNrt3rfTT
	XyUUnH/Eu2+EmImPUCgLADFvL5fx8NGERcGMlcDNVM6Tf3ipAngZHvy56ToVWnCtTtxByUKUeEf
	909zSO+ma/mAAgV5P/rOanZoxrKrQQ72xu0DLU4qf1LV/WiX1HzmFnOs6NYSodfDk
X-Gm-Gg: ASbGnctPidJECouPG6kMM/IUny45Cbag8UWvo91smiHxdUXUN00/7y5xrEgsmJl5k2d
	mK8Ary8x48w+Px4xETN1XShsZg3nwIb1y+D8MRL0Q9ihykZkKxPMWKCtP6o8IqX7YcnaxILI/cH
	vjAb5Pbgox1o2aOHxokqzqwQvZE79dFvaIhkiS/1lIcTlDd5bXfQLP5BiiLYNyu/rI0QI85x3mb
	iwIhjwbqyfc+HxK91RvVOJ/ZC0QCmUtilrEn4nNLkdV4kalnI/2OVja1CjSsHwiWN0aTAExzE2x
	pEQNx2MHPOenjVr9j7FjUYYP6lnwFWuuAY4ZZp3x
X-Received: by 2002:a05:6a21:7101:b0:1ed:e2bc:5c9 with SMTP id adf61e73a8af0-1ee03b71f2emr2037051637.38.1738884564533;
        Thu, 06 Feb 2025 15:29:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVvvYMobydfHRdWhzMPIv8JZmHyxD+Mh3A0E5Fwkz+JeyDtuYL5YSOAi+LGBdODS/8LGwWcw==
X-Received: by 2002:a05:6a21:7101:b0:1ed:e2bc:5c9 with SMTP id adf61e73a8af0-1ee03b71f2emr2036920637.38.1738884562752;
        Thu, 06 Feb 2025 15:29:22 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae7f6esm1845905b3a.74.2025.02.06.15.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 15:29:22 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 07 Feb 2025 04:58:58 +0530
Subject: [PATCH v4 3/4] PCI: dwc: Reduce DT reads by allocating host bridge
 via DWC glue driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-ecam_v4-v4-3-94b5d5ec5017@oss.qualcomm.com>
References: <20250207-ecam_v4-v4-0-94b5d5ec5017@oss.qualcomm.com>
In-Reply-To: <20250207-ecam_v4-v4-0-94b5d5ec5017@oss.qualcomm.com>
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
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738884540; l=1728;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=SWWzA0HUJcFMbO1HqY5NCoLambaGtXZLJb30DVpO5fc=;
 b=fZyiGh+iMPqdX/K4h9jdTW+5zikUfOPuZjl5KcMx85+JOe7+rbVN381UpyvurlnEV16UJ7VQd
 jDdcMRo+q70DPlgYt791jj0Frlgw0Nhyo/Av/N0hwH9New5yG8qcNw9
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: QphOXHP4wvk4_fKRAFMaNa_f7lQe-Slm
X-Proofpoint-GUID: QphOXHP4wvk4_fKRAFMaNa_f7lQe-Slm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_07,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=926
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060182

dw_pcie_ecam_supported() needs to read bus-range to find the maximum
bus range value. The devm_pci_alloc_host_bridge() is already reading
bus range and storing it in host bridge.If devm_pci_alloc_host_bridge()
moved to start of the controller probe, the dt reading can be avoided
and use values stored in the host bridge.

Allow DWC glue drivers to allocate the host bridge, avoiding redundant
device tree reads primarily in dw_pcie_ecam_supported().

Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 826ff9338646..a18cb1e411e4 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -484,8 +484,8 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	struct device *dev = pci->dev;
 	struct device_node *np = dev->of_node;
 	struct platform_device *pdev = to_platform_device(dev);
+	struct pci_host_bridge *bridge = pp->bridge;
 	struct resource_entry *win;
-	struct pci_host_bridge *bridge;
 	struct resource *res;
 	int ret;
 
@@ -527,7 +527,12 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	if (!bridge)
 		return -ENOMEM;
 
-	pp->bridge = bridge;
+	if (!pp->bridge) {
+		bridge = devm_pci_alloc_host_bridge(dev, 0);
+		if (!bridge)
+			return -ENOMEM;
+		pp->bridge = bridge;
+	}
 
 	/* Get the I/O range from DT */
 	win = resource_list_first_type(&bridge->windows, IORESOURCE_IO);

-- 
2.34.1


