Return-Path: <linux-arm-msm+bounces-66393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F39DB0FCE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36FA358774B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C782283FDE;
	Wed, 23 Jul 2025 22:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOdiCa7j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91A727A91D
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309699; cv=none; b=NY0tMeFse3mtxzy30kBIbA7/2x+xZuKefHUIqqNEE6y8bEjggBP2ZQLMQthYmmXOO0bn7au9hGFLik2PlINE0QTIGxkbk+7u8Aj4wdEekzgZciN9FoVEOe5Csb7mnZwsJGCXnPzB+xjV5oVy+Ce984+hH8ulrV4R3bXOKY2Tbbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309699; c=relaxed/simple;
	bh=sgooeZjbfM6S1ri+FrVmewlkP2UIgcflyZIdd6FVHsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p1v5msjTzor2MLZiXzaZGwr+FKnc/QnscpC4RXmKV9jxj0Q6y7KP2f8HVTYG0+ZH6/1jRh4rlNcqqU7Ayp8Az9MV9+YLARbmryExl2xQWdG6CIyZDaDecndiUBfmKgcgvrX6O9gDpu1OxtZ6ruxSanQKKwm1L7GatTp3UB6IyLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AOdiCa7j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NH8RXF012097
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=16arupX2e1S
	BlChhr2W+V8p/tQWklYBcFD4Hu6qlLGg=; b=AOdiCa7jKX/D/Vwga3ZFEf1m3Yu
	70HDTKS4vX9bXS197MiWBc3hLps02Zy2vNuwOL3m5uS0Sm+iGA3/72KrYX32wZCF
	JI5OMTofh8Mu5J1Bb9BN+NCRTUj9QkwVHcLJR/7DeNHfg2j64bKATCv0OZMDYgqP
	ZEKm8BXxZOW+fAFc4Tn5PbPZoG8Ye/PEo7DgRV7u2fHLrEIwSD60gX5d3yrQmzQX
	ipfu4MZv0Ia9cKuBOQ35Ok3AkdQvG+eJp/BoId7FqC9+eZyU9JwzldrmIxi9MQzU
	M66kQwrJhRrn/8yydyMLOtMbkAzbeaLj0bMV72iu6SF7XdTApiGG9D4IU4A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na555g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fabd295d12so7289646d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753309696; x=1753914496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16arupX2e1SBlChhr2W+V8p/tQWklYBcFD4Hu6qlLGg=;
        b=UxAB2W7Wj4HbpplsPjKYyF+gzFYP/LrDzwB7hSWt9MhaUEJJYpYfRS7i1IUIRVjBeF
         blJLsdC1cLBHD26zxl4GAFJUuD1eBTOQ1+SaV5LMO2CTPA4ES2VgqE00B2tnGNVdVPpU
         D253eoTSJJeXEVpJlO2baKm3X3ivhudJA2ti/y5dmVmACd7UFSjX9DBfhASWzzL6ukqt
         2KH5fuBeyIrTc0u/Td84nbHFjWa6hKAOTN9aJc7kW159HsWLRs0wa9g6qJgGMCUgKAc1
         QiPRASaAYyjLNBaPH64oDwAPil3VGwOjpC36m8es+bNB7DRYpeYBe37HYTc9DzNjUkVx
         +O/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXHRh3IECjV0BRGxKxE972sCoZ+h83HBjslNCp0okvepr0vThNIeLeWiySY/w1/IqTUYF4QD9Gq72O7XVy@vger.kernel.org
X-Gm-Message-State: AOJu0YxXB+Y3aTfQiWKlHRKS/NPmiEecf99JCFZuwuQXfuO0jrDl69Cm
	30Vl56Ghjot5t7R8RVN4OdrzIhli8TOnE5BJJ26gA8qi8sJgkmN+b3hSlo4siBACPX77kO585gV
	n52adfXTJH6JYr2Q+6AkqVQWJ0OlGzHH69ex/sz1nmVB/PdEsxqUCjw1snHngA3Z0GX1a
X-Gm-Gg: ASbGncvfL8U7cca3BO7+Un7VGO7A3XUpRy7Vduu74P38eHojYOVPU7tdTv8zQlnH3Np
	oye7flfrBeOEqiRUbgXFU+kGOESiIDycvBgFwsQ4qWvB3OkCmiXoh1gCkMppZgnz0XlmoIzSy6v
	svYbH1uFmrC6REHXkifduFRdzoXe3URlTfEcDzjhJFzGTntj/G4vY6J5ZfoXMxznoxuwv6Q6QHE
	RYQiHFyrPICFpiSkUGwAEeXaRs5NMbyopAuf3N1s8tL1nkHJPH+jovYiBen06aVBjBxiY8/mO/7
	jMXfDkeK2OqXgnjWMXHM2VfMlCFm6N8zkaHShL7PepysJU2h68B06g==
X-Received: by 2002:a05:6214:3015:b0:704:7df7:c1a0 with SMTP id 6a1803df08f44-707004b362amr67677756d6.7.1753309695724;
        Wed, 23 Jul 2025 15:28:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENnDd7E8dvz4OBj48g90QpOOMdiTVyaWS/Zz6TAtRGOSxYgAkQu5KM2rpchgfGqo30V4noHw==
X-Received: by 2002:a05:6214:3015:b0:704:7df7:c1a0 with SMTP id 6a1803df08f44-707004b362amr67677536d6.7.1753309695310;
        Wed, 23 Jul 2025 15:28:15 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad23bsm248520f8f.44.2025.07.23.15.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:28:14 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 23/23] arm64: dts: qcom: sm8650: add sound prefix for wsa2
Date: Wed, 23 Jul 2025 23:27:37 +0100
Message-ID: <20250723222737.35561-24-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dmOFi4DMTDES2AIkEXTiUyOGLIo2xdyr
X-Proofpoint-ORIG-GUID: dmOFi4DMTDES2AIkEXTiUyOGLIo2xdyr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MyBTYWx0ZWRfX3OChWLBPWKzI
 nagt3hdo/bU0BzcyTNUfQ8mWszfut43TOng8HhmJEi9Lu0kcO0tQkqM7kwdMBnEc7KhocCa2Lhw
 wUuHMbN8Wf9pP9tdfbOxOlNXiYBtq1THZ3PB9NHk9B3K6VMnPGzWaJo0yxO8JhXji3EB56n4VJF
 rhO5UQPOF3iNJR/DuKIwBOqgdi8WAIpFN/NjcMLcPVY7dPaUmtT8tO7A7De1DgNesQBOCpomVn2
 8xZ1Z66oH/p7LOu/3CVVMTMyKgVEGV4duTDKsO3uy0qmMsP+HbjT0o9o33wUI9Tavyoa7/4L0s6
 mggCZbOf2oZw4bwbeaoCCCkPRP+bc1W3lwvm3KhvGA270/PjhJsEjhv8Ss6ETgwi8O0JUHxZ6yx
 bl9lylLZtakOLCCSv7EwXVH/evZOJ19UStcLPPC9TkOdN4vS23v9Ec457HqnLST+iP3DA7PD
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=68816201 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Nfxnn_ge1f9Pje3RmyYA:9 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=795
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230193

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

WSA and WSA2 are two instances of WSA codec macro, this can lead
dupicate dapm widgets and mixers resulting in failing to probe
soundcard if both of these instances are part of the dai-link.

Correct way to address this is to add sound-name-prefix to WSA2
instances to avoid such confilcting mixers and dapm widgets.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 5212000bf34c..8b43ded297c8 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4526,6 +4526,7 @@ lpass_wsa2macro: codec@6aa0000 {
 			#clock-cells = <0>;
 			clock-output-names = "wsa2-mclk";
 			#sound-dai-cells = <1>;
+			sound-name-prefix = "WSA2";
 		};
 
 		swr3: soundwire@6ab0000 {
-- 
2.50.0


