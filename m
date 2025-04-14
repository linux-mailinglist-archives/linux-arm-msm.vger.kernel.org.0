Return-Path: <linux-arm-msm+bounces-54229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90733A87FCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 13:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63DD23AE1BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 11:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C13729CB3E;
	Mon, 14 Apr 2025 11:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G3s06/37"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE5D27EC9C
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 11:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744631578; cv=none; b=r4bjoFWbyl/PTfAfLFlrxbXRj2JLlLQEbPtaf980BUzSvBbN8Cs9WynpgDRfi0adID972p3gHa6RyUytx7/aTJc/ziTdvrne6PbrSuUq5HNXds6WZkJn+IEnSAobFJRwnGjVGOVOAbzV1pjXXLPOFMLNhOa44qEThn6Z5k1zf9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744631578; c=relaxed/simple;
	bh=fQ4qPB+Mli3z1n5LezSzg2TJ0AglAvt1CrhfoGQTVsY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rTz6CqShJHcAfwZ6NIpUKyrtNdQ6vMpbduAgnE+q6BkP6iAqTIY4KYkIS/kiO71qfmkGRZNqZ2VrbaCwoCRMhp8uIsnDhVxsi7PSzNNu7eQmWOdfuiD1QHxHQPAb8bCdVFEQ+TxlLWoISh6RAVti5N/UJ+heMSCok18Dag+V6Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G3s06/37; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99tji013129
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 11:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s8nngil2zyr5bKlo3biA6U
	hMXvQ4bHWgj1yHs15aB8w=; b=G3s06/37W7W3HvHlliNENMudE6nK+uOpP/x4xt
	AWL6OHYzhKBvpK1KBQkFgMz09CsWq7TI7cfXKO6OFw2t371sFbMwKG0hYKnkMF+b
	WK8ExTobmeJGbNCFpk+Fg+Qeip/u7UNH6o945D7w1LvKd9f0HVSWsqhL4V8w+hcB
	zrag0xZDIju8wJ+CA1DZOC5O3Rgt2qpEVHyOWs7aWS4KFdsbC+jf0wPKPOIX6qMD
	uz/mVSRU2lHEkORYA1ZurRu1p+25Pa7Xy8MW0tWEXxpFbFdF0CtXZjQcsR5Q1DCV
	0FFLSIV2jCq7JJ1LKrw+2SYIOY+cKW0QxAaNWf3C9LNR+eow==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj94dga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 11:52:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-224347aef79so57287395ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 04:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744631574; x=1745236374;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8nngil2zyr5bKlo3biA6UhMXvQ4bHWgj1yHs15aB8w=;
        b=fXX4oo9xYkiMgNSXgC0yamntC/9FCZh+2nL2HokGqvezCxVPzfrlBGWN1rsQb0+gto
         Os/m1FEBoDPhgHjNZJPofhymv9COiKSoRUDDRPYZdhN0K9QTMESxkItJU8znChvdhgmc
         5kJ3jrz7BJ/NPc580qEfTt5SK7WGUZEH63HsRkm+hspNXwdNINKbWH92eSAkuZSiloV7
         nvxN+/btsQV75lpM7shtIn8Fk73GG52g4wYz4/HLrJCELLrYa0/qZSr/kLN0XysEcnFR
         l2fvD7XamM92A53Vxr1P/WLiVRwjiFpqpiCx2AdJLWg6KZqEzCEZSZhd+qneRiYp4pE3
         k1oA==
X-Gm-Message-State: AOJu0YxG6DjMfVPO30BULXfTqOOqoGYbFK2e2KFEfrWZv4oYhNAQE9P8
	jJy9x4Hc58sgljBT6F7PDZX+0t47SUuZT7fTgLizy5Cux+5k15hZjYIqWNuYqepEcQDT8h1F3hM
	tYCaW1BjIfmgxnjFvaf2HrIePnhTzSKcrA5C1+4UkmVtg/A+dgWVTKDxlEGzVQOZU
X-Gm-Gg: ASbGncuUS1DGTLb3OGqyHLSXs1euukM1f8zEGTqCyIgO093gpbhRDn79WsxkE6HuD0C
	ghMgj7DHwCt5PP3Yxdk8QnPliEtmvxKddGHqLhREHTNMSSmoDvOoVfNVrzElDYfIqCjM1I4PUXL
	hSlfn8qcn2Bi81TUdfLUz36XZf/ssiXtMs5Mfa4iK2jq1RXYTGd2jf1Kfc/CT7YqgI566jmqwd5
	mBVrybg+KwbNe9N453cKUJUjpwo15Ryq8VS4uEwJQNsJBYR5dtSFlqOCKJo00A+Hip1b2IVhjO6
	dTqjn492gJ8jfVJEGHtZKOBLdEZo+SVpDpKG9j5kEqd39GHnAXwSqgIpVPQxAsWJVaZQJlyhYl6
	EoAqVv6u0Y179eIpuPrQCUQmS0XDoYpUhcVDYF8d9m720NyU=
X-Received: by 2002:a17:902:d58b:b0:223:501c:7581 with SMTP id d9443c01a7336-22bea4ab90amr169760725ad.16.1744631574005;
        Mon, 14 Apr 2025 04:52:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgqzwIYoVFf1FpG2p39nVO093y9ug3V5NlwPoSdWoLWQWnXODX6iVg/8xyBTblPnMlaKR3ng==
X-Received: by 2002:a17:902:d58b:b0:223:501c:7581 with SMTP id d9443c01a7336-22bea4ab90amr169760495ad.16.1744631573646;
        Mon, 14 Apr 2025 04:52:53 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b73asm96425735ad.86.2025.04.14.04.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 04:52:53 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Reuse the IPQ6018 QUSB2 PHY settings for IPQ5424
Date: Mon, 14 Apr 2025 17:22:48 +0530
Message-Id: <20250414-revert_hs_phy_settings-v2-0-25086e20a3a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABD3/GcC/3WMwQqDMBAFf0X23EgSo2JP/kcpIY2rCVRjs6m0i
 P/e0FMvvTwYeDM7EEaPBOdih4ibJx+WDPJUgHVmmZD5ITNILmuuhGL5hDFpR3p1b02Ykl8mYqp
 tVDVI29Y3A1leI47+9Q1frpnHGGaWXETzk+Ptv9wmmGBoO4WVaNCIrg9E5eNp7jbMc5kHjuMDQ
 zg5cr0AAAA=
X-Change-ID: 20250414-revert_hs_phy_settings-47643d2c75ba
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744631571; l=1101;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=fQ4qPB+Mli3z1n5LezSzg2TJ0AglAvt1CrhfoGQTVsY=;
 b=kgepGMZcGaqZhH5hzO36PqOvZutcLa7n3nhrg1HBepTjF2w51aDhkXXu/oOVtMQVc3NAFWJpK
 f54hdIhYHMwDlFVC4TI3Qp+B9Jlxl0MwPWmXH+qVIwrKO5KE8IPasHL
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: nMVQ92WFS89E97-jvTRwaT-a_NWoPHyN
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fcf717 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=__A2vHsfkmyGJhSVeV8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: nMVQ92WFS89E97-jvTRwaT-a_NWoPHyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=657
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140087

With the current settings, complaince tests are failing, especially eye
diagram (Host High-speed Signal Quality) tests. As recommended by the
design team, reuse the IPQ6018 settings.

Merge Strategy:
--------------
Both the patch in the series should be merged together to avoid breaking
the USB feature.

--
Changes in V2
	- Splitted the patch into 2 patches, first revert the commit and
	  then reuse the IPQ6018 data (Vinod K)
	- Dropped the R-b tag from Dmitry
	- Link to v1 -
	  https://lore.kernel.org/linux-arm-msm/20250407-revert_hs_phy_settings-v1-1-ec94e316ea19@oss.qualcomm.com/

---
Kathiravan Thirumoorthy (2):
      Revert "phy: qcom-qusb2: add QUSB2 support for IPQ5424"
      phy: qcom-qusb2: reuse the IPQ6018 settings for IPQ5424

 drivers/phy/qualcomm/phy-qcom-qusb2.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)
---
base-commit: b425262c07a6a643ebeed91046e161e20b944164
change-id: 20250414-revert_hs_phy_settings-47643d2c75ba

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


