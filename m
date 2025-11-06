Return-Path: <linux-arm-msm+bounces-80573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A82C3A423
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 11:29:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 97AD750131F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 10:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EDBB2DEA87;
	Thu,  6 Nov 2025 10:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWi8nRnE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSPhVDg/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D816D2D9EC4
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 10:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762424701; cv=none; b=UEad0UMUAZhFaoIwYyLqSDlADIRrM3NcwfMKX92O8uJtHw3fkHcrx5VWU7yGUn3dXi8yJ8o927dIwZYHh1WrgUpGanTh0GetwzG/XD2KbKf2HgzL/N5FsvzAzZOu5yciMBm88Bl/ZxVw7I3I/x2N1MYbKGw25SKcz+7cSRoyr4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762424701; c=relaxed/simple;
	bh=8nQ5sw6au/GXcvKkhMPHNjA11MU04f/w4R2BKCtYs5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qyUMvAIt1PlWVlEWToyzM61C3JPeV8cDMMdCf3tmN4b+MbnrcYk8sVHaPGmfuBTvPhCXaqdfQ8oXBY27uIohQBqApm6pDQIr9GM1Wj3vUZN9LidTxs2fRqReanT9xWnpZhYYg/SIihossAp9G6NogARITRZahm9mQRgQ0v8wNM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWi8nRnE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSPhVDg/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A68war12326969
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 10:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QNbkeSHSadGd92B2YVOcrLu0e7BSImxzf++
	QWKYHrRE=; b=lWi8nRnEIAIx+vsEfV87YjhZple1f8eh0bykbBX70EJOeQBJRhO
	Va6YvtZI8HnbbKL74OVomdCRTHMpymETM8hEZaGlqw3z8eEu2tSPoWji5K34bscT
	kATgt6kZFroT5tEfGSia2pufID8vl9AEHa+4Z8l/elI/yj/6NLRHNFvIV/cx4kh3
	l3ey8oYZ2zV6TUOV+I8NZyyz3LC5X2UIrB+8exS/dWW+6zuWQxWMtkcsd9bd685y
	mYQ8sB6it5IBJiRciM0Xckf4+xVTBe1G1QwUncZvIjgoUQ62DmPIU+y3tvHHlr+w
	jGecLSsRYIXde05zkKYOgfi4ulxcvELz4lQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8h0v1j0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 10:24:58 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso976997b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 02:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762424697; x=1763029497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QNbkeSHSadGd92B2YVOcrLu0e7BSImxzf++QWKYHrRE=;
        b=HSPhVDg/lnPzCpHpR+8tPT4uRLz6goWZ0vPJzb3GvquItoOf20tlIZeZ0TK6IJ57P7
         NpQ+52/zjvsn7KFC8XkcdjNIX5lQXEo4cRZEOGz4tWGUwcs5EB4j1R9aRu4TNf4RKwiA
         dlxxY2kiudrYE/avprtdp6wpX49yr2GbyCdql9allc8JiiCE+KN0mYJeVd0MCTa3EITU
         Nxg54emcibyHEq0LqwDfNma1UXj2rEYdiPqSGTzkOg+7EP0CUlSB3aXOWNOchDHF/Qv7
         WZ2LI6xbgyhBqwTGqtcsyNkDxIzCV+Wo025X05gDTpu7ubFw6M7czzJ3wAUZqE2+elE1
         e1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762424697; x=1763029497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNbkeSHSadGd92B2YVOcrLu0e7BSImxzf++QWKYHrRE=;
        b=gOw3rSgSCx0C4Y9DQMZF+qLf6pF0FZRWlW352w6mU6VCN+kgYjS93TRg9kzePgoc3O
         H18azmElI4QMfZFeQOIAaVJxon+dsomTojpOypKAUem28pOOP6f+fGq/X5lCa3Yv9z3m
         ukARVsBnR5H/vpb+18XsSYbnFLP44cBf0bAqEsy5nFseyKvl0FRkU+nCPw60gdznfFGk
         vsoMnc2f05ZjIlRGuBJ2fW9CSfhZksMJobXo0oqm7YGkP9pE5glofFIvq6lyloVX3Z/o
         CfyugaIa7yiK0KCTpLqcqiPjpDMYGGAibBjJVC9Hhbx1Gg9jfaqZvY2e0X46u8MiDx5h
         eKDw==
X-Gm-Message-State: AOJu0Yzr1SEtV87X3QjEH1j8JlvnT8MvEsGlmUUfwJ6MP4SztVIlXnpA
	uHhIidHcS9PWgmf9CYBkS0Wt9VYdqWRXVrKQ5YmD8soSdRMx3c2XCRc+We0HrXldNXiFqzamlAr
	yyuwg5Czn83ZoNhZdClfpmINtEEdw0Bjw1AyyaJ7yv1KjvxQD3uTmba68exB0oGgWnQKHSQ/mYH
	kcLmA=
X-Gm-Gg: ASbGncsO8WqlnXGc/5c+ldGzJrn/0TVPY6i7YV5J+8JPOqRxB+21AfZwtMxzWbTXX1G
	nygR5xNfGsudm2ZNAHqiucxT0+ejAxFPK78vcf9QdvemM27uKo4v4rfLxqskFyDY0GnYtL1mkGV
	xYXvxalCFmIeHgSP2UZ6r823jKOUDSTUoCoT/IGI9oDWNEivI+wpbNSRJT3r62if10copuYYN59
	0gmc5tZn4ncZAFZXTahLCbNDvoeeL3Q0SAQa5gp4/XMrtX1ErYm88BeSoqxT8e4FAsw2hm3n5CJ
	a/9gJ11BdlhAV2IvfbOEsZVTaZFVVSwb3ZQwWYMKHlkQ/EyuP4aqnqYljRIBF52G1VWw+8zDJFR
	6Q0gn1x285i3HpS6ZkcmU9w==
X-Received: by 2002:a05:6a00:2289:b0:7aa:57f0:31c8 with SMTP id d2e1a72fcca58-7ae1f884dbcmr7775869b3a.30.1762424697451;
        Thu, 06 Nov 2025 02:24:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGA97dPyjuCRwZu1A4D9p9GRmCCF06mkmLB//emzW/7wDLHKMRkafeSkKDaoxwRyQM889YqdA==
X-Received: by 2002:a05:6a00:2289:b0:7aa:57f0:31c8 with SMTP id d2e1a72fcca58-7ae1f884dbcmr7775844b3a.30.1762424696904;
        Thu, 06 Nov 2025 02:24:56 -0800 (PST)
Received: from cse-cd04-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af7fd59a58sm2319687b3a.21.2025.11.06.02.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 02:24:56 -0800 (PST)
From: Xueyao An <xueyao.an@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: hamoa-iot-som: Unreserve GPIOs blocking SPI11 access
Date: Thu,  6 Nov 2025 18:24:48 +0800
Message-ID: <20251106102448.3585332-1-xueyao.an@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ogFpSQcdoaxk6nN8xgsr7B4NlLj5sOm5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA4MSBTYWx0ZWRfX5ndRNAAth7IR
 jPemBtN6TY8qHELxJ/M5XTXTWYiYwNHrRXvjmAohZ3Scrzz+AE/tzvir2TezjNK8nE+eftvV4mx
 5wSB3gBEcsfv3mrFs1jXCl69PnmcU7cSel+UHFlk97PXg/Cgtxz6QH1EYaajIdCNgCHuEPNQkhK
 hrD2OCPotJaO/Rz93IEhhNVsSqEkc/8GLTyHHp8ymDdpDG+FnfOo784dWVlWrJf+gBfNc4j9Ej9
 NJzqPMw3qx/aEtTACFad0ccaacFA5nd69oOTEltQGWMJqmj3e2PS0p8LvCYfVZpLovY665Qpcys
 0NWON2v9Nbc8M2FokvyMZEI8UqKYAfTi8waENMTb+s0QnieRwpyGMQ7T8apTaOu7ykCxPd4mAhn
 G6fZTekRX65ojQrQDpJr7koLxQq7+w==
X-Proofpoint-GUID: ogFpSQcdoaxk6nN8xgsr7B4NlLj5sOm5
X-Authority-Analysis: v=2.4 cv=PoyergM3 c=1 sm=1 tr=0 ts=690c777a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=uYweBXC_siuRksOLPw8A:9 a=zZCYzV9kfG8A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060081

GPIOs 44-47 were previously reserved, preventing Linux from accessing
SPI11 (qupv1_se3). Since there is no TZ use case for these pins on Linux,
they can be safely unreserved. Removing them from the reserved list
resolves the SPI11 access issue for Linux.

Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index 1aead50b8920..107ea8045f55 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -451,8 +451,7 @@ &remoteproc_cdsp {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <34 2>, /* TPM LP & INT */
-			       <44 4>; /* SPI (TPM) */
+	gpio-reserved-ranges = <34 2>; /* TPM LP & INT */
 
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
-- 
2.43.0


