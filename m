Return-Path: <linux-arm-msm+bounces-78668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 695C0C04556
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 06:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B44204F563C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 04:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1368028A72B;
	Fri, 24 Oct 2025 04:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VDyxrD/k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A28288C3D
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 04:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761279887; cv=none; b=RMqSF23rIRRKUiwn6vgoTQFC+lhYS+XmNYwrEmV4FBVtjh8JlmRVgXyKt7eJUCCvcB3iywxJc+fJHwt7kFvpehYwDiBiYy9YK+87hSAJJZnIZ5/EjZdONrQNDJ54sox3cjA8rtsqUHNUDm3+rxh2FvR4qL8hiq1uIQ5O5z0GSlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761279887; c=relaxed/simple;
	bh=q1zNPpbPYWl8i8nB9vHp0/I2P8lqD1fLeEkyHobNBFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y6mitHYa6kccPRF1rgelKrKVUdUw2QUWS6L2po3hfiP0lAgiyhaIqc3ilGs52Oh+mOK9zvrAiUYBhH04Y86b0vAhqKq2oddI0vS8Upbrp7mw2c+RPyhrRVSorXNYVp/a48niZGDqkcmPZc7cvUd7C2CLxnUX5dfR/Za/5NPzW1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VDyxrD/k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FPDv003409
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 04:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IKaH1U9CFsqzQ564a4PPEXgGEodmv8byZ6U+CXUHG4M=; b=VDyxrD/kMs/fJVT1
	YUzNfreFbrpuWzLl+fC2fkfD7TRvc0PUB/t9ft5sFq4WXLRGg73WbSRgWK053NHi
	/8s9JhUNW+sbebJDgEDyDjJMekTgSH2G3REUyMpUhLL6n5qqgpxf6CSISI1iilKg
	Z9wdMKeQy62VCcPqdAzHZSgVMvEfSgRqxoOTySg9IQxNsv+SsuOQX5q7WGOR1V1M
	Nqqt/6OXe2/6nreyalfIkT7I78Ktp1JuGIVhKBWN4t1htvwJjq5EIO5AJCAc4BgS
	CpaAL2SfLm0ZmAeUMmKxO/KsJr28lUnwN0d+EkGGQLXtB8rQ4r3zhvpm4ybwZ7Ry
	CFYE6g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27janwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 04:24:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b62b7af4fddso987688a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 21:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761279882; x=1761884682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKaH1U9CFsqzQ564a4PPEXgGEodmv8byZ6U+CXUHG4M=;
        b=WJMVN3OvBIffk0rP/lPpReNUq/8nfCXdNJ3eLn0yD4FyjBduyHiOFnrqB0OLSxfrVX
         3wX/Gjrokdoaa5OR2YoTnKQJ/kwasX4pJQdt3SD4hhNLnMlKOfe242Te3Kdq0e9uh13w
         v+5ZhKPicjchYo8aLbsMZ19p8d7K/y0Gx686dGH4gO+7iIeHElHtzdgeilp05t7A+A4O
         FwsFV6RJZzRgf2kiPLlGzkF6rrU3pI7GCS/pfbEBzae7KoWqd9OTrm/OD4ENJOfiXsnS
         aKrnK1w9tM/6HOQvJGnhA/GEQjDVezVHwtMGXPQDlHJw/+iZV6awqtqdIO4iBJRbgZy3
         ttWQ==
X-Gm-Message-State: AOJu0Ywk5CVe5pZSrlOcuXTwyDcRHoAuFuifFLjJR+MEjg2NJb8/JAK/
	MCUO2kpgNZ/+s+z4GLBk2icyJhWF1fqOXDJj5gX4E28BTGu4lNdJEKFtUSBbk8vRBgW4G2jU/d3
	s78rO8WPyceRFS9dL6dm975eYIhGJAI9VAayATRvwTpo4ZRlaElNC98QWJ8Uee8tpvtXM
X-Gm-Gg: ASbGncvcSXuoo/XB54UtzuSQYKmW6toZUyu9lOyfgk8iGCT+RfayE2WsIaljsewlhFN
	7NIQUf6Id9qnyUSJ2ReD+a5mkZfJmOzHobzyl/o6bFkySARHPKTQBy4Mdr5tqPFCZ8glyfJIQpd
	sN/67E0aABzLxyThKtetgvJpMoi8Wy/9+Fw0BaMXq7Dt6W9BvFaiS9KQ+I4ex/RDpew2APACb1h
	/JRQfAtucWaMarCVYMOGkT1L25kFMJVBnKULoI0UAFtOjMqETx8f+TaLU1tA9EUuoiOuWug8w0y
	rXaN4DpFtW7XKleUvxghhWq3S8bctlf4Ck5na84PQQylJTYaAmnMg8mdQ5euxaQ8aV9KqQoZHcU
	JfOJXVWlRPXjBqTdxX0rAN9M=
X-Received: by 2002:a17:902:c942:b0:293:623:3241 with SMTP id d9443c01a7336-293062336a1mr108197025ad.58.1761279881935;
        Thu, 23 Oct 2025 21:24:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1riNMFIcwIFmzhJ6jOazcTXihD/RIxAL6oNUPoK+MbnVob4/j9u9k2RmZMS6OkEv9bRNV5Q==
X-Received: by 2002:a17:902:c942:b0:293:623:3241 with SMTP id d9443c01a7336-293062336a1mr108196735ad.58.1761279881411;
        Thu, 23 Oct 2025 21:24:41 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dfd0576sm40259805ad.67.2025.10.23.21.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 21:24:41 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 09:54:23 +0530
Subject: [PATCH v3 2/4] clk: qcom: ecpricc-qdu100: Add mem_enable_mask to
 the clock memory branch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-sm8750-videocc-v2-v3-2-6286bbda3c8e@oss.qualcomm.com>
References: <20251024-sm8750-videocc-v2-v3-0-6286bbda3c8e@oss.qualcomm.com>
In-Reply-To: <20251024-sm8750-videocc-v2-v3-0-6286bbda3c8e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX7m9thmCZHFit
 hTwQce54kLJSx9ZIs6fVgCWmReZxEkeYpm1RMqOkMMvhuxrpHzQzkCjSFaxJlFsXrJiakO9iQ67
 etF6kXAR3MKJgbqlTrXBUJflUexvA/FJo1QptgeyDcS2DfasA5BeLmLRqS2nVD8c7d9eu3I/L8B
 2kfgTUKVSHC4xvfyo/VR4uQujz+CY5Snbk0aUOJDuKG70EhleZQaHAz0Ri3tk2BYsGj8fzQaFEI
 vl8TqttC4hRWFi4iUixmEOKhN4YyQE4doF3Ms9DZYMcYqiYFlpdM8MmfvLVxR1/MEzDB040qv8F
 7mKW/xaYmYWPHVm1U4w+1RzyWHPZCMpoV49oaAtzvKgXr0ckv+XmCedJPA6qcTl2pdz3DB6nmZ1
 5Blc0CryTmI/ThHLmOeKHEQ3ObJZHg==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68faff8b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NS9l2Nidr_7M3kv-azwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: F3f7tu1xtKPD2YG_bqeTxmF0Zc9ZcYhB
X-Proofpoint-ORIG-GUID: F3f7tu1xtKPD2YG_bqeTxmF0Zc9ZcYhB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

Add the newly introduced 'mem_enable_mask' to the memory control branch
clocks of ECPRI clock controller to align to the new mem_ops handling.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/ecpricc-qdu1000.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/clk/qcom/ecpricc-qdu1000.c b/drivers/clk/qcom/ecpricc-qdu1000.c
index dbc11260479b6d25d52a7d00cfce78d4e35be224..c2a16616ed64508355a3d54557295cef24dfdf2f 100644
--- a/drivers/clk/qcom/ecpricc-qdu1000.c
+++ b/drivers/clk/qcom/ecpricc-qdu1000.c
@@ -920,6 +920,7 @@ static struct clk_branch ecpri_cc_eth_100g_c2c1_udp_fifo_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_c2c_0_hm_ff_0_clk = {
 	.mem_enable_reg = 0x8410,
 	.mem_ack_reg = 0x8424,
+	.mem_enable_mask = BIT(0),
 	.mem_enable_ack_mask = BIT(0),
 	.branch = {
 		.halt_reg = 0x80b4,
@@ -943,6 +944,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_c2c_0_hm_ff_0_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_c2c_0_hm_ff_1_clk = {
 	.mem_enable_reg = 0x8410,
 	.mem_ack_reg = 0x8424,
+	.mem_enable_mask = BIT(1),
 	.mem_enable_ack_mask = BIT(1),
 	.branch = {
 		.halt_reg = 0x80bc,
@@ -966,6 +968,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_c2c_0_hm_ff_1_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_c2c_hm_macsec_clk = {
 	.mem_enable_reg = 0x8410,
 	.mem_ack_reg = 0x8424,
+	.mem_enable_mask = BIT(4),
 	.mem_enable_ack_mask = BIT(4),
 	.branch = {
 		.halt_reg = 0x80ac,
@@ -989,6 +992,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_c2c_hm_macsec_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_dbg_c2c_hm_ff_0_clk = {
 	.mem_enable_reg = 0x8414,
 	.mem_ack_reg = 0x8428,
+	.mem_enable_mask = BIT(0),
 	.mem_enable_ack_mask = BIT(0),
 	.branch = {
 		.halt_reg = 0x80d8,
@@ -1012,6 +1016,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_dbg_c2c_hm_ff_0_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_dbg_c2c_hm_ff_1_clk = {
 	.mem_enable_reg = 0x8414,
 	.mem_ack_reg = 0x8428,
+	.mem_enable_mask = BIT(1),
 	.mem_enable_ack_mask = BIT(1),
 	.branch = {
 		.halt_reg = 0x80e0,
@@ -1053,6 +1058,7 @@ static struct clk_branch ecpri_cc_eth_100g_dbg_c2c_udp_fifo_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_0_hm_ff_0_clk = {
 	.mem_enable_reg = 0x8404,
 	.mem_ack_reg = 0x8418,
+	.mem_enable_mask = BIT(0),
 	.mem_enable_ack_mask = BIT(0),
 	.branch = {
 		.halt_reg = 0x800c,
@@ -1076,6 +1082,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_0_hm_ff_0_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_0_hm_ff_1_clk = {
 	.mem_enable_reg = 0x8404,
 	.mem_ack_reg = 0x8418,
+	.mem_enable_mask = BIT(1),
 	.mem_enable_ack_mask = BIT(1),
 	.branch = {
 		.halt_reg = 0x8014,
@@ -1099,6 +1106,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_0_hm_ff_1_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_0_hm_ff_2_clk = {
 	.mem_enable_reg = 0x8404,
 	.mem_ack_reg = 0x8418,
+	.mem_enable_mask = BIT(2),
 	.mem_enable_ack_mask = BIT(2),
 	.branch = {
 		.halt_reg = 0x801c,
@@ -1122,6 +1130,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_0_hm_ff_2_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_0_hm_ff_3_clk = {
 	.mem_enable_reg = 0x8404,
 	.mem_ack_reg = 0x8418,
+	.mem_enable_mask = BIT(3),
 	.mem_enable_ack_mask = BIT(3),
 	.branch = {
 		.halt_reg = 0x8024,
@@ -1163,6 +1172,7 @@ static struct clk_branch ecpri_cc_eth_100g_fh_0_udp_fifo_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_1_hm_ff_0_clk = {
 	.mem_enable_reg = 0x8408,
 	.mem_ack_reg = 0x841c,
+	.mem_enable_mask = BIT(0),
 	.mem_enable_ack_mask = BIT(0),
 	.branch = {
 		.halt_reg = 0x8044,
@@ -1186,6 +1196,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_1_hm_ff_0_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_1_hm_ff_1_clk = {
 	.mem_enable_reg = 0x8408,
 	.mem_ack_reg = 0x841c,
+	.mem_enable_mask = BIT(1),
 	.mem_enable_ack_mask = BIT(1),
 	.branch = {
 		.halt_reg = 0x804c,
@@ -1209,6 +1220,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_1_hm_ff_1_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_1_hm_ff_2_clk = {
 	.mem_enable_reg = 0x8408,
 	.mem_ack_reg = 0x841c,
+	.mem_enable_mask = BIT(2),
 	.mem_enable_ack_mask = BIT(2),
 	.branch = {
 		.halt_reg = 0x8054,
@@ -1232,6 +1244,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_1_hm_ff_2_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_1_hm_ff_3_clk = {
 	.mem_enable_reg = 0x8408,
 	.mem_ack_reg = 0x841c,
+	.mem_enable_mask = BIT(3),
 	.mem_enable_ack_mask = BIT(3),
 	.branch = {
 		.halt_reg = 0x805c,
@@ -1273,6 +1286,7 @@ static struct clk_branch ecpri_cc_eth_100g_fh_1_udp_fifo_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_2_hm_ff_0_clk = {
 	.mem_enable_reg = 0x840c,
 	.mem_ack_reg = 0x8420,
+	.mem_enable_mask = BIT(0),
 	.mem_enable_ack_mask = BIT(0),
 	.branch = {
 		.halt_reg = 0x807c,
@@ -1296,6 +1310,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_2_hm_ff_0_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_2_hm_ff_1_clk = {
 	.mem_enable_reg = 0x840c,
 	.mem_ack_reg = 0x8420,
+	.mem_enable_mask = BIT(1),
 	.mem_enable_ack_mask = BIT(1),
 	.branch = {
 		.halt_reg = 0x8084,
@@ -1319,6 +1334,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_2_hm_ff_1_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_2_hm_ff_2_clk = {
 	.mem_enable_reg = 0x840c,
 	.mem_ack_reg = 0x8420,
+	.mem_enable_mask = BIT(2),
 	.mem_enable_ack_mask = BIT(2),
 	.branch = {
 		.halt_reg = 0x808c,
@@ -1342,6 +1358,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_2_hm_ff_2_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_2_hm_ff_3_clk = {
 	.mem_enable_reg = 0x840c,
 	.mem_ack_reg = 0x8420,
+	.mem_enable_mask = BIT(3),
 	.mem_enable_ack_mask = BIT(3),
 	.branch = {
 		.halt_reg = 0x8094,
@@ -1383,6 +1400,7 @@ static struct clk_branch ecpri_cc_eth_100g_fh_2_udp_fifo_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_macsec_0_clk = {
 	.mem_enable_reg = 0x8404,
 	.mem_ack_reg = 0x8418,
+	.mem_enable_mask = BIT(4),
 	.mem_enable_ack_mask = BIT(4),
 	.branch = {
 		.halt_reg = 0x8004,
@@ -1406,6 +1424,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_macsec_0_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_macsec_1_clk = {
 	.mem_enable_reg = 0x8408,
 	.mem_ack_reg = 0x841c,
+	.mem_enable_mask = BIT(4),
 	.mem_enable_ack_mask = BIT(4),
 	.branch = {
 		.halt_reg = 0x803c,
@@ -1429,6 +1448,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_macsec_1_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_macsec_2_clk = {
 	.mem_enable_reg = 0x840c,
 	.mem_ack_reg = 0x8420,
+	.mem_enable_mask = BIT(4),
 	.mem_enable_ack_mask = BIT(4),
 	.branch = {
 		.halt_reg = 0x8074,
@@ -1452,6 +1472,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_macsec_2_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_mac_c2c_hm_ref_clk = {
 	.mem_enable_reg = 0x8410,
 	.mem_ack_reg = 0x8424,
+	.mem_enable_mask = BIT(5),
 	.mem_enable_ack_mask = BIT(5),
 	.branch = {
 		.halt_reg = 0x80c4,
@@ -1475,6 +1496,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_mac_c2c_hm_ref_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_mac_dbg_c2c_hm_ref_clk = {
 	.mem_enable_reg = 0x8414,
 	.mem_ack_reg = 0x8428,
+	.mem_enable_mask = BIT(5),
 	.mem_enable_ack_mask = BIT(5),
 	.branch = {
 		.halt_reg = 0x80e8,
@@ -1498,6 +1520,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_mac_dbg_c2c_hm_ref_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_mac_fh0_hm_ref_clk = {
 	.mem_enable_reg = 0x8404,
 	.mem_ack_reg = 0x8418,
+	.mem_enable_mask = BIT(5),
 	.mem_enable_ack_mask = BIT(5),
 	.branch = {
 		.halt_reg = 0x802c,
@@ -1521,6 +1544,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_mac_fh0_hm_ref_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_mac_fh1_hm_ref_clk = {
 	.mem_enable_reg = 0x8408,
 	.mem_ack_reg = 0x841c,
+	.mem_enable_mask = BIT(5),
 	.mem_enable_ack_mask = BIT(5),
 	.branch = {
 		.halt_reg = 0x8064,
@@ -1544,6 +1568,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_mac_fh1_hm_ref_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_mac_fh2_hm_ref_clk = {
 	.mem_enable_reg = 0x840c,
 	.mem_ack_reg = 0x8420,
+	.mem_enable_mask = BIT(5),
 	.mem_enable_ack_mask = BIT(5),
 	.branch = {
 		.halt_reg = 0x809c,
@@ -1603,6 +1628,7 @@ static struct clk_branch ecpri_cc_eth_dbg_noc_axi_clk = {
 static struct clk_mem_branch ecpri_cc_eth_phy_0_ock_sram_clk = {
 	.mem_enable_reg = 0x8404,
 	.mem_ack_reg = 0x8418,
+	.mem_enable_mask = BIT(6),
 	.mem_enable_ack_mask = BIT(6),
 	.branch = {
 		.halt_reg = 0xd140,
@@ -1621,6 +1647,7 @@ static struct clk_mem_branch ecpri_cc_eth_phy_0_ock_sram_clk = {
 static struct clk_mem_branch ecpri_cc_eth_phy_1_ock_sram_clk = {
 	.mem_enable_reg = 0x8408,
 	.mem_ack_reg = 0x841C,
+	.mem_enable_mask = BIT(6),
 	.mem_enable_ack_mask = BIT(6),
 	.branch = {
 		.halt_reg = 0xd148,
@@ -1639,6 +1666,7 @@ static struct clk_mem_branch ecpri_cc_eth_phy_1_ock_sram_clk = {
 static struct clk_mem_branch ecpri_cc_eth_phy_2_ock_sram_clk = {
 	.mem_enable_reg = 0x840c,
 	.mem_ack_reg = 0x8420,
+	.mem_enable_mask = BIT(6),
 	.mem_enable_ack_mask = BIT(6),
 	.branch = {
 		.halt_reg = 0xd150,
@@ -1657,6 +1685,7 @@ static struct clk_mem_branch ecpri_cc_eth_phy_2_ock_sram_clk = {
 static struct clk_mem_branch ecpri_cc_eth_phy_3_ock_sram_clk = {
 	.mem_enable_reg = 0x8410,
 	.mem_ack_reg = 0x8424,
+	.mem_enable_mask = BIT(6),
 	.mem_enable_ack_mask = BIT(6),
 	.branch = {
 		.halt_reg = 0xd158,
@@ -1675,6 +1704,7 @@ static struct clk_mem_branch ecpri_cc_eth_phy_3_ock_sram_clk = {
 static struct clk_mem_branch ecpri_cc_eth_phy_4_ock_sram_clk = {
 	.mem_enable_reg = 0x8414,
 	.mem_ack_reg = 0x8428,
+	.mem_enable_mask = BIT(6),
 	.mem_enable_ack_mask = BIT(6),
 	.branch = {
 		.halt_reg = 0xd160,

-- 
2.34.1


