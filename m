Return-Path: <linux-arm-msm+bounces-84982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7B0CB4D7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 07:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62A943021051
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 06:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3879D1EE7B9;
	Thu, 11 Dec 2025 06:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BAHuHfzt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jeZtYhFr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E398286D70
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765433505; cv=none; b=qU6QJj7J/wC3q0xCfMMCOyr/EFnbSOSWJKLqv9uFNv0MEYgOAr8kUOPJ7C7Aavdkkec41JdLrGMMSqKjmbuh2LFM/A4m2uOvMAtmT9xVwLipK6KfvM5+g3YsbR+FPgGf9auVDNAcp8rTZ/Bs1yArT7asD97a98SNHXLU45Vc7Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765433505; c=relaxed/simple;
	bh=V1yqLgVyRYM0PUluEeNsvfvMV9kESqLqhRAs3x4U+UY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EAdVhzdPvcCNyjnS1XNn36wlGxy6kawFeqr99l6U/H1YL0sZ9lvGUIgCQvhsck62bIhuQJ9lMngstcWaS5L4Sl6qMBZDJ+b/MS6y1XjBaTV1vONMQOydS4lLbzh8yM4J/ZMlrpOEyzo84g+QOedI0jvOjNct4/tUNdOtb0bxp1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BAHuHfzt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jeZtYhFr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALR4Vj212586
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H37x9ua3ePA/7qaC/cjVE28usIUyXzLi30yOiv+YEFA=; b=BAHuHfztQk7DX8Vo
	+WTpDE6Q5vy1zofvvcra0c/15iJijCSGpOsJAmNeOs97IBaY1wMg8ZtgnVoObgtV
	wHaucBwFBmKI5O3ew3+Xj0exx6gqziM5zCsUtLWFUncqb4soIG7tzxOSY8nCy5w8
	Mrfu1k7Rh/bjr1r3Y3d3bGSPPFzv3kRwxFNeMSEMOQ84hIfZBLZIgwHUewb1RBcU
	kHdCutVvIkuJoj4pR5oxp5XC3eP1sRHYHK3owEsSPlIID1YIWy57QaUslWBQel/d
	zC9WcpZn38WrCH5peH4sz87HlgbYH9dAWOholV6BhgBeIKImPQpe+quHb6fNj4Bs
	dhwyHw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygr896tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:11:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295952a4dd6so15235505ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 22:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765433501; x=1766038301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H37x9ua3ePA/7qaC/cjVE28usIUyXzLi30yOiv+YEFA=;
        b=jeZtYhFrgWRXJZpr2N0XnyMZMqHCJnVOQHu08RzNkhbHWd4GtoTt+GFOCODDGLmErA
         WG2+GliLzWYmqtlthHBrg+cKc4P7SPQN9q0O0DR/hwT1JbLhOB1teZdoxCy7pbk2wH9y
         wexRROnjnqPgkigknUc3uXlyc32X7v/oOTRtILmdS+FeDclvEFip0BDe2FWAfdmHaCO/
         OOm7RaEnL/jd5C+lCaFub5egh9J5Om5wM56ngVI5YZdeu8Q+ZXNe11FN8aEd2oJQV2E/
         s7d5DW/NyQwNv4bET9lnJJvpJlz/9EdtA8jKKk+8VTL8RNaw+rUsFELC++zLePZkP2HC
         ql7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765433501; x=1766038301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H37x9ua3ePA/7qaC/cjVE28usIUyXzLi30yOiv+YEFA=;
        b=FNWFxZUtv7RiSrOV/s0PUtS0wRYWE2nZ95dnqYC0wihv3Sy5zImg2ybjGo0E6YNU3f
         0uDakjsAFif6BgSUrgczUMlGwEo+olcpOwghyUSlO/xX6vMKWA2c0LanCL/QFaudvTsn
         LRPTsoZ7j+E/CJzmY6/4aIF1MnjJOkM9nvUu5XD0hbmuyw+Wpj8z4K81gabo3vu4jyIj
         4dwz/8EG+nnN1Su6+CkqFw9YFAvbO7Tpcwk2q2o6o8iXFu5/ZoBo2oaG5e4VuNsPGw4C
         Q6z9rAC2o3Ox3jvkmbXlHH6+X0J8fylsCaeAwtNqNfNRWpmL9224W9rWwribiZUybCKo
         MaXA==
X-Forwarded-Encrypted: i=1; AJvYcCVNQ0Q8TLBt/j/23GhPb036SCcfHbQ5YKuWjt/X2lyD6DsSA2xBNBWBsqYhsXLUAy8bRbbn6vjw/Fh0O4K/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5q6B8L3sFErAaVpbetJpdG4WxXug5/7zTsQu2YTpkZG2QzHe4
	1AoDNHck+hggXvuBt6T+id0SOWvkWzBZDdUt5PPuVnHqrjf6hFqx+wuzyK5YBGY/7bykg2fBEhx
	Jlv9jv3CoaOsZuk6WdDlUeUuygjnCZhsDlwihx/jgGRFJBFt03cRNTyc0HNMdzMa/Txh2
X-Gm-Gg: AY/fxX50TChtU/OjN6mcqUONpdx/cFj4YCLbW24iSs3XddWIDD0qNrY+6TXJYpW8Rxw
	YZ4QwxqcgNp1lg+9ikDUplvh4Kmk4p5T0+BWGPv1ehRBJXSSF3aajeLrpHfne6+tfa5eUKNG6Wu
	ZM+yF9z3p4jNgO2CFE7gC2h9Depx7rLCrgn/DbGtA+MGi+asgWqu0fZFwP8/61bLbHKW1cLUpHn
	HxAkRolZ3A/N3ltoSUAdisJlj0dsF0q58gaPfAjU3EqU42Yv3FxLZ5tMQ/IeDgjtxnaCYi4Ul5I
	IXsRHVBPNoqi16E3wZwbqyT/mLXi4NJUUH/4e7iw48gc9gCLlRrQG7bettpnFZdB8ETTWyJWlpJ
	EcUSft5DJlqHYoEFWkUiHHBQYV1ycyj+5GH2+xnjmSnJ6G/RmjI5wQZ2IWTQgJ6nEzjduQ4Cj
X-Received: by 2002:a17:903:1547:b0:299:dc97:a6c9 with SMTP id d9443c01a7336-29eeebfe83dmr12700445ad.20.1765433500950;
        Wed, 10 Dec 2025 22:11:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwYgKqzGeqU7toBB3FXsS20/zU0kWSROq2OAeA21VHW7Aj231W3vxDpdsEaA0jyBj4HPae/Q==
X-Received: by 2002:a17:903:1547:b0:299:dc97:a6c9 with SMTP id d9443c01a7336-29eeebfe83dmr12700075ad.20.1765433500442;
        Wed, 10 Dec 2025 22:11:40 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea065186sm11725945ad.89.2025.12.10.22.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 22:11:40 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 14:10:41 +0800
Subject: [PATCH v8 2/8] coresight: core: add a new API to retrieve the
 helper device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-enable-byte-cntr-for-ctcu-v8-2-3e12ff313191@oss.qualcomm.com>
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
In-Reply-To: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765433484; l=2705;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=V1yqLgVyRYM0PUluEeNsvfvMV9kESqLqhRAs3x4U+UY=;
 b=8bi2aJgwsd3U0FCI77yLrfMBwxWS5FP25X0Ek9isQ9rjD9FpLTnLlZ+eJ5y7aHJ2RNUNOBFFk
 6rOoVUCe+mICa+ydcW1naz7MEek9HQMlbNOYZ4gaZV32mTlwUl4sMTy
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Fr0IPmrq c=1 sm=1 tr=0 ts=693a609d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=AzIya3-Hz0U1LB2V40wA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA0MiBTYWx0ZWRfX8BPh3icaH/3K
 MbyfXklOenUFzu2eYMJoRgGOqkSn+ZcHJQj5yTleBwPlZ5uTmDQY1uVk31h+OzUsPxoxqUgDDrf
 MG+xob7RZaH/V5c8kHTdfpc7ZdlTxDERboFvUypY4ngwhq+Lz3QptBTClePat7GJB6akN/NFV2F
 fkYAuGqBPXlLTtNknKK5jsQZPo0+mnb5J7H22vQhJMpW0kAhMv4GlC86s+bSkyDCVVf1+EOKxpb
 1lW4/53pJx3zfjPkw3CG7Dy6sFoivxNndntE9IKCcqDF5zDzLehPwOvIa/UkPzzKWci1uvF9sYv
 PgPhIIQBpI+Jky3cY8HxejS6yxZVktyC84n3TvyFx7c2PogdDnRhWi1Py9HQuw2KPdnI718RnUE
 iz7H0exJcl8K5l7LXvdeuHztCzQZeg==
X-Proofpoint-ORIG-GUID: Sup4h6s3GC2i3ZZ4FLYfaTqNXQlQ388x
X-Proofpoint-GUID: Sup4h6s3GC2i3ZZ4FLYfaTqNXQlQ388x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110042

Retrieving the helper device of the specific coresight device based on
its helper_subtype because a single coresight device may has multiple types
of the helper devices.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 35 ++++++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-priv.h |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 0e8448784c62..667883ccb4b7 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -585,6 +585,41 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
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
+					      enum coresight_dev_subtype_helper subtype)
+{
+	int i;
+	struct coresight_device *helper;
+
+	/* protect the connections */
+	mutex_lock(&coresight_mutex);
+	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
+		helper = csdev->pdata->out_conns[i]->dest_dev;
+		if (!helper || !coresight_is_helper(helper))
+			continue;
+
+		if (helper->subtype.helper_subtype == subtype) {
+			mutex_unlock(&coresight_mutex);
+			return helper;
+		}
+	}
+	mutex_unlock(&coresight_mutex);
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_helper);
+
 /**
  * coresight_get_in_port: Find the input port number at @csdev where a @remote
  * device is connected to.
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index cbf80b83e5ce..8e39a4dc7256 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -157,6 +157,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
 int coresight_get_in_port(struct coresight_device *csdev,
 			  struct coresight_device *remote);
+struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
+					      enum coresight_dev_subtype_helper subtype);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1


