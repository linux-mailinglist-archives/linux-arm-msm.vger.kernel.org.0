Return-Path: <linux-arm-msm+bounces-79630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 79715C1F568
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A5B64E9C33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 09:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D8C342C92;
	Thu, 30 Oct 2025 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfwAUlk2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eub71/kn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9891C345CD6
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761817079; cv=none; b=cz65khfF6u9gftSrZ5v8pf7r6c5xxCMEo5OrjGDviSoJ4UzMjXyteSODwtPEmQ3UwkGK/buKUp9KRDkFIapGSvyc7vy3UlGjABUNx1uGFmxCHq6cez7pDK6LoehojGgo+Q/kbcvNvnPjlt7lJOhk0PqyfZwu4Z9pTNP/djbOfLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761817079; c=relaxed/simple;
	bh=BQ2WhXe+j6teCDP3HhSv+L5nC0F5n6ZZa8MJy8deAeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BhenZ9wwX7cwWNRGMn4cEdRq+R81+E0MwcE6LmcdAV0i0gpVHMH17zaSi7VI03jDnO0XVzvNHaXmk4jHkL6qaX33BraZo++7h0zH5Tv50JVcW2ylbWUfjEh+zwLF0L9Xri0dPC7gZt82UcHR15qP7KKQNL+lwK5is2hqFNowrFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfwAUlk2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eub71/kn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9MYvY3115587
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6TnRVims1/vAmiGRL6+V59BfdhehRAw+GW9WJZPj4jY=; b=HfwAUlk2peoLugmB
	Y85pqTqr8o05S10jlOgFtOxONPQvfJKA9rfR4pfr60zEAKTYCbAno+Kg+UN+BFi0
	n8LhLX82RsD7wCrFs4CZx/P3F/d7QGGrFii1EcbbYjPA4eOZOD6SVhjSSZOPYJBh
	+rJ426jNv4wUQ7rEbMgefKAhxnPZOotsfTZnhQoFevQbc3M32bpA/s1bJhsiaIVK
	12Bay5UZVhmJmpiIT5CGxHPuapuZOdq2HYzWdevtmcCQ8tRP55Qmq6uaXySfK9Rk
	+fN3pt+ztQV10rWzD3ZjsMMa9nrCRj7Xao6XeojPQAQ08m8w+zy6Y2WA6rzjkAtz
	5Bxp7A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45b4023n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:37:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-294baa12981so11602985ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 02:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761817075; x=1762421875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6TnRVims1/vAmiGRL6+V59BfdhehRAw+GW9WJZPj4jY=;
        b=Eub71/knnB32FloGzilC2n/q7gSfCIjcYZoSlfsdJFoA/gmyPaD6QWL8tGAutnS3m7
         ZS0CUbT/5j+a3mqEWYozan7ASqa/O3ILbaHOfm5BeMJDBW8TwPkznRiqqS6Jhmj+QZtC
         PwFeUjenOFA49Z5PMYpSPxwmfhUGDMRFONmpg6gfchK+MgYCD7WbxHyqZ3toEd26wZUe
         nZnQYERAPC2fFSI3Tkk6S+TTuPpri44M4vKtBxYa4bb7o5warhw2izZgkkA7odI9RDGO
         zzPq9mHQqZKJURHtaAarj2d0XPgHYCZJ2WltVSHghjgKacLqy9yGOsPEg1JqRVl6PiAh
         tQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761817075; x=1762421875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TnRVims1/vAmiGRL6+V59BfdhehRAw+GW9WJZPj4jY=;
        b=NlkCcPMnjFMFLsi1X+CV85zSdrgWaGGYftDsNgRA2522Oy3Fy7gRjmqB8pJzWO/Xxr
         lGKOK9EYGvL5I1hcSJ/qK6hsGvYkBPUT64xbEGYZkbz18SBq/DLFxFKsHFmUnDk8INLw
         RMdP8e68M4vCJfEEOj6ZFGNUe6ONFDGERjSsOaYh6aAbLOJMy3yMPXRS/Tkz/kFCOajc
         2XhHEIip1UHT5dv1opfkMnelOv3OUt83tD/Ox2Toj8ZSDXx8RQnbdJtf7KUQX9z3xf4n
         x2Hf3qNHAouT5yHEdxd/fZnB4DWy46BOwu3Dwc4OQLVS3pevJ3cmO1YUcEVTuBDI9BuK
         kgZw==
X-Gm-Message-State: AOJu0YzrsSKfBVwk0ZgHy/eoNuJBjh3lqxRYzMD/mizAjjA866SShY0b
	+sMQMAh/kXE4/JGehdmgz+w7QUcDoAtgauEBmATLBLzKPaF4rl4CobM2I+CxMnSS6yYyqk7imqV
	PXPgYisaTr53XcFA4kcALmV9iLJVmk65U9XCyVPZB29vWu68ul2X/yP3U3vQ7OK9qxkBO
X-Gm-Gg: ASbGncuoxi1XKEzBRJMyNRB0GjpSB4sL0MGroRtObS5P+7TGrbghN0Ojn54Qlw4TxHB
	4wo6FGwA+0WRHwgkzChqJA4eym2SNhYpIOD67Xk2mFIF2iaVFiathasHpWE92hmUbemuGN8yo73
	veZ4sBdoKYC66/YhOt0qI0n7FxuF6nT1fAI0hUeKJXFC4znQEiAA1kTrpjUH89drcpbEci4xvIx
	x0MoZggpCptFYoBHE15nCv6Bd8YVK/FC2UOhbYGnlbnYxdz3qhVVrPtXal9mggI3fUVBDU0Hr9o
	/ZDVpdHFFT0OUAGGX9IR06ag5BAQpTnoTshAsS7Ev/P7vzasT7HsBETldGY/NuKdTRNHkiyRQAi
	jU803Q+J60XfmBTVI/U/eUmaI/MMnsH6oUajp8OCGDGcfuYpG60HWHXaeWq21MyRH5nvYb4+uJG
	dz8H/aTX22vkrgv9Lpecxl+XAJZXY/2vZ9Gw==
X-Received: by 2002:a17:902:c410:b0:269:8eba:e9b2 with SMTP id d9443c01a7336-294ed2278aemr32639195ad.29.1761817075421;
        Thu, 30 Oct 2025 02:37:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI1gFEHNMVoUNvrBPPiHxU+pOMjI909UMlCs7Jjx/MCaedSt3XPMQ5zaaEHu6BzUEb+hYhVw==
X-Received: by 2002:a17:902:c410:b0:269:8eba:e9b2 with SMTP id d9443c01a7336-294ed2278aemr32638865ad.29.1761817074875;
        Thu, 30 Oct 2025 02:37:54 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-294e3ae4ba2sm49350335ad.40.2025.10.30.02.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:37:54 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 15:07:48 +0530
Subject: [PATCH 1/2] soc: qcom: smem: introduce qcom_smem_validate_item API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-image-crm-part2-v1-1-676305a652c6@oss.qualcomm.com>
References: <20251030-image-crm-part2-v1-0-676305a652c6@oss.qualcomm.com>
In-Reply-To: <20251030-image-crm-part2-v1-0-676305a652c6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761817070; l=2714;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=BQ2WhXe+j6teCDP3HhSv+L5nC0F5n6ZZa8MJy8deAeE=;
 b=x1S/UFhqD6RU4L97NO2XaFBZeuyX1idIi0OfIBvSwQwsO1j4Dss3YINwdcz3QaiftuM0npAb6
 IXUNnlgm/enCbvt7YyQx6SHgc2hy5etI5qr1E6U5imImLMi5wY5x9B9
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA3OCBTYWx0ZWRfX0FPEwcgyCR9y
 ms3AosUnTLvanr5WZzyC9DnXwYUTav+eu8DY8e4tHoFYVD/ptZ8euIMGo6IDdWYteBEfOp8IcjT
 qcoj/Ew6hcvIo5/LRFgD6STyl0ZVSYrTpK3TFmFXJOntuTqnLE7a6Vod3ok02MG+Ip8qvcMb0PD
 ZXU2WK3ZgxKKFnSC6YVhKDk9vmkKGjRGWCJQOtMkQzoTYX/oGfjDKaozeItT9qjvaAGgsNcGaCA
 FdPmCbZ939xm6AiZbtaJ/urA75Gb/FPwhn9j7vFSHp0TyGpDX5c/e+IaM8Xf13Gcl8PxahAPTXW
 Kgj8na4dI400AcS+EV3mn5E0EoKZIg9+p/SkfE7K+lpRsbNeySkbVFktCl5MqqS6eLlLI/SUYJ2
 nquvr08Yj/xvQ7Z9w/5s+VaJGlXKGg==
X-Authority-Analysis: v=2.4 cv=KePfcAYD c=1 sm=1 tr=0 ts=690331f4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yjR5zAPs1mNjI6YpPD4A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 2L9XC5AYRBtWy5Pumj28WcmNW4JfIDOO
X-Proofpoint-GUID: 2L9XC5AYRBtWy5Pumj28WcmNW4JfIDOO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300078

When a SMEM item is allocated or retrieved, sanity check on the SMEM item
is performed and backtrace is printed if the SMEM item is invalid.

Image version table in SMEM contains version details for the first 32
images. Beyond that, another SMEM item 667 is being used, which may not
be defined in all the platforms. So directly retrieving the SMEM item 667,
throws the warning as invalid item number.

To handle such cases, introduce a new API to validate the SMEM item before
processing it. While at it, make use of this API in the SMEM driver where
possible.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/smem.c       | 16 ++++++++++++++--
 include/linux/soc/qcom/smem.h |  1 +
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index c4c45f15dca4fb14f97df4ad494c1189e4f098bd..8a0a832f1e9915b2177a0fe08298ffe8a779e516 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -396,6 +396,18 @@ bool qcom_smem_is_available(void)
 }
 EXPORT_SYMBOL_GPL(qcom_smem_is_available);
 
+/**
+ * qcom_smem_validate_item() - Check if SMEM item is within the limit
+ * @item:	SMEM item to validate
+ *
+ * Return: true if SMEM item is valid, false otherwise.
+ */
+bool qcom_smem_validate_item(unsigned item)
+{
+	return item < __smem->item_count;
+}
+EXPORT_SYMBOL_GPL(qcom_smem_validate_item);
+
 static int qcom_smem_alloc_private(struct qcom_smem *smem,
 				   struct smem_partition *part,
 				   unsigned item,
@@ -517,7 +529,7 @@ int qcom_smem_alloc(unsigned host, unsigned item, size_t size)
 		return -EINVAL;
 	}
 
-	if (WARN_ON(item >= __smem->item_count))
+	if (WARN_ON(!qcom_smem_validate_item(item)))
 		return -EINVAL;
 
 	ret = hwspin_lock_timeout_irqsave(__smem->hwlock,
@@ -690,7 +702,7 @@ void *qcom_smem_get(unsigned host, unsigned item, size_t *size)
 	if (!__smem)
 		return ptr;
 
-	if (WARN_ON(item >= __smem->item_count))
+	if (WARN_ON(!qcom_smem_validate_item(item)))
 		return ERR_PTR(-EINVAL);
 
 	if (host < SMEM_HOST_COUNT && __smem->partitions[host].virt_base) {
diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
index f946e3beca215548ac56dbf779138d05479712f5..05891532d530a25747afb8dc96ad4ba668598197 100644
--- a/include/linux/soc/qcom/smem.h
+++ b/include/linux/soc/qcom/smem.h
@@ -5,6 +5,7 @@
 #define QCOM_SMEM_HOST_ANY -1
 
 bool qcom_smem_is_available(void);
+bool qcom_smem_validate_item(unsigned item);
 int qcom_smem_alloc(unsigned host, unsigned item, size_t size);
 void *qcom_smem_get(unsigned host, unsigned item, size_t *size);
 

-- 
2.34.1


