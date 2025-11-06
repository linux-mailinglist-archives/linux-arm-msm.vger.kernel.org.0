Return-Path: <linux-arm-msm+bounces-80520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D42FBC393E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 07:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43AA13B7B0D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 06:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1262DF6F5;
	Thu,  6 Nov 2025 06:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNFlPNMo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DthdEz89"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699FD2DECAA
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 06:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762409641; cv=none; b=YK9IKWjVLnsJnnvvvka3LWuMbe9T61foMo5cDpQuSf+ERYpMJbz5ghy/Egc5O2N7boV3wYsC7PGWQ1PnV9ODSXORLAIYDzy4Rj+GtsNjtukv2t0o6Feedqp1qyDfsURuBNUhJuIjZEQwQDt/JHH/x41atsUnIUN0mzAES4jyGRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762409641; c=relaxed/simple;
	bh=b/OstpgQdPxEZ88gQf9VC6a9dVIu7gF7ReuXlh3rFIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FfKP+iJ/B6bKR3PrO98/ONJBZa0d5lq5KaV+inMZ/OzEazRNNR9Ri/wHwMKc2tvxprnflU+1pcykeUiZg4I7OCSeBElB/CIDqY7PBqVK+u0rgIhC8NGY3Djm60U2fs7DLuVuOkTeh4mA/8ncRS70Lpa0lCVf6iWglE1EKl6U9iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNFlPNMo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DthdEz89; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A60IHIZ2326866
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 06:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ekiVpYGZ4cu
	OD+sx7L1HrtYsiK1aVYOs0lLCXxJpsWQ=; b=NNFlPNMotHJzq/cpAt/J4osS94f
	N1QIDw/g9cy31ZSQJP23uKoPgZmeLwNibRzw17SLBhaL8VssJc0mATxSsuK/35Mt
	JyRUY9CJg4MffxCy+WII9xAMW+YgE746J5oIpJW3jdaveyOyJaNFeRRQNKlPQHBX
	Pokosgf3CGjP/Po1peRXNlkirm45B47x/YkR+CjDlvNwktcC6pmTF7vgJkxTsSlB
	ND5FsHeoYK+8/dnbOiZFok5dWm96lINwZbaxfMcIz3ifVknLklmcRJj+2kGUlzb1
	q7t3RFQ9mOy5jXkVbUFPjiMjI7U5MAjDLZg3FKo/v+k9VmwU6E57qKX9n/g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8h0v0u2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 06:13:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295592eb5dbso9229665ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 22:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762409636; x=1763014436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekiVpYGZ4cuOD+sx7L1HrtYsiK1aVYOs0lLCXxJpsWQ=;
        b=DthdEz89yGXHjHYxaXnv1cNBryHsPngvVZuOmY89IHkysp04yN/jAzpJnegwlC+2ok
         iXR/L326I7Jq1sRLxYy/RJCfJjLAvATtCb52GhY1VznGyJeJdeR2rpSvx77x3TK1jBxy
         k9dbHgVybdO1r2ToPriOvTzEVSbaBb8s0aaHKdotuJ7suSKqrbu1NTpEtcqMI1ZsdMnX
         ARPdgYa46je8YcsmFJEGKKOHqfNshUi2oTiSENeNK1jJeDE508Cfhy3FCDpTI6xnojTv
         gSkB5dj8uMuQEWkFRzcqU2ahXa63sc2MhHkaMZsfWv39sYsdUXvnIr50G15kMnTzR8zv
         1v2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762409636; x=1763014436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekiVpYGZ4cuOD+sx7L1HrtYsiK1aVYOs0lLCXxJpsWQ=;
        b=XGXNXE8BXxNGH5Ueg2eWqGF4DwZxvNNrrVImlwoWzHgrOzO/bFD7uKbxznzh3YyEp+
         MnLi3k4TkDw1zv1eWx7lILX2y+PQROiqGitmdabMld6WaHjcNLUqcn5QZqfhYWYjHuNY
         tUvQo52DKtK+tcmANdxw8+NZ/9MGQ1h3SKutV+U1heEQiJoSsP/Qp47q6JayZdUrkrMP
         6wzvyICmjcjtQ2gQPlw7tK7rDqmZndEN1yvy2ahbQRO1twVGT/t6dC6c6S8dCy/dBNme
         S67tlCq3MU9b2g8pIhwsZeUOFFIZYkO/5ivWZoHlD4d1tqacJcJs4iabp+udr9V/xfDJ
         DMsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuj+7aKn5bp7kRnTflLKDjnanilVgLwZp20L6xamtWUAHFZLxTK+lnitRlXVZ3QXpuLy883CKSj5Dh93B5@vger.kernel.org
X-Gm-Message-State: AOJu0YwOmnARq4j5y2VLmVTvgwunwE5n/5BuNJ9ajOAKHZY9RYhlF3Xc
	0XnA18bIvoJwY4kBRZsLGBu8RYt3qDyddATKO6jJk70iUJJ8UIeRiImnY4/rejO20VmZ1zS/ysV
	w82ftk3cMVtifVU32RyQyRa2CGBgwDAjLXbYI/MwTV4jCY1W9t5/qRGihpyzYlojZTlyu
X-Gm-Gg: ASbGncuyKk1zJAw4wElL029vEby2IuKMP3XdoNd67LVMhY6py/JVXpbs0KMPynaVWPb
	35s04Okl/eJSxpEBE+YZ6d/eyHdXOCo9uHDzCICw9rocFDaI3sAOu4J97v3Ks7/JWy9+drjadSw
	AAYK9FTB81yh4Bp5s+wdpy0ewHMm/zoAF+Ada/WRPIbIxY5CuxS9RmWU8ji62pkQoPVQlNx/Acj
	ehIfqNe1R7F41T3pJbSUIG6KOm0sG+1FXT0/3eZpatPRfkANj3F4OjUDyXhUx4vzB8l/6XwwTDs
	U964UpR3TyDUKMPqagbq2Lybnj3asqLrl0pWAMclyElrARLGY8GmKDriM6E0cvkYtjMyOrx46Y/
	ZqScWE6su/d3SEcu8
X-Received: by 2002:a17:903:1a2f:b0:296:5ea8:ed7c with SMTP id d9443c01a7336-2965ea8eeecmr15364475ad.17.1762409636386;
        Wed, 05 Nov 2025 22:13:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGd+XJvpr5YFw1E4aixknmuqd76EwZo1ROcav4B5CeitIgUuDOOUVEABQbOKyCFB2odzUE9oQ==
X-Received: by 2002:a17:903:1a2f:b0:296:5ea8:ed7c with SMTP id d9443c01a7336-2965ea8eeecmr15364115ad.17.1762409635918;
        Wed, 05 Nov 2025 22:13:55 -0800 (PST)
Received: from work.. ([120.60.59.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c73382sm15036305ad.69.2025.11.05.22.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 22:13:55 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
        bhelgaas@google.com
Cc: will@kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, linux-arm-msm@vger.kernel.org,
        zhangsenchuan@eswincomputing.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH 2/3] PCI: qcom: Check for the presence of a device instead of Link up during suspend
Date: Thu,  6 Nov 2025 11:43:25 +0530
Message-ID: <20251106061326.8241-3-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251106061326.8241-1-manivannan.sadhasivam@oss.qualcomm.com>
References: <20251106061326.8241-1-manivannan.sadhasivam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4GqDFM-4hDuBp4bMObZfKDcU2OFqfL1W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA0OCBTYWx0ZWRfXwNmYwo/zzvR/
 ag9ylZwZfj5jmD2LKih9ymQwwdrnA9v+48UbHB300XwIeAg6w4C9g5pspQKKHECkS9SKuh4MohB
 EsuGOko09HN/mCyatu7tcqIYn26u8Te44L1MjzLZlqDs4M6krhq+YHvTv5u7r2VtOPtJSVB3prN
 EzKc0Kfpt8RcdlMVQdjExOOw3zDfHZwVZkxuxcuBjmtXuL8+xhyfmryygtiV3FNU0ZqSKNFHjpv
 idjlIdb0YRe6Gjyd46wH0jIu6j4g4egbNHUDxkxGwHYGCMznvEJu9I4Ie5ARA/xxGJ2kqbWZviW
 eGd2GRE6Opy29erhOrxt9yP/hYd5j1NM0JYSV/pJ7tEnQ6qnwLRGtgVB8rt+MqLZHgVTcb08L52
 Syvqnp5sAjvyFRXCB/u1qdi0BZKoLw==
X-Proofpoint-GUID: 4GqDFM-4hDuBp4bMObZfKDcU2OFqfL1W
X-Authority-Analysis: v=2.4 cv=PoyergM3 c=1 sm=1 tr=0 ts=690c3ca5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=tomDxdmRQcfPzRosr6lsLA==:17
 a=pvCTKC4ah8od1FUW:21 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=J0DKTq5R2LgoJC8wmisA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060048

The suspend handler checks for the PCIe Link up to decide when to turn off
the controller resources. But this check is racy as the PCIe Link can go
down just after this check.

So use the newly introduced API, pci_root_ports_have_device() that checks
for the presence of a device under any of the Root Ports to replace the
Link up check.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 805edbbfe7eb..b2b89e2e4916 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2018,6 +2018,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 static int qcom_pcie_suspend_noirq(struct device *dev)
 {
 	struct qcom_pcie *pcie;
+	struct dw_pcie_rp *pp;
 	int ret = 0;
 
 	pcie = dev_get_drvdata(dev);
@@ -2053,8 +2054,9 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
 	 * powerdown state. This will affect the lifetime of the storage devices
 	 * like NVMe.
 	 */
-	if (!dw_pcie_link_up(pcie->pci)) {
-		qcom_pcie_host_deinit(&pcie->pci->pp);
+	pp = &pcie->pci->pp;
+	if (!pci_root_ports_have_device(pp->bridge->bus)) {
+		qcom_pcie_host_deinit(pp);
 		pcie->suspended = true;
 	}
 
-- 
2.48.1


