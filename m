Return-Path: <linux-arm-msm+bounces-87438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40578CF3DEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEAEE317F45C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9720E33CE8B;
	Mon,  5 Jan 2026 13:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxwU/Qwf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VXXDnIiZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68B133C536
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 13:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619422; cv=none; b=NBFEO/yuQHDv2myFxedmRwbnUcOUfHm2g7zPgmvwtUp/6tb0m2G3kKN3JuVbBpOIx7hMWDZ9YhMkLr6tFGkrzrLLE9evKdH+lFo0Mbh8rhC/RLexVIW+B8M/0/sEvzgefWn1QOLVDP1ZRv9mygXVElY0AayULn2vdCj15eyTwGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619422; c=relaxed/simple;
	bh=6F8K/zkrX0qeC580/xJB2YdjtX5REOOH8FpswaScz30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=neWxvURUve1zWvz6tcuXxvkztEmoMl9x6aa73m19qP5XpwBXCIQJ57gf2AL0wH3pVkMNVWchSibG65tOxQ2qbFy2l6NeTTvipRz7/R+JUnZL2ErfF1nyyymnX2aVjZ7cVsZjLWGbTEPc1o3tUCWtn6TfkkNTVAKr7KLm3Zq/KyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxwU/Qwf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VXXDnIiZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058MIjA3760958
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 13:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	786iM0/9dnDx7bEo0CycJSZKYjOjPKU4LuDUpimk85w=; b=fxwU/Qwfgd0UBLls
	+NuF/Px+fyXcrBbuGIFJYg9mRkWl8XSjoxD2VSeZDJ46RjYEy2MdNQNWxOr7/F/z
	je9D1DNFC6eOcrRrIMZOMlOO/DKxwjMqtLLmHx6sV/s41NO7kV75SiesCe6pJbXp
	GTkkjvgKZ1Z+m/UEUsMK7drlaKWkjYN3XTWvtEAYTiP9A39FrxfbgllFLnhvQ+5R
	gK80BJjjmotTct8iskzbWpeQQJj3zksCX159g+gTKusAhWDmoZqnIeklcvq9dMFY
	BT4l+LVW/VWBuWdljSmxT0lA5ZWeApLtrtU7vPlBHTf2OPkA5/14Ki/d83gbGWY6
	Lp7TFQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bet2qvrxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 13:23:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b9321b9312so30792627b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 05:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619420; x=1768224220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=786iM0/9dnDx7bEo0CycJSZKYjOjPKU4LuDUpimk85w=;
        b=VXXDnIiZne1WhvsZpt03NeOEfbFxowXW0AUmHd7rroHiMIm6ArUT0gJSaC0r4PzhsR
         3bPOdhS8kFmrs+zdaLEWczWoC1Z6o5SvE+nbMuDYwDGY+u3Ed44Ksh8CD7WezY6GJYsq
         xxoSHSaz9UqoAz1P67/pL/j8ZLDzBXQAOFjsMpIdZLMxjYstK5HSfgrtAvtb/NkODR4h
         p3YfXtPc3jar82jaGewn/I5TNsFj0kIDa4KdnnvNJcqUVt3nwhcOUiKXxYV6Yh8ygoyu
         d0bbXLGmMTNc/X5TLppd3PRwMxpEnB8FCZnanQI6RQdqkgrTVBGWgnHXjYFOrbFVCYri
         NA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619420; x=1768224220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=786iM0/9dnDx7bEo0CycJSZKYjOjPKU4LuDUpimk85w=;
        b=IubD80tBDgV3hXvoxBUbtWX6KBxGxu9+R8PzCRqnsIO7GwfVpukMNxCjuqcWignY//
         WQluiohJWkR7btQzGl8nQy3/gpm/AUrPm8COVPlJndbjn6If3erIrFSbPrhBPXcQgra8
         rTsAwHr1qZ6QBjprMYmlYSgNy0WE871ez15XtJTrseBzb/5/yvw1wAlo1cmYcoV4cbXu
         z9ipENIhye6eC22ztlJmz6m6cMXocixoCSQZh19YwCh40nagqxbHY7EK7GjMb4SeZb18
         YLktbWK6IRLJ4HbENmjcJyVerICeTuuar/X8y2wtZKkT13dXhguJd7K7ehxQucWfSWDX
         4X+g==
X-Gm-Message-State: AOJu0Yzme4rd2fR0OA0svS9Ycs1xb73UNLWZC4tPyqBC8sel4PdKH+Bm
	W/qLL23csnbGjZ7oIMAfU1/g0aLvIT3EziEq7RucS9acNZ6H2mGVCapalzkCVlfv8Ef5ZpaNjXC
	6+Whyt75imqCqGcRfJw8Gyz3XAPM1HVuU9uUyY5UooQLBIrsYh+9P50NujdfmcbwHFFFz
X-Gm-Gg: AY/fxX5UrPRYI9cnlkJ+MayvlI0WwmfJy+Ab3JFphs7JxHN7tpEugSoyULDhhKkgeYf
	bqu7W/GGrSIgsVpy8ew4cRiThJKkJjE7zOjVz+66AAB29YhVzY7RMmmTIWOQnOJqnHxpldokFXX
	MTCGPCVjjfPOgtoFXQsWOgZqUJhhg2qkJ4QY38rAEdEoT5a6wph6msTyif2aAuFD8H9sRl4LwHC
	oeXolDCaMwQWiEx2Dje3KOUH1Rsgt+NyuKYHYevsPh+dloHu6ZdlWcSa58HevCXXg/flPwvMtdo
	QJtshyYGg3ScYjp8M6TEOjzpH+YqhtQQkH3hrDN4Uo6vEPEGVxpSLygrMPC4pIAuBsBUkzwgWKl
	lqfD7sYab6zL0LsjOM+NVaOqz7z3rX0BGJO6E
X-Received: by 2002:a05:6a00:f99:b0:7e8:43f5:bd20 with SMTP id d2e1a72fcca58-7ff6735e9b3mr46962691b3a.53.1767619419243;
        Mon, 05 Jan 2026 05:23:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuVefsR2CDF2pOtSOxIMU7dFGADO+VJZnfcBcQcKgWwgx09OqvSjEAwaGj1ItkWmczTrEjYA==
X-Received: by 2002:a05:6a00:f99:b0:7e8:43f5:bd20 with SMTP id d2e1a72fcca58-7ff6735e9b3mr46962645b3a.53.1767619418601;
        Mon, 05 Jan 2026 05:23:38 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b127b00sm48426542b3a.21.2026.01.05.05.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:23:38 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 18:52:54 +0530
Subject: [PATCH v10 06/14] soc: qcom: mdtloader: Add PAS context aware
 qcom_mdt_pas_load() function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-kvmrprocv10-v10-6-022e96815380@oss.qualcomm.com>
References: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
In-Reply-To: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619390; l=5691;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=6F8K/zkrX0qeC580/xJB2YdjtX5REOOH8FpswaScz30=;
 b=AyWDM7qKzCG9bSdB4r9xf038RbNG4tvqzleWMIxbq1tZB45arvB9pdFxRl/uaA4t8SOpJBPQF
 VoBXliEgbDfApb8ifY20Ri3Y/rYdwxMyGf+4f89r+UvX8lizLNvnHm9
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: A21foXuC4YZCOURjcNzcAUCOR0e6lmgL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfX6zAM0GyevgK9
 aZtXhOkjhf4CJn1gB0oPA3ur6rJkTIOaJgLhlVoQwFfOHitQ+AtPJX4dMdPyFeUVahrVu/LQPu4
 eD/P7woanywoHT/4kUz6kNxHhudoSIOkGI5ww65iAsvYcMF4c1jctdZvpCLX50St0M9kFsPp4yc
 /Isuu0B52i8BqLAEzzQYveS8gBCjDQDPzhWtgZhdy8PCE8IhWZlBMtJPLrKAJzi3gt4PyD+OD+C
 9ADFkP1iBMfUMKGF2VQ1iC7LlS8KCAdYJ9arDGvBscsMM2HpMtlrVPnimKsgWqcnMwnvUyGrQgY
 pldZHTlza0WQUnFds8g4ElBClxBz7E1vHNmvWwFbxMbyNSrh0QiLLVjaGP6WqD8PIu7MO8TysNo
 lTuvPztqiIhQNs7ZLDT0fG+VelJstr8pEIfY8xEzsCk5e3t8UFaRAtajj4UJiFRstl4Mr0lSOCl
 eHGVoKGhE7mpvxPmtxw==
X-Authority-Analysis: v=2.4 cv=RKK+3oi+ c=1 sm=1 tr=0 ts=695bbb5c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lkfLrt0I0aiTJqoH1swA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: A21foXuC4YZCOURjcNzcAUCOR0e6lmgL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050117

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
 drivers/soc/qcom/mdt_loader.c       | 31 +++++++++++++++++++++++++++++++
 include/linux/soc/qcom/mdt_loader.h | 10 ++++++++++
 3 files changed, 46 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index bfcb65aed008..f746d2f39a1d 100644
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
index b125140100db..50c6a3c6b2a3 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -478,5 +478,36 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load);
 
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
+	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys, ctx);
+	if (ret)
+		return ret;
+
+	return qcom_mdt_load_no_init(ctx->dev, fw, firmware, mem_region, ctx->mem_phys,
+				     ctx->mem_size, reloc_base);
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


