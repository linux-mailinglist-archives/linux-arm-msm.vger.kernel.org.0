Return-Path: <linux-arm-msm+bounces-93644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMKZIZ4mnGlzAAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:06:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B794174801
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E058B3010639
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F6E356A38;
	Mon, 23 Feb 2026 10:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Mb0xHXGH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861553563E9;
	Mon, 23 Feb 2026 10:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841177; cv=none; b=MqRUewRfLh91TBgNwHhWLIOHVRwUcm66R+uymp5fCbVGl7QrFUT+PmhxmV8jo7pxlNrGDYQp61djDgbHCJr/JDjWNfl6Jp6fYoRiYVdwZvbEJjvoL6ke36rqGVPW/pxiQTwXTUZWvH9Vwpl6dZxXBmL8rgYbtTUpi22etocfLT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841177; c=relaxed/simple;
	bh=JDJgnBhS7M0AKU32U4DXwqXSl37KoBYmI5e/E/QBgiA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oYVsxCPiJo3ll1TuoZ4X+0R2Mct0bKUaezJ88nTSvo8kFc/m1iRXjl3ATnKHi3tZYP3cs/QPoWXhbO9DYOGsaHqgwXuGTV+oH+AHk3ynLrgv9H9pe5gH8Lsnld+y1beUMRHmzd/r7J0bs9x0D4td2sRhAZ8AlQaSmWF8VwsehJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Mb0xHXGH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMrXPi3603537;
	Mon, 23 Feb 2026 10:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aIO8YPgnTzhQSkhvOU6ZUa
	8XFDnBe5ULwmw0Jrl+dRM=; b=Mb0xHXGHSmwUzVjJyegT4uKB6Fmj6xP//WU98F
	OtqWprVqylC8nWn/VglJHFq6rNNYiBkSxRbIfdzNMryFOi3JsTX3bPDWCtTVBbK4
	NV1OGEjZz/zqv5KaKPl9Vtlf0lnfjkv6TLZu+4Walpnn/E6VTXdR+66SB0ws7njE
	kQ/ruB/9L83Xl+NPqstdyoPAsKfinkt5DtapFJf++agD6AaaZ41UsHQvkcRsMGHP
	oZzhXuvyKcL+YfGcDCxGq2O5GPhRJCMhw6SR1is5JUqOkjLV/Kjy3Y+b6YDaFl5S
	+B+qJaMLKPw37/TiNS68tbZ/RQtNbdqNE6LO1MDX/J4jMrTw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8m8hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 10:06:13 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 61NA6CoN028416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 10:06:12 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 23 Feb 2026 02:06:09 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_mdalam@quicinc.com>
Subject: [PATCH v5 0/6] Add QPIC SPI NAND support for IPQ5424 and IPQ5332 platforms
Date: Mon, 23 Feb 2026 15:35:46 +0530
Message-ID: <20260223100552.1050303-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UUVLzVuR2JGOi6ady2u1lkbouXSpXt6B
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c2695 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TQ69iSlqDmPYr9GvtBUA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UUVLzVuR2JGOi6ady2u1lkbouXSpXt6B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NiBTYWx0ZWRfX2RYCPdyIQXEJ
 Z3mUtTMKi+eSi0c5EYHwzhi6vGTYvO9okhxxoZus4S28a+LS7jSfDEgyZjxChU8zh3dyZFoyGHx
 x8bJHGKcc8OnpNSe9qaroAjx7XXnvoFMqYP//7gOtdWHPWes3DZDCFQVxw0D27mGnWQ7+AEABZj
 oezvTEx3bzszumFJD/lNy+ZycUdaLdPbkx9Iw+WZAJrZqTE/lFdIE3m7wND0NZ7rn4BIqHcB0nJ
 HkVDiqgs/+RYG1mKZ7dbJJNMje5C0qxI8+C9wkO0O9VCqBi76Y0/KLqabc1ogF9KE1kTP2DmFOC
 7OdoQ1HYl/yt8SeB4vEx/qnvVHUZheUPFj6yFoLFgP9EyeYLM2XIDkTIcypc7TKL7QWv277sbOd
 1GPtEu11rjIMW/J8hqYLAbVE2/ckvgzjVnunt04egGx9WQ6SaE989/WMn3rzqqeEuXwSFeG8gsv
 C3QjvWXYydmjO9LECrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[quic_mdalam@quicinc.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-93644-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,quicinc.com:mid,quicinc.com:dkim]
X-Rspamd-Queue-Id: 2B794174801
X-Rspamd-Action: no action

From: Md Sadre Alam <mdalam@qti.qualcomm.com>

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

Md Sadre Alam (6):
  arm64: dts: qcom: ipq5424: Add QPIC SPI NAND controller support
  arm64: dts: qcom: ipq5332: Add QPIC SPI NAND controller support
  arm64: dts: qcom: ipq5424-rdp466: Enable QPIC SPI NAND support
  arm64: dts: qcom: pq5332-rdp-common: Enable QPIC SPI NAND support
  arm64: dts: qcom: ipq5424-rdp466: Remove eMMC support
  arm64: dts: qcom: ipq5332-rdp442: Remove eMMC support

 .../boot/dts/qcom/ipq5332-rdp-common.dtsi     | 44 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts   | 34 --------------
 arch/arm64/boot/dts/qcom/ipq5332.dtsi         | 33 ++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts   | 44 ++++++++++++-------
 arch/arm64/boot/dts/qcom/ipq5424.dtsi         | 33 ++++++++++++++
 5 files changed, 139 insertions(+), 49 deletions(-)

-- 
2.34.1


