Return-Path: <linux-arm-msm+bounces-37055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C52629BCCE1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 13:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 887C9281A60
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 12:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84FE1D5AA8;
	Tue,  5 Nov 2024 12:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BtAsYMZ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243041D47DC;
	Tue,  5 Nov 2024 12:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730810413; cv=none; b=OZGTFQToj/iVt4coL4PbIoOICTub/Co5QarADY0gGvJMDU9BpzyuJ5oWsiGejfqwYrPqg9uPl7TgDJdV7J94dO5V0yyNz/Ypo/MhtmwMLTtqjgF9yacOZ8TIouCK9EQ0WhrUpcnWcICqu/h2U/KoKA1n+jCjAbmejCb4qcd9LBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730810413; c=relaxed/simple;
	bh=mo3pK/uRf4nosDj+nZOCxXszbKAL/k6c6AlUOfiipLo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ecuJriNQxhk0FF0kB1qksN0Xx1wslEphY3/O6KFF6tKripo4VCjdM0VitMYijfhmTEYgGLWyJ2PJQIw+S8uBwIw5BzaZmy2Urz3PO7g5SJN6Y04kqp43vJsXaHE64VXKKtaAesH7Rfc1zWG6Bd0MjJ6x0XtMSrX4KI2T0HYRBDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BtAsYMZ1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A59auqE027535;
	Tue, 5 Nov 2024 12:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=NIO7QJxPWoJ5mekrk8Cb+rOKsbGs5KoQoleroKLnPM0=; b=Bt
	AsYMZ1GRZe2vVIudIwYH+RHiCD+m+uZcOm4PLETLa6Lw8EFurl2FAbBgRSSsipp0
	i5YO2y9rn/aUJSPDyxYSPa3cKk2RfwWh0yuKqy18WQMLME5CeMJxqMX8Kgc34uZ6
	q8ZG2TqPi2gkmDMuv1C8QFik0MnqhA0lceL2CB/mKnCABAdYIHElchL6Ocw5FAre
	SRQDnToIu7odnlwElBRBZ9q+M1imvMx0bhV+3Dz/cEtpgmsXq2/eHKGZzWx33kjM
	jXpon87yiv27sl2moMmPrhj0wjiv7UnE7CM98xnU5w8H2E2R7Bn3C1CkLTwi+b7a
	GeZ3uFpFwFA0EG+l7IVg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd8hfjvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 12:39:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5CdxwK005378
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 12:39:59 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 04:39:56 -0800
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2 0/3] Add support to configure TPDM MCMB subunit
Date: Tue, 5 Nov 2024 20:39:37 +0800
Message-ID: <20241105123940.39602-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2cG-WFxGk2XkZeBNfIlFNjADft_VvcsN
X-Proofpoint-GUID: 2cG-WFxGk2XkZeBNfIlFNjADft_VvcsN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=867 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411050097

Introduction of TPDM MCMB(Multi-lane Continuous Multi Bit) subunit
MCMB (Multi-lane CMB) is a special form of CMB dataset type. MCMB
subunit has the same number and usage of registers as CMB subunit.
Just like the CMB subunit, the MCMB subunit must be configured prior
to enablement. This series adds support for TPDM to configure the
MCMB subunit.

Once this series patches are applied properly, the new tpdm nodes for
should be observed at the tpdm path /sys/bus/coresight/devices/tpdm*
which supports MCMB subunit. All sysfs files of CMB subunit TPDM are
included in MCMB subunit TPDM. On this basis, MCMB subunit TPDM will
have new sysfs files to select and enable the lane.

Changes in V2:
1. Use tdpm_data->cmb instead of (tpdm_has_cmb_dataset(tpdm_data) ||
tpdm_has_mcmb_dataset(tpdm_data)) for cmb dataset support.
2. Embed mcmb_dataset struct into cmb struct.
3. Update the date and version in sysfs-bus-coresight-devices-tpdm

Mao Jinlong (1):
  coresight-tpdm: Add MCMB dataset support

Tao Zhang (2):
  coresight-tpdm: Add support to select lane
  coresight-tpdm: Add support to enable the lane for MCMB TPDM

 .../testing/sysfs-bus-coresight-devices-tpdm  |  15 +++
 drivers/hwtracing/coresight/coresight-tpda.c  |   7 +-
 drivers/hwtracing/coresight/coresight-tpdm.c  | 124 +++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpdm.h  |  33 +++--
 4 files changed, 158 insertions(+), 21 deletions(-)

-- 
2.17.1


