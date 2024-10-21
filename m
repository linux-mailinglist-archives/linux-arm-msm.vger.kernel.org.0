Return-Path: <linux-arm-msm+bounces-35307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FFA9A9409
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 01:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F229128462F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 23:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917F41FDF85;
	Mon, 21 Oct 2024 23:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZnBr40tN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02786170A3D;
	Mon, 21 Oct 2024 23:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729552900; cv=none; b=Q4Ds5HvsVmD8DLtctI/ZuN7V/gQfNzWFxy6ZOe4WCZlqjyoW04ikM/aIs4Dk+JPfLbAfRqgJRp4MGekIJHgND9IvVf6NkNuY+YMB//rUq6G0RAFEueN63PiXCZtsZfN5gH4zyqBjhdSHgJ555TOR7tFITSh8eFJj9/rJjCtyBHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729552900; c=relaxed/simple;
	bh=j5Pqek4RcX6IcVEccISOGoQv1z4cV9TOtWVHpdS1pa0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=glW9DzpHE7M0vYDfEVCE9V93Me6bIpK3oUBQrhFZG3GZu+y8SJXuOrAHNfXvjquLsQNgcROZwCIp+vQRjA2/EMkMugZG8wufqVfIoc15FuW5EvOdq+f5aUq4kK2hg1HT95UtYdEF0jLDRFRkvUEAYKkQPBY0ONh1n3zyh84U98E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZnBr40tN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LMX2p9009222;
	Mon, 21 Oct 2024 23:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ExUDjzFnUfLz4up0fujXGa
	mPdyMybFhHmC0NdB69ChY=; b=ZnBr40tNrHJutbsjDOvdAUVElb+79SDWTE1jNT
	B44UtZsK3rZPzsHlvaQYysYxUaMIL+ijvYUriuLslHk8tn0ubh/gyLcaDwZzLMrj
	SnUaAPvEkjKeemNAA4p/l6RzyOjsYw1UDeZyFznmT5/MIM/TW0uAoS5s0wTrce2r
	KsSqOoNLEo+OQbc/jadQdbj0e1YipcxIRPKls0OAhmdfElDnF6vLp9Cnid6vJ7Fq
	AnhJDQIh2s8CT2+bujo3YQOavP5/DuylIVgQ7KqfTL5lUb0wpDCuy8/WwH6gmhFO
	ZNJALg1UENTXBaO2atTMqx7URmGO0qc45/7dtSI9ZgPbrLjg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6rj68f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 23:21:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LNLQuq001590
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 23:21:26 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 21 Oct 2024 16:21:25 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones
	<lee@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>,
        Stephen Boyd <sboyd@kernel.org>, Trilok Soni
	<quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH 0/5] dts: qcom: Introduce SM8750 device trees
Date: Mon, 21 Oct 2024 16:21:09 -0700
Message-ID: <20241021232114.2636083-1-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 34nqjr6ccvHmSvoCSkGzUIdl0rmZIOWu
X-Proofpoint-ORIG-GUID: 34nqjr6ccvHmSvoCSkGzUIdl0rmZIOWu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 mlxlogscore=773 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410210165

This series adds the initial device tree support for the SM8750 SoCs
needed to boot to shell. This specifically adds support for clocks,
pinctrl, rpmhpd, regulators, interconnects, and SoC and board
compatibles.

The Qualcomm Technologies, Inc. SM8750 SoC is the latest in the line of
consumer mobile device SoCs. See more at:
https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/images/company/news-media/media-center/press-kits/snapdragon-summit-2024/day-1/documents/Snapdragon8EliteProductBrief.pdf

Dependencies:
clks: https://lore.kernel.org/all/20241021230359.2632414-1-quic_molvera@quicinc.com/
interconnects: https://lore.kernel.org/all/20241021231823.2635534-1-quic_molvera@quicinc.com/
pinctrl: https://lore.kernel.org/all/20241021230414.2632428-1-quic_molvera@quicinc.com/
regulators: https://lore.kernel.org/all/20241021230348.2632381-1-quic_molvera@quicinc.com/
power domains: https://lore.kernel.org/all/20241021230333.2632368-1-quic_molvera@quicinc.com/
misc bindings:
- https://lore.kernel.org/all/20241021230427.2632466-1-quic_molvera@quicinc.com/
- https://lore.kernel.org/all/20241021230500.2632527-1-quic_molvera@quicinc.com/
- https://lore.kernel.org/all/20241021230439.2632480-1-quic_molvera@quicinc.com/
- https://lore.kernel.org/all/20241021230449.2632493-1-quic_molvera@quicinc.com/

Jishnu Prakash (2):
  dt-bindings: mfd: qcom,spmi-pmic: Document PMICs added in SM8750
  arm64: dts: qcom: Add pmd8028 and pmih0108 PMIC dtsi files

Melody Olvera (3):
  dt-bindings: arm: qcom: Document sm8750 SoC and boards
  arm64: dts: qcom: Add base sm8750 dtsi and mtp and qrd dts
  arm64: defconfig: Enable SM8750 SoC base configs

 .../devicetree/bindings/arm/qcom.yaml         |    7 +
 .../bindings/mfd/qcom,spmi-pmic.yaml          |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 arch/arm64/boot/dts/qcom/pmd8028.dtsi         |   56 +
 arch/arm64/boot/dts/qcom/pmih0108.dtsi        |   62 +
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts       |  968 ++++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts       |  965 ++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi          | 2903 +++++++++++++++++
 arch/arm64/configs/defconfig                  |    4 +
 9 files changed, 4969 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmd8028.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmih0108.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-qrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750.dtsi


base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
prerequisite-patch-id: 5a4ad7a91dffc1c63a6513736cab88404937bbc5
prerequisite-patch-id: f98e160b22d065fef3919e807102619ef80a63fd
prerequisite-patch-id: 9df63975d51d61db536e843f261f837de613c0bb
prerequisite-patch-id: dca6974344b25b6160e6a2680c438bc59da33374
prerequisite-patch-id: 36ad7b3a06074897abcbe9521452ed0ec632e2eb
prerequisite-patch-id: 255b9f24b2765ad6bb8fd5213b620ba2263d48f7
prerequisite-patch-id: f458aa6a3d53924449be96609a0d1e65ec9f4854
prerequisite-patch-id: 5bc1ec8226b52170508fd5ac30e31fec72e86f5a
prerequisite-patch-id: 2b556803a12148cc12c1edcb5e143a454679a047
prerequisite-patch-id: 0924872ce84c0f0011d53e98e58bf61213e9df43
prerequisite-patch-id: 3a6538f98c3ce876d8acf3a0c55ac04897cfaf43
prerequisite-patch-id: 7e047c63eff592833642eae37492b09e1ea7ed2d
prerequisite-patch-id: cf8bef95f79c460b5b1c231a1122aa0173807a4d
prerequisite-patch-id: ba4dd339acd73f885fe3d5f018ac620997583599
prerequisite-patch-id: 5b930049e39fbd1ace2562d7870c2af764fe4cd4
prerequisite-patch-id: 58acef79b9bf6c2e7d69d598d24502787eddc910
prerequisite-patch-id: 369d52ee563f34eeca4a9c36e6d2b36b24eac635
prerequisite-patch-id: e02a35925d37a2e61abbf240cc8963208f54e1c0
prerequisite-patch-id: e4bf91d9a22d34c567eeab5b0f6fb90913ee908b
-- 
2.46.1


