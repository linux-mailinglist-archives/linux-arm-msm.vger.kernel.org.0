Return-Path: <linux-arm-msm+bounces-71060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B54B392B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 06:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 126AF3671D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 04:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452DE2673BD;
	Thu, 28 Aug 2025 04:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OMb/CLOe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18B4265CA4
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 04:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756356622; cv=none; b=nXYrVvvq9Rtow9k6hbt7uYMDJ2xOtpGg5gA6yTgfYFizFyqkomm2t80y7LGrajnQ8JHY9BGS3kMnzjlau234FdgPIL3NSTR4441ybvAeJM7ywbo1cZf9SEWCBnw8F7x5ydMQTqeubQwTKcvgeF0c1sLsSFH78EdUkLlKAUDU8FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756356622; c=relaxed/simple;
	bh=ES0C/eHUJ0vZMSiE7e9k3eopudAsRoEFpDfAJn+GlGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ml8K7gQlGDg7i2Z40dRDaYN6X9xWTzDjPaLB92s2qEQFdIJ9ahzFMq0vuP+FDu5M0t/B0NxIM9O18fSZ9Sr+D7VY4Ohu4uz0EilPn2kaah8EhKUJekfZVkqmI8JB7P/AQwWE2WQ2h8uOzBOZSyc+7HyxF/nNgjjRcjS/PztUzfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OMb/CLOe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RG8AGs027275
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 04:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWgEnfKM2T8SN4ZowpfF7xlxhdEVJCQ/+pQl9CKBY4Q=; b=OMb/CLOeXxsCkRQ5
	21C7NeYcs4c4kEs6zDOsBXUZOq8+7HSCHi9Klva7mjSzhGnOLNhX4mwPRk2aRLxh
	8Sj7O/Yba4aHnTdUG/lxISLhflktpexHBJlE2hKJMtFUMUS5QeTe+bA0jS7XyaYv
	2Euw/VV8CzG7eEGscDfrhhqhhdrHnH8weUUYinIvE5DcGhp4C1BLDEf5bvcsWPoM
	QCLeH9rpicPMiYKYkTzaft49cCTtIqW+Pz2W+ezNQ5K5NnK1wAtZPFKzfZaLe+uO
	FNbJBqUJUavcGKE6LDbTljD4qnUi9E0kZpjfk7QeyhCCISnY/ubQvkZb5di/f9Wb
	xcb6xw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16wxcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 04:50:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-771e43782aaso526456b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 21:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756356619; x=1756961419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWgEnfKM2T8SN4ZowpfF7xlxhdEVJCQ/+pQl9CKBY4Q=;
        b=rWcCvIRH95SSB+SFnYzRqtgVsK0gUZuwiKkCGdBeLewdp/L3Dy6Zod0M9youfAl1Km
         CJzcjBNnbspros3b/o+xpbWuiGs/XOAaClNhymvbxpomUbLvC3//w5dvWJEo1c8rsFiK
         nrYOOZNO7nQpi1DxSCyDZ2NbItybnyBn6OaYQF6Ocz5vyk4qeKEow0ZyPOfHb5PfBvHN
         amVfemmc49Fu0RthssHRJjOBi+hlZn62OPyVjxLyuwdl6KE2N75rIruOOFC211+AsHge
         dX7zJpBl5gV1ViNnWevZ7zs7tT5t2GcVLxO5msm44OzaRdcPu/bT24gHOZlEYXXbhC5p
         6jyA==
X-Gm-Message-State: AOJu0YwLeWKB5b5v6koM3EKX4LXkVjyL36y1Gz//uKJT7VvcFz4F97vf
	kKnoytTsRfZPn9igZ6wMmxwLFIWpI4QXTESpbD2olPmPuSrnSoE+2aYzKzV7Mbbq/ESuxOthvCQ
	LCvJ2fpC1VnqHPjFImDPXYO+gCYKgLw5AMFuOAoaeWeuVnEFIA2FYVgD27Qi6a/N8/tG+qjhITl
	3Q
X-Gm-Gg: ASbGncsjuKXdkedyNbJlxoNqMz12EDtP5yHX0ij3YqVfsR/bSBrTbbczkD2vLk/BPNq
	UO7iiXhG4bXDFU1IFL6yv73DDbgAiPCnQmlStk6DJHBYNfckpcwpLylpwNGNynQZZFsARywQ9eE
	4YGTclq+Yk6CGqsH9C77UM9tS78LiOyOJ1BkBpN4PzVobySvn4DRyUi4lGgF/Tleg6TGCf3tTAm
	7k2j7YCrp5+XMQkhKh9cHVHrVPzYP4AiIex+lGMbD/sYqAhXTenQIo4/K+ATOYbpoDVLKW87NvW
	V1b0UuA5rylXoQFGxmju6SeTW23cKQY+LisJTWqyHr/r23JYRrFdqH1jD0yWPk9fiB0X4Yrnwp2
	mmV2EARJpIlON1kyqdnWvxtbs7HUisVVqEw==
X-Received: by 2002:a05:6a20:2450:b0:243:b38b:eb8e with SMTP id adf61e73a8af0-243b38beeaemr153788637.49.1756356619086;
        Wed, 27 Aug 2025 21:50:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIsIeKy5fSUIi8sXFWz5JGR8nHUoOGJKLNVbVoy+Jb7LDobgGaONdb20TwG/V/hYVHruIpRA==
X-Received: by 2002:a05:6a20:2450:b0:243:b38b:eb8e with SMTP id adf61e73a8af0-243b38beeaemr153756637.49.1756356618599;
        Wed, 27 Aug 2025 21:50:18 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327ab094f00sm986699a91.6.2025.08.27.21.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 21:50:18 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 12:48:45 +0800
Subject: [PATCH v8 1/3] dt-bindings: arm: qcom: Document HAMOA-IOT-EVK
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-hamoa_initial-v8-1-c9d173072a5c@oss.qualcomm.com>
References: <20250828-hamoa_initial-v8-0-c9d173072a5c@oss.qualcomm.com>
In-Reply-To: <20250828-hamoa_initial-v8-0-c9d173072a5c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756356611; l=1177;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=ES0C/eHUJ0vZMSiE7e9k3eopudAsRoEFpDfAJn+GlGw=;
 b=N7c+oevrGdfKj/Zk4E4BbRJHiVXqzyQUlC6CYshevs2QpIjo7sqqV0S75SR3Ts9ysuzC3LExQ
 tdQMrpAcG54BpG1WMgAcZRxhgzWir2GZBurYXOR05McWnD1atz5wrdB
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-GUID: YTS3j7Ap3qCcSwZk3oi2kyBUFc5u17DE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfXxw9NjRL5fe/7
 hOaXP1XfhNKoVFaCaGuYmpUI1AWzHWrdZx5vwSe2REqr8IfCCQpkaYEqiqdi/2S9731+926VhdX
 wV7eHWfOnNEImLWXQdqlMIvGv9hqtdTB/FzUcke1oNU4YSveKVFvp+ppDzmR5hX1y4kd7cQsjXB
 4H+Qw+KZ+sYgJ/FDhYzl27n9KfdZXDtNG73MQf0Nm6/boy3G156OYp20DmK7FGC+bPI4xUKx01S
 u2vWxz6oizgn3q97Jgcu81/0YPchAeaB4ZSDIclZ7PktYtzBbmbAyauXYL8PUhTy2JP2E1ntaGU
 LGyWnmKvMOOSOJcBOZkc/yEGE1rRFWiyC+B2EMOOn0GGk4dCEUHTn6NQMBbkWUO/H9fJgbNDM8Q
 f7oegRM6
X-Proofpoint-ORIG-GUID: YTS3j7Ap3qCcSwZk3oi2kyBUFc5u17DE
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68afe00c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Bh1HEMNN3wmc11-eFpoA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120

Document the device tree binding for the HAMOA-IOT-EVK board, which uses
the Qualcomm X1E80100 SoC.

The EVK consists of a carrier board and a modular System-on-Module (SoM).
The SoM integrates the SoC, PMICs, and essential GPIOs, while the EVK
carrier board provides additional peripherals such as UART and USB
interfaces.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 55e5eb75af89..6b6503181ad6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1069,6 +1069,12 @@ properties:
               - qcom,x1e80100-qcp
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - qcom,hamoa-iot-evk
+          - const: qcom,hamoa-iot-som
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa

-- 
2.34.1


