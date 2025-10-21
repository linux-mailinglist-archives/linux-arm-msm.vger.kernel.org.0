Return-Path: <linux-arm-msm+bounces-78087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CC94DBF49F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 07:10:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AFF454E1F35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 05:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1743E21255A;
	Tue, 21 Oct 2025 05:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkHpgUzp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAAF1D61B7
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 05:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761023406; cv=none; b=XeMc8xtbgSPQ9vWtufbpx0DdR5FAiCzWTVqF+S6SbFWqzoVJDurGVvf5w0cIlTKfenYuyBU97CQGNcd4Uum9hu69sCkAQ/VfTSU7MkP10DwL7Otdp1VVcfRjpDU5VzFOIA2whHmbMgvzaWkwF2VYTXxiWSuBdDpU530H5DUxYrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761023406; c=relaxed/simple;
	bh=A7QpE6xP5yHDlIHikgtSjNHApEj+WDTeaVVSj39KUdc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r0oVRnGVKwbXuaf1lcG6NJLcAexXMNBJFuXz9F0hAyqBpiWk+HolesFy4bEOMsLTj1V7XvThU249V7rvkEV/CNQFsWMyYCpTN7ORuWXxfZgXvoLfb50uvDOXQ+mQcGGZZoNktQr0EMpMabvC9nJxdFAiGwaf30zz+VN8nFbNOaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkHpgUzp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KL14Mf020635
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 05:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=b/L/VzuulQNRZ8WRFUv8t0gHqQIOYCjkqlW
	LRFniZJ0=; b=RkHpgUzpWt3xagzTEgUgCtM8ecro2w2HGTBhzQTu3mrnIcBduVZ
	9wg/jBsjjf9Kj+1/kIcmUlzKpUVomgKxoDV0sJ/pT4FtcUXrmKv+zfjJl/1BULSj
	1/gYRZTijQ0D2gB/hnANOEn5nJzlqXmQaR/DZ6NtOFetQFMxJ5DhDiEP4Vv95yVr
	ZReUBtcNV6wRK9i3P/VjTw2H/j00QVmsTVWXtY0b25VRBkMxK4taob6vFY6uHzl0
	pUO7/bxquAoFyKPB6ybUFGFmKCyIJb2GrP84nUz78tjvD0MMaTdcmu/6cXMpMMHY
	e/0RtVL98TTiK2X05zjRCOBoNNOMNj0qw1g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v343y61g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 05:10:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b62f9247dd1so3903641a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 22:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761023402; x=1761628202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/L/VzuulQNRZ8WRFUv8t0gHqQIOYCjkqlWLRFniZJ0=;
        b=cckfguvgihSXpr/z48nqNhXTfOOoKVDem+deCG5RC+0RWSgHrVghSaaZZow+T+1B9O
         3s+wyVM4/BbZsoOv15U3VhsvL7jcUW+NQ04b45/PU66GNMMwFVoaEkK16IOsroe1oYTx
         ONsHEz7AruKdzTiA+HWNOXGbN2dpvqTO4spD0HwgjwXHyEaiLU56YcOh8BvT7QSC/kXm
         f5nc/WEDsZuHa0lI/LVNoM1NvzquH1CmvnJvDXLQtFigpaBBgh0av8oJC+qCmR5zrAhG
         /ggBn+ivG7tC9uS/3z6O7sEvbuz0zm6H3xGWNg4bHKC2cV7DTvAFi26V8zjkXAYmuMUQ
         HGVg==
X-Gm-Message-State: AOJu0YwAuhiFeoveWsYuVOMcpYqMpSKuq3/TTRwMk3xfTl8BWnOgdY++
	X5uP75ow0YwAAsTJat0izRjs4/2y4jUCDMr9S8vBpQy6PJB9bXYzGxHIxxUU4koM6Y3efVjWk3k
	Ijd5BNWd/5w++zrLcDs/Ip0N65XHyjQDeSmj0+kX/OjSF2QuLjmATR7s94QOqXMpVADx5
X-Gm-Gg: ASbGncsZbd2Ukd6roW7kF2WMGDytt0cLQeEaSrzENJJHiNEGzL+QPEmnBCerDudFuBS
	p9LwwoM09F1zWo+maIIswwslA1oFKoVPmAHYUv++5xL8Ao0GU38b1pB57mzt1RFG0foI5ZvG/bn
	eCp+g9NUjx29eU9YRnHBQrhTPoJGZNMFQkCa1d6GYooWSpTjKYN3E4z9/VQT5E2KfH7nhCgwXR1
	dJaJObI7FbJ9qxPe4wtcS2WkXjR/T8sazyRmxRZg4rxf8xQvX5cLg9hS6ojJbdyMqT8wAgBKZwQ
	e8Io/602tEpU3FVNQ9T0A8pH8nX1hMORgKQc0wb2ieKacs9ileAg+rNclmU0EB6g0uVRvR5ryh1
	pYq2BK1o7vDa6ODV/ocR+Nu4mxtIV3O+x5P4U
X-Received: by 2002:a05:6a20:6a1e:b0:306:51fd:553e with SMTP id adf61e73a8af0-334a8539817mr20650386637.18.1761023401772;
        Mon, 20 Oct 2025 22:10:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRCOJtiQq21NoWumJOlPtutB2y4nxCBZ+svbSXhOYleR86k4V0TgjtU0aoFbwS7vwbpkMgqg==
X-Received: by 2002:a05:6a20:6a1e:b0:306:51fd:553e with SMTP id adf61e73a8af0-334a8539817mr20650359637.18.1761023401288;
        Mon, 20 Oct 2025 22:10:01 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f159csm10081629b3a.46.2025.10.20.22.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 22:10:00 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v8] dt-bindings: usb: qcom,snps-dwc3: Add the SM8750 compatible
Date: Tue, 21 Oct 2025 10:39:54 +0530
Message-Id: <20251021050954.3462613-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2G90Ea1fMptkL6Ye13GUjVB9FWsiRHv_
X-Proofpoint-ORIG-GUID: 2G90Ea1fMptkL6Ye13GUjVB9FWsiRHv_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX3lIjvuWxHKyt
 /CfMRB6NXqjy10ptRTqTw45SkAPMqVjaFKY02nJ0taC5eCVzkKBPczmF0+i8BkxvdkHuPWfoWop
 juP31c5wRS/4ZMF1U65jFZSCnAFQFhyhw7KYOovIvJJ0wc5ryon59EEcqfhTz5EKRiwtoS5orGY
 5hgt3GIJyvp4plKC7YTGObbwUkYVfpsXmqhwRp5JaAU7TYLNyFWjsvLGSOAKLK1uoam6q0kVqCD
 HsTE4z//WnAiMyG6SOUm8D67Oo6ZZSIsF0lyCpR4+OFnC53281Be77FGmtFOPQxDzY12QubBUkE
 XiADbAQz6HSYOm9mEKt+2YwyOFOpVQ488kLjsU+0AOkASi2V14cRV4IXGlDni3gPSZYyFXcNiHw
 7sKUg37eslSCDncP+aZUNiuEozTkiA==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f715aa cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=F9r5tr8hi6wSvKSliRAA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Add qcom,sm8750-dwc3 compatible to flattened implementation binding.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v8:
-> Shifted to using flattened implementation.
-> Since the flattened implementation code was provided by Konrad on the
v7 dt patches [1], moved authorship to him.
-> Separating out usb binding patch from DT/Defconfig patches.
-> v7 was actually correcting XO clock. But this patch is adding the
target compatible to new bindings. Although v8 is strictly not a follow
up of v7 and has different content, marking this patch as v8 to retain
context.

[1]: https://lore.kernel.org/all/5a0a0255-3c29-4e31-ab15-d286dea1ccb4@oss.qualcomm.com/

Link to v7:
https://lore.kernel.org/all/20251015105207.2819689-1-krishna.kurapati@oss.qualcomm.com/

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index d49a58d5478f..301e873684ae 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -67,6 +67,7 @@ properties:
           - qcom,sm8450-dwc3
           - qcom,sm8550-dwc3
           - qcom,sm8650-dwc3
+          - qcom,sm8750-dwc3
           - qcom,x1e80100-dwc3
           - qcom,x1e80100-dwc3-mp
       - const: qcom,snps-dwc3
@@ -213,6 +214,7 @@ allOf:
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
               - qcom,sm6350-dwc3
+              - qcom,sm8750-dwc3
     then:
       properties:
         clocks:
@@ -501,6 +503,7 @@ allOf:
               - qcom,sm8450-dwc3
               - qcom,sm8550-dwc3
               - qcom,sm8650-dwc3
+              - qcom,sm8750-dwc3
     then:
       properties:
         interrupts:
-- 
2.34.1


