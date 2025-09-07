Return-Path: <linux-arm-msm+bounces-72434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEF3B47BD9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 16:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62F4B178599
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 14:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EBFF277C94;
	Sun,  7 Sep 2025 14:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvTTx4xI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D242AF0A
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Sep 2025 14:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757256741; cv=none; b=HR1PF4IVPL1no7Mn+ML4kVcJcnFHsfdMsTHx09FE4JFQIpsKZo6oizXNqfiulYm2G8DSv2m6njDANNXD3iiHQdqigY6tx7ca01vmBUlmAMBE56Wo6m/uv6RUYKCjwonpnL0pVOkMtHIWjCdER/7YThZLjvSkmhlhNh8oBwDBIu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757256741; c=relaxed/simple;
	bh=66V9mcSPRg3zLz1L84vxx3ShagDLM7AYgTphTtjm9GU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nB+fwaynqIEyjnI1vGfmpY2RqZd21GAXcXejlBehAbKMBbIF16rVQ3olJonZ/ujqVXQI5FfhXEuuhBAKEEpieuB320gpuitX89yPmh9VJonjfLha0nJvBYNA8ipHFcyh+wLwtnah8ukGsf4+DLg0Uto+UHZrFFbURUDNvESLdTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvTTx4xI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5878jH9K032435
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Sep 2025 14:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dm/AC68sidu1C9D5/ML6f7
	y4aTepUoqHgxT+eji/ans=; b=hvTTx4xIPjlwS3XFieFgfY2yLmKnmw4C5k0DWB
	or4dVPviC0+ILbyJh5i7XkrgwQUwB5YJi9bd3BDXtKfVLkGaByF9Soj+jnHOP6xY
	PJ2rBO7/guXFR+pZCK/XtEWWT2QMsXTYKRePHBOizB0j2o1BHBK1+Pa/51uAHFyu
	zHNB5us0DKNs3AVcqf6h70rFSMf7IuI7b1PVNHZmIv9RoKpnyLgj+Y73zN1+2GdY
	XIus2r4DsrPveFb1zyE5nxMrIrMm6cl6fKQyMj0soeL9s/nbfreVOBVZseHjizJS
	uXIQnN+96eOlKB9v4T7u8F5UiTEobNUxoHt6jrfGurZ+EIuA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d63a6k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 14:52:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7224cb09e84so82201986d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 07:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757256737; x=1757861537;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dm/AC68sidu1C9D5/ML6f7y4aTepUoqHgxT+eji/ans=;
        b=lWybT7izsZOOCNzpBfgtJx5E0e9eXZ/FHO5yQnxzaiCcf4/5qReKExpMm9Sy5SiBlp
         EWBQouTUyCPNGr6YAOgzXKMVI1wpiVsg9+aJrTl89shel0f1Vjp2M/6fwRncPhEk3CUc
         VBYiIdlZtr6lWCfiTRP2YzB/Ob2jn6wFpY3ZY3EYPQveHMeyM2WlqzKsvotBZ0mJ14Qo
         gnXz2nRUkT+KBACcyeZuImIAB7c8xlBShp6MtKQC0bYA2CriG21Ikn2dOmtel50j2A1F
         e2tBbMO1S+S2i5gl49TD5RP9PeaJ0FpC1hzdqtfJ1dWfEs4yD5/bWexCmL5xgUbHGtfg
         UrLQ==
X-Gm-Message-State: AOJu0YxvMbA2CdOfYgg2q5omY1EEzdBeazk6VF/h6DPBnXcWoLHK3v83
	AEqYY9CRwmbMhw6iDSEMg75kaBgjUuaaxBjZWaE0IRgn7gWr1nWT4SMpPtJiBqUcNmzozAzjAQS
	kcC77+wStiStrQWEMQeyME2VR3r31o0VIoj+96PBbG0/jF5WMbOhQZloFvT1SlvsYFA44AZUTO+
	Gu
X-Gm-Gg: ASbGncuF5QEDoxmXrnYY8TK/yCkR1UBuxCUWdt6eWdr1wDgEcYoq1bHLGNo7NgoGuBa
	9dyZ98P1BLPOxEMXkASTDTkUP6re/0i02xyJVftdy8zPpKhLSrzcWiBYtsLItBV0Q8UFsc166nF
	mAbCu+3Y9xnCZ2O4sF7SMMA/N3JPJ3TfToipqe31JQgg+jLy+0bD1vo3tIMDFi1HMuD+gNvvn+w
	BgiNEjAyqBEUds7EEmi5RRzfMiO3SMytpD1bkNrasubJ78QU37RdzPNyYcb4oeCh7cuotbKeoVm
	hBLcGonudVXFw5D/FzBVds3A18raIyEh0E0Kz6fW6LiS1s71hHp/wEf1CGkEaKzsFyfNVVxKApD
	BdrpljPycksyAIIFvi7OFtZCboCZshI5rIrNwdyIXLJ9JVjDnq+zn
X-Received: by 2002:ad4:5be4:0:b0:70d:dbb8:2a08 with SMTP id 6a1803df08f44-72bbdceb182mr98998846d6.3.1757256737468;
        Sun, 07 Sep 2025 07:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtL7nhGW7IPavOZDy/ef87fk5RxFxPNb3ACPkcCQglRl4GUV7+76LhYk62IFPa37EajiBP9Q==
X-Received: by 2002:ad4:5be4:0:b0:70d:dbb8:2a08 with SMTP id 6a1803df08f44-72bbdceb182mr98998676d6.3.1757256736962;
        Sun, 07 Sep 2025 07:52:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab939d5sm2936738e87.46.2025.09.07.07.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 07:52:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/4] phy: qcom: extract common clock-handling code
Date: Sun, 07 Sep 2025 17:52:09 +0300
Message-Id: <20250907-qcom-dp-phy-v1-0-46634a6a980b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABmcvWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwNz3cLk/FzdlALdgoxKXYtUSxNLI0sTY8NUQyWgjoKi1LTMCrBp0bG
 1tQBGnTOPXQAAAA==
X-Change-ID: 20250907-qcom-dp-phy-8e94929431e1
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1558;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=66V9mcSPRg3zLz1L84vxx3ShagDLM7AYgTphTtjm9GU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBovZwerACnHxjCQwYknzvSyjU90vogRPM+MxS0d
 SyT3t2O2kOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaL2cHgAKCRCLPIo+Aiko
 1WzCB/9xXfVzmn1QhK+Myrm3J97oFFadhmi5uYwEyv7gQAjNHezWVIyx4rho2pZrQkSo1W+vSg3
 zZSk6tKJMsKA4LqSzT8hXqodUiuZZyxYB+y6ZaHM9Li9rc6eg1X0dxPt3wx9BXwzpfbczVLtFOX
 2B/hJPUmMUTuEandaj4IZ/tr4G2aoRz/zx1xL52+N/RjnEE0GFCDDUcVpAUFKDYpYTighqpzuFE
 bCosOGVsHVFbW0ki40EPJ5S4CwRhKlY7+4ZUJsMOm5V9XSlX3565Bk9PlWpeeywAbOXwLPSudN/
 /Uh3qTUFLxde4bje+nCs5RSu2Wgo2cQNpR+bipc7dR0LuwQp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyOSBTYWx0ZWRfX9LmRin32HwPS
 0U4zuP4iSQxMfzCZnKK0Z11qXcE7tGPUaBpodX4RNIUZn8CQCtTI4POEUTZTi9uyqr0CzcIIKJA
 HSa0wMYJ5+F6U1awFwNB8o05a5GwqiUX7PiGfE9rh15Fk8G2K99I7Co0v2jRUClk/4OGTu7ww4X
 2tGAig48wUQQvhha7+begO7+mA7JO/mhOW52eZluk+3+olhZmqws5nBXP5YV/rSIyrRZ4iceRba
 MQxCJjxIDnpiXemTNAk9hDGPenvthAv0VmGOEVvNadR9TDU/I9QUiYhrNZAtL6oPrp8E6DY0nDT
 M5XPfdVBo4GqA0OtKRyFi9G82W1BMdkgMlhx7oTqGsOb4pU7LUtQETW9s+zxvXFiw3/RONqE5dK
 dUSHCIkL
X-Proofpoint-GUID: 3TLRtReNcuDioAOrPk2gBeFCNyX6lq_I
X-Proofpoint-ORIG-GUID: 3TLRtReNcuDioAOrPk2gBeFCNyX6lq_I
X-Authority-Analysis: v=2.4 cv=DYgXqutW c=1 sm=1 tr=0 ts=68bd9c23 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=e5op49_jyGd2bgSFRKEA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060029

QMP PHY drivers share code to register PIPE clock and to handle DP link
and pixel clocks. While the amount of share code is not that big, it's
still better to extract it to common helpers, reducing code duplication.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (4):
      phy: qcom: qmp-usb-legacy: switch to common helpers
      phy: qcom: qmp: extract common PIPE clock helpers
      phy: qcom: qmp-pcie: simplify AUX clock registration
      phy: qcom: extract common code for DP clocks

 drivers/phy/qualcomm/Kconfig                     |   8 +
 drivers/phy/qualcomm/Makefile                    |   1 +
 drivers/phy/qualcomm/phy-qcom-dp-common.c        | 164 +++++++++++++++
 drivers/phy/qualcomm/phy-qcom-dp-common.h        |  22 ++
 drivers/phy/qualcomm/phy-qcom-edp.c              | 181 ++---------------
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c        | 244 +++--------------------
 drivers/phy/qualcomm/phy-qcom-qmp-common.h       |  67 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c |  62 +-----
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c         |  83 ++------
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c   | 124 +-----------
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c          |  60 +-----
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c         |  60 +-----
 12 files changed, 334 insertions(+), 742 deletions(-)
---
base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
change-id: 20250907-qcom-dp-phy-8e94929431e1

Best regards,
-- 
With best wishes
Dmitry


