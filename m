Return-Path: <linux-arm-msm+bounces-43095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B358E9FAAC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 07:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20B9218867CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 06:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B3E18F2D4;
	Mon, 23 Dec 2024 06:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iR+7AoTI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E7B1898FC
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 06:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734936697; cv=none; b=kVnqSbdNAoLjLrHbSDLac8bEv8ejp2B/kYZk82CvyZaum0pUA9ril1oZgHHqYSs7GxwV1baZnAW2fCbyiB2gJmw3BBwH0Z1rjIYW4oV6dL/1j8OkbQzPDFT5BJO2F+Hwp2HZYCcpFrIvJTI3OmfAfoQ4x/wQnVZZSr4nV1OIGxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734936697; c=relaxed/simple;
	bh=1cCWyVa5AK2/6g1dA5pRl5YsQKIo2vs/YZuAmrzjF+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TEf3J/JGwOqiQLR0pQZ7aSRDuQoyhjRYlTC2+kndw6Xjd2BLa99ynNNRnWB9krVT5YLB8R3IepF9cmaOOjUQuhAwzXc4lq+E7op4Xj35sovUHQkgx2HXdNA8Ep7Da7BzrUnKyX9CpFeb/tXL53O2OltxX73wegMqaaLBy1LgV50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iR+7AoTI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN3Ce3E007897
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 06:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r3fyHfyMlBiD4pkCqczBKmlgoz+Ny2UI/7GNprFqSSU=; b=iR+7AoTI5k1sOEGT
	xbNmaqLnVFj5LCAgmfT+Cf0JZ2g3NSmkr39YKReYMvI+YKdCO8b0ncGjxazOavms
	iDZ86bY7NbfXgiWnV554EwqzVhEvZKBk9Kk7OiyXu+WXALUjmwY7w2ijPqHKMay8
	gNkdYB42gVG0YgRpeoS7mcpQ6JYaFefDiIWhZT8hIvPvchksPMvgy9ZrKp9rS8jC
	uaCBZlwM0LLyKn9aYw88bsNdcMnaUs3Xc9C0PR36D+XcmeW98ugBCDo3dTaLBL2q
	Gy46DpusJXiayfXjfvXZEem9IeaLcGeJn9GquP0+O4TUeF798Jt7NNF//atsyQJ3
	gXxCrw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43pyrprr2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 06:51:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21648ddd461so42733305ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 22:51:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734936693; x=1735541493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3fyHfyMlBiD4pkCqczBKmlgoz+Ny2UI/7GNprFqSSU=;
        b=raNk9CEgNSvER62jkBhCXJf9chy3cAvks3xI7iZTkY2xSFr95Jn6jpCG2QQypJY5OF
         ISmfUKkclMbyqPiUwzvNocQK2QvRLZdejefAMyxzS67ysE8a5biOPd615EIKNe3ipWHL
         AfHcoUhVG5OkQcltLrDqHtueIRHHMzQzGpCQWteO/2dqLfbnhqIobYgRFy7/lr5SHKxv
         bqCwIaJjpcwI2NzUJ178Rhs1wMqI9+snrNUtC7C37xGxVjXn46XYzcaJwMS++noI/g6F
         1z3G0ZwvnI2DdyKvpEgEQk7QerspJVleeUeaeW6s688lE+T9t2C4cVsVa5ovTMgeP58L
         75OQ==
X-Gm-Message-State: AOJu0YyL5Y7O279IsbXSbsP5z1KT/OkX5L4ikCu+qn89RPNTS3gEGvFp
	vGIEiQo2qjKzLNjL5QVwi3ULJo/fbfTeGq8L2gQxkB8794ze0t18AH8mvzoOl7OVtO4vDzJW4zz
	WD8Q2PuSvVgkLQfFzG1c9TKxom3gm4yxYNOOdWhtpAQdtBWwQ6bw1VinEBtY1HYTJ
X-Gm-Gg: ASbGncsRx8t8adKzkg8Ub5N6cNS2Gmlpx9/onKuF7ICtIC1v8IAA3SXQbSCCsPuT+7x
	FQv9NnPCF1//BqcXiCDcmSTf/eT8yH6FIK2x3O1DTmw77G5DdEq5WotnmNvqsOK1f6V4CzYiq0/
	8XeDEeASiLVfsDCsEi4Edrs31O0s8xSC319pEOuTuzWH+6YUm4utWBt/2pe7wN0BlPu9WzNNbaI
	0x1dCbsdu6sOwN71Ee0+MJc0M8C05E0JBkPjFsq2FUFGh6pR8t/lMHw5P1qK9mA9GvqR3MxU6pi
	pYc7JeE/CTioEHaS
X-Received: by 2002:a17:903:22c6:b0:216:2474:3c9f with SMTP id d9443c01a7336-219e6f38177mr158490635ad.52.1734936693206;
        Sun, 22 Dec 2024 22:51:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlj6SyzFJBx5rNy9TZZL+0N5FIrCQWKe50bVBLK5VVHJb/y3WmnXlcafYRW6ANLlzpYPjV5w==
X-Received: by 2002:a17:903:22c6:b0:216:2474:3c9f with SMTP id d9443c01a7336-219e6f38177mr158490325ad.52.1734936692892;
        Sun, 22 Dec 2024 22:51:32 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4413sm66570155ad.172.2024.12.22.22.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 22:51:32 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 12:21:14 +0530
Subject: [PATCH v3 1/4] arm64: dts: qcom: x1e80100: Add PCIe lane
 equalization preset properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-preset_v2-v3-1-a339f475caf5@oss.qualcomm.com>
References: <20241223-preset_v2-v3-0-a339f475caf5@oss.qualcomm.com>
In-Reply-To: <20241223-preset_v2-v3-0-a339f475caf5@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, quic_mrana@quicinc.com,
        quic_vbadigan@quicinc.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734936683; l=1380;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=1cCWyVa5AK2/6g1dA5pRl5YsQKIo2vs/YZuAmrzjF+g=;
 b=s3e3TGtJRqA29PmDdzWAUKd4dKAi16hOJG07WXrsTiXkTuNMf3o+/YJJJUd7aq/bDpszcnRCz
 sczssJdJRTeBx5zj5yQMBEY6jqJG9fv5U7MMmy2Lgz0fyTUssPFfBbG
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: JSwdGb-vsuYd4HEtiBVaCeztMxThJ6P8
X-Proofpoint-GUID: JSwdGb-vsuYd4HEtiBVaCeztMxThJ6P8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=927 priorityscore=1501 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230059

Add PCIe lane equalization preset properties for 8 GT/s and 16 GT/s data
rates used in lane equalization procedure.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
This patch depends on the this dt binding pull request which got recently
merged: https://github.com/devicetree-org/dt-schema/pull/146
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index a36076e3c56b..6a2074297030 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2993,6 +2993,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie6a_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
+
+			eq-presets-16gts = /bits/ 8 <0x55 0x55>;
+
 			status = "disabled";
 		};
 
@@ -3115,6 +3119,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie5_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
+
 			status = "disabled";
 		};
 
@@ -3235,6 +3241,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie4_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
+
 			status = "disabled";
 
 			pcie4_port0: pcie@0 {

-- 
2.34.1


