Return-Path: <linux-arm-msm+bounces-109357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK/iBIx8EGrdXwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:55:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E4E5B73AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C02C330814D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA3046AF31;
	Fri, 22 May 2026 15:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHvfl8aZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CaqwGPct"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01DF472793
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463113; cv=none; b=l6Vya7Wb3JhwKcIzW+5bwS8kBhzfikB1az4NoPKYyJXLjW3i/bf7tXbRu6oQRcQmO7nYA6xJCuAlqOYWA91APW9m9U5SpYYate7lLy0/kCyO5rWjyPWS+Y3IhOxItBbyNVKV2i/Eh4AGGh4lU5/2+7IT+nVwHzgxFPnnk4XTz9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463113; c=relaxed/simple;
	bh=2fruTuJGgso+AVSjN86SFOWYtIxEi2oXmlzdSiu8LiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NAiyTDR1YDJxxItn2Vkb0kzHcxduqvUiDqNMfV0xase2DR7V3mLxPnPK7zhZyQtxnghzbplmKkBwipJrDkp7uLxLQgqkvc4nPrsdXQdgVdu5jT4bNlU1eyVvoC0cwZrxaNkUUGyfy4upc92aq4oE4nFtWi6Eh4ibF/n+Xkwb9+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHvfl8aZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CaqwGPct; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MC4cHf1959117
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4wgPZzl341OGf2dUgGOsYttbVFxmjqeXYFCtkA02/8=; b=OHvfl8aZ/nYC9rck
	TE10u0vJ8/UUZ2UcshGddAF4VrHkrG5GkFmAocdo07MBj39ngLWHvAyqD487asLv
	TxrIaHYWlnKL5/u8d9st0o9isslGp7fQbKeGO1HSTTLqFA/OTv6pooxCw7vd7MY5
	CZGt2Rqy4dDGfwG6xh0NZcpNJu6IWoATKjsZP+4IHnbBgaBKflGoMgX5QZdDxW4J
	pJGtwkUv72wpNv/pGAzCptSaWO0BEqRRMYmeoaNeXcKIXNkC5KEwPY9oYOE7blvL
	k424ICQ8jp/v72Ozxrx8V+pi0aJ+74eJQtxjFPH0Hb9mwhwOEpntRz8KHwubst40
	C54eSg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eahxet553-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:18:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so11334821b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 08:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779463105; x=1780067905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4wgPZzl341OGf2dUgGOsYttbVFxmjqeXYFCtkA02/8=;
        b=CaqwGPctH/Fxv07tJi5n66aaTEqjlEquS+TLNykWv4TDWc4U7aXIVQ6i+u0nu+9Jjb
         xA+HM8nWL/FxXLfpRrCpDKyy20B+Xxs+UjmUDridMC3Fyjre2QEKvhdiolrhG7BGFZXW
         tno47JlBK9MH75ZAu543hmnXJqQxrIiNmIVKkcVq62Gyx8TUFUdLw0FFvuteDG0vTXxz
         ex+gk2qeTDKcBmOcHDUxW6Bv19yFumDoxS4/kbzdNRhUC3LTI6x01edEv4HWZ7Mwq0Yu
         ds29+u/GZ7Wj+IMnKmUlVWEXsMn9PHZlbNIMoUNNnnAStvuGeM1jxoZcujJ9MkQ8Ll82
         gi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779463105; x=1780067905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c4wgPZzl341OGf2dUgGOsYttbVFxmjqeXYFCtkA02/8=;
        b=AkgBUHGBUYCCmSjuD5w0PmQ+yyVhk4nNLXXdxlm6Y5SXP/LQ4nkApqZe0KlJ90khGU
         GQyz4Ey0HeiwDINfBNMTjJDT6BKKzoGhBRO22UaYBaEDgwLUYWQxaOlsG6i/pjreueR8
         0M45SMclDuLFXUFq9D/MVk6kXGvoawFCz6Zu7nXTGQQiMqGAG/tF4THdvQZ2LNgz8dLe
         VsTVtCsVJfQmSJT305xxKXpqfM8tyCwPnoszuyMJwCIgUqX17AmoNzJiN87Ke0uBNGjd
         tnX3+6jI1SqKothALEnebBu3KH4QU67+yH6rnWAZwEILqV4ZvYWeiD2gHNClYoUeJeGY
         1ccw==
X-Forwarded-Encrypted: i=1; AFNElJ+NeYLL7EaseFOvZJ/O3ztbMIewz373HljhRa0JWiy8QCmrEC/aJPT6arDImGMF7559RamoowAR4UUFVb1F@vger.kernel.org
X-Gm-Message-State: AOJu0YyNwLgT5jVhw9MabLsMUK3atZeAkFO3syBGGmfxP+mpQkpC78Lw
	QepY8c2GG/FkU1/4tDTbtqeZG9avB51NvlGKW/TznYaNrVg8iSi64bPg7SGpmdJKEn7hQo5vB5+
	JJoBSR5vGrUcN98KNvaGTdmK5sddZlm1ay83NyEMfAOx0M+KpLiiTga0ycqQLnmxW7OEa
X-Gm-Gg: Acq92OG4I8Srz5ZcnLTlugnqoZqk6amQiPoSbEUyKQvWCaX7jDoKPZyeBbDJzGZm7Wo
	rCT0jYQ4+kriIrpFYDZos+vxpbS08JCajsfnIlvIzfU+kwhfrMZPxEM2S9uiTf6WOQZqIFrZwpe
	pF/3X0inBcCUD7SVlYSJOJK8VLIasquqtV/znfYsJVGYJh9o2KRRCrSO2HIpdRajudk4BMuvQ2G
	MH+k+dE1Hq6f4R0FKWw+RGLmtlsYIjFAKYJ0pBHzONz5/Ck3tR2qFsrfH5jlHzNyFQMgVrwLZyH
	1FWlwoMQK14cMNAKxN4m5R1nHsA5kKUXVCqZXDwE55iibLINZeEbVEj7pO1os5pxRk3Kzd9Qaaz
	yCqKFEccXVlm++eMR5CQg4NgpUDZBBmQo+kXrAZYJd9IV7P8BgtJW
X-Received: by 2002:a05:6a00:181f:b0:82f:aae5:c7a6 with SMTP id d2e1a72fcca58-8415f6613abmr4078488b3a.43.1779463105277;
        Fri, 22 May 2026 08:18:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:181f:b0:82f:aae5:c7a6 with SMTP id d2e1a72fcca58-8415f6613abmr4078454b3a.43.1779463104793;
        Fri, 22 May 2026 08:18:24 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fe97c0sm2083042b3a.53.2026.05.22.08.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 08:18:24 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 22 May 2026 20:46:23 +0530
Subject: [PATCH v4 2/2] cpufreq: qcom: Add cpufreq scaling support for
 Qualcomm Shikra SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-shikra-cpufreq-scaling-v4-2-f042a25896c5@oss.qualcomm.com>
References: <20260522-shikra-cpufreq-scaling-v4-0-f042a25896c5@oss.qualcomm.com>
In-Reply-To: <20260522-shikra-cpufreq-scaling-v4-0-f042a25896c5@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE1MiBTYWx0ZWRfX6pPtn2MOkMn4
 SyNjUxbXfiBAwcIkcBGf5cJyoNpy9uEbJPvpNiC5NKbj3+mTHapSNb8AIhWbvIVmOeMhr34EwoS
 VvGi+nUC5C5W+/CF/YavgDyrRyj25AKXbEQaiaSKHm7lUk3C+KYer8Xeeje40+ILoKXgazUVl+7
 7GMB1V7AzVHGYHUsARndFseQx3Wn1+vBkm1g6EAHDePaqbZZamiWPJbWpfkXD/zZPf1res+niZr
 BZSFup3cujl48PAu0O2CqtTRZWgEDMOn1EqJoKT1jKSB9hQcNsyTAGnUvwOogSKt7DXfFhmJobC
 OKuCkXanrCRdmQDIyDWOUIWR/CQDKLWkObMchVe+sMcrboSofJ/pBYuQmsNsnlKjWSyW2PhrTZ7
 vAXQvL9Bouw2bj0QjaKJ6R5bl+uSRuU68KXezufURj133n/37OlnJdQcViXmnN4db0rWZo0cck0
 qXPXsdfZLe4YgTGcTEA==
X-Proofpoint-GUID: lyYRidtg-wljKjvA1bMzJZAh21ectEVY
X-Proofpoint-ORIG-GUID: lyYRidtg-wljKjvA1bMzJZAh21ectEVY
X-Authority-Analysis: v=2.4 cv=ar2CzyZV c=1 sm=1 tr=0 ts=6a1073c2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8xPgF8R1Jm-cxLKBqHoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220152
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-109357-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 12E4E5B73AC
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


