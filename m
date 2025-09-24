Return-Path: <linux-arm-msm+bounces-74722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD42B9C819
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4D563A1951
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6FF2C3255;
	Wed, 24 Sep 2025 23:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HhxaWlPg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109D229CB2D
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758755888; cv=none; b=g+0E2+SIF6xSfty3q04MtGrJLmrA+/VrV4SF8iqLYCsNQzu3xiL0BkpvEc22YsoD94rdM0xC1jKioVs8Ru+oxT2sQ4G/p7xxQp8weJ3WoVu9+2e6cYERqRadkrGLqpFUALnDrcWOWTqOuKAECgSRTcs+8/V43Vp7Lo+syH7fy4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758755888; c=relaxed/simple;
	bh=kyjRNC+4QFZXsAkWIG/lpnFNbLXZy7kZKz+PYFfTV8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F716UKJDZQpnU0unLIbBxoWQdqOqis1w862hV6krTCHNebwp08tGeqsOX8whE4pFc4ywJslvzazONNf9yD+FDhBbU5NgF1gHP2CTFf7ViLua6F6fZeJofW5Rr+2wT83ovdVnC/5j85Jby3tX4yoEo1wQ3nOeDz7WsWx9LW9NUbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HhxaWlPg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCf4uk029720
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5RPuIRFwOuvbIw6dAzYcNGhI9caskedBAXe1e6dXYJ8=; b=HhxaWlPgpT43z/+z
	pB2LBOAb6+bUF8rylsG5jYdctRryuYmuKjCaURdvt4KsKw7hsKk1of+OavF4dXY5
	sOaz55fQbSwMVsR3vXdWJVYqEGDCB+ZOX99WsYGWPrv8VHoAWywK6fREXpObZSKg
	10+HYkmtrT1aRWQJRFNOvOKmex/1QhXJHeuWXlncFs3jTlLBwQ+xTuF8qsliqpEJ
	6wfvHnaZBkTVSxK8i6GtyVzjjZR2GWu3vqkk7myb9YFbp5qwK/dLC2jH2PT4THZb
	K6pvqo7TKlka7SPrNxoB2Jm7CTc9e8xNYrx1K2D0kdMejGVDvg6JjtzVR6jeWHXg
	VKfZkg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fnvst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:18:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-25d21fddb85so5030405ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758755885; x=1759360685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RPuIRFwOuvbIw6dAzYcNGhI9caskedBAXe1e6dXYJ8=;
        b=pV59YhZVqbSSsjsOrHeKt3LjenXSWtdvu7S8Ej1Drg5jZSma9DKuMy+7cn8oPdQvfH
         TLHjycU5NO4nbR89upLcZ20IcOmfzURhzIrxS3q+hi1gto0uMROK8sFyPN8/UTvrQFn1
         823Wbnq22qH1Hd5eHCVSNOLrY+MDJwHsTYvtwjpqSuDdp4j1Z1BwE8AWa2oorsBERsjy
         SWsFOweBXjYV/JkGZAGENlV5Ld1NILEUIAq+V7gT9scnybZb4iUBQJSEzLhbriZNi818
         PDtqbzJ2lYMekcV+f/qC6k4MRdKhJfoA2Fk/qu95lV77ooORkpj1vbU9wnrunwSFJDd/
         eh7w==
X-Gm-Message-State: AOJu0YxG5bIshU/WWA6WcRnZsh6YHi6HHP8v4rwjMcuQcDtGHRVwru/8
	hf/HC2ptq/+mZlsChA2d57q7MUwT+65B/WI3sYIhgbrxODcj0dXTexgmq/Q+ib3mwpe7j+Hw2Ta
	U38fvW8JhDTp1KcOJmx1up1KuezU+/N5hs08hJowqrGL2JZgQPkPmlaKUiUOaGKV03srm
X-Gm-Gg: ASbGncsgCmqlLJa2zxr6UtF7XIWEa0/HuIvG+hCAfLo5l1mv9y5kUQ3+zViglpg87rL
	5Ueqbh/DS4gf1cv6nzFj0fzCl0nOOHw9oPIhZOg73qGLKp88xbR5dp23DSCu6+E4dHrg6Ge6x0T
	wcTMPpaCBVVpr6HqOl3+a3hFC1W0aILiRHkcfcv0KUurtpX0e6hbxkkwVBcFSNw5ZJxCP/WuVTK
	E0/iin24cbYPSJOOea4reUt0/4zNvv+jm3HGVhTNczlJLyb2sARAyRBuqfZtJhbcQ8D/Y8i32HZ
	Yiv0yJRQKIiF5SZBO+OK0g6qd2FpIzskR2qfIKH2NCzMhfcbtoJso+IpocveTq4zVLoPpkDtyEh
	p4t8eULH4bTNF5lM=
X-Received: by 2002:a17:903:1cd:b0:26a:23c7:68da with SMTP id d9443c01a7336-27ed49e70e5mr15861765ad.25.1758755885312;
        Wed, 24 Sep 2025 16:18:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb2g9nB8TyyjQlnm+SE/pRKN3CPIDLQk1Kr1voneYm5CFJO+CITrFt9uAetd0cC7Mbqm1pxA==
X-Received: by 2002:a17:903:1cd:b0:26a:23c7:68da with SMTP id d9443c01a7336-27ed49e70e5mr15861575ad.25.1758755884925;
        Wed, 24 Sep 2025 16:18:04 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cda43sm4321385ad.25.2025.09.24.16.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:18:04 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:17:46 -0700
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: add SoC ID for SM8850
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-socid-v1-1-fad059c60e71@oss.qualcomm.com>
References: <20250924-knp-socid-v1-0-fad059c60e71@oss.qualcomm.com>
In-Reply-To: <20250924-knp-socid-v1-0-fad059c60e71@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758755882; l=655;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=kyjRNC+4QFZXsAkWIG/lpnFNbLXZy7kZKz+PYFfTV8E=;
 b=JoDFbxHcNEziskqBRxVQmFT3ZzJqLdKTCVd2Y6JfT6TTMCcm3Fj8628kv070ccUabXzW2kfqx
 BixwcC8YfBxCd/ZhQV3EjLhWiEHzFL721ikWz6zrPhyQX58mWgzVBPi
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: uPUFXjcg9rNoJgBzFTYied6xxCUSBq7J
X-Proofpoint-GUID: uPUFXjcg9rNoJgBzFTYied6xxCUSBq7J
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d47c2e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-GldTGkhEULYXnHVInEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX9G5dxKUU4gvC
 ahMIVxD9O7LQC9Kxmp/bg+nLAgV0AObkgqmGe8vVdv8L9kxwV6UNVrnSPm7heq+VmsMqNlQsSJS
 IXpI5gJ/W2q6+T76hkln4FBk2xa1MCMmjA1FsAHrHkgZ50TZgYVuQKmkl2ux8/KsOQUZ4enkQXt
 c85iZqNTQEv5gtDE3A8CG+zWWRhORW0yOEm55Yb9YvHRvEVCSHg6/TTtIkp1lude3rf+LFckX+m
 VQRya2g8dDrEX0+i8P2yL5LYLt7nDN2JkAJ5tMIWFBUuds8GN639/TJV9EYOTbQd6TAsyNOBwvu
 NPwFB3XhDQLC5RPSl7uWc76k7Ypag7Xb5iHxKsUES6z2xCdFYlGtq2kLpXkk9jLqM3exM/PpAW6
 rEJD1z0L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

Add the ID for the Qualcomm SM8850 SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index cb8ce53146f0..19598ed4679e 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -286,6 +286,7 @@
 #define QCOM_ID_IPQ5424			651
 #define QCOM_ID_QCM6690			657
 #define QCOM_ID_QCS6690			658
+#define QCOM_ID_SM8850			660
 #define QCOM_ID_IPQ5404			671
 #define QCOM_ID_QCS9100			667
 #define QCOM_ID_QCS8300			674

-- 
2.25.1


