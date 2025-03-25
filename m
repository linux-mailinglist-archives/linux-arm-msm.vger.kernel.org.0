Return-Path: <linux-arm-msm+bounces-52428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF131A6EADC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 08:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3ADE3ADDCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 07:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5DE1F3D5D;
	Tue, 25 Mar 2025 07:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LfSXwvPj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECD42F3B;
	Tue, 25 Mar 2025 07:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742889233; cv=none; b=i3GOLhZWdtTXODiGTc26if5FMFR7zdI8mzR4VrptUgzjuOxcwbpzSLpP6jQffZp7gQ8nbohI+wIRjo9hXUG+ZavzWJaAwFAuxoFxtVaTT7TPEE0NQkpt2RbXK4isRUA/ctOtMEMhaySgeVsiyAZBwBL8shFKzGEboHybD9N58Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742889233; c=relaxed/simple;
	bh=XrQaZRjO8ew439JNY1EllTC2gQVCKQ4kEK6eziMXiUY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ghVOMX5z4g3BWXfti20GHWirY4wfORAwurqJD2F1hp8ijD8hZi39jcKc5zu69Abz+0/3KZmxB6xZ6DMQ7AJt4hamSxSbuyMFxu/q66ALJoo9khCfpv2DtOATIO21tXHc5Pg4FTeMnqVhUthGXhMW0Pg0UkdxKoiAV2bDTsKWqgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LfSXwvPj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P5vVsv002251;
	Tue, 25 Mar 2025 07:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CIcq8a62kenyIjAeBivGBN
	WGYfvvNjBtVMn6t23wi/s=; b=LfSXwvPjxTmv+0CVb5KPDT25SK1mmOqXKhseXr
	wipmJJ7KImGEuWDbHN6H0/FzTqhbS98PKkOKLj1ur2pvFuirnyaRuM33jJkBNiP8
	OtsSUWpgKhYs8UUuzi4wvQEayylCtZtxXzQu7QUhD4vtnMWuIAKlTtYkEmmzp9wW
	xmtey5LGIok7UhU+ShpYu9P9EtkKL6b8ZlcpUXxb8mL+rnGqGooZ69+aJObv4S3m
	aUGubAmIrGQ4mLFzYTDPMcNVhAhuF03Qc2nShh9ZeUfXkG20n2PWiHt7gNm1gEac
	dwUuEbsxKERRyXmR4ay78ByS9HyXUR+YFlSbgpi+V+bJjvGg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hn9wex3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 07:53:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52P7rk0q016200
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 07:53:46 GMT
Received: from localhost.localdomain (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Mar 2025 00:53:43 -0700
From: Stone Zhang <quic_stonez@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_miaoqing@quicinc.com>,
        <quic_zhichen@quicinc.com>, <quic_yuzha@quicinc.com>,
        Stone Zhang
	<quic_stonez@quicinc.com>
Subject: [PATCH v4 0/2] Enable WLAN for qcs8300-ride
Date: Tue, 25 Mar 2025 15:53:29 +0800
Message-ID: <20250325075331.1662306-1-quic_stonez@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Q8OygXmS0UOJzZwrgHpZ9mRnwWh6VFsz
X-Proofpoint-ORIG-GUID: Q8OygXmS0UOJzZwrgHpZ9mRnwWh6VFsz
X-Authority-Analysis: v=2.4 cv=CPoqXQrD c=1 sm=1 tr=0 ts=67e2610b cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Yeman0STanS9RNZiH04A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=831
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250054

Enable the WLAN subsystem of the qcs8300 ride board. The WCN6855 wireless
chip is attached to PCIe interface 0.

This patch series depends on:
- PCIe
https://lore.kernel.org/all/20250310063103.3924525-1-quic_ziyuzhan@quicinc.com/
- PCIe SMMU
https://lore.kernel.org/all/20250206-qcs8300-pcie-smmu-v1-1-8eee0e3585bc@quicinc.com/

Changes in v4:
- Rename the symbol pcieport0 to pcie0_port0 (Konrad)
- Adjust the property order in node pcie0_port0 (Konrad)
- Add to the commit message mentioning FW and BDF used by QCS8300 (Dmitry)
- Specify the calibration data using the correct variant (Dmitry)
- Link to v3: https://lore.kernel.org/all/20250318093350.2682132-1-quic_stonez@quicinc.com/

Changes in v3:
- Complete the nodes property definitions according to DTS binding requirements (Bjorn)
- Link to v2: https://lore.kernel.org/all/20250227065439.1407230-1-quic_stonez@quicinc.com/

Changes in v2:
- Rename the nodes name according to DTS coding style (Konrad & Krzysztof)
- Provide regulator-min/max-microvolt to the regulators (Konrad)
- Link to v1: https://lore.kernel.org/all/20250210062910.3618336-1-quic_stonez@quicinc.com/

Stone Zhang (2):
  arm64: dts: qcom: qcs8300: add a PCIe port for WLAN
  arm64: dts: qcom: qcs8300-ride: enable WLAN on qcs8300-ride

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 108 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     |   9 ++
 2 files changed, 117 insertions(+)


base-commit: da920b7df701770e006928053672147075587fb2
prerequisite-patch-id: c87e5f1cb29568c24566e8a960d6c8dd0be5969d
prerequisite-patch-id: f80a486c6e34dfb62f09faf0eb3fae586cda85ec
prerequisite-patch-id: 0e2cb7a4d8779539a58261111deea6bd6b750f6f
prerequisite-patch-id: 8b9034fca96bd8edb5c4eca5b88811df7206120c
prerequisite-patch-id: bb6ec99692ade9d7c89f91b5507cc0ee248e43dd
prerequisite-patch-id: 32c051e9f77de6b53a4f4539ce49dde9859002ea
prerequisite-patch-id: ccfa56b7d00a1139fbbdccdc13496bfc98440d5e
-- 
2.34.1


