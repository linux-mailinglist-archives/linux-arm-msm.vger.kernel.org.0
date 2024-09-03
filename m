Return-Path: <linux-arm-msm+bounces-30518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF341969D52
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 14:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC2CB284F48
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 12:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F661C9867;
	Tue,  3 Sep 2024 12:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OH9uUOac"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0050043AD2;
	Tue,  3 Sep 2024 12:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725365965; cv=none; b=ndCNJ9uU1Xf7wGiLDMFkesye8HDB1bZFj07PlvvUpSzdHcQThk1myaA/klzDhbaAGn/mFi/Q+dMNdqbzrEKj104LZV/XZXpaQiCw6/5DlQHxgbqtpR8FnS36ldvCXDoTfr56RcD+fEudtuasVA5QI+4qgZXvEmBOyW9z0xhhwZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725365965; c=relaxed/simple;
	bh=gbo4/mKMeubqUqqbz7EHAAgwwQpeWtNwbPSYqPjugXU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pmbJjP8LjmwM/aSNmp83qumY7giiEnXdEjVmguphajdVGNZaVbKsx+jDKno5KO5HxGbwOkyxLH9D6YCY4oMkU1i8pn8pum6oajNUBFttzKzFtfak2IthTj7NVw0ncEmW/GjLstigM3DQ7WavbcafZ1sbY9WlG9I3u0G3P6lh+LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OH9uUOac; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483AjBI9012531;
	Tue, 3 Sep 2024 12:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UouSdmp5vW+k5kiV/tZDag
	Bl9X6H399ALSapGOwQMZc=; b=OH9uUOac/s7hgTtOkJaHBtKU2DaNyGBZFMFKUm
	Gw3cCRyGqm5mY0TWlcTrHqrVsn4OX5nmmNpNQ/AjBM3iS3zgSwnEFgD0Y9Nxf0XE
	5hU/D0qNiNX5rM6R/pDXtJKOv4V9FSVFejOtR4EJl9lcxEcD62/JFjQem1Jh5pSd
	yhtpyhvjN6D56VCWTUcmJN5v1OD/OApOuCofn89G0ttMyHtOmLtBSoUPOMspEIDA
	7/PQ1cDvJRDVO+mzCyGpgrUzBHJ2tIRReylkVEuns0m9K4HcaKhu9JS9J7vO9pdC
	6Vd1v/+LCWNtGpWv08ympGN3lo/xGmuJqlDxNRBiISSxKUFQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bu8uq9ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 12:19:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483CIwqN002058
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 12:18:58 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Sep 2024 05:18:58 -0700
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
Subject: [PATCH v1 0/2] Add Qualcomm extended CTI support
Date: Tue, 3 Sep 2024 05:18:42 -0700
Message-ID: <20240903121847.6964-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AqGtn_e045D5jgcicJXXHca7hQvTM6S3
X-Proofpoint-GUID: AqGtn_e045D5jgcicJXXHca7hQvTM6S3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 mlxscore=0 spamscore=0
 mlxlogscore=875 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030099

The QCOM extended CTI is a heavily parameterized version of ARM’s CSCTI.
It allows a debugger to send to trigger events to a processor or to send
a trigger event to one or more processors when a trigger event occurs on
another processor on the same SoC, or even between SoCs.

QCOM extended CTI supports up to 128 triggers. And some of the register
offsets are changed.

The commands to configure CTI triggers are the same as ARM's CTI.

Mao Jinlong (2):
  dt-bindings: arm: Add Qualcomm extended CTI
  coresight: cti: Add Qualcomm extended CTI support

 .../bindings/arm/arm,coresight-cti.yaml       |  14 ++
 .../hwtracing/coresight/coresight-cti-core.c  |  75 +++++++----
 .../coresight/coresight-cti-platform.c        |  16 ++-
 .../hwtracing/coresight/coresight-cti-sysfs.c | 124 ++++++++++++++----
 drivers/hwtracing/coresight/coresight-cti.h   | 123 +++++++++++------
 5 files changed, 253 insertions(+), 99 deletions(-)

-- 
2.41.0


