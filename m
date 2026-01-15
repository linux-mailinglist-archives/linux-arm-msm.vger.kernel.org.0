Return-Path: <linux-arm-msm+bounces-89115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 364AED22A15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C77D53059445
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 06:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC1B2F3608;
	Thu, 15 Jan 2026 06:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OI6+yBEO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bjd3T4Z0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ECA2F6179
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459774; cv=none; b=GxnQ0OTSM1wHU1yPHi5Vk/YgF/6+rFfrvRtakOajCW7ITSe48XNatCeZv/Zo59u7b7J+T5IvNTY8D5uONzDiLb49P3wEH25a9nn46mFDBQ6NGG/UmR2OYMuiiJDHxRJaiQnAlA5I4FXEpMVmME0AQvo+rfeFu1Ixh4iraE8tkjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459774; c=relaxed/simple;
	bh=gu9fZ0uHYCi+VLsnAAl+Bc5GutcGKYQUoVSKNZhScJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bMib+uhAaBrq4gzu5vSec4cCEVfr1JVIVfRgj1ttmKdcJp107BZJC5/YfCE5e/QPjqV5RuBStPcy8bjSrr8Y/Bo8j+pyIgrew3Y+9kqNnJNQTjt0/dgIVuo1XbCt5LJGP2yvlUGut7CmMH9yMZfVQc8dVbZfIJ4cHp90jPkNM9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OI6+yBEO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bjd3T4Z0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fx0s1991704
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P5H7H7bjQPm8ENPrzVSylrIfYe1IgT7pZO47BRNCHgU=; b=OI6+yBEOgVuWaiax
	JEzXHjxr/M+fa+xHN+ZCZHSIF8hUWFcYauZIFdtAQmmAhMOCc3w4GoJnAz5gSbRq
	zBv+t+/uu7RV6YSAHgaA1ZumgDfq9d00zKWwu5+BdN+wRVRU7ag+quQ1hWbwgWzl
	4zqoEvJFuKj1qvA7VL85I+Iqo3iHvkZA5cYj9i19USbsrVcG/+7JhiRsj2Ja4woR
	BFQ7437+1BvaqMy5sWKiVcAdhFPm2W/ZCz2KnX0GSPn4OWUR/cYixPaMDLVXg6+h
	hJb0uJSasZdieH/3LX7qM8VV6agZgv2Rp3Ox1qVGJQxApGSmQpTfBI0OXRRawYa1
	uGElPQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbtwns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b050acf07dso2823005eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 22:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768459765; x=1769064565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5H7H7bjQPm8ENPrzVSylrIfYe1IgT7pZO47BRNCHgU=;
        b=bjd3T4Z0ghymRVc2vsbbnVw7GgpggXOUVL+ufm2uD6jawFk4vcqBZJ79BDuQ796Dka
         gr7fIodiWg3Jg9zwIl0+RiLcb/Ti8tJdn1FDpFYjgjaX2gZYCSp9DHwFiNn4+OAcOUiS
         SKAtDyviAMib1eLmG1SyKuEcpvmY58CueCn/CsR8PHONrfmusqQay/CWUb4LwwSWam0w
         H3grOzuYhubWxZnoMf3jbqtnE8s0vWitgSIVsD3q68C/UYhzE2E/51+Sieg9sy+ChDqZ
         wQKgS7LQ7X/6ueZxwjJ/di892VYVtqh2o9VJ0h5lLWUYvL6r1PBDcBs88BpeyXhv6zkt
         IjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459765; x=1769064565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P5H7H7bjQPm8ENPrzVSylrIfYe1IgT7pZO47BRNCHgU=;
        b=VX6ESWWNGxyVtNIWyC4OyEcCidV1mMOwg3YYH2O4YuEyKOL47M5LM7aAG3cANiFn9F
         zYZnRYLaLQUvr7ceaoOLH39Tk4PEHdQNS5jeCJOXcQaz/Qsc3g+lCgS9nlGQbmu3GLcJ
         sm4uf8lkLIu2RqYVfUs3r7b4nai3JXUvt17fnbV1Q0LcYzFVTQiRJtTzNgXcXdDsoKPr
         zBhrfSh25owvBriqtMOXfoRlRTvHh98y1p1DMWuAEuajr7rVCKE8N+gsQhPpWNYezw+Y
         0XtB7JOjlVFLMgBx+NIh9E91aOtDi/oQooQgMdwlFEyu0A8HpTsVbJBoIiH4j+Gp1XwK
         S5Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWkXs6tGKf/2fBAeYlqCQxyr9NP6enGonJb5DQbWQ8WXzYgGxZb09K3mK/3JUIvXtk/Sf3jRNNbCdIsFQeP@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ1ADVRBQ7nEGw5O5e1uC2ZvCtmkV1b5rDWWMW2my+Ku9j/HUH
	/U5MNWZwfDzF+mZ/yX0IWeznqaztgzMHB9DxwH06yf1/zyIhLAKg/0GN7A70/Zy6hX9R7VXcEGy
	a2qK1tDCbyxqZ5ybB3XJbiMu+aXGTJbpbkffUWtz+92f+rQIR/DQo+/f/QQtDBrAsHDg6
X-Gm-Gg: AY/fxX6UseA4FSMtoxElnWyZBBQCvcdYw6UQuQ5xQuwTzAK6FUiQhXwpSILOfrJNrxa
	cVG5BnHsac3AmF+E5iepJ6B0C7yj42xBvlHsLpSw5YnBIHrWcKEXJrhABxfsxwJ02DMZgL26Fsd
	jYi+BvDwr+MUFjZCl3PDk+YGzn8lwj/ZMzwwDXCzo+XlUTixZiKy1OE4qC4wziSww131UwI0znS
	/WFvATZpHbfTfcyWwY0EoiaiVO9t5NURuuw3o/lsVxe7b3+4VKxgiafILWDsBZ0eYh5U+JBbxY7
	OjrsTMneguLLWkup5t+Wfx7eceYuORQBruog4vjoKwPFbTf+8bb5sdyl+VkFi16elUFRFI3iZdG
	i6yeq3hiGWY9YTxiPU0edDvp7f79C2sqrGA6I22YEZ7bQpdpUKB4d2XbJjcEQ
X-Received: by 2002:a05:7300:818b:b0:2a4:3593:6453 with SMTP id 5a478bee46e88-2b48f212f49mr6039659eec.3.1768459765199;
        Wed, 14 Jan 2026 22:49:25 -0800 (PST)
X-Received: by 2002:a05:7300:818b:b0:2a4:3593:6453 with SMTP id 5a478bee46e88-2b48f212f49mr6039628eec.3.1768459764582;
        Wed, 14 Jan 2026 22:49:24 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b480dea94fsm3259143eec.24.2026.01.14.22.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:49:24 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 22:49:12 -0800
Subject: [PATCH v3 10/10] arm64: defconfig: Enable Kaanapali clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-knp-dts-misc-v3-10-a6cc9e45de93@oss.qualcomm.com>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
In-Reply-To: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768459754; l=983;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=fXBOwf7jNpK/r3aio+lf3mxP7UgmWyx3xEAxq5c7bCc=;
 b=OLEfXQ/IlAvfXHAjsaggtpee0zZkcba9qpD+a/yB+EscsqXL7HywszqXtbIGaYUf4UcBJ8atD
 5nGjhSqKcQ8AjVJlJReYfNhQNE+S0a0GtXveqlGMhV8/RoDOeQzeBeB
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=69688df6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5cJRhT7gGN15LLc9nl0A:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: Z4Kb4Mh3-fF_haLiIgaAfwVXaZMCYJSY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0MiBTYWx0ZWRfXxf9aVelPNuED
 qm+ZxFCZhfvIK1PHXNX3sP3wfQicsHIEzddNd+a9LUL2rhsNgkHvWMvlcjt/WhUBPoC6QNWt1an
 nWMwqU2a1VdsPMYbriBplAeg+0IY/hv2hM6gh6WnDdSTq9DHFxN5kCVH876H5iRTocqDXJHZd/5
 cFfj+DGcCzxQl97B3B+wNWO5u4msuuRKsNhqsohJ0kYkxPphEMBypXiw/UWMWjw50ZZc59frNeB
 VxKhBGodoYJd4yb1OBS1Q3bdFBoHkD/Cbz397Ude2S8sv4dR8u7eJRBv6X2yzDiyUxgNht+XIzR
 ROIDvrzalJp1Q9AplcWbPNJlUgzxPOZnFcdo6bv2hVeyPOkMLF7+Ax1QXxZrNSpQoft5s9x0vkI
 UdLmGqSBVupJxG8Oe3trwwQeQ/OlsjTTKJSOuCtqmH6jBfNffjZOM6dW4Jrs/D0zGDNfc0YwF6b
 YUu5if6duzri1qxpF8g==
X-Proofpoint-GUID: Z4Kb4Mh3-fF_haLiIgaAfwVXaZMCYJSY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150042

From: Taniya Das <taniya.das@oss.qualcomm.com>

Enable the Kaanapali display, video, camera and gpu clock controller
for their respective functionalities on the Qualcomm Kaanapali platform.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c43dcadabec4..84e9d5785de6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1452,8 +1452,12 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_KAANAPALI_CAMCC=m
+CONFIG_CLK_KAANAPALI_DISPCC=m
 CONFIG_CLK_KAANAPALI_GCC=y
+CONFIG_CLK_KAANAPALI_GPUCC=m
 CONFIG_CLK_KAANAPALI_TCSRCC=m
+CONFIG_CLK_KAANAPALI_VIDEOCC=m
 CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y

-- 
2.25.1


