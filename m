Return-Path: <linux-arm-msm+bounces-105186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OozB2bk8WlZlAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 12:58:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F8249345A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 12:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3969C3114675
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC1D3EFD32;
	Wed, 29 Apr 2026 10:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UrvcUOGk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V1wTXrji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A043EF676
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459943; cv=none; b=Vy76m3KvDYwkRq/mS9Dz29tLmtzUvnbT8mZ/XnEkse8iV/wG14RdDihxN1DWJIjl4kuGhxU6usgTOCw47mtu4g704zesANGyuBKU3TRGQqezSfEaw+jtQcMdkk1N8SuDbgvyKJc9iwY7n9momgtCLjdoxp7+Lk9/sz6qa07OYKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459943; c=relaxed/simple;
	bh=eIn1FjWC3HaiP1usf35UbpRW9XRV5882WUlB5VrqkgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=taJuZQ8DakiNhEkdyLRX7OiM7NieKCsGhYcFex26ipqUGDhvpVobtB54KA91oFWOPY43sXLEJggw1fiwsbeAlFXRxJIs314PwbuotH3mTDLcyd6MDgSTv8/lQZbuFy3jFie0Ic6pmmf/PuPvsgbNh662aoPZWuZEJa4fc5FLd6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UrvcUOGk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V1wTXrji; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qW9o2889782
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oJWKGZzAxn7npDBuubSLXHxTK4AYGqG+FN5bB1wIU8g=; b=UrvcUOGk8sMyfBZJ
	b0VQpGjUhoC8dWfWyDnouNBVuulW0hSHHnOaNWRURETnp6A5LOIMFYLRGoCcjSwx
	IBkSLmBhCCQk2zzkaTw9+W9w1k4l1BByYgLVJ3xTeoBw91J3iKeuT/KAIqaErZ3i
	Fj66eAf4y2uyXi7YXcnCKY+51etO40Ob8K9nlHHRnEa+a9QyAgBXqKKkHS+aXO8j
	7i59OPTvmGvOqGV2Zzsv5csmgngjOLHeeUbAN50lwsHknO/jRsBoMWm1zBOpATnM
	d6IKQ1AMbuqzlCTUVUT/Mxy4SuKpqeSnml05WOIuSRqnfenvxnrk/viq/GGW4cvu
	fcFmZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqbj7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:52:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so114165085ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 03:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777459941; x=1778064741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJWKGZzAxn7npDBuubSLXHxTK4AYGqG+FN5bB1wIU8g=;
        b=V1wTXrjiy3Aa3QETXNlTNbgLTjiIvdudfEVLlKvVc2Evs1mPgkPLdsQK6QZXRhCHMs
         Eyy8nrD2RFZiuXcaWAwsOP2LCy4Fg2AGWN5GRQSSEoXJMTqOUrWBNvpP5b6mXwZ8t2xk
         INyaoQH/5MpW5YmQWYpm5gSG/6tr4fnC/SNqMf1UF48Iimy4llI3ymCJsVv7Yp/QzbJZ
         L/+k7u+hJN1FxCxePtyiLLr1b2Ej65HhtzVj47DUbTwuQ66IkEGTZb2i7XhbLAL3QlaP
         TFPUZ4k5Spm/Xc75RiN07vh+g8jx3zsRvcyrZXzWjQypAB620+k9htWqngq1DxDLiLYP
         XsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777459941; x=1778064741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oJWKGZzAxn7npDBuubSLXHxTK4AYGqG+FN5bB1wIU8g=;
        b=a8X08VhqoGYnwnXbG0AwZZuqxsvJ7wbHJ+yANnm/N8e16VWwi4KTQ8Q0JjNI/JtAyr
         lpJBzXZ2m+xyASAsmigxuMHwbNiS45P9dYaY7GD/pOiU2640Ac5/CSK80sVYUoq06PQA
         emnJNGGftOUs7i0rbo+CK7fn53ZcagJ12ly1LGyc4r+r/HolNaL4VZMpR3q/5QOWArLS
         oyj2qcRz74SElKqpO9sllXGcFCa0f6K3qfEQgm9oWC5OCLA1Bkv019LeCPqjc3maJAtc
         H55YY4qE9sMqzXHD/gj53rphzfYdMz/0kISSHnulzwCBs1g64CiP4/ggS4xBN7mDfkBJ
         v6zQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0HFOsIqdsUXkpD8PHH1n58PVwmSi9ToLG9LsOfFMDuc9u/B37WVra9f0OGUA+y0Lw7ahHKxzwUXbodHZt@vger.kernel.org
X-Gm-Message-State: AOJu0YzM6hkyDjpVdby5OId21anCn6sQK/aRRxmYjBq/MZi2/wIj0xos
	+DxtjQUxxU2oyGJZMWtEocfvo0ZcyzUx42vvW4vY+JnyHcXuBYq+RmhXRDu16aEK7CENmzB0hEx
	lM3ydpm/bz9IoiF12vUwP56RQned5W5gPaC/JjcQZDqVSfgF40WVuPWGfMmhFufLHh9Q1
X-Gm-Gg: AeBDies6DPPV8vRJMCehTVDefeNi+OVs9/sfHnYv6u73owNtazHLPFlYs1SxoZleJ7V
	i2RPOJ2SFbX2L/DAvkvx5mksAcvxcucgophJ99A/GOlqxpP04P9v5/JuKqdquMeszu49fDIKi9R
	ejkapCY06KIPhF+iuJRWh214AyXq++WvZi2MrSbhoR+65KKXqaBT4oWAQGE1Ohj4qjmNiaLke5q
	VruDUVzXXUq4I8D/rA7gK+I5l/jo4UPcuhyU9Aq2ld8gQUJ6nRxLJqtcBGOw7y0xZb5LpaXVOM1
	lUHEX8xvqgeh+Mx6E8Wv2j28CHAjeH8wO/SCydpVZwVWAKZMO9AiM1kPAvDXtIaREjxFynBorvR
	4ytKQGKMcoi+9Zqk9pV+WSTGwqyUvHYyTXX5cBGGsuD3qJakBugzhespsEaDCtuU=
X-Received: by 2002:a17:903:b86:b0:2ae:6092:8d93 with SMTP id d9443c01a7336-2b97c499278mr68782475ad.28.1777459940855;
        Wed, 29 Apr 2026 03:52:20 -0700 (PDT)
X-Received: by 2002:a17:903:b86:b0:2ae:6092:8d93 with SMTP id d9443c01a7336-2b97c499278mr68782135ad.28.1777459940373;
        Wed, 29 Apr 2026 03:52:20 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988772e9csm18316715ad.9.2026.04.29.03.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:52:20 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 16:21:51 +0530
Subject: [PATCH 3/5] clk: qcom: smd-rpm: Add support for RPM clocks on
 Qualcomm Shikra SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-shikra-gcc-rpmcc-clks-v1-3-c3cd77558b7a@oss.qualcomm.com>
References: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
In-Reply-To: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 2_63PuqDsfr1KJFj4utAu9BIkaLBS2z8
X-Proofpoint-ORIG-GUID: 2_63PuqDsfr1KJFj4utAu9BIkaLBS2z8
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f1e2e5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=L5rjUTd7AGozPMB3QYUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwOSBTYWx0ZWRfX6ZpupORB7Pwj
 IZB1hVmfDJ8mhCA34kNoCzXEPHuErkpBMPtqp6OJS3wOotP4XiwRlaeMSvM8LunKBKLjofVXkFs
 0KWMe2+rhd2zGtH4ghb2PaqNefn+7S5DN/PUXnm4DNPcwMjuVgtgas8NUIkpk7+s1FlpusFfTVa
 K6GJzT656GKDZj2vRDP0GU2Y0l5KzWp4DqlasZaBFAOmOi0Ej++pAHcrvwIoHQqyMbGj4hbqwm4
 Z4ZuV02dFfRQymSWFEo+iwN8ZLh3SlKoX5t+k5PgCshdA4f/+FFuotb1OBPdW4gcUkNzt98nj9N
 sEkjVpIcymfHF0Fx05Xgi6DKHzgudOsymj+RSg7+46Oj5WE4PNyxSH/TNwcOtF0MNAztMXxMHnz
 9o6/KdeIG+rM7zApf5C4tbYcVwsES4zOqDVAHNpGu+Zpxa/5GA7YZJ5Wd3gdp64U5sDVBjinXWm
 0tYyqQL8e9r5wpTra0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290109
X-Rspamd-Queue-Id: B8F8249345A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105186-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add support for RPM-managed clocks on Qualcomm Shikra SoC. The icc_clks
list is same as QCM2290, hence reuse the same for Shikra.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-smd-rpm.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 103db984a40b950bd33fba668a292be46af6326e..d0d19bf0616efd5f1bc2caa037ff36d830a3495c 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1289,6 +1289,44 @@ static const struct rpm_smd_clk_desc rpm_clk_qcm2290 = {
 	.num_icc_clks = ARRAY_SIZE(qcm2290_icc_clks)
 };
 
+static struct clk_smd_rpm *shikra_clks[] = {
+	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
+	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_branch_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
+	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
+	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_rf_clk2_a,
+	[RPM_SMD_RF_CLK3] = &clk_smd_rpm_38m4_rf_clk3,
+	[RPM_SMD_RF_CLK3_A] = &clk_smd_rpm_38m4_rf_clk3_a,
+	[RPM_SMD_IPA_CLK] = &clk_smd_rpm_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &clk_smd_rpm_ipa_a_clk,
+	[RPM_SMD_SNOC_PERIPH_CLK] = &clk_smd_rpm_bus_0_snoc_periph_clk,
+	[RPM_SMD_SNOC_PERIPH_A_CLK] = &clk_smd_rpm_bus_0_snoc_periph_a_clk,
+	[RPM_SMD_SNOC_LPASS_CLK] = &clk_smd_rpm_bus_5_snoc_lpass_clk,
+	[RPM_SMD_SNOC_LPASS_A_CLK] = &clk_smd_rpm_bus_5_snoc_lpass_a_clk,
+	[RPM_SMD_CE1_CLK] = &clk_smd_rpm_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &clk_smd_rpm_ce1_a_clk,
+	[RPM_SMD_QPIC_CLK] = &clk_smd_rpm_qpic_clk,
+	[RPM_SMD_QPIC_CLK_A] = &clk_smd_rpm_qpic_a_clk,
+	[RPM_SMD_HWKM_CLK] = &clk_smd_rpm_hwkm_clk,
+	[RPM_SMD_HWKM_A_CLK] = &clk_smd_rpm_hwkm_a_clk,
+	[RPM_SMD_PKA_CLK] = &clk_smd_rpm_pka_clk,
+	[RPM_SMD_PKA_A_CLK] = &clk_smd_rpm_pka_a_clk,
+	[RPM_SMD_BIMC_GPU_CLK] = &clk_smd_rpm_bimc_gpu_clk,
+	[RPM_SMD_BIMC_GPU_A_CLK] = &clk_smd_rpm_bimc_gpu_a_clk,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_shikra = {
+	.clks = shikra_clks,
+	.num_clks = ARRAY_SIZE(shikra_clks),
+	.icc_clks = qcm2290_icc_clks,
+	.num_icc_clks = ARRAY_SIZE(qcm2290_icc_clks)
+};
+
 static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-mdm9607", .data = &rpm_clk_mdm9607 },
 	{ .compatible = "qcom,rpmcc-msm8226", .data = &rpm_clk_msm8974 },
@@ -1309,6 +1347,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-qcs404",  .data = &rpm_clk_qcs404  },
 	{ .compatible = "qcom,rpmcc-sdm429",  .data = &rpm_clk_sdm429  },
 	{ .compatible = "qcom,rpmcc-sdm660",  .data = &rpm_clk_sdm660  },
+	{ .compatible = "qcom,rpmcc-shikra",  .data = &rpm_clk_shikra  },
 	{ .compatible = "qcom,rpmcc-sm6115",  .data = &rpm_clk_sm6115  },
 	{ .compatible = "qcom,rpmcc-sm6125",  .data = &rpm_clk_sm6125  },
 	{ .compatible = "qcom,rpmcc-sm6375",  .data = &rpm_clk_sm6375  },

-- 
2.34.1


