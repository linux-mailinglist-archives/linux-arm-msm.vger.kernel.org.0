Return-Path: <linux-arm-msm+bounces-87745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 68892CFA4CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 19:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2F09E300B343
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 18:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E8923F42D;
	Tue,  6 Jan 2026 18:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phxp7HYr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOI/IUHL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E50321420B
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 18:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767725425; cv=none; b=JVk+IBCVL0s2v3I43L/tHQ8YOL4mDU1lGbI/1+CeymmRUSTiByMUxUv3+xbxEPoDfKG4lgjAW1Jre9JfcaZ3jYdAzxrgLopztXf7PzTebhA8DKE9Qoyo1DEzM4neiTwR8xW/93WDnIuHGzycKbIVBemp5g5FexCnYm94JQMnElQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767725425; c=relaxed/simple;
	bh=lyDLvNF18lEiSSeSlvoSMCzQtT5OvpV21/43W8uDkJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nA1kAf22qBacs1Zlb51dgVliB+By/5j67dGl8ac1KvMLcpfxYEKmwgQi77MDJqqmUvAUCInlfgBAxdC6/p2F1vtWZsCbdWlqqjIuKtYmHYRJVpQA59kAUA75f9XBIHyBBDDD8FxSG9Ro4yl7XiUN3PROjaY/IYA4OOYvFDfHMTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phxp7HYr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOI/IUHL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606GqYPV3889214
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 18:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vr4LRkDX0duY5LLos4+PWvLC+7jFX2bckr8
	xKAUGqQw=; b=phxp7HYrJx2xkX+XZgW2GA3IVbyyl+PWSC/BoMDAC6qhYUDvhIp
	/WYJtp/KUr8c/h0XnX+Er2tmIzeDd70rulyJRmtd/XQ7NAx4lS1DRX7VttEehwGK
	ONvBuOWptB5HRwDIhq72KJDYyHivc2ZQDzaEsIAqV3q2hPf6GOLUg0w2IzTRgdl/
	x9P6IK2B/2/MEY6+8Jv5lAJd+8eY3K1zyxTMSJGoTTgmDKWKnfGdLYao+JCh68yp
	EQLlRnivROeRYVuxiZOrLxX0Eus878MmZpxkyPe0WqBePhTae+Nvs9Dm9Y7lM206
	JeK7OKRjH6aPP40uAGWBndNgzp2HFvsxwOg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh6a0gc68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 18:50:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edad69b4e8so2625911cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 10:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767725421; x=1768330221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vr4LRkDX0duY5LLos4+PWvLC+7jFX2bckr8xKAUGqQw=;
        b=NOI/IUHLqPBS0c2z4YGn+Icl4fvYa1oI5DH2PGw89hi0k7U36JFf7xXVleL766KkCQ
         CAixjvFe/XZcL9oKZPLXNMPgZj3GJ9B4INNLYV1OzKM7xRvO8RS1hycUmGincsZIu8hT
         WIXaVlkcvYT+6sZfBf8C8mdm7/qNK1U0k60KQz8Rbdl8GuAIA6rnhCnhckBV7si79QMf
         amHPfyl2KZUVuiRj8hNWZWhH4Ms+QZjk/FwG5M0d9MGNDq9Dqe6dw7hB3qwRP22TWNku
         vkvRpiclKUIVfYLyceKea3s1OvQB20dgPjRkWtQE4m5pHj94mLtDjXydMX6+QIKZ/uVn
         IwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767725421; x=1768330221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vr4LRkDX0duY5LLos4+PWvLC+7jFX2bckr8xKAUGqQw=;
        b=s60xmdfeA2qvfiCaOj2dbwmCImwdX6A+z3bc207A5bQz1W2oO+socf8rcf7+m58gs9
         7o/Ijbb5h1LvbPNNt92UDnZoOi9NzyxT/o7nYMmUROhtda2ZmHPo8dspNPGEhZh/CKzc
         XUzP+7GtvWwlx1YO3ONYK01jfBO7ydcx9pk1Na3F4qt+oe+K8Y63Ckaxpfm1cplFolZ4
         kcP+230wFCQdZM8aoA356xS50ZELKt8jczPKv3D5UxTVDpNvvsBxlcPDrQN3DFaPe802
         ZglZYMzYQ8rMFeWdU30TKUaZmS8Fq8hCX21y2O2ultP9mdff930g4wnxV7CNeZmVPxBJ
         Lteg==
X-Forwarded-Encrypted: i=1; AJvYcCWFirkodxyHrWsJq8z2D8J/QGlax9F5AHfswn1DR3pmdCnPOQNTVh19uqr6hSlf7oQofEySFGjgRm6Yd9IM@vger.kernel.org
X-Gm-Message-State: AOJu0YzP555W7LJF2no/IAHSDWMIVYA296EmvvgWKt6y7r9QAHyekxaJ
	auF77MZq8LouP3iA7aI9LYrilLcxRb+UyG2JP7JGV2WxHsFCAwOW89N1ZDSoR/Qeroq//jeZ5sc
	pLp/DqBh3BEFApuXMz0VBmMesBrwZczTdzhkzj2j/qP2xf8cljlKwUuOoJ+d+NlY8BfXN
X-Gm-Gg: AY/fxX4SXlIi8OrxUWVn1PsEWWb7oj7V7X7vMUL6H8etSKRlAgJtXnrLtOmxonvtcIk
	y0vulkMxD8gyPkfoh29LZ31f5B0CMc6ZRzseW4UQGJTcWeoZynud/CXu4OEle8foJZbOvn9S19f
	56SuSg/djlxVaaOIdRF5uc9K+8SVXSCmONjw4oUOEn8ScTNadKd9CFF6QacE9gP9fZYJIUl+SY9
	Zced9/w0Pkc+Zoe1xR4dlJaSkx/LZEAiPbSNl1wf09JHVBE0k4ZY+mFIkrHXqLBtUqjrI3cj+vV
	E32dfTDibaXqvchduKUUTJtC2/1IumtKbSFpcXjHkfRtrDOKnbniuAkW+RgeRO3Zjy7HSj5Rwey
	OZ/I6C+jipaXkij8yftF9MRqVBQ==
X-Received: by 2002:ac8:7f4e:0:b0:4f1:c5f6:22ad with SMTP id d75a77b69052e-4ffa841e189mr47262051cf.16.1767725421385;
        Tue, 06 Jan 2026 10:50:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQgB2TN/00DhQOfJABgdxPQwGMc4U9fgRcOA48gTkN1w5GF+TGGCNF7R+5tvaDFNLC51EjPQ==
X-Received: by 2002:ac8:7f4e:0:b0:4f1:c5f6:22ad with SMTP id d75a77b69052e-4ffa841e189mr47261831cf.16.1767725420994;
        Tue, 06 Jan 2026 10:50:20 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be65197sm2885576a12.19.2026.01.06.10.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 10:50:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: usb: qcom,dwc3: Correct IPQ5018 interrupts
Date: Tue,  6 Jan 2026 19:50:13 +0100
Message-ID: <20260106185012.19551-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=lyDLvNF18lEiSSeSlvoSMCzQtT5OvpV21/43W8uDkJw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXVlkC4vzdoAM3Y320DPOO/LMxSS5amsSfF3Al
 /Q+VsUFGuuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaV1ZZAAKCRDBN2bmhouD
 18sfD/0blvlRnsJ+7xvBCbES/Wk2SrlYt5oY/hMRunDpewuW8t8e93SU6P/JrM0uUY/02Xl9bz8
 k82obMOu2uNB2h4iV5VoI7VTt9o004fv60GV/7qMLo3ntZTLFGppUTm2POhG4uK0sQR3OMvxLZ0
 vDeKOdN+UuVUaSeicVyNYgVjoCIhaxbabgEJqceeLinxvizOrCxCfOW5NavivebAYrUsvmmWDsP
 zYjsUaTbMy2bO1IEDY+KyaywJ7Vl41pPj5xjHLjeI5rRlReFZfbfnR/Cn2CALCpANw9uvm7muYL
 x65C7SjO2SSxAkdIAqTv+P373PHVUxU1DLLzEQweYLxtCMBKgrMgahSEI37HhqeFuCR04Qd0xe/
 tMaVEOpgc1AHgYbclxbkp0rjIsJquKjX0htxR0Hx57DRYxBxbIzvLKtKh3rVkW4zyffFapALnEq
 TweU9X6OtmlPUieUk3AA2xkSKhcMKZs65nmJE1N8liiSRW5gMaX5SD+RaPcU3QF7bV4xP+HeDJu
 Udy68d/aA8ryxd22oY1VQvJ8jz7p6yTH0HX62RMJojqCOr/itTyTYhuYdRek8DUDpTM3S27e+yS
 dYs1+/paummyL7aI7a2sFjuQiG5jSh/JCQ9rLr7AJtVFwM3YpuWgxiqOi+HoSO0b8DeMljwfM2C ijhaNnrgtaxKJTA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Z8JY01aTZnn5DhSEvEIZjEjnF3wHKWqf
X-Proofpoint-GUID: Z8JY01aTZnn5DhSEvEIZjEjnF3wHKWqf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE2MyBTYWx0ZWRfX8d8nmX4t20Yl
 eyTToqRtjX9Z218nLwXkK+0VxpmHMkP124dUBbZ1//dRlEZo5vkUzxPRWVyYQEH+yj2xqERIUIq
 VtR6/AeVUfikH21MPwiBIFGME447zpIesvxqTdAnTubGweDd0kfIXeOjL/+T40ggy7URYqzba9X
 CRSXJZ0hMG9jllia0bGsIsXJxNcA1o/d3/LCBnKPWEg40vQHDKJF6KTePSaaYpU0ltkj8ZKAbVN
 ExxHj5QuX7p4JPFp410zfN/ibZgIaIp+RlihDymbg/8cM0zqKgzdmk2KZLYo7bFkGCI0/r5f5qM
 f7xgh1v9A7jI0pFlXQyFFxCGSmyo+N0yO1k+GGglrd0ad7tDeaq6DStoYpA8y7PWbjMCztSR+GN
 5KJpjCZPd9+tbe+BdVxnHiJ4ED7pUNtPpbvcFj9l6kJ0Y3EOIwUvcCmWm+6AmB9BvvF4objssSM
 0U4OKDwb+LdF8ICe5RQ==
X-Authority-Analysis: v=2.4 cv=MtdfKmae c=1 sm=1 tr=0 ts=695d596e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3SqsvWQJRDs5ZQVTcbUA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060163

According to reference manual, IPQ5018 does not have QUSB2 PHY and its
interrupts should rather match ones used in IPQ5332 (so power_event,
eud_dmse_int_mx, eud_dpse_int_mx).

Fixes: 53c6d854be4e ("dt-bindings: usb: dwc3: Clean up hs_phy_irq in binding")
Fixes: 6e762f7b8edc ("dt-bindings: usb: Introduce qcom,snps-dwc3")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml      | 2 +-
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 4d1a039013fe..7d94b5f7d8d7 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -408,7 +408,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,ipq5018-dwc3
               - qcom,ipq6018-dwc3
               - qcom,ipq8074-dwc3
               - qcom,msm8953-dwc3
@@ -453,6 +452,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,ipq5018-dwc3
               - qcom,ipq5332-dwc3
     then:
       properties:
diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8cee7c5582f2..3073943c5964 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -420,7 +420,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,ipq5018-dwc3
               - qcom,ipq6018-dwc3
               - qcom,ipq8074-dwc3
               - qcom,msm8953-dwc3
@@ -467,6 +466,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,ipq5018-dwc3
               - qcom,ipq5332-dwc3
     then:
       properties:
-- 
2.51.0


