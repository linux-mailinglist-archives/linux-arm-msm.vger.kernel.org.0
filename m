Return-Path: <linux-arm-msm+bounces-60918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C927EAD4BE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 08:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6581B17953F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 06:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A1422A7E1;
	Wed, 11 Jun 2025 06:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ftqe/rp5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152EB79C0;
	Wed, 11 Jun 2025 06:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623893; cv=none; b=lHdd2sAJCDvJ0QfKxZOLGisHK++Oi7hmhd1l/FMABnrJAuHJZE+C8m7dlAVtaXmR7DAAOudSgPaXz1kM6X78Og7tohnVqmcaCvNKbPaxrLVEPOWQy2WNpw6riuLKef/VSCLBFg9NS0jI7ER+69Mlg8NuTETaQQwvEBLM8Fdi+TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623893; c=relaxed/simple;
	bh=iWPD4gQdaGUoCgTHbEJr3RtllCDL1Wr968mtkumiTaY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AJtmh4qhceyyrHgIr0HM0bKvzyMZPDGwrAKL4or56O/6GkSe6jke+Gai4Ffu3daPT7rdKxVLyXf3ivjAGkPTGmBbA4c3e16hEgVoLxWica6UHb+3AwOa/CivCrqHdN2ql6H1eh2D1JcoOgw962jq+7Ir3mJ1ZXhTLdi5RnDiPmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ftqe/rp5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIQ11I003236;
	Wed, 11 Jun 2025 06:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n/TpQKHTN8BlRf2DefMH+v
	LC4UbdBLupsVBtpU4AAZw=; b=Ftqe/rp53G86Htt6eqFz0vh/Rw1+/TTuSsjfI4
	ZSAt/ycwrSo1fbW0/AdfJdWDbSy0ktS1EfwzVgE5NGGeppadFqpdTTS2ycIiCvR+
	PXDztfFdn9ZY8W9bNqXpyKWJCYeo0ZkMXsU/oKXB6qpDrx9N0pgm6WgtyvYYwFDm
	l4GmpjmYe8IEjiOjYNxBQ/8LyYLL30my8H6G3p+6uzNzlM8Y3NLJh+BYhSdOawCy
	k4gP9W/DcF3WUnetPdFUBZ0tEurAcM7+MFpGYwpncPe3MXGp6CK6dK3J+dHu1681
	r6z/fWe93oLpuA/JFS29FVb/u/OX74VOfGv96AsPAV6ojxdw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y6s8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 06:38:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55B6c8bw018744
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 06:38:08 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Jun 2025 23:38:04 -0700
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: <amitk@kernel.org>, <daniel.lezcano@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>,
        Gaurav Kohli
	<quic_gkohli@quicinc.com>
Subject: [PATCH v2 0/2] Enable TSENS and thermal zone for QCS615 SoC
Date: Wed, 11 Jun 2025 12:07:41 +0530
Message-ID: <cover.1744955863.git.gkohli@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA1NyBTYWx0ZWRfX3Lkyetp7S6Tt
 Wdodx3zmQsSqJUl/j+CpyiIX62kk9i849w5NZZu44odMdtfn8M+r2sZvIeXag1V/l6L6EziCoa/
 PP/ehmonVDuDCSRytPmzdOmqKLcaxJaFmxzsuXfWZmT9CYbJvbeFtcB9FPoSn9OvYc3KK0LAMSI
 esRChri1DLKjyc1WXZ/v+WjwDDUluxpMMFruODhuNNik+TOE/1lHkaoi90jBh9q81Ij9tMq1085
 DKonM8VibAS3TjxZPQX6X1Xm88Cz85sS6tovqHIdgcKvqou/sx7LfKRxh3bvnKcSgl7EhvPM/eK
 PC1bMBLqMC2Zado4wqo5B2IcFTeOieZaqCagpBqmzBV49E0EWu5rnf4P2QULLeELoHwDzwImlei
 ePV9/Ke7rmiQfw/Zbu70wPVpuidgw+oboAgOXUdvCELD4tZ3PkAUeGILEXJP/vsThtO73Y+x
X-Proofpoint-GUID: Ayvc76x_75uksJ7Qty5YeWyUK8eb0sbb
X-Proofpoint-ORIG-GUID: Ayvc76x_75uksJ7Qty5YeWyUK8eb0sbb
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=68492450 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=4mZqo6zMBS7fLbI5uYcA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=743 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110057

Adding compatible string in TSENS dt-bindings, device node
for TSENS controller and Thermal zone support.

---
Changes in v2:
- Drop the passive trip point and add critical for CPU thermal zones.
- Rearrange the tsens dt node and fix the address part.
- Fix the commit subject with target name.
- Link to v1: https://lore.kernel.org/linux-devicetree/cover.1744292503.git.quic_gkohli@quicinc.com/
---
Gaurav Kohli (2):
  dt-bindings: thermal: tsens: Add QCS615 compatible
  arm64: dts: qcom: qcs615: Enable TSENS support for QCS615 SoC

 .../bindings/thermal/qcom-tsens.yaml          |   1 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi          | 217 ++++++++++++++++++
 2 files changed, 218 insertions(+)

-- 
2.34.1


