Return-Path: <linux-arm-msm+bounces-82194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 345A3C67E03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 581322A3FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 07:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190A72FC870;
	Tue, 18 Nov 2025 07:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="an6YFbn8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dbg06CS9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE7B2FF159
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763450247; cv=none; b=fwN79Y5e8QIMHn0+Aev6d8NX79VAevx/GVootaWekM+eGdBO51p8tdZLiTPknJh1uLP+/jWrYheLxO7CmTXgTbSc2fBA9sCWpKjyXBF5tbdIxnym7O7au79eFR1lDxpeu82ZVM4P0ezHTMEQyWBdGCwjBuzm1DatGZUHZEi6BqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763450247; c=relaxed/simple;
	bh=zRgKFDJUuTq7V355fIIA7jBxUvBfxYi0ycH28juOmKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U694UIuQFxkwss4XP5XEUjGOLnXew0AqByr41vMEnh4UcONKIhXH5HATuZE/pCIdXqrvvaNeCmaREYm5Ag+nVvAZlVYnLqVV2r7yLGU7h6rICVRbAh3TaUMMMsUd1iSAoyYu+1q1U11+hGfCcJhVw6hnYxIrOtQKi64JYL2PsD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=an6YFbn8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dbg06CS9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI4ZBiI3571499
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8dFsUYpLMT7TsFiX0jB1FyVQ1vobEaNkUNDFlttYliA=; b=an6YFbn8vOUhUhIZ
	hDKFiW9nQ28uzIWm7zVk/Vv5EmKHlP41XNvdqnyTs7NQ3e4Fkg1nqvFihehU6/la
	mmmxs/A1bgxu4orjCRNJn9lG3ZJoQ7q3TKa9lLcqfjl3w7WQijJdBLTVTLupclzk
	SxlHbdsQ4UD/54UUxUEbq0O4gx0DmsXX8qGNZ8dNrDGZYyP47EADqJhar6Td57Al
	3oaCVLIuyebxwUYvXbRgSxiJ+RZrJIT1UQx+5bwEyblgggv3f8cST6HBVNcp9zmI
	MEDFWoKrU3jBgTqg+dIK0hh/EdvQIgGtp3uXPdu/YurMy7zmu13vaY7oWND+8feJ
	OI6Zow==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1rbu853-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:17:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2956cdcdc17so62637975ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 23:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763450244; x=1764055044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dFsUYpLMT7TsFiX0jB1FyVQ1vobEaNkUNDFlttYliA=;
        b=Dbg06CS9pAPFDWnVXMR+inK15hqLUJgz7sLSi87mrOxWT+RnbIxfApYCnRPOZfNv+g
         7iSWJ9azJLKftidMkx/bpxuU0cDZn24kPZpNo4BbRjHCeJ3WGRnwiS2NxT8laQxp4tqj
         292AIq3QVMMhVK04mzQV0kGH/4gMcuPM9KuM5v+15QlxCOo0V4TnBfO96C6fh+RlUVkJ
         BNY+4nxfTn3ClwcnHGB7y1k+SeCSP7DEJ+Rw0P0Wa2F53ana9UX8zorn2mGgfEHUq8rf
         gC6+t5vJSrOdQoef6NIxEnxK+snbN9mNdt+Ixodlq3tmr6p0lvNNkzCkrYueo2JYRGB2
         wbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763450244; x=1764055044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8dFsUYpLMT7TsFiX0jB1FyVQ1vobEaNkUNDFlttYliA=;
        b=Hw/eBQFr3iRRoSyKQ5FSoLmRDYeyF8KFAEsM15hsXVDtrdaKZoklyeh6AOrZZHFAKU
         NZ0cwnXoWMh4QRKpbBiHA+KKKfv9/7gQIslEQ8YYwTWqL7bCQbbWT5d16K87uE6cKP6K
         TY5xAYRZQRuXV9Agtg8+XciP2SKdGW3GGVc3OzyXCvM2pZsaETxlkiNaVF6ze7sCeDds
         ExiYFjlnYw/NSDC6AUC3fnixCMh22lW/I4XKqMvXZAtBiNo6L9RxWIG9RX70Ap4dBJ/8
         BD6DLMb2wla1t8aHNqbK/J0CXdyr+Z/z0X/Er3VntleUZ4n9s3B3f4Lil9SrTGK/NGPb
         pdzw==
X-Gm-Message-State: AOJu0Ywc0esVQabWnZgHYEtHidWrp6qYROcOTyKkdgsQY6H70/mnYp+B
	pG6pHhMsUXVh6G2vRdixk5MTfxEyEW4Sgv7GJHUZezkPQvNDJJFkBKUfPvozAhTj9xi51CxsAaE
	SQ6dgBbiHwDFLt3fgceBG5HueOU3Elqy+PU03UTidTqTSvu75HH/eCKza0V5CdgrLpfnL
X-Gm-Gg: ASbGncs8SbBVw9cYVLsILCHjYKho5zp/j4VaWw14ns2mWRvCZnq8DTpgpNDjpcKXx2n
	rDeuFLvyBYxocGCNNh43JOKxCkxd4zug8tDkK7GLuAPziPL69tYMKCWEvSrcCNcHpJVfW6pYULa
	QWNv38wzfZ/RQ9ke/2YQsA2edj8+I+PePiTgIw4iAUW/eWgCRccOHOqylAAEvbRQ0WbEiAFlLlW
	NkVV1OVkkDt50YqElG+odJ4+7CzY0hodMG4kLsPafLyNuwYCI0gDYJyOQ63H2Dkl9WxPVi7qWGq
	hYQBcxRTAVUAei4VYmLxy9j5aBO1LeNHrzhFEtF2PTzFXg+YhJkdK1PZ+aS2+4nAPS7AHQZQsYw
	JzxFWrFMlRJsg2gQf/OQNpX7AbqzevjOspw==
X-Received: by 2002:a17:902:d60d:b0:27d:c542:fe25 with SMTP id d9443c01a7336-2986a7509eamr149564085ad.41.1763450243444;
        Mon, 17 Nov 2025 23:17:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/SLEUe3E6fEfwBF72FyJpUo2FrhhB+u+/DbI/xRe93kPgCkMM5Se+pd8407X3y40jH+kV4w==
X-Received: by 2002:a17:902:d60d:b0:27d:c542:fe25 with SMTP id d9443c01a7336-2986a7509eamr149563765ad.41.1763450242978;
        Mon, 17 Nov 2025 23:17:22 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986a60b116sm129955285ad.79.2025.11.17.23.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:17:22 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 12:47:06 +0530
Subject: [PATCH v4 2/5] clk: qcom: ecpricc-qdu100: Add mem_enable_mask to
 the clock memory branch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251118-sm8750-videocc-v2-v4-2-049882a70c9f@oss.qualcomm.com>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
In-Reply-To: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
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
X-Proofpoint-GUID: F5iz1msv1fUYhkCDK4PEOKEHo5NYCPkd
X-Proofpoint-ORIG-GUID: F5iz1msv1fUYhkCDK4PEOKEHo5NYCPkd
X-Authority-Analysis: v=2.4 cv=FPAWBuos c=1 sm=1 tr=0 ts=691c1d84 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=02cEW-DpipR3T3ESWNEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA1NiBTYWx0ZWRfXxGr312Lqy/58
 3ErNwbwFc3ut5098+sBt43e9c0ffq+y7TweIUnPXR/Mez0og9RO+XAE+AGqzw4mU1Oc+8adszBG
 uraO6P6m4aZnCPZSiAtFtqNAr2boVm6ua72Uhe9GmIJ3EJF420exfi88F+eyFZN/nW+CBKDkMQb
 R8t7Q6xzbSynqSOdmH0IMjb/NrWyoTQJzSxVM+TyNbGijpGiS+e33fdm1Z5/bMKOaKDv0+9KZZj
 YuZBTb6gfP8nUjmQhU4wGaUM8DaiccqWCgd7d0Hhz3PJY+qiRU0Ilo3OG0AKjtow9xoAVsv0bg3
 n2R4ERZ69mID09H9+D2N9Ri18vjO6ZwMlWswoF1gz1yTDNosrq4yJ/qg2jGSaKg/aLYOYXQMJaS
 XPMMSs7/RJH1XbyTTZCozHVNm0DY0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180056

The ECPRI clock controller’s mem_ops clocks used the mem_enable_ack_mask
directly for both setting and polling.
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


