Return-Path: <linux-arm-msm+bounces-50280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5831A4F029
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 23:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3258D3A3198
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 22:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6DBF21B9DA;
	Tue,  4 Mar 2025 22:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DTb8vTt5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6961F03D7;
	Tue,  4 Mar 2025 22:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741127054; cv=none; b=tM9H/OVxUPAHpc6OAoIaakb8vnt7eIoTnHo6enB/gJwA+aZlQiR9KiXYe/nFINg28IEbLtd+Y3d4YdAYvRlaQfsLE4cWG1yBz5twDZ0LAmkjeuM1w8dk2WfXUrya10rumUmHxzmkJ7nazdjKH6nuGzo8xAQyetNZkZgMsXieNPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741127054; c=relaxed/simple;
	bh=dM6AwEaFBM5nkb/NfKGlsNhok0Qd0RfcQewDdfVEZB8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=RfZFjYhvGs1OCzOHTP2DTMQfyn5NBQdEAzdTQagHA0ey59IAhXGalbxhFPHGtnjx/uKyulavjHV0vW08B/yUoJ7LADefR6v6HN779ohRPiqa9K0/cCrdjYTBTeXL3X20DRXsGjUxo+HpmhTwmJ7BCfbAPz1ShMwlu+rsa3SNrKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DTb8vTt5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524L6Wv6006445;
	Tue, 4 Mar 2025 22:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vv7ek9kcneEuAFn+i+rosQ
	SLlSrHhpNb9kGN5j+C4PY=; b=DTb8vTt5jPsDMslqwv7gtICW+JDwzAQsmOq+v1
	Pkr/RoLjnJJKUOegcHg9OoaRG1bPWUu5zJa4SbYJeb/XXoBPiaD0dQeEkRNb3UEc
	/fzYoWMb+Ckn3nmJpp38vTeWW5uzEb3Su7zku0/3m5WjECJLrXgnsPafr1Mr7x2z
	zrI6mA7XglLZ/7lvb/Z9toQS9b7JR83cR/UVEgENtlZEU0OcU08nE4ED9PVljcQi
	YT7Z6yXsU9c6RWZ85ZiL3ImgQm25rftOa3xFepLhLrZnP4EsGJcm3TRanu4rFu6v
	Ty1yZnu0A8Y4TxgC5tvnavMEj3wlX8jM5j9tAuT9U7ppe68g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p933bu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 22:24:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 524MO9rh032390
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 22:24:09 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Mar 2025 14:24:08 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH v2 0/4] Introduce LLCC v6 used on the SM8750 SoCs
Date: Tue, 4 Mar 2025 14:23:56 -0800
Message-ID: <20250304-sm8750_llcc_master-v2-0-ae4e1949546e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHx9x2cC/22Nyw6CMBBFf4XM2po+aABX/ochpC2jTEKptkg0h
 H+3Epcuz0nuuSskjIQJTsUKERdKFKYM8lCAG8x0Q0Z9ZpBcai54xZKvK827cXSu8ybNGJk1RvV
 YlpYrC3l4j3il1x69tJkHSnOI7/1jEV/7ywn1L7cIxplWdWMbibKvzPnxJEeTO7rgod227QO2w
 af5tgAAAA==
X-Change-ID: 20250107-sm8750_llcc_master-baa3de44b03b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741127048; l=1471;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=dM6AwEaFBM5nkb/NfKGlsNhok0Qd0RfcQewDdfVEZB8=;
 b=Q02z7fTRfwnMbC2mZvt9kWQlJOBAlND9EzmFhnpwxOlrdGSQrf8Nix0Qg7fDnBHwbZmKt7IyV
 Mo0gL+XNaPlDwORevvRB5RPAKSi5ZUQ+5BYeC5r6ON0OOc9QeEFn2Jf
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Me2Wu4/f c=1 sm=1 tr=0 ts=67c77d89 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=LTIBZ0NwBk2J_m6rEtIA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: zJJsTkBn83QSGvlnpXhnmuoh7VyvlrSl
X-Proofpoint-ORIG-GUID: zJJsTkBn83QSGvlnpXhnmuoh7VyvlrSl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_09,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=584 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503040179

Add documentation and functionality for LLCC v6 used on
the SM8750 SoCs. LLCC v6 rearranges several registers and offsets
and supports slice IDs over 31, so new functionality is necessary
to program and use LLCC v6.

---
Changes in v2:
- moved v6 offsets into cfg struct
- reverse xmas-treed variable declarations & removed unused
- removed unneeded skip_llcc_cfg branch in v6
- updated some macros to use BITS, GENMASK, FIELD_PREP
- moved LLCC_* definitions to appropriate patch
- updated sm8750 slice data struct to match updated standard
- fixed style on dt node
- note: did not add cleanup patch to use bitfields
- Link to v1: https://lore.kernel.org/r/20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com

---
Melody Olvera (4):
      dt-bindings: cache: qcom,llcc: Document SM8750 LLCC block
      soc: qcom: llcc-qcom: Add support for LLCC V6
      soc: qcom: llcc-qcom: Add support for SM8750
      arm64: dts: qcom: sm8750: Add LLCC node

 .../devicetree/bindings/cache/qcom,llcc.yaml       |   2 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  18 +
 drivers/soc/qcom/llcc-qcom.c                       | 481 ++++++++++++++++++++-
 include/linux/soc/qcom/llcc-qcom.h                 |   8 +
 4 files changed, 505 insertions(+), 4 deletions(-)
---
base-commit: 20d5c66e1810e6e8805ec0d01373afb2dba9f51a
change-id: 20250107-sm8750_llcc_master-baa3de44b03b

Best regards,
-- 
Melody Olvera <quic_molvera@quicinc.com>


