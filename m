Return-Path: <linux-arm-msm+bounces-74297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C133B8CF6D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 21:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 297E91B20AFD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 19:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25ED4246763;
	Sat, 20 Sep 2025 19:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgUkMyvH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBDB24DD15
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758397324; cv=none; b=AeArMcov34+hLcj+Uxs6UYXqTgWD3fIK9RhelTNjWrdDZbgUyCjgY9H1vf39V2mFhdcyMJppk0xPE4ept8RgD3xoFgwXNvAMkO5+yXIKe07VNXFJNip5oeG3ETGAnpBzgdXQKn+ZeLxRlcTmxXfKXQFIEPqOsOlARzpJcGHox7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758397324; c=relaxed/simple;
	bh=QqnYvsTf451Epz3/SeiQsoiXxXkbgbS3wzLonj96r0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qOZPo1eyvoVuYDqXqz6Uon+QQ5gTz7TQq9CKmRNI9TOYwYEdfzNL+eMgxy6hUoujaVT2uqB0OxqO49UX3fXWDCVYkKQLhhrStQpENDZqa8sfvoquKc48PiZdB74GrKoihWxHrRl0T1VuOlRPh5TjIMjDzlmEoulSDULbUMDQ+Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgUkMyvH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KJTU4E003068
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15ThtRBkGa3IKqgU1GywTVR6/ueRJluHcfP/0b/5jTY=; b=LgUkMyvHPj/6OHdP
	Om4K99j/YtTAUxUD/KBPufOKS+S6F64I1Dh4BSW6AwDfQOyflmVuLFK6i+HEi/H4
	VgGhHVhUs5cZ9hvm9DuBpOUQ0UrlHArdduMzSnEkQVhsd0a8lig6BCpctQNTSIwN
	TY/HtK+nYztdpQTr+S3AJORyLWRDsc1UlZUdHwMOpaf2BqdfVaafRVrGfSjF/qUk
	YjPHkXxZNX5kRoDTpRUlzOouAA8OQMgcm4oZXmvixtUk1pt3M/bhKvQH06FYiJ+4
	3t4HHXMWxMwC1npZ2H+IiAv2Xs5EmpIcQR6SSeFbSJwRYsFfVsFfxgjkF1xVtShI
	kOfWEQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mn796q8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:42:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77e12c8feb9so1854772b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 12:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397320; x=1759002120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15ThtRBkGa3IKqgU1GywTVR6/ueRJluHcfP/0b/5jTY=;
        b=MQ4weu73edHNT3opL2pAPAQNk+cKQYwOFqYu8SMp17hB/d+LDW9kmd9CkjFVn/Efmb
         azgrZXl2s3CTP9JT5TUy8cnNH/rGzeOp71bKBaVg/5i8x+jcJTMFv25Dj7zFwlMs7rbi
         1i1USbE9wrr1GhgSlPaLNdxe2NdQ4bl3cebEaoIXSOz1mWm677gua95JZweo4OeHMy+u
         OAKG+xkt/tXRyPAP81XH1WhtWWNYycqKrFSk4Vf9LTMdj7IujTegGdVjfzVFizXK1MG5
         /EqSU1W1BV7ItmIUJ+fCyCGDq/P0z/ujlbLviYYC8BI9wYPl/pwhn5vxQ4dIQihZF/Xt
         EwyA==
X-Gm-Message-State: AOJu0Yw3m1Ac1E+OTndFrKQrKN3dGYCmd8ETw+K0F0HQ/2vpR6pyHiZF
	Gfh7Yr5DoZU//6DN0rqIIYni0a++RsokTOzvDRmhIXFY2YpE1Xb6F7osx6DkFqm4ZRyWRKAYKGY
	u5skpG47i7UShgXTRtu1tzsdhIkbrSCA0DEAZvCS3m8GjsZhrQw2zEAbhqyv1qonivfyD
X-Gm-Gg: ASbGncsGnDBtEZb9igb2sPoFAh3FgY38d3Hoq1+Lf1MSgq3wuL4H05998iFNndfRJw4
	agLoQTmRoJQ/q7P0DIfREDuxL0SDC9/CExaflW5XGQDTwxjgrWNpTtG9ShJmz65fwkNaNLVY/M7
	Y5rQn8WCSdxTeOq9BKj+LTdM7UdKp3nmjS3sLXwUP1u5nw/wCpXA8XpAG2HIXf7qDF/strrJwkZ
	AjVNnzkgSwNCPmW0+wu74cRk5cZUBiPwjknG7l3ikorBpM4LZJjTqhe0SB5O2ZuJWTzR4UnBlmX
	pqVfuk0nYeeu8cuOLzo8rgU0wbbuc2+e9YaEU/W5ZKVlilLp8Lm3sIDL2m2Khj0dPu0=
X-Received: by 2002:a05:6a00:3316:b0:77e:76df:2705 with SMTP id d2e1a72fcca58-77e76df2c12mr7595503b3a.7.1758397319645;
        Sat, 20 Sep 2025 12:41:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0JQHuaDi9Ef5aOW8MRCpB2LQ2vRYoPxNqWxI7WaRZYz49g8ehUTKvXnJ4gJllUwznq3gXaA==
X-Received: by 2002:a05:6a00:3316:b0:77e:76df:2705 with SMTP id d2e1a72fcca58-77e76df2c12mr7595483b3a.7.1758397319086;
        Sat, 20 Sep 2025 12:41:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2c8aa554sm143767b3a.34.2025.09.20.12.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:41:58 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 01:11:02 +0530
Subject: [PATCH v3 04/12] soc: qcom: mdtloader: Add context aware
 qcom_mdt_pas_load() helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-kvm_rproc_pas-v3-4-458f09647920@oss.qualcomm.com>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
In-Reply-To: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758397299; l=3290;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=QqnYvsTf451Epz3/SeiQsoiXxXkbgbS3wzLonj96r0k=;
 b=FZcDIqJloGX0bBX3EBcKnYi8sbf5hJjPi9w7Q+LPayOsf2QxIubm5Bw6WZ4C5XIvyTog/gDD1
 Iy44v8dajefBigzT+eV0HYtc7u/YpLTj7zMMA3mLGqwqJdyzbDpuNxD
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMyBTYWx0ZWRfX72C1Wt4hB5e+
 qZRxhiAHEwPnWP/uRoqItnzlpHqzytPGhEJb0XO6o5FGxilKfY3njhSUaxUF0SVO7Qel5YlVqcX
 xmK38myDeQKW8L2P2QGnhdS61KE1+8/SnH9N/jSJ1HPCXgeGrBm8Ot+/hKHGFRy4L34ugKRxvN4
 l+nvDLNr5s3GBdE4+rJyccU4Xq+n+UHal+X4o/cIARx8wHdP+gtJ19tEgsbkYFVbNsV2/jvmsZ3
 kXCoUt+Zq4eo8eguZKgAhSCxucFGvAHaxkk6Mq2abEmx0t7t3uSgRETbSsFvlAJ6rlJ+fZN4S6E
 pHxb2LcermG7ZfmJB0YSaOY9kw6lQOaKxtR2fnQEfWbTLMU812DjmffgsU0QOx7MVA5KezfDCmy
 cYtwnTbU
X-Proofpoint-GUID: ZJE5sJJTWYabhuJscBR7hRC8AHKDkQsA
X-Proofpoint-ORIG-GUID: ZJE5sJJTWYabhuJscBR7hRC8AHKDkQsA
X-Authority-Analysis: v=2.4 cv=EZrIQOmC c=1 sm=1 tr=0 ts=68cf0389 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=clVQRPZNi0AJlk-1oEYA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200033

Currently, remoteproc and non-remoteproc subsystems use different
variants of the MDT loader helper API, primarily due to the handling of
the metadata context. Remoteproc subsystems retain this context until
authentication and reset, while non-remoteproc subsystems (e.g., video,
graphics) do not need to retain it and it is freed inside
qcom_scm_pas_init() based on metadata context parameter being NULL.

Add context aware qcom_mdt_pas_load() function which uses context
returned from qcom_scm_pas_ctx_init() and use it till subsystems
is out of set. This will also help in unifying the API used by
remoteproc and non-remoteproc subsystems drivers in future and
will also help in early setting context to all the PAS SMC function
to do appropriate things when SoC is running with gunyah hypervisor
or in absence of it.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c       | 15 +++++++++++++++
 include/linux/soc/qcom/mdt_loader.h | 10 ++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index a5c80d4fcc36..2ef079797f05 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -486,5 +486,20 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 
+int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
+		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
+{
+	int ret;
+
+	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id,
+				  ctx->mem_phys, ctx->metadata);
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
index 8ea8230579a2..36b8b331ce5f 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -11,6 +11,7 @@
 struct device;
 struct firmware;
 struct qcom_scm_pas_metadata;
+struct qcom_scm_pas_ctx;
 
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
@@ -23,6 +24,9 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  phys_addr_t mem_phys, size_t mem_size,
 		  phys_addr_t *reloc_base);
 
+int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
+		      const char *firmware, void *mem_region, phys_addr_t *reloc_base);
+
 int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  const char *fw_name, void *mem_region,
 			  phys_addr_t mem_phys, size_t mem_size,
@@ -52,6 +56,12 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	return -ENODEV;
 }
 
+int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
+		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
+{
+	return -ENODEV;
+}
+
 static inline int qcom_mdt_load_no_init(struct device *dev,
 					const struct firmware *fw,
 					const char *fw_name, void *mem_region,

-- 
2.50.1


