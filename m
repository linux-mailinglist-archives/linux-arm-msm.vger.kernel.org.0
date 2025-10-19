Return-Path: <linux-arm-msm+bounces-77891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB9DBEE009
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 09:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD7D63E8171
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 07:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869D2239E9E;
	Sun, 19 Oct 2025 07:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzTlae+i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE0D10A1E
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 07:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760860627; cv=none; b=qipKIvmmIMxEi8wBfxpGpCdZsvU1w5c524ATUeDevV5v1N5Hbht90A+hk5ZF4c8rNekKsv4oIA6A1WN7+uomwfGjKHVbht0sI959KbwlPf6dZSxyWvHqV9l6urOE5ciaNr65i5/5ohgUQAep24T3U48JwZmSbXCGurHJgU/rVWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760860627; c=relaxed/simple;
	bh=Atjm+XHNGwWlt44E5yZ6mg80bcKOc+FDvJDQ7swz1Rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FTeWReHm1PFxy8YR8U8gGZYA8BTmrm5cy81AURd4mDnXpgsjPaCsJZvzNw6RER8nEKibWcsGqGKnv8rqFbbxHFhESYP5vjAbvp5lZH0OkyU/XYQ8h9I77eUr5IZWZ7eLu+VTaRgFhetZUCL47SVQEeIjUIMpYCbycopqxe2Zcoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzTlae+i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J50Hoj006897
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 07:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Fu670GvHNT2WXsqNJpnsGu9vVym3c6SzGf47wM07ZY=; b=YzTlae+ieNk6n/nh
	DkTm1QhgWKkoLCtEWlpLJoR5W69/zQIylYjbPoOfTvwNa4xma2JMAipzizQ2/oH2
	J8YurKdOZeEe+sa+RqAnuvsd3WI90E84aNoZV8ksSwEo1LygjdNW+I/joXKczJm6
	yfx/UIGO7EX3YqMl9qdEp/LKHNiYDh/AiQBf5nCVmIW2dXPkPxvCppgTtxIvhbEM
	BPRcEe9vGMcyrzmbGTbURyOGTTWCAsRFXeJSuUyvZZhEjJfKwRP8cBza0CKV0MqT
	H4912tGppT8IEQPsZiD58+mtTSaqRyOnjyjLM4GgTNO6aLeP9UDAFvTeBoxQfdbr
	nuPZ4Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v39820vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 07:57:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-86b8db0e70dso152021806d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 00:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760860624; x=1761465424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Fu670GvHNT2WXsqNJpnsGu9vVym3c6SzGf47wM07ZY=;
        b=HqwIT+vP9pnO3yISZUQ3LvAvemzMOGnWR7pkJGIaxz1zJtox/0/G7lLNDhwbCbg3gw
         MCsBYRLF7kC3iHmoanJ46qPYxWmTG2MuSeFW+kXxnapvFcuZf6EqoO6Y8nN/zVv7ozfZ
         gNoPL6zKfI270OA8kzcx8uDBeHV0pR8ghFoLZSA7EE9SaGg4OGpdKxl3jVfQUxcUlcRz
         xchlslGBCnStzIm3pislCqX0t9pGwLDgy53xDMDv27tlh0/vQBnOMDr8C3sYOSB7dCxj
         Yh14XUimf77C8nj4vdIB2iQLB0w7mLDjZpXP93lC9hbmSn11T73i7NEFL4ld06LE2k02
         7o4w==
X-Forwarded-Encrypted: i=1; AJvYcCUsNqZjdinzscfUHg1Yn9lJ8mT0YjouXNH4UC9INkoYid7FusHKDN8mdCzqcK2Gg6t/DEoX6LTPtg0paRlk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwtb1RKMH4cnMpG4lFaoMu+qTnDjr2VOkcjdJORgs9BvEMGVeC
	iDpoe5RPKUl8qGxCHQTq/GdM66Ns1jXw01qnyIG/h0KA7LyZ1Z0yjDeR84X9VpPY81cV5urapbk
	5AyYN3orLJpQ7iOEm5UqpPKkv77N7igdGsbu8rNPPodXacoJ10E5r9YJLuulyJK08YFj8
X-Gm-Gg: ASbGncuAvaahwc7dUxhoYRkhS+Uavu+9VCP8US94Vt8cCp+QsEUR6MSvXYOhGVZxXUq
	hrcDHYtPhNhbMyP4Iu/UsO7EJe+jSqO6Ngy7E9Qqv1BwuMoGjnHuT+DmADYaNc1DTVGzkDtx4PV
	lSL/TIeRNAQJBo6jp45KlsexFUzXmWnXXCDffxpNujNz80w6K8G0fNJ8udmEYEl4YIR17VKeU7t
	bZ/LpPRRj06/iOZXc2Mn5sh/ZegznGT3ylI1mP+yxssry9U8wPXWNdUAigT3xErFlCKwigkRT3Q
	UIdVZrywH5f8KZ8TmFH3h695RW1GEBuVvvfKYlFrLjRZtluRxDaa979Zzx3lrVSrEzd8QFXxHCE
	ok0lSS9jQQhjWdznxiQgmrztI9SZh3q8bKgX25qud04ce0J6vegIDT1tAeKruaoJNWuEMcsPX4B
	to1iGCg9jM7NA=
X-Received: by 2002:ac8:570e:0:b0:4b7:aa52:a713 with SMTP id d75a77b69052e-4e89ce272c2mr113568351cf.14.1760860623755;
        Sun, 19 Oct 2025 00:57:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYIX8HnoNRNsNTUPJy9qliriEOtYSyAWKLSWKH9m6fAORmGFE1IA1RdNxHFemEpqsQIBGOSg==
X-Received: by 2002:ac8:570e:0:b0:4b7:aa52:a713 with SMTP id d75a77b69052e-4e89ce272c2mr113568191cf.14.1760860623303;
        Sun, 19 Oct 2025 00:57:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deeaf4cesm1357027e87.30.2025.10.19.00.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 00:57:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 19 Oct 2025 10:56:50 +0300
Subject: [PATCH v4 3/6] media: iris: stop encoding PIPE value into fw_caps
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251019-iris-sc7280-v4-3-ee6dcee6e741@oss.qualcomm.com>
References: <20251019-iris-sc7280-v4-0-ee6dcee6e741@oss.qualcomm.com>
In-Reply-To: <20251019-iris-sc7280-v4-0-ee6dcee6e741@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4207;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Atjm+XHNGwWlt44E5yZ6mg80bcKOc+FDvJDQ7swz1Rg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo9JnElNBvi+z68uVL7uf1R/LYeQKwrNjbrEMnl
 pq88uY0Mj2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaPSZxAAKCRCLPIo+Aiko
 1WUnCACxXK3iSU2+JXZTFO2Xmm38cxCeFB0t1R870vTxUQay9M8Y8d4tlHMjj+54INLRcTJwfKD
 Ba9TnxpwmBAZXXShoKJsiWJi4VGrkHT6dxuN0uOWueL60n11ZNrCQzWxt/31vo921nZ02H1TF06
 zvyBwCMphuBw4UUTa9y0/IwStDCzID2QZHTxeSNG+N+2d5v/zMiBn1gy/XbtOHxvUjmQaW+egqj
 vFRBcBndVQJoEN/Z6e7E2IRdNEMiCU/ZEnW8crXYpNbQms+S1aKDoIJuVac1m9wOEIRVZaUSvYu
 kQLMr7UlhdxlYyycJK/vHpkzQS1dJq6EsH5SvBo3w6Jdgbus
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=KcvfcAYD c=1 sm=1 tr=0 ts=68f499d0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=UBAHcYp1M5YLSaqwDvUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNSBTYWx0ZWRfX21vkN82XBKWi
 4GhWkAloIKnhoWj4ZbBJnQHwYmCHHF3pL95TiE2mft/PL9zWTZKDfk0gnGF1bt4O3Kn1Z16HS3i
 wubuPfSVweESUvaA4zpVxtdQzExSz0WNI1IgO+uiLZCfDPRcoASAtbPYbkNDsXhLazS0KI4kIze
 Fx8im5K6a6r7eK+AsJljCp+CAqvZzYRuTv1Z5A45kgiQL5fhucvWtIcjGAtmRen3X2pEX9AqLbr
 M2zXbu0rg28A5tginJTl9qAO+eXdeaBqHnQy9ugNvOkBJF30me8c01gKafcMQKT3D1++GDXI5oI
 f82psoGH/IhcemQaDDgwhOitKedunH+qor/fv9iuNgTzYxhHnrvCm0a0mG/16VVMWOaatiJY1Be
 hfUwMR8NiWGDS0BZkQ7MYcYKaUPpuA==
X-Proofpoint-GUID: zY9Vpc3yirIN9aZOnnv3ZY3p2f_7_IiK
X-Proofpoint-ORIG-GUID: zY9Vpc3yirIN9aZOnnv3ZY3p2f_7_IiK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180025

The value of the PIPE property depends on the number of pipes available
on the platform and is frequently the only difference between several
fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
iris_platform_data rather than hardcoding the value into the fw_cap.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c            | 16 +++++++++++++---
 drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  3 +--
 drivers/media/platform/qcom/iris/iris_platform_qcs8300.h |  3 +--
 drivers/media/platform/qcom/iris/iris_platform_sm8250.c  |  3 +--
 4 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 9da050aa1f7ce8152dfa46a706e2c27adfb5d6ce..c0b3a09ad3e3dfb0a47e3603a8089cf61390fda8 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -313,13 +313,23 @@ void iris_session_init_caps(struct iris_core *core)
 			continue;
 
 		core->inst_fw_caps_dec[cap_id].cap_id = caps[i].cap_id;
-		core->inst_fw_caps_dec[cap_id].min = caps[i].min;
-		core->inst_fw_caps_dec[cap_id].max = caps[i].max;
 		core->inst_fw_caps_dec[cap_id].step_or_mask = caps[i].step_or_mask;
-		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
 		core->inst_fw_caps_dec[cap_id].flags = caps[i].flags;
 		core->inst_fw_caps_dec[cap_id].hfi_id = caps[i].hfi_id;
 		core->inst_fw_caps_dec[cap_id].set = caps[i].set;
+
+		if (cap_id == PIPE) {
+			core->inst_fw_caps_dec[cap_id].value =
+				core->iris_platform_data->num_vpp_pipe;
+			core->inst_fw_caps_dec[cap_id].min =
+				core->iris_platform_data->num_vpp_pipe;
+			core->inst_fw_caps_dec[cap_id].max =
+				core->iris_platform_data->num_vpp_pipe;
+		} else {
+			core->inst_fw_caps_dec[cap_id].min = caps[i].min;
+			core->inst_fw_caps_dec[cap_id].max = caps[i].max;
+			core->inst_fw_caps_dec[cap_id].value = caps[i].value;
+		}
 	}
 
 	caps = core->iris_platform_data->inst_fw_caps_enc;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index b444e816355624bca8248cce9da7adcd7caf6c5b..03ce5c259c8491ae6882128795d18569baea6241 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -161,9 +161,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
 		.cap_id = PIPE,
 		.min = PIPE_1,
-		.max = PIPE_4,
+		/* .max, .min and .value are set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_4,
 		.hfi_id = HFI_PROP_PIPE,
 		.set = iris_set_pipe,
 	},
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index 87517361a1cf4b6fe53b8a1483188670df52c7e7..310c48958018ae724d01c87e7977096cd86e1bfd 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -147,9 +147,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
 	{
 		.cap_id = PIPE,
 		.min = PIPE_1,
-		.max = PIPE_2,
+		/* .max, .min and .value are set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_2,
 		.hfi_id = HFI_PROP_PIPE,
 		.set = iris_set_pipe,
 	},
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 66a5bdd24d8a0e98b0554a019438bf4caa1dc43c..9cb9ddc86ad73daf75383b3253e851394235093d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -21,9 +21,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		.min = PIPE_1,
-		.max = PIPE_4,
+		/* .max, .min and .value are set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_4,
 		.hfi_id = HFI_PROPERTY_PARAM_WORK_ROUTE,
 		.set = iris_set_pipe,
 	},

-- 
2.47.3


