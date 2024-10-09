Return-Path: <linux-arm-msm+bounces-33667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 546F79964D4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 11:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 859E51C20E12
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 09:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68FE188929;
	Wed,  9 Oct 2024 09:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q1VLBxCy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3593918A6BC;
	Wed,  9 Oct 2024 09:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728465476; cv=none; b=so3iXnliuauhFBqL9f0ssjMUAiKgjFNkjX7Rm9y5+vou7baLsgtLK7SXy+wfNe0RLOVzN028N58ZuUiiMAeHsgN1DnXs+bl7zQKf3K0CCe6brx4V81KcEXrssKBZwQYeDWMY+N/MVRLwbGlZ2W93R47aOkgDcFXN7YotN3AcAw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728465476; c=relaxed/simple;
	bh=Js9jBckP5Mh1h3ITIeHDzaiGv6P2dXs1sU/ZQUt4Kt0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=brwHeCwhF9CS97n8DVxR6D6Y3VZNbh1gbiNrhacuG4i8q3GpKj0uPgzlZu4IMC/qQenhtRq9PvFnVjoikLQXB4a+9mKrN3cYd+LT4mqdnJ3g5SMZJR1BCBK9PGg7MbsMVUMcXWkmV025KMAijAd9mhnKyJOHAHNgVD3q9atR3PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q1VLBxCy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49965QGZ029556;
	Wed, 9 Oct 2024 09:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Iyg6YvmHfFOAHjDa4JL9yq
	qYTUYxm1A7VZRhszd+h9w=; b=Q1VLBxCy0po6QPG0Fsb81dr43csCqQewoLhpuK
	nvFydTpR0Quu/Vw2l6C0ctiT6bubTychlb1q8Xf1UnDA250PfVsclwa+DFHoop5i
	gfm6LzRb8C5pUmtEb/3TzwhuOWeVGPgQhZd9DjIMPJBtCxOn8m1ISxAABp+DgVpn
	stMhhTEM8WgMPmVPhfX/h6ndBcIUd6t86ziXU6XrogDaH9ANrZlYtBfoqJzz/ZtU
	ugf7H5gPP+/xJ5PBuDMTh3j7jreQYv5rnvy/axm0oZv24leJ3RfgkUWDyF96LS2b
	hGSXZEdssz+fDHyyo9+bLxmni8AsHOE4jZwX+7oFCzdYJaDw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424yj0410y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 09:17:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4999Hd7V020618
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 09:17:39 GMT
Received: from 3b5b8f7e4007.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 02:17:38 -0700
From: Songwei Chai <quic_songchai@quicinc.com>
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
CC: Songwei Chai <quic_songchai@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2] Coresight: Narrow down the matching range of tpdm
Date: Wed, 9 Oct 2024 17:17:27 +0800
Message-ID: <20241009091728.1638-1-quic_songchai@quicinc.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IKrVCpdMqWnm3AQHIjltO6dVMKYBpWyP
X-Proofpoint-ORIG-GUID: IKrVCpdMqWnm3AQHIjltO6dVMKYBpWyP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=931 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090061

The format of tpdm's peripheral id is 1f0exx. To avoid potential
conflicts in the future, update the .id_table's id to 0x001f0e00.
This update will narrow down the matching range and prevent incorrect
matches. For example, another component's peripheral id might be
f0e00, which would incorrectly match the old id.

Fixes: b3c71626a9333b0b29f9921a39ce ("Coresight: Add coresight TPDM source driver")
Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tpdm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index b7d99e91ab84..3230d76aed90 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1308,8 +1308,8 @@ static void tpdm_remove(struct amba_device *adev)
  */
 static struct amba_id tpdm_ids[] = {
 	{
-		.id = 0x000f0e00,
-		.mask = 0x000fff00,
+		.id	= 0x001f0e00,
+		.mask	= 0x00ffff00,
 	},
 	{ 0, 0, NULL },
 };


