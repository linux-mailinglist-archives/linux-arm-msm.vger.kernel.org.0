Return-Path: <linux-arm-msm+bounces-20370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7CC8CDFF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 05:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1990F1C21EE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 03:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CB129CEC;
	Fri, 24 May 2024 03:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ObIrpwbw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510533A29F;
	Fri, 24 May 2024 03:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716522881; cv=none; b=Sjj2fwankmKCqrKoo+FdWV2u5yz/1nNrDLyzdz7JlcSQWKWey/b2arI/VwL54i4j/i2y/4MoBUg+o3i0/gF88peU+cr0mWruetNropXawrb32SVqYuO0bq2cvkHBur3bbOJfoz74RF7SqKEF38BJ4HAC6GIk41g5HGTMivtMhGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716522881; c=relaxed/simple;
	bh=C0B534tETcSiSi2d2a5k3Mlzf8TIAyJoW2nw7gAaT4k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eRCx+GsBqtqS8NSR8PxyvHz2PL94tIEHMe4DUbU3kcmT71ifhQ8WMPbssFgfvw+ZlX90ajb6VrCI5VLlW3+VULlb5KMJxFQhiCe1BJkE7TKZUGdv0f2iDi6R9i39JZCBx6Z91IB0fQfxOlymZKHB9NOQHPMrvPVK5a6llwB2mvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ObIrpwbw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NNQ0j9004810;
	Fri, 24 May 2024 03:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ySSQu01uxqxgU7lEYH4fWR
	ZQEzBl+iPrmYmI64On0hY=; b=ObIrpwbwHBRmemMeYJkfkM4TUNYJBIZjbHWIhQ
	PW4J0uxfoolHv2OBy50UXH03GRO83BQ7/OcGcLbA3ZJDusDSyU0UdQJpxxoIl6Oc
	ev8zUWR0q3Re8RVPU20UtoYTLI/Ol0hMbDJJFD7dlgOtx8+h/YPMpTbjfWi87TDj
	BP14zh+FJMzrduTDYiNV8YqIHG7BeFD/fnCw169Hl566CjNX00ddORqF9KsjVThE
	nl7BJISj1Hi/o0qU4pY2QcUuzcpWGuFSlApsAGhASdE2oiU+EwW1c3eO2dEYHUVd
	dsAur4jQjM8TszKYo2/s8ot41dyED4YoH/UssCd15RfAaSeQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa96h3bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 03:54:19 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44O3sIil017811
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 03:54:18 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 May 2024 20:54:13 -0700
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami
	<bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <quic_pkumpatl@quicinc.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v2 0/2] Add support for QCM6490 and QCS6490
Date: Fri, 24 May 2024 09:23:48 +0530
Message-ID: <20240524035350.3118981-1-quic_mohs@quicinc.com>
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
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FPSFftvEyQ2-wL374YQyWj1YQtph9Vv0
X-Proofpoint-ORIG-GUID: FPSFftvEyQ2-wL374YQyWj1YQtph9Vv0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_15,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxlogscore=660 spamscore=0 bulkscore=0 phishscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405240025

This patchset adds support for sound card on Qualcomm QCM6490 IDP and
QCS6490 RB3Gen2 boards.

Changes since v1:
	- Use existing sc8280xp machine driver instead of separate driver.
	- Modify qcs6490 compatible name as qcs6490-rb3gen2.

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: qcom,sm8250: Add QCM6490 snd QCS6490 sound card
  ASoC: qcom: sc8280xp: Add support for QCM6490 and QCS6490

 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
 sound/soc/qcom/sc8280xp.c                                | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.25.1


