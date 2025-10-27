Return-Path: <linux-arm-msm+bounces-78895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6114CC0D85E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA578189888A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 12:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C23F302CDF;
	Mon, 27 Oct 2025 12:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6SIgyU2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B360430E0D4
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761568032; cv=none; b=dTbWZAEypJ+OkFBgE6DOFq52sLTfo3JcpHkRhDNSGa/IdOYBM6HuMKNitE0w5rUuKn3pTWsXOqNGk5dPyMIviCiRu7jEEJK+uALNZ+7T2onrRnxNPtAXmSOydaggWnkIDTjybF6HgvSIcve2amfd7RVg1lIVNcp9vd/SFEeWGH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761568032; c=relaxed/simple;
	bh=NcGTRwOQ90/nrMX55xwrZxHeSbupJ7buA4aBXqPJnXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JRtNqdSXecdCdZ3+1ENwBMWr94iRkm3JgH2/5zxbdlcrkgHVJ3IHUZct6FR1A3FEAliVtCfGdsR9UzFCnmK9el3o4+ElgI+9CxPy4v86y5FI9zagvbHPZD3Pb0d8U87wqlbh7ee3A9763HLwDLcu6Iufb5ZsbTzOEttsk+FIVi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6SIgyU2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R89xBO914853
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dc88P58U5A4GEWJ7vn9zdSDUKcS4uL9p/Bb8UgIEEkw=; b=p6SIgyU2MmaRkFFI
	S36Tu7feSfKNkpNqV/FHW2/Z7SOADrHXwh2KIp0mDGNt+mhR/ZXwknm0QIZ81w3M
	PedJoW9RaSuXCCo5c+CqaCEjst/7qAbhIEb5owvicMCxV8gJIvhslvs9HkVMIDNH
	DjTNAEJwSjuY7Eup8cV9ugGE8qbUbflq+6frXbfKNY6KzopyMXKVy288OvDv9Shd
	PULtyV3mGchpWudXq6UrtRabvFpHh7PSHlT8wXZ1ZpSFz4qByPuTyi1/FaWA1/9Y
	7059ojb2yfS8xfAAkZgyUwin8p9nOxfD6jps5ZNBNRw56SYe9sQVoaF3sLKGB0bc
	ZJc01A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nnb4kmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:27:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8b33c1d8eso113816521cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 05:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761568029; x=1762172829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dc88P58U5A4GEWJ7vn9zdSDUKcS4uL9p/Bb8UgIEEkw=;
        b=JehhZi5rSXKE8yGnhntZKjhhGrc0GC8dtNLsKSG10WOqfxrHnd25oyiUh0lQADi0Wu
         uO6DQVKNdU9p3pdfqYtqzHzYK2pH7wodaW1F4qF0ZFSOP3HIqjGuIFXITNy/JK0FCujp
         5qQH02vgf0aCKKhc55arOdt5FaMTSeJTZ7ViNjpatqLQ28hQtuO0aMyF99qjzvez98eh
         epvin4H8Nm6mcK+CJNNR9pu2ra6S0afJbJgI1GqTSwZ54vxkC8xGlJ8hxuXvYZD1n78o
         P8LHjue5dfGt44d0RR6qApkdS8/mrwnCvpFst5EiNXnDQA5nt3K81aiV4eIh18zQCrHq
         03xg==
X-Forwarded-Encrypted: i=1; AJvYcCXSU5ivk4azs90a7s0EkBs4N0YOPSR4wTtRI1NRLAGgebCZ4vuAH7vRf7MaZWFv/vR5zrd0Dh3ek9I4pQHX@vger.kernel.org
X-Gm-Message-State: AOJu0YwGOirGNzSNt3pd2entoJ7mut9hfqcqwknCVMDNX5yi4PvI+ViJ
	vEN85erS++umEKTJZhYpuAntZuOk7twgod4Rnd6Qph+oIIMlMSAvjIoYMBv5TD3/rxKoyXHZjkB
	t887FehMM8MdPotUGu1u+KgUadm5Pt5kPqn6c16pcgp/NGocY63t36rPTMIUXRG9BuRhQ
X-Gm-Gg: ASbGncvZjxQgxc2UJ9+1/ZnILo1r0UkOK0wg+B0fRUp1OogpMcpOXxD1x3RilmGiicT
	hqa9OM95Gc/R6SywD0SI3Qwpc9/j6CWy5MUwBbQ6TZ+ZJSMpx6H8J2N8lXi8tOw2iB7r7Uqk4Pp
	oC4MVc8qnch1ArWWEqnb3uDNh9UDX12X5w9wQo/A5PbA7lT52rCXLrI0pD1qmKn87c+oukVDnb5
	9oXo49CKxP6Q0SOTrrWBKywGLzRS3CIcPQLNiMco6giQq/r0i6B4EjfS57yE1saZp4wY8Q8Nfzx
	hx7/lhpAUvAaLGbA+ZuPI7drMAMsM86be0wJxNFKlT50B2fTRuuiH4/Igf8EtO0fofiQ25rf9Fb
	VYoaRCJauIFET89L/uW34GjveeXLNxyW9vJV6f3oA99D+gC1tDjvRsWC2RIAZqN7TolSSVT6Cqx
	iv/ZoQ8f6GsTgm
X-Received: by 2002:a05:622a:5807:b0:4eb:d841:e5fa with SMTP id d75a77b69052e-4ebd841e75emr77479331cf.55.1761568027339;
        Mon, 27 Oct 2025 05:27:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGnzpe6XRdNYRzTmgL2e/s21KJ1a/9GH5NubbVwoMKFmCMTFW9LIzM2YzY7CxHU+HZ6MYnOw==
X-Received: by 2002:a05:622a:5807:b0:4eb:d841:e5fa with SMTP id d75a77b69052e-4ebd841e75emr77478961cf.55.1761568026810;
        Mon, 27 Oct 2025 05:27:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f83cb5sm2253474e87.102.2025.10.27.05.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:27:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 14:27:01 +0200
Subject: [PATCH v5 3/6] media: iris: stop encoding PIPE value into fw_caps
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-iris-sc7280-v5-3-5eeab5670e4b@oss.qualcomm.com>
References: <20251027-iris-sc7280-v5-0-5eeab5670e4b@oss.qualcomm.com>
In-Reply-To: <20251027-iris-sc7280-v5-0-5eeab5670e4b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4228;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NcGTRwOQ90/nrMX55xwrZxHeSbupJ7buA4aBXqPJnXc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8b/VFGGs5uTbMNE19soJryZ2FO/5lx8c0czm8T++wmc/
 PnHVes7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJrApXJwCMJHXF9j/R0/5enrR0qs3VmyY
 xS3l965rNbt84zuHE6n2uwWFLl5ou/rufO2u9w2vavjkzXIK+CL1+VS+6dtWnlOKebJeYlvXEvH
 Ot9MXltz5+5XfUaxAWs/yconOl+LY9jvV58vZ59/4/OnkLzYX/3Xik4S6wzbb3zMoufutKU6SSX
 m+6cH6O0uiGiMne+34tcn9196PRof+frC58Ndz7QLhP/vcfhkvv5/whDOv0XZ2p7vRZs+qeZdKf
 /mlO/5mkF4+7fctBd1axYx/UrJpiYxc69+YXp93ZvZGhcYYw84jkeeKrPl57TlVdDZZ6Gowpf4p
 Xvvc2dF1zfJ5NSn8gi+9+aNjbm99/2NFlNM1jnN/2II1AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: GDwkQBpiLfmPoz4AKl6thJENLX-Ejmml
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNiBTYWx0ZWRfX5Izlzcp8Qi3+
 0pX79Gsc4lHyeseQnCTOFyRW3xJe6sIhVFLQvXQiT2PyneR1NjaRaLfCFTzJ9sleOZnx19GOki4
 8oT9R50zWeZ1Uh+TUi8UtyZ6Uf3DeS1ivU8gaDqFAMhoGmJJhX32oZDifGOVeu5GQ6ruIxQOpCM
 xNi0eyjhP7JY19rS+T6l1lMr/ya7WP+VcyH4SaoJb9CZXvhRrpr1Tu4w/LrmeDQmjqM5KBkx4lB
 dYv9Iw6VglUiUrVzTAXNlb/KqHWbPnb3e7cNnILzXhY7a5Q9DYUAUbJLSMo+U/8BMDV4Fmy0drg
 trEvd3JY/wRoS3pyAtXN1X5bzwTdQJ5nyYzWC2SbYFxR990zMy+eX4wHDifrrmZVAXjRWbUgV2q
 /QkXi3xWdzrlsxnfIdsRE05QSvcgIw==
X-Authority-Analysis: v=2.4 cv=AJoZt3K7 c=1 sm=1 tr=0 ts=68ff651d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=SYGkZlDhJRt_0546ciQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: GDwkQBpiLfmPoz4AKl6thJENLX-Ejmml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270116

The value of the PIPE property depends on the number of pipes available
on the platform and is frequently the only difference between several
fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
iris_platform_data rather than hardcoding the value into the fw_cap.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c            | 16 +++++++++++++---
 drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  4 +---
 drivers/media/platform/qcom/iris/iris_platform_qcs8300.h |  4 +---
 drivers/media/platform/qcom/iris/iris_platform_sm8250.c  |  4 +---
 4 files changed, 16 insertions(+), 12 deletions(-)

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
index b444e816355624bca8248cce9da7adcd7caf6c5b..fb3fa1665c523fbe01df590f14d8012da3a8dd09 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -160,10 +160,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	},
 	{
 		.cap_id = PIPE,
-		.min = PIPE_1,
-		.max = PIPE_4,
+		/* .max, .min and .value are set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_4,
 		.hfi_id = HFI_PROP_PIPE,
 		.set = iris_set_pipe,
 	},
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index 87517361a1cf4b6fe53b8a1483188670df52c7e7..7ae50ab22f8c577675a10b767e1d5f3cfe16d439 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -146,10 +146,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
 	},
 	{
 		.cap_id = PIPE,
-		.min = PIPE_1,
-		.max = PIPE_2,
+		/* .max, .min and .value are set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_2,
 		.hfi_id = HFI_PROP_PIPE,
 		.set = iris_set_pipe,
 	},
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 66a5bdd24d8a0e98b0554a019438bf4caa1dc43c..805179fba0c41bd7c9e3e5de365912de2b56c182 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -20,10 +20,8 @@
 static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
-		.min = PIPE_1,
-		.max = PIPE_4,
+		/* .max, .min and .value are set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_4,
 		.hfi_id = HFI_PROPERTY_PARAM_WORK_ROUTE,
 		.set = iris_set_pipe,
 	},

-- 
2.47.3


