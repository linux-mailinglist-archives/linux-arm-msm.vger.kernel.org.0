Return-Path: <linux-arm-msm+bounces-81585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFB8C56E9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 11:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B1C93B5752
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4633D33436F;
	Thu, 13 Nov 2025 10:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B0gNBxjn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cmLO8dgP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6D8330327
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030195; cv=none; b=GS4QMDdgSuMOuMqg4PiDqA7v1XSR4g180GjBQRXq5WIc0LbK9uniWv2qAqTxK1siLy9Adk/v7rHX64FeeNMemq7VBehfHOLIZ2H0B6MlfPMrNo6zsL6EChtlOP86TciqjmD7dZcy40wQn1CiGRMVec7sd0wOS16cJhKjnVeNhWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030195; c=relaxed/simple;
	bh=HxGHSN2cQ3gu+FaVPlop+jwgb/w1KNBxNEMyTx7qQU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oDYnJSble6wzqSWZTyB28feJLBC9PifxqQj+xFSIVC4f4uiDcnnwJbKTFz3SsrLEkm3sC9zfXVA6fv5MD0NnROywmD1kv0rK//y1ydeygaXKoviaE6uuCm8EGBRHbTWi6oyCmBw+IttdPPvsexdqGHZ+FGtLBelUWQQMcifYOls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B0gNBxjn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cmLO8dgP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD97MEY2962633
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBLDUCNvzpusWvvnDqSd4IuiE27v+XlQxH1m2+gil9c=; b=B0gNBxjnOQw72VfO
	JCYyGGWAzgBFN84gjun7mJoi+WiXk1x0bUHUcB69tcRhnilWqZ7W/qaUVp0tz/kO
	pWhrXCTgKO8kmq4qnlVnCNbL+WpPnmoGWvuXARITMepYywgnycDz0G5Z9a1G5rYL
	S9VZJ3ssgBDz75Pbm78AofEV+wdHAdKIv3+amMs89hzeyNrJ/mB11XDpnuumYl8u
	Z01klEN92U0WiMQeQqxs572Fk9t3NIpZME+IjgEo3xsaEV1ROlJ0Ml1T5l9eQkLM
	FkTaW+cYBkWzf7zHE5Ewx1PC+JVLGZjsRlkbnOHqBKg+FLFmZDieI31gu3KGPo4R
	xZcZqQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acwbpu7aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b895b520a2so706828b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 02:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763030192; x=1763634992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBLDUCNvzpusWvvnDqSd4IuiE27v+XlQxH1m2+gil9c=;
        b=cmLO8dgPN4eDmTW9gm6CVMehZE7J3Y1KCmGttC6FprqRDp0Be+p/eVccJByuCrv/Nh
         ImtOzpc8RwsxWjg/TyLJtHLzVmaFV5uj24mzXxxwd0o9+PO/2KTGuGaK0HiGeXnu2NNW
         P9NnsTFabvcHVpVoDSdrFTgcBg8THw9invWua1lWK0cFARg2Wg88hajNXR/ecWm4dhaG
         neosSasa8S1I3nF4x4Ays0RpLLaQPBq8xwZCKm5tndAKU2FMvZt/chMrg8emG9fshBIe
         5noEspPHvxIuFHTirOHGr9rwS80qHYkdPXcnjDhSkP5IwMos2HOZKZRUaTfS609dRTqi
         otEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030192; x=1763634992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GBLDUCNvzpusWvvnDqSd4IuiE27v+XlQxH1m2+gil9c=;
        b=fvehsOkxMONipCMRuWBQGjU/E6ss0Y8xdFFt+d+j/q/buhlIvtN0muiMGxI+Hh+JdQ
         XEfvp93H2GORjMFEI1OluIk93h/kvFPVhp30r/StC5GRA/vSstKyV74BcBkQ6mLL9EMo
         Bsb+XraRo1uUeYKtYJk52emcrzN+mPdGmQCcTcSNyG/RW9WUTOTEnNLjak3hZ0BKDelH
         UiQ782Ah7MZ3buXKGaWMnad1pV0JtXLLqbF5B64rYyveCYuQY2K+afZOB7KzWUJr1JDk
         fRuElh5Go8Gb97Y6ibBIUasVWXGdprenW1Z57wApR0v/1sRSDsiaCDM53z6wyDcai9OS
         30og==
X-Gm-Message-State: AOJu0Yyvd+ZRqC78hREc38SbjiTUqZALy0NMYHNAth7nlWSzOmr0RT4H
	CPBC/zihhzqm2HClR5ThhwEsJclUrJFc/gEH/8xJhG0GL0jgRr+Yonj0QLCngKSjNhcR3ryCdYT
	KZ5DEYJ25scVflTL79HdJrKCe+6JhxK8AHimX3ju0f0oTfaL9Gy2LXp+5+gp5ZNQSm3Ei
X-Gm-Gg: ASbGncuXa1fjezZcAtAGNlm4iT2Hh96yT8Q5ud1YUk8CkN67Md0zYPNMzAd8PQLhSNU
	fBHnIonwj7pPDrujPGp/YzTwKMlUYPvjBdfOfbQpOnFXRav/ww6oi7eujQpjtjkndrvPA3UrpF/
	hOF/3WuXUbRsUAl1yg0bN5rIpU3jImGJF47v1q2SwLLqtjjYcCfcY/GtUNYRyyYYLQmo7e1T33Z
	6bTE50EOZhVJ/q5jpcLlU1AIMula37QwnnhUhXxHLUJnIZ6d5sOsouKWV7vWXf/bcZC9BF5NufU
	gxErcWxem9Ih+Vpvcxq2CWQ3X3sdg09zZZfFYm9pPKNFDEGWeQU2A54GuWGJJpgwtmP8ypRZFJm
	WAMQhgJL68WBO+NrvD9961Z7n2g==
X-Received: by 2002:a05:6a00:a8a:b0:7b7:5dc5:75b8 with SMTP id d2e1a72fcca58-7b7a54bd537mr7291000b3a.29.1763030191310;
        Thu, 13 Nov 2025 02:36:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFidGfe+xfKhxmR4W0jnBWRPVni0eg7nxdS4NdAF6hWNVtVMm/b4NIl0U6PHkEgxiJzdXRsqA==
X-Received: by 2002:a05:6a00:a8a:b0:7b7:5dc5:75b8 with SMTP id d2e1a72fcca58-7b7a54bd537mr7290953b3a.29.1763030190624;
        Thu, 13 Nov 2025 02:36:30 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250d2d16sm1886922b3a.22.2025.11.13.02.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:36:30 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 16:05:56 +0530
Subject: [PATCH v7 06/14] soc: qcom: mdtloader: Add PAS context aware
 qcom_mdt_pas_load() function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-kvm-rproc-v7-v7-6-df4910b7c20a@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763030164; l=5709;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=HxGHSN2cQ3gu+FaVPlop+jwgb/w1KNBxNEMyTx7qQU8=;
 b=s4Q5f1vm5edxvzi9RhuifDMkCfchvW/gCF2WYx2f2S81/g5jqJfgKmkhYI1ZZKg8v0a348HVU
 kYOkatfyBTCB1pRAprWwaJDZby+bYn55bRRUNDcnhmK43szHwRSnC02
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=NvjcssdJ c=1 sm=1 tr=0 ts=6915b4b0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tZ3jCLSBV7jl1JjQXpgA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: zbIMhpUwpqaIt_dmJNHk75SuIm-dSjrO
X-Proofpoint-ORIG-GUID: zbIMhpUwpqaIt_dmJNHk75SuIm-dSjrO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA3OCBTYWx0ZWRfX4/jK+8YAX2cN
 VwjkrM99OYWAQJ/aSw7KJribtk+pFsKvPGKvtLbxC1Cw1viaVdyi5PO2u1JZ2/83tjDnlJfnRw0
 VogHm4BYFHqHzPs1U3WGvuPbZNtzyF6AaqA9ZueBl99Yumb2D0EkKEZlKOghf+kOC8pahN3sfR7
 6Sf/Jg0A6iqVdJWE6IIgLF2qWONQpwmxj3czr9a/bJcRmMfUhZz1tdJHwCq54Z+cU1e5/1YlmDc
 q10/HW+LARsLnRL88ho+FdEGSMpirWRCCZQvzw8decnGHRz8EW0Oiz21Is/Fqjdask2vpDy6o7z
 utp5A1wY3XNUbJ7Sl7LUWdiA/AeTylM0mEvHTI3QxFejyALGnamSZa/IF00xBqQ8L9OJOrRqgke
 jSsSpIqKklaUjbG+2QxI3Hyb7rfaWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130078

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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c  | 24 +++++-------------------
 drivers/soc/qcom/mdt_loader.c       | 32 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/mdt_loader.h | 10 ++++++++++
 3 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 729e7b9bc183..9feee2cb1883 100644
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
index fe35038c5342..c868b9c416e6 100644
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
+				ctx);
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


