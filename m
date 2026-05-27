Return-Path: <linux-arm-msm+bounces-109983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDVcOLm/FmrOqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:56:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9BD5E23BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDE23303FACC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94AD3C2BA8;
	Wed, 27 May 2026 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YAwilIRo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b3JnTOxp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A9F3ECBF3
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875682; cv=none; b=bf8qZKBwOkNvPljaM/M9+7mUMqgLPVNa0FdhzL4OA4ZMRh4GMYBUIvWB6XBXOWTul//yk2lVCoXQaaeJq9gN5BmeehoFRl4l4zOLHLajZHks4CN/g8KlylHB+fcPCWrL1n80qu0zk/bykmceo8Jgp/VRUlZu0uSeVrzV4QU55Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875682; c=relaxed/simple;
	bh=98LlZBecr2BPOY6/vj65opT3i/JuO8jbbNCcNwpAOpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCwaQuuq2X/V7rmMhH7tz1c2YiiMMLFUhY58xVqeHjzO92m4gmcERqT2dI/O/3b0zoAttPtZT6V240+pIXCOoN1OL/i7FCSu3lVYBH500n+OswH2qRWBGNRpVYidh3gGHHlbIZFq5mDgPY6t9CeI1s0BVlhpPpaLIY0bPobtbK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YAwilIRo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b3JnTOxp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mXuL4108545
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cObOVWK95Eo
	Oem6WUWp8syIx+4LkKR23FIFPgNUTzC8=; b=YAwilIRoX+6PJUHgx4Jl/QuDIBl
	TcZNwGMoRKGmRvs8oBmgUCjXmLAlr5SV2hN6NHhKJ6lrKVzdM33VTxFwN8kL92FB
	2s3Cn9CrRD0vKg1VxZqQzjozocZG9tUEaXd0dgz85087cXcU/m7phovD69OKijf+
	+CDD75/jgOlMqzEMUYm5jqdhJPdR69yPD4JylwuQgYjPDGtcH2HxoLMzur5XuU9/
	zlZrr0eOAi4aqQHaoOGo4unBrqGe4zoECgoVPexLENCq34sii5+PFit5Cn46olOK
	F0gZP7zceWam49s/xcqPPD8KhPZDXbq7EXCXHUWncWbVnnj5JTuvzzEvuFA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edefukmkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:54:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-841d02525b5so1630115b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875680; x=1780480480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cObOVWK95EoOem6WUWp8syIx+4LkKR23FIFPgNUTzC8=;
        b=b3JnTOxpq7GifSuHxVb7dmB3LpJ/L8BrKJqHUHuPC74FJUkgajyvXYMlpfrcehsOZV
         dYajSk97EASneYRGmKi6/nHVZvRxvcSElZqD/9vzEMGPSqhY4t2CBpC/h6rf6oWjR9OR
         wgoyPT9Gbw78UmOqOBManJiGO01ycXmCh593EbjGcvEAUsLx09+dJiDXE3yhowPaY613
         O9Yp07GCKN2/tDy76jWOs2pwQjgrwa8AvY/YS321yd8joHyeRkwdoRQdWYNOBxTSkA2T
         y8rVaPYt8GQC15zkbxIuf4PYtSJjdwpAl4dsX/i+f6he+old9vMS9Kfp9X14CYKx8c6t
         LXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875680; x=1780480480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cObOVWK95EoOem6WUWp8syIx+4LkKR23FIFPgNUTzC8=;
        b=GS26dhP+CqFnB/jS9aOlWy+/GOZ9JEhm+7qMk3x9XUnfCYzUS+6Au+LsPrwqudZTJR
         zRgBfjAeQ7wiu89WdRZXGM6oR+Nqr6BSpzrIMS+/Ti6i6sgpjdvUWWF+cMNqELRlHjsn
         BA/2fJ6FbX4zWrU2eOuX6/AXo65+1FT0gJQ7udOuQ3d4Zsldx+YMdn0n5MJqcbmCSDg1
         dzJvKogEAhPwRZ9UzKmQGsUCkfcPeJanHXNnG0Rr4srKxobIS3aP0w8sDBXQ7O9oyTHw
         PNaDQVF5q1EPdMA/YJ3DelbfniQ9Nw3adHY8qWbH1+s8B0cdIOIjMvgFtvikKUV5ZCJ7
         4W1w==
X-Gm-Message-State: AOJu0YxeQ677ZpbJUN+qrE7sxUSTDGSj4/vyV879OJsVqao+2Ac7v3Y8
	bDDlyn0oLVT4j9z3rNvD0V8E3pFdFNT4QVmAentbBdLfsNgAwCjeZfb3T50yXKOQRTWoknRqJ8k
	143d1Z1At+FHLrNjzyb+oegKH9CsB1/KCkpz3hvOSR4Pd8svruMVz7LvNrbYaoTcTWGsm
X-Gm-Gg: Acq92OFB6cnMtGI1JpuyZVdOjxNq+unAsfr8CogVOdUnvhaJnD4uABykfJCpPjZ7YJF
	SyuuK4rwZdUzFGPS6sc5gkCqFUz2Z9Dk8FDoIiKysdRPx8O2xjBUK+213kYyofC0cx2kH8aG5gG
	Ydm/kJZyyX+piIeJuNMH79TQRFhKiSz/TX4Da/wFQB69/TLLlZLj/8kSzoYrkUH1NKZX5B9N60P
	+Jh8lNad3VYUbYiHE6K1HfKz6sAc7IBYdDgPKhER0/Dpry25Bc5wluBDsBYJMqrhPS7nK2cN2Xg
	RYLWxqRtVoMU3oaef+aJT7z6xS6Debf9LHdI+lFANbnAS1G8E9CFasv8LtIASMDB/FjwuHj9J6A
	olX7H+4e0mfMfgL5qlJRyLqOY+zCZQABoIVdNXX0NPvLG5+BSbIAbOGOYOic=
X-Received: by 2002:a05:6a00:14d0:b0:834:e880:7a21 with SMTP id d2e1a72fcca58-8415f15b51bmr22799094b3a.18.1779875679753;
        Wed, 27 May 2026 02:54:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:14d0:b0:834:e880:7a21 with SMTP id d2e1a72fcca58-8415f15b51bmr22799065b3a.18.1779875679239;
        Wed, 27 May 2026 02:54:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d70f17cbsm1809325b3a.45.2026.05.27.02.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:54:38 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 3/4] irqchip/qcom-pdc: Add PDC_VERSION() macro to describe version register fields
Date: Wed, 27 May 2026 15:24:25 +0530
Message-ID: <20260527095426.2324504-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527095426.2324504-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527095426.2324504-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5NSBTYWx0ZWRfX0EQELynfQxNm
 BusU0/LRPsdB3s9AKTrySgddqc3etfc+9twgShi7I+2pH+hfBshDWjpal9abyCVqA9w7mo9qrXI
 6yUjz7lHT8DsUPiOeLiYf2SgNAiO7ey2nYtoPzMgOzGq7Ae03svS8YEfXTpmUu5hR4105x31u7y
 y9zdoaOMwUO129S0/R3nG/ub2+3fZNVDLRU2XPEHRMwuBEeLd5Nug3tb1HeL24lMQB6wGvNhJ5q
 PvIBkb+vEv8wkaXbfLvuvt8TFjnjOtWcoyFcaN+uRHOcwlGJqXtAgSicI6LNMC1PMMlJpKqYPsA
 Tn/Rq2K3E5ZBuIwm3DaFRsRN1Xhu5E+SKPhedwLfFjlXXPiuq4BDhVtKuUg0sO4S/Azo9UcLXn2
 OhgI17jvmmcQnqpksL1fpfALOAWQpuA3d6NKwGnrXh4jEPunoaEldF7+9l+bgewqJp3d5n/zPU0
 Q4kgSUSDEoSDqf2x50Q==
X-Proofpoint-GUID: nuQ_I_FOcnLU8C08hpL606U1MtVCEu4v
X-Proofpoint-ORIG-GUID: nuQ_I_FOcnLU8C08hpL606U1MtVCEu4v
X-Authority-Analysis: v=2.4 cv=cPnQdFeN c=1 sm=1 tr=0 ts=6a16bf60 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VeW31bOOL8eyMvC__NIA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270095
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109983-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A9BD5E23BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC hardware version register encodes major, minor and step fields
in byte-sized fields at bits [23:16], [15:8] and [7:0] respectively.
The existing PDC_VERSION_3_2 constant was a bare magic number (0x30200)
with no indication of this encoding.

Add GENMASK-based field definitions for each sub-field and a
PDC_VERSION(maj, min, step) constructor macro using FIELD_PREP, making
the encoding self-documenting. Replace the magic constant with
PDC_VERSION(3, 2, 0).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 21e2b4b884ee..9ad2c22342e1 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/bitfield.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -34,9 +35,16 @@
 #define IRQ_i_CFG_TYPE_MASK	GENMASK(2, 0)
 
 #define PDC_VERSION_REG		0x1000
+#define PDC_VERSION_MAJOR	GENMASK(23, 16)
+#define PDC_VERSION_MINOR	GENMASK(15, 8)
+#define PDC_VERSION_STEP	GENMASK(7, 0)
+#define PDC_VERSION(maj, min, step)	\
+	(FIELD_PREP(PDC_VERSION_MAJOR, (maj)) | \
+	 FIELD_PREP(PDC_VERSION_MINOR, (min)) | \
+	 FIELD_PREP(PDC_VERSION_STEP,  (step)))
 
 /* Notable PDC versions */
-#define PDC_VERSION_3_2		0x30200
+#define PDC_VERSION_3_2		PDC_VERSION(3, 2, 0)
 
 struct pdc_pin_region {
 	u32 pin_base;
-- 
2.53.0


