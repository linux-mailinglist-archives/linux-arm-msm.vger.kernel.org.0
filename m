Return-Path: <linux-arm-msm+bounces-40206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF71A9E3800
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 11:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04822B2C9C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 10:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399021B0F1E;
	Wed,  4 Dec 2024 10:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZwnY014r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0691B0F04;
	Wed,  4 Dec 2024 10:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733309584; cv=none; b=s0IItO37FBzo8HVFKRkVdkxolVUm3Q7ag7U3SqEi1OaQ4VGXzsWUm6e1K52wiAS0bU/s7e2MvuwlO+sE2nRZVE/Cy3biOksV9cSDr1FSj2HOqbufuAz0OKHFzvpmgurkafBPj2GQKsUUEdH2Z+WMnlHFCznfl3trYbmJnKDESlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733309584; c=relaxed/simple;
	bh=VqX+2cLgRvaplUcd8Maq3jiGQKkD6WRFBMj3FiBPziY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oTBtT4ElbQTrqsl9HJZyI/x/7CZTfm4pnSXUQKyuxeYhvFY14T3+kMFnSCBgAbomSFIovmw6JCllSvTl7+fFAH1qK3AtxY/4My5EfZW4w/plDj1ZWSCrKebTzG9M4+VGVxkJgs8imMI8fv6U0IROVeiRg4AkXdnYwbnkc7rW/IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZwnY014r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B424N5i027126;
	Wed, 4 Dec 2024 10:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=e0r4UDsw5A5AWl7ZOK5oEyQnVHbAs0QFS4I
	iuUiVmPs=; b=ZwnY014rXfGYCYde4itt7GJ/M0S2gZHO+GrGDCZt/HcCwbGQddC
	J00KYisNRGnnVAG5wkHoKU7dmcy1DmR+CrhXcxLVONnMz9wjKzYM7MkornCfNCcv
	xrbVX/S7TE1yx0tKNij583WpPdWFTqdhwOU16f4cULjMNnm8jCr1n2q9RDF5HoBP
	q3zfASBax7Rv/ihh/8S85HLJ6LjoWyesvr3aBXpeWrrZQYDppJrRzlOQ/EpNQMRQ
	Q9vq037IX5/LAm7/XOonqnlqCI7Z/ADTaQNowV9yT+341NJr9OiacMs+cEE2jLoQ
	f3S46W1pgfqAL3iByxe2bFSI1vUiFOB6u/Q==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a1g5k5v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 10:52:56 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4Aqshd016281;
	Wed, 4 Dec 2024 10:52:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 437uskvsbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 10:52:54 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4B4AqshO016275;
	Wed, 4 Dec 2024 10:52:54 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4B4Aqr6L016274
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 10:52:54 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4438065)
	id 88C9B19E3; Wed,  4 Dec 2024 18:52:52 +0800 (CST)
From: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, dmitry.baryshkov@linaro.org,
        abel.vesa@linaro.org, neil.armstrong@linaro.org,
        manivannan.sadhasivam@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Subject: [PATCH 0/3] pci: qcom: Add PCIe setting current load support
Date: Wed,  4 Dec 2024 18:52:46 +0800
Message-Id: <20241204105249.3544114-1-quic_ziyuzhan@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uUgBGOYGJYqDf6Dw-93TyTa7uVxB8EWD
X-Proofpoint-ORIG-GUID: uUgBGOYGJYqDf6Dw-93TyTa7uVxB8EWD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040085

Base DT:
https://lore.kernel.org/all/20241122023314.1616353-1-quic_ziyuzhan@quicinc.com/

This series add PCIe current load vote/devote for PCIe PHY driver, add
vdda-pll-max-microamp property in DT, and also document current load
properties in dt-bindings.
 
On platform QCS615, the current that phy consumes will exceed the maximum
current the regulator can provide in LPM mode, leading to over current
protection and system boot up stuck. 

This series can fix the issue by setting current load to an expected value
parsed from DT. This will vote the regulator to work in HPM mode so that
it is able to output a larger current and viod over current protection.
When the PCIe PHY poweroff in case like system suspend or shutdown, it
will also devote regulator back to LPM mode to decline regulator itself's
power consumption by setting load to zero.

Besides, three optional current load properties are added in dt-bindings, 
vdda-phy-max-microamp, vdda-pll-max-microamp and vdda-qref-max-microamp.
PCIe PHY that wants to vote for more current consumption should provide
corresponding property.

Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
---
Have following changes:
	- Add optional current load properties
	- Add pcie phy max current property.
	- Add current load vote/devote for PCIe PHY

Ziyue Zhang (3):
  dt-bindings: phy: qcom,qmp-pcie: add optional current load properties
  phy: qcom: qmp-pcie: add current load vote/devote for PCIe PHY
  arm64: dts: qcom: qcs615: add pcie phy max current property

 .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       |  8 +++++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts      |  1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 35 +++++++++++++++++--
 3 files changed, 42 insertions(+), 2 deletions(-)


base-commit: ced7ce570dca175d87392ebaacf6c75f93aa2418
-- 
2.34.1


