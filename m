Return-Path: <linux-arm-msm+bounces-66232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64541B0EFF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36BB67A931D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2788628137C;
	Wed, 23 Jul 2025 10:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KeeFg4o0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F64285C89
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753267026; cv=none; b=hfSuGkk2FUcTLgWnCzinMTp7YLc/usXCo/h4RtrtTz9ki55B0nvEupAYFjbf2oG/9L4DPwwiB39X8E+JTzZLkxWQP2cT5T0Ha+EMcrB6ZBzkjk29f05oCCraumOaa1cGkLopcF/rDlLBm4QTE1YFdBJC9OpKWVQEhIuI//VHmgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753267026; c=relaxed/simple;
	bh=SBkpMsGrGahLmvK5mXf7uU4yJc9wzbgowThkMVVAhc0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FIyuTH8XiOt5nrQRndGKznGWBtWq/wVq/TeI/kcjDovVOGYco+VSgS8XL7mhVKoETiA8yy71NKmuwOE9ugyvkTScea0TNN3pyFms7qYLRmN5a/E0NTatE1mYg/4pqTH83gGwYepJEpUv/WuIk0Oy/iHoQG9yvx9hrvNfOdrAVBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KeeFg4o0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9ZScv027816
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BZahhtsdxwSGeWMV/+xeQGiaLIv/GIPmtHC
	4taip/PU=; b=KeeFg4o0Nxj8dwDTIKJBNa68K8fXqATd6h4Cpl9NTbJ7ta2g3Hu
	W01t4A0OF545qB2UQFJOLW9/y0cW1SrLGdvzzKCrSbLYa2CSHF4h7V9zGWr8M3Vl
	DefTN7dS8n4he9FYoKYEq+QaskfegakFPyaIHW3gg4CKsSJ5VRwXBkIKz/guov89
	8QCBdR3PlAq9Rg1HQ2aUPld94YJaXW32MQKwUCQcis83Q80M3xWDhTlKyS3MV+/Z
	jlQgUyiD+XhDCdZUUdmqgelnIw61QZBVJfa+ufiv3HudlqIWAh6mqTYOd4vS+p90
	aG5tv+qTpvWh/TuwTzTaiNfdkSwro2jzl1g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s4u2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:37:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b3f2e05fb78so4147980a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753267022; x=1753871822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZahhtsdxwSGeWMV/+xeQGiaLIv/GIPmtHC4taip/PU=;
        b=v1xI7o7OgCY0A5cIRBfNeyChm7uMX1NQKefHnIi9IFk2XBfFZ0c0XAc5d/zTieuuo5
         mg0W+k41DCS51EpkuVO9d057gA+TnsTTZmHX2qQ3I7miMD1o54dhdPXou54chc3qXjya
         b+5cv5B86vQMrp+zqsHJILES3DnynHtfaLLUaEhJ8fUpvKb703gt+ecy+e8WgSn2dgUe
         lw0Y88IHlpMXzasH7aqx4eJ2zmjBfeV2AeBdFDt/v/56YScYymMyLsZVkiYhotGopgda
         q7iZWLuNJZz6pe+0I4WTGhx5ZAP8Qgj48FEKtO0/I861EgjG2gC1OmV14H8l6bCH5gaO
         AsvQ==
X-Gm-Message-State: AOJu0Yw7yssdsM7F2EZS6eFrmmvsCVusBXMqfG7fBCtIkIYtpx8gYx2E
	el5o9cHiVlfq3GOmHEpdqev801h7kFu8SYSXzw9MYbcl19FyZRRNbrNKnbIfYJ/SyPc4Rr/5CVG
	hYIvZU8mWIJFLDkkvNjrRmeRl/6RZN+1ZR5qXS4qxElHZ+O2gt5braTuBLhednHrc8Otu
X-Gm-Gg: ASbGncs4n7Cl8uVAZjYvNyXexw1peQ+bcaEJGw66KlqGmE9ElEdhJJOZh8/F7zQWrAJ
	XBvBjH3d+CrWMIRVlB+8xCnwgPCa9apemLYW0Q2c0kxQ4CIXZXrZm1AN4tsIGJY7nGthGL0FbOb
	bvUIGwZPkOk3CyYWhyFDOCQ/Inz6GhuPjBIxe9KB9HChgX/Q8BwWw3UFIP7nZGzLYt3AkD21HMH
	tyBsWBr8c4XCCcb+gLHi53+LwpOsuj0jRGUluOVd8Gy1NRM2BJfuuuHdx+yK0q3TCCDQFobRn6c
	dus6Pq7HPDzO2fwroprRnjpapV5IKbkYXMfs61XQexZ7GVwfo9dDqAAnVWEpKDKKKk7Cn9jo+bL
	vMWiuJrHjtvQmPyNDBZi/F6Kq81AK+gkEHxU91AKdZU8iHD8erZN/lP3FXrK+
X-Received: by 2002:a05:6a21:6da2:b0:220:ace9:193c with SMTP id adf61e73a8af0-23d491698eamr3826504637.38.1753267022178;
        Wed, 23 Jul 2025 03:37:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh3iuia7Fnxs1Vjrj7taJa5vrWEz92sHlkDtEQDGIqy8QOF964j+qi8wTzRtiCyAMxDjkHNA==
X-Received: by 2002:a05:6a21:6da2:b0:220:ace9:193c with SMTP id adf61e73a8af0-23d491698eamr3826473637.38.1753267021743;
        Wed, 23 Jul 2025 03:37:01 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb678f21sm9458954b3a.104.2025.07.23.03.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 03:37:01 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] pinctrl: qcom: Introduce Pinctrl for Glymur
Date: Wed, 23 Jul 2025 16:06:42 +0530
Message-Id: <20250723103644.4058213-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4OSBTYWx0ZWRfXzPVBL9mgORes
 gdcYGRowXrUqEGWmJU1stw0CBnRqsUjJw/ufLluHihYKS0T33xzCxNBZUkUCApKhnkwGXgRO0V+
 T8Mry1nFprSe7gdUwvriwed3bWa9hScKV4Hc51yZoYexnzGI5DONtWmnc+4fEOy9PLSpHeSX0cL
 LkeinxXmOstLgr0WeleltLsSqEfGrKq1q1xgS1Rn+tcdbEIr0qZXMTvv4feUE4hozaPBklaj+IA
 9kderkaQ2Xydpeb7UJXd4Q2+XeaAQN1pIE1DKAhvErcJHdTWrdYyIEj7xIjJ5qV4wzrmv2TfF1k
 A/pBMPQMbKaBC1E0q7RKgHnqXvwE8K1fd4xXma+7vlT4JudTtYh+2FC3SLJw79RcMGdYocKwX4g
 8uzEb+GJdFDKa3WgjZu8ekSEU36GrXhbrqtxvV5txjq//20YDE12fUdPozM2+Lb+F/UIP+i9
X-Proofpoint-ORIG-GUID: vt6WVhG6QZdbT3jb9n8mP-RSkIkWb_pr
X-Proofpoint-GUID: vt6WVhG6QZdbT3jb9n8mP-RSkIkWb_pr
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=6880bb4f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=epAnejISswTQ0IiE-JAA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=971 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230089

Introduce Top Level Mode Multiplexer dt-binding and driver for
Qualcomm's next gen compute SoC - Glymur.

Changes in v4:
Updated bindings to column length of 80 char

Changes in v3:
Fixed indentation for example tlmm node in bindings file
Fixed s-o-b and review comments in the driver

Changes in v2:
Fixed dt-bindings error from example node's reg propery
Fixed gpio-line-name maxItems
Driver UFS_RESET macro updated
Removed obsolete comment for pingroups
Updated ngpio to include ufs_reset pin

Pankaj Patil (2):
  dt-bindings: pinctrl: qcom: Add Glymur pinctrl bindings
  pinctrl: qcom: Add glymur pinctrl driver

 .../bindings/pinctrl/qcom,glymur-tlmm.yaml    |  133 ++
 drivers/pinctrl/qcom/Kconfig.msm              |   10 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-glymur.c         | 1777 +++++++++++++++++
 4 files changed, 1921 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-glymur.c

-- 
2.34.1


