Return-Path: <linux-arm-msm+bounces-81584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C33C56E77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 11:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA1F33BDC0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCFF33554A;
	Thu, 13 Nov 2025 10:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2WDlJPK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b5xO78qg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDBE33372F
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030191; cv=none; b=BRF0x2Bq/kW5MgghwNRyGKeLycyNd/oJHGtiZRkHMErREO9Z4Cuekiu1uU/sRhh638g+2w48G89ZHBAa9rBj5oaC4kmn+4m2yp9woERiXGmwiOrNyw8GrKH6u37yAM3eRnwIedL+hKuDTl/z2cp67rvxd8cnr2epEt1mtSf93XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030191; c=relaxed/simple;
	bh=C3Ley1QLmPG1XuMOkdJxmCMYyeY9BMVS2vkIgtbl3p8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gr/sAtlHaDDLVe1RDajx1BJlfoK3XuZgThqonKS31uLrkCBV4qvqPOJBAUywiRNYgnpQf0zuaPgUxkG6LjOfHcNqcNgkBehHgcJTSwfn3WOvoGUEg0Sw50DXY4mPT/pM5gt7/MLeuOkz8DvcCd201JMzKX9Ci+jHsWNG9OpeRG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2WDlJPK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b5xO78qg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD5S2xx3440417
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ASEm9fX8+VVkA1BJSl3kYhAYISeC3QO/YbGUHvANDO8=; b=I2WDlJPKsyfB4pvy
	ajmbYnogCL7lLDE5F/meBn9komSPuqMcfvyEeTVgvSqsg8mFw5Gv0ZScb26P6W2z
	yMdfNZrLiZtKOIU7eHFUUVqe8/+tXlM81gpC11vdsGOaVIdWK5H1vWzePid6sK4l
	u6FTRO2PSFkdkAQ71z/mhic0NH/sJhJDffKff0Q1chOlBTb8oHdrC35PP/Jh4lbA
	v9tklnAkStsNa7kVFgAHnmB1dgt+/ADqoMH1QEobmAwMWFb44b98iNe65vCCFlFb
	flZ6OoWAHeZtdR9P9+X+oPPM7vqhUrMM/8p+eEDUL9cLYl71Q/wVZIZuQkTeCoUu
	/BTRhg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9788yb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b4933bc4aeso636512b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 02:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763030188; x=1763634988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASEm9fX8+VVkA1BJSl3kYhAYISeC3QO/YbGUHvANDO8=;
        b=b5xO78qg1esTepb3Ev8H0yTNFXc+oX5eHbnSw/5SgJPNxKHNzGFvuqzvJLQb9G0oxv
         F9zMRFjdiL59nJOMVoQjagnzpfM2ULVVkhitCEshucghSC05qWtd/f0vLT2lqQg99SOS
         Mg1ddtJmUCTOgkwsNHYJAuZGBgkwJ/O4kunl9v7ymzv1P74mergp8uTkmNQz5j5C7PEM
         lo4GBafpO0bCOLl368tLlfsO0UMef7lvym0ALv3jbqq/o0i4TYbv8O2OW3Won9eHolA9
         jhh3iajkJ1MPWnwQ+zt6Suzox/v+UIbZu2osMGKYgpdBT3pTQCHnNhwN70tfjk8xVRUd
         7FBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030188; x=1763634988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ASEm9fX8+VVkA1BJSl3kYhAYISeC3QO/YbGUHvANDO8=;
        b=B96Dcq+mi+Ork1ohfXd5NPVYJSVdSzj3ktQa5cvq0CX2HX8G7JlpMEkpk5dUXouc4W
         gTYWMv0cgvoKfiG6TLIuyS+ZWn1wENjcZS7+utW1XFPM6NymldqlfSeaQRcehdl5VLHk
         UIsiXXoJl+PIWuS5Z67cH1GmEUuo0jgDsFJHHosu18ovY+BDVOqFrAjTV9KdT5R5/RhX
         DMB+JDImzE28ssQTvQRnlHsPTUXu2FmNVVp3DqET9HwE0uepaPw/n+Z7iCvLThKzkwPo
         9eeVKWfzJfFm4yuD8vU0/OHqflPaV8lJDaG6CFWwj8adtWsf2VVRG9mdpk1DpPLKYzcv
         V8hQ==
X-Gm-Message-State: AOJu0Yw8sfv8ZZQIPIzrmhJEid3mr7gaBusGac8nKAuH90YOhDfHiZm1
	pRx3fPxDeRi5878k/nZqoSTJ4s+Rrz6upONVoaJ0f343knB79bhjsPwIJx2eULX6IJfGOR2PR+8
	iOApkzxHFLqweRdlS9XZ89kaXRwflvtCt+eNQh1w7kRvk6UKgKrIF0uBd+tBlXI/Hmq+a
X-Gm-Gg: ASbGnctp+SMsadOxjed4xEUwLuas3m0+J8Qx4kUq/zxDhyVPV3rcAdiwHJG1qz0BgrN
	+Eav4OI03G+72CfvnJ723xghebudJEtr/QGcunREJqSYIq3oCy4zMm9ywzX1Kw6ZCkro1Xc4YWG
	c9L2V83ycbJC2+XaH9N1QSq+RAth72aW26X39sFyHpMZMWDAO8cI7VCqHYapcnKYu1bhWkKHOw4
	wFOQnP/9J84TH54gE6rIjCExt22aPeBI8SxOelqYf10xYj5RFvumNRewl+iqrAkHNVOBUHQX71A
	ybvuW4l5EbYSuc/BW3jcdmlTw9KiBc3iQRsOnvrtEcfeRn6T9HerO7Dl/7bFmeSs5v3cH2K/kME
	2rfz/aSDw6Y51NEmEA9ZX7HlVow==
X-Received: by 2002:aa7:8c02:0:b0:7b8:10b9:9bec with SMTP id d2e1a72fcca58-7b810b99e59mr4473872b3a.19.1763030187450;
        Thu, 13 Nov 2025 02:36:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHraKJ7FzEJcufdUYlZuKtORYDrA89UcotFb9PTETB2MnHOmHUvyU/2tLG7D0FAABtjVlywIw==
X-Received: by 2002:aa7:8c02:0:b0:7b8:10b9:9bec with SMTP id d2e1a72fcca58-7b810b99e59mr4473835b3a.19.1763030186811;
        Thu, 13 Nov 2025 02:36:26 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250d2d16sm1886922b3a.22.2025.11.13.02.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:36:26 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 16:05:55 +0530
Subject: [PATCH v7 05/14] remoteproc: pas: Replace metadata context with
 PAS context structure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-kvm-rproc-v7-v7-5-df4910b7c20a@oss.qualcomm.com>
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
In-Reply-To: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763030164; l=8846;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=C3Ley1QLmPG1XuMOkdJxmCMYyeY9BMVS2vkIgtbl3p8=;
 b=PPiy48q2winq0kmlAb6vA28TJQm4wOYk29FxzITEZVdTLh6w9mv+OqdAsJktUV89Zg4M5xhi9
 zp9Gc+KAVjJCzKG+6dbZLWBdClsmtH0G+nY8A6fl4RsPkKb0tjDd84K
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA3OCBTYWx0ZWRfXyOYeWInKo1aN
 4oHuSZmt1+ugDO66A5lfITBOzFw6sXpVpFGJTA/jL25KRjEYZFLEiOt1oYCldWp5GZjZXERyzmQ
 qsK6SOLMLf6SGNUrBofzrncVOcH9bcOoNYpaaJK7abzZYwt3fBrbLwa8wp5M5nGS0AYk1ypnaBj
 hfTFdWujW+kK/Yxr4U8IK92YC7KdzyhqQ5s7sHqGED53ijd0t4fBdx695YU8ZRzjIiFWtFmaLnE
 aciGccKORUTf6tEIkRcr2JLJiCc/VU2mfnOiXVGXkOReo/A6eNB0oodtpu+NLfYXua5Y5FgUsq9
 sR6R7oiDF+TmtuYYFtf0yCK52ZT1R9oHkd7zm2Sw8RZmGb2b6nbURR/ILrwM1WSjnw/nOQA/p6D
 qEa4neJnZoQ3vnsQenpH/trwyZOokQ==
X-Proofpoint-ORIG-GUID: 9NHqFvtdFuD1CE4pKf8WtcD_hVr3CpIW
X-Proofpoint-GUID: 9NHqFvtdFuD1CE4pKf8WtcD_hVr3CpIW
X-Authority-Analysis: v=2.4 cv=PIYCOPqC c=1 sm=1 tr=0 ts=6915b4ac cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FPhKjH8jRcijH9SIsZwA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130078

As a superset of the existing metadata context, the PAS context
structure enables both remoteproc and non-remoteproc subsystems to
better support scenarios where the SoC runs with or without the Gunyah
hypervisor. To reflect this, relevant SCM and metadata functions are
updated to incorporate PAS context awareness and remove metadata context
data structure completely.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       |  8 +++----
 drivers/remoteproc/qcom_q6v5_pas.c     | 38 ++++++++++++++++++++++++----------
 drivers/soc/qcom/mdt_loader.c          |  4 ++--
 include/linux/firmware/qcom/qcom_scm.h | 10 ++-------
 include/linux/soc/qcom/mdt_loader.h    |  6 +++---
 5 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e4eb7f3ab7a5..ba28b5d6254e 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -599,7 +599,7 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
  *		and optional blob of data used for authenticating the metadata
  *		and the rest of the firmware
  * @size:	size of the metadata
- * @ctx:	optional metadata context
+ * @ctx:	optional pas context
  *
  * Return: 0 on success.
  *
@@ -608,7 +608,7 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
  * qcom_scm_pas_metadata_release() by the caller.
  */
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
-			    struct qcom_scm_pas_metadata *ctx)
+			    struct qcom_scm_pas_context *ctx)
 {
 	dma_addr_t mdata_phys;
 	void *mdata_buf;
@@ -672,9 +672,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
 
 /**
  * qcom_scm_pas_metadata_release() - release metadata context
- * @ctx:	metadata context
+ * @ctx:	pas context
  */
-void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
+void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
 {
 	if (!ctx->ptr)
 		return;
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 158bcd6cc85c..729e7b9bc183 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -117,8 +117,8 @@ struct qcom_pas {
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
 
-	struct qcom_scm_pas_metadata pas_metadata;
-	struct qcom_scm_pas_metadata dtb_pas_metadata;
+	struct qcom_scm_pas_context *pas_ctx;
+	struct qcom_scm_pas_context *dtb_pas_ctx;
 };
 
 static void qcom_pas_segment_dump(struct rproc *rproc,
@@ -211,9 +211,9 @@ static int qcom_pas_unprepare(struct rproc *rproc)
 	 * auth_and_reset() was successful, but in other cases clean it up
 	 * here.
 	 */
-	qcom_scm_pas_metadata_release(&pas->pas_metadata);
+	qcom_scm_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 
 	return 0;
 }
@@ -241,7 +241,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 
 		ret = qcom_mdt_pas_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
 					pas->dtb_pas_id, pas->dtb_mem_phys,
-					&pas->dtb_pas_metadata);
+					pas->dtb_pas_ctx);
 		if (ret)
 			goto release_dtb_firmware;
 
@@ -255,7 +255,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 
 release_dtb_metadata:
-	qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
+	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 
 release_dtb_firmware:
 	release_firmware(pas->dtb_firmware);
@@ -306,7 +306,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	}
 
 	ret = qcom_mdt_pas_init(pas->dev, pas->firmware, rproc->firmware, pas->pas_id,
-				pas->mem_phys, &pas->pas_metadata);
+				pas->mem_phys, pas->pas_ctx);
 	if (ret)
 		goto disable_px_supply;
 
@@ -332,9 +332,9 @@ static int qcom_pas_start(struct rproc *rproc)
 		goto release_pas_metadata;
 	}
 
-	qcom_scm_pas_metadata_release(&pas->pas_metadata);
+	qcom_scm_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
@@ -342,9 +342,9 @@ static int qcom_pas_start(struct rproc *rproc)
 	return 0;
 
 release_pas_metadata:
-	qcom_scm_pas_metadata_release(&pas->pas_metadata);
+	qcom_scm_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 disable_px_supply:
 	if (pas->px_supply)
 		regulator_disable(pas->px_supply);
@@ -779,6 +779,22 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	}
 
 	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
+
+	pas->pas_ctx = devm_qcom_scm_pas_context_init(pas->dev, pas->pas_id,
+						      pas->mem_phys, pas->mem_size);
+	if (IS_ERR(pas->pas_ctx)) {
+		ret = PTR_ERR(pas->pas_ctx);
+		goto remove_ssr_sysmon;
+	}
+
+	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_init(pas->dev, pas->dtb_pas_id,
+							  pas->dtb_mem_phys,
+							  pas->dtb_mem_size);
+	if (IS_ERR(pas->dtb_pas_ctx)) {
+		ret = PTR_ERR(pas->dtb_pas_ctx);
+		goto remove_ssr_sysmon;
+	}
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index a5c80d4fcc36..fe35038c5342 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -234,13 +234,13 @@ EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
  * @fw_name:	name of the firmware, for construction of segment file names
  * @pas_id:	PAS identifier
  * @mem_phys:	physical address of allocated memory region
- * @ctx:	PAS metadata context, to be released by caller
+ * @ctx:	PAS context, ctx->metadata to be released by caller
  *
  * Returns 0 on success, negative errno otherwise.
  */
 int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
-		      struct qcom_scm_pas_metadata *ctx)
+		      struct qcom_scm_pas_context *ctx)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index dd07dce7833a..94daf3aa89fc 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -66,12 +66,6 @@ int qcom_scm_set_warm_boot_addr(void *entry);
 void qcom_scm_cpu_power_down(u32 flags);
 int qcom_scm_set_remote_state(u32 state, u32 id);
 
-struct qcom_scm_pas_metadata {
-	void *ptr;
-	dma_addr_t phys;
-	ssize_t size;
-};
-
 struct qcom_scm_pas_context {
 	struct device *dev;
 	u32 pas_id;
@@ -85,8 +79,8 @@ struct qcom_scm_pas_context {
 void *devm_qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
 				     size_t mem_size);
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
-			    struct qcom_scm_pas_metadata *ctx);
-void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
+			    struct qcom_scm_pas_context *ctx);
+void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx);
 int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
 int qcom_scm_pas_auth_and_reset(u32 pas_id);
 int qcom_scm_pas_shutdown(u32 pas_id);
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 8ea8230579a2..07c278841816 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -10,14 +10,14 @@
 
 struct device;
 struct firmware;
-struct qcom_scm_pas_metadata;
+struct qcom_scm_pas_context;
 
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
 int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
-		      struct qcom_scm_pas_metadata *pas_metadata_ctx);
+		      struct qcom_scm_pas_context *pas_ctx);
 int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  const char *fw_name, int pas_id, void *mem_region,
 		  phys_addr_t mem_phys, size_t mem_size,
@@ -39,7 +39,7 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
 
 static inline int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 				    const char *fw_name, int pas_id, phys_addr_t mem_phys,
-				    struct qcom_scm_pas_metadata *pas_metadata_ctx)
+				    struct qcom_scm_pas_context *pas_ctx)
 {
 	return -ENODEV;
 }

-- 
2.50.1


