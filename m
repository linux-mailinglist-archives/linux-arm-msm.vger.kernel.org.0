Return-Path: <linux-arm-msm+bounces-105452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aERkEjZU9GnDAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:20:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEBC4AAF3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0549302590D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 07:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B0F364045;
	Fri,  1 May 2026 07:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hGEEzQEZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bAk3hBZQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9B5363098
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 07:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619768; cv=none; b=AWa4B+QkEjHThrbr/5aO7g2/1z9wjOoAovLp6g5lJ7/CHtnZOjxc3LobMBq8J4ghpNRwg6og3szr5Z64RnrnIFDpoAuvg9JYyzGp3Gso57WdS73aMc9jisk8p+0tD39SaKllzBTnyaqQ7Npp2L3KqqTsxLihGCjXkLhvQvoll8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619768; c=relaxed/simple;
	bh=kDzLYQaS1lbA/xiRLBr0uQnb3mDzyWDtiYndf5iUEbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rl7SCV7xsHVwOv/39yCT06Z5XBWfN0gz8/KQS8irBWg454eMiS6M5jwFi7Oz3Y1HAQ4xcjdkovqkUFZ2ETo0P4VIT7hL8j2fFSmd9Aj/Yc+5jAavkTtnmBDFJUzAbSSD6YTfn07NGO0rGs4GGBIQD8L0GUQcnAMJv1VS4+0TG54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hGEEzQEZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bAk3hBZQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64102rYd2121528
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 May 2026 07:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cF+BfuuIzuIarcJk8/M1mL+ZvYdCHrSlHXbiPBeKvng=; b=hGEEzQEZsF7tJV0J
	TpzoClldad5wUNHsYLGi1/h57L9lhU90o5tu2wnQTngW+8zJhTHbzlvvngJhJEIX
	RuxBMVl7Y3xu6eFlRpUvqRtu4EPDrYsndINB/4pniCsicc4fI3FCiHn39u/xlcv/
	qvKBuYJ1y/BK4KTKJaHHndoGxSFRIoPs/yC7U8TQ9XCTMomHaWpz/YlG6cdmx7hO
	9T7cCRDGMe2at1/VZBRT7Gx2LJlc8qaik1hmiUZz/CAICkFUfGur49j9EDQOlfCS
	gTyWHB7ulhlQR3ge6E3AFdizEK3d7s1sxdKZEHXp2SOQJyxOVJK4A/j9PxB/fhC+
	ZhetPg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvag4thrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 07:16:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so2203732a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 00:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777619766; x=1778224566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cF+BfuuIzuIarcJk8/M1mL+ZvYdCHrSlHXbiPBeKvng=;
        b=bAk3hBZQ/YfGh0UGSHDZNo+TkRfNM5xPwpn84KNoCgGLZZPWDOflsGCU42LZforh6D
         /4NQQdOqikP6cukOOoIGTxsEjAswSvSZPnw3z4MUaiQ68HA4tlSYMkV5jF63FCY2F/Na
         Eo7fJOeeoHR3wJrZcU9cPsDiDm/tMy+HVNKwktdIbgNl8tW8aNLfmixUJvgmPxrRzIvi
         ge8YJlW+Y4A1olOxBTURAET4D5Evm7Zay4ZF126LecZNSH1PSVs08zybYxhVYwXhBdAT
         lfaxNTqf7b1hpb8mG69TGFZlMl3jnhuEnoBlIpFSTGYoNpBHqe2t2bXxqyJA9pjI3DN5
         SZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619766; x=1778224566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cF+BfuuIzuIarcJk8/M1mL+ZvYdCHrSlHXbiPBeKvng=;
        b=VG0MFnrGLOYExHlj/rIa7n8C2knuthT7L71yA6i+XZTx+r2xsHQ2r8ajTgwM7CHF6h
         658IpyYoYPjMLSw9Jhot/lowZrQSsMGyBqAynQQBZyZ3s704v6rvc8HnaPJggiR9IA6k
         Hbf2d6Ke9qWfFd2Th3N9lY3voOn171hDO6MLTEc4vZ1iSVMs/kCyEJ7wK4bPJtSEoXVu
         /h6FlompYp2+mG500QFj0CEhSccptd0k5fLV5BBcJRAnlRJHOVsSw45s6pLMWqv6ZQYt
         aXEL1luPUTWq6hKQzFumGbX0bPlWEXbWnrPRhHAmENuATp0nzZ5AZbQTIFOfLmpGKkuw
         10PA==
X-Forwarded-Encrypted: i=1; AFNElJ/tPV6AkVYm+hQXab+/izQqh55OeM4Dr+iYYD/rjTGqkGuXDwr6HTSlVZRNoTDc51/QvyjAyIJ3p9vP+xMi@vger.kernel.org
X-Gm-Message-State: AOJu0YyR8TSSttKQluTzXWv+IxiircVUyMVRDvVHb64ciCXhFlG10g9m
	OGOKFFlJSxWT5wHpY0vb7vpNhJgwBYiIaGr1+TiTeogHSHtYyZQEscRMKlHiWBNbbvFCdOXHRD8
	Cn42DFh9ILewwBu0je2ESX259+QvS/PunSJLIeP2+WKiS3Xlvx+kb2jU23CXnT26FqJrf
X-Gm-Gg: AeBDietzs1MzPOo+gTGcjZ7P9TlF7sPzoNI1jfDh8KrXDDEpBEotX8fuMSPUx4rAvYq
	R56MZxMJZgLc28IHU2QB8y3ylI3l8l3L8aAm/JAcGONVItEFvY4AM0fQFWtP1yXIQ5YBOyqu9Qc
	jwYg8XMR2UZT0VaEMkEfhXu8SCJonpHfg5rWZbd7uMcGGtN9OTW7jAsignOYbQxSDFda/G65GP1
	A3aUjjD/i4AbPazpJFhbq82U4WsAHbZzXJRDzbE/Wu2xoRlhmYeou2hhvAmvXvd2egQa+JAbawb
	y4fiS/PMw1UYZ8GOHHk4AjC1PmZ7G2FmajKHimCr12DUuPVRVpd+MWCZgtfSgokdJoPDB1pdDLy
	pawm7Ezp+ZCkGzfcnE3nn/7IJI6B8zsnhSgV8W59z3dtJ5ese5NTrvqkOcfNFAEE=
X-Received: by 2002:a17:90b:288d:b0:35f:b4c1:91ea with SMTP id 98e67ed59e1d1-364c49c723amr4874901a91.13.1777619765837;
        Fri, 01 May 2026 00:16:05 -0700 (PDT)
X-Received: by 2002:a17:90b:288d:b0:35f:b4c1:91ea with SMTP id 98e67ed59e1d1-364c49c723amr4874845a91.13.1777619765241;
        Fri, 01 May 2026 00:16:05 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec00b094sm1424265a91.9.2026.05.01.00.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:16:04 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 01 May 2026 12:45:45 +0530
Subject: [PATCH 2/2] cpufreq: qcom: Add cpufreq scaling support for
 Qualcomm Shikra SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-shikra-cpufreq-scaling-v1-2-c78b95f53b91@oss.qualcomm.com>
References: <20260501-shikra-cpufreq-scaling-v1-0-c78b95f53b91@oss.qualcomm.com>
In-Reply-To: <20260501-shikra-cpufreq-scaling-v1-0-c78b95f53b91@oss.qualcomm.com>
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: SUFUE1viT2mdEjHqHu7lw7YNJXwvOEnr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDA2NyBTYWx0ZWRfX+IxCe0ZN/NoJ
 ZFxmqVotM4cwY4bhIcHh+b7njj/Y6CiOmN6ecoR0jiIAbvWRVNKaSdIHdVu9YuQZbWvNQ7ZXzIH
 S0CzlI6dJXqW9ajhIu2VNsb00umBSmEqyCQpCenqsBQF/ZxJ1VAZZHTwcPVDHHacPJW5y4ZJ8x4
 EQZgKErOHkKEYuYvQMynd+RZI2lSG8u9fhRvTPNm0zUPjRdiKSc9wU8E3MHXHS9x5SqvJiE3Lnv
 KHY0k/3pzDvzaH2OVItatP7VZ1KmjAatW8nmVCx0dE+0WMuQ4jnG2ulZc5YvyEZVg9ZRhwRJIFr
 qSWjzdxHFA0rWvvce3FmjXyLrDLmcl7IyxlSzwqDNfL631iG4ZHV9aQPMbQZS16FeKhuDeAwKw2
 0eWQQSTuZl14I8iYuoYCdR3rhipJu1TuM3PmzvoQKa6X5JQ1Xx+hiisGEu6HBGI7j1ZaLPNSgd0
 dtM6sr4gV8VsKIMnsEQ==
X-Authority-Analysis: v=2.4 cv=UcxhjqSN c=1 sm=1 tr=0 ts=69f45336 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ho_ns56EN5Ux2FGuUoIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: SUFUE1viT2mdEjHqHu7lw7YNJXwvOEnr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_01,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010067
X-Rspamd-Queue-Id: BDEBC4AAF3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-105452-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Taniya Das <taniya.das@oss.qualcomm.com>

The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
but supports only up to 12 frequency lookup table (LUT) entries. Hence,
add epss_lite_soc_data that reuses EPSS configuration with the appropriate
LUT entries limit.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index ea9a20d27b8fdceb9341ee53e5fa27b7a6d92483..92e1256c6457046927625136077c69f8d56644aa 100644
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
+static const struct qcom_cpufreq_soc_data epss_lite_soc_data = {
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
+	{ .compatible = "qcom,cpufreq-epss-lite", .data = &epss_lite_soc_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_cpufreq_hw_match);

-- 
2.34.1


