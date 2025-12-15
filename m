Return-Path: <linux-arm-msm+bounces-85214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B61CBD258
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 10:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A49643071FBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 09:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 987C532E74A;
	Mon, 15 Dec 2025 09:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GAI/H4tJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kLe1gUyI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1C032C33B
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765789659; cv=none; b=cBKtF+lQTGSxDAXHtD+2tML6OiNC5Rnl8XoyiRIQ6FfoUBTZPMrpbvHe+hqdX6j4jbo3BF4F69Ii22Kbt8CypMCOPzf1X5W+qNluyZoF1x08IGLpsSTLu2HvrMsipmf/UD6WREi9jtww0EYX9OGwMwRM9apemhXLfbJoacHrz2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765789659; c=relaxed/simple;
	bh=r83eusqR2roDC5ces5D91u/7vu6Pc14lBlXGa4+CLUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sq7rfh8OiNJYtPsXY2XmLE/bTQRKnnZ6gLrcqIsL1OA2MkdPSA4KFEb9AAdpV7MghkwwVXAsj05zD3zrTifY4Jwgc1lxKUNVdDVNEIGPDlrh787ofuNkGkfwiwzWtvfvqDfhhtTpjH1tuZagc68mVP+0mNOCeBwwchS1mGCdXYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GAI/H4tJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kLe1gUyI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BF8lUFG3056175
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 09:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kuIT/LVwPNX56n8wKBXqlMwPT/oSIl74l2z1+i9AfRA=; b=GAI/H4tJxIGxMMHq
	FOUstm3gR32xVeiudwBkllDt/EF3aEfQx+7A9grWdFbatY/KwaTBZjfcmSRVYwTb
	6mPq+JU1v/TFS8IUFjbovjrjAOYL7fEzGcZ7zBfX00M51EgAt71kxrJQ433VrN+y
	z8ZMie1PEXg+HdR6kJGRPhn9hTJGS6rYPlEsrtoptACZyP6gsJ3CaoxA1MrSI+ed
	z9NnUD3OJZuWEUOcLZEQgWzXpbs/h32hYMJR+Sqr3UqlefO21GmubX4GklDi0eZR
	fNIGsgzkz/lVBR8H9jcrp1C+6s9V6YH5Exesb6aqOIrqHOR4tN+WNGmWlA2fnKu7
	21yW4g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b119akuqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 09:07:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ac387300f4so3151971eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 01:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765789657; x=1766394457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuIT/LVwPNX56n8wKBXqlMwPT/oSIl74l2z1+i9AfRA=;
        b=kLe1gUyIhk4bxNcOaDRvENOT8OR5n1ZV3sOAVH8zGzTpZH/jru4TBIUMFmd8Hqg3a8
         WOJljL8UNLwyZ8xULS6LAMgn2nFBoRjqHqZ2EcG2BMTl/0rHqSHKFhgzndAIKNZVmgcP
         Tt6KxuV7bmTeNPM44jWFtae3ZjLB1dnoq7r9L0VHtLXRniV1JR+eHRmdxEH4miKO6yxZ
         1YJuPWr6oSZXtrpV4/dVZ5ImePzBAZLl5SmgIOpJE0+stDe12WqNf0zUq6RxVqgdtDHJ
         f5rQo6Tz6AcsnqFOyksgCt3zpDfwWYiNhCZQ45U76mNHMLnO2vvKdzHna8QU4BIO9ehb
         gU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765789657; x=1766394457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kuIT/LVwPNX56n8wKBXqlMwPT/oSIl74l2z1+i9AfRA=;
        b=WCnkFp4Poq9h7nyACQG7M25MW0pXQhUuJaXvtSzLmsMpSvlxaAcEPKFa4S5Kic2mmM
         tjTFubpJgwYvU/O4y/CtHECQpawxFPGX8B+bjcxKLGsjZPjQBSNmYsz9R3/847+wF0Fy
         5p32FrOdrY9LmaYlP5WjM0cexssKbfC1QUEb4MifyxV9gtrEdSctbOUD8+80L/kFQECV
         n4z8xVddE0qcYAqV+9mC9lOnCShC0Bw3drsKXMj3z14GemFCioV7EfYTnw21DOA6wK44
         nDDF17/RaVaH0sCyf73YIlvEMDVLbqgtRoKF89f/FwQ/MGfcZH8mJvBpGPs59XLN1dd0
         Q7Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWELH5ZKLYXJPlfR61up9f72yKCEyf6qp4o7pvs4GeDzWC6L3cLm7OqYDUxLsncUy7MfBOeK6Gp1mDcO5CZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwCwyLPBXPDjh4oBrqfjqGHTjpOOPLhAHEMwnFjW3HldpLpmYEy
	yxbMKtgXm7J1I4Yv/jKD0eRHljMeJXJNB82tecKJgp21JXvqpD7+jZOPWuCdjsk6rV/Nbs85w0c
	lJEuVE7VGo7T+FZp4uJx83Cpmk6b7oN9KgA7IOVxTA+GvdpayOTVYvRsN3N0ACAlsVI0F
X-Gm-Gg: AY/fxX4kloKxtDCBXhk7/Kywyt2a2kySthLBSbZZJtOZS/2ST4zz+9Z8vS9z5i73cO7
	WxGcIHmMXjQHJkPG3iT7C4UyYD1bWfovp5I4iVo20aVo0UmfcFfX13GsWa0MriwAKcdhZRUaycf
	OWMSuVI9A7KD6rvci0vgVvf/NlsG95BafNlPL1JFLE+hkekEwMpHSqaczAYg/q1ne3VDpixAwzM
	QeJEjZBjrtN8LD5VI0YB54rZkE5KwVgqNe3G8BrZCF2mhSXwiAx8cnA3mnCbyLNoQr8DnNDhyZ3
	2zZ97Jn+6KKE2QhdpqvynBzq2KBKPkQmvRCvlXKsgfohsyBi+JPyfCnT9Orsd4U10omwqAuGXHG
	oiB2CPYxPHoGTWmmP7CrsUVrm0zNRQ8Pus+ft7PzmvxFBZwtRumHzWgPziipU
X-Received: by 2002:a05:7301:460e:b0:2ac:2f90:8e03 with SMTP id 5a478bee46e88-2ac2f9092ecmr5511743eec.7.1765789656406;
        Mon, 15 Dec 2025 01:07:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTyroMxEynLzVS+0CXN/FB/vBPiJn6PlPiWcRSCFchGyzMxy3o5FR90joJm4h2tTW/2DPLmg==
X-Received: by 2002:a05:7301:460e:b0:2ac:2f90:8e03 with SMTP id 5a478bee46e88-2ac2f9092ecmr5511711eec.7.1765789655815;
        Mon, 15 Dec 2025 01:07:35 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac3c13d60bsm15439671eec.0.2025.12.15.01.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:07:34 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 01:07:22 -0800
Subject: [PATCH v4 2/5] arm64: defconfig: enable clocks, interconnect and
 pinctrl for Qualcomm Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-knp-dts-v4-2-1541bebeb89f@oss.qualcomm.com>
References: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
In-Reply-To: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765789652; l=1631;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=r83eusqR2roDC5ces5D91u/7vu6Pc14lBlXGa4+CLUI=;
 b=9C9GrnHXiw+/1rAD3P1qJ3giYkZitz6j5DjsKcOIsFinWX43YMuyDay4mbxMazDTplQ67dV2Y
 K+aIurA3zuqA0VJ3ZUAbGczTyV69JoRyjMKqkCtOk9zPNjv1j+OyZJG
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=ftPRpV4f c=1 sm=1 tr=0 ts=693fcfd9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=agaryqCksHM5hhZjhYUA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3NiBTYWx0ZWRfX1nNYcPrN9sp4
 gcVmEmw9mAYs0LZ/J8MB1EchBDCdlVlKF1PwVFjLDK2kvDOZ392c5nhbHKZ7zQX1xaEpZ90/+Vo
 DyFEyXJ8AebERDnKKgBvZ/4DyHdnRKvLkDrX8jmfqkzylgWHhf6SJHrzgQiTn80t/NSY02I0xLc
 mIOtY9cyz6LjGiG/xS+tTL0n7udp+MdCqByyTRmrNtmGO5uxggCmAXbDN19lcZcF82MaHlq+i3B
 ZxIpzHvCH6oIptF4jjwUNBBvQX9zjqcEreCUsU87V1taAHnF0EaJv5cnOQX03GoNwnttq4ZBqpL
 bEFpKQN7Cy9KVF/j2+2LrFwXqeaBfG091ztcJE309f8gs5c5Bympeysqx1V1k9L9qFMjy08+pgs
 SKxbnGrdbOHmhBDHsKrp1hNvETYFMw==
X-Proofpoint-ORIG-GUID: 3wNXKe5xs8IlKFqat_0BC-JB4OIUgYU1
X-Proofpoint-GUID: 3wNXKe5xs8IlKFqat_0BC-JB4OIUgYU1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150076

Enable necessary drivers for booting Qualcomm Kaanapali QRD and MTP
boards. The serial engine must be properly setup before kernel reach
"init", so UART driver and its dependencies needs to be built in, enable
its dependency GCC, interconnect and pinctrl as built-in meanwhile enable
TCSRCC as module.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cdb7d69e3b24..5aac8878f676 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -642,6 +642,7 @@ CONFIG_PINCTRL_IPQ5424=y
 CONFIG_PINCTRL_IPQ8074=y
 CONFIG_PINCTRL_IPQ6018=y
 CONFIG_PINCTRL_IPQ9574=y
+CONFIG_PINCTRL_KAANAPALI=y
 CONFIG_PINCTRL_MSM8916=y
 CONFIG_PINCTRL_MSM8953=y
 CONFIG_PINCTRL_MSM8976=y
@@ -1425,6 +1426,8 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_KAANAPALI_GCC=y
+CONFIG_CLK_KAANAPALI_TCSRCC=m
 CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
@@ -1801,6 +1804,7 @@ CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
 CONFIG_INTERCONNECT_QCOM=y
+CONFIG_INTERCONNECT_QCOM_KAANAPALI=y
 CONFIG_INTERCONNECT_QCOM_MSM8916=m
 CONFIG_INTERCONNECT_QCOM_MSM8953=y
 CONFIG_INTERCONNECT_QCOM_MSM8996=y

-- 
2.25.1


