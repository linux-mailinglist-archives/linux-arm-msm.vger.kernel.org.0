Return-Path: <linux-arm-msm+bounces-65491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A5236B08EBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 16:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 162027BBD9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 14:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9822F7D0E;
	Thu, 17 Jul 2025 14:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DIY9YdKR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D39D2F6FA2
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 14:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752760911; cv=none; b=nHHCrMjqQ9gu28SUuLxy3OJlZNNbYhV0JKU3WhNcjpWlDRDxQDkt9YMO4Cv2LG0Gfe0+w/3N4Qh27WvhdloI9DHmKvulOTv250ZN7BuSIZaGlb8msiw8W7Fc026Sv2qI1t6M7dIzntkH1zhQO5Xg5Ww7Kc2u8ZPH3NMbS/5q4zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752760911; c=relaxed/simple;
	bh=Dhmeg5kW3jkXRtEQU8I7P8ZNQYm6stnF2VGjRncNTvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7SVEyzg/oZ8FDP3am3k4lsDcqb7Qebt2a7Sxy5xHzL17voQ2AxhjyY165rYIwSHRvDsN0oHw62Y+czZf6MSpeiq14rBMCp253qGEta9tsSZ2RUjVCFfp/9z0vRwr5twalhVJ0l2E7C8jpr98qaKh5GR/2KuMMOdkm0i1TvtvVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DIY9YdKR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCXWHq000572
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 14:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Djf6erG+ZP+oc2BSetwCL7jzmGa3Zd+9Ksh0jXCgHwk=; b=DIY9YdKR8kgent7u
	ZmxoiG9MlHN8ZlkmvSnPuryvCLYsAxGlV+snUfCE2j589h/23QR59h3J//O+TAZo
	RBz5Y2GI1SKnydn+gnFpRijuuPT3h+qussb+M7ncrUf3FG8qzB+D/dtJuXRwpff1
	/qlIX4+4b0ZfOCZT3WZWUyehYFugYMbvbztLeOCsT4F5N7PiYbmz4MD0xlhoOGgK
	u7ZlJOXZFqcUgJlnB78/SD8vJiHKRNmDz9HJiUzo7QA0zZyKsXXWJp26fLIy1VoY
	uvcQl/9FpHr0z8BTr9QStFcX1MELlYhW/Siyu4sf0M3QbeQV7XdWdisCXFeCyci+
	QjkHCg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drtxve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 14:01:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b3928ad6176so942124a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 07:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752760908; x=1753365708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Djf6erG+ZP+oc2BSetwCL7jzmGa3Zd+9Ksh0jXCgHwk=;
        b=Nw5RyAuPz2voPD4cCh51/zy8/F0F7W6+V0UDjArVHNKoHIMrZAh4C4qw6XJ8psZton
         Rj0yFLlEqf8DGhvA5mHB8bNcfKeXLBNxElirvkyL2tfzf6H80SAS+/B3qfj9SG9LbXKO
         YFqfg+C2OV4EtHAGr75JY/rfQBYdij1R1A+/pAL6t7sLBJhl/s0qw5JIB3LsjUfEtV0P
         IX95lhoSsnSPZTK7G8vySeDWRBaWDLBvC2JMqwTQT72o7rWOedMQHnEUe0tlU3jdMdEt
         5oANIp4+WuN+wIqc9el5v50wLnSNY0+0bbu2hEP4/VFIy7E5/VFBJX2IEbPEJ9o2+2nf
         kzkw==
X-Forwarded-Encrypted: i=1; AJvYcCUFf63774uFtahV+gguMGm3FaUBbQcwhww9wmQovzC1fbDFgdUVD2M1+O9yV4JbzhA0Jjmdzd5309G9OaaO@vger.kernel.org
X-Gm-Message-State: AOJu0YzpFCEFcKmBN3JGDfOwM027TcUhvigamv9dwdTxz8SFqCkkTKMf
	diIJpgHpeKq17xdMexSX2EeO94lGKlL6JmdNDiDCcbl/yoRKsBhrH3UlSVHrAG0nLK6o1RKWPhY
	j3UdidyZC54FQS7tlZkypz/bnhovTybL0TevFlB90FAm9xWMYD7AEjHwlGpxLN7GCsRyO
X-Gm-Gg: ASbGnctDK6RYwRCNQbE9HpZ9cDW/c9fiFzS2iMmyhU79aI+bT/5VLxH6kEDEqMfBTbO
	5zcTnRjxdQbtMuGeN/VXlfFNm2VcU6/oyTds5yg4kCsZ8Co9QMk/ZBgOSx0/Fne9wWsiHRzOg5o
	Y+rH3IL8JGt0hGXWNdA6EptLQV2Qtb07856r2ijzZJ/vG4K3Y5biS5sjHBBaj4uc2m9uoEzsz5h
	1r0P1r5HBkicnfeaEVUle9OdPOvCDPt0HHiHWg1FzlEGx2NCrCkVZzImmFVpEAfOeU8ZoXHTBPG
	GNFpSdz0xdzbcIEeADtcVbyrnnNax1dsp3OS8KUQfMyKGUx8dc1+SivwWTjh8Ph5rmsZOQ2T8sc
	=
X-Received: by 2002:a05:6a20:7290:b0:235:b6de:4470 with SMTP id adf61e73a8af0-237d5a04312mr13021388637.13.1752760908513;
        Thu, 17 Jul 2025 07:01:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqfgvPvr2MPvSRydxqMLEX8fOncC77Ga6bNoSEBZPXqpAQm3mCkG2jxNO5HoVFg/84ZPlWmg==
X-Received: by 2002:a05:6a20:7290:b0:235:b6de:4470 with SMTP id adf61e73a8af0-237d5a04312mr13021329637.13.1752760907916;
        Thu, 17 Jul 2025 07:01:47 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7507a64b57dsm10311986b3a.14.2025.07.17.07.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:01:46 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 19:31:17 +0530
Subject: [PATCH 2/3] PCI: qcom: Use bw_factor to adjust bandwidth based on
 link width
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-opp_pcie-v1-2-dde6f452571b@oss.qualcomm.com>
References: <20250717-opp_pcie-v1-0-dde6f452571b@oss.qualcomm.com>
In-Reply-To: <20250717-opp_pcie-v1-0-dde6f452571b@oss.qualcomm.com>
To: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752760888; l=1499;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Dhmeg5kW3jkXRtEQU8I7P8ZNQYm6stnF2VGjRncNTvk=;
 b=084KUxFpeuJmftJPk/FbKVmIaYC1dXtazX4CPnFK15rWpGQGjjydZZMBNZrWPmRUtVBAw6skJ
 SiJ78PAdaVsDM9kS62O4m0IJwHUNPuuA2uMAA2Ft7ClH2vU7dOebCvY
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: qU92o0XYyLKtRFDAh00wLwL47MXps62O
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=6879024d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: qU92o0XYyLKtRFDAh00wLwL47MXps62O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDEyMyBTYWx0ZWRfXykHnWZR5zi0N
 G0x4SG3g35q9KV273mgAdgzMk7PeliNoUGmivJQNyt8LPVhRSoKM14rzEgmj/xaxQKvBTg0J1TZ
 ftCDcpgFaljklUpoyL+FnhWGU0LARVj9EieOU0P1hB6KRdDp8AEgm9aGeAr3y2vjp0bMIizLCjq
 0tPTzGYYInrMoA5OryOvbzL39p3Lhn1E9VX1D8Wh1Yex8Pw5oEalzWNuxqGAPXae5lO0vKecqeu
 96QbUXSzcS5mg+emv3exUKyRNWko/ONrHp639Vwa7Ojq3kQw0vYQtn1RsczwOlklhM8N4zk7CR7
 jHYFv6u/AsXuBApfhujS1Rf8Z2wWxbRb7OTtFvpJ+j3HV+cOKHfk34yT4JI+GWq4yvvlwiTXD2E
 XY61jWNsH41HUNxLx/5H0hjrK2Cg+aIsnUA1er2RlwlzMZ3wOodocN7MO+Z9MPv/sIz4IN4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=952 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170123

Data rates 8GT/s x2 and Data rates 16GT/s x1 have same frequency so using
same OPP entry in the OPP table.  QCOM controllers may have different RPMh
votes for different rates. So we can't use shared entries in the OPP.

Use only data rate freqiency and remove width in it and use bw_factor
to multiply bandwidth based up on the link width through OPP.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index c789e3f856550bcfa1ce09962ba9c086d117de05..fde9fd3fff6bdcec0c9618d3f4b003a3d823307f 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1505,13 +1505,17 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 			return;
 
 		freq_kbps = freq_mbps * KILO;
-		opp = dev_pm_opp_find_freq_exact(pci->dev, freq_kbps * width,
+		opp = dev_pm_opp_find_freq_exact(pci->dev, freq_kbps,
 						 true);
 		if (!IS_ERR(opp)) {
+			ret = dev_pm_opp_set_bw_factor(pci->dev, width);
+			if (ret)
+				dev_err(pci->dev, "Failed to set OPP scale: %d\n", ret);
+
 			ret = dev_pm_opp_set_opp(pci->dev, opp);
 			if (ret)
 				dev_err(pci->dev, "Failed to set OPP for freq (%lu): %d\n",
-					freq_kbps * width, ret);
+					freq_kbps, ret);
 			dev_pm_opp_put(opp);
 		}
 	}

-- 
2.34.1


