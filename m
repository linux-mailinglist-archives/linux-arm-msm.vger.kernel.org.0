Return-Path: <linux-arm-msm+bounces-67677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1337FB1A197
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 14:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3457B170EC4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 12:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23DD25CC40;
	Mon,  4 Aug 2025 12:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7exVIPz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225CA25D204
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 12:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754311359; cv=none; b=YrUX08+e0jj9wyhlzLH4ZWHKoIBzGnGuXD4Gs/farwPz43naq4BtGcXT6FMaffaYNZJAj5q94x96K5vyKkApr6jqXRyslcBChUsLcHouflBLa40PvfbX+knuOZRQWyjLNTgZlFWVbY0X6m+fmV35FPOjLKlLIkdaKg5i9yVcksY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754311359; c=relaxed/simple;
	bh=Zji6gWmkzbwh5PxX+NoZLoedb69oac3dHlD8eqjUIwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I75cH3LxLjbe/iBPlaw4WgVdz2gPvu9B7ii2xaoifiY9jJGto83E+p7+kQNHJ+idBqjBDNbg1Sl1dD43yTVueyg1IxQDWtIm9MeikONeAR79ASarkmaikhgsq1aCpAt5uGTWWl+oZxHj+FvupMeFim02L2fvNCvjanazf1Yplxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7exVIPz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5748qY9o012085
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 12:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YQrPurq3NapPqGpZBcgGv8vx6+jrShJaV70ukg80F1s=; b=c7exVIPzI2CFB4ls
	Ro2N6hcdmo5XpVL72/kGHGM1JKERmRO4KImd5QS1fA7jOvTTIQ2Brk0otr0TH4Rm
	SDNB2zfApdSXkumuBKqeN1whURkT/4lvJxaFmPX+u/kcfDxe5pkHEb1WP1vQlscG
	W/uO/ySu9aq6UwXZmdLMKik37WxNJqPJRh6qJ9O7+LzJl8d9ydl7O26qTx1+PbNw
	6jZDf/tvqQJkCFIcrHZjNJPv4U5UHz5Pm1XZ6wJ38OxGyW+g0rZLiXuF5g2IXkBM
	wAs8v9UKV9g+ZJdhuhz3qoPet/nEJwQxDUrSxGG3TDQwGum3MXwFZHCi41Z1KSDy
	tk8wSQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4899pad15n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 12:42:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24283069a1cso2647985ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 05:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754311356; x=1754916156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQrPurq3NapPqGpZBcgGv8vx6+jrShJaV70ukg80F1s=;
        b=AY/obLzTZv3oGKJxxubdriiPgSpo2aBNQfSXBxMT0KbHLhWLD6Z7wHwE/M0heeT/tk
         ob/L4iHsNKT0sxd1CGHjwNRTvfifgTA5eE9OQvNe7TJ5nzmY+Wd/g6JQx2k1YrhGVz+B
         eN/2IQewwdJuuze73RPEhnQcUH0unQh9vJOZYteYxizifN9khCxXEDq/cjhAuxlZXN/t
         rlvJwAFE5gMqALa36ANRPMVE2awqUY0wJAPsf11zWcaAeeLaaI4jDxmfuNTGfNb56BhQ
         nWrPPGvRNMTBU98hGDIq4Z3CW1LlEM7vCeIlOEVfJjZEDeKA3bHeqDvuJHfGx/Ps4YOp
         Hb3g==
X-Gm-Message-State: AOJu0Yy6Dw6nTlJQk1pdt/QcXFjUYCTKKKVuITe+tCcB4epthSt51z6w
	ttJQfIMP8Z/pqjW/NkiTe62/Z37FKNTBopjnAv8Ypywb5J3ZTG2xNHI/Rnn4aNmXeJHei5z/Qro
	KIvMpTVq2X9zHy/QBmbm9flWWNPHKAXPzGwY4HWLilAzVcZUjhfZ69uDGL4+iIONS4ry8
X-Gm-Gg: ASbGncvfWCUHh96ojPzSArPtuuNLjaTa/FRTPrXVM8dTefZjioxJl2oeYAv+Hv/I3ne
	LMjQQ9RRwlE7uPVldQJJzRQ0rOe5sxBGFte5z8q9dGq2lUvq/sdG7LQxwvoSIXFhnPjf5t7m5DR
	AmhnfUWZiddg1uCKDXagqAULx3sd7q84bg9W5PdwH3h9sMYpgU8gLK7j1BdSAuMdBEmcQ8Kv9jg
	NL8no2zrtGpXJLR5BSYiJgukgvE42/3pYUc5E5mO4d0mhsgV8GVOj2Xhm/kFIB8OYh8y+K3YKiB
	jwAYIVJIJTsbQ44bvWejgy4yYBsjVfvRvT61P35AKNcjhbXIKHdb9ZlNeDOC33BF8mU=
X-Received: by 2002:a17:903:228c:b0:240:468c:83f1 with SMTP id d9443c01a7336-24247058a7amr131956955ad.44.1754311355582;
        Mon, 04 Aug 2025 05:42:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwWJixm0otAsJ9qW2cKHM5TCYbaZzSEpD0epevLuvlVXQCQHHBcVIx7oFmDiJtStYDErVyGA==
X-Received: by 2002:a17:903:228c:b0:240:468c:83f1 with SMTP id d9443c01a7336-24247058a7amr131956605ad.44.1754311355161;
        Mon, 04 Aug 2025 05:42:35 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef8204sm108876365ad.34.2025.08.04.05.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 05:42:34 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 04 Aug 2025 18:11:49 +0530
Subject: [PATCH 1/3] soc: qcom: mdt_loader: Remove unused parameter
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-mdtloader-changes-v1-1-5e74629a2241@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
In-Reply-To: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754311345; l=1741;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=Zji6gWmkzbwh5PxX+NoZLoedb69oac3dHlD8eqjUIwc=;
 b=5CMkHAbsehPVIWOSELTxsgownCEReC5ZwglVfyzW/9eIgQs/XNLDj6ZF1qXsM5VdS+WuGlu9N
 zC2G+4/yH1sBnaZYv/g3O4obeXNlNDL75iSPYKBPO+lObmjTYAqQATn
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA2OSBTYWx0ZWRfX9qiLmpo6MHtD
 XizdkhG1+Pnvg98rGR957oQIESHPllcscZBv8Yg7231uDMzzfb/sbMBvOtdwmJrWD7LU2qVe2Pv
 Z+0huZ0UpzakEXO9QGPuUKzW/fqYuRHLKDQ0ZwimqZr+2qjXexWYRCGh3/1S2UQxLreh9YJ377Q
 a8sLdURAtBPSQyZaZ9TVZZN4Nhkqbtt4pdWF6TN4J9q5dXL+KzCRurkm911cgHNSXys9Hwyyeyy
 IGE7bpLHRI7sZvIgZUZHxU5ZFH4QR4TG794ypspX9HdInt0/ixsfOv7YLSxCktLSmWm98/MfsLI
 8UNzQ6VkKUq5ZFJQBX9Ga/YsIKn80KAXPa+2d1WIQSQfEIaIUBS65DZNA8QGiD/yH33KMI3F36l
 xuDDUzTp4Jb5OakhTXvIqMVVwc87gAaTz5IZZMcHfD3CX9jNvkhW4bCmqsLRpZ4FYa/LJI+Y
X-Proofpoint-GUID: MCQ5lKCOmVlwUASHLOIksXgbcVDOs3vi
X-Authority-Analysis: v=2.4 cv=N88pF39B c=1 sm=1 tr=0 ts=6890aabc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=4mQorhOTa8Yjjd-mLDMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: MCQ5lKCOmVlwUASHLOIksXgbcVDOs3vi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040069

commit f4e526ff7e38e ("soc: qcom: mdt_loader: Extract PAS
 operations") move pas specific code from __qcom_mdt_load()
to a separate function qcom_mdt_pas_init() after which the
pas_init variable became unused in __qcom_mdt_load().

Remove pas_init argument from __qcom_mdt_load().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 0ca268bdf1f8..dfd15d189087 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -333,7 +333,7 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_na
 static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 			   const char *fw_name, int pas_id, void *mem_region,
 			   phys_addr_t mem_phys, size_t mem_size,
-			   phys_addr_t *reloc_base, bool pas_init)
+			   phys_addr_t *reloc_base)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
@@ -459,7 +459,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		return ret;
 
 	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
-			       mem_size, reloc_base, true);
+			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load);
 
@@ -482,7 +482,7 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  size_t mem_size, phys_addr_t *reloc_base)
 {
 	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
-			       mem_size, reloc_base, false);
+			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 

-- 
2.50.1


