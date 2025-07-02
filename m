Return-Path: <linux-arm-msm+bounces-63325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 002C9AF0DDA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 10:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 152274859D7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 08:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B533D238C33;
	Wed,  2 Jul 2025 08:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZqDN41Ac"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1521D236454;
	Wed,  2 Jul 2025 08:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751444629; cv=none; b=htABGpgG/bzMiiFlNz+jhlRf5shfG4N1tjxFmPyczgSoPrGoZbyri6CYND/IaQ8crIgRk9VYEHjmjK608UuGUzXvCXm4LqriYk+8r9qQdJZ524pUvCmvhs7Ap8GlG8Svq2YW3cqbZR1hI3gCI598h57mS5lmcYCWBj7huIB+kko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751444629; c=relaxed/simple;
	bh=TnTZWQEv6aP07Li4wv89brHGE/hSleLFrq/Arjw54G4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UotI4bw0LtM+IntDxsNj+4tv0VjES2uS9EFKJJQFuBfDji1Mjvfv8jfgs2RMed60eF9LxnJoRfSGHGHCOYJuNkZW86p+Q9W3YgOIHX9G+fLIRw09BJTuNPaAgrxiCiShfVHAXl2f/RLyXnWCJg10cWgyk44o5LbQuCGBUcNIBqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZqDN41Ac; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5626OQI4025163;
	Wed, 2 Jul 2025 08:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vpHjl/i8yfCIVgLeheCx4j
	GxJihPaQqVDQpuy+Ffza4=; b=ZqDN41AcEV5Skw8K96ChoWwEp4hKuYOxhQpPGT
	v/43SVjKNA6Rqwwjc+c9r7WYaGdqLLeFGF1Ahd12XQXLOOrgv5+PHqYiV6zQWsrn
	dBwwQfvitPm0VNsuczZXn+tiqOZjnYdFjptA7jgKoCJw2ymvbjD4L2VvoVO471tX
	MTLfncrfiC5W7P+FR0QvZvjkBYxXAPe81vPRYc3EKNz4I5t8yutAn0Msu9iVGTQ0
	d2eNcBKpBxkAyPPPXaJA3uuV+f4maIGxGkKcgIANogM0/VTVoAGXvQdgUIcAzbHk
	zMWmgb7jOPE2pjy8E1YZzGlw4aARkHaXmf9Sw5/Tv8sZn5kg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64s0f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 08:23:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5628NXdr024434
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 08:23:33 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 2 Jul 2025 01:23:29 -0700
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: <amitk@kernel.org>, <daniel.lezcano@linaro.org>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>,
        Gaurav Kohli
	<quic_gkohli@quicinc.com>
Subject: [PATCH v6 0/2] Enable TSENS and thermal zone for QCS615 SoC 
Date: Wed, 2 Jul 2025 13:53:09 +0530
Message-ID: <20250702082311.4123461-1-quic_gkohli@quicinc.com>
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
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6864ec86 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=JfOcGDDDXtGUpYJnmSUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA2NyBTYWx0ZWRfX821RtU3edJGM
 iFjWHWKTK0KQn5xIM5aEBOuIPuQ/tyTQJze5SbTIQRxWarPiqUcUNa2qu7cYYWSl5JmJaZlnoky
 urGVmZl/wP7/HpIoTknJqOFrPGPd8dijL4w+Jy5TpA6qSBf0Z+Ms1HCuUQlOmFsMKJHUJWF2ts3
 RDHGZEIOPr5KGA9bc7pkpljwq8A8IYLcelUuYJasLHGKO8McF49gPfUgmvfuns76TknCsbzCaKB
 X/hZz3+Q34cCBgsX2+XKuMnqLacVw1GDOMLUDF9n3I1qAHsOfPXjI8VywtutMOBf1OmqpK857U9
 gUYTtDfvf1FS4ZPgwJ3a4+m/PX0Lm1JR1wIwu0sPPGnkvNOPkxPddzASHds3rxyoI7yCtKTsYz4
 zGjA+wQy6Q23z+k1aOW/L185vf3so5KqFGXjBDwlpQbJYP4U7OHlz3VD3aC541IsvOc3lfj1
X-Proofpoint-GUID: xcx_5chvyHZXVRPvUJghoYg0KHTmCkvf
X-Proofpoint-ORIG-GUID: xcx_5chvyHZXVRPvUJghoYg0KHTmCkvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=954
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020067

Adding compatible string in TSENS dt-bindings, device node
for TSENS controller and Thermal zone support.

---
Changes in v6:
- Fix thermal sensor dt alignment issues.
- Link to v5: https://lore.kernel.org/linux-devicetree/20250625043626.2743155-1-quic_gkohli@quicinc.com/

Changes in v5:
- Fix git patch edit error.
- Link to v4: https://lore.kernel.org/linux-devicetree/20250624064945.764245-1-quic_gkohli@quicinc.com/

Changes in v4:
- Fix naming of thermal sensor.
- Link to v3: https://lore.kernel.org/linux-devicetree/20250613112402.2203617-1-quic_gkohli@quicinc.com/

Changes in v3:
- Add critical for all trips.
- Link to v2: https://lore.kernel.org/linux-devicetree/cover.1744955863.git.gkohli@qti.qualcomm.com/

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
 arch/arm64/boot/dts/qcom/qcs615.dtsi          | 205 ++++++++++++++++++
 2 files changed, 206 insertions(+)

-- 
2.34.1


