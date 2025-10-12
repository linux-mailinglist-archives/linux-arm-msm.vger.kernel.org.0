Return-Path: <linux-arm-msm+bounces-76857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3FFBD079D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 18:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D23174EF813
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 16:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825042F1FD7;
	Sun, 12 Oct 2025 16:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cee6ndNl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A3F2ECD1B
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 16:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760286241; cv=none; b=OZLh83N+li2yJDBSFyiPmHk/RZ4K6sedPI6QhakT+mw8PY5hyWRZ6zdfEOImwwF/k8Q46FiADbf1BmSDxX4PdGOLZjWJRM8SpYa0y3WcYNK05se3rdpt92TCe8Dgca5cjfNjOUF3MzUg/xbKXYYWFOfXL59G0T7T7PVJVNZ1WIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760286241; c=relaxed/simple;
	bh=/XlkIw+30ImRJ1vZ+oZYrGWc5+GeaSVpL8dMGuZakzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y32gn0hv/vMFEonxo6ZFX/fbcPYIP/dGW4HUMlptMraRKnZ5NvMGbaXc7cHSDRhE+SmB+ea2R00NvN89oMed5UmjCivjM0r+SDC/BrGZrR4sgBsdPIePyaK/anzjQIRYqiTMgbJdqcWrSI86HCF8mwhYlE1j7Qhv8LPNRkHurQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cee6ndNl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CBtanq016334
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 16:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUM+cJTKntoj0TSOmVPixlbOh3sBmLzYWf/L9aPHlHQ=; b=Cee6ndNlbE46aEUx
	COuCekN0tGIOIJlxm2t81ICnn5phyZOWfuYbh3sXi/lssTFF27qEjbWBXJQVZoqi
	kJrz37IQqGhFqv6XjBIARjE0ZQdWRc7Il6H9g9vSUN0I2GvQoMhZxyNsyiadmzT4
	Th2BfmHQH4CiJZLaruThBkturxxCZ7DgjEY4YzZAUeNsVKCVgckf7apXLre2z9GM
	ys2xjUuKUJa2mJJJLpMIfm8JroFC0x8/PvpQyrGuxcJVFVtTAMobwIYkOr213mhi
	0qrX+5Nz/rDMhoUavCLrZsWBlCUw9mZs91U/cc/ZUy7zqZogs3Y4gzT+sH2zybd7
	ge4Gwg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfert972-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 16:23:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-85641d6f913so2220429585a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 09:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760286222; x=1760891022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUM+cJTKntoj0TSOmVPixlbOh3sBmLzYWf/L9aPHlHQ=;
        b=tsLkiQkNAST5lbm7c2G/SgHbebWwyuXXszcgfZ03jH/e1ssKTUzn5gIGdoMcg4k/GD
         cHeQ19EmndwXQsdBUKbFkGmDgQtvfZrobYSWdcgqLk3wNOEe7yGKvi2nUOKbvtwGYUex
         8Y2aTQelXvuIgHRy4YP7H3hACcLKFbubCOOcoQ69zDQ6nFHKBLBrAOkwFCpItBS4nMhi
         ntQ4/NZG9NqMjChyHAmzcD35xsjARomFq/XKu1T8sn7I/s4LjexR24iLWhLr/n67DJ+U
         9b9G+iavPQA8Ht+2OKywNW27+6UH+pemX5hvH8kdrqxJSHnmqhTpA91nE/jIqiZqfybA
         /X+g==
X-Forwarded-Encrypted: i=1; AJvYcCVjV9LprgITRqjSO4QAgZOt8rBopdEUUvI36U3G50fvHz3QidTbyxAiAFcYpcmuDpWa+PjTL0AeIse52FiG@vger.kernel.org
X-Gm-Message-State: AOJu0YyoIQb47h1+8T0rX6FRNaDTll1fucT5ol6YC70owrtovOizm2Yi
	tKkZsMB+i8ysb7aA+DlK1SdjFzmoyJh+LUKxcFHDtf3nwDoISiT/f8fi32j/tjOMxk6TS8eupzM
	ljX+OrIKdi/g1VYz+qnu9vayLcVJTSKpV4H73I5pA6PD73N5ncmr/Vwj/JOC5rFEo4Gqfc7aXtl
	8M
X-Gm-Gg: ASbGncvXBvNqf9SLABsiLPRvaODGZ0dWlEB6VkZuF06V92Qx4r4rAig6nwFIkuO3ZuP
	nJb8kb/VriWO16sbfGj7MnjCt6AJpUgpN9B+O8ATDYybuNQe93N8DmPTA3EYtBr338k9o57zFQL
	eHspyGRiylSLocpiz9SaKWzs+FOd+lEZwHN+U4cNpmRWbNPyS/8m9ve5XyJqD5F+kFeP3c3FkYv
	j7mFNIXFd8spf6Kqax06NmfiOJtIwaBTKXdMqRrm5Wt9xbC+MUWpejcdp4Ww6NbWkeR5mFgKHDi
	+EpvDsUcvYSeF4H3DVPRQ4DC9LNUFQR0VUa2tIc/vT6PsVjCjmmV1bd7DwWi+i1aC6zPYYlNPgY
	vpLAIvlpGr1mrFFgX5VEo2QyeBVBhCJBjD1GCmeHXE1xB9+h/d+OS
X-Received: by 2002:a05:620a:1aaa:b0:85a:1020:63d7 with SMTP id af79cd13be357-883521dbb61mr2434433785a.47.1760286222331;
        Sun, 12 Oct 2025 09:23:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHBYXOzwONO9kVZyil/dw34TySyD+6pIngj6wc/pdezQPpAFjhCWme3kHRKMbraemUDA5eIQ==
X-Received: by 2002:a05:620a:1aaa:b0:85a:1020:63d7 with SMTP id af79cd13be357-883521dbb61mr2434430785a.47.1760286221813;
        Sun, 12 Oct 2025 09:23:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881fe5besm3112637e87.50.2025.10.12.09.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 09:23:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 12 Oct 2025 19:23:31 +0300
Subject: [PATCH v2 4/8] media: iris: stop encoding PIPE value into fw_caps
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251012-iris-sc7280-v2-4-d53a1a4056c3@oss.qualcomm.com>
References: <20251012-iris-sc7280-v2-0-d53a1a4056c3@oss.qualcomm.com>
In-Reply-To: <20251012-iris-sc7280-v2-0-d53a1a4056c3@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo69YE9WP9zEatolepYmFytvcnCgF8zYPcW5KSj
 l/0l/KKoamJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOvWBAAKCRCLPIo+Aiko
 1RvCB/4oz2P50mg+GiHwrflyGtjswsPxBbXfZD+fvueM28prVD6xZPRaxCsYYscI8cW2XFH5Fp8
 Qk4TD08z8gUQkbKE0BOv2L9L+9wV2oN9cRg7kuUBK0Sn2W76IDsxahpwLQnLHmbNA6xv2/l7uOt
 UOFllxnKSNEuHqpnDiFMNkQnrNuz68/W6j7GFW7dgDM0YXdmjw658QH77eH7xLKuLAmFZxdLB6o
 L/IrIgT9S58k3K8UsZvdAvp6yveeMXp7QGaAhFobR7Btvastt/f3g+pfIT9uxsX03GPEmeDuQ7y
 YFiWxQ4atVHD91uHaonWqye0IDQNbvsOrE4Ws2JqDJBRa3bl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ebd60f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=Fn2TP4Vc3OsuT4lKjqUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Ab4mEZ2cv9Y9iI4RYTJCUQOxRRCIQbbw
X-Proofpoint-ORIG-GUID: Ab4mEZ2cv9Y9iI4RYTJCUQOxRRCIQbbw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX0+XO0URHXv9/
 W1uVVq2clUa++sQ9PBv1kd1WE7pIJpv69xFXl71BhNtqo1nn8fM7V2DWR650Y0oFwGf2iyjk3Ip
 xh5p7JiexgfRAvMM/SeQOm94cVAjVtlcMcW5cLG8KmEBamUmi+B5ABxFe7KnSzEhhDDCWO2DJwY
 ah4I1UEQRmb9XoNx9oMfncGQZo+m29l1g/zq/jpkX6kdtSOsa1S9nqActaYRHPg2uNTUXY7+cZj
 2JTuhnXiaSKy0c3+jcaojTZGYD0VuwaLiNP38Td0yg0zyoY8vY7N44Zx5BpkD38737xdt6X/IS4
 z9sP79jbCV6bvbJzbgNXSrGyBlIz4+2vauynYwD+NmLgwwvYfaDDkToenYJ7xI401CNbUVCJRmG
 YbgVigGw0bpf7kr9Ex/2nrQ5bqMm6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

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


