Return-Path: <linux-arm-msm+bounces-90557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCEJA2xed2n8eQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:30:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EAB88408
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5A7830234C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 12:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A3C337B89;
	Mon, 26 Jan 2026 12:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mIeZswn1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pjq2xaGl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07215336EC0
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769430435; cv=none; b=mFr0OPA1ZwHvxgC6JQHMPcGz1dCJXuR2PoSvTLcsR9YhJWouJd13r2CgVhudGsrjIbgIfQuaPAsM/hTtUPHv/TUAvBUCHSnA8fzqPp9VvLa2mz719a2dttAsVy7wP/c7ROVoSw2qutjyVO5/SMrQvxngWxcM1t7j8g0O93iEFg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769430435; c=relaxed/simple;
	bh=QymC8z3UUtOylpthd2ikOcBCZz2Wy95X6t+kiN2oOTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UvvQeIu0Os4YCaMglHySuc0H3nuVlCkg3cANIVYiVtA8iBs+IZVwwnt9UFugl+8n1nlEM+VLQcUQRNZH6+FGQMBpCp++8OFY1a87efBIAODro0UmnFae1aYjFeK3I3D+BK2SM1Fpa5ysvu//uyBGCbX8M/O9zH1/ejL98ivpWDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mIeZswn1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pjq2xaGl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q8dw6o354539
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7L0eNHSIsEFa+dYyA9xV66YYL732g8MYKYkvB2DFeM=; b=mIeZswn1kADUvkGU
	pV470Ndb/loStmqFymW1UCTI6c6FtqVKfGlGs6y2JsdkUK3YKiw7YPyp9CPDQXAY
	omI8VdEXIr2Dj6ZBcW8koxwleePzWMc+JHvJJ/I2Cdnwbrnsn7valWmANNfncU3g
	2marsg3pyrpJN6Kai9cP7CJOXKTiyT4cLPOvrLYNshGXSMi6urEWVRD/zKjnS1yU
	JBdhL7u95Lb9BH5Hxe2l717oCmm+2KZvKNlwClnZBy2A+BKeZb6+FKMXTpQsdbYi
	uutZJ9PDLGY5A+2vmUrk8abdG2ypZ1nqYkrELG/hl4vcg4dMCATc+nk5GAri/3e1
	CbTcjg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9qmfyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:27:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f8c209cfbso2260460b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 04:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769430431; x=1770035231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7L0eNHSIsEFa+dYyA9xV66YYL732g8MYKYkvB2DFeM=;
        b=Pjq2xaGlapb1tSQ/quq1LU0Dpuu0++wQ0EiJBYvzzN5K5nP9VT53azQf4kdfDpXh+I
         4W1YOs2hMPC9veY/0Da9bEoHdyu4Q5GTGi7pwX+hUaJqTh8nqPNTL818gr9K3S7v+BIr
         lmFWxz2TDq+rNCUzAz0BGb/c7usJmTbGHs0iwBR1R8aJMCWCzDhahRsatKvJgA+Mw4MR
         N8lFGhXaINIsMy18NMUI5LOOjErftYQ/oHe1/mViVit5EKI9euM2wkRzsfIFsJumrGjD
         Bkcb/bU80wbT8LcJTig+D/pQpmZX8n4JBWJngKq0881x5KRH6QM7xSF8Nq06KsFu0rT2
         9mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769430431; x=1770035231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o7L0eNHSIsEFa+dYyA9xV66YYL732g8MYKYkvB2DFeM=;
        b=p/MF33U/K5ZEMG1enGSA/a7vuEHaU+8UHppQj1yY9GGxD5Mb+0X1NshO0LWuarhzH3
         vaFoD9bFgE+4GnT2B47W6+5efEC7Xh7e5e3g0kyVCNcy249mAVz0TeEp8CqmFrE1PqGH
         jIN1RnF4KcWtjxkNqv57WZPqFFDwpLie7mb9WUsGxafWLsOA2Z6FUECKlylFa2gQ9t+r
         J97zb+rVLyhJvDTYvFFkA5ZLt8Wixe4qos0DV5JzE2CYyiLkJLnCoOIJZF6nzrdDEy2I
         hrKh+RSmN0S+HFNRTJ2eEwf2L3MMsIwxE32ERysEXRWYBHId8z48a7UFuHK4wz5aNIGb
         6wgQ==
X-Gm-Message-State: AOJu0YxMqQvMoByO58YsQC62t//qod4wYFmtcTWJpHSRXbd8O/fkbmbT
	zinSVg59fbV3zov/riMvAGEJFM6i1r8UNDIiYOTENvuJngZjExEHzWunDhC8825bOiivJzib77j
	2QeS6mEP3Y+JRSezS/qihrA/VI9KY+nm4YaeKEEAFNb0MT8Ach1A9+XkvvOYOpB2/JuD3
X-Gm-Gg: AZuq6aJIiAtPQNSeWXKSGzC3JK5U3rdQ3ypF6bCGxWJUhXufHKcqgcGCT5TD2mUcYsT
	1CzjHXrzTpktBS2i3Ffa0kQ5bkEiIYxZ/6v6pSQOq9BnYsQvx6E1+jBAmfCGJnBHG5yTRqthBap
	ybYeM0zmvGrz8ncd/A7yD9vlQSM6/jK6W8l4BOL1uonudJzdS8HwkifU/RXDRafmVyoaIWZpqXQ
	QtvwmMd31ugQrWKDmXZpiSlvA2JMeFReylCD5x5I/lCiBTPtPJWXhBdHOOZgdqrhj6Xwxw5K9TS
	5a50n3EaV3Flxu61U4a5Fae/5NC4sfhXgEUnaIbu0ZUz++4qEbuaDR2irRPe4sZkd8aJeFS+6Fl
	jeXIJCduIW0T7RmwpFAjEt56pVLh82EYOrag0K9jbjXiE
X-Received: by 2002:a05:6a00:1d95:b0:823:1511:530e with SMTP id d2e1a72fcca58-8234120bbbemr3307956b3a.25.1769430430646;
        Mon, 26 Jan 2026 04:27:10 -0800 (PST)
X-Received: by 2002:a05:6a00:1d95:b0:823:1511:530e with SMTP id d2e1a72fcca58-8234120bbbemr3307939b3a.25.1769430430136;
        Mon, 26 Jan 2026 04:27:10 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6366644379sm6076022a12.33.2026.01.26.04.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 04:27:09 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 17:55:50 +0530
Subject: [PATCH 7/7] media: iris: Add platform data for kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-kaanapali-iris-v1-7-e2646246bfc1@oss.qualcomm.com>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
In-Reply-To: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769430381; l=9062;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=QymC8z3UUtOylpthd2ikOcBCZz2Wy95X6t+kiN2oOTc=;
 b=P+2J2X/fydNpWqThBOpgshiwuYul6LgcRPJUt8+h87BsIb8AnLoHYLPSaDMFSF/T5TOCJ6KEx
 QqqnIMP8cldAuSRFNX8gA73XqhHILw6LtdENiP3RUcYE4AKSEeJP7x5
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: IujJi7swoNEnHzhdBdrflxgGP_SnYzl9
X-Proofpoint-GUID: IujJi7swoNEnHzhdBdrflxgGP_SnYzl9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEwNSBTYWx0ZWRfX+uAHNwJp+pSz
 cI7N43HGi49UamPi9ypt5C0PWdkvtV9+hd1CLHzbErjrOgl+BwOQ8AAA5qnUP9/12z70GfM5+ex
 SdsMSGsKtgaMr/dKVuBLKSL/l9o02Vsopdl545HErTivuiMfQR5VC3J67RSbVHoDcD3OZTumeu7
 MmiIhVw6FwLJd+Ctp+KYq2zjUstsTFG+idK7boUY5u98weqF9h6BIiX78p9Bq8LrwEj3LpjlKN0
 ++wwvbnKT2wMFXzEhx1QNoFSkgjeUQ+krQv+FXBWemiM8LgHW8ujIUMEZrOJH7bS2Ln6lvNNZoq
 VGbawK6UkhFktjd3YYnUB6rY49KFtzNWfD0f8h5eFU4wAKlDHMOFx/r31/WmmG3CGb609ZsDmpC
 XVZQbu3RcrgAAhhJyR/fsAjfc87HZgTu+VdmpKlXMLU2iHzZoJyNCUimE/oICFcBqjecW8zlD5h
 +4NUyGPEWAaZy3BnR8g==
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=69775d9f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=oUDkSdWbjXKg0EQNC7QA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90557-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76EAB88408
X-Rspamd-Action: no action

Add support for the kaanapali platform by re-using the SM8550
definitions and using the vpu4 ops.
Move the configurations that differs in a per-SoC platform
header, that will contain SoC specific data.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 90 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_kaanapali.h   | 80 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
 4 files changed, 175 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index d2d7c898fc8ef0de1b16aebd72681ea3c5b736ae..3f047bd495413494b9afbf6f4d12a8e06a9ac07a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -41,6 +41,7 @@ enum pipe_type {
 	PIPE_4 = 4,
 };
 
+extern const struct iris_platform_data kaanapali_data;
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
 extern const struct iris_platform_data sm8250_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..cefbe72b1475cb83281d01ef3828f095293e098f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -12,6 +12,7 @@
 #include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
+#include "iris_platform_kaanapali.h"
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
@@ -921,6 +922,95 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
+const struct iris_platform_data kaanapali_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
+	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu4x_buf_size,
+	.vpu_ops = &iris_vpu4x_ops,
+	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = kaanapali_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(kaanapali_clk_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
+	.pmdomain_tbl = kaanapali_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(kaanapali_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = kaanapali_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(kaanapali_clk_table),
+	.opp_clk_tbl = kaanapali_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffe00000 - 1,
+	.fwname = "qcom/vpu/vpu40_p2_s7.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
+	.tz_cp_config_data = tz_cp_config_kaanapali,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_kaanapali),
+	.cb_data = kaanapali_cb_data,
+	.cb_data_size = ARRAY_SIZE(kaanapali_cb_data),
+	.core_arch = VIDEO_ARCH_LX,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.ubwc_config = &ubwc_config_sm8550,
+	.num_vpp_pipe = 2,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((8192 * 4352) / 256) * 60,
+	.dec_input_config_params_default =
+		sm8550_vdec_input_config_params_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
+	.dec_input_config_params_hevc =
+		sm8550_vdec_input_config_param_hevc,
+	.dec_input_config_params_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
+	.dec_input_config_params_vp9 =
+		sm8550_vdec_input_config_param_vp9,
+	.dec_input_config_params_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
+	.dec_output_config_params =
+		sm8550_vdec_output_config_params,
+	.dec_output_config_params_size =
+		ARRAY_SIZE(sm8550_vdec_output_config_params),
+
+	.enc_input_config_params =
+		sm8550_venc_input_config_params,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8550_venc_input_config_params),
+	.enc_output_config_params =
+		sm8550_venc_output_config_params,
+	.enc_output_config_params_size =
+		ARRAY_SIZE(sm8550_venc_output_config_params),
+
+	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
+	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
+	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
+	.dec_output_prop_avc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
+	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
+	.dec_output_prop_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
+	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
+	.dec_output_prop_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
+
+	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+
+	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
+	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
+};
+
 const struct iris_platform_data sm8550_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h
new file mode 100644
index 0000000000000000000000000000000000000000..d472e21fdac4c764169a3a8c35d175db29b06b5b
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_PLATFORM_KAANAPALI_H__
+#define __IRIS_PLATFORM_KAANAPALI_H__
+
+#define VIDEO_REGION_VM0_SECURE_NP_ID		1
+#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
+
+static const char *const kaanapali_clk_reset_table[] = {
+	"bus0",
+	"bus1",
+	"core",
+	"vcodec0_core",
+};
+
+static const char *const kaanapali_pmdomain_table[] = {
+	"venus",
+	"vcodec0",
+	"vpp0",
+	"vpp1",
+	"apv",
+};
+
+static const struct platform_clk_data kaanapali_clk_table[] = {
+	{ IRIS_AXI_CLK, "iface" },
+	{ IRIS_CTRL_CLK, "core" },
+	{ IRIS_HW_CLK, "vcodec0_core" },
+	{ IRIS_AXI1_CLK, "iface1" },
+	{ IRIS_CTRL_FREERUN_CLK, "core_freerun" },
+	{ IRIS_HW_FREERUN_CLK, "vcodec0_core_freerun" },
+	{ IRIS_BSE_HW_CLK, "vcodec_bse" },
+	{ IRIS_VPP0_HW_CLK, "vcodec_vpp0" },
+	{ IRIS_VPP1_HW_CLK, "vcodec_vpp1" },
+	{ IRIS_APV_HW_CLK, "vcodec_apv" },
+};
+
+static const char *const kaanapali_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec_apv",
+	"vcodec_bse",
+	"core",
+	NULL,
+};
+
+static struct tz_cp_config tz_cp_config_kaanapali[] = {
+	{
+		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x01000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x25800000,
+		.cp_nonpixel_size = 0xda400000,
+	},
+};
+
+static struct iris_context_bank kaanapali_cb_data[] = {
+	{
+		.dev = NULL,
+		.name = "iris_cb_non_pixel",
+		.f_id = IRIS_CB_NON_SECURE_NON_PIXEL,
+		.region = IRIS_NON_SECURE_NON_PIXEL | IRIS_NON_SECURE_BITSTREAM,
+		.dma_mask = 0xffe00000 - 1,
+	},
+	{
+		.dev = NULL,
+		.name = "iris_cb_pixel",
+		.f_id = IRIS_CB_NON_SECURE_PIXEL,
+		.region = IRIS_NON_SECURE_PIXEL,
+		.dma_mask = 0xffe00000 - 1,
+	},
+};
+
+#endif /* __IRIS_PLATFORM_KAANAPALI_H__ */
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index c1a6aac5a3d65d980c5a34ba5fa1c1dbcf790ec5..9cc55f5e7be1701a14eedd06453ddb0b59844ffa 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -395,6 +395,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,kaanapali-iris",
+		.data = &kaanapali_data,
+	},
 	{
 		.compatible = "qcom,qcs8300-iris",
 		.data = &qcs8300_data,

-- 
2.34.1


