Return-Path: <linux-arm-msm+bounces-74766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D226FB9CA4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D303E1B22CA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF592C3247;
	Wed, 24 Sep 2025 23:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPuGP72A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836142D0610
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757060; cv=none; b=mLHJpKNHfnK0+TzPUnSjFhgG1TpUslaxLmFw3dxr/Zhpgf7wgBdytdheQMosSflVuJZU0Jn9f/11lXkOBUqa679hlA2qYkh1E4UoBgN0/GlC+Jq2whbxd9JYwu3RS4YUd5ZDNmzpHQ50iqMyE/B7HxjwZykbwEvO2DSaIVkmEcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757060; c=relaxed/simple;
	bh=nx0dHtwCuHPuOqGztNINoB6tkECO4h7844UgsOU5S8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a66WCwBcwtfNqQ85LI/8rM1zR4P86HDtDwkDXLoiIXqe0rlTnER2JpD8HkxI5SfJvEYHKD7hd4FaS0XzDjEF0S2lKBkgJbFCKIeKhDgDupZsnf675YuuJpOZ1U6jB6XtugF2tbsIURZwUIziNWi/FFFnLgIqxMtieZahd/Y++dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPuGP72A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODSQtd019919
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nR7RgImdeuGECfm8oEmT1uV2KbxxIPWin03Qltlq0XA=; b=KPuGP72APXf3DpDW
	2Jf95yD6XEzRnOm6letcIDnrEe1dfg4PBB74p35V9uE7Syd2p6c7qflDPY6+7ymh
	xBeVhqCJsfw/JYh3WGQRnRlHE81aEDr8qIGCVT66TDMh4Gmz4NKdKh6l1OgWCHbY
	tHUxP9fphphpkgnkG3elQp3ICLuqwUoLdaBORjwAYfoo9lg2Y97ZJZJwsazrmxfo
	VbvOQN2mdWx/0Aa7PiLFADHqzkkaySSkyzjkgV9vbtx92lsw7+/31E/peoPFmGyX
	Aie82ZtVajDUvx8O1xyMs2yDSEKMn8M8XlJ1EROWC1vdShLBPBJ02p/ELGbyOmlv
	SqY4MQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdy97v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:37:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-252afdfafe1so3515965ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:37:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757057; x=1759361857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nR7RgImdeuGECfm8oEmT1uV2KbxxIPWin03Qltlq0XA=;
        b=vokyCc/CzpgM0tj2MfLZWzKW9oSPfQ7+Mhuq2sFfoyUscgksA9Rgj7jNAm+qN7WT85
         G42DU9wqb12K7WfeIbhqz/XrPlrDxHvt8jhKAIzgUroF404rE2F/djoTZk1WfdvHfx4x
         vdLXQo/6j/QMtYZo/BRARHzR4vcFb8hJwBe3sEWkRI8s3uVc1JL+y/zCK3N8Ai07BQuq
         EnS/pHMRnVmHTOlORkmyhW5kcaeMSlpuINwCrreOU3IEJ1ti/JpPTdO+4IcoPOoREEVE
         A5hMXso6LM+rb2u1LvhAWgZssT0hE764yM8rYVbheTu3YoVesxYVgjy3KEk62p76Aqu7
         8e3w==
X-Gm-Message-State: AOJu0YxOLtt01gnrqaqYZIMWTKcKj0jeo8lmEKfhikx31EZ6lvWsYsr1
	zv8de5CyONs3Htp67i0PpPytBnH6G1xmpoTCKhOoQEBevAAoqbsFmQXbSvkOBgh483eXyLYkJ8F
	nkTNpVRnTnei7O2ZevQPftObQVpXTbowus6lHLZrKGCjp7xxdZ6GHi0FGk8qB7rc5CgHn
X-Gm-Gg: ASbGnctBxDVM4ts7T9FgywUjhAIx2SMP9id1RGQHGVBLZ3pcMyRE6xduUI5Y63V8Me8
	97hE3gQgov+d5YfcxbEoXZn+kNt69+rh0Vt/pGGFkPeOw0MnlqQ6pOjrjIJlViYt99+zsechakl
	nANJCDn9BFVPzkFlJvmpo8Wcp9iv9NwsUettzpQgqMFINRHvZs+KC57wgZFTIsMNz65hq2QAHNT
	joGsxJ9I7eGt26DXOobylPvcfVpwPZ26zNKH9qbb6OPzA/6v4cU6x9W0PTua3jdyMb1IPd18qa6
	1yjAQmlvPRLDualJx0XT443McbMhSHi6AOm7Oc62wE+td2MbA7FryocWlN7cgZFWXKIQqVLF9cX
	G4W7d374MaNVFxS4=
X-Received: by 2002:a17:902:f545:b0:276:b1ce:c094 with SMTP id d9443c01a7336-27ed4a2d56bmr13859415ad.29.1758757057093;
        Wed, 24 Sep 2025 16:37:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0DpLlCP+Wu//SJaGMVpFeTh4I8dKMTS5/nKg7KoBNZz87O/I+1e3GvUlj2zhRFFWbv242ag==
X-Received: by 2002:a17:902:f545:b0:276:b1ce:c094 with SMTP id d9443c01a7336-27ed4a2d56bmr13859185ad.29.1758757056678;
        Wed, 24 Sep 2025 16:37:36 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d73550sm227187a91.3.2025.09.24.16.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:37:36 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:37:27 -0700
Subject: [PATCH 6/6] remoteproc: qcom_q6v5_pas: Add SoCCP node on Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-remoteproc-v1-6-611bf7be8329@oss.qualcomm.com>
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
In-Reply-To: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757046; l=1587;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=nx0dHtwCuHPuOqGztNINoB6tkECO4h7844UgsOU5S8Y=;
 b=RVFCeO9HdLik8U13CFsMJrNsbHYXllD9xRH1xIxUhMQ37oLcPFBlmhUaBH1RzC2f1nAWbNyFL
 e+upGHkHY8kBDmwZTOJ9AvWHysXeySnjMDwe47/OVUydoyMDGFhejhY
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: RBdkZFThkmxCmYDuju4lEJoPb5GyZKXg
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d480c2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-54vo4t_4OUFHp6kYXwA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: RBdkZFThkmxCmYDuju4lEJoPb5GyZKXg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfXzcp1Pwj+LxSY
 z0alwjey1W5n6SNu/HfdpmVVZaSrzhZSwiFdy4qZkEy+eCT1GTHRWjUmIctNVuZFLb5sqgNT8B1
 M9Ok3xRoAvkZ/mdYtWSITYym4NAxCoPBDUY7WU42bOlBcej1/cABgxsFVzZxt2V3YIBAw42tB4X
 mJMx361ca0XMy1VMl8BR/hEDP1b1JZQbf2yr+GS1NWydinxfawC/DjWg19RKxqv5wFAcxH7psyf
 I5uDH0AVkEc8LGX7/ujrhkfBuJjMjyMS2F6L8QByINvq4dWvqDtozsEEQn6yNo2JHAx7dqEDOl4
 8r099nRm35pPpjherl7RTIBbpY52m2GMfvuwfSXRhTGNzOz8FB7haiWDCERX/03NEtC5FgI8Bjq
 7EetZIt3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
USB Type-C, battery charging and various other functions on Qualcomm SoCs.
It provides a solution for control-plane processing, reducing per-subsystem
microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 99163e48a76a..5007e1706699 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1487,7 +1487,25 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
+static const struct qcom_pas_data kaanapali_soccp_resource = {
+	.crash_reason_smem = 656,
+	.firmware_name = "soccp.mdt",
+	.dtb_firmware_name = "soccp_dtb.mdt",
+	.pas_id = 51,
+	.dtb_pas_id = 0x41,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "soccp",
+	.sysmon_name = "soccp",
+	.auto_boot = true,
+	.early_boot = true,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
+	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource},
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &msm8996_adsp_resource},
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},

-- 
2.25.1


