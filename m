Return-Path: <linux-arm-msm+bounces-62152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F95AE5C70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 08:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53F173A5CD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 06:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C18231842;
	Tue, 24 Jun 2025 06:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iiNcGhzM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CD1242D68
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745097; cv=none; b=jhFk9jFhgwZMzldTeA/Iiw9dc02ELelA8+0pVbVPpdRmJOSCvQh+74H9TvpZrkDeCmxUpTtLobj9IBX7EQuPdq4ahcz7NIm5Ygg8b71K6E7NAHiv+hnlgPcFr3F1rf3/kCaliqdn0vtir0WXhtwVxJEcaZ52MrpRPn1DmAUk2BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745097; c=relaxed/simple;
	bh=klaYK/ndNGf2Zd+yYu/jis1akITo3BCwGWiGHVFp7+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KVNZs8SEYtIBjYCQFwMN5vHYGMKS2XB9+XVNlA9hVft1+LLVBzMgIi0efhyrDl9bJxTBpHxcxKriWuKtHnkmaLSkfN0rybKDz1kYxIT2wZV+YZQT+AalyUHJCZzjASNf+78fzSx8lODU3CdA+4sC707upmScWEf+nrlS2fO7Uww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iiNcGhzM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKkonc007072
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NEd0bdzHNq+
	BYGf2pvWM9XNZngsnetWAYruQNmk3PFE=; b=iiNcGhzMZ8TS0FOfsVcLD+w+QEb
	bYnUIlEVPMnkQer7sJIXA/g4O3nAMq+vRVN2LfghQvBn0D+V0Zj3E7t+jsD5L3Pw
	Mv5mgFPXD2sGGEYcySuu1SIo+WIk6O5FyOftob7y+yc3XIoIV/wtGWETsrbF+iH9
	+fQOKeRD03d8SAngv2gMGTikDy92vbeX9NCe+oSRtNLTI+DXgdKPRVk7UppuKmuQ
	7/u9PFP2g9Qs6gkrw9JKlvS4fWiDKIC0l6JlyRZHjXwZhQQN/yhtGv8cshH7zQGP
	CAYMjFSfK4Fxh7Q0ILpchN5fcp/L0YqnQU+ckd0afAfRKS/Mk47OLq0PsWw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f7ttt5mc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:04:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235c897d378so661225ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 23:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745093; x=1751349893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEd0bdzHNq+BYGf2pvWM9XNZngsnetWAYruQNmk3PFE=;
        b=uJUCXptEnpxeivb5KRVVbhUZtSim/mED2qSVQL8oc9aD4smeAEuKx89ZRlQD8Wtaea
         zGOkTgZdd8TUsnNoiCs3vNxGcK7VZEDWeVZefD83ceM2M9vFWfLSG4t5gm+ppcEqCwco
         aV90T7LRL1TWOSNk5fd96zzWkYWAt1Fr96gaXcN0yBf+2ZiD1graW0f9BsfJCNXOtVu+
         H6XnxqNoTc77XuXh0Wf6JJxPhJ+bNLYNASKMfvOlniyxPzNoym0raZnMoysSCKR7baET
         7I/CJfEgi3g2LGIaZts/f1PK6CS9mZCsmtYDtjmpqwM4ROyOPqPiWjYtxCtKtd4VKneU
         4TVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBCTPi4+dT1Dya8KdoMOD01IIVmHiqjQSMNatA8qK+eWK0sRvMPRXtd8mvVCaie82ZVFZx0Uw2x4NtSETf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw9MlvuX6RRITNqZK2h/8uDcRXnHlfnqd23/2IbQLpsD5w+C91
	2hJiGp9m2UoNPQhfFSYi8hF5XSEDIwIn9QLzyh3exPkEDFp/atiDMlI3RcVN9LxhqLRl7Conc2F
	thYsbjGr2ILEWnifQqStbTgKM9qsxL+lTcWi80GkEEvvSHT3op+XwUh3yZnbtjqOXy4rR
X-Gm-Gg: ASbGncuXGPPzNcGHo23B23mwJ/xL/KHA4tXzx17Z6PCETJDTcxo0eIkhLLJ9XxtQMO0
	fM629lcmwtRbTYvxRRFTfwX7Ms/T/DQwGhsnaI3agOUX71uzpGGpJhncwEkMfn/hzFk3UK9QhOi
	KqgUor061S8c7xk9gnyqso3gInXyIrvys8Vf2aGy4IGHdFxCEbvq6DnqTGRpj//1/3xytZvdzTN
	i0zWlN1QndaOswbTcuMYV0zxBVF6vg1STEIS/S6r+JHISHkwrZREUYo/i5rXINWY5DliRTnrxlO
	0qzJ0FmeC0iXrZdAY9poeyBwxDQ8vHHF3hq1hLTGCGC4aBD4aRWGgoBmEOuGKmNm/X/d22J+BvG
	8cQ==
X-Received: by 2002:a17:903:2a85:b0:235:eb8d:7fff with SMTP id d9443c01a7336-237d986d5f7mr223070765ad.28.1750745093288;
        Mon, 23 Jun 2025 23:04:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoXzDNPCywsWid/86csyo6/oaM8zIDmOlMe4ad7FzFQmavchj+MmL8XVQyf1Oz3B2TnpP03w==
X-Received: by 2002:a17:903:2a85:b0:235:eb8d:7fff with SMTP id d9443c01a7336-237d986d5f7mr223070365ad.28.1750745092828;
        Mon, 23 Jun 2025 23:04:52 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:04:52 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v3 02/10] coresight: core: add a new API to retrieve the helper device
Date: Tue, 24 Jun 2025 14:04:30 +0800
Message-Id: <20250624060438.7469-3-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QINoRhLL c=1 sm=1 tr=0 ts=685a4006 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Bv2r1u00ER1ubdDhqu4A:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 8qYXMsK1eFUsiD02jN6QgXwu5CPC-F7w
X-Proofpoint-GUID: 8qYXMsK1eFUsiD02jN6QgXwu5CPC-F7w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MCBTYWx0ZWRfX0hT2d9Q11O7Q
 YgBzptyt6p+V5G05kJT286Krtm6PZdmLXqZlOSVRM61Oi94KMO/VOR4LLB1tAD9nWUQaNrBbbI8
 yK7YjmTuIkcvWTKes0z7Kmb8H/zfNvjZnIfVRd2zXDcDISu/onH/30jSf/QUzlw9hNhLWFY2vU5
 kgUlblCF5LtkjwsWeDYEOE/M5NHZiQ6bjtBwY1OHe94nhXXua+yEcC0ev0PhWSJj/K7FiPxwA0J
 vFPJexF1NBfzFg0fXtEk4kxC/560tk4SVwVNzCn9tCHze7Lk555RV8NFEAXXLcoH7Y7kUFw5kl9
 i8IH2ErKDZezgAaz90PsBzU/C2xAccFIYpAZXdjHZKW41Hi8NH95lQ1mGu2u7KS7O2rc4KE91De
 fkXeJtM+86wsWYlVWjjvZlf2nJr8jjOQRs1wEGEY5QhuMUTYoGP6ygR8jaaiRncl8XGR1QXf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240050

Retrieving the helper device of the specific coresight device based on
its helper_subtype because a single coresight device may has multiple types
of the helper devices.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 30 ++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-priv.h |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 8aad2823e28a..c785f8e86777 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -579,6 +579,36 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_helper: find the helper device of the assigned csdev.
+ *
+ * @csdev: The csdev the helper device is conntected to.
+ * @type:  helper_subtype of the expected helper device.
+ *
+ * Retrieve the helper device for the specific csdev based on its
+ * helper_subtype.
+ *
+ * Return: the helper's csdev upon success or NULL for fail.
+ */
+struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
+					      int type)
+{
+	int i;
+	struct coresight_device *helper;
+
+	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
+		helper = csdev->pdata->out_conns[i]->dest_dev;
+		if (!helper || !coresight_is_helper(helper))
+			continue;
+
+		if (helper->subtype.helper_subtype == type)
+			return helper;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_helper);
+
 /**
  * coresight_get_port_helper: get the in-port number of the helper device
  * that is connected to the csdev.
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 07a5f03de81d..5b912eb60401 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -158,6 +158,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
 int coresight_get_port_helper(struct coresight_device *csdev,
 			      struct coresight_device *helper);
+struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
+					      int type);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);
-- 
2.34.1


