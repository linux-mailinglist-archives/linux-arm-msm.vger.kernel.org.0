Return-Path: <linux-arm-msm+bounces-88371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DC7D0DC07
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 20:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81214309ADB0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 19:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BB52DE6F4;
	Sat, 10 Jan 2026 19:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cM0rv2L7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dY1bRtD2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF87927A465
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073896; cv=none; b=aE0K6mraxFv4j8pkIQnCNXu5YMKm1mgcWhFUZo4qvVmncdrrv+RZ+KtTwiat++Hg1jBJ1SBTjsAu4uTUqI+J1iZGxi9a4Q2RShhtiYDJqX73Uz0NdjwW5l81bgZ76/S+ppkOstJE/Q3Zf84w6ikGZP2K1cKF7mV5CXNyVf4ZbZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073896; c=relaxed/simple;
	bh=yWAITFzIqCVqkhPtfTK3lcYC7LituzgMl9ErY9SPTQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rDuYtMWom/sWH5Uau/ThJ+T49afZd1o0r2eYcD+90aOLIZWAPo0mqmDXZLGNz0IvkmRFLLqQAneJHnl4PmjL1HW4gzsDXhClA3BgQ/FIxVw1nQ/wfjBCbpcWbrUO78WX7VI2bh1FQ9zBOn8HletHb4zzymWUtSeEWj2drLxTBF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cM0rv2L7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dY1bRtD2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60AHmkFK323082
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmMTvh72OFH8FK9hNkeC+EXJs6ndcsPRG+SpIhVihcQ=; b=cM0rv2L7FzHFwqx3
	5xsBMgokLqYubG/twV09VpVAINuUEz+vV6TQr6xCto2pGIxTSRegI5eQQuv5G9U7
	Of26l3Yydm/RRPmVXKgbRK4KDt7k55yv619ls1VxHlqRN9xJhpF6AIJD6jD3TF4A
	waNGPZHS7kh5EDzKH6QjCk4c8JFQpJcb66dx9PwBgSUOQtPww9zyX0sGwbVLps5G
	Rp5WeDxWROxJBUs44Ns7c6Uy8ijIKvqWRBwN9g1UnOFQ1744R2k9hoRfCnIBzTUA
	bR3k3cAkGycdV6UEIdgiiUYy/NsOyVepJsgNcAtxmOzV7olJFkhWMKTch929Ln4L
	TyDgYw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bks258bjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c277fe676eso1587512985a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 11:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768073891; x=1768678691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmMTvh72OFH8FK9hNkeC+EXJs6ndcsPRG+SpIhVihcQ=;
        b=dY1bRtD2HRD6fw0niNkd2iW85nK6po9RArowVs5mxScgWTEcrU9n4yEu9okQbCAQlp
         Gx2bDUWcTuh2ZY28zWHYeVj1W+MnO8ci/pWU7Hk4Jyn+xMfNBzEAtM/Gdo+F+69VJ96u
         HZNokXUiIGbM2xJSC7SIBYNp+zldw/UBRo3kF5XnJucWfBHwAZubIWqVidX3iscIE6Go
         rvd63/4uahVEOHoEjmRZ7PpKm7zWUGoqqWlrSzWe2Clx26rd98kK012IeRY/iD+vP3lN
         D4x3KC6CYIiGGRbYDY4FVvE85kNugoAX28TUfVZB7QyfU98w+p1c8bNeV7+qtgnZqi/M
         jk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768073891; x=1768678691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hmMTvh72OFH8FK9hNkeC+EXJs6ndcsPRG+SpIhVihcQ=;
        b=AkH5a4GhDppF7ff65HqHVVs2BnDVbPNPg8qTXJAzefg3mv8sQTp1hfV8cI2zFN0aiX
         tdhiwH2QdVWYHC2RWkKAAAbQJPz4sD97yl1uCf15qehpmBWKqNs2ZHf5MUm/9S+BbZ1Z
         x7mW/ptTMHdD/E4h9ci/jlI7Wug3dvzLR0HzgcG6KFKUNOKOa9NCf1WZvPg1YvC9gLHQ
         TcqPo4j/xTzuuV8pM/bW1xsveENZdDLKtu0pSrelyXbomHRDHxdq5ldA3LuPNB/PdRoY
         S7MKTJZ4GsByGt2LZbuVaKnzX+aoipQF/faxRouZWEH974iMgg5p3QAstGV0PszYhc8B
         e34g==
X-Forwarded-Encrypted: i=1; AJvYcCV8h0RkHliYTn50JopJ2GHc5YeZnBa0ksrP9FUh4eEYu7damGdYG6EDfC6r66Id3/fZhDlNTlWVZZNDY8Dz@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwvf3lov4NANWdyQLabHJflnLgEesWKxAMT0tHR+48nNVZsEAR
	KSOJiSdlF8AQBRRxvPUkHvi+Rd3IzwK1+zuRgeCuA2BONB9PS4zA4et0n18kiXfFSKoMRsj0XZO
	pqNJqzM+fO2JqA/LmD6JlInWehqLgF1HnS4AJBUEIf+5ynA0rvjYw8m3Rzx2+EeRSyA4m
X-Gm-Gg: AY/fxX7xABaxsuJFCmG+5klCPt3V5L2pkOQM+tGeukTNcwpUTf5AfQ3r1XheVtzqdIP
	hCyT68UMOZnvPogqDSD0Q9AS9mVSK0fdplf3uom4Eo0qsthU0QEHxvZ1nMOaBETb87mpLGIE0Aq
	3MzebEKuLPGCZvVG74UceqxamrehhGa0NcGD5c9S6N0q6qHghJG8fBL2X4YWaNfKlGJSQzNca6M
	wVu3CSHM7plFeWQ959Z3+PArJNvkg2rUqbFSLrsTNVd5qtMb1MYXgw9cozlE+RzVz7W1q/LyuNQ
	cU6WTzm9h6BP/qIQiGWhpEyWBg+afvBYQWWtIiSEe4M31c6GWljjFoXNREeoGEU7JkjNq+mApLs
	m2rfVf10corIVexwEMPHGI3yYHLH/E9f+HkDZOl/oVs6x/vnkZ4wfzrjf/BytAG1bdgp0CP0t6K
	iblalTdsXMQBsFbcagbKt6djk=
X-Received: by 2002:a05:620a:1927:b0:8b2:e666:70d with SMTP id af79cd13be357-8c389408f8amr1840281985a.43.1768073891377;
        Sat, 10 Jan 2026 11:38:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMsd7h31KX1mnTrGNWla1MwkNmRGDFHNZeJ1PT0MjzybGjjVFj5LqvVdzivB0mlUVpjdv3AQ==
X-Received: by 2002:a05:620a:1927:b0:8b2:e666:70d with SMTP id af79cd13be357-8c389408f8amr1840278785a.43.1768073890922;
        Sat, 10 Jan 2026 11:38:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:38:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:38:01 +0200
Subject: [PATCH 09/11] media: iris: drop remnants of UBWC configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-9-dd70494dcd7b@oss.qualcomm.com>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3040;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yWAITFzIqCVqkhPtfTK3lcYC7LituzgMl9ErY9SPTQQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqUdOk1GN3B+fr9J8h//iZ8sbN9u3DK0Nfvd
 3L6vfx/WmOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqlAAKCRCLPIo+Aiko
 1bdCB/9sdjozx6Pz6/pggn/5UdIs4Hv+8ncK4PPaFiKEAwQoEaOogM/Lx9l4rUjddfcxllUL5RU
 7WhCAuVjAfywRtkD0x4KrNS0CZuoi7mamYGUZj/e7ThvKJvczCeGPBSwm9VporfBkQWrH0RNYn4
 XIHOpIv3KtwllwrylmYLkzMzFIRAxiVIQENxYoTBlKK9ez7bQbiA/A/FqqPq24BTWorAtJRm9MW
 7XIvyt37Z0QuSjsFg2LJyY1EAOxwdWXhakhpoW8npwKo3pqGRotjyqgiSqQwYMqAFy9WwFWv/mo
 xfKiM6nLtbrxaE5aW+/NlX1key3GFp8zh2QzYiG0MFKqPNAt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX+OtIC/HuplkN
 DqvMO4A/ysJGoSY4P1qGm7+cxQg0X7gIan8qLUeco1+pndv1AyrHw8O5k5iLTG9BGigJm4Z/wEZ
 J896pcdLX/Vi4kmLU9Rchsv2e7zMGmUHCeWdPxxJlHkreZqNCTDqJ43Sa7+g5/mkqXRh+AHfruw
 hwNF9jFeG2y/v/Mg5LZKgQwdeCQtVTOo+pf+9cM0+9qaGU5zJs+PQFg4CMLC0WCxfri0ev8jdDU
 f+qlQ8zAGFa+OFEBD5uSJuu/zw9kBeMfS5026URiqAEUn331TIVgd6/mURZXb5cayqLXZdJdMdl
 HTCAQubWBX5i2LQk5aXUWuWEdoYSWXh3Mwrb6+mfckB0yAuVBglvKH78Nb3LUGshPhthlkam4Vs
 pV7bbExMH2ZX7+lNTuu9EYkoobdE3LektqgsfhB5Uk9OOf7+NaLnECMMhu/Y5ybCfYDhlIkAPsT
 m5LjzQ1F92Yc1W7KTOw==
X-Proofpoint-GUID: WwnWfGB-M0i4GzqzDWyWRkuWVNS38qtv
X-Proofpoint-ORIG-GUID: WwnWfGB-M0i4GzqzDWyWRkuWVNS38qtv
X-Authority-Analysis: v=2.4 cv=EMELElZC c=1 sm=1 tr=0 ts=6962aaa4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1FtADzHzBfM7Pcki91sA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173

Now as all UBWC configuration bits were migrated to be used or derived
from the global UBWC platform-specific data, drop the unused struct and
field definitions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 4 ----
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 4abaf4615cea..3b0e9e3cfecb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -71,9 +71,6 @@ struct tz_cp_config {
 	u32 cp_nonpixel_size;
 };
 
-struct ubwc_config_data {
-};
-
 struct platform_inst_caps {
 	u32 min_frame_width;
 	u32 max_frame_width;
@@ -218,7 +215,6 @@ struct iris_platform_data {
 	struct tz_cp_config *tz_cp_config_data;
 	u32 core_arch;
 	u32 hw_response_timeout;
-	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index e78cda7e307d..5c4f108c14a2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -631,9 +631,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 	{IRIS_HW_CLK,   "vcodec0_core" },
 };
 
-static struct ubwc_config_data ubwc_config_sm8550 = {
-};
-
 static struct tz_cp_config tz_cp_config_sm8550 = {
 	.cp_start = 0,
 	.cp_size = 0x25800000,
@@ -760,7 +757,6 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -852,7 +848,6 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -934,7 +929,6 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1020,7 +1014,6 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 2,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,

-- 
2.47.3


