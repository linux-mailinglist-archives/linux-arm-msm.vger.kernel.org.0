Return-Path: <linux-arm-msm+bounces-109112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WE0nBkcgD2pSGAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 17:09:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DA45A7FC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 17:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB38331CC911
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98C93DCDAA;
	Thu, 21 May 2026 14:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZb3c1U4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDQ08mDe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FE03D7D7B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372395; cv=none; b=H7ptnMU7cx1SfMu3sILwjlDzfxeQlpvVs0u5XNO7lhSMsXGqJOifrb4M+ggY4gBGL0Z4IGl5cIljIw5kWjI3/B1xInh5+N91JkVBYQV0RjjEat9SR63a08hQHoLWd0NPwWoZsyPxmD8zvM2sptHnRHLg8oKc3qKZKBBENpD8EoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372395; c=relaxed/simple;
	bh=2fruTuJGgso+AVSjN86SFOWYtIxEi2oXmlzdSiu8LiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cvXIuUuLjyithXgfsls9A2GTdOH+Ee7xvE9tRQvRxz4aFrGmzlnqakwRnuOA+cgCa0h1rauDofS0L5pQxoGANTWOoRn/EEzLm0q0qxpMCIUgMok3iBzUg09RwLsS1brCQL4y05ADHHpEJPh9KukXViuhrgehqCgMwWp7fdqsVcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZb3c1U4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDQ08mDe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99jGR3527290
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4wgPZzl341OGf2dUgGOsYttbVFxmjqeXYFCtkA02/8=; b=DZb3c1U4hANrkUez
	MWm5LxJ7zfcX6bniI46n54ufgbPmzvvoR52OhokQlOP1Qkq2MIcvAg/j4b3itzPS
	d7YoJmcMb/RvrRwDWtAmIcrOCRiNB/ehC/1zaHlXQa0tA0498pLdSr/jOhpiLzWo
	+sz9PLV9/43EZ0TUq1csNxUlbhcPdOSbK2ejTnDyTOq+2Fh6KnqHjiA/SjQ7H/mb
	6nCu1bhl+S+RVkw1fFGJhqbPYgtGmdyUrYcH1ycoh1GgaQUkx1HyLOh/3atyDztN
	bMtkzAbvEfGVqWs7AYpbSsfFtbRZpvS8Eau2IfPSmsxN+zoszwbz4RxfKepZGhlD
	CeGkxg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9vhbhxx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:06:32 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7bd5c9e2e4aso63521617b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 07:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779372392; x=1779977192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4wgPZzl341OGf2dUgGOsYttbVFxmjqeXYFCtkA02/8=;
        b=XDQ08mDesHFURKb/KLTJw9D0fsLKcheWKC5NCgUzswOJX7PB7offQsmhUDWF2hOdkg
         zZoLHifLXPCUJaNDuzCn94Mqjw4FOmovzBxcnwe0iIn2zMDthNK33sRi/EjPdyDyGinT
         NsFuXuTZYN+RcExp89J5TQz3pQWEX09q4a1ZlKmRX3udispAV+Uguo7qaPmZU7duunAL
         yhOuqGrSfWWycdIwTspCAKtKoll7S5sLkGYJoekkY+CvwINq67KYzxMszE6dS3nUgd2k
         mxRRKT0u6hhWEhzpeh7OP6kXp/LmXeBccD8hKgW+JigNhYCATqve+37lHn9zuh0bfeqt
         vMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372392; x=1779977192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c4wgPZzl341OGf2dUgGOsYttbVFxmjqeXYFCtkA02/8=;
        b=hxqjLeSBUPQc2rhuItPTDvw1c+qzN2EYR7OHB+0sSr6/Ug6IycKq/hDXYYp5v+Up5t
         +Svz13c6KN7wUCs+QTpbSYaU3cYOmXpmgT1kydg89pEFMlKBfN8e0PE99bFVhVm0n3Wt
         pMVJ0+8aZ/NB6UY8Q2lh1Lb8KcM4fgosP7cGB8rMNFCS19dHJ7aZAaQmsJTOKk20PcRh
         t3WmRFN4B9N0u3fcetHUCFLDz3e7H+9cAQmbJGlmeRbPCHPbSEk2E33tHVcbeMxoh9ee
         XXxyK56+LSMbGn+iWT31WMp0dz8zX/6QWtW7UXk7LUrGHKHphfouc9GY32oxE821pGnh
         maZA==
X-Forwarded-Encrypted: i=1; AFNElJ99Cc90dGW7adpXxu5W8fu44E2Ndra61Ji90U9a8hyMdDjuUSxr0xWcs6Nj8FOsKEB5a+6TccVYZgLZKzeb@vger.kernel.org
X-Gm-Message-State: AOJu0YztdGQTNTvzVmO4y66ABp0zFUFlc6uIBkJr86WJJCfdBhWQIAHr
	e69LXzotkRZcW0DtF2otJjOq/XzPbYc2HDQOavfdDnKORCcTYnPoDizr+LgaPCEpfK+3CXOEi1g
	o/cw9tV7nHd+sJHGyJTfoa8AtdafvHn/JAacSnkm/TYY5Cy4PQF+kTifrLahanBDf4yDV
X-Gm-Gg: Acq92OGAppMijZy3HWww3INfr8QLE6jtdhnVtfEUusYBIK0/8V69nMzFgt6/s7CofI7
	awvm7phb67lAdwDiIMMAl062j8JePml4ecLzh+ZLMAAE1FEyXfr6/uVrgQGOzhRRa7k3rqvflKn
	o7tD6bVxSWkmBk3vOLtAVuebuuB5IO360BxEV0OYqtkCRjnJhNeS622N9C+l5I91q+Wa3DbB++U
	O7x9fnN6Jyifo86CbNgc7w0V9dYJ7grR4CWSm0fJ8sgyyyQsXyz7Ap5P+l9fc9dO1BEyZmq/uIR
	s0yupIguafJ5Ppd1WHpR68lj9EBUNfhUopEXW49HErMgKqtzjzjgbf4GTs1UJ/JjouxYh2eM9g7
	WZZU9GuPQ1PkPcA14KRtzO53PbKDCdCCgEZTIHxrHCFg0JR4j6czI
X-Received: by 2002:a05:690c:6213:b0:7cf:d9bc:808b with SMTP id 00721157ae682-7d20c940a74mr29415847b3.23.1779372391661;
        Thu, 21 May 2026 07:06:31 -0700 (PDT)
X-Received: by 2002:a05:690c:6213:b0:7cf:d9bc:808b with SMTP id 00721157ae682-7d20c940a74mr29415057b3.23.1779372391070;
        Thu, 21 May 2026 07:06:31 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d2cab7a5f9sm2920677b3.39.2026.05.21.07.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:06:30 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 21 May 2026 19:36:05 +0530
Subject: [PATCH v3 2/2] cpufreq: qcom: Add cpufreq scaling support for
 Qualcomm Shikra SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-shikra-cpufreq-scaling-v3-2-883c13d1e514@oss.qualcomm.com>
References: <20260521-shikra-cpufreq-scaling-v3-0-883c13d1e514@oss.qualcomm.com>
In-Reply-To: <20260521-shikra-cpufreq-scaling-v3-0-883c13d1e514@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE0MiBTYWx0ZWRfX1BkY/q7Ku7fv
 UZafLm7qZ5RAT+WvXRtEULIUWrhNF1eRLg+psNpo09ECjPXu1Ohxm7sG0lCxkPvdRTrltLtBJEX
 6WkdVARiNy7FXAtVgi+cio/mzFfKkxRuk2t/d/oHFXHIWnrWgKs/G4OBiG4MukuuFhX0WoNNOd/
 LDUXRBNMvBtoJx8ZDOYUBoy9SHCDa7lS1x+Jk6PeEwaFmTC5rcWUwmtUvgmxtmss51L/NyNvqR2
 /FVAegDAb9dUoIQWPwQjLyNjw//xS4GsFPEFvmYgGVYmXEGFG64TRS7dqGK3jriyUjuNYIccCjd
 pmi/2ycsXAc3PkUZTVgBvOaouMwXSKBKUPCknOQ5wXvnZzg23cIMeICq+wlvZJYnHbZa8g2uzzG
 qKhddjlz+MK4rJyFJUfqaAQb4b8tGI0G6ucaCXoZ74Ji8S+n4SLPCfAwclwhR+cwh42ZH1wXaWc
 hnDLeiZURweX9H6HAcw==
X-Authority-Analysis: v=2.4 cv=GYAnWwXL c=1 sm=1 tr=0 ts=6a0f1168 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=8xPgF8R1Jm-cxLKBqHoA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: liyWNktXmCFWvChG3DsH-p4mHENB2QDA
X-Proofpoint-ORIG-GUID: liyWNktXmCFWvChG3DsH-p4mHENB2QDA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210142
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-109112-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A9DA45A7FC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Taniya Das <taniya.das@oss.qualcomm.com>

The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
but supports only up to 12 frequency lookup table (LUT) entries. When all
12 entries are populated, the existing repetitive LUT entry check may read
beyond valid entries and expose incorrect frequencies. Hence, introduce
shikra_epss_soc_data that reuses EPSS configuration with appropriate LUT
entries limit.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index ea9a20d27b8fdceb9341ee53e5fa27b7a6d92483..3d5a865fb8a35e112cb4d040fb519e2c122a91dc 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/bitfield.h>
@@ -40,6 +41,7 @@ struct qcom_cpufreq_soc_data {
 	u32 reg_intr_clr;
 	u32 reg_current_vote;
 	u32 reg_perf_state;
+	u32 lut_max_entries;
 	u8 lut_row_size;
 };
 
@@ -156,7 +158,7 @@ static unsigned int qcom_cpufreq_get_freq(struct cpufreq_policy *policy)
 	soc_data = qcom_cpufreq.soc_data;
 
 	index = readl_relaxed(data->base + soc_data->reg_perf_state);
-	index = min(index, LUT_MAX_ENTRIES - 1);
+	index = min(index, soc_data->lut_max_entries - 1);
 
 	return policy->freq_table[index].frequency;
 }
@@ -211,7 +213,7 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
 	struct qcom_cpufreq_data *drv_data = policy->driver_data;
 	const struct qcom_cpufreq_soc_data *soc_data = qcom_cpufreq.soc_data;
 
-	table = kzalloc_objs(*table, LUT_MAX_ENTRIES + 1);
+	table = kzalloc_objs(*table, soc_data->lut_max_entries + 1);
 	if (!table)
 		return -ENOMEM;
 
@@ -236,7 +238,7 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
 		icc_scaling_enabled = false;
 	}
 
-	for (i = 0; i < LUT_MAX_ENTRIES; i++) {
+	for (i = 0; i < soc_data->lut_max_entries; i++) {
 		data = readl_relaxed(drv_data->base + soc_data->reg_freq_lut +
 				      i * soc_data->lut_row_size);
 		src = FIELD_GET(LUT_SRC, data);
@@ -405,6 +407,7 @@ static const struct qcom_cpufreq_soc_data qcom_soc_data = {
 	.reg_current_vote = 0x704,
 	.reg_perf_state = 0x920,
 	.lut_row_size = 32,
+	.lut_max_entries = LUT_MAX_ENTRIES,
 };
 
 static const struct qcom_cpufreq_soc_data epss_soc_data = {
@@ -416,11 +419,25 @@ static const struct qcom_cpufreq_soc_data epss_soc_data = {
 	.reg_intr_clr = 0x308,
 	.reg_perf_state = 0x320,
 	.lut_row_size = 4,
+	.lut_max_entries = LUT_MAX_ENTRIES,
+};
+
+static const struct qcom_cpufreq_soc_data shikra_epss_soc_data = {
+	.reg_enable = 0x0,
+	.reg_domain_state = 0x20,
+	.reg_dcvs_ctrl = 0xb0,
+	.reg_freq_lut = 0x100,
+	.reg_volt_lut = 0x200,
+	.reg_intr_clr = 0x308,
+	.reg_perf_state = 0x320,
+	.lut_row_size = 4,
+	.lut_max_entries = 12,
 };
 
 static const struct of_device_id qcom_cpufreq_hw_match[] = {
 	{ .compatible = "qcom,cpufreq-hw", .data = &qcom_soc_data },
 	{ .compatible = "qcom,cpufreq-epss", .data = &epss_soc_data },
+	{ .compatible = "qcom,shikra-epss", .data = &shikra_epss_soc_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_cpufreq_hw_match);

-- 
2.34.1


