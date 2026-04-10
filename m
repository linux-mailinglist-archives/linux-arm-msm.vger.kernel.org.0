Return-Path: <linux-arm-msm+bounces-102720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIQhIj5F2WnjnwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:45:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E283DB8EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FDB83024CBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AF53E4C75;
	Fri, 10 Apr 2026 18:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBDCmeH6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ht5mXODA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DC63E4C74
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846551; cv=none; b=NOWAQACrmFaGrbgndWoSusjZFwbdUvCDlmmncsjZLNZyuUUuB4eCSA9bj8zWlI+RLYBAzepJcnRijpHbUzkOKx+y5jgeoQ9j7zzrRPzH0mcPIhj3Mc2MgmvkGvba2PW/S3BU+OuT6Sm/KKIOm35/mFPXyeQybinfcsNVhCTNVHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846551; c=relaxed/simple;
	bh=NavYeT4bON+iuQgPlGsfijBL8el6VrMBDrqEtkBdnic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MgBOC0KM6I3OsytNIUHw8pHH9a6X9qOVBqFQrfOkiPKxgo7p/7Rqb5cHg7mD5SsJqsLexJt4OAJ2/HLqToapHr1xR/oBvlO8EjyCn1RHADKVo0Ui7SgZWZE6rjkVifB7UGQ72pJIoesONt0YThPKvIXC3vthuRO8z6idABlDCAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBDCmeH6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ht5mXODA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB1UBE1322660
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EBLVxLT9mVW
	GJomaPHrgjCu8AgYjVMtTnyWNM7IJWKI=; b=WBDCmeH6gPk+S8ocuV438TxKoct
	XdICC8DTL0ZM7ub9OGuKPyAicC/S3hB9mvDD/2kYrhSe/A6tHGDk7ftftEISOmB2
	Lsu5gviQcg6KyxySiekpizTdl+HzXmJ8yPwj7hoIQKHLttX0W3KNkfPRNNe2BiSE
	eFmlwE/LqJeZxdCSXqyT+A0gqMWGR2k/vOpi/JbXbfv2mdJblxuCq8HDTApFRiHD
	ipXhtK2hadPv0RBkf8DpgY+1HS0nU9QPE07Rkl6iPoE0uraVSVfnbHsBOqZyqeCn
	TZQBPvx40IZ12d5vhp3BVlMeXZy9PEpr5IGaLj7AxrSF7hoFFUgmyzt3hZw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyyh9dd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c769b25315eso2827476a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846547; x=1776451347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBLVxLT9mVWGJomaPHrgjCu8AgYjVMtTnyWNM7IJWKI=;
        b=Ht5mXODAxN96gq7N1r5vqEDgwTBPEz5LMa09rKF0/3llHnCYyZ4lALeoJyi+fdts8b
         W7EYuAM+Ll+J7+Ol1WiiXzkiv3WVpY045U0XHZ+eHhHFPgtJCK+xnR8sAn0ttyjWLjng
         nHVduTC3D+eSbJUxSOyRN+8Jvd+AmAfpXcAC6T8wE74KvsQDUgD09gVYLZcER9NYrNuX
         ck24uSvRq57ADgZI2FNeOLFBrHi+28xaIyViKw4mOR0Xka0ep38Uh4J8awQ20VE83h0N
         cgHRHmzTQW4EAJCn3ILeYihGVlWZ05W0hNuOU/KK4ybIPyPoYh99Yf4giAHSTO/i5QrW
         stvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846547; x=1776451347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EBLVxLT9mVWGJomaPHrgjCu8AgYjVMtTnyWNM7IJWKI=;
        b=JrTnrG7M6lQwb/VItie5Fcctc6G7dDy7Nfw52CG+36z3/4ikPtDNFGCwMkPVQx5LGL
         kQa8o6M/6vtljWcvuul7xamwmsLsiICVj9wqopnlssYGBKX+Tv/bVgSlylStIu2Hfbld
         oBOB1ihJec6QwVVqX+ARnZJVWf52v9YVXR8f0Sy+BGwcFYQ2HE+AfzFjsPZzMGAJrgFj
         Cxkv4O/VEk3c5Up7c45tMIdaSLPUBDXYe4bMGwJ5h5mMdkM9KuL+wW2ArpzEYdKh13lg
         N+1fX0Jq2pDKlPWI7sfM0PhE4Lh4dg6f3h3vT7Y+WN1Nf4kb4LwaveYjyheBPEAsItQI
         Cu2g==
X-Forwarded-Encrypted: i=1; AJvYcCUYuXOJtZh5XWjJWRmuisDvZsccMraq9RZbWNGM92OJuy54M/EBqCD62zDfq8U0XN+XUfk3ox9F0yskFoZR@vger.kernel.org
X-Gm-Message-State: AOJu0Yye+O3hCz/a200g4+AtLzOZjjhuUtyBYetiSBXDP38doGHeTwgI
	4u4FLGa3ulbcGVXPDom3EtlnuWqxnMqABa/nCcDXWrE9VWKgZub/SNLathOZyGLJAq/zspzU7ui
	9lk9LgrP6PZKVXS/TQw9RKp1tHMTTpbGLsWrErZJxG+/IK4ivJT/KlMlGUo1xgn/PzSBS
X-Gm-Gg: AeBDietMJMi0nRRWKAqHO8TchSPJCCFyDwj6N55Ihek3/HSvqAHRWbEC+5CLQ6rfDE6
	Jl3qTBqycb5VktosgT8RTr0qyqkv2v1HXo/4Mapw0WUmTZaOUAfc7zl0IXNd3V2yYSXY45Shh+s
	n5uUjw7deI4Ow6cxgolX4hNJG39BZCJoleXlcjHn6ABu36cgoPiLNFg6EtYzJSFJ6lBeeSeBiBc
	OVEIgNpHKQXiA/HtbUmATk/Bplos0P12rW9KUIkmesVP9qHoDyFOwMalGfhHw2BMnMRs5CUyH51
	MsMMj0WNUJKC4OTKBNkeIY/lNFNdPl7n95sicCIosD9ayIjt4KrahNR98HJEJS+knA6QEWccVZF
	6LsP5vl8RCg1Q1tkw8qWmoG7VSpjRu8aHZ0x0eohm4rq5UgPl
X-Received: by 2002:a05:6a00:4398:b0:829:6f9f:ea44 with SMTP id d2e1a72fcca58-82f0c288ae0mr5185108b3a.17.1775846547359;
        Fri, 10 Apr 2026 11:42:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:4398:b0:829:6f9f:ea44 with SMTP id d2e1a72fcca58-82f0c288ae0mr5185083b3a.17.1775846546875;
        Fri, 10 Apr 2026 11:42:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:26 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 06/35] irqchip/qcom-pdc: Use FIELD_GET() to extract bank index and bit position
Date: Sat, 11 Apr 2026 00:10:43 +0530
Message-ID: <20260410184124.1068210-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfXxaT34GPt1p6D
 Q9jBDjvZqnT4zJgvUP4IrCMfmZgfYGYL3c2UJUVHSbaxccvuKNSJO8t7xYU9zWmFea/s5WBHccM
 i+y9hray4Kfd2CHpJT9y5PRujnnjF++QLHMhOuO7zwU2MMQJx5KFfuN6jSLbG1dl40YbwkSOOa3
 t73MyXdHF7UFQ3BL0ywrTjmV2jJ6UyLcq1wX06brG/6Ytq3da7jGu0M12VpKaH4E438yGDQ3mBJ
 ApliBUocBOhOExALNC/Pw5PDwO/vis2qSj2l/xLVe3EWlAdl9dGMrOVYmNiu4TV2Amq0ON2CooZ
 wvEs24IpzDbReK4RvUmSqZCCrNjmWOIzjYN1tUPNKA+5ULPYp3OTdn/dpqpUZZLN/xI5PPtoGXl
 FwSmEPnp0DuHxxW4JmjUd4iBzWwtKgij5K100qWFyOVggpupABQQtm/shOhattO060OOyhZS1EC
 8X5c9FRNlhcYv3LqdBA==
X-Proofpoint-GUID: 8youpAjHd8ksSj8VRBUGQz-AFlMheG2f
X-Proofpoint-ORIG-GUID: 8youpAjHd8ksSj8VRBUGQz-AFlMheG2f
X-Authority-Analysis: v=2.4 cv=Wv8b99fv c=1 sm=1 tr=0 ts=69d94494 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=1nlMVIS8qB_KVi7qAl0A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102720-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 29E283DB8EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IRQ_ENABLE_BANK register is a bank of 32-bit words where each bit
represents one PDC pin. The bank index and bit position within the bank
are encoded in the flat pin number as bits [31:5] and [4:0] respectively.

Replace the open-coded division and modulo with FIELD_GET() and GENMASK()
to make the bit extraction self-documenting and consistent with the
FIELD_PREP() style already used in the PDC_VERSION() macro.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 5e1553334103..638b5d89a141 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -110,8 +110,8 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
 	unsigned long enable;
 	u32 index, mask;
 
-	index = pin_out / 32;
-	mask = pin_out % 32;
+	index = FIELD_GET(GENMASK(31, 5), pin_out);
+	mask = FIELD_GET(GENMASK(4, 0), pin_out);
 
 	enable = pdc_reg_read(IRQ_ENABLE_BANK, index);
 	__assign_bit(mask, &enable, on);
-- 
2.53.0


