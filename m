Return-Path: <linux-arm-msm+bounces-33649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F5299640B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 10:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2B8C1F2215F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 08:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3576191F9C;
	Wed,  9 Oct 2024 08:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NCLndqVz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3644191F88;
	Wed,  9 Oct 2024 08:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463883; cv=none; b=RWcJiAZjhLpZNIPt2CcfPCfd6tljF7C9N+qyNlfjdWFcG685gpVH4h2mYjXUZVam4UORXlDVz8aSdqEXu0d2bIiVsO9bB8DSLsW7W4Hkk5GbBq0e4tOvUuDmC8gNVWfhUTaPo6SgKfEPQ66eQnmKYd2t9hu59AwNYDFvtA40jws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463883; c=relaxed/simple;
	bh=/HnnzCJ6wEWkNrBihS+8wDq66vO+4qkOhRP8R+ggjoA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AvGQTXL4zGnU9CeQ9TdUxYrmvtjTMoKb3CZZgzFXv3denk6/C7HTmvK7jTvynv+LnMJk8Hby8WJYCnKz1h+5LyvyQGMIG59VrKEW4JviTULG/+3JkDJVFTL2Y3+Uax6S2BSmhtjtHgO9tVhbr94jpLFbdVy7zxmgrsLMJYGE97c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NCLndqVz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498LWTBW006638;
	Wed, 9 Oct 2024 08:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=huXzR7MJu41/pOZVqOLXB7
	PkNl9JlOLHJ+ROg55cM54=; b=NCLndqVzdd65nxEJ+CCxxCT+3CeGyEeRl3W05T
	oc4Od/z+YeU8v8bcPRXNNm1i5d2wXAWTGpDrQo93JCxtnn96VVsNc7e3D/+6uHvj
	8u27d6ehQE4vXEzghwGnWPgCiqg55CROrJGgMvu8nDnVaj0xXU8oIvkxAou0qyUY
	Xpc92UYmqwTkk+s2EaPCCiFlwAD6526SSff64/vl19HWFMYHk2rgfQlk1GmjLn4Y
	JpPAYLojk0q6+iwulsLkRuDILkvRcjGyuyaLirPzWh1+VX01huZfOja3T7kJM5xX
	aie7/mu91sYkdtqsy7LCnQwV45xVVDl9PNeLqC8WjK2rgrDA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424cy7ep80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 08:50:56 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4998otRM004825
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 08:50:55 GMT
Received: from 3b5b8f7e4007.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 01:50:54 -0700
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
Subject: [PATCH v1] Coresight: Narrow down the matching range of tpdm
Date: Wed, 9 Oct 2024 16:50:39 +0800
Message-ID: <20241009085042.1098-1-quic_songchai@quicinc.com>
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
X-Proofpoint-ORIG-GUID: KoIKKPGSblHW05eDvaz0IsulwLo0Dxq9
X-Proofpoint-GUID: KoIKKPGSblHW05eDvaz0IsulwLo0Dxq9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1011 bulkscore=0 malwarescore=0
 mlxlogscore=956 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090057

The format of tpdm's peripheral id is 1f0exx. To avoid potential
conflicts in the future, update the .id_table's id to 0x001f0e00.
This update will narrow down the matching range and prevent incorrect
matches. For example, another component's peripheral id might be
f0e00, which would incorrectly match the old id.

Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tpdm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index b7d99e91ab84..8e2985d17549 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1308,8 +1308,8 @@ static void tpdm_remove(struct amba_device *adev)
  */
 static struct amba_id tpdm_ids[] = {
 	{
-		.id = 0x000f0e00,
-		.mask = 0x000fff00,
+		.id = 0x001f0e00,
+		.mask = 0x00ffff00,
 	},
 	{ 0, 0, NULL },
 };


