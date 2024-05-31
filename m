Return-Path: <linux-arm-msm+bounces-21231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EFA8D5E72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DED21C20AED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C94585626;
	Fri, 31 May 2024 09:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nahJdlsc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9024D131;
	Fri, 31 May 2024 09:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717148155; cv=none; b=h33tutDCctlKxc1+7i6gR9Mde3VdxgTb5oGT9d/j0PnwCiqWpY27fhZInIf9iPVv59WVLuHVQ/WGUB5cCA38gDmq0VAW7yRtQKhv5AKqmGBFcgW1edTDi9GVqgHxCjGEZFnp4FBAc3Ps03rEiw0QaiosF5MYSXfUYOWq6PckoKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717148155; c=relaxed/simple;
	bh=OTRGN3E9Lw/xr7pn71e2ShkD/h36nVKCIInDl5AJNuE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dtKtF8l6PNIM45HYAhm5g3d0xEe+pv7La2tlcnL7/XNsW9fZBKk3XSo7kgGJpJGER4jmZ4VPPmfcWlT2DZyl+MkzBjvvSz6vDkcN5FJWpoeNebIyi/s2wG+2uT37s5ySU+lM/e6xExE9QBTi1DFOmko1ZgyN0kDkY6Wo8hZ4dyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nahJdlsc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V94LoU015857;
	Fri, 31 May 2024 09:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lqlb+qu8O9VL9BEYXOe0SI
	3qNuvaeynwkdfAL6uEGbs=; b=nahJdlsclbv1/OUZeckpmZ4v5ol9U2RuAu/0r+
	EX4zYIT+2jfdGuWNQ5prtwjMMQNwT6Ed2mfnZ9yuWvy/LHoSLTojpBVrp8IoyrIT
	lKf09bmf/I8x2cEU4d1AMPenLqCG7NDlf3dn2iHXiI9pRpca0u5vaHEBp6dM62Ms
	M2HrO0tpAclQTZTINapWn6ztNiLhjAmE0Nfifhbp68RzWJH54daqkdhp06dBgogi
	1LVvq0DznDqInPZHoOKZaJ+R8Uac/yFE7ktluHmuG71uCjFhMXWiZkyBVhJb1QJy
	GuowjHhKBTNB9reQD8MzPcrnVYyPLfexDEmXp7q38WAb91zw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yf23ss9ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:35:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V9Zoxi014773
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:35:50 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 02:35:44 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_kbajaj@quicinc.com>,
        <kernel@quicinc.com>, Tengfei Fan <quic_tengfan@quicinc.com>
Subject: [PATCH v2 0/2] arm64: qcom: sa8775p: Add IMEM and PIL info region
Date: Fri, 31 May 2024 17:35:29 +0800
Message-ID: <20240531093531.238075-1-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fvEWJlDVJYOy7sNCH05-Ewiw5ayh5AJ3
X-Proofpoint-GUID: fvEWJlDVJYOy7sNCH05-Ewiw5ayh5AJ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_06,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxlogscore=668 bulkscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310071

Add IMEM and PIL info region for the SA8775p platform.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---

v1 -> v2:
  - Adjust the position of the "ranges" property

Tengfei Fan (2):
  dt-bindings: soc: qcom: add qcom,sa8775p-imem compatible
  arm64: dts: qcom: sa8775p: Add IMEM and PIL info region

 .../devicetree/bindings/sram/qcom,imem.yaml        |  1 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 14 ++++++++++++++
 2 files changed, 15 insertions(+)


base-commit: 0e1980c40b6edfa68b6acf926bab22448a6e40c9
-- 
2.25.1


