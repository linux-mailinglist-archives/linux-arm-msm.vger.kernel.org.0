Return-Path: <linux-arm-msm+bounces-82818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 935A5C78AD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id D56F92D1A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD3C34CFC9;
	Fri, 21 Nov 2025 11:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kviSVaAU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JbHI0ajd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329E3347FEA
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722934; cv=none; b=ScfWpVkOhwRbXSlFpnq/+uvTKQXeU1Hn6eAjy85VpnTTU1w/31HVmH6sW1cYLsCeF7xOfN1uDvOyf9+D+dP/+oeYchRy5uPivDeVgsD+0P2tQQcczPgoE21iMxh1TIpxoJ07JLie+GXKyC5mp0vEX38bcX7gjEO5MUjL/Eg2cPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722934; c=relaxed/simple;
	bh=i0l1yd2psvmNReSCrh1wM3fGQJyLpQp0JIKKuUcUls4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uqDh2OFayw2/IFwr6LPaDQeOtfR+Ds3U7YrdKdU1Ooxwi5C8kIsUjzh85bgJWQOsO7o/dESmcLT+iT+hHp+AOKKuxzcK0gQTZSpRxcf89B1headHnH+x49en/QVrpLrSjgED97DhH32o1B946i6yvWRWWvLR+SwVCGztioniMIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kviSVaAU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JbHI0ajd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL8Ypgw3139454
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V/FS2O3qT/9Oj2CvSpEkadXBrxFneX0U/N5cD0ePce4=; b=kviSVaAUfDQH/BhY
	Nu2qrz5q0Q5T3gvMwL3ho7vlE6ev/WE99AHH3mUjPGyPUU+28/ylf0YaRLfNBT8D
	k5k7PaSFwTn5TY3swoBdolVAoLe09cdhA/y91Houeg9isaGpvW3+zmR30CiwtFaR
	d4h4atkL5KxATiyp56hUvG209emkMitQmFIvIN4e4YsCt2uW0BkAUDx5JlfOb7LB
	pnWZ4q6D95IdtOSGs968gm5sgrBWEqdWSQihcRPjZPt1F/zOKlnPuCL+BW/Afwx8
	U+WZGWkOdVqVvBBUGeDrixodM9dMNG1g/WnMgF9cv9ftfWWnfViZiB7Jd+GtAJky
	Kd6MUQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmppgm46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:02:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-341616a6fb7so2298123a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 03:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763722932; x=1764327732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/FS2O3qT/9Oj2CvSpEkadXBrxFneX0U/N5cD0ePce4=;
        b=JbHI0ajdoiyPjH8KmV4aPjrRrR//J6lAeaD3c35xR1yyw8Y0kK8IWiCRoeS/W3rEfy
         cf+pOZS865JEK8GXU38Yil/9/X+m0WWCyyPqCG/nycSZiD59pxkHWYhl3OTXsk7B1ohf
         cGBxThx+wTPTcsyqMKuYO22empi4BhS74fiwmDKI/+MLxEdZWZjtZv1yI1Rk0Jwu3ZsI
         c+bnXCA5AyQ87XqdBi5k8EYySuf0nG/YuvcsGIA5057AFJfFSt1y+zBIGlDbEuWAAWSh
         LOxe/o95JvlRzAbW79ADdSy9xkdXc0RXQtPiwK8mHctKcq47JogKJw5/OGEMyY4Axfaq
         ynkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722932; x=1764327732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V/FS2O3qT/9Oj2CvSpEkadXBrxFneX0U/N5cD0ePce4=;
        b=JDO0i4QZ8BYF8CEj3Ed4vsBCyWWL7pt9BPAas2DwP1rlTu+gqqLD+GOiKMesEbc9Wg
         d3ZhqQrmsxdC5k5f41sgZGM9MkxrkL5cUR31MFyM0OMQS+/7O905VPOZZgfa3gFuly2e
         2XXCHAU3yqFi5FKzRvdNtUwozkU+bY9WnqdVT6kxwF++yWzwyzyJKsBvnJGalnbYj3RJ
         gKW4qCs5gqqzOboB/DTLrR/apMVxtKmr9+AoxTWD4HeWIOySm1GG3/4SytCHLs+obVY1
         eWmgV6F16pZPfxnSeSDeeeodNTeUDNVa2oNBAz4/Em7qnkuPKL4b8NP1/I9t+7NWMTDv
         WtSA==
X-Gm-Message-State: AOJu0YzSnWavFU9tBh/NCkBsgQAfu2XzTJaj9hozKvrDVjX4noYYUTNW
	q//qcTHtMGN3vuSPYItqaLmYxYEZUyJqPegd91ldWlKl3Q1rhIwrCFYgQnYc6tAxUkCwhiAJgIg
	7AtNHSQtn2hx/XO/4YiURaw2LP+R0Je6ITiGdJ6386CfAJKhnr4UN2k8ol0YiPCa3U0Va
X-Gm-Gg: ASbGncuwlUgGSvQBCDMN0Dtcyvf2xzVICV+UmS06fSejAACbb3dHioms3TOUgVZypEE
	SdmG5Y3SJXsaWWQFtHF4W/Xv4ykWnK4yNGqVzxzrDH9WNfz8CYX5rkCyY8b1dBoX/6F4aA12C4l
	dhfkY8yfCf2NGtsJmrpysTco7vdLhfQTG6LNQjC5DWj3GFVj+xnUhQ9Bcp5VSbCT1877XHupR12
	nA+hIJYgDnMOMnLRQ5+GYRZu40kI5bq03+TF3pHthAvIWVMqQ0eVKWbWd0eWCPIitKBmPFTCjw2
	dVRbD+W4e5yAA2TmMJ7a16V7tDajKs/fLqYU7JyxgKU7+KaWmw5dy7nMm8GpEBs1e1iQgknuXTQ
	Q39D52tsGkYLqwJ4Q+ghWQz3mAMg2WpbYLl4h
X-Received: by 2002:a17:90b:578c:b0:341:2141:df76 with SMTP id 98e67ed59e1d1-34733e734f9mr2018545a91.13.1763722931530;
        Fri, 21 Nov 2025 03:02:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZyBfliX1taeiA8tYnXeLxjLCQb9p3ax09FQZM7jo0MPAhWPaVofZjyYvJfymsad1E6zSGrg==
X-Received: by 2002:a17:90b:578c:b0:341:2141:df76 with SMTP id 98e67ed59e1d1-34733e734f9mr2018499a91.13.1763722930831;
        Fri, 21 Nov 2025 03:02:10 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm5191165a91.15.2025.11.21.03.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:02:10 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:31:14 +0530
Subject: [PATCH v8 12/14] remoteproc: pas: Extend parse_fw callback to
 fetch resources via SMC call
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-kvm_rproc_v8-v8-12-8e8e9fb0eca0@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
In-Reply-To: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763722879; l=4665;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=i0l1yd2psvmNReSCrh1wM3fGQJyLpQp0JIKKuUcUls4=;
 b=LYCjqV9aANLxV2tv1O9a0YYowzUv+ssFnf04PIj1dwISr7QrZKNripbfjHn5pN95Gw2cAYkyF
 hdM6iv1GdWCBJ7uzbJrXyMZW9PyZryoGGHTxyiEaRSaZFyAvvMXvnFR
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: VcW9dmfwCl46fYgR7OnKrS8Tqn6X5Qr5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfXzmFqD33F/Q+Z
 +j0efO81jkJ/Z3+BspywOTed0FjvsS4AyQL9c9CWMvXr3KKFEsYVesxD/hnrq7yRy3BHOtiVlYj
 xL+PaHZ1r/MK4XN0bMbjNyaQ1aiWcpUmZx0cexzWqVlJ8E1RpoMhzQJx3coQjI05gObx/DqYHAY
 bhi3JcU+gtelyuDzyjiQo0rYJFcQzwUhbsJiqTsP3X1h8WzJQHE3YLsXhPQsRJBD54xij36qMPM
 Uja8UBA+kUVgBfDtMpmmxW1auvN/RmFpZGGQGYrfQ5Egy4QPzC/4rgaadTy4CPAZpp7gs8wJe2g
 d16KCgUVMf0NPyESzaAd/tJEd16xN1aeqMxDGZxtsVKywMeGhEpxytr9ubxrUMJnKP5fUB4EkSn
 KA9AOpbOROtfWRPpCgiG07pUW8paIQ==
X-Proofpoint-GUID: VcW9dmfwCl46fYgR7OnKrS8Tqn6X5Qr5
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=692046b4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KMz1R6K7GWUeRkMKapkA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210084

Qualcomm remote processor may rely on static and dynamic resources for
it to be functional. For most of the Qualcomm SoCs, when run with Gunyah
or older QHEE hypervisor, all the resources whether it is static or
dynamic, is managed by the hypervisor. Dynamic resources if it is
present for a remote processor will always be coming from secure world
via SMC call while static resources may be present in remote processor
firmware binary or it may be coming from SMC call along with dynamic
resources.

Remoteproc already has method like rproc_elf_load_rsc_table() to check
firmware binary has resources or not and if it is not having then we
pass NULL and zero as input resource table and its size argument
respectively to qcom_scm_pas_get_rsc_table() and while it has resource
present then it should pass the present resources to Trustzone(TZ) so that
it could authenticate the present resources and append dynamic resource
to return in output_rt argument along with authenticated resources.

Extend parse_fw callback to include SMC call to get resources from
Trustzone and to leverage resource table parsing and mapping and
unmapping code from the remoteproc framework.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 60 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 9feee2cb1883..186a90d6c83a 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -34,6 +34,7 @@
 #define QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS	100
 
 #define MAX_ASSIGN_COUNT 3
+#define MAX_RSCTABLE_SIZE	SZ_16K
 
 struct qcom_pas_data {
 	int crash_reason_smem;
@@ -413,6 +414,61 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
 	return pas->mem_region + offset;
 }
 
+static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
+{
+	size_t output_rt_size = MAX_RSCTABLE_SIZE;
+	struct qcom_pas *pas = rproc->priv;
+	struct resource_table *table = NULL;
+	void *output_rt;
+	size_t table_sz;
+	int ret;
+
+	ret = qcom_register_dump_segments(rproc, fw);
+	if (ret) {
+		dev_err(pas->dev, "Error in registering dump segments\n");
+		return ret;
+	}
+
+	if (!rproc->has_iommu)
+		return 0;
+
+	ret = rproc_elf_load_rsc_table(rproc, fw);
+	if (ret)
+		dev_dbg(&rproc->dev, "Failed to load resource table from firmware\n");
+
+	table = rproc->table_ptr;
+	table_sz = rproc->table_sz;
+
+	/*
+	 * The resources consumed by Qualcomm remote processors fall into two categories:
+	 * static (such as the memory carveouts for the rproc firmware) and dynamic (like
+	 * shared memory pools). Both are managed by a Qualcomm hypervisor (such as QHEE
+	 * or Gunyah), if one is present. Otherwise, a resource table must be retrieved
+	 * via an SCM call. That table will list all dynamic resources (if any) and possibly
+	 * the static ones. The static resources may also come from a resource table embedded
+	 * in the rproc firmware instead.
+	 *
+	 * Here, we call rproc_elf_load_rsc_table() to check firmware binary has resources
+	 * or not and if it is not having then we pass NULL and zero as input resource
+	 * table pointer and size respectively to the argument of qcom_scm_pas_get_rsc_table()
+	 * and this is even true for Qualcomm remote processor who does follow remoteproc
+	 * framework.
+	 */
+	ret = qcom_scm_pas_get_rsc_table(pas->pas_ctx, table, table_sz, &output_rt,
+					 &output_rt_size);
+	if (ret) {
+		dev_err(pas->dev, "Error in getting resource table: %d\n", ret);
+		return ret;
+	}
+
+	kfree(rproc->cached_table);
+	rproc->cached_table = output_rt;
+	rproc->table_ptr = rproc->cached_table;
+	rproc->table_sz = output_rt_size;
+
+	return ret;
+}
+
 static unsigned long qcom_pas_panic(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -425,7 +481,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.start = qcom_pas_start,
 	.stop = qcom_pas_stop,
 	.da_to_va = qcom_pas_da_to_va,
-	.parse_fw = qcom_register_dump_segments,
+	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
 };
@@ -435,7 +491,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
 	.start = qcom_pas_start,
 	.stop = qcom_pas_stop,
 	.da_to_va = qcom_pas_da_to_va,
-	.parse_fw = qcom_register_dump_segments,
+	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
 	.coredump = qcom_pas_minidump,

-- 
2.50.1


