Return-Path: <linux-arm-msm+bounces-54370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B8BA899FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CE9E179772
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53B8291141;
	Tue, 15 Apr 2025 10:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oq6H1cCa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A3B28DEE1
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712811; cv=none; b=cclGzXIsel/SpEYhoEkjynw5FbTuEiGCKcDEOpEsOHiQ0UdqQ3Vpbsm1nBZpGA8/4xAOj0N1ZiV6jqonhiXTRhtdbZfx4cbS3aMGp1wxk3adCY/vSkumbrwhVPJMSMDtmggvkIzqeMJ0/R1C8EvWGlHKfsL1VTZcAcz4TU53VKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712811; c=relaxed/simple;
	bh=DEda885aNQDeJmpotcvEkdrXCvQPmkQoHiO6i/fUdJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FYgPYWLGDjBJE1crmpvc69EwTNFGYU+HP3U2s8LreqSQSiMDXasbtCgng7quGnKq55JarptG+9jTmH+RdF0VQCaSrMZmOD5ni4oZyRhTE0s5WtNiY70rvDRLmIn6KDoFO5DU72GRc6a8xp7/NxHv2gMZRafcMpvMXajZHDnD/FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oq6H1cCa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tEsa019568
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7RPu91gD7lCWehMYp7bM2lqb+YJya4fOzx+VniwsjD0=; b=Oq6H1cCaH18WY0Tx
	WNRhY85rNo5mQe2DxUwm+AlBPmY5sEaihByiQD6C4y2QAX0EJGhNNbS4Ryqmw8gX
	BUmkP+vyJmDByxB0rBKJLlDqhWVR1z94DrcK2TGmjip3YnA7JorTJYGIhzMsTMAc
	LnxBnBkt8Ec4ySNer6GbMQi0tIcXRNX4uVdgHroi4DzlAzc6XMEImHAIJJioaPiJ
	I+sOH9N1hNvUcAvXNvMZI6n3M+1d+g312ODkZhlXx2XcHUELVQ2mgvIv2Z+nXDce
	gYGVO2GYo0htaNe/I8aBSzRA7Di9SNdhLT2dvBs5+MgGVie+v4enDjNBtOOn3Vg5
	klcu8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfcyjfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c791987cf6so1065753085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712808; x=1745317608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RPu91gD7lCWehMYp7bM2lqb+YJya4fOzx+VniwsjD0=;
        b=Ma0S2O++mdYRGZlnG2wHxeDBIyAk2RKjsPFval4Kj24Ih+N0+vP/9bQ6kGfNm0g+Ie
         kD2e7xGgKUhW0TewWI+WZX0kNOefU8O5u8KrY5dp9izHtzh0DNW/zRqHIyYA5R2z6hHK
         GAPL1hR7lerN+BkydLFg1auFlrxFf9/5XzqyONk2KL47BwRG2w5zuAOEWyHHQEUJ9z5Y
         TbxmDSdLlD0MTpuWX7km9BuO/h3f8QH5q9/MujAYBDpvOCdHmi2o23supa3J5m6SpBgq
         U/H3qDuZ8JNEZ27pVdi4kI2yoYFnZ4GnUn6G5hc5h7F/DxAs2nCoV+qcFWAl9Tug6Cct
         QaAw==
X-Gm-Message-State: AOJu0YxsOqQ6aCOCqyCUGORkrGlSxzxc4H2OeE3KA6+Q/7LyHcSj+gJV
	ntv9dnj0j3Jgzr5yqGc/TK7trHYhrK8DMwsW0rOtgSrTmM5o9aPO7bhfWwoyYPvKczoom0rYM8q
	ZdSjozGKZa8mBNxmgNYcqZw96/gkwZKJreNJ5GuxwqSdw9Ajluq8fSuzfABITTC4kVkfxeWcZKN
	vkGA==
X-Gm-Gg: ASbGncvCRhRGs980rHq/jCWgtXUGIoZGl2+3VWU93gcCDm8odNQvUw8B45uKuAZlV5P
	S+xOqUAlPjPrrNnEBofbDqqLE+ymUDoWSwSvNzj4Uek8MNfWxmTD5QjJNgaxK/0ntJhq2/btcRG
	4QDUmo/9bPBZA1SFKtg0YjfZO20n8jhCRcp3808frl8ywB0vWQ0iIW+D8m3B13zE6twfvevDOaL
	fIqhilDHdmJ0S3/LFN1JyrhOqRUBQK36nbNrxXJOJ4iMbdGY9AKtnzxsvOyIpLzXbFIofa09hel
	ENw8Nb5hS83RYmfYpZyn9o+qyFnQIB5XHuvd5KVxFodGwQN83MkBkOmPM2rcon7Wt4/+0kFSmCw
	rOdx8BU9B1WbbKD0WdEBixZq4
X-Received: by 2002:a05:620a:5619:b0:7c7:c772:7442 with SMTP id af79cd13be357-7c7c7727492mr387268085a.20.1744712807867;
        Tue, 15 Apr 2025 03:26:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ7D01kzqI7fEbVw7pSNh9Asz7DHiMWbXsiyB9TRRyo8aAhDYDzyI9AEq5TGtrlD3a8jeKgg==
X-Received: by 2002:a05:620a:5619:b0:7c7:c772:7442 with SMTP id af79cd13be357-7c7c7727492mr387265385a.20.1744712807524;
        Tue, 15 Apr 2025 03:26:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:26:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 13:26:02 +0300
Subject: [PATCH 04/20] arm64: dts: qcom: qcm2290: use correct size for VBIF
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-drm-msm-dts-fixes-v1-4-90cd91bdd138@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=961;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DEda885aNQDeJmpotcvEkdrXCvQPmkQoHiO6i/fUdJo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jRbVpYUZuTy6SNC7uT7bGjuXroH6I6QyrwLM
 F3qcjUJQFiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40WwAKCRCLPIo+Aiko
 1aQLB/95k2DVgVCdXhKhaVd1sAzyYc0LzojGVNnpjuJ5Dw2Ls7G1WXDzrbAOhGSXmbw1SobNdaO
 bw9cbrf9P5GXeE2Mle2uxdxpej3Z3cPyvrZFCvRbsKXV9TIvFocCEYQdkXKocuLV/n6rznd7MXX
 yYG72Ro3vLI8NilXIodv+lDIU/lHxoZWLqJyCony4jOzpDvC6cgCRWtcTrHUCEtMiW1d+ECV10a
 PhjKjHLZ7n5IF2HklB8L9mNyHWZ53r2jTbBT67TKxiFJQQtHzWU2Us7KiRsK/Y8IvYQrUe4b41s
 Un+4R24+gY0Hi4IGCOHFoQbA9IJHbAT0F7Q+znnF06LwDKcN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fe3469 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=_OTZIE9XYPbfyqiCTVkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: lPO2QYfi2LqOb3KY0pZfGrCtP27Fv4oi
X-Proofpoint-ORIG-GUID: lPO2QYfi2LqOb3KY0pZfGrCtP27Fv4oi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=685 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

Use allocated region size for VBIF regions as defined by the docs
(0x3000) instead of just using the last register address.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index e4741342e14c2be336dfb26d91ec9685884ab474..6a7ce2c6b88e51e126cb5add007a0857b0606a0e 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1641,7 +1641,7 @@ &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
 			mdp: display-controller@5e01000 {
 				compatible = "qcom,qcm2290-dpu";
 				reg = <0x0 0x05e01000 0x0 0x8f000>,
-				      <0x0 0x05eb0000 0x0 0x2008>;
+				      <0x0 0x05eb0000 0x0 0x3000>;
 				reg-names = "mdp",
 					    "vbif";
 

-- 
2.39.5


