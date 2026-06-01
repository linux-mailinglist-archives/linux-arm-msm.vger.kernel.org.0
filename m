Return-Path: <linux-arm-msm+bounces-110673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDyWBVrPHWrHeQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:28:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D3E623F69
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4088A30DBCF1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 18:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CA030C34A;
	Mon,  1 Jun 2026 18:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enDhJY3n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SlmEtrev"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9314C37B028
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 18:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338176; cv=none; b=EHwvzgIr49tTV9jA9vF6AajCDuzmraJEw0uW7WUgK6KfIMxNV/OpQe33/6BtcJRDY6IfYs+PPax1j7GEDJsCAZ4wzk1P77hGRJ7bsNtHT57K/YjaXr1MW0uhStRvBU3sb2Ob+qJGTkrjnKdy/FijMvX9Ge2NaUkVpP3wUJ4iBBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338176; c=relaxed/simple;
	bh=lVc4njKqOhZzn4+GH1LiG7VTyYhJso+ZprzY1j0MwKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uO+1YMKFXdP4R6GL3qgDvKlzC7nyyYIEuOMH3CDiFM7jMekKRecERgsQ1IFKKED0pkntAMFHTMyjLwDml/hiE0EezZ7x1cQGnAXo3w7e80p3X1RVRg12K7Ckys9hbDwjGBGnrfBnzTTk9/2TTxSDNdgGVMq5wHxvb/A4iqlSF6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enDhJY3n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SlmEtrev; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651F8juC1257590
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 18:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kr1A4/6DU9ckTKGgpWrd7fjQD2lYalZrep1+V/xnykI=; b=enDhJY3nHMuwcrb7
	Esng0omk4mP2rjtxJqmAKHOWjhk9pjxDhsOUFtxzrLOXlXGYD8SyKXQtY2knXYTN
	ZyODRmQNOdJvZqWXBcoyX7574Yy6PpMldvY0x3SkQ265TjHqT1xUWbm348CNoq3a
	R6s3TB5p5DETYjS4bJmOSg9eMWB1gtDAmkgOQlPZYoJa2L2QDFV+7K+MpVFnPDZK
	sRpt+lkuLhfZsinfMfE/ECU0A0B0rDwoearCA5BGupHSfI7B4WOMuBsp3+ZMu+GI
	PmjcpJC5GaCuUYsqX8GTJpd22LIQ+u3zpy6Q6fMVbitOofa7Al0n0mmWDuGKYQhf
	rs+J1Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sstf9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 18:22:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d99629fd6so2684010a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338174; x=1780942974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kr1A4/6DU9ckTKGgpWrd7fjQD2lYalZrep1+V/xnykI=;
        b=SlmEtrevp7ph0h6UgvUv5tFRJujjJZemsaIfHBcpASkhg8RD+0K4kV2chwllE9DaAz
         Z2bDE2nhoGFWW5i2gh5WBmRtZtp+vsLVwPyK3GiEN73jgcoFHYWfaUQU9/W1rPDSXdeI
         B9hiWZDcQAMk7OiooTUlmognmpOOGTdUL3BO0apvu9W2Nji2kV4HVeE/7COVFz23lZYx
         uk7TsU+gg9c3D8c5dYw4tGQ/KdZgz5aBIFLiyIydQufDKPCuqUJKdr6N9XNadJbEdN8N
         6Kvi7MCLQDe4IIusiqdRAkuh6Mo0do1Qx41GUWLtGFcUCf4uRVSUhvBZrDuB/g/Mq6lU
         nKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338174; x=1780942974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kr1A4/6DU9ckTKGgpWrd7fjQD2lYalZrep1+V/xnykI=;
        b=ZgG2AvGUji8w0pjukFu/FzULqzqJRehvk0cKQyWi5IIMb1oePHAXPH6SuRCkCogF9g
         WApZq856kVdE7N7IL43OLLrzjeQZHWYdh3qKn2CnMECiX23rCVdnrHUH8HcF2YJCIwaZ
         9k7hFBGqpMALkHMUm4Kn11LgByzcJhB35j/Flm0jmh0aGJ1ecMFLi+odSRoTGPs4Ulw6
         4Ebl6n8dv9X8nykHDjHYD7cOSDEJ6HG0+xtkofiEdUZCKvjXzAF5v6/dmXCDPhn497mM
         /LdGqjmMzgtIY+59mTdCUGNLVGRg2RVchmtoUC3kVv5pmSccqp3CRQ1qj2tPFRnARyn0
         XTvA==
X-Forwarded-Encrypted: i=1; AFNElJ/qeedEjAsle3sRAb2OUI8Tm35wi7/EUW1tPJVn/VautXtvRQ0c59TxZoBpw9i0Jlq358cBi+b+2B2j7mM8@vger.kernel.org
X-Gm-Message-State: AOJu0YxLyeEzmawZujkSSVv+SdxgnjirNiE56qGMrwh8mYeagdPGetUU
	SMiAEtzPmf8kMcQpVRSC3Z1qWyuDeHNJzRp4LzCaShQIk/RrS/2PwclKQ9A9K73fB6JphyO/z5I
	YmS1d4glT+g8bO2qew/5wdHinstDylbqF/14cIqW4V0qiGOAftFnieq4iitRR/fXc3cBU
X-Gm-Gg: Acq92OHKyb/uCoE3UtAsh4OYX4wZuCLGV8RpNwKTtXM1RqmVmDCGcJj7WrSV2oWck+k
	joQdkNXL15f0itIkpXFqoR9wcYUfTRQU29WwCtuYAkHaWpGjJsNNraCRy2UcwfkakmIayJNr/8r
	IXt/kCieRUDrJSnUqCkjUHaaRltMwzbNGFHlvSm6k9Cnrf5UUgCZVslX3EwAmDpXIl7a4Gbv4b4
	ri7xmVGMkayBZYCTLGyye5D6tfabRjBHsE1nFN9WCGW2bHAtf+63+6GlDjEDD3KSQVDJlHvewDf
	cvO5Qs3OX2WlwuKb/rvr3HMTKgouqo6oms48yZ6L+HsyYCksdSoKFC1QSE/FxgcQuNxAwnI0BOT
	ROU/NJwz6obO5uM1968sBcoXc5oeuiyfjEkhz2msCz52Bw0z2fQI+IYDtH8KKrtw=
X-Received: by 2002:a17:90b:2787:b0:36d:ae6a:22f4 with SMTP id 98e67ed59e1d1-36dae6a23fcmr6141449a91.15.1780338174197;
        Mon, 01 Jun 2026 11:22:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2787:b0:36d:ae6a:22f4 with SMTP id 98e67ed59e1d1-36dae6a23fcmr6141419a91.15.1780338173748;
        Mon, 01 Jun 2026 11:22:53 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:53 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:32 +0530
Subject: [PATCH v3 10/12] clk: qcom: gpucc-qcm2290: Update GDSC *wait_val
 values and flags
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-10-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: fI7fpmm_UcINdnoInUHD2nsHDPxK2IrX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfX8E6MMfVCWlNT
 N42GxzHnSM1VriEgKlE9/EMK4xRmf9qbRXYdei2K21TmCFMzf1as8tN0bTQEaBcMw7giigmprfe
 tUGwfyMc31jmqyKUy7mCBFDzi52Bs+Y94kIkT/K7wuO9UuhTTAJBtb21N70azZXsVvkMWMMeLy+
 h2I3o+qSlhmjCJiIv8CXViZ2qr0O1ppiCL0Fp/AW2eNS5SB3ZjY96Ex7M/q5Ayy2lO6+LuH20RK
 KYsx2Z+1c0YTqOh7lQ6gmKV7BejYIltZB+UxDUQi+WsWrsB1SvThOzBFrb3zOTTTV+Lj5tMEDQz
 R3OX2f9ku/VWCJFa8Kk8/ptieEqZ5E2w6Ym4GLl9fSIZSFp9OXCD98JMQCJmL2xGX39jocKE56m
 E7ICqngaV1Uxv74MUqOIh60nYOLz8m/hQ9XpL4oVG4AcHNnQSsBKgK/zaeRDnNLxhJE7Yzhlzwc
 4LTR9jqOuyinpLnEajA==
X-Authority-Analysis: v=2.4 cv=O5wJeh9W c=1 sm=1 tr=0 ts=6a1dcdfe cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=0JU4rCqLU3avs8DDqI0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: fI7fpmm_UcINdnoInUHD2nsHDPxK2IrX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010181
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110673-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 84D3E623F69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the QCM2290 GPUCC GDSC wait_val fields to match the hardware default
values. Incorrect settings can cause the GDSC FSM to stuck, leading to
power on/off failures. And update the GPUCC GDSC flags to retain the
registers, and poll for the CFG GDSCR as applicable.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 2150b94ad0ce5146c47ae21fae4deccdaba20673..6e696cf672923495c789055dcd2ff905d1761e16 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -270,11 +270,14 @@ static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
 static struct gdsc gpu_cx_gdsc = {
 	.gdscr = 0x106c,
 	.gds_hw_ctrl = 0x1540,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_cx_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = RETAIN_FF_ENABLE | VOTABLE,
 };
 
 static struct gdsc gpu_gx_gdsc = {
@@ -282,12 +285,15 @@ static struct gdsc gpu_gx_gdsc = {
 	.clamp_io_ctrl = 0x1508,
 	.resets = (unsigned int []){ GPU_GX_BCR },
 	.reset_count = 1,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_gx_gdsc",
 	},
 	.parent = &gpu_cx_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = CLAMP_IO | AON_RESET | SW_RESET,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | SW_RESET | CLAMP_IO | AON_RESET,
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {

-- 
2.34.1


