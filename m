Return-Path: <linux-arm-msm+bounces-103812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLw6JKlm5mmlvwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:47:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9048143217C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 24495327581E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02D1359A82;
	Mon, 20 Apr 2026 16:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPTf7d43";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gYK3kkZs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FB9357735
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702617; cv=none; b=qd0vO1JQCYm4+5HVQpP3QHQBVb+xIpwXKO39hBEocsVaOTAotjNBBKBe48uDG9Cc0m6Nrn6+3MJMI36J+jrFAqddROTjjLWQismPihsxppsMTsrBOA3gzzFB+PI26sVIFtX7rsWRXAzbni9UVf2ui+SA8ynaeHH0onFYnj230HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702617; c=relaxed/simple;
	bh=f2wjz92I0Sbbb8BOJs0/4SrTPSaL+5OM0B7Xf9WaqAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dXnxRYA0wYXNbB4V+r7jXH8y5lnvuplUUH84dhULWhtRHU0R6b9R2OkVnFP5oLqiYZ8kqgOWRZRtKJJQU9pK9Himpdk1nk/37AiwTSOpqo9ld37r4q9MBfw1d4+0B+e9uj8fousw6jH8RlBfhnjhA+w2+gTFkuDxc8miFzyDrWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aPTf7d43; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gYK3kkZs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KA4I3U2980962
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cj8JODyzns33JEy+VFqUGn3ybiwxgn9uIU1bz6Z3n60=; b=aPTf7d43qKmhp/eA
	QVlEYDTJQT/NxbPAVY2GbsqT0wWlNAy0dMA8JrytxlTdS/k+F+Tvzkl+8TisXaVp
	4YgOfsBl+Cbl3hIkAaWRLdThjuHl9rrDTCn8umJd17oieoWQVM6Glybsg+pqhjku
	xymy/CjJnmqM94Lddb7VojyVz/ggujNSWzYL6AxDI+3wduDD9GvWiYYUSqwH2HdE
	KUHuS8vfSpKIjgx85dnQE2gGq6EX5J/xKfcCiHeCXExuyMyeQS8sNpM7pKHOa7K0
	vNZuBgqjg/G0cO2Bj18SDIBpl3zmBj78eE16rU+nVS7tHqoEoJ9o8CNaKdKh2Udc
	XlvWgw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnj2psdbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f2138a9e0so1921614b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702615; x=1777307415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cj8JODyzns33JEy+VFqUGn3ybiwxgn9uIU1bz6Z3n60=;
        b=gYK3kkZsiF+FHm/02pgWJ7TCJboUtzLd5tcqoErKCFVeuoth9hpBZ18mDFoTWShsKL
         wgshck0yaRgjzj1zM3euOMFGrzLfgc6mFjW0ckjLEurSuMK9ryMzGpOARyjx0c+m44Xi
         TzmqIEmz+/Kqzuz3SEHAkpeJPz8kQjmJ1DvmDHsr5IJiIagt/ng5qSsqmoGiuljpHmlb
         8CBfd/TxcU2GriBkuAS76K4j2Ld+3WEH5xAvwflDN9mGUQRKK6t9xxxxPI8ECjg7fdij
         JSpYi/5shuxe+RWi01o1CCK8HPpw7Yq012JQH5jNL0871RRoUYXxqRn+u1wEoycODpbJ
         RXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702615; x=1777307415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cj8JODyzns33JEy+VFqUGn3ybiwxgn9uIU1bz6Z3n60=;
        b=PObFkzLszvMy+VNFaQRzUWlXWPvfckp4PXH/ELU5+zjQOFpK24yJd4Pr7S8mdj+Ubg
         LO3vzxm93BneJr/4HeAk8TeZRJR3UKSLJjnMQB+PEWBd3Mh7J7Eq+36+QEfaxKQQcrb0
         APyOtsUMR7L2EDgbhAD9ofBUuRlkEd5uU8uyETTt4MRm4d/6Zhynh8dX1vskiT7QErs9
         DjxwYDP5I2yk6XTA3ylSKI4eMgHFoRnjk4HIEHxr5nCtACcY533IBE4BOFnBkXjJuiuI
         HcVkfA36hh50+mwAYtVEWQ6i9Q8HX+9327jQjxxWo7aVXisHWv9B4Oo1ocD1H2oKQ5Oo
         R3pg==
X-Forwarded-Encrypted: i=1; AFNElJ8KEw2JUJW918k+LGys3zKYW0+y62tR6omGUmPkp2FlzheiOeSczNrxr/OkE0v/GEYZqyhtXk7teO2P5fTm@vger.kernel.org
X-Gm-Message-State: AOJu0YyRC0r2rUhCmd1pthUuC0fgSnb2hFgVUpELrjUPYR6DtnvAc31O
	JR+eizDlL8zg9zLrU5H9h4fHgpZ9GKucNXDsDm5jR+cDgqU2q/vNJNYXuYLMooMh07CpI7zJsnp
	bwm7F9f87Di96KjIld367p9ZbNxevoX37aZxqEHqKqM+Va+XXea5Aqw82HKWmOn4XSaPt
X-Gm-Gg: AeBDiestfYIXCEb1Jv3zPz33hbkkO/VtcocOVzAkMLfXwTCA1yanUzndpuET5gGUOyW
	t7Avc16vTak47lqBvwbgExx7wy5L9TtiD/ktyffI39S674pD4IuIwRo0Fj3LoiqgOPCRdBOmyx5
	pLDWH9UGSlTrxdJweRdK6MbIUFsoM7OFu4waLlSmMOBiGFwJI/aZKhk7e490ZgcV8wRflD+Nmop
	nGaD7etB4fMB2bsY6FQ9Rw1wp0UJiIYJO5odnOunF4zo1qiI5CLdanwcEFPmEAARDU8xxA+9a+x
	FQ2dImUVpF45uj/TSR043lzhhG+UpZ6yeCfCzpenxsHK82qXoWL3Z+/stWjjZ4ovurjzU7rtdAs
	igFy/cpHnrLx40WlfzogdWRVC0aavCYAn7c4H+CeQE3oKqH094hbBVFu0Paghg+8=
X-Received: by 2002:a05:6a00:3498:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-82f8c8bede5mr12500274b3a.30.1776702612280;
        Mon, 20 Apr 2026 09:30:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:3498:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-82f8c8bede5mr12500211b3a.30.1776702611609;
        Mon, 20 Apr 2026 09:30:11 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:30:11 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:58:58 +0530
Subject: [PATCH 05/13] clk: qcom: common: Add helpers to control clocks
 using CRM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-5-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: gPNz3DpzRZQcHb8iab-l2iYKsE9397V9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfXz5AzhFSzUqtq
 /rLsxGGN1BkCabGmica2lgmRgjlztG5+VU4HLlKFORwBIQucVjslAXTviHWPE9uCgcNJFTGRJiX
 g4CxH3ExeZfzGF7qqyMWPO7TldufSXyl12rt6zEPhqVjc/666itSBZHJ/CoPiGAH86qDtVBOl/I
 hoF70Qudu6us/BCyoXZ7UVqsRZ+lDMAZHyq8kihjKMCOQaqW0b1T3HyrlPMMFgNzU56e1OaorUb
 hanRfEGgXwWnkLK0PNLDFr8ibW44KfHarPToEVKp9H/ng4CC4dqZkCaQ2ZF4TvOwmGmqkUb2+Wv
 ktGF6FaOn+IBzbWlYws4GZR0eG7nWlSOUI5HBue+/MvhNbg7BEpBvGR9YTCAQLIdgBIcV+Bs/qC
 rAoq48/JsgyRD0EGUJj2Z+XMikhJ17V4U9K+IK8ZiFrzF+6ap9r049XSm/yKeOlbGTFFeNzQdHO
 CFAZYDk5Nw/gIoK97PQ==
X-Authority-Analysis: v=2.4 cv=XMoAjwhE c=1 sm=1 tr=0 ts=69e65497 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rqiFlLygBDmmhMIpyI8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: gPNz3DpzRZQcHb8iab-l2iYKsE9397V9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200159
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103812-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9048143217C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CESTA Resource Manager (CRM) scales clock frequencies based on
performance operating levels. Introduce qcom_find_crm_freq_index()
to convert a requested clock rate into a CRM LUT performance level.

Additionally, add clk_crm and qcom_clk_crm_soc_data structures, which
capture the CRM-specific clock configuration for a clock controller
(register layout, LUT information, CRM device etc). This info is used
to read frequency lookup tables provided by CRM and for sending votes
through CRM to scale the clock frequencies.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/common.c | 39 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.h | 38 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index eec369d2173b5ce24bc1ca860d2ac1bbdce04524..968e19997daf5eebec65315974cd0c41e08e55ec 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/export.h>
@@ -80,6 +81,44 @@ const struct freq_tbl *qcom_find_freq_floor(const struct freq_tbl *f,
 }
 EXPORT_SYMBOL_GPL(qcom_find_freq_floor);
 
+/**
+ * qcom_find_crm_freq_index - Map a clock rate to a CRM LUT performance level
+ * @f: pointer to the frequency table
+ * @rate: requested clock rate in Hz
+ *
+ * Convert a requested clock rate into a CRM LUT performance level index.
+ * CRM treats performance level 0 as CLK_OFF, so valid performance levels
+ * start from 1.
+ *
+ * Return: a non-negative performance level index on success, or -EINVAL
+ * if @f is NULL or the frequency table is empty.
+ */
+
+int qcom_find_crm_freq_index(const struct freq_tbl *f, unsigned long rate)
+{
+	int index;
+
+	if (!f || !f->freq)
+		return -EINVAL;
+
+	/* Return 0 for CRM to disable the clocks */
+	if (!rate)
+		return 0;
+
+	/*
+	 * Calculate the perf level for supported frequencies starting
+	 * from 1, since PERF_OL 0 is treated as CLK_OFF by CRM.
+	 */
+	for (index = 1; f->freq; f++, index++) {
+		if (rate <= f->freq)
+			return index;
+	}
+
+	/* Default to highest corner */
+	return index - 1;
+}
+EXPORT_SYMBOL_GPL(qcom_find_crm_freq_index);
+
 int qcom_find_src_index(struct clk_hw *hw, const struct parent_map *map, u8 src)
 {
 	int i, num_parents = clk_hw_get_num_parents(hw);
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 6f2406f8839e8f432ef34ce32c930cf045f6ae7a..9987cec84324a258f3405c7b9093237f52a41b45 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -1,5 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/* Copyright (c) 2014, The Linux Foundation. All rights reserved. */
+/*
+ * Copyright (c) 2014, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
 
 #ifndef __QCOM_CLK_COMMON_H__
 #define __QCOM_CLK_COMMON_H__
@@ -62,6 +65,39 @@ struct parent_map {
 	u8 cfg;
 };
 
+/**
+ * struct qcom_clk_crm_soc_data - CRM clock register layout for a clock controller
+ *
+ * @reg_cfg_rcgr_lut_base: Base register address for CFG_RCGR LUT values
+ * @reg_l_val_lut_base: Base register address for PLL L and ALPHA LUT values
+ * @vcd_offset: Offset between consecutive VCD blocks
+ * @lut_level_offset: Offset between consecutive LUT levels within a VCD
+ */
+struct qcom_clk_crm_soc_data {
+	u32 reg_cfg_rcgr_lut_base;
+	u32 reg_l_val_lut_base;
+	u32 vcd_offset;
+	u32 lut_level_offset;
+};
+
+/**
+ * struct clk_crm - Clock CRM used to communicate with CRM
+ *
+ * @crm_dev: Pointer to CRM device structure used to communicate with CESTA
+ * @regmap_crmc: regmap for the crmc instance to read frequency look up tables
+ * @regs: CRMC (CRM clock) base register addresses and offsets
+ * @max_perf_ol: Maximum number of performance operating levels supported
+ * @client_idx: SW Client Index
+ */
+struct clk_crm {
+	struct device *crm_dev;
+	struct regmap *regmap_crmc;
+	struct qcom_clk_crm_soc_data regs;
+	u8 max_perf_ol;
+	u8 client_idx;
+};
+
+extern int qcom_find_crm_freq_index(const struct freq_tbl *f, unsigned long rate);
 extern const struct freq_tbl *qcom_find_freq(const struct freq_tbl *f,
 					     unsigned long rate);
 extern const struct freq_tbl *qcom_find_freq_floor(const struct freq_tbl *f,

-- 
2.34.1


