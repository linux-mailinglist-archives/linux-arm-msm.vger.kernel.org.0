Return-Path: <linux-arm-msm+bounces-29241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D919895ADC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 08:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17FBF1C21F18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 06:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C0813AA2D;
	Thu, 22 Aug 2024 06:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A5xMEu8/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5642E249F9;
	Thu, 22 Aug 2024 06:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724308912; cv=none; b=X/LYEKoqEYIyEFLtUG4CcvEMtvmw810CiaFWu+jKtHZhSTsb3p80u6d7ldA8LsP7V3TlJwaNg2oNAI/3anjJzvqoyfXTuoIBo5P/raobTnWQ2lpBuDEsEfs212qw4k6ZcJ5sE3u/cd0Ho6ZKrzLky8Edmsxk+qzuLJrwMozfw6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724308912; c=relaxed/simple;
	bh=iPAOLNOP6LMnIzd5wwekKibhxBQHyyMqLFxS6fN+170=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mAz7ce3Z8d0/R4HLuCHqFF+bsnA6sSyQfV4ztPgTx9qX8hZMdRlwkBn0jaqPv2KBTZIGroYnbpaCGY8+PMAaVIMR2r9RqXdsqyxjmp1nUCk9DOPVJEns82sx79Ck1Qg7iv8TgISL5w1zSTbeCxmix+axP5T7MbBryLPGTtukqVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A5xMEu8/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47M12tSl029841;
	Thu, 22 Aug 2024 06:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cPsSDc05vJNyd5jGdAXJw/
	wtBIRDF0IF2ojWa6OVQMY=; b=A5xMEu8/BeVcBar4rXe4pTHliXBseIpHcy7vWm
	lZ2N+uJlQr7qMMRH+53mp8yot4E9oFjE3H6+rYLkB9nHUpdl+tBH08KeUL7a/4Ck
	XMOMrecm93HYFZNm11VDwCZJkQUF2kNDUexSrTu0sGqbImSj9va+B+yVOoU0mMS8
	Bj3AV4vbQLaTSTkYouMUY2oeWDvx0LsYcrgo4QjLdDppO2u1s2NEUYTs4vlVWBqs
	f2FHu0MvLCiw2YjR4WGgCWglf0yUslczeGT1WP1ab8MA7HsOFaODw0jhNR5fk4bS
	iGS67uy7l2f7Yckd3CYKptcNxlGy0B/qJ8dDaIsm+P9mlzIA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4159adc15y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 06:41:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47M6fc0s004432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 06:41:38 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 21 Aug 2024 23:41:38 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3 0/2] coresight: Add remote etm support
Date: Wed, 21 Aug 2024 23:41:17 -0700
Message-ID: <20240822064122.5231-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O4Sawh-vo2tGcFAsihrbCvhLdBPpPTst
X-Proofpoint-ORIG-GUID: O4Sawh-vo2tGcFAsihrbCvhLdBPpPTst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_03,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=957
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408220048

The system on chip (SoC) consists of main APSS(Applications processor
subsytem) and additional processors like modem, lpass. There is
coresight-etm driver for etm trace of APSS. Coresight remote etm driver
is for enabling and disabling the etm trace of remote processors.
It uses QMI interface to communicate with remote processors' software
and uses coresight framework to configure the connection from remote
etm source to TMC sinks.

Example to capture the remote etm trace:

Enable source:
echo 1 > /sys/bus/coresight/devices/tmc_etf0/enable_sink
echo 1 > /sys/bus/coresight/devices/remote_etm0/enable_source

Capture the trace:
cat /dev/tmc_etf0 > /data/remote_etm.bin

Disable source:
echo 0 > /sys/bus/coresight/devices/remote_etm0/enable_source

Change since V2:
1. Change qcom,inst-id to qcom,qmi-id
2. Fix the error in code for type of remote_etm_remove
3. Depend on QMI helper in Kconfig

Changes since V1:
1. Remove unused content
2. Use CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS as remote etm source type.
3. Use enabled instead of enable in driver data.
4. Validate instance id value where it's read from the DT.

Mao Jinlong (2):
  dt-bindings: arm: Add qcom,qmi-id for remote etm
  coresight: Add remote etm support

 .../arm/qcom,coresight-remote-etm.yaml        |  10 +
 drivers/hwtracing/coresight/Kconfig           |  13 +
 drivers/hwtracing/coresight/Makefile          |   1 +
 drivers/hwtracing/coresight/coresight-qmi.h   |  89 +++++
 .../coresight/coresight-remote-etm.c          | 307 ++++++++++++++++++
 5 files changed, 420 insertions(+)
 create mode 100644 drivers/hwtracing/coresight/coresight-qmi.h
 create mode 100644 drivers/hwtracing/coresight/coresight-remote-etm.c

-- 
2.41.0


