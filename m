Return-Path: <linux-arm-msm+bounces-29160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 987829590CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 01:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F2FA1F22A71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 23:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED371C8247;
	Tue, 20 Aug 2024 22:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TWSCSWOT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB531C8243;
	Tue, 20 Aug 2024 22:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724194784; cv=none; b=U72RSC+7NNDt1D+FraHApV1roRS3zWUwPugJUfvhUraG42YzrQnkJXX4uhJREN8N52vK6YoKoKLYv+A+hK5FhJM24a8pV9M2jeCbbT8ElPveF8RSgk3jMvcuvsAtWOUlMdglzXerikBphkstYrFQXS3MOZOAH5Y79ofC/KdYxrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724194784; c=relaxed/simple;
	bh=bML7UejNogTzkz0J+62PdZNJEfYCSTlqq+Fy3vj1oxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=KpiU9Jbtq+7E/IgpmbOZ9pCHWFWtrQJcxp8kKRwzm3lRZYSnHy/+y6kMZDfxmXHqd4Hv9adt2yK4CWefjcjv6Ejxk5MUvd/6U7YTHJlubVLfe9oC70eq2yC5L/+pvN0mEtkyJF6ztS5EPyW/iAw185GYG27sX5QfU9AzZ0cJXtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TWSCSWOT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KKxtii011258;
	Tue, 20 Aug 2024 22:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=00lWBI3RyXQzOxUx9tvQ1q
	ImMzQfzV+Iioah34uThe8=; b=TWSCSWOTVuZ65FzrcN74crtEC6uGjuyKGw0OHO
	JoeXZuB4X1Kdm4HJBQYXS8CrHa26ZkOzQxv7fpxf+YHXGTAc1kSLLhF4f1qNCFUV
	g7ENZxKBPv29lfmT7CH1MIBCQi0ELje5LgxoKv+42nE21Y92FaA0GhnkKyr9DRvU
	DU9Gil3CubUnhYgPYxJH17uSQFjYPOdNX216YJNfbosLsxHAxGYemNsJV5GM95dQ
	cGPCu278uPaev+F94n2SouyjAiHb0Q0f7HNrrdpisrLyJqmAvEYeGHLoGfxzv6UW
	86x4zftS3UFQbGrsGDt8YImsSlqL1Zi6xID5U7kyR/2Y/e1Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414j57349u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 22:59:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47KMxaEO003705
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 22:59:36 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 Aug 2024 15:59:35 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
Date: Tue, 20 Aug 2024 15:59:34 -0700
Subject: [PATCH] soc: qcom: pd-mapper: Fix singleton refcount
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240820-pd-mapper-refcount-fix-v1-1-03ea65c0309b@quicinc.com>
X-B4-Tracking: v=1; b=H4sIANUfxWYC/x2MQQqAIBAAvyJ7bmETCesr0UF0qz1kohVB9Pek4
 zDMPFA4CxcY1AOZLymyxwpto8CvLi6MEiqDJm3IasIUcHMpccbMs9/PeOAsNxoyQfcUOttZqHG
 qVu5/PE7v+wGzGkZ3aAAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Bjorn
 Andersson" <quic_bjorande@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724194775; l=1658;
 i=quic_bjorande@quicinc.com; s=20230915; h=from:subject:message-id;
 bh=bML7UejNogTzkz0J+62PdZNJEfYCSTlqq+Fy3vj1oxU=;
 b=jNk32L61hAXI6VKVJGw7FAUUe7ME9pzbH2yEAhNV58x3fQJ8hFkIXcQI4/vEILQrl+gfH6Km+
 X2ckEtRxKOeAxssvJZ6JN0xT0WPF4FW0KtgvpowXgTRtH6XeQktAV8i
X-Developer-Key: i=quic_bjorande@quicinc.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ng0cC7QklCMeTTvwzLjXQlS9uGApLTaI
X-Proofpoint-GUID: ng0cC7QklCMeTTvwzLjXQlS9uGApLTaI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_17,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=953
 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200168

The Qualcomm pd-mapper is a refcounted singleton, but the refcount is
never incremented, which means the as soon as any remoteproc instance
stops the count will hit 0.

At this point the pd-mapper QMI service is stopped, leaving firmware
without access to the PD information. Stopping any other remoteproc
instances will result in a use-after-free, which best case manifest
itself as a refcount underflow:

  refcount_t: underflow; use-after-free.
  WARNING: CPU: 1 PID: 354 at lib/refcount.c:87 refcount_dec_and_mutex_lock+0xc4/0x148
  ...
  Call trace:
   refcount_dec_and_mutex_lock+0xc4/0x148
   qcom_pdm_remove+0x40/0x118 [qcom_pd_mapper]
   ...

Fix this by incrementing the refcount, so that the pd-mapper is only
torn down when the last remoteproc stops, as intended.

Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index a4c007080665..d6ddf71e83bb 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -635,6 +635,8 @@ static int qcom_pdm_probe(struct auxiliary_device *auxdev,
 			ret = PTR_ERR(data);
 		else
 			__qcom_pdm_data = data;
+	} else {
+		refcount_inc(&__qcom_pdm_data->refcnt);
 	}
 
 	auxiliary_set_drvdata(auxdev, __qcom_pdm_data);

---
base-commit: 47ac09b91befbb6a235ab620c32af719f8208399
change-id: 20240820-pd-mapper-refcount-fix-404d290d6868

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>


