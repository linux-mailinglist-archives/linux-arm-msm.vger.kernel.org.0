Return-Path: <linux-arm-msm+bounces-76969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A348BD2738
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CA8B04F0C6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93ABD2FF66A;
	Mon, 13 Oct 2025 10:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OyCPyBRf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AE32FF646
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349848; cv=none; b=fXPtCBouwLsPXqQ+qhEbQSZwDW8eaVdLeNBut5PdeNbp3BisdigKq9ZgFhPzxru+ngIHcG+fkCr82CxshK12qgDkZtyVVOCBbzi1kOfsn/eEf4CKIZxv6jB4tsSZVziVKtwn084pjam85sTIGkl0O+TfjM7MDIG72ATBZ3J/2AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349848; c=relaxed/simple;
	bh=Icpkan34cU9+IqUCWwoIEvjWttbgIEHHCj+zspriR4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PXcCx6H8+LTjU/wJZk+d/3pw/ufFMkc3eLjQDpqNydmPZo7jTkgYsF5LwpNeXUCTkWvbEJdu7DRekoEixWYJRqBgcavJvM+708YywmKI3pPLhrRRnQ8ntfbRGq13fWzIvcPqtC8hMjBzr7BLTTNfdWUhN+WQS/8MH0EDRktG194=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OyCPyBRf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2n548028979
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D+eo4qyKVLGcgAWX38pSnEzJgrOcwP93t2BBwbeh4iI=; b=OyCPyBRf3F4TLU+C
	N2J9E7p7v9OnfG0oaAOkjvq9exyL+Uk97CTRk7/ph3fL8Jy7SlOmK4FaMcQJ2Tr/
	wV9VlR0PYL+PsowC6nseLoEFaIr7iNZRdyWswAQqWVdiTHtNoWD3Wq4qeYaTeCxL
	jS4H9LtEf/He6lj36mtfGAXjyX6LGZ20wnckXrXAwt2y5+LMxTRolNGbNKB26ZHz
	MSRcJJNNM2tFyfRSrb02KmYFuwDI9c61JmXBx9bVqQfR7yH1NCq1c3Z5/VQ3L3VH
	RY3R8sERuspdXzZIdnOViB4MUOMTMsPMFHN/bomRE9d+pr/aSxpfJ7Lo6yhfgphm
	tnKN6w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5c5sh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:04:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2eb787f2so6745342b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 03:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760349843; x=1760954643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+eo4qyKVLGcgAWX38pSnEzJgrOcwP93t2BBwbeh4iI=;
        b=c0bMg/Tby7u1wjeIl9WjOTg4FS5P0Csu6usY0Ev3fBIrbmgLDKJyELcWqtqdZBXu8h
         9yY4WhRoutpJ9knJyFYacb3pyHNZaSeE27Y7OkvytS+I5p9KnmU9yMgbImcv1SZzlECc
         Rm1UKZ56C3DgtgOBqw+z6a8HF8yU1slWbNtkBym1goyjFRysxhLVS1s3S1NFiyCEfZSJ
         Y8gXB4f+fbs70MtBouoOTB/KKSfpxf+WNPMh0W6RFmG4NdylU/LqZtdKGz29f+YfQ/BA
         6HQGCLaIUKoXogaycK3AcKC1D6lvVHPDUsTSIBVErHdUMVbsrB5e6fWkHHxS6zRpYAjJ
         UAdQ==
X-Gm-Message-State: AOJu0YykgxXbh/olLSQU67gPZSE9p72id6Nn6T7ZqV+CDc6zPPY+WiC7
	QoGye5YgoDtPduGrzMfTEScvC22u/v98RZMz72NruVexGYC3I8ZcTlRQeS7xxJEpAJYuxVpIoR/
	Z2GXe1KSx4J94VOiTAoUXpiEkJWI5CPA+eVSJj+IqlGtE+EbTnHWEdGxwK4ymmiAB33sL
X-Gm-Gg: ASbGncuh0TADyuTVSpAK6bVLlDLOANNdr5erq8ol7QbPS/66+1DbmdR+0iObkez/BWj
	SQ/FAlL4kYO2nGCzOgNNijZ/SpuoB19c6RSNfwJw4ALBqXQtFjvwwKJmIWdMiSaCGKB5jb3ku6h
	c+uXhylSQY1JYjVSEI1H2Ux8JT+ISFx7f6fcsrngt0HjT4JZP9WhU8JaJDuoZlchfkotNc2mJuh
	JmoZL++4dVNZMmyDlQBuaFC7Fd/ITq22IlPaMrG01FyL/6YR4WZF4insPQSSbcLOGaTimkOr06Y
	AAcbDhADpdtNs/vJCKaGEIuxxwv4OE+bIzNpPhxL7wF0hBzvjPKTtMr38q65G7wRuIQ=
X-Received: by 2002:a05:6a00:2ea1:b0:781:2272:b704 with SMTP id d2e1a72fcca58-793853260damr25668154b3a.5.1760349842767;
        Mon, 13 Oct 2025 03:04:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6i6nuGn+P1BIm9lbVj7yDxa2McgSYNKD7vdGfdIn/WKRA32N3oYYdTDrYQP/v1UbanNveRQ==
X-Received: by 2002:a05:6a00:2ea1:b0:781:2272:b704 with SMTP id d2e1a72fcca58-793853260damr25668110b3a.5.1760349842149;
        Mon, 13 Oct 2025 03:04:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d5b8672sm10981657b3a.69.2025.10.13.03.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:04:01 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 15:33:09 +0530
Subject: [PATCH v5 05/13] soc: qcom: mdtloader: Add PAS context aware
 qcom_mdt_pas_load() function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-kvm_rprocv5-v5-5-d609ed766061@oss.qualcomm.com>
References: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
In-Reply-To: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760349819; l=5658;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=Icpkan34cU9+IqUCWwoIEvjWttbgIEHHCj+zspriR4Q=;
 b=ZtKuOgxV5LquwO4E4dWmMzbw3ZqqnB4suE2tk30MOgMLrAucjqhXcqN4uQ7N+12+ZpOAkDRhv
 xXyFebE4QvVD85a0bQPdltgLlDGEM29ANWqNzN+iHdeNMwZQyXe8DiL
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: PNry0HYaQ-EWtGO6YHP0526_tNygNlOY
X-Proofpoint-ORIG-GUID: PNry0HYaQ-EWtGO6YHP0526_tNygNlOY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX9W4OBJSYfR6Y
 ZKYfMooofdo0fXeYsXVeMptwoyMq6w1w8ALgS2qZ3rDs37rooJBHA+XucAsSB4Oo/q3d17VOikt
 gCQuOaWsOiIGNy24iV+gHdheuL150gjgLg1TLZJTxlijBpaN2GjvWPxnGunh9yvOBL4Oia9Ws5+
 g9S8/5e7ml+5IRhw2uNJa4PA2ivXiaGO+TA3o25o0uRkVBGJ4wv5UO7O/AgIkTHKJP7MED18V2u
 Oa+y6xYLEmp+hiopXIg+8z98O9G1ZrI2XkPJxxnqcMlAwOrgbbMiFVp6Jld753fW+mvoeAfvuIR
 SBEb7Ke4IFMIyGaQjd/dylbSJ10xKmVS5T7cIb1qVIM+JU6Daq9/7H+Nq/2Jwel8CskH9Mw6Z/W
 zeO4zUyaVLMXtVWufJkrAN6XAIg5Ew==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ecce94 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=tZ3jCLSBV7jl1JjQXpgA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

Introduce a new PAS context-aware function, qcom_mdt_pas_load(), for
remote processor drivers. This function utilizes the PAS context
pointer returned from qcom_scm_pas_ctx_init() to perform firmware
metadata verification and memory setup via SMC calls.

The qcom_mdt_pas_load() and qcom_mdt_load() functions are largely
similar, but the former is designed for clients using the PAS
context-based data structure. Over time, all users of qcom_mdt_load()
can be migrated to use qcom_mdt_pas_load() for consistency and
improved abstraction.

As the remoteproc PAS driver (qcom_q6v5_pas) has already adopted the
PAS context-based approach, update it to use qcom_mdt_pas_load().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c  | 24 +++++-------------------
 drivers/soc/qcom/mdt_loader.c       | 32 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/mdt_loader.h | 10 ++++++++++
 3 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index e9dcab94ea0c..ee0ea35803c6 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -239,15 +239,9 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 			return ret;
 		}
 
-		ret = qcom_mdt_pas_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
-					pas->dtb_pas_id, pas->dtb_mem_phys,
-					pas->dtb_pas_ctx);
-		if (ret)
-			goto release_dtb_firmware;
-
-		ret = qcom_mdt_load_no_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
-					    pas->dtb_mem_region, pas->dtb_mem_phys,
-					    pas->dtb_mem_size, &pas->dtb_mem_reloc);
+		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
+					pas->dtb_firmware_name, pas->dtb_mem_region,
+					&pas->dtb_mem_reloc);
 		if (ret)
 			goto release_dtb_metadata;
 	}
@@ -256,8 +250,6 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 
 release_dtb_metadata:
 	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
-
-release_dtb_firmware:
 	release_firmware(pas->dtb_firmware);
 
 	return ret;
@@ -305,14 +297,8 @@ static int qcom_pas_start(struct rproc *rproc)
 		}
 	}
 
-	ret = qcom_mdt_pas_init(pas->dev, pas->firmware, rproc->firmware, pas->pas_id,
-				pas->mem_phys, pas->pas_ctx);
-	if (ret)
-		goto disable_px_supply;
-
-	ret = qcom_mdt_load_no_init(pas->dev, pas->firmware, rproc->firmware,
-				    pas->mem_region, pas->mem_phys, pas->mem_size,
-				    &pas->mem_reloc);
+	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
+				pas->mem_region, &pas->mem_reloc);
 	if (ret)
 		goto release_pas_metadata;
 
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index fe35038c5342..52de8adcc4f2 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -486,5 +486,37 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 
+/**
+ * qcom_mdt_pas_load - Loads and authenticates the metadata of the firmware
+ * (typically contained in the .mdt file), followed by loading the actual
+ * firmware segments (e.g., .bXX files). Authentication of the segments done
+ * by a separate call.
+ *
+ * The PAS context must be initialized using qcom_scm_pas_context_init()
+ * prior to invoking this function.
+ *
+ * @ctx:        Pointer to the PAS (Peripheral Authentication Service) context
+ * @fw:         Firmware object representing the .mdt file
+ * @firmware:   Name of the firmware used to construct segment file names
+ * @mem_region: Memory region allocated for loading the firmware
+ * @reloc_base: Physical address adjusted after relocation
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
+		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
+{
+	int ret;
+
+	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys,
+				ctx->metadata);
+	if (ret)
+		return ret;
+
+	return __qcom_mdt_load(ctx->dev, fw, firmware, mem_region, ctx->mem_phys,
+			       ctx->mem_size, reloc_base);
+}
+EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
+
 MODULE_DESCRIPTION("Firmware parser for Qualcomm MDT format");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 07c278841816..7d57746fbbfa 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -23,6 +23,9 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  phys_addr_t mem_phys, size_t mem_size,
 		  phys_addr_t *reloc_base);
 
+int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
+		      const char *firmware, void *mem_region, phys_addr_t *reloc_base);
+
 int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  const char *fw_name, void *mem_region,
 			  phys_addr_t mem_phys, size_t mem_size,
@@ -52,6 +55,13 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	return -ENODEV;
 }
 
+static inline int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx,
+				    const struct firmware *fw, const char *firmware,
+				    void *mem_region, phys_addr_t *reloc_base)
+{
+	return -ENODEV;
+}
+
 static inline int qcom_mdt_load_no_init(struct device *dev,
 					const struct firmware *fw,
 					const char *fw_name, void *mem_region,

-- 
2.50.1


