Return-Path: <linux-arm-msm+bounces-95790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMYIBBu9qmmnWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 12:40:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 497BA21FBC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 12:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3315305DA93
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 11:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66913366543;
	Fri,  6 Mar 2026 11:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NJLycV4z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF6B366047;
	Fri,  6 Mar 2026 11:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772797207; cv=none; b=U5Kf0XPi+ndqILh3FPxQR7TL+WIXHHsvEHXqO5qOAssZCHZ8iRaSpAz4wjT4nY1WlXI8f/jzCq4X0uKqhk91eyERyyW+NH2VZOYe7fYxzHOSI+Py5qdNPtzrp/lL5We1gOO1NRPz7aHlpczrGFy7a7PuHWnI1fkURw8haEOxfCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772797207; c=relaxed/simple;
	bh=Z3oM/HKdegsDJQavJEiEc0Z7fJzoJUvrCKpWT7nJGsA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gw5/1HQSsXA+f+lEEjM4JGehp4rxAL759xUg/YA9gGpeNzukdTan9XbFbkfaDltAb1z49Bv/3PEKSDGfK4F43p7N1u5IQPGSAXubhsQX6N+NZxdNipOwvJjqGf/GnoKoYNLO7rGcoeupSCsMqW8FWOcZm2sYwbm8O7b7WWKnKps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NJLycV4z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbEqG1189321;
	Fri, 6 Mar 2026 11:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AR66lpO5p40woH+caHGTvq
	SY6Py6i1aK2WSIbBnNmfw=; b=NJLycV4zdHJ54zpQkU2PMUZf18iv5+sME4UW2x
	WDG8DxSXUH6E+d5ntIj9jvUYZDY8q7bp29rn6YRUR6+zVnK+lt05c+MoVicOYzy2
	5dpsqkMMM2QiXit54fPZm5cmZPBT9BLCXtlZregmN7kImHOrDeqY3pdn3fNGLmLD
	PV0s2yT1EVZQUVsGTdE2YI0CU17PfbxD3/COZWA4IRDL2pMdxLlaho8stMnwZsb7
	Jdito1JOX84r71VhFGtn+SaDo9cHJShO8QSPXbeAj+W2/7Yv3C/tth7pM1l4Wsaz
	uhZ/GIknK+Diu+R86eN1yr1FxSQM1RD+a+gZUykyWaUSLOcg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqx14g1h9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 11:40:01 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 626Be0xr015174
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Mar 2026 11:40:00 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 6 Mar 2026 03:39:57 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <varadarajan.narayanan@oss.qualcomm.com>, <quic_mdalam@quicinc.com>
Subject: [PATCH v6 0/4] Add QPIC SPI NAND support for IPQ5424 and IPQ5332 platforms
Date: Fri, 6 Mar 2026 17:09:36 +0530
Message-ID: <20260306113940.1654304-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExMCBTYWx0ZWRfXxtPvdGLAfpTn
 fEc0HTwG2YHi+6wG6NL7qwRKoWiK2WB3B1DIrh2N0UM1Qidkv8pEYCXHMTdGjWn3yGCzi6b6dUT
 H3mxOKQJ2M1kktdSyiNB+shBkZwELFMxsITopaA6V0XYzgY/cfmsvsXyID90xAhdC04YkUC1ocG
 11UcjJhYhmY+N+1QPRB9YFDppA1s/hJBVTiIdxkLF+KLnz2LF201341Z7TTZlj0tW/loslDV9D2
 Y8XL5u5cXxVO+FmV3IiJ7qUrkiQhp1xfwZ4NnvOLiWTxqrbVo45EQ20PG6AfUee6fQ2yfZpnC+0
 WnWdblEwhwfgDZclDymQb2p3PsxSncKaW8i1CO/kL2kKebFYjDR9ytn7n6yfHu33EBWn15okS7b
 p8h7IwBfaDQ/glAXYI9lz1LkRBmiA0pcloV3fM5jSaBN+nL8k78h2/ILjE+N4hJApLPU+blvAbN
 YwH57gbLR5Ic8ekJ8Qg==
X-Proofpoint-GUID: vOr3g1T8mKDrHZbiSa_A7tuWMEGvCfb-
X-Proofpoint-ORIG-GUID: vOr3g1T8mKDrHZbiSa_A7tuWMEGvCfb-
X-Authority-Analysis: v=2.4 cv=e/MLiKp/ c=1 sm=1 tr=0 ts=69aabd11 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TQ69iSlqDmPYr9GvtBUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060110
X-Rspamd-Queue-Id: 497BA21FBC4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95790-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,quicinc.com:dkim,quicinc.com:mid,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_mdalam@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Md Sadre Alam <mdalam@qti.qualcomm.com>

v6:
 * Squash the eMMC removal changes into the SPI‑NAND enablement patch
 * v5: https://lore.kernel.org/linux-arm-msm/20260223100552.1050303-1-quic_mdalam@quicinc.com/

v5:
 * Split DT changes and driver changes into separate series
 * v4: https://lore.kernel.org/linux-arm-msm/20260206100202.413834-1-quic_mdalam@quicinc.com/

v4:
 * Rebased onto linux-next
 * Dropped two changes from v3 that have already been merged

v3:
 * Added Tested-by tag
 * Added Reviewed-by tag
 * Reformatted clocks, clock-names, dmas, and dma-names properties
   to one entry per line
 * Rename ipq5332 to ipq5332-rdp-common

v2:
 * Added Reviewed-by tag
 * Added Acked-by tag
 * Updated board name in commit message header
 * Added \n before status

v1:
 * Added support for spi nand for IPQ5424 and IPQ5332
 * Updated bam_prep_ce_le32() to set the mask field conditionally based
   on command
 * Removed eMMC node for IPQ5424 and IPQ5332

Md Sadre Alam (4):
  arm64: dts: qcom: ipq5424: Add QPIC SPI NAND controller support
  arm64: dts: qcom: ipq5332: Add QPIC SPI NAND controller support
  arm64: dts: qcom: ipq5424-rdp466: Enable QPIC SPI NAND support
  arm64: dts: qcom: pq5332-rdp-common: Enable QPIC SPI NAND support

 .../boot/dts/qcom/ipq5332-rdp-common.dtsi     | 44 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts   | 34 --------------
 arch/arm64/boot/dts/qcom/ipq5332.dtsi         | 33 ++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts   | 44 ++++++++++++-------
 arch/arm64/boot/dts/qcom/ipq5424.dtsi         | 33 ++++++++++++++
 5 files changed, 139 insertions(+), 49 deletions(-)

-- 
2.34.1


