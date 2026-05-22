Return-Path: <linux-arm-msm+bounces-109404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPpFCY20EGoUcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:54:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CACFD5B9B72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBEC93023A5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B069837D108;
	Fri, 22 May 2026 19:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSx5Vvjh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nn6U/J57"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D67337DAD5
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479661; cv=none; b=cHZQjahREr+3GquAmhhYs5QwtWG3ZHwCnvzBhN0wvIZg1iiW7Fo+3N4xWtZwb7z/7J7BeC791CATkN2Bs0uS/c+CdnjLpC6v1b/bMTRV2Jvsgwz/LKzg0TJt4B2nkg4mYTx2+dKzXBm9uw8VoEsPVWP5de3dCsxRfv8rc+8kOoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479661; c=relaxed/simple;
	bh=p/ciXwcU/1o2QklsN+aMNnup9qbFvY81lSB7qx6kXXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GXURL36zXKt/diU4SNl0Xm3hSUfzBNWHUSH1Hds7hb1GCziFD1DG/9CcfJXGSs/dkBrfNSeK0MlWTY/JHQFHKmVSn/KpljKwkITjSYw89K2oEUAExpnXGuQJzxK/ni7WVbDGez3OCfrScy+/RLU0ZTg6RJKg/KiiejEn3GS6d3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSx5Vvjh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nn6U/J57; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MDpXL62125204
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RgLWgHPyB7A
	lV0l0GSTJmUsNrDkcyfP3IdUK9UW2Wik=; b=ZSx5VvjhNkzddsXWRd2NQm2DQO6
	tZOMIcEivH9F4cKCCAS8QSQcvmx/rVUucph59qPWc5P+JP6Fb+62VRjAIYG6SAkL
	M7Kb99F4PBMgQoUyR08WBDAMSS6jeicFT7AvnpNfYsjixDqXhqAqJ1xd8Vkso5hD
	uWokwRMa4eO6nHO8UZuUmX3kU5aVbVCfTJx8V92Q+GlZjgRcij0qsGLLoiVwneAM
	8kObDNUG6NMPOyxSuhABS1fc3AutBBT6yqgJzHwPMTl7CwgOYs1opbLAlmo/Cm/Q
	L/IBVr1hqtC7wP/Ln+ijAlpSY1f1P88eF6VdMrEtvGVzVMqykYwRNgqFKYg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eard89fcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2beb9002a00so6215135ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479659; x=1780084459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgLWgHPyB7AlV0l0GSTJmUsNrDkcyfP3IdUK9UW2Wik=;
        b=Nn6U/J57KVcFVmN1+HbvqvHaM3lcTdjekzHIkm70i5WcTGyKEUSRUXfTXT07PeoCzC
         g54rZdgzcSM3M1HSEUCsTDkeF0OPQsJV5D9XVGDC5rOWsiU/VOczTdoJiCjT9OsESnZ9
         52cbqrsgYLS3dv1+6UPKLfj0to/coaGVbYCOCPo7Lz8C48QXPxBaxoyj9HW6JYWPxM16
         2TxKCQQVcKsr44P7C+lpAeWME+gix09dvlcA/1i9E1OyPG89Kgwa+j+qfNfPooYPyuH/
         a1ycbFDL+H3S4or0vWt0RHBxKM30vbIuGJY7ln5G1JyVghVKI1kkl2xkhsFkYY+EIVn+
         hTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479659; x=1780084459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RgLWgHPyB7AlV0l0GSTJmUsNrDkcyfP3IdUK9UW2Wik=;
        b=NdKtsVorNG5zGMkDYuO6W1Q6ZcYgaqISJtsDaFgWLFEaXjOnUKmfJdb+YEuDnBndwa
         My5HKqQ+HO5tWfiIBfL7W4gS7frm+k+PyCmbpXxyst2vu1WX6SKE99WOCvCFOAg5HKml
         jdTfHZ20b5Y9GhbqHdXz00T7aOt+J1DnZxUnuzfsJNHnL1YPgausl4fw+15dsC57WYjv
         tFR1bWet+MDFYhDoEsEkaQgxQzM+kyvBESLAPNNaBIOTFPqFhQxQjB72vavW00B+cMMg
         pq8kGp4catflvVM5nlJIhsMD+2Zmyjx7Tpz2mqxtj7XWGRmXFIx0ADGE56uc2Tgx1fDf
         4MpA==
X-Forwarded-Encrypted: i=1; AFNElJ/maUw8rhVyAolkSkeujIkMhm2riRPEXqnkXaRhuPy8+nclfuFEMj3WOJjZzGbvDTOI2/HUw7MOPAUQ4XbD@vger.kernel.org
X-Gm-Message-State: AOJu0YwBEbQKK/L/J+BmaJLb8g3DXrLVzhH1mDERpeE/pZKsLlDp1rJr
	0JbA0zWpyqkc59/AdtghUVmep64uS0w/4rjOSjvfpotInH3ImaUxo34IFqnZPk3g/c9In9nq28a
	/4XNpRzGY3wmKvf8dCVyMGjwvF4aTBcylN+AvQ4rpfE3jXnN/gvJjYXT6tYBR3x0EFMey
X-Gm-Gg: Acq92OHwPozFUVAP7fW1frYYDR1Z1+Z9nyvmbxVCUaniIWkoRX4O5Yjz+xoBua+M1LD
	Qhj8oYjCHBZq87ePUUuv6qvRUVVD0dKvOTZSKn8fv7ut7iGCaJL3VeGkapn71UItisgW3ZXsbpl
	xi6DEApxgO34w6WQ27xRUQzhC3Q6uc02L9LHVL8CHS5rcVetfCnBYDO5o9HFjxGUvbkem7nmtlm
	Ip8LTDBQpMapJJb9dY5kKiVId8Y6OFKEB4FgovjEDwr73f2oBnxKuTd4mGFxv8fqG5VErvT9LRj
	4gtYZwq1/8TbmpuXNuRvOqW5MD6yTJppZLN8IcNbGZD9T8/RLsMI9KdxzFYtyIiNtqm2HL5KMGw
	fhkzaPz/n2zLZNQLeuJhuJBiVvG+rvJEAxmlxlZw8pnRCN3Zd
X-Received: by 2002:a17:902:f64e:b0:2b2:ebed:7af5 with SMTP id d9443c01a7336-2beb06d144amr51010985ad.13.1779479658608;
        Fri, 22 May 2026 12:54:18 -0700 (PDT)
X-Received: by 2002:a17:902:f64e:b0:2b2:ebed:7af5 with SMTP id d9443c01a7336-2beb06d144amr51010595ad.13.1779479658023;
        Fri, 22 May 2026 12:54:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 04/18] firmware: qcom: scm: Add minidump SRAM support
Date: Sat, 23 May 2026 01:19:55 +0530
Message-ID: <20260522195009.2961022-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Fus1OWrq c=1 sm=1 tr=0 ts=6a10b46b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=z9Wl_b-Q9SImGVoSLTYA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: zTVucsA3ZgPeFWCD7E6SerqWWU36jJD9
X-Proofpoint-GUID: zTVucsA3ZgPeFWCD7E6SerqWWU36jJD9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX9iVczK9B3Ywe
 wfphqGNjUQUv2ZpLNiyv7NhAQhEAgWEmWMowFLPEdNhwTWOkW7KgS9wDwMBcGVhODHQdoFlXkaI
 9yGI2b2N50MQwsrpLzcP9C6Bm4HNxUSNyu2T3XjshOAkkb0Sq9Qs7W2D0Y14T/4wdzCf3lZU1/z
 AbuvkUaOHqvTxx2KYcEVo5KHHTMCaT4G5n588ywM9MH/iA2M5nEgGzdzyFt57o5A0rR1QkHTR9d
 6itnJs4RKhq11T4p3FhTUeUt7/rDgCtHQP3eeKvCpEeVKRELrCGa47JBKJOyyBQz3/16WntaR0V
 bcDdhSLT/QI3drebi8jddr+8CrqzbwkNb3z31iTIWwMhyNd69j/W+ux+kNhdKVk+KmkPollZEXw
 iKC5E3ihyFQAFpmHExnkejhKLMQwVf7X7Fw+WGBYt7ZRT1jiMjNf4I31PaQtzTAJFnLsl/JAGka
 jnCVXE3CTGxjaz7RcHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220198
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109404-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.985];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CACFD5B9B72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On most Qualcomm SoCs where minidump is supported, a word in always-on
SRAM is shared between the kernel and boot firmware. Before DDR is
initialised on the warm reset following a crash, firmware reads this
word to decide if minidump is enabled and collect a minidump and where
to deliver it (USB upload to a host, or save to local storage).

The SRAM region is described by a 'sram' phandle on the SCM DT node.
If the property is absent the feature is silently disabled, keeping
existing SoCs unaffected.

Expose a 'minidump_dest' module parameter (default: usb) so the user can
select the destination. Only the string names "usb" or "storage" are
acceptable values.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 92 ++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 52432469badc..5276a77834a0 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -57,6 +57,7 @@ struct qcom_scm {
 	int scm_vote_count;
 
 	u64 dload_mode_addr;
+	void __iomem *minidump_sram;
 
 	struct qcom_tzmem_pool *mempool;
 	unsigned int wq_cnt;
@@ -141,6 +142,20 @@ static const u8 qcom_scm_cpu_warm_bits[QCOM_SCM_BOOT_MAX_CPUS] = {
 #define QCOM_DLOAD_MINIDUMP	2
 #define QCOM_DLOAD_BOTHDUMP	3
 
+/* Minidump destination values written to always-on SRAM for boot firmware */
+#define QCOM_MINIDUMP_DEST_USB		0x0
+#define QCOM_MINIDUMP_DEST_STORAGE	0x2
+
+static u32 minidump_dest = QCOM_MINIDUMP_DEST_USB;
+
+static const struct {
+	const char *name;
+	u32 val;
+} minidump_dest_map[] = {
+	{ "usb",     QCOM_MINIDUMP_DEST_USB     },
+	{ "storage", QCOM_MINIDUMP_DEST_STORAGE },
+};
+
 #define QCOM_SCM_DEFAULT_WAITQ_COUNT 1
 
 static const char * const qcom_scm_convention_names[] = {
@@ -568,6 +583,14 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
 
 	if (ret)
 		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
+
+	/*
+	 * Write the destination into the always-on SRAM so boot firmware
+	 * can read it before DDR is initialised on the next warm reset.
+	 * Only written when minidump is active;
+	 */
+	if (__scm->minidump_sram && (dload_mode & QCOM_DLOAD_MINIDUMP))
+		writel_relaxed(minidump_dest, __scm->minidump_sram);
 }
 
 /**
@@ -2040,6 +2063,29 @@ int qcom_scm_gpu_init_regs(u32 gpu_req)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_gpu_init_regs);
 
+static int qcom_scm_map_minidump_sram(struct device *dev, void __iomem **out)
+{
+	struct device_node *np = dev->of_node;
+	struct device_node *sram_np;
+	struct resource res;
+	int ret;
+
+	sram_np = of_parse_phandle(np, "sram", 0);
+	if (!sram_np)
+		return 0;
+
+	ret = of_address_to_resource(sram_np, 0, &res);
+	of_node_put(sram_np);
+	if (ret)
+		return ret;
+
+	*out = devm_ioremap(dev, res.start, resource_size(&res));
+	if (!*out)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int qcom_scm_find_dload_address(struct device *dev, u64 *addr)
 {
 	struct device_node *tcsr;
@@ -2733,6 +2779,47 @@ static const struct kernel_param_ops download_mode_param_ops = {
 module_param_cb(download_mode, &download_mode_param_ops, NULL, 0644);
 MODULE_PARM_DESC(download_mode, "download mode: off/0/N for no dump mode, full/on/1/Y for full dump mode, mini for minidump mode and full,mini for both full and minidump mode together are acceptable values");
 
+static int get_minidump_dest(char *buffer, const struct kernel_param *kp)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(minidump_dest_map); i++)
+		if (minidump_dest == minidump_dest_map[i].val)
+			return sysfs_emit(buffer, "%s\n", minidump_dest_map[i].name);
+
+	return sysfs_emit(buffer, "unknown\n");
+}
+
+static int set_minidump_dest(const char *val, const struct kernel_param *kp)
+{
+	struct qcom_scm *scm;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(minidump_dest_map); i++)
+		if (sysfs_streq(val, minidump_dest_map[i].name))
+			break;
+
+	if (i >= ARRAY_SIZE(minidump_dest_map))
+		return -EINVAL;
+
+	minidump_dest = minidump_dest_map[i].val;
+
+	/* Pairs with smp_store_release() in qcom_scm_probe(). */
+	scm = smp_load_acquire(&__scm);
+	if (scm && scm->minidump_sram && (download_mode & QCOM_DLOAD_MINIDUMP))
+		writel_relaxed(minidump_dest, scm->minidump_sram);
+
+	return 0;
+}
+
+static const struct kernel_param_ops minidump_dest_param_ops = {
+	.get = get_minidump_dest,
+	.set = set_minidump_dest,
+};
+
+module_param_cb(minidump_dest, &minidump_dest_param_ops, NULL, 0644);
+MODULE_PARM_DESC(minidump_dest, "Minidump SRAM destination: usb (default) or storage");
+
 static int qcom_scm_probe(struct platform_device *pdev)
 {
 	struct qcom_tzmem_pool_config pool_config;
@@ -2750,6 +2837,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Failed to get download mode address\n");
 
+	ret = qcom_scm_map_minidump_sram(&pdev->dev, &scm->minidump_sram);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to map minidump SRAM\n");
+
 	mutex_init(&scm->scm_bw_lock);
 
 	scm->path = devm_of_icc_get(&pdev->dev, NULL);
-- 
2.53.0


