Return-Path: <linux-arm-msm+bounces-76912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE8CBD12D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 04:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 966BB3479A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B240D2EE5F5;
	Mon, 13 Oct 2025 02:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gP6kFrnX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35AA2EBBB8
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760321350; cv=none; b=IxZCDC/2Chc4NcMv2lQl+8jj443KhO0HlWM2rM2n1hb34boVD+kgQAsFqhXIyUIoXhRqDH9jUB5ymSAvN8H01x/EYJbsLu8VIluN0sAcQ7jH1jzyhUFRiR/ETltYQaqefEhn0irlXgfcRHaq+RouiGhe8jQ9JXDc8JR0RePVKSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760321350; c=relaxed/simple;
	bh=/XlkIw+30ImRJ1vZ+oZYrGWc5+GeaSVpL8dMGuZakzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cZ7nntotl+RABkK6UHFtyOfKn9cFwL/3EiSQFFo43Pm4qDdll8o8M6IZlAuOy/yNRlZ2VyrYMVflfYUOpIE/OTudHLybU9YxdKZr74CJfTwUjvJidcqgnVtRewcRNl8m+9nakIAIfmYbSxSyO/QXNpbSnjBFSYLZp0tc0DskS9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gP6kFrnX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D0ju9o011635
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUM+cJTKntoj0TSOmVPixlbOh3sBmLzYWf/L9aPHlHQ=; b=gP6kFrnXKYN0RT+d
	iFkIR/mogp5yA4zrWnnHcrsL0cfbsLQ0j1AkOrvk08zbro9HWO31sCs4qf35swkA
	X4HPq8M5OFafrnI9Xtb7jdYYcZi8AHt1QFfg0D7CThcP97F2pNeNDf9UZ9mua5YK
	Uw/fYAITIO5GPJRw+z+wPuXIgj0Epy9VHTxqvJKQqxdy2CtBJYCmHXoocpgnfkGQ
	QmCej3c1yNmil1v68IPaSlP0mtXP264ccpX+vcTHoGMIJEFHMRKfBxcbMrC6KYsG
	SjGMWuz+tSfmQYqfjTms7DXr1tqAMCcNJSVBILv6C30llCanWTBbMy3/ViozYjpI
	3QSSgg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk2wq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:09:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8544316ef6aso24757285a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 19:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760321347; x=1760926147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUM+cJTKntoj0TSOmVPixlbOh3sBmLzYWf/L9aPHlHQ=;
        b=LRbV5mt1gGPVk0bAquZHsry6pJgAg9hW8/DDRbmc3TyvjDbxvAugxLjxL2ZBg3yD1b
         5lw+DNdcfjcnGCaBq02ECO0EwerwBMVtfVhgEcTqxIf/j009r8Xdt+wd+clodsxg0d7J
         JQE61LgzI8Q7arYFHp/c4GAH+pndWa3dM82p30R63A/mn+2wUqtvBXh4iGVFVNwWupkw
         48sooefPTrjDbzO9vYNGxxzuI8fIapRKKjdghgUtd4VbgJMlXA5b8XQYxawH6X+50LlW
         uzLviGk22AvrUpLPrlrZJ2z0QV0ZgRF2Wm+cBFnoVS2y1isQBzuruPokvDmTdS/jrb60
         F9Mg==
X-Forwarded-Encrypted: i=1; AJvYcCV5+GvGmZlQbOQEVBvHwiyYSlicQJPz4ahgCVC5kV42+7JPVKutcWl15no6kClnduStgpOovk1YTBfPy7vr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8glEukRfnYJs5e73fHiMEXYVGcfJXMJIXjaup3s1XRSkxYD6M
	me/VHRr8mbthAXmyW4OE6+VCBlBdhma0JX5NBIVLIArGsdhmVRXOS37a1rDLgzbCgXHgGdvgY2r
	OQconliBJZYRBGWEnxZXQQA0pO68IsADWedRs+Qa6uaWHz2pY5Q370rF75Sf33uvFW3eB
X-Gm-Gg: ASbGnctimDXiP13SCMnK6lVdNwq2/sSDwHmctAqyioiaQZr5HRR2I5pzcULfeegk0G0
	QHniYB0bE7MJsFvRx+pjmtgVRVvcCFDlCv+7Krq8isTRmsRkk9tcoSPhONqkJgnLgorKLk1pjdZ
	g/wlG21dHsGCOKNfd92N0EzgEIm0S1dOe41Sabia4kEYbw06s1aRqrsMG3iszzX7LUrLiNjGMXA
	PspPhxQgddqeRuZfZoHTPO+ytOt6zfAaeqmlmkYuVce0lbO1LfBIiorc4oGXVfSN4Dp/N5ePFaM
	XUiABdjz7NSXIMQ2BIuUc477PBRv68FrcuC4gZqzowfMo11q3ss6rvlln5ueLGQU/HtNAbUqPB6
	Q/Ewydq+TfLcZpXENCZTD9DcbHDqi7ZpdYFX14PbO/3/s5nC6BUML
X-Received: by 2002:a05:620a:471f:b0:815:630d:2cbd with SMTP id af79cd13be357-883525bfc34mr2648056385a.34.1760321346816;
        Sun, 12 Oct 2025 19:09:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHc9zi5G7Np9PMmpTV08gJ5PED9SMZ8Oj12OF4Yfr9cRxtew0QXsK0KpIUqXoJdVs7LGsoCcg==
X-Received: by 2002:a05:620a:471f:b0:815:630d:2cbd with SMTP id af79cd13be357-883525bfc34mr2648054585a.34.1760321346372;
        Sun, 12 Oct 2025 19:09:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4f99sm3563419e87.7.2025.10.12.19.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 19:09:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 05:08:58 +0300
Subject: [PATCH v3 4/8] media: iris: stop encoding PIPE value into fw_caps
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-iris-sc7280-v3-4-f3bceb77a250@oss.qualcomm.com>
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3598;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/XlkIw+30ImRJ1vZ+oZYrGWc5+GeaSVpL8dMGuZakzQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo7F85xROBnEcvVuuG8608RC5WqpC8IFzBcFptO
 Ft0Is5mx0aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOxfOQAKCRCLPIo+Aiko
 1fULB/4420l6VWC4Zg6CIgJOKWiRt+6rwPgw181gT2rS9I00mI+4SMS1vgESudXdlIOsjdTmFBd
 SiX0U8Pi3BLpPEImPVRx226jc5bk6B31gy6NrUCrk9iqLFRLfrfdkZdiIjai7AU5cERAn/d9zye
 xkM8OUnYd6xW5RBX/pXVDai3Q3y3ZIwk0tstijzI4mXBfI/vt+TQ5N0FTFpoBKwRM9Bauv2zwPX
 eI90tbyT8rPuco7UnUtjL9TMPQlwfurKziel4iDWKBy56Wr12EcidfQWhfS82uXd6GUa4YydzKQ
 PxZTeZqs+mIhB2D63bP7jG3NQX+qsfHWP1iblU4aQSfeg1rU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: w1ULufG1MxtrOzrN66RS63UMdEIS1wxm
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ec5f43 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=Fn2TP4Vc3OsuT4lKjqUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: w1ULufG1MxtrOzrN66RS63UMdEIS1wxm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXzixOg8DRItFn
 lVNGe+iRD5w6WaRo38J9//TKmC/v0+FbF9IuBBO2g6Z1/URtsJO+1UGNiSl83l76YdnN/ZpPv/f
 Q2YGqz28Ra8BbIXDkqocw2gjs8Nlz5g40TMSQwE25tVsqOigWroifEnrkljtqnPavOvTR5nk6/U
 P6E22uzb2KGVYzyV9wEktavQ7KLyZjumTHTtKdl/qMv2H2TbTDCxBer4UvYQPayYKMTnBRdGwHz
 L+h55RPvbjOwuARbb/iQkyzBkzBf34SonRbMp7A25vkcJxcja9rJoHj3386dE+EXW7Z4VQL0jAt
 yfHDOFzqAgnk9sziA1jbdX6Q7mMpCOVf8FS6us+PcinbJQfGG3pcuLe5xDQaj0nHjpA9s4ssv1T
 zpIGc8+GKvQVhjyeUzBl/iv8grAgdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

The value of the PIPE property depends on the number of pipes available
on the platform and is frequently the only difference between several
fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
iris_platform_data rather than hardcoding the value into the fw_cap.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c            | 6 +++++-
 drivers/media/platform/qcom/iris/iris_platform_gen2.c    | 4 ++--
 drivers/media/platform/qcom/iris/iris_platform_qcs8300.h | 4 ++--
 drivers/media/platform/qcom/iris/iris_platform_sm8250.c  | 4 ++--
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 0e9adb3982a49cfd7cbe5110cfd5f573f0f7bb38..8db3fa222bdb92a7ffff3dfe62d33f16c0550757 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -318,7 +318,11 @@ void iris_session_init_caps(struct iris_core *core)
 			continue;
 
 		core->inst_fw_caps_dec[cap_id].idx = i;
-		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
+		if (cap_id == PIPE)
+			core->inst_fw_caps_dec[cap_id].value =
+				core->iris_platform_data->num_vpp_pipe;
+		else
+			core->inst_fw_caps_dec[cap_id].value = caps[i].value;
 	}
 
 	caps = core->iris_platform_data->inst_fw_caps_enc;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index b444e816355624bca8248cce9da7adcd7caf6c5b..7ad03a800356ae9fb73bdbd6d09928d0b500cb3c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -161,9 +161,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
 		.cap_id = PIPE,
 		.min = PIPE_1,
-		.max = PIPE_4,
+		/* .max is set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_4,
+		/* .value is set via platform data */
 		.hfi_id = HFI_PROP_PIPE,
 		.set = iris_set_pipe,
 	},
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index 87517361a1cf4b6fe53b8a1483188670df52c7e7..612526a938eed0554fc0da99e12c26d22e04bb6e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -147,9 +147,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
 	{
 		.cap_id = PIPE,
 		.min = PIPE_1,
-		.max = PIPE_2,
+		/* .max is set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_2,
+		/* .value is set via platform data */
 		.hfi_id = HFI_PROP_PIPE,
 		.set = iris_set_pipe,
 	},
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 66a5bdd24d8a0e98b0554a019438bf4caa1dc43c..2b3b8bd00a6096acaae928318d9231847ec89855 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -21,9 +21,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		.min = PIPE_1,
-		.max = PIPE_4,
+		/* .max is set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_4,
+		/* .value is set via platform data */
 		.hfi_id = HFI_PROPERTY_PARAM_WORK_ROUTE,
 		.set = iris_set_pipe,
 	},

-- 
2.47.3


