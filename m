Return-Path: <linux-arm-msm+bounces-76300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1ADBC350E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 06:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7BDEB4F76B7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 04:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FC92C028A;
	Wed,  8 Oct 2025 04:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T26RBQxi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3705B2BEC31
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 04:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759898004; cv=none; b=InP1+tLr5/5l45sj8FyaYasz7uOXP1ACVMDQ5ISixflV9bM8dddWfy7NaC96RRrfpk0Q70Ay+jTYgKu5AhSxbgXDMGvn4zWrCiv5qRouvIx5u9IMx/4tOh/Y+3SFJsui0WIj9+Q88L4i/N0dcPJhs8XZ9OaVt65/6czCfPRYUDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759898004; c=relaxed/simple;
	bh=N+IKqzurGKX75UM4EW+hTzffIcDi+0wYJu9pHIUdLPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qUNMQ9cOBb9tZNVeR3iiApNO6uAdNf4mmGad34nq7uU34xG+Nv/dXDh/8CnNEFVhHWzwVyfbjRciwEOvZDEq05NO3FloqAsIwOhQgJL3z+nGDuPCARJap9X0RG+l3bL57Nwg6mLYrmqcN+/xBklw5opGTx74m0YaJAUYnOisjAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T26RBQxi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598043tf026749
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 04:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f73pC66UxLFt4BbenYscOe5t9+ujLGSu8ggi9R1XpLQ=; b=T26RBQxiebsO7ixE
	gf1y7VM326ltaiuCZQ9aGgtBhnRJ5JXjanLSbdC3ByYcPpCOGzVs9jaljrTuwf6Z
	M4IcS4J7Qqt0a2uN+GwMVLJhziWVr+0ObTynacmC+ILTWcrr1ZP1MwEfMwM6AS5L
	XHkbXLKMvFTSumI6LIP/8wqhnkbRLMs1xZlUcZ9QZlfT1m96wEcTOIT1IrbWT7Gd
	AXxYJaf30Gf5IPfQIBDpKHIEvfyzdK7LfXyoe504M9051QNjUHO6GXF5TXVr/kBF
	4P29ngO80k8vGsFrdrWVraNJUn/+pir7tlBb8i/eaUb8Oz861cV/yT4LmkEI1SUr
	MZBzxw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1s97e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 04:33:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ddc5a484c9so181311091cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 21:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759898001; x=1760502801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f73pC66UxLFt4BbenYscOe5t9+ujLGSu8ggi9R1XpLQ=;
        b=GzrQqaakU/KZ5TekZZQWQRdQt2RFJAjgJBvmSpXX1xFvLn3ufQF9pgTAPx2aRaLtmE
         eyW2KsgAC1k30AKDja5DEThSWvNijY5DHw6D7J8Y3jMW+OrP7yB8WFT4qc1aMFQ0poP+
         Tl2PAi+o5D8n5rCZQ7GoCgMDwhtug1GoarbDfTJuFQ4uRtPWbt8JHzaX4lxUEJFcXpNQ
         vlOIgynXgBnwZCp2LJggFG8VRfXVhf0fx6JzfhbyA0PxBR01rCSKw60PJE/fv8+nIsmN
         8pn7s2sZfJtnSD8nwlEgB3sKnR2c8j8lwe/UrOjSFFS1Uu6pCIcEn4tUent+QCG62M4g
         opfA==
X-Forwarded-Encrypted: i=1; AJvYcCVYgu8Cvwh0gFU8bQ8uImKvp6OihEgyPRGCKD7XlkQdH9XDjc+Ehb5Rvy3b/xAWvOdVtI+qvJt6//VnwyD7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu9BpQICniEGjmoKGwsF9WQvCtxxDo272iEDfRhUtoxmsC/19B
	z06PdVmzjCdUTUuDhOlJWThgMSMMZSwCT4q8KSofUGGYvMOSFr6y7BicrnbF9FOa5nw9IAQ+5z5
	7G76i8HksLfycynnvKo8/YZBTn5JGRIkPv6J+qngyv6G5qPVgnvIu0wfjevpjkkRi7uaQGmMHxb
	kf
X-Gm-Gg: ASbGncs+sqNGhVRzbBZf733jqhtyoqWEHaGRewqgWa4efBqYpNCIfoqVelqJZeBIgqF
	NJU/UqE02mpudoAX5clFM+L312g/DiFYEBjkMRWs9O65BdINRH2TF8+iGB9ZWiS37ypvtiqQZC9
	85FxJw11UbClzKFwCdM6ouQt3p8tDrPPkrwuj2XnFQ4l2/eodJvCCnZ69IeR/phM6Y1KsUGfzx4
	jbLGTctOl7UVfvY34JE+is5hGCVmaR7uxp3qZxpKUiWJ8aKcDxF7johEiEyNo5A5b9df7c1bjT1
	GODNKboLYIMG05Dv3JqBiF8aWVc3YtIsrEcJLcKQYam+xpEAvb/xgOi4CEXTY0VZZW/KQktYpMa
	sLm1Hfx1/5+m3tfIjyuqLpfp3KlqJ8Eio5v5pvThh5JcBEQAWS5zO2BSlWQ==
X-Received: by 2002:a05:622a:110e:b0:4d8:afdb:1266 with SMTP id d75a77b69052e-4e6ead4b14emr28047121cf.45.1759898000648;
        Tue, 07 Oct 2025 21:33:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0YbmahMqK0zNL1+oiEjryjk8HMcc1ReaJR4wM77+ILX29Y2SbV3PXQpAS2EnSlvzslr4s1A==
X-Received: by 2002:a05:622a:110e:b0:4d8:afdb:1266 with SMTP id d75a77b69052e-4e6ead4b14emr28046941cf.45.1759898000165;
        Tue, 07 Oct 2025 21:33:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119f461sm6751107e87.107.2025.10.07.21.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 21:33:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Oct 2025 07:33:02 +0300
Subject: [PATCH 4/8] media: iris: stop encoding PIPE value into fw_caps
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-iris-sc7280-v1-4-def050ba5e1f@oss.qualcomm.com>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
In-Reply-To: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3537;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=N+IKqzurGKX75UM4EW+hTzffIcDi+0wYJu9pHIUdLPg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo5emCs3ZLTV33Szlchupn75t6PyGmNGwdnbRKR
 ItAl6id6yCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOXpggAKCRCLPIo+Aiko
 1aiGCACp+lBVfmjmxwRnTemtd7DpkWslHgtXtKgbWhDISyW+I2XN9e2VON3VR6BADmP74o3MZO2
 i1HGDeooYBOFo1u3PJZhynN3YvWGj1moEIAC2wEAFFPToWnvCEM/UQx6Dn8cYwSXxaPfPVmmiaX
 PK+FdjoTYwpsW0sTzt+0reUC4N0rDiANso3vmg5Brv8v/u4GRP14iGOHObd+SAGwbNH9xiNdTuR
 mnt5w67un3MFCzp9XXsAXNYdc/0Vxf2RyBlxLcqj9vnNbG+HFRu62JzHL2I0ZN8PPIrxyAz2t2g
 rYXzZ7wfpwjk2NBhIef681doppXPEOnKfxGayaXV5PAzhQeR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: gVbTPDj9rc69Ev4yRN-Q17tdbx2eiS5d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX/ghu44kl6QQO
 x1wslG0a/4zcbHo4TExq77vvWLc849i2bzrO/AOPXdSfZKsXvOIu/gNbeV5LobWl5XgIyeAnUmI
 s9Z9zAOSo8UCl3Oafe8sE7HkMC4BWBMp2LliVzc/EYJ8/SUfXP77//NKyP8pZQi1s2Jw5gNZo2K
 JT30GFOPCdhAuQDeCJ5x92FvXaCzTPBokawsy5QKRaveCqvQs0HYt8iveP2iHN5QSWMDVW2mRgz
 OwfWr7wOVrY7aSoBZZ85RnJ4cWr3eZ+H9mnU8ebhciLlXEeRdR4fFqhdl4N7qLrRzSfyPSn79SY
 RtuKcTF1LI06Qs6FmS6LUwLqSMsZaVVwQcssUhggKS79iZE1DUQNM6+KAVYro3KQDpwgSBXBC2f
 MPMbW1Ywlld8kFPDLz5zijhvyPUoug==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e5e992 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=Fn2TP4Vc3OsuT4lKjqUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: gVbTPDj9rc69Ev4yRN-Q17tdbx2eiS5d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

The value of the PIPE property depends on the number of pipes available
on the platform and is frequently the only difference between several
fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
iris_platform_data rather than hardcoding the value into the fw_cap.

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


