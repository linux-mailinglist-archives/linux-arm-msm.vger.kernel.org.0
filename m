Return-Path: <linux-arm-msm+bounces-32261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D024E984320
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 12:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92E5328187D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 10:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F0C15B56E;
	Tue, 24 Sep 2024 10:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lU91nqye"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3D9335A5;
	Tue, 24 Sep 2024 10:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727172486; cv=none; b=AWOkb7g0JREW1nUcRog1PfdkRFYEIIASZzf5/pLZD1vtW0Ld45OpNQbNOEbvAhRosj5mxLW2RCms/ThR/faGlfN+BQ670C0V28cFSJp/U21CVv/GlTZx90jOA72YJbTkRmdy6Ly8l4vCSmtttuUAPfwh+vDYSnqQM9+VdHbW4I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727172486; c=relaxed/simple;
	bh=dum2UZw5u45jGA7jOzzKQH0gHD9VusTAOoNOIk3xWFI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Vs1AC7HUCYMbKeGVAJ1b8DJGijT3NhA0R1LtoHfp839bhY8rR9oVI1gz+ZjTlaZkzctZ5YpARgz+9sZKwY3CuMm/93N9TxQQQutNZwqMt81pMLMnERJ+fBvBMEjgpU0gQIJZu78vhnmHwZ7cKbnl6mrFLAKM3uvPZETTcEIz260=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lU91nqye; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48O8YQYv001340;
	Tue, 24 Sep 2024 10:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OiJ+Kefl6SWfraq/+UKIbD
	rSHkH1C3yH8HUudt4yucA=; b=lU91nqyeJcc0npJUOCHye3icb1bQnLBU/BCxRF
	BieeqkwMI29c7jvjG/MV3INOmtzqH5SqChAJluXR3Emitv+hEiaMy+oFkOJFeW+Y
	TvogVl5hdfkzsVYUqmDO37mRIngs4Bh0uDQ0awFpuiGFwdaHCguqxWo0lAyguEi1
	Elx/92o5ZTrGhudLrcmSOd9ekoYVO1TUIm/sfjx8ZEBSrdspGrZiBwtytj6R0Gq4
	OxkWC0TUtQK1wR36fgzaqC2PtiZseGvHeYC1cz3gCyj6ZxamV+VGo/R2UjboAE9T
	Vc8QcG7VNI8FKyCx6UY5y255NG42gP77hTpDAJrRli2lc6rg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spweqvq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 10:08:02 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OA811P017517
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 10:08:01 GMT
Received: from songxue-gv.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 03:07:56 -0700
From: Song Xue <quic_songxue@quicinc.com>
Subject: [PATCH 0/2] soc: qcom: llcc: Add LLCC support for the QCS615
 platform
Date: Tue, 24 Sep 2024 18:07:10 +0800
Message-ID: <20240924-add_llcc_support_for_qcs615-v1-0-a9f3289760d3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE+P8mYC/x3MUQqDMAwA0KtIvi20pcrcVYYUSaMGxHaJjoF49
 5V9vp93gZIwKTybC4Q+rJz3Ctc2gOu0L2Q4VYO3PtjBBzOlFLcNMepZSpYjzlniG7V3nRk6Ioc
 20KMnqEMRmvn731/jff8A3wgnjm0AAAA=
X-Change-ID: 20240924-add_llcc_support_for_qcs615-95ee1c04e86e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Song Xue
	<quic_songxue@quicinc.com>
X-Mailer: b4 0.15-dev-88a27
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727172476; l=766;
 i=quic_songxue@quicinc.com; s=20240911; h=from:subject:message-id;
 bh=dum2UZw5u45jGA7jOzzKQH0gHD9VusTAOoNOIk3xWFI=;
 b=l9Lp2H90/vVKdIwgbTPhXI828lzjLdOe6aEc1AJ5LthRbwcPlB5Bm9WYelIc22AatS8Ght4I9
 NVLjVhp85HPAuXB7YB640URkEPoQJY7nLyJAHr8U1LL265n8MIpSUM+
X-Developer-Key: i=quic_songxue@quicinc.com; a=ed25519;
 pk=Z6tjs+BBbyg1kYqhBq0EfW2Pl/yZdOPXutG9TOVA1yc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rVLItgvwgyIMdYldChksf_YYajOO9bPQ
X-Proofpoint-ORIG-GUID: rVLItgvwgyIMdYldChksf_YYajOO9bPQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 mlxscore=0 mlxlogscore=806 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240071

The QCS615 platform has LLCC(Last Level Cache Controller) as the system
cache controller. It includes 1 LLCC instance and 1 LLCC broadcast
interface.

Add Bindings and LLCC tables for the QCS615 platform.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
---
Song Xue (2):
      dt-bindings: cache: qcom,llcc: Document the QCS615 LLCC
      soc: qcom: llcc: Add configuration data for QCS615

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  2 ++
 drivers/soc/qcom/llcc-qcom.c                       | 23 ++++++++++++++++++++++
 2 files changed, 25 insertions(+)
---
base-commit: ef545bc03a65438cabe87beb1b9a15b0ffcb6ace
change-id: 20240924-add_llcc_support_for_qcs615-95ee1c04e86e

Best regards,
-- 
Song Xue <quic_songxue@quicinc.com>


