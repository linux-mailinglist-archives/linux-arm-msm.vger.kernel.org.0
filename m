Return-Path: <linux-arm-msm+bounces-3989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEEF80A680
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 16:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02EBF2815D6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EBCC208DD;
	Fri,  8 Dec 2023 15:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fgScv7an"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB60810C0
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 07:04:45 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40c07ed92fdso22966225e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 07:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702047884; x=1702652684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vqsZcKguWohjsHLctat99spRZt5y5tI5qjm0SvLl4ZE=;
        b=fgScv7an4HitG28gBHCyWXr97WHImnDASHeFH3/Xv0+GMPbbSx5skst45ACl1HLqUu
         B6bqetDXaDeQeGyQgXbDk4b+kLnnpqcpAdjVor/6LA6Z4bFO0Bg65/qqjM2gh1gUMMjF
         QJSH6ITkeLAztT4+1FXjTV+/JSHe1fC6LCINVBeJ8BE6BaJltCkkNw2v3oGfWj5a+8wn
         qbPWBdrsf28r+p4CggGDKdpcWUUV2aXEarN4Ykcufhka5E3ATrAdMyGV8UBRGRY7f4lH
         hI5c7yGjZNdiZHEeQAqSE/GgYASeK0PrpKaP+in1bDYCRdaY2CkQE5z0cPCedozxzntI
         DR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702047884; x=1702652684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqsZcKguWohjsHLctat99spRZt5y5tI5qjm0SvLl4ZE=;
        b=oAcaMiF6a9qrwLJROsGvX1UcoMkdbwr4bWrOBcIX1soJbJP3nQAqwEtahwBNmeXjM2
         BywiKKPpu4+IkADLk+VqrCkQQ2qbvEshX0sD+51ENdB7UzQsS2Y9lcoMJ73Ru0lmtG0e
         aK0g5aG8UOfODfseX6+wwesfU8Wf8qKNHjStGZthXB+bd/cEc3DHGGFVjwAS8BUTyAWi
         TPcSQZizTPPocdGn8EM/Br8VEJ9lTMt7d0vPPKe31DXzaRXRpVZhMUXQrXBYR79nGaia
         7K2t3mAIl5tbPdgbjpmgJYKMjnpVQlf7Bzs+7uUcrUs8LUgj7elp018nPV0YwCcdllmx
         ceuA==
X-Gm-Message-State: AOJu0YxBuRpb8uAN98nQlt9pioKY+oitYZIp2Y0fjFMs1qhZjB+15GIb
	aTlXLRN+K7kOsXdsTXWGsPtWcFwl1KXGMRJf3WUZ+a1d
X-Google-Smtp-Source: AGHT+IEGrOMDBSqbJbtKBd1B39IlguouFg19YcjI+RXPV6h3LgFUtfUHRmjp7+SERjDE3IbuPml7hw==
X-Received: by 2002:a05:600c:3187:b0:40c:2b01:e09e with SMTP id s7-20020a05600c318700b0040c2b01e09emr68023wmp.47.1702047884171;
        Fri, 08 Dec 2023 07:04:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id v12-20020a05600c470c00b0040b37f107c4sm2000403wmo.16.2023.12.08.07.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:04:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 08 Dec 2023 16:04:34 +0100
Subject: [PATCH v4 2/3] remoteproc: qcom: pas: make region assign more
 generic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231208-topic-sm8650-upstream-remoteproc-v4-2-a96c3e5f0913@linaro.org>
References: <20231208-topic-sm8650-upstream-remoteproc-v4-0-a96c3e5f0913@linaro.org>
In-Reply-To: <20231208-topic-sm8650-upstream-remoteproc-v4-0-a96c3e5f0913@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Mukesh Ojha <quic_mojha@quicinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6215;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ngRD2EAfVMz2KjhJy1sRQsKXQwwdQll+L7PCtpZ2fv8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlczCEqRI08YmvdKKcw1RoHeYRnkkqlBCzasaIPUVO
 AwQdtwSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXMwhAAKCRB33NvayMhJ0Tg3EA
 CThhkclpTj+X0mF0zlyJbsBBIYVn69T8AOYxM7v6jLB2iqp0oRaFXGFYqSIYwCX//NdmjnkCuz6igy
 tGFYoF0iWz28h5p5K/OmSCq27HJLwX5FoFdAUSWLf2v5hMixIUauwdnlC9apNXXvKPRvYIOcf2Ygck
 O2pZfHVgzOj8SXgaKK3TUxCn2RE/5J3Lx+k0KKkMbZzzaKjUVbi4EdaEjJEvd3FM5geJXWn7BUv/GG
 48gVdE/VK0vLDHxC6icB3ErZbGxq87L3/VYBKvnjTdhrqEKvre3sG/toPYXiktPX4xd2bJkWBES1Fu
 Tp9eEwH2ehuOSj4xZnPInxtFK+hxqmQDs8UWRo9OJmP6uW5+C6IRFXkdk+zCo81k1K4BLwbBwWvR1A
 kNEhJ+Hg0oggSVnYM28fxUEGm9hZJXxiGm5fAsb/dYUF9gb6VRU5VJ1qIVeoyDINY23gNt9ip/LuN0
 bbn/iiiXQQo8ZPl6hKKTeMfHlLLg0TDJd+35Gx1y9K1Fnj/X74U2yepnrhoCYIJC6ZtOHtLlobxk8G
 U0lQRa9cngUv1svdEnwY875d+5DkQer+UZQ0vnk4PAhR0uyX8ApqDeFnGdXU5eziNdAz3Ht3PxPGkn
 k4AJljXcXjm5wDdRltrti5H+lus/ZO4iqtjNTYi/gwhSCo7b+CBr5EjjaQvg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The current memory region assign only supports a single
memory region.

But new platforms introduces more regions to make the
memory requirements more flexible for various use cases.
Those new platforms also shares the memory region between the
DSP and HLOS.

To handle this, make the region assign more generic in order
to support more than a single memory region and also permit
setting the regions permissions as shared.

Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 100 ++++++++++++++++++++++++-------------
 1 file changed, 66 insertions(+), 34 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 913a5d2068e8..46371f1ad32d 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -33,6 +33,8 @@
 
 #define ADSP_DECRYPT_SHUTDOWN_DELAY_MS	100
 
+#define MAX_ASSIGN_COUNT 2
+
 struct adsp_data {
 	int crash_reason_smem;
 	const char *firmware_name;
@@ -51,6 +53,9 @@ struct adsp_data {
 	int ssctl_id;
 
 	int region_assign_idx;
+	int region_assign_count;
+	bool region_assign_shared;
+	int region_assign_vmid;
 };
 
 struct qcom_adsp {
@@ -87,15 +92,18 @@ struct qcom_adsp {
 	phys_addr_t dtb_mem_phys;
 	phys_addr_t mem_reloc;
 	phys_addr_t dtb_mem_reloc;
-	phys_addr_t region_assign_phys;
+	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
 	void *mem_region;
 	void *dtb_mem_region;
 	size_t mem_size;
 	size_t dtb_mem_size;
-	size_t region_assign_size;
+	size_t region_assign_size[MAX_ASSIGN_COUNT];
 
 	int region_assign_idx;
-	u64 region_assign_perms;
+	int region_assign_count;
+	bool region_assign_shared;
+	int region_assign_vmid;
+	u64 region_assign_perms[MAX_ASSIGN_COUNT];
 
 	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_subdev smd_subdev;
@@ -590,37 +598,53 @@ static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
 
 static int adsp_assign_memory_region(struct qcom_adsp *adsp)
 {
-	struct reserved_mem *rmem = NULL;
-	struct qcom_scm_vmperm perm;
+	struct qcom_scm_vmperm perm[MAX_ASSIGN_COUNT];
 	struct device_node *node;
+	unsigned int perm_size;
+	int offset;
 	int ret;
 
 	if (!adsp->region_assign_idx)
 		return 0;
 
-	node = of_parse_phandle(adsp->dev->of_node, "memory-region", adsp->region_assign_idx);
-	if (node)
-		rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
-	if (!rmem) {
-		dev_err(adsp->dev, "unable to resolve shareable memory-region\n");
-		return -EINVAL;
-	}
+	for (offset = 0; offset < adsp->region_assign_count; ++offset) {
+		struct reserved_mem *rmem = NULL;
+
+		node = of_parse_phandle(adsp->dev->of_node, "memory-region",
+					adsp->region_assign_idx + offset);
+		if (node)
+			rmem = of_reserved_mem_lookup(node);
+		of_node_put(node);
+		if (!rmem) {
+			dev_err(adsp->dev, "unable to resolve shareable memory-region index %d\n",
+				offset);
+			return -EINVAL;
+		}
 
-	perm.vmid = QCOM_SCM_VMID_MSS_MSA;
-	perm.perm = QCOM_SCM_PERM_RW;
+		if (adsp->region_assign_shared)  {
+			perm[0].vmid = QCOM_SCM_VMID_HLOS;
+			perm[0].perm = QCOM_SCM_PERM_RW;
+			perm[1].vmid = adsp->region_assign_vmid;
+			perm[1].perm = QCOM_SCM_PERM_RW;
+			perm_size = 2;
+		} else {
+			perm[0].vmid = adsp->region_assign_vmid;
+			perm[0].perm = QCOM_SCM_PERM_RW;
+			perm_size = 1;
+		}
 
-	adsp->region_assign_phys = rmem->base;
-	adsp->region_assign_size = rmem->size;
-	adsp->region_assign_perms = BIT(QCOM_SCM_VMID_HLOS);
+		adsp->region_assign_phys[offset] = rmem->base;
+		adsp->region_assign_size[offset] = rmem->size;
+		adsp->region_assign_perms[offset] = BIT(QCOM_SCM_VMID_HLOS);
 
-	ret = qcom_scm_assign_mem(adsp->region_assign_phys,
-				  adsp->region_assign_size,
-				  &adsp->region_assign_perms,
-				  &perm, 1);
-	if (ret < 0) {
-		dev_err(adsp->dev, "assign memory failed\n");
-		return ret;
+		ret = qcom_scm_assign_mem(adsp->region_assign_phys[offset],
+					  adsp->region_assign_size[offset],
+					  &adsp->region_assign_perms[offset],
+					  perm, perm_size);
+		if (ret < 0) {
+			dev_err(adsp->dev, "assign memory %d failed\n", offset);
+			return ret;
+		}
 	}
 
 	return 0;
@@ -629,20 +653,23 @@ static int adsp_assign_memory_region(struct qcom_adsp *adsp)
 static void adsp_unassign_memory_region(struct qcom_adsp *adsp)
 {
 	struct qcom_scm_vmperm perm;
+	int offset;
 	int ret;
 
-	if (!adsp->region_assign_idx)
+	if (!adsp->region_assign_idx || adsp->region_assign_shared)
 		return;
 
-	perm.vmid = QCOM_SCM_VMID_HLOS;
-	perm.perm = QCOM_SCM_PERM_RW;
+	for (offset = 0; offset < adsp->region_assign_count; ++offset) {
+		perm.vmid = QCOM_SCM_VMID_HLOS;
+		perm.perm = QCOM_SCM_PERM_RW;
 
-	ret = qcom_scm_assign_mem(adsp->region_assign_phys,
-				  adsp->region_assign_size,
-				  &adsp->region_assign_perms,
-				  &perm, 1);
-	if (ret < 0)
-		dev_err(adsp->dev, "unassign memory failed\n");
+		ret = qcom_scm_assign_mem(adsp->region_assign_phys[offset],
+					  adsp->region_assign_size[offset],
+					  &adsp->region_assign_perms[offset],
+					  &perm, 1);
+		if (ret < 0)
+			dev_err(adsp->dev, "unassign memory %d failed\n", offset);
+	}
 }
 
 static int adsp_probe(struct platform_device *pdev)
@@ -696,6 +723,9 @@ static int adsp_probe(struct platform_device *pdev)
 	adsp->info_name = desc->sysmon_name;
 	adsp->decrypt_shutdown = desc->decrypt_shutdown;
 	adsp->region_assign_idx = desc->region_assign_idx;
+	adsp->region_assign_count = min_t(int, MAX_ASSIGN_COUNT, desc->region_assign_count);
+	adsp->region_assign_vmid = desc->region_assign_vmid;
+	adsp->region_assign_shared = desc->region_assign_shared;
 	if (dtb_fw_name) {
 		adsp->dtb_firmware_name = dtb_fw_name;
 		adsp->dtb_pas_id = desc->dtb_pas_id;
@@ -1163,6 +1193,8 @@ static const struct adsp_data sm8550_mpss_resource = {
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
 	.region_assign_idx = 2,
+	.region_assign_count = 1,
+	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
 static const struct of_device_id adsp_of_match[] = {

-- 
2.34.1


