Return-Path: <linux-arm-msm+bounces-85578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B815BCC8DFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D54E33087F65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2640E346781;
	Wed, 17 Dec 2025 16:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfcKZJaM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRkTsPGt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC43354AE5
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989336; cv=none; b=nEBbQzsT9SWI594IqtZp5LEbxAbJcZS1y3hzreR6r564ehSc81OXF5UfI6pq0Vi2UHovXGfbqImmw87eGXktxDutcLkN/mw6yZ+OVGKdB046sURoAZa4tzU/0Hf8Ve2UbUi5Ln2KCXJOQPcF9Vh3/RvdZnTS8RpjjdUos/gw2B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989336; c=relaxed/simple;
	bh=FAxVohbaSqYOeL1tiCXnhoUqP1k3h7eieaHb5VvFGf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kHGE1Vq+s+E+eIUwwnz8+gv0NrmeiCL+jHRYtxEuFrn0C6J7xIqqmOuXO/aspYAhpz6IDtlWmsrQLR44u6S2vtMVpQrXM1DGPY3iP+7LmYGULtcpACwq47rOJrLdMQd9FdiR7NAUkMbi31X0k1kV8ucSY7Isye1lXfmPnXIOA0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfcKZJaM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRkTsPGt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKovt2465110
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YGBJ3wXs+b7+nyeDhGQJtyljMMb0eEpcnD47PuoXhNo=; b=WfcKZJaMQ8TMSyLt
	M02v1gRmrQlh2rlcquwUuQx2GbxvGHvhh4GwLijVAgC068SglFyFwBdk4jc7bErF
	ovXMhFinklzbxn7UJZfEN+vCeI82ggU74o8p9ssI16+AgPS2Bn5/Nu+Jy4FtTHAn
	Dwdg48trRdS61iTaamkzHbj+0B7a4gxb1V74jt1Ko/FUK8JuwOMHsaBTi7BAirQu
	NmRh+YE6iVn9TGHaX2IJHdySekdUnffUovnjZA1VhJ9GA46bjyPSxPH0NX6kfxWJ
	m1DFibirFFLG9peCtzMK4aR1/JAVGwG/0RsxfebrC+uZY5yxlZJd5HvrxK6I3mpn
	rm6/GQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fe2b7md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0a0bad5dfso86030915ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765989333; x=1766594133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGBJ3wXs+b7+nyeDhGQJtyljMMb0eEpcnD47PuoXhNo=;
        b=fRkTsPGtJJB2Fk6h/Sk7jIjrRiRkPgTXLfTxx/sSbOi+H23opypofGH0e56Wfh5kMR
         BEB0PJ4C7apy1SgMBltRYId+5ZdvUzwdPyrgHeq7wd2t1EuKBDbWZbGrEZ7HUjv07A/c
         XIkYpE1iLKbYWzMr3a4KTnk3eMg6pLQf5PFy8x/ruxtebF4/olRPJczOEUJGST1nKHdc
         85BiAzVEpfKVw9eEZl48peo4/TaksGhz+p+51nptA5TVHgQDNPXA+HCxKNSEV+W1ahP1
         YcFfyAYwI5qLh7moFrCXQq7I0Uy+8wjiycfJkCznBwl6E3YjeNIF85jvzVwZIq+FOus/
         j6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765989333; x=1766594133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YGBJ3wXs+b7+nyeDhGQJtyljMMb0eEpcnD47PuoXhNo=;
        b=sl0YKjvJ0OTlrj3hpFv4kxYCfgPXs00vCCi3qRtyyg39Vbhu8e+5yHf7fvMN5brQ5F
         jgnXaIbw/Ho/u3iUv+i7HZbBkPMWe2KKjzYad6czIvARcGqcz24wy+qGAiDFlWJ9oDDR
         RaeDWGaaGi5PXbHMRPBq0lfX45y43XYVm8rNi4TxafPs42QZ/E82Le027LJWHqS1uZYT
         QgXQHWMfnxRtB/AdfK2XTiWanheqRvPeu+v9Up46HnHnZ8qeR8aWzO1hneAtfUehz2qR
         yk9dLNo2s4kLcfershhUxbwi3ppNoWVZc+Z7/TQr/Yd0zvuk6aMsagpPR7ErNdTn3l7m
         Cwtg==
X-Gm-Message-State: AOJu0YzfNOq6Aor+Qnhbl5yvBpg8dry4s9+NrGAIKJ+eQ2k97U4H51/e
	hmhNwVwy4+Reyiyna/cToDlNze8Ct6Srrf8Wg/OuamCjv3vlmmRmGzHMauKymx6FZ1qalSn4JIG
	8gNnnkOCNH4XEbO1RsfgvsH75dRsthp+AjXwjFiu73sD1ffCmEzt7h/0qwzxf8rooN6mJ
X-Gm-Gg: AY/fxX4DxJiFRAkmDNw4t6ZdWG/NqZNrRZLC7A/DY5To/KbMkPv+zr3XY3uYfJya2ec
	kkxtvxr293kRoRDIdpqm2LOt0+atvQX9jZPx2G5vyo8STaNQGt0xPJoLdfCX8AVqHbPJ9erpqVU
	u5qZjYq4nmZAGv/r8Q8cjE/IGGEpZQC9jLb8GMRy6dso4q1BSrTGBNxYHXrE12zBzmXQyWjxlDv
	TsCDIgp8uhQW5mnnQrt43YT59QJwbgrptRfLZgVkB7NJCI/tzITRMEkTZPpUy7la6U1zD/U/l2Q
	nyRvIjG6cnDJbTXLYwTd7gIb0Tl1gStxCFo6I7rSxrHaZVJ6Ec11EFsptgq6Rk5aePsssrJXrRg
	E6vOmrOwidw6lZtELSMpDmWtHqcUcgPkhN10C
X-Received: by 2002:a17:903:198b:b0:2a0:d59e:ff67 with SMTP id d9443c01a7336-2a0d59f0258mr107033145ad.38.1765989332168;
        Wed, 17 Dec 2025 08:35:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYgRpzdDXsmzuKXAZFeBMmQaeSzJ0GI/Lnsu7gljh0MviilVmNKvIedyUebebrTOwmGMz+pA==
X-Received: by 2002:a17:903:198b:b0:2a0:d59e:ff67 with SMTP id d9443c01a7336-2a0d59f0258mr107032695ad.38.1765989331500;
        Wed, 17 Dec 2025 08:35:31 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36af7sm204721055ad.18.2025.12.17.08.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:35:31 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 22:04:43 +0530
Subject: [PATCH v9 07/14] soc: qcom: mdtloader: Remove qcom_mdt_pas_init()
 from exported symbols
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-kvm_rproc_v9-v9-7-ab7ac03e0ff1@oss.qualcomm.com>
References: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
In-Reply-To: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765989299; l=3524;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=FAxVohbaSqYOeL1tiCXnhoUqP1k3h7eieaHb5VvFGf8=;
 b=6UMU+GKj+lHADAJD13/SwbP2YBESFQ+mYB1+HWQdnaMF9y9VwLRQnPMT0a7AvkVhs9/PZnnpb
 Xc403LqhbcUDVXFsq/YZ/s6sUEsg5LPWzHDAr6Opzky2ob2aWUjCjZ5
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: 9GPm2jjHYokVhjIdTm7xG8h3JwEclujp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMSBTYWx0ZWRfXz5wZw9qaPbQt
 eEjlU+w0kVfV3Wm0Eb0YtZgRLXvONnMZThmXLD0Pt8DCQzQeTFBYJyKQ6SKdSMbNs3/qC3BWXy1
 /7FH5mSsgjSPX+cOAaP7voGo9pVwTKvXI9vB01IRFa4EYXfndrZtVI1TFBB/+hWmiiGPC6fWa5X
 dOHzzFmgGYNXzNg8pCfdPrfAnUZ3ka/RNTrmjqPaR2ZJfYsu4AJCi1tjUlv8jYaa/NshaGdHU+0
 7/ilYOx3B/s2sfGTgrejPtzsBv80TzLmGi655OEUbQt98/mjAuKV8zFdOOcIFI5XKb5E9eSnekk
 ucvxqS0hDK71uJu0ZZeY9YVlk+Q587lbGQW7rmfHMIIv+aJ4rl5D2Ax7ZisNh8yzWoWj12Qi01I
 gxWQdJ2tpgWboeko1IwXtZkRDLfLFA==
X-Proofpoint-ORIG-GUID: 9GPm2jjHYokVhjIdTm7xG8h3JwEclujp
X-Authority-Analysis: v=2.4 cv=HpN72kTS c=1 sm=1 tr=0 ts=6942dbd5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Z4Sw7GGoVt5sTUwIiKwA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170131

qcom_mdt_pas_init() was previously used only by the remoteproc driver
(drivers/remoteproc/qcom_q6v5_pas.c). Since that driver has now
transitioned to using PAS context-based qcom_mdt_pas_load() function,
making qcom_mdt_pas_init() obsolete for external use.

Removes qcom_mdt_pas_init() from the list of exported symbols and make
it static to limit its scope to internal use within mdtloader.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c       | 11 +++++------
 include/linux/soc/qcom/mdt_loader.h | 10 ----------
 2 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 50c6a3c6b2a3..054abc81e76d 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -238,9 +238,9 @@ EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
  *
  * Returns 0 on success, negative errno otherwise.
  */
-int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
-		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
-		      struct qcom_scm_pas_context *ctx)
+static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
+			       const char *fw_name, int pas_id, phys_addr_t mem_phys,
+			       struct qcom_scm_pas_context *ctx)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
@@ -302,7 +302,6 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 out:
 	return ret;
 }
-EXPORT_SYMBOL_GPL(qcom_mdt_pas_init);
 
 static bool qcom_mdt_bins_are_split(const struct firmware *fw)
 {
@@ -469,7 +468,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 {
 	int ret;
 
-	ret = qcom_mdt_pas_init(dev, fw, fw_name, pas_id, mem_phys, NULL);
+	ret = __qcom_mdt_pas_init(dev, fw, fw_name, pas_id, mem_phys, NULL);
 	if (ret)
 		return ret;
 
@@ -500,7 +499,7 @@ int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *f
 {
 	int ret;
 
-	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys, ctx);
+	ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys, ctx);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 7d57746fbbfa..82372e0db0a1 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -15,9 +15,6 @@ struct qcom_scm_pas_context;
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
-int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
-		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
-		      struct qcom_scm_pas_context *pas_ctx);
 int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  const char *fw_name, int pas_id, void *mem_region,
 		  phys_addr_t mem_phys, size_t mem_size,
@@ -40,13 +37,6 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	return -ENODEV;
 }
 
-static inline int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
-				    const char *fw_name, int pas_id, phys_addr_t mem_phys,
-				    struct qcom_scm_pas_context *pas_ctx)
-{
-	return -ENODEV;
-}
-
 static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 				const char *fw_name, int pas_id,
 				void *mem_region, phys_addr_t mem_phys,

-- 
2.50.1


