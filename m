Return-Path: <linux-arm-msm+bounces-108582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC9rNQ+eDGq8jwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:29:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C7358314A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79B2A3085E6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4903DB329;
	Tue, 19 May 2026 17:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPFZkqCw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g8rJvkWp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD0B3264D8
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779211704; cv=none; b=h2cEG9aujfEShzwz8cqLv/Msh03dil6PhD10Ur45faVdYWZ8Ut67BTBTlnS4mjA9t/F1coxdLR6cu3c7r6malZ6UA0F0+jqCV4Uue0XjbsPz/7YYakShAjQWTRLvIIF70AhvMT2NS0US6e+AV6MZ/eqfAzKi57CXxLtg2EVL1dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779211704; c=relaxed/simple;
	bh=1yBdAUWZ2RKuPPPpZ3gE4i9xp5AOnwnF0bUiJcBHalI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eqGXXuwejf50xVNbzulJffdky0R5UYwc3t/U1h88Ehcd5wXzMXAXilI1+sUYnrFQSpJ4wfdWP0RA5Kr4oS+VTxdvEk9bt1qQqPzkXwTzMqZR99RkpCNCPVf+lj+fZGNDmauiCqWW+1S1uS4ZkwXzhnhO0fIyjkQJ3T45AdjABIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPFZkqCw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g8rJvkWp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEwmhm1636927
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GrWsRhIhWGS4C7EWlb51bAL+FOwhlqUbVF9HoNyoqTI=; b=hPFZkqCw0kP5NAaf
	7/QFkxjxfOPU+uD8g3UrqL+MIBuhZ5egE3o0A7I7g/vYCkYbO/viUo5C49fYhmgM
	52+/8JpWiobFd8WerHpJOhSAFnZAHMUzgTQA8aIhtMZJakyyVw+tX25AkQmpIerT
	2RZAXuWy/olqo2kyuc41hQ7yKs6jW6c5A+1yQ51aS63/prO8ho8aZsBNajptMDMF
	rjELEjGFzLzConxefD5Vcj6fRCNfMT6MKbg4iXLQSm46pxGVgXty9Hjd/8HEFzlq
	YjQBA8aAl/godj39tIzS8PYhp86L3MOESCk6gry2HaUSxMTPSi3H8upPslF3ZbUE
	peD1lA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3s8q2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:28:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2babbeff9e4so41129195ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779211700; x=1779816500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrWsRhIhWGS4C7EWlb51bAL+FOwhlqUbVF9HoNyoqTI=;
        b=g8rJvkWp6Np4cLHyL2WLYNVLUdjRANUaqyjnn6b91gzZf69t9yR7xclzxCBXxL62RS
         L7lxKV01xTi1XG+rKgaohbuF7hB2aJQLxcRzENpTd+gXdhoiJ9ReDczaGRBwgbAlqKSR
         94XxrPHAwJ+rzqQis3vN5OmguSNKoVhr5ExAwJtU0Kot3Kc8SR7DsnfRjprJioVqP39j
         OZpS5qAM43ykR+szLGNhmLZMqSq8wPWuJDyTBxM5uwf2kgarvl5akmcBlI6hQnxZbgXX
         VPBUPgbQYDDJYcW8PqDj5bKefNxDJrWV+bfueKmKmS0a7/HmEhDaXw5LyWh48STvgq4d
         g1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779211700; x=1779816500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GrWsRhIhWGS4C7EWlb51bAL+FOwhlqUbVF9HoNyoqTI=;
        b=HC4ZHruXi+IdoyrDmeMhd/wxWKQmCBkYvpwY0RXZmxHF7on0Mty7ncQHJ0V+pxswaR
         mZh3fbqp0LkYDkgWNBZLUEwRPPMGzn+WfkHVRvIJ7/I1shc4OJgrSO/e+XLQ9vyl3W76
         IZzIR7OPjtuxOhLU1Nlmw9YyscpOqqnUZSfw5HzmyHbBpokW9Sncb7UTUslEuT2udTkV
         z7UG8Om2Q/Gf7X1ZgoDy88W1LJ8iH/YZd0lTpK+4LBvRkbhZzBfCWbnAxqFjbiNXDIZz
         jH/S0osGoSMHRbVKudxR20rdGICjZBTpDa6LX9CcYkZkK9CDcDBxNjj7gFGY5cmsN39q
         NbDQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KN4XJTIZAHCGaZehURTuwf3rHeWZfvsyKGBt0UWk+kPT0g/Slud0J5lyhmA4UrEtMEkftwNyK8g2GTQ3e@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9LLErPkysoRUu6Z4wgC543gN0T1Lz2J+HTf37qdgGTwLK9p/6
	hAuBq5c0mUt28mlnqpugSl85Os+SVIlDZnqSR8D46ZuZJ+u1/HvOtUbxKSlqk2csg0/QrwhsATC
	TTzqsY5uIi6kDy6AQm0cNdMkpCIGdzydhrURu/g9IoxSRdEP73+Hki66oW0Khix0Kbn2f
X-Gm-Gg: Acq92OHvnlNcUedVshAOwIQNlfUDPZ0SX0V6h22vCh34xVCxmZeNTAEw1jOG0ltC8wJ
	g28zkwZapdtXuivv3JPkxWSI/yElKzxZd898++1WCB99dXNNByj/PoS5jvfnrY+kVDgMygynk+F
	3obSGHVNNmQ7TRL1UgZ68vj4AAaTt+fbVFz6Tu8zUBRQqApUQoI6U63eLFBltRAPwEZUhWLLZkz
	CGw0p6U1PhodlmoRJSvAPtPAvFvRTNljgkGYuq5srNCUq9xuu6nTo7+JKavN+T93l332Taa3isi
	ExhKnqfwj2QtcQDNGOitbXHKN9kx/rjkmy3DzQ+I3eO7uNEpRTxaudRTZf5KgqGka3GUCQVkTsh
	wzNZPP5Oqt9AVmYG++AYPP4J9BVKpnIUYTvC3z0Go67cwrKYPgBmi
X-Received: by 2002:a17:902:d509:b0:2b4:5bf8:a7e1 with SMTP id d9443c01a7336-2bd7e8288acmr184173475ad.6.1779211700446;
        Tue, 19 May 2026 10:28:20 -0700 (PDT)
X-Received: by 2002:a17:902:d509:b0:2b4:5bf8:a7e1 with SMTP id d9443c01a7336-2bd7e8288acmr184173155ad.6.1779211699820;
        Tue, 19 May 2026 10:28:19 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d125159sm182248365ad.76.2026.05.19.10.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:28:19 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Tue, 19 May 2026 22:58:04 +0530
Subject: [PATCH v2 2/2] cpufreq: qcom: Add cpufreq scaling support for
 Qualcomm Shikra SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-shikra-cpufreq-scaling-v2-2-2b09f0e1c9d8@oss.qualcomm.com>
References: <20260519-shikra-cpufreq-scaling-v2-0-2b09f0e1c9d8@oss.qualcomm.com>
In-Reply-To: <20260519-shikra-cpufreq-scaling-v2-0-2b09f0e1c9d8@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE3NCBTYWx0ZWRfX/vHGV2j0shVS
 dgnMi2h7xY7NWXzQ2Yr9gjIMZXI+PtvPX0DakBh9Fzq6paZtcnXCVWsjynlisdwfaxbOYnFA0WX
 W9277FCaSkkAV8lXOP6Na0d6QC+gP4VuwqQ71UoRCgGmstRb2taIv0cDGBdHPrrNaN0Kc+Nbydj
 iLBlSBI1pEWx2dzFCPCnW4FdUbXCVZmhsVkgbjof3ryw/FBD0w0kSlvU/6Oew7hfxQHMoqnSdnK
 V792fLo6jwJKZXM9dLlFZGcymDAFAEyUcr+U7EcdZ/WYf+DX3nqNb5m4QXvz+H0N+fNmsFwCIcw
 1WjBf526ISX6gvPlakh0PnKhkf1eA8aeW+FtTScxE2M734ajRwqm/EBPXJwP1UdbGXWoaJ8XMyE
 PugRaL5fFefhyRrHGIXm9HVdWsYYV0hwaqFVE6nlcrLssEOIgqALKaLBLsp/WGJE77lTbXOkw5+
 Nb92FUxeu0zKdIH+/7Q==
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6a0c9db5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9mH7G91LJRnKxjVXxHoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: FPvrSAgTaoMF5mhjXPkof_nwwErHJe1n
X-Proofpoint-ORIG-GUID: FPvrSAgTaoMF5mhjXPkof_nwwErHJe1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190174
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108582-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53C7358314A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Taniya Das <taniya.das@oss.qualcomm.com>

The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
but supports only up to 12 frequency lookup table (LUT) entries. Hence,
add shikra_epss_soc_data that reuses EPSS configuration with appropriate
LUT entries limit.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index ea9a20d27b8fdceb9341ee53e5fa27b7a6d92483..d50b868dced309cceb7b49b69dff933e4bd9e357 100644
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
+	{ .compatible = "qcom,shikra-cpufreq-epss", .data = &shikra_epss_soc_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_cpufreq_hw_match);

-- 
2.34.1


