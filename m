Return-Path: <linux-arm-msm+bounces-86515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 758A4CDBC12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16F6E3025F96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33B632F77B;
	Wed, 24 Dec 2025 09:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxuAf/zB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VmpG5h0z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA7532FA02
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766567244; cv=none; b=aWBQKK12/mR1ej4u2LjHUrSqCP5Qntv+5Kuy0enmeJ4WJ7ZAtgw1NGhr2wv72/zHFTZTulPHN+meo2T+LN+oveyKU6jsDo85O5aZLMagrwG9lDem2ehWni4MEF8NaNr5SBu1MUd3hkkmzL2Cc1GHXuuToIlVrYckVgDh/Oggz8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766567244; c=relaxed/simple;
	bh=E+ppFBcrIJvAdTSLfg3aWv6Te2yyYQtt5h1yCZRSC90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXJsHeJEm/5Df7qcun0mzQneynP5dlDKCnIu3Oq76lMCQh7fmQ9BhG0ZwW2iiY5uERiVjgU58wt4Qp0lXgrAmqXGJmRA1/6q5s22ISZWxvrLkSFaExZxTCnf/dbbMJCqeyimpV/kWGFd3pKjSFpSeKCcW/A2ODpoOHN9HMictuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DxuAf/zB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VmpG5h0z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8ldPX1206755
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1fOi2vF66t90yroTgrkpJuJ7GaS3pPHt+cx2IRW7gGE=; b=DxuAf/zBg3i59ppl
	k+V8egBVcJ6GOb65OtIfFKMeFt4llm2xa4RcDA/zhOWZ//fZFZaebx8+HAfeuJw9
	Mvrz6Hxq9numQ31355LhdDPD6xpJW0M0EOFS1OkOwko4fbIsFjaIVUFe8X9mAnz+
	MBIMKUoPUm22xzgD2VjM93/ChNIsiMI5ksSCdvWE5euGhFpfHFMUS4EpEsSDNan9
	06kTje54gZ/YdRvkjToZWXtQfnbjAh19d+/q41g0Z2pYoNaNhrDP9XQs9JxvPSIM
	y6OdOPBMnM62i6v6saYOqpAGP5XJy/KxXfCBKdzg74zrXiCJ1Ny8JVgoPgXvcfVa
	kDGziw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r1mkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f2b45ecffso94855995ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766567241; x=1767172041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fOi2vF66t90yroTgrkpJuJ7GaS3pPHt+cx2IRW7gGE=;
        b=VmpG5h0zR9kW6UNS5y7A4pnbjGJXloBm1drNyYn0LcRZZgP+OowhEE0ubkj+7Rb3Bz
         bvlGVK5ieZHZHZaXQ2AvbVWrX9Y5YGSWOpI9+ssLvKGrPQoEVnCpmdTwhoPPGiWkyl4b
         k5N2srJ5hgViaE5B/oFPQzuus7WvEdz/cBsabtttdqjS+7VxPaD0Pf44FZSzMKzZAo7g
         k9/adPMJeQTCOhpmLPKwVUXMCXkbgk4lih/LqyW9aC63VbXExdBJUAVyaRSN8wgk+IA2
         Ds9tGt43IUFq2lF7TDI+hzUyaBQIW3q9xRBgj+UuCIKUMVslmCMmj7O/xX7ZASRMNZj1
         vfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766567241; x=1767172041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1fOi2vF66t90yroTgrkpJuJ7GaS3pPHt+cx2IRW7gGE=;
        b=lpK/YiO2UT6Rbp0Wa7E9+sg+iDLuECj30oLhGRsO4+j9OfCYKvBlXttffppblUaf4z
         DOggTJPxMQZ9nvzBLszkoJmIDxEugNgJLTvZeUJzaLOU4KnSYG64/IWtsNqO1Jl3C0yZ
         f2dwiWad0LaXvcecdTki2hByccQMFvZqN/DaGOyQUK1E0DUfNasck4vCVKBlsKDQqdqL
         FmmOC5kAh+Q18DontH/AJcrFYT0wAWEik1kzMW03BwgQYhPtSa4yeJgVq4IQ61toZHJI
         IBv4K041LRIe99j3gdTevk9v1NcFaozx6emo0dUZtY4mPzvR8oh13hQyvCIEcIPYftTx
         Yqsg==
X-Forwarded-Encrypted: i=1; AJvYcCVlNKa9y5wW+4GTYFpgTZm/ZGKeKOWj6IW6bEi2lqzrFExmAWR955ZQhw8t4dlF0atG0jCQpDJc/gFWF5gN@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ+VnTWZQF3zcyO1ie/nqSszrzVONxsc54LKrIsIgi6G3qqmbC
	QvYOCIP1jhK4erJf6p6qG/Ixw2puQcLfN5zyGd4RbhRaTF7D5TuKThhY3nPkCQg7atkbdQoj3HT
	gDJ+d/yaAjhclnDLLX/DwW1/wrJP4U7C7UGJQGr/zCryfmdZmLU1sxUZv5E0yPLo2Uea2
X-Gm-Gg: AY/fxX7Q42I4OakYutC1dAX5FOWbz4cnlah93koaWfcCK7A2WoLNndDXKjjnjY+QSTi
	vkUoUG+X0xTIizqepf5WiwLoI5wAjQ1Mt6AzrodLDE5yqc1gi97PD/2SrZfzpTYmAMirbFqdME5
	CJeMVVzFoD3iu0fW4zXJ7yzYY6FNqY7JlkrH40acv0ffmA48Tn1Yr5NDHX2PrgVgbCKuVXMNSO4
	pqIclVax6Be0AV/US+Zapq74GDv37nyWEAhhqKQQNf5vaB8NvFmxXZMj+Hd6fYepRW8+vr4lBz2
	cZUOK4nnFVGLm4rE8tj6bwiT3Tr9g4aCffalSOS8QNyM+A8jr0CNuX49U5KP8bRfDsotuEv8UUr
	A/zrIGv3EEKv3mRWv2fEupUWj4buY98y4P6sn7+Jki75lVm5QUAxm94SCJZDHJRBwQgHfSTgN
X-Received: by 2002:a17:903:249:b0:2a0:de4f:c9b with SMTP id d9443c01a7336-2a2f222b700mr179027125ad.4.1766567240668;
        Wed, 24 Dec 2025 01:07:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQC2XxAia4EX4NnIXvKYIkoEvVHiwnA8mWK4j1DSqVZwUZZzFNed1w6NIHIhhDYYgcHL8Lnw==
X-Received: by 2002:a17:903:249:b0:2a0:de4f:c9b with SMTP id d9443c01a7336-2a2f222b700mr179026685ad.4.1766567240214;
        Wed, 24 Dec 2025 01:07:20 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm148418095ad.21.2025.12.24.01.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:07:19 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:06:14 +0800
Subject: [PATCH v9 4/8] coresight: etr: refactor the
 tmc_etr_get_catu_device function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-enable-byte-cntr-for-ctcu-v9-4-886c4496fed4@oss.qualcomm.com>
References: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
In-Reply-To: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766567216; l=4412;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=E+ppFBcrIJvAdTSLfg3aWv6Te2yyYQtt5h1yCZRSC90=;
 b=JorYpjDt+HQSZZ4cqDjMRyi2/w/tKFXOb4XpusXf/jp/55B0wZHXDs+JaucpIRzl28QKDlkgG
 cMNvERbaINXDNbFhJsuUGl2JFNVE9P6C7AWXC4/+2+DZtP4iH/FsDSx
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: Fsi8tmIk8R5EWmju0AqpwONtQuF9-_Vc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3OCBTYWx0ZWRfX14P77VbSQgpP
 9ginL2cBzcQfTtUuI39r9K5WcmMCcg/ttfWJjRxyNgNw5NjqxyNCMkIu5VLBzWUlymrkZaHvGSM
 c/MAtJs6qf198IXUaAZosv+GbP3cktH5wV+z89Wfb1knMYabtDlfxYKkTrdF9L2JQRoLSoo6PCz
 AWlqkuOUcIpocWmQdQQxhQQBpr9CabT9I66XpQdtu4whuippJgS9usezJgy1qa7qOlmTLgX/tFl
 d687AfxPXu0edP2SyOPQyltOikb2kUnKgTJwHD/ka9688XcWjM6UXAblw+RqXGws/1mjG4gLa0y
 zByy6hBC/qPAda8G3p8+QvRUGeFwj2ResT0mKw0BYQrNzHUF5W2BW6SHOrJP8zh1iPQZ/yUGoVm
 xz+P+0KWt2/bjmTH/U9TGCU/L8OAGKNIUJp2pqM2sDnk10AZqzQWocdmvtEZQj5U8OAnftUNzdD
 N6eX0v6JDoX4CJ37/Ew==
X-Proofpoint-GUID: Fsi8tmIk8R5EWmju0AqpwONtQuF9-_Vc
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694bad49 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-ozbsww5GKt6_lkPIaMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240078

Refactor tmc_etr_get_catu_device to retrieve the helper device connected
to the TMC ETR based on helper_subtype.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c    |  3 ++-
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 32 ++++++++++++++++---------
 drivers/hwtracing/coresight/coresight-tmc.h     |  3 ++-
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 69b36bae97ab..d3972619cc96 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -334,7 +334,8 @@ static int catu_alloc_etr_buf(struct tmc_drvdata *tmc_drvdata,
 	struct tmc_sg_table *catu_table;
 	struct catu_etr_buf *catu_buf;
 
-	csdev = tmc_etr_get_catu_device(tmc_drvdata);
+	csdev = tmc_etr_get_helper_device(tmc_drvdata,
+			CORESIGHT_DEV_SUBTYPE_HELPER_CATU);
 	if (!csdev)
 		return -ENODEV;
 	catu_buf = kzalloc(sizeof(*catu_buf), GFP_KERNEL);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 2b6ca1f8bed2..18981b6cc172 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -844,28 +844,37 @@ static const struct etr_buf_operations etr_sg_buf_ops = {
 };
 
 /*
- * TMC ETR could be connected to a CATU device, which can provide address
- * translation service. This is represented by the Output port of the TMC
- * (ETR) connected to the input port of the CATU.
+ * TMC ETR could be connected to the helper device, which can provide address
+ * translation service(CATU) or data filter function(CTCU). This is represented
+ * by the Output port of the TMC (ETR) connected to the input port of the helper.
  *
- * Returns	: coresight_device ptr for the CATU device if a CATU is found.
+ * @drvdata	: drvdata of the TMC device
+ * @subtype	: helper_subtype of the helper device
+ *
+ * Returns	: coresight_device ptr for the helper device if a helper is found.
  *		: NULL otherwise.
  */
 struct coresight_device *
-tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
+tmc_etr_get_helper_device(struct tmc_drvdata *drvdata,
+			  enum coresight_dev_subtype_helper subtype)
 {
 	struct coresight_device *etr = drvdata->csdev;
-	union coresight_dev_subtype catu_subtype = {
-		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU
+	union coresight_dev_subtype helper_subtype = {
+		.helper_subtype = subtype
 	};
 
-	if (!IS_ENABLED(CONFIG_CORESIGHT_CATU))
+
+	if (subtype == CORESIGHT_DEV_SUBTYPE_HELPER_CATU &&
+	    !IS_ENABLED(CONFIG_CORESIGHT_CATU))
+		return NULL;
+	else if (subtype == CORESIGHT_DEV_SUBTYPE_HELPER_CTCU &&
+		 !IS_ENABLED(CONFIG_CORESIGHT_CTCU))
 		return NULL;
 
 	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
-					  catu_subtype);
+					  helper_subtype);
 }
-EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
+EXPORT_SYMBOL_GPL(tmc_etr_get_helper_device);
 
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
@@ -913,7 +922,8 @@ static void get_etr_buf_hw(struct device *dev, struct etr_buf_hw *buf_hw)
 
 	buf_hw->has_iommu = iommu_get_domain_for_dev(dev->parent);
 	buf_hw->has_etr_sg = tmc_etr_has_cap(drvdata, TMC_ETR_SG);
-	buf_hw->has_catu = !!tmc_etr_get_catu_device(drvdata);
+	buf_hw->has_catu = !!tmc_etr_get_helper_device(drvdata,
+			CORESIGHT_DEV_SUBTYPE_HELPER_CATU);
 	buf_hw->has_resrv = tmc_has_reserved_buffer(drvdata);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index c9a82ff6cd00..7690a70069da 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -471,7 +471,8 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 	return crc32_le(0, (void *)drvdata->resrv_buf.vaddr, crc_size);
 }
 
-struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_helper_device(struct tmc_drvdata *drvdata,
+						   enum coresight_dev_subtype_helper subtype);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


