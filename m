Return-Path: <linux-arm-msm+bounces-24060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C16915C13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 04:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A80C1C214F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 02:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0473C3308A;
	Tue, 25 Jun 2024 02:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o9bhcA56"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A4F1CA87;
	Tue, 25 Jun 2024 02:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719281573; cv=none; b=elZgZPkButgBb6Iekc4WW9GoXyTq7DplTrVuDP6Ft+3ihke2EkOFDpgzNvaoJxxJaw7OrUsUG2XNmLqT0tbSv/x76Qf886sU8dGCJNiOYynE0KDa+TbbDZoD3jMFRbdPoJKwo8rWY7SRjk+jlerEsTeH3EOX4dRPnZpobZvUdP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719281573; c=relaxed/simple;
	bh=zEb+7jUTnpPDgL8XOtInDEisCizA4EONVseNOeyk4jo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kDLcgyWgqgMjPisOKBCS9rwDHKhdW4ncKalabgDxqJud8JJJEdxQnpiLFoUFwOV3BHIiyGgGy+1JnjndZ1ELPvAm8nMFK6iM1qsFquOb+sWof2g0SkM0tA8yLvnRZUOtvZPHiahesiYzlBAFkkehDQ0XJlu/qTFhqHT7FHBbSYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o9bhcA56; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OIfuTA031942;
	Tue, 25 Jun 2024 02:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dbZHrYJd/1iSj/Un5JYJPB
	/0IbbBuVdpQP3hqoiLc4M=; b=o9bhcA56LZdCx2/9/oUH8mcDwC/dCpY6U7BWyS
	NU12yebrNsEe6U75zbgSKdaHRNOF6HReKqInak/lk6a+gxKmQNc4vEphoXYqcfnm
	9zn+tqzKxrRJCE+YBuOmE7gTT/KMaNnhdylCbXscKlF1EllMVYh79dkg7ylAgbGl
	9upIO2ELMuvceTeRQcS4jzIzeG7idGGdkzhlLo+c4xmUagU966ytwt6+39O78bhO
	QEWxLX93xFcVP0wExlSJf3XOtF9KLXqZ1iK5YwoSu+0C7XsxkX/lamcldnFj+CAN
	aQM0YBnGU+CdhE/VB3ljmMy+x740jYIrBxkp93LVKAOvn9Kg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywppv53g2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 02:12:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45P2Ca9K016792
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 02:12:36 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Jun 2024 19:12:29 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Song Chai
	<quic_songchai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <andersson@kernel.org>,
        <quic_yijiyang@quicinc.com>, <quic_yuanjiey@quicinc.com>,
        <quic_liuxin@quicinc.com>, <quic_yanzl@quicinc.com>,
        <quic_xinlon@quicinc.com>, <quic_xueqnie@quicinc.com>,
        <quic_sijiwu@quicinc.com>
Subject: [PATCH] Coresight: Set correct cs_mode for TPDM to fix disable issue
Date: Tue, 25 Jun 2024 10:12:12 +0800
Message-ID: <20240625021212.1443304-1-quic_jiegan@quicinc.com>
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
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TWm0AB9-P3ksuzcce7YIaMuRuSK0qjc9
X-Proofpoint-ORIG-GUID: TWm0AB9-P3ksuzcce7YIaMuRuSK0qjc9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_22,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406250016

The coresight_disable_source_sysfs function should verify the
mode of the coresight device before disabling the source.
However, the mode for the TPDM device is always set to
CS_MODE_DISABLED, resulting in the check consistently failing.
As a result, TPDM cannot be properly disabled.

To fix the issue:
Configure CS_MODE_SYSFS/CS_MODE_PERF during the enablement of TPDM.
Configure CS_MODE_DISABLED during the disablement of TPDM.

Fixes: 1f5149c7751c("coresight: Move all sysfs code to sysfs file")
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tpdm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index a9708ab0d488..90a5105f6199 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -449,6 +449,11 @@ static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
 		return -EBUSY;
 	}
 
+	if (!coresight_take_mode(csdev, mode)) {
+		spin_unlock(&drvdata->spinlock);
+		return -EBUSY;
+	}
+
 	__tpdm_enable(drvdata);
 	drvdata->enable = true;
 	spin_unlock(&drvdata->spinlock);
@@ -506,6 +511,7 @@ static void tpdm_disable(struct coresight_device *csdev,
 	}
 
 	__tpdm_disable(drvdata);
+	coresight_set_mode(csdev, CS_MODE_DISABLED);
 	drvdata->enable = false;
 	spin_unlock(&drvdata->spinlock);
 
-- 
2.34.1


