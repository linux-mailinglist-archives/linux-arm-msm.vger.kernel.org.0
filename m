Return-Path: <linux-arm-msm+bounces-85997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 09405CD28A2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 07:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F234301CC59
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 06:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527282D323F;
	Sat, 20 Dec 2025 06:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3k9VYsH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9atG+os"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A85B25484B
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 06:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766212563; cv=none; b=m2RqNbcOGJ+cReRO2Nqr2c1iCqj4yCIsUOj1Y+7IJNqUioD1eRGNXQvS0gD86ztqMhOmkJr0xybEBmUkUu/EvAwYLuR0G/NRGKNFXqDsd0/3AQVcY3rlxyItTRBt+Q86pti9tlpXgtUbtsqjPb5A8Fk96g/uGqqGDWp2niDgYRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766212563; c=relaxed/simple;
	bh=67ymz0uRLQ8a2OT6HWVGovN4SzX+mkpGMz6xQOlw8nM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lOwcdJLX9gL8TNc6LX3/tqb+zJjDTVJeCuUTBgQeAKojDIyLf8nZsylAvUNpQNrLcRux3LFHvdSGnu9n1VyBLgHbmyyyckWe8loNQhtuUbTicAIyKmeyFP6mEbS7FxscnguBVJBAUi70O3SV3Xn/ya8FsMZVMIEsCXE+jiumoYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3k9VYsH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9atG+os; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BK4lWnQ2417233
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 06:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XCo9ZKvzhnx
	n8uP/rP/f7ZO5TI60FzE+bvF7TjfCOwc=; b=D3k9VYsHxcVgnfsU3yG7qqDVKGG
	8xbR4Ym4J/LGld6ynwWzCj++Ra+FLYVnDdVMnSHf8JC9qjuNNhjkfDx3sFkUJeSh
	Ulpk2GDdduMoERfCfDrPbjP96Qf2GvqTgnd1iB+fvbuqMFYIIuU++MDhg0bYxBbg
	ldBptek0oAP12pcWuHKJgxFITlsvRTw4S+e+njr5i0wZbg+XdEgXJXeCHMsIVTmn
	AjXNJjVvz6JNY9dj9d58ozLOBjgBugE4MFXgblnXTs6+QE5NbM3e24rBhXi0p/ZA
	tl3KS7sLH+oKKJ45Uu2e8yk+B83nKxoC5mS9XHyxbjBdDnpxdwEpoZ+KBcg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5n36g514-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 06:35:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c5d203988so5069643a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 22:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766212559; x=1766817359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCo9ZKvzhnxn8uP/rP/f7ZO5TI60FzE+bvF7TjfCOwc=;
        b=U9atG+os5svpqAoNJsfinjFMzplFIDv13mnLbpuPo/KWteK+pboGUboFVNFkB20OkV
         +T/vM9FPFMd1xGnLtFdZCfBuK4XmIS7+joOMDwLFH9dzAI6PyIo9+ztiOCY+CoLtolOV
         pI+i+lnpvMNdxtRFQVX8pytdwGMEU8dW1EpvAvTwGrSdDSx+zSekFjcPPmKptYrNxaFb
         whm45eIF4/mqNe5pbbIOuaptpukQ/dxZY8toPdKgz14VKCru/4PbqoDfHMyEMFV59gtq
         n/NG504hFIQqvr/YJATHVAycdl36HdypuHF7srGUPYdnutg+KNunwUcA2/qWUMFrWMrs
         735A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766212559; x=1766817359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XCo9ZKvzhnxn8uP/rP/f7ZO5TI60FzE+bvF7TjfCOwc=;
        b=p54R90TBtY4K7dbpGAhmxeZzrN7H8z0XviBkHsDB7ohyY/TKaP6uSeGCRECBvsrdYF
         kZUivuQyHDJac2qt405pH8e3BuoK+Ah1FppdkYycKKtkkvMwQDhRKX3CjWjoyiS1mWQ2
         V5q9InDwuPlvYVl5Ua2YbKUiHmOR2INrsHMUQxbs2aHVCXTZ2KLovqTO6hIf6xdKArk8
         UOBUKyGDOQPpgl7OBmt7nGs14eXFIy1FpenJSngVggC7lhbzNMCyhfzHbRLD7rsV1a0e
         YxW867CZm+jy0ZjhBV5NPda/dHZBP/6vdsWV+EMvffZPDHqd51NAlBWHCvLjkavxfOtV
         IyEw==
X-Forwarded-Encrypted: i=1; AJvYcCX8yfbMyUmeJIirpa0OUGPbe5XgJ65O9OytaHwy71JEblsd9bhn0EY45hRVVnE3ms7RIwo1JF5Ecatoq9el@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3oOSnyUC3uM6AbPq++JlEEWgcwMPPOJhH00FE7RXC4CNKpeA4
	Ou8VpM1OJmS2yBNo9spcC4tajzwPDjHXrHiCbL6IJRUT3O0xwRmEDsnaHEvbgKcaHDhUobJd7fv
	ZTcZC9R1WXckzfMa/KASg9BhIRinGKdhZ2J+szgEdn78djpp3/gPwoNG8Qh9szPnm9fbu
X-Gm-Gg: AY/fxX5ISAU20eeTN5xfEqcnbD6q8cLOUvtdBEKiUHvgqf/gnxlEn0kCN+tmlEpXX+K
	6MAE23vabBw67jlM7b9L5eMPxR6pfb0yuBmQCCpi70wUwAsWRlO/RDuLfUK2lgi7PAS4OqQFJ47
	ohPiGBYYqNbQShAuV+L/ddIyUQngbWT6XyOBMtHmHJ+hbFsxy9ENFrRSDwleQ3Nw1zg1k/BmlLj
	xvbbzgMJnBiSWOuxoTuNBc6vXT8jfkYWm1Fgy3p47Jk7bqNwaEDy2dfPuLMq8zVkuy5PISz5rHM
	yrhhnPO+vwzpAWDGxBBYiux6i1/J+VU16/xQqRwj/aKap+IdSbUREaNUtBPhdQP7eLxX7xLySuO
	2soYpm0MxU6QsHM6gWgaxLrT0qhctTcxLjd1YyvX1o68=
X-Received: by 2002:a17:90b:548c:b0:343:60ab:ca8e with SMTP id 98e67ed59e1d1-34e921bec08mr5128304a91.17.1766212559061;
        Fri, 19 Dec 2025 22:35:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAz0kDlHXa6b2CJrtkRwIoFM+vRVXnlz5QSmNbZCl+uxK97syHgH+dC6pp+LY93l/ciCy2Pw==
X-Received: by 2002:a17:90b:548c:b0:343:60ab:ca8e with SMTP id 98e67ed59e1d1-34e921bec08mr5128285a91.17.1766212558566;
        Fri, 19 Dec 2025 22:35:58 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7723b3a8sm2847143a91.3.2025.12.19.22.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 22:35:58 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v3 1/4] dt-bindings: usb: Add binding for Genesys Logic GL3590 hub
Date: Sat, 20 Dec 2025 12:05:34 +0530
Message-Id: <20251220063537.3639535-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDA1MCBTYWx0ZWRfXzwkoRMZHM0b9
 xiJhuEuN8t2AhS7Y0UZglen79a8mca4RUb606THDEcWjPw0C9bhHVvTDFa4NblJhlx6obJkBI4w
 EZDwLHA5cE+sTD32poThaMpDW1U+3QB/9y14o/YSI2PUzpODDhEhK+QQUc3SAEgXsPIi+pFJEqW
 esoAvYKyU73BJj2nOoX4D9YzB8U/rFbJvz8MdhTGCt7gaIzwbBzmulT+hbhCUSmq85rxfA0i36H
 A1fjSXp/2pYBIic2g1jBbEmekUFJ4PT+4/PeyWxRowbJOcZr9gin9qdmm2RK0iUOvGHmZN/1A7S
 SRRUIFTVfPPfdpN+QJtvSbSgdkxkT9+jb7bMk/OtYPFObBWhNHaY9Nx3XpQ2bJJK8Str4+O+55v
 3yhUyjr1zxeB0LjhskX+dRejYUWlbSkaBxH/dMRVPWkrT05m4dq4dF3PhbbF3zzrTXCtR+khKjP
 fKkTRZ1Y9D4jvAfqByg==
X-Proofpoint-GUID: o88DCATzxQU3a7hw9zuQZ0ZmPtsEU1r6
X-Proofpoint-ORIG-GUID: o88DCATzxQU3a7hw9zuQZ0ZmPtsEU1r6
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=694643cf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hRDnhHrYu6Pt9KVU6J8A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_01,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200050

Add the binding for the USB3.2 Genesys Logic GL3590 hub.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/genesys,gl850g.yaml      | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index 9a94b2a74a1e..a184e1074c7c 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -15,6 +15,7 @@ properties:
       - usb5e3,608
       - usb5e3,610
       - usb5e3,620
+      - usb5e3,625
       - usb5e3,626
 
   reg: true
@@ -69,6 +70,17 @@ allOf:
         peer-hub: true
         vdd-supply: true
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - usb5e3,625
+    then:
+      properties:
+        peer-hub: true
+        vdd-supply: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


