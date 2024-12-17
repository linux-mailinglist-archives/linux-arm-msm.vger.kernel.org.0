Return-Path: <linux-arm-msm+bounces-42509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E815D9F489E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 11:11:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A4881885A5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 10:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC851EE006;
	Tue, 17 Dec 2024 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XCMpa8tG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C3F1DFE0C;
	Tue, 17 Dec 2024 10:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734430228; cv=none; b=SytykZQD4g3bLuYRfFa11usAiqNjmelRiprMQlOnHiEnfz09olxjLm5x2s7+phm7LqUZlJ//oQQWxKw+6qswpw247pfKoavDCNGUWpDqQovgCNF0ECWu0k1v5WCW3LDx7TrAuD+clQ4hAuHaofNYRmDiY6hq9vXY5HvfhXdLf10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734430228; c=relaxed/simple;
	bh=ocekj8AcIupubp/kNi52PIPWHl/ZjToQeSGdwPwbdJI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FxOoJ+R4IqPaU4pnxXDX4c7FrfBIywuXWkQNhVQ6f9KVzflHVZdxYVu8mGthrK+vtZI923Mcecy3QliuX5+kdGxIG481w+W8P8nYOQ5v36vR0421RZeumzA8MqKhk+aa8vzPMsDa9LJNyiopRwNHjFa32PiV1STwD7VHxbAwYvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XCMpa8tG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH96rMI010375;
	Tue, 17 Dec 2024 10:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GJ4I1ag4ARUduIBcACW7ETkrGXK/iWpgJHG
	CDXbBNYw=; b=XCMpa8tGqhlCPUXJqCdUmhOcgARyBF78DwqYlji9G6u6QsYSPeN
	NwUt0vtj+dH3rA4pUAfb0n8g5vaHDSrxHXN4ePJegsycTi80VT7+CtlstBvJbljN
	cy/3dcNoW8h8xL4GN25eNiG/3wlZv1oeV+JYSJ4Yv+fWN4uX8j3Ak4ht06tP9kMl
	vVxm+pEChmoe2/Jci2yGR3gyAeVyM58dmP9tlZDpvM7DJpru8WWqO12DLgEh1RuS
	dv4XV8czVLBgETA+5u/KsF4zu/er3UPEulvDU2oKqCRgC/Uh8OXKtzxD6juYdrL8
	5YACSv69qE6zJ0IO/GHq1zN9JyaLCaIPVJw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k6cqg637-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 10:10:23 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHAALje016475;
	Tue, 17 Dec 2024 10:10:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 43h33kevdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 10:10:21 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4BHAALOR016467;
	Tue, 17 Dec 2024 10:10:21 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4BHAALbC016465
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 10:10:21 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4571896)
	id 26F171BD7; Tue, 17 Dec 2024 18:10:19 +0800 (CST)
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, bhupesh.sharma@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_tingweiz@quicinc.com, quic_yuanjiey@quicinc.com
Subject: [PATCH v5 0/2] Enable SDHC1 and SDHC2 on QCS615
Date: Tue, 17 Dec 2024 18:10:15 +0800
Message-Id: <20241217101017.2933587-1-quic_yuanjiey@quicinc.com>
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
X-Proofpoint-ORIG-GUID: ZrAmx5clM0LPcLlKgrlvpYB89jDQNhQ0
X-Proofpoint-GUID: ZrAmx5clM0LPcLlKgrlvpYB89jDQNhQ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170083

Add SDHC1 and SDHC2 support to the QCS615 Ride platform. The
SDHC1 and SDHC2 of QCS615 are derived from SM6115. Include
the configuration of SDHC1-related and SDHC2-related opp,
power, and interconnect settings in the device tree.

Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>

---
This patch series depends on below patch series:
- gcc: https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com/

Changes in v5:
- Modify SDHC1 and SDHC2 interconnects, for the cpu path, use
QCOM_ICC_TAG_ACTIVE_ONLY to replace QCOM_ICC_TAG_ALWAYS
- For SDHC1 and SDHC2, Add a newline before status
- Rebase Change on tag: next-20241217
- Modify dependency changes
- Link to v4: https://lore.kernel.org/all/20241206023711.2541716-1-quic_yuanjiey@quicinc.com/

Changes in v4:
- Move properties which are not properties of the SoC to board DTS
- Add ice region to SDHC1 Node reg
- Add 50Mhz 200Mhz to SDHC1 opp table, add 50Mhz to SDHC2 opp table 
- fix SDHC2 Node compatible space
- Link to v3: https://lore.kernel.org/all/20241122065101.1918470-1-quic_yuanjiey@quicinc.com/

Changes in v3:
- Improve the commit messages and cover letter
- Link to v2: https://lore.kernel.org/all/20241106072343.2070933-1-quic_yuanjiey@quicinc.com/

Changes in v2:
- Improve the commit messages and cover letter
- Remove applied patches 1
- Pad sdhc_1 node and sdhc_2 node register addresses to 8 hex digits
- Adjust sdhc_1 node and sdhc_2 node register addresses to hexadecimal
- Modify sdhc_2 vqmmc-supply incorrect power configuration
- Link to v1: https://lore.kernel.org/all/20241023092708.604195-1-quic_yuanjiey@quicinc.com/

---

Yuanjie Yang (2):
  arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
  arm64: dts: qcom: qcs615-ride: enable SDHC1 and SDHC2

 arch/arm64/boot/dts/qcom/qcs615-ride.dts |  37 ++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     | 211 +++++++++++++++++++++++
 2 files changed, 248 insertions(+)

-- 
2.34.1


