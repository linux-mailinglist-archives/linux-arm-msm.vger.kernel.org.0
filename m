Return-Path: <linux-arm-msm+bounces-4350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6E180E694
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 09:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 136B5282946
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 08:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6EF36AF5;
	Tue, 12 Dec 2023 08:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iGCmabf6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBDCCD
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 00:45:28 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-54cd2281ccbso7141468a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 00:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702370726; x=1702975526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XlTbNEq1GuzPeQ1CDsWPGaoluuIMPNHfkxOroPtVeiQ=;
        b=iGCmabf6sPD+JVeFSJXxe5PGOYZb8WLcWs03h3K71CXrDpo4qV01/8gpg63M0XJGZz
         uRtGGMMMI161mQdlybilE98OAHu/ssWWhM3KlNS15DytYAH5mVViLjgo3XuR9JpNeSnG
         G+ojWu7amxEKr7FhopaifeSPfdr5myShj3EOWfIpIqi2RqSCwifvzuf5GcI995lDzviK
         EcRwzs1t+BqJpS09LKuLzH6oL+1SudsEM8BF7Zu/W1d4mRxZJ7jjyLKMZSlfe7HjgHZF
         hx09dDtJl3EdW2OiDerPBZej3U5Wnk2NhSP7HeNZZet9U898bMieJStd+XWN0CYCm3fc
         ik+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702370726; x=1702975526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlTbNEq1GuzPeQ1CDsWPGaoluuIMPNHfkxOroPtVeiQ=;
        b=KMi7PCP17bhsKGwEH/NgDWP9hPneEB3cL/54VnGT2hVP01Ige+9/Y1lcXQmyJFVSMn
         3abC1kc0/TAs9KHgLuDNy8emmUp7mbi35TE+ds9RaJjHqMkjXRTkaOa6tAsirDP/admp
         /CXQTGi3Z14HzRp4QXSPfTv5lG/seHKriWxQ1q2q4FW7V8Vj/2I7mK7t47lUjSekCuuW
         6mFQ9Hwc06YyjjTRszjBXO42xq7CysZbU6iWUtdpq7pjw6Rg+pDKYJfqm/klGd8DA3kE
         +w69ZAcifdT1kQK2WnNhw3cEnMcf7BH7AIIJDaMD2xyacLQ9U1dZvUsVPU/ildKhHF5T
         ST8g==
X-Gm-Message-State: AOJu0YyUypjcydbu7dJzkp2kFKtzYd4TQKxo+JEpgEVwgvPNOGxNV4Bc
	XqJgDB/s8pcr71b7/fGIItREtg==
X-Google-Smtp-Source: AGHT+IGzjNM/C+UsrJLMJiGh2RqOwaIjKWfKWggYAC5KYaFeDX5TwhYVOIZzP7JQ+Aq48TIDj94Z9Q==
X-Received: by 2002:a50:85ca:0:b0:551:14c0:7325 with SMTP id q10-20020a5085ca000000b0055114c07325mr1974900edh.40.1702370725978;
        Tue, 12 Dec 2023 00:45:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id c27-20020a50d65b000000b0054c9bbd07e7sm4650471edj.54.2023.12.12.00.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 00:45:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 12 Dec 2023 09:45:18 +0100
Subject: [PATCH v5 2/3] remoteproc: qcom: pas: make region assign more
 generic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231212-topic-sm8650-upstream-remoteproc-v5-2-e749a1a48268@linaro.org>
References: <20231212-topic-sm8650-upstream-remoteproc-v5-0-e749a1a48268@linaro.org>
In-Reply-To: <20231212-topic-sm8650-upstream-remoteproc-v5-0-e749a1a48268@linaro.org>
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
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6219;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=IRT2+r/tLyPXYlJ5SEMXnGkvZdLvUu++HCFHN4GbUO8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBleB2hpsl1aHttk1gcyG0YRITgU2Rs3SWRYYTRVzn+
 GLzUMoiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXgdoQAKCRB33NvayMhJ0eczEA
 CFT51CIAwawgXmAQ90G27raz4DwykXXdEYgj3IDdho3tWtsH3zLorSaullzFtvy2xqTNL3ELu0hMIS
 H8zj/K+41PAbqtf1QXII+ywooy4ZdrpVoeagwuOrhfG9WP2L7397t5I96bI5ydEoMvWlpDpKoGp6a0
 qtPiHDo8mAmmewepWv0RPxmbh5Mx88NxIEjlT1GKcIydNhF3RY9nzAahRU8oahudmxd0SGRJ6KcI6x
 0T8U16xuHnNM/J1WWRQywcpMdoHZBCULz0s/YPEaruUo3A8KUWQf0aF5M8ql5tCiD5Wdebux8ahIwe
 j7Iogdz/5oztinykN75RUuE9rCoFhMissLoWsnLLHoSIfuKJ+0/XmFVnWlADI9s/fGXPJ4NWA7qXk8
 SDtrdi+i8TlH3e1t1/BZ81xypqlfl4c0KWrjU2lzVn/ZlkevlGfisk6/tSOK3lQO2uk3qobazHsFAc
 4z4cijcyi0y2DVFrDVB4+bGsds96Dm5QOWitvYEuMxvoIRx2Aj+tzVR9n3bhChSmD31TfiTPu5R7nr
 xpQ5fsWV1oFEWaKwQIFqI4uJMp1KOaGgwc1COaFI+jWX8mdq0xiD7v8JURiaD4Het3e3TzXZWl8FCA
 Z4nq5e9ibjWkrQ87e8Lwq41quzbGnOrZ9Pl9xLxn2oAFfeMMvQc50/o/fPJw==
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
index 913a5d2068e8..46d744fbe8ad 100644
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
+	u64 region_assign_owners[MAX_ASSIGN_COUNT];
 
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
+		adsp->region_assign_owners[offset] = BIT(QCOM_SCM_VMID_HLOS);
 
-	ret = qcom_scm_assign_mem(adsp->region_assign_phys,
-				  adsp->region_assign_size,
-				  &adsp->region_assign_perms,
-				  &perm, 1);
-	if (ret < 0) {
-		dev_err(adsp->dev, "assign memory failed\n");
-		return ret;
+		ret = qcom_scm_assign_mem(adsp->region_assign_phys[offset],
+					  adsp->region_assign_size[offset],
+					  &adsp->region_assign_owners[offset],
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
+					  &adsp->region_assign_owners[offset],
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


