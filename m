Return-Path: <linux-arm-msm+bounces-107851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD7OAy8EB2okqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:31:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C94DA54E80F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F02C4305D7EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B479480946;
	Fri, 15 May 2026 11:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g47OT226";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M9PVOsGf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7392480958
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844276; cv=none; b=mPp6PweAgU4O+wsDfkFutynq/No9nkgjQxhlw0/9kJswiWpE67j4yL6B1U25/Dd9WSpOnhbNqCGivS3WfAkLEfhZ8xnKF8pymA7tCV5SOKruGGfsPxVuOBz2dvjtrYRDWbFZd65owWs50/FN2+zyK8psHjXKz277qPTgZKXMPJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844276; c=relaxed/simple;
	bh=zszHRrVQved9TEjgnC/9obAGZk+o5ba6DgZk+Fq7GGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i9dc0+iLM7kusbD3mS+KopUVv9QTlvGCqJeJQ24oVgDeWcXq6yiHU3fCmhpVTjQQLiTHN9c3vuVm9AcFb1u6fj6e/ykNXyMEZKn+zeV5g9GLFfaSHXbnEG7BS3yYFnU5J7v3LhY3unK8SYEvwn3vZVZGfRFpULpi3UKuLhi8LlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g47OT226; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M9PVOsGf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAbCwl3512973
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P7m/a9W9ZC7sp/pAB71Rgbe0RJu0eb2BVEITxHflea0=; b=g47OT226ReBmEbKW
	Cym1GSQM8AzIQkI+3Gw4WSd1nv+EOVWgCQvmkl2QSr57GqT2SRENyhJ8UBGjkHtn
	YU3emzzOV8idIjMXrOjJU01OxSeFRVmgEw7mbWVujwmCFFXFQTotDD+E+MTo4RBm
	ez2A4cqI42afStal3jNEeIicvkZtfCIr0edgQOqW8tjuN5P7BfehKhEi6TrZTH6m
	M9EX21GnXe2mYgLDGbD4WNhsYpDLoLNz1SFcYjfp05xlH9RXVljRwAOBw17KdwMO
	Y43Mxjl/pRJb3MFGD9ArfGYH8lknJGi1aBVMmvf8vZksjjpY9Py7+ImspHoWOGhN
	PrIUuA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vb1cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:24:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365d4d2fa04so8688245a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844271; x=1779449071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7m/a9W9ZC7sp/pAB71Rgbe0RJu0eb2BVEITxHflea0=;
        b=M9PVOsGfDXhCbmc5YvkudxdrNEryV+mmF+DBGh2gNNS2CsB/gnZ9ZJpb3xRLC0g/ka
         cfoDNns2ib1pPLfjNFnkQDNdrK1cLs/3CWUbg1Gg5/snrr1f6Szn5LRoJ/ciJL0Q2dFb
         A6BIp6N0AmHw6h8m16PiInxaWDS7wWV2laTNOlTYnT41CDj8HCN+x7HOmKdHX1jhe3iQ
         jREUSp2a9WSaNyr6N3r84hL2Gal8YHjZSniHtS4Oz6oIk0o7M5Gs3W2V2phFyAA3t2xM
         TIZtMXGKDKtzhy5dmb4dai4rfRQSdTDRJDiE5jtuy5UGnglJFp24lHd7L1YL0QJM6xVF
         0mgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844271; x=1779449071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P7m/a9W9ZC7sp/pAB71Rgbe0RJu0eb2BVEITxHflea0=;
        b=H9Xq6PjceN00msYR+Hf0A8XcEfdcgYmkXPlH6yhPVnU/i/f+yNfVHGmlUSWVgWkZ0o
         NDh+Lju3vknQtlyKj5C/gSzhzseGu+W8g499ON/utGiIaRcdvoeM65wdPZM4ng177M9f
         R6Co4TbpZdZFBmZpxDbIGmNkDYRSTcsnJ9yp4r1e8IYzYaJsU0pQ55pBjLyjbeNrzx0Y
         3RycGtOsPbnEkyZGFAJAvQEom77UuWpBL8yTRBb7xSuCMQPM9HdoFiiBLNxL8D/DKeyH
         ga1YCQJ/hVsHKJx+KFGVg5+F66F40XEXo+B9Ybxm2eE1ey0ba2+QkJicyuKnldWwem/z
         N/sQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5P7HpVozkoZW/w/MIAyxEWEadKbUqHnorOp6kTzXaabFEwAR3AxGpR+GWuoNX9VLc9cA6+HMfsPrZcxlh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5DOrxIyjCn8BAzZDktJIaJlRL60UcgktJsgeN+mRQK3XmPGeH
	yXQok7vSiMTN/uHQJ9oSK9SSIQIxQr/ji24mMeHu5OJUoEDcK4UQoCKw9IAad1FUq88OJ8r+1t8
	yiJjVZg/rxyZoU13ZkIRYC61LkS1uO5jW8goepWPg/yZUQFobMgjQS6cu4Z06KL2xGrPS
X-Gm-Gg: Acq92OFYX6iRx5r3xBV0RCX1OJmOVsaDMI6qJdemiLeLqdJshuIfzERq97Rw0HbZ/tJ
	fQl4Q1tXpqz1mrr+fKQsHwcBlxi2kds+tSh4yoXaq9z3H1TWbbYJ1Lufq/we4+SDLXRREqOHoKg
	Rag3lWWltdmYVVz7hoRQDw4wFbdCe01DfFQe6XSk8mwo9dgPvwGKZdjxXk057aOUbvy0lI4uvMe
	oVBJFqSNkFr1Xocp651JfeH5y9iyk0OJS5GsaVn5xCdHso7ZAs483yVciGuYBtKdl/RG0MDMoI+
	UUn8tvvxXUx9InHbXkj/Tl0LBsl/yF+jn3EajMxJuG/t+BXbBj5lg4dYgu0TUZalA5S2uq24u6i
	mS5OOJqqQkDr1X9NGK9qqZqZPaPiO8JFX3utAYoPUs3AFBwBwhRmS7SQ=
X-Received: by 2002:a17:90b:2549:b0:366:4782:1389 with SMTP id 98e67ed59e1d1-36951b8208dmr3490940a91.14.1778844270894;
        Fri, 15 May 2026 04:24:30 -0700 (PDT)
X-Received: by 2002:a17:90b:2549:b0:366:4782:1389 with SMTP id 98e67ed59e1d1-36951b8208dmr3490900a91.14.1778844270304;
        Fri, 15 May 2026 04:24:30 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2476249a91.7.2026.05.15.04.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:24:29 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:51:25 +0530
Subject: [PATCH v6 10/14] media: iris: Add power sequence for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-glymur-v6-10-f6a99cb43a24@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
In-Reply-To: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844197; l=10275;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=zszHRrVQved9TEjgnC/9obAGZk+o5ba6DgZk+Fq7GGA=;
 b=ZNvHPaRIS7dTJBI2L6wKjq58j3bNk3OrbBHceclJvEtSozd3y/FOwQMGxJsmR6tiH5B1UV30w
 oDRyp0dxolqA4lNhKT19CKhs7hVwrfbav4CxDiN/kAT4BJmOJQYrre6
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX1MSKd0QYHeNv
 +GpYMK1NEez5fvoTwVy8CR8vxlP/tLs5B5vBgyXw7fFE7UclrEihHg2mHfIx9Ovi3B/o5Xhwehv
 0cMvCTYtsyZhnZdduPiEDb1qCmCpuF6u9L0igvU6/Cd+ax0Mwyp3xeR3GHTyZeBAkGQENlWdTYY
 tTL8LG5lDca1iOPRmFi8cy4wcYtl+hh1zP4MQpX8PQmDGa6VTHUEDlCTtKjG0K99b9R+ZNTE3kC
 ID7eguVu5DRfT5TVxQfF2f7++oRTO4SkccGhKY0r8W/T2+/xjDAg5tWxcF+TtL9hrlreFd/icen
 XPlxX1pOYgZfP/MXL7yqlybHgkvVY3uUNpSl7PQHqll88xlnkL6tEuxtlIwjdKwxMIudoAd93R+
 xnsm4yzJDC5VTqW0MoT1uyfSnYzbbcWvggbe8xZo7Dtj5P5Oh2W/0FTcBAqWBog+Wul3DA3oEbp
 c2VS7t/HvI7geNDGLYA==
X-Proofpoint-GUID: PSMTfNLoogrjN5XEpUhKBIX477P92vP0
X-Proofpoint-ORIG-GUID: PSMTfNLoogrjN5XEpUhKBIX477P92vP0
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a070270 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Lnm5EmowVMQMBrtSgN0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115
X-Rspamd-Queue-Id: C94DA54E80F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107851-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Glymur platform has two video codec cores: vcodec0 and vcodec1.

Both cores share a common clock source (video_cc_mvs0_clk_src) and the
same power rails. The clock dividers between the source and the branch
clocks are fixed. So when both cores are running, the source clock always
runs at the highest frequency requested by either core.

Since both cores share the same power rails, the power corner cannot be
voted independently. Scaling one core's power corner up or down would
directly affect the other, leading to under or over-voting.

For these reasons, both cores should voted the clock and power rail must
be based on the workload of both cores.

Reuse the existing code wherever possible and add power sequence for
vcodec1.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 137 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
 4 files changed, 147 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 1d757cb8e9e1..366e499dec53 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -63,6 +63,9 @@ enum platform_clk_type {
 	IRIS_VCODEC_VPP0_CLK,
 	IRIS_VCODEC_VPP1_CLK,
 	IRIS_APV_HW_CLK,
+	IRIS_AXI_VCODEC1_CLK,
+	IRIS_VCODEC1_CLK,
+	IRIS_VCODEC1_FREERUN_CLK,
 };
 
 struct platform_clk_data {
@@ -208,6 +211,7 @@ enum platform_pm_domain_type {
 	IRIS_VCODEC_VPP0_POWER_DOMAIN,
 	IRIS_VCODEC_VPP1_POWER_DOMAIN,
 	IRIS_APV_HW_POWER_DOMAIN,
+	IRIS_VCODEC1_POWER_DOMAIN,
 };
 
 struct iris_firmware_data {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 39e9c78c3a69..68a4997af23f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -17,14 +17,14 @@
 #define NOC_HALT				BIT(0)
 #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
 
-static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
+static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core, u32 pwr_status_bit)
 {
 	u32 value, pwr_status;
 
 	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
-	pwr_status = value & BIT(1);
+	pwr_status = value & pwr_status_bit;
 
-	return pwr_status ? false : true;
+	return !pwr_status;
 }
 
 static void iris_vpu3_power_off_hardware(struct iris_core *core)
@@ -32,7 +32,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
 	u32 reg_val = 0, value, i;
 	int ret;
 
-	if (iris_vpu3x_hw_power_collapsed(core))
+	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
 		goto disable_power;
 
 	dev_err(core->dev, "video hw is power on\n");
@@ -78,7 +78,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
 	u32 count = 0;
 	int ret;
 
-	if (iris_vpu3x_hw_power_collapsed(core))
+	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
 		goto disable_power;
 
 	dev_err(core->dev, "video hw is power on\n");
@@ -254,6 +254,124 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
 	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 }
 
+static int iris_vpu36_power_on_hw1(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_VCODEC1_CLK);
+	if (ret)
+		goto err_disable_hw1_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_VCODEC1_FREERUN_CLK);
+	if (ret)
+		goto err_disable_axi1_clk;
+
+	ret = iris_prepare_enable_clock(core, IRIS_VCODEC1_CLK);
+	if (ret)
+		goto err_disable_hw1_free_clk;
+
+	return 0;
+
+err_disable_hw1_free_clk:
+	iris_disable_unprepare_clock(core, IRIS_VCODEC1_FREERUN_CLK);
+err_disable_axi1_clk:
+	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC1_CLK);
+err_disable_hw1_power:
+	iris_disable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
+
+	return ret;
+}
+
+static int iris_vpu36_power_on_hw(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_vpu35_power_on_hw(core);
+	if (ret)
+		return ret;
+
+	ret = iris_vpu36_power_on_hw1(core);
+	if (ret)
+		goto err_power_off_hw;
+
+	return 0;
+
+err_power_off_hw:
+	iris_vpu35_power_off_hw(core);
+
+	return ret;
+}
+
+static void iris_vpu36_power_off_hw1(struct iris_core *core)
+{
+	u32 value, i;
+	int ret;
+
+	if (iris_vpu3x_hw_power_collapsed(core, VCODEC1_POWER_STATUS))
+		goto disable_power;
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+	if (value)
+		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
+		ret = readl_poll_timeout(core->reg_base + VCODEC1_SS_IDLE_STATUSN + 4 * i,
+					 value, value & DMA_NOC_IDLE, 2000, 20000);
+		if (ret)
+			goto disable_power;
+	}
+
+	writel(REQ_VCODEC1_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
+				 value, value & NOC_LPI_VCODEC1_STATUS_DONE, 2000, 20000);
+	if (ret)
+		goto disable_power;
+
+	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
+	writel(VCODEC1_BRIDGE_SW_RESET | VCODEC1_BRIDGE_HW_RESET_DISABLE, core->reg_base +
+	       CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(VCODEC1_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+
+disable_power:
+	iris_genpd_set_hwmode(core, IRIS_VCODEC1_POWER_DOMAIN, false);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC1_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC1_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC1_CLK);
+	iris_disable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
+}
+
+static void iris_vpu36_power_off_hw(struct iris_core *core)
+{
+	iris_vpu35_power_off_hw(core);
+	iris_vpu36_power_off_hw1(core);
+}
+
+static int iris_vpu36_set_hwmode(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, true);
+	if (ret)
+		return ret;
+
+	ret = iris_genpd_set_hwmode(core, IRIS_VCODEC1_POWER_DOMAIN, true);
+	if (ret)
+		goto error_disable_vcodec_hwmode;
+
+	return 0;
+
+error_disable_vcodec_hwmode:
+	iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, false);
+
+	return ret;
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -281,3 +399,12 @@ const struct vpu_ops iris_vpu35_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 };
+
+const struct vpu_ops iris_vpu36_ops = {
+	.power_off_hw = iris_vpu36_power_off_hw,
+	.power_on_hw = iris_vpu36_power_on_hw,
+	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
+	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
+	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+	.set_hwmode = iris_vpu36_set_hwmode,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..63bf0cec58e2 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -12,6 +12,7 @@ extern const struct vpu_ops iris_vpu2_ops;
 extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
+extern const struct vpu_ops iris_vpu36_ops;
 extern const struct vpu_ops iris_vpu4x_ops;
 
 struct vpu_ops {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 72168b9ffa73..e67d98b8c91e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -7,6 +7,7 @@
 #define __IRIS_VPU_REGISTER_DEFINES_H__
 
 #define VCODEC_BASE_OFFS			0x00000000
+#define VCODEC1_BASE_OFFS			0x00040000
 #define AON_MVP_NOC_RESET			0x0001F000
 #define CPU_BASE_OFFS				0x000A0000
 #define WRAPPER_BASE_OFFS			0x000B0000
@@ -14,6 +15,8 @@
 #define AON_BASE_OFFS				0x000E0000
 
 #define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
+#define VCODEC1_SS_IDLE_STATUSN			(VCODEC1_BASE_OFFS + 0x70)
+#define DMA_NOC_IDLE				BIT(22)
 
 #define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
 #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
@@ -35,6 +38,8 @@
 #define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
 #define CORE_BRIDGE_SW_RESET			BIT(0)
 #define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
+#define VCODEC1_BRIDGE_SW_RESET			BIT(2)
+#define VCODEC1_BRIDGE_HW_RESET_DISABLE		BIT(3)
 
 #define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
 #define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
@@ -52,14 +57,19 @@
 #define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
 #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
 #define REQ_POWER_DOWN_PREP			BIT(0)
+#define REQ_VCODEC1_POWER_DOWN_PREP		BIT(1)
 
 #define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
 #define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
 #define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
 #define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */
+#define NOC_LPI_VCODEC1_STATUS_DONE		BIT(8)
 
 #define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
 #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
+#define VCODEC0_POWER_STATUS			BIT(1)
+#define VCODEC1_POWER_STATUS			BIT(4)
+
 #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
 #define CORE_CLK_RUN				0x0
 

-- 
2.34.1


