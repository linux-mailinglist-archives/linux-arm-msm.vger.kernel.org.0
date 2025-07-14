Return-Path: <linux-arm-msm+bounces-64861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED701B04701
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 20:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4A371A679DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 18:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF552641E8;
	Mon, 14 Jul 2025 18:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljfRAkrH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B790021CC51
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 18:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752516084; cv=none; b=uI1IjZwv7sb9RLp8ezFJLZSKQH73UeMeGJPdbljElMjCbtHYnoqMo2n71r5pshQPljQHb1rCvhK3aAr8p1OMImbwHM0eRDhqwVzK9AkzInkTJeiguPgTiPRbZnheRBGsyOZr+UCMLdmRIR+WDbG2bxLhKcaZUEqaAmdonIF4TZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752516084; c=relaxed/simple;
	bh=rK1mHRwfLofxCrHg/hy4DKXz7ak5yRST/iNSGy5d/GE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pHz2QAmfk2EDgvkSMvIl5LnrhHNzYKzzl4vw/jwr6Q163XACn0Jz9I+gR3462QcOa6spYIEHKAS9KGUdMb3xjRuH9OzIJ7S8njgGW/oypzeg/o0GLsDr7Gq/Z02UqyA/bQdThKHsqRljZxWTcbhAU+GJOAeVTz0IT1Cwyym4lto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljfRAkrH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EHeH7q000609
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 18:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ohJyu1geVqwV23Bgi/9wQX
	zmFnqB141Eg+tm/AJaoKM=; b=ljfRAkrHLsROSFC/Yo8QSj9RRtS86W0e1oaMaj
	tMgPIgF+B+N1urCMmNg7Wr64UbCoSJpRvMClL6T01nFA3ZDv8qvUiXbTIZ76489J
	YkEB28r1ppgyH4ohQ2o0ak1utKDGZgj/qf3qO0Fy58FRmXLVpTO7vIDfUOlCOBaT
	U/Zsi4JZ1j/CMWfGzGthfGiU6wTnpZEJJeNXw9NTk+ICMGrYlMWQKGFdRYOj56Kn
	JFi43RBtAFG4NGIA95hoNOLW0uLgOk0ehCwXJUo9/PbtODaZt5Kh1G6Eo/zBJAKA
	iJSmGj+xysYZbx6AtO814Uz7KP1/a37HXgwU44Q3VPAGQdEw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugvmwu2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 18:01:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab758aaaf3so27359851cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 11:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752516080; x=1753120880;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohJyu1geVqwV23Bgi/9wQXzmFnqB141Eg+tm/AJaoKM=;
        b=T0dHYz9CdUMzswTEv0kXgqwzF0FE6IHifCMNiI9AJgzGtN3nB1J0kWeQESJyH+whZO
         JKGCFV4LrOZrg7JOEE1/V7ptfnCYQOB7RMTfqMUvZURolusMnukG9lvhPbMBg13a6aoS
         voAzWuNFafKPbr/I/9He26zPqS5UbzAc9+uxPB6GAdVDlX0S70AYUos+zyKytKTf4HlF
         tvnNSeR7j4ln8hjIl/TBoAC7FS19imxLV8d+vfuejmrFsRixJIA9Kns6tH8fFjJzWGDQ
         hPoGrbjQPd2AN027zqEPln0DZTPGGxcqvwsUdcrS/gvdFnWDHwXVPlD9bmOqVdB2Mg+o
         EdMQ==
X-Gm-Message-State: AOJu0Yz5XUELLN/MgactuFxdo9+owz6KQFlT35FwcwgwBlew77Ju+qHm
	uEcv4cHaLX7k/hH6GCsbPySVhVDqdBcfoDB05Ay746BE14tmYPvY9DCMOxsBmD5KGcmolaJpvU6
	XhSAqdMi/ThzfEn94KGYLMFp3iMErTG8B2F0av5AZGfNoSwpCuRmaVT4EmTxF5SxZ5YAB
X-Gm-Gg: ASbGncsdSzIdoJvcgyQxDGG7Iish/3ZhjKVUVl2yQz+XMyzEhAsnjSMgjneuSvNLFXS
	+4kJF0ZolQkbWLIQtbm7gFQDxQIxgR/UZ8YK3We9V8SIoDIYBvz/Mh3OSbVS9u8QzY8clCFnzdv
	+A7vSnmsjJPp5+m7g/alN40roAj0cqTsf/TjWNk+8ftx262/16yvUk2KjnvsSfxIPIMjEQbbKBz
	RlZGeqbl/WO1TRWThvsu4faF0HrdRzCmQ8jyDdy5k15T5VZrqTGSz/3KZYABNoBuqzN5/TZLOFE
	SmOFN5wJ2WuTSUAAKCruhZGUm/MbWmBY/UuPqhB8lTTu+NK1SALGeBQdiCU6aMtnMxA=
X-Received: by 2002:a05:622a:2308:b0:4a9:c9c6:ae8d with SMTP id d75a77b69052e-4a9fb9612d9mr215365771cf.35.1752516080608;
        Mon, 14 Jul 2025 11:01:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/6Pul50lfnYF7kucBGxB7MrwD9ARcmggCN/hiK8dl/0nzcXDqTO0GXrPd5FCOVdGXTFlOow==
X-Received: by 2002:a05:622a:2308:b0:4a9:c9c6:ae8d with SMTP id d75a77b69052e-4a9fb9612d9mr215364991cf.35.1752516080005;
        Mon, 14 Jul 2025 11:01:20 -0700 (PDT)
Received: from [192.168.1.17] ([120.60.67.95])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ab659238a1sm16999381cf.17.2025.07.14.11.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 11:01:19 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH 0/2] PCI: qcom: Switch to bus notifier for enabling ASPM of
 PCI devices
Date: Mon, 14 Jul 2025 23:31:03 +0530
Message-Id: <20250714-aspm_fix-v1-0-7d04b8c140c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOBFdWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc0MT3cTigtz4tMwK3dTUFGNLIzNjw2SLNCWg8oKiVKAw2Kjo2NpaAAZ
 JW2ZaAAAA
X-Change-ID: 20250714-aspm_fix-eed392631c8f
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1192;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=rK1mHRwfLofxCrHg/hy4DKXz7ak5yRST/iNSGy5d/GE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBodUXqUyWYINFENbIxjWYt3rEs1gx0E/tbUSEcz
 SpppJ9KEpGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaHVF6gAKCRBVnxHm/pHO
 9Up/B/9t5OmC953NndUYPqjfz4q/od5S20svRDDr+kRniUGMD7d6tqsfC62t8OXVGb5yRdFwyTc
 it9owf5qfbPyvKAk2EldZ1pPQaypwqUGbN2Cz3wQIEOBOT2obnIeJNv3nOVtUzMxVZXsKEhjbRk
 gsV2l/OF5CJQtgxEdfx4Dp/0hM7BwA/DQV6D2NsVjxIEmUAggQOl5zK/ICCIYrQUzdAiDFeA17A
 40cPcZSwZhLbLMrmSckpCLRt/tq6mqKut2pjIcq7vs3eG6xMOnS7L56Tfp6yw8gUpscOHIIW4Xe
 oIuTKql+lue3GRVMHIdgvfJEycpEJoWWi+amwwj52tH/5DGK
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-GUID: 9yI_7MrITosJoHPnC6e9-TYcgzuSVp44
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDExNCBTYWx0ZWRfX/c9PrpvXcnS3
 XPQKpp0dBUjt/P0N6M6rN4RBgIfMf8ZP7Q47vpOUhzexLFX2pZKruhrFxc0AY/5uZXqpWS/wCTd
 rDk6/ThVCAj/6TPD0BU791ZpddD2tCBbwIMbyOQoZSzL3MqnkBk0C9iSfoudh7nPWfWEBDCANSO
 rngVc+L/Hb13P1DYj5+j3dS7Y3Utuu3YQWY9ctwayTcGVaNm3J6xg4xbTpEyPj0yp1ph5aU4FRk
 I9EyUbyZ2gP9ZXBQP/nZgcNnCSqmu2u+y4LY/Tnc088OR/Fvo1cjZ+m7wNmOUOQ2uN5Er9d1wpM
 S5QnZ/2kcxdC4rfcZTYypfyASS17a64s2VriPV9tqmha8GqLEuGLfdeBTHO4niN4jWgve/TEoZZ
 NVUMyyX/OXLW46I9TaSVJOt0S8AsIG9BVy9dkUJRgr9CFpDo///yGyu9H3FjNC+yh9NST6Yz
X-Proofpoint-ORIG-GUID: 9yI_7MrITosJoHPnC6e9-TYcgzuSVp44
X-Authority-Analysis: v=2.4 cv=C4fpyRP+ c=1 sm=1 tr=0 ts=687545f1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=fXYZ39HhpiwvwaHYBd8ing==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=djgaaEycexjLLnWtpDoA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 clxscore=1011 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=911 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140114

Hi,

This series switches the Qcom PCIe controller driver to bus notifier for
enabling ASPM (and updating OPP) for PCI devices. This series is intented
to fix the ASPM regression reported (offlist) on the Qcom compute platforms
running Linux. It turned out that the ASPM enablement logic in the Qcom
controller driver had a flaw that got triggered by the recent changes to the
pwrctrl framework (more details in patch 1/1).

Testing
-------

I've tested this series on Thinkpad T14s laptop and able to observe ASPM state
changes (through controller debugfs entry and lspci) for the WLAN device.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Manivannan Sadhasivam (2):
      PCI: qcom: Switch to bus notifier for enabling ASPM of PCI devices
      PCI: qcom: Move qcom_pcie_icc_opp_update() to notifier callback

 drivers/pci/controller/dwc/pcie-qcom.c | 73 ++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 35 deletions(-)
---
base-commit: 00f0defc332be94b7f1fdc56ce7dcb6528cdf002
change-id: 20250714-aspm_fix-eed392631c8f

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


