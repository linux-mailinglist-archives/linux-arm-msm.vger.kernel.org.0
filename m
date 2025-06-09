Return-Path: <linux-arm-msm+bounces-60580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BF8AD1BF5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 12:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 396833A61DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 10:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D153225C71A;
	Mon,  9 Jun 2025 10:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQMf5LCt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521E225C6F0
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 10:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749466353; cv=none; b=eKHJrCppeO1HQzy7qJPcX+aLDvHx8W5rt5cFfOG9Yy0qPvEl/YiMAlLYmz9fc79OKc/AdTDXS2OVmLuwt9CC/jfEx6CzS+EcZ8Qv48NdT5Q5uJUuvWQ0CtmZ+ktlfIQ4nfziVJcJaCxx4V+NnERPO+k0XsRiQVDi00PfDzJ/T6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749466353; c=relaxed/simple;
	bh=3MJFNTnmCvNNxzu47ggz59THY99XF+Lv2H8IXU9t+XE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sivmqye5Li8VUbbRZl9xsHYkCTq39fjzhoeazodseKXBd03xyvwMV0NYb0St+W6BBlqBfRTQQcKlkX0HLPn31uieXnOzcFgclahSg/NFTXhfrihj7pFTzc4jbgMS2qsRhv35UwhXzOr0pRUYOLlFZAfVD8g1/kjDEOC487RfLeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQMf5LCt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599MYWx006545
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 10:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pUF8yzByRJf1RQQuiOGLMtV8Nk65na+X12bzWOfrOVE=; b=kQMf5LCtCgY4wnD1
	QxDHGnv2KsCBR2Ov2/TV3t1GnebESF9jap9tux3aahchAUgyKtR4fGVlOPPLF8iW
	8DNchwlqVyXuiJ/1HjQkGm15Al1Upuw51nF3c4RNivHiYOcx5YOhTEi5ELjj6ioc
	US7vAFeUaA5ccDjGdtQdjHxpPZeFZWx8jcLzktqKVF5/69jP61olPPfSNTkSQfZB
	BroEWChvtE+e1cUIz4cARTSogfkioGkXnRNjiD9qobioOkZWs1pTAKu8lJEm6B39
	g6xVGRbtMEZFIXsON69f2XPVTrfARbnDy7s02wma26pnDDkmp3eMkCfwWqOBO/+T
	evR8JA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9nwru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 10:52:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2356ce55d33so48255955ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 03:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466350; x=1750071150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUF8yzByRJf1RQQuiOGLMtV8Nk65na+X12bzWOfrOVE=;
        b=b+ITRo7ymCRpaKwrzYML60gkFUy14pBNPMA5pteNYsmbTJ9X6COC2cQVOhAsGQSoyA
         EzTdgQbWQV+ArCVaCRelIfQFRvYcZU9u0lxgcfVcmzCDf0/BnJqV+zLJiGURYfmzEfJw
         pW95NioTX6orBN9QwPakvmvn6f6yCLjft6QrFEUl3b9aFoDflNhoWc7pE0uqWxFwItxE
         /4r6vcN2VlM5zXfGMgrCXKpw3H/TPVy+tTX1H6PKsWEkGZAOHslJqvNV0ZWtzTu6NBuG
         /3q54x0cquITiwlLcX7jmYp+hEfMX/J6NYLQcfOYpREQGzL+0swjz1t4IO3mDVtlsKCF
         CRzg==
X-Forwarded-Encrypted: i=1; AJvYcCUnVUlNF3DKVENkEvxp3vpFwFrEO9hm2bATe3DcfVJy1JiMVZV+YaTxK1ZpUft8EfiCJZ1PXMIjyEXQDVcQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi+1LoYnz3nw6aTnp5yqB2D1iFi78nX3+UXOlV7fKzOYlP4Qif
	ehOk7LIfd5eDYQbS+xw+iGcqCM/2uA7SK3LwOJeMKgselEp1WT9og/eypdivUYDFKAmM3nv9z6Z
	HaquU70dk6XcBZsT7Td9gYAGO6b+n7WdPf8BMvGBk97ub7AAh3jfdSif5Mogq0dm6mpEg
X-Gm-Gg: ASbGncsqx07m5OjLsBAsnFZG06tSeFnbgiwvgbZCsFs1OvAy6LhBXRxT3Q+GKOP2y3H
	miQNc2DXM++OoG+Y6c+EwHHnyQfLXXnlWLxSphVYRi6m8ZqNs703LBi7eZHZY9/km3DOALjspSb
	GtRXriwZnWgoS0ZBte4STIPw0udh2QEFOwAhRfK5phLMSaDMYLuYySmO614xEVvreWSxRiv5Ak0
	gPsF0lvBVBL5nZEK7wof/4HwzlbU6C3mc+8Ou5qovAu1kgSltGCDZweIFBUaWaEByfQ0HcJgf5g
	eJiJ33fK5LzRLvdA/LnPU6MHvsHW7YF6mRIsGWBVIrpshhFlz+OZrIpvjw==
X-Received: by 2002:a17:902:d4cb:b0:231:c792:205 with SMTP id d9443c01a7336-23601cef4c6mr188219075ad.4.1749466350028;
        Mon, 09 Jun 2025 03:52:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbCDUCeQUKgzoGTBiAoX5HLibQ9U2gBaucDdLb/rI9EiBZTximeF45g4cVpAaAruBmWLb8Fg==
X-Received: by 2002:a17:902:d4cb:b0:231:c792:205 with SMTP id d9443c01a7336-23601cef4c6mr188218635ad.4.1749466349659;
        Mon, 09 Jun 2025 03:52:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f44sm51836465ad.63.2025.06.09.03.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:52:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 09 Jun 2025 16:21:30 +0530
Subject: [PATCH v4 09/11] PCI: Export pci_set_target_speed()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250609-mhi_bw_up-v4-9-3faa8fe92b05@qti.qualcomm.com>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
In-Reply-To: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749466291; l=790;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=3MJFNTnmCvNNxzu47ggz59THY99XF+Lv2H8IXU9t+XE=;
 b=/R2j/FvpgVZbKkZ9tHBBRAwTesasN8RhM+TPye32z0glIhUL4IAq4QqKy/A+LYtuKn0+9WKlU
 lekp4bMiZL0AmW9qZ4+HATjTgAYe2/X/37ni6hGW33aJa4Z1+D8rYN3
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: FPZUdn8jth0rJeEExwaWv_DSYDXsv5aL
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6846bcef cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=5E3R6_0bZ0f_H1kkCjQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: FPZUdn8jth0rJeEExwaWv_DSYDXsv5aL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4MiBTYWx0ZWRfX/x4nCntzWFa4
 3WKVRGoHwqhZaaKmTUrHUmGv7m28pKCJsf4O/iCRYg1cyBhUvKQQn415QV0TsjBGXaLE6hgCgZ+
 ZQDRndRYYXWftDZjGz8tcmUYOKNAoUR85f6F2uLVgo/pQqsT2eGutxCrGnbuZp4WXrjrrOEIxun
 CBfxGgGz0cntQAR6KatP7nixvudswtKjntfRX9bzl8nEWjHspzN1zGwjNSUlNAV1vyXN7fT7vRz
 KZ1kye50KsZTwAbZaVuxWLK5sB9j8uHf0rzXWOijc+WwXNzps5G+V9kpEd8FEHao11BU2sTIPm5
 n9nb4Vewb0+PFO51w5zfgtxoSpRGo6+IUrK50/JygiNpKNoyFjnr/0KfOpk1DKwn+AHnV4ftzrH
 oM7j6V5eBVTE+jrDUCDXHOGoxjzyOeUewynDaTcqncXhfN/kI67P6Cr5m64UjlZYamFUOL5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=955 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090082

Export pci_set_target_speed() so that other kernel drivers can use it
to change the PCIe data rate.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/bwctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index dafb8d4f1cfba987e1ff08edfc7caba527f0c76b..b388e02c37ab2815b562108b24b9e98811053d62 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -193,6 +193,7 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pcie_set_target_speed);
 
 static void pcie_bwnotif_enable(struct pcie_device *srv)
 {

-- 
2.34.1


