Return-Path: <linux-arm-msm+bounces-74813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE91B9CD54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5E651BC41AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206EA15B135;
	Thu, 25 Sep 2025 00:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fWoTjdib"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F5E14B950
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758759456; cv=none; b=E/EPsPA++mPI8cL8bI6F+nWsbeNM+dR62XMwXGQlSpZiTjvAJtlc58T9WLRxMS2QL7aKhnYG+w/epozQPc0RGMrAc+B26/1XZYmrtFgOAvpbK9aU+ITwJmGiI5JdLF4+MJTgW7rcAJwHPdWTmBlofu5v/4WiZ5WJjplSr3l3jHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758759456; c=relaxed/simple;
	bh=CD+1t7VjadwylddGJH0VCDFEMrl4ppThYBGWLrYy6dw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hJCHjMAMBi4/JqT8rEEFCGQRfkvsvOj8fTZr0SsxmlkC3J/Ty3/Z2sqpmxHxEGlz0jwGf6HHZCsEh0BZnVcOx48TvUZZyav8ScQtOAXCxTyu9EA8V58Ozz/Gy+2S1YFagmdCGW5DHQQGpDYTcIxXzwKOmStJdzFdnHx/+Bqz8po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fWoTjdib; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONaxFx018026
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nU5YioCkodtgHvtkt3RuERPvJ8NSz/k3anxpiiEJffY=; b=fWoTjdibtcx8nd0G
	nXFIZB8M9teVy96vvLxE3Qyqo839FWxJ+ZIt9ndWQFBe5cym9JY09cgEhY5mvAiR
	0fckoVuABf8Frs0bJZVk/FDzYKKXXTE2yOQop1L07D/WIcg5pPL4dfTXIAxBM+AX
	kGcWVG76qwFuQxYtX6GfAChKEoxBQuKly2uzpHNUp4uid8rdHRVHJn0FCUdS8Qn3
	CxJFu8f9oLILq65MY7nE/raPlqrn5mx0TmsPrfKeXNyjU1ToJUgKaa6eZqIGsQFq
	EDAGB7GFsUTYIBnqQzpaWe4tGfPdeyAnovKD1xPkvD3nVgeuod40zvmh6zDtrLQo
	nkVYLA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kka3y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77f29b9e2aaso712444b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758759452; x=1759364252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nU5YioCkodtgHvtkt3RuERPvJ8NSz/k3anxpiiEJffY=;
        b=BQN5Q0iriugJm7WQwpqi51vO85dQvJbyEWGj9D47O6qOLGrpRxy18i9QqzMNrGDkNS
         xq/qLDbNDNi/i3jkpck2/VD/KRmz60/K3tsKcLdg6W/W4vw2oByIMzyYjP4mJBFQtJN0
         eTEwfCy6aKfm1rANDIkLoOf8F6FqIxWEp0pUYopVUWcbD5NpMTaT6PzxdmsK9gpqmAtm
         PGYRrJZDRsB6is2j5bAFNxbEE0KDmekm/+MV/VV9y2IRADxRyz5oZFdAxDc3JugDQ2nr
         u7sm0xDlAg9NNJqGfwy4tsJkhuzvmvaUR5AwNfZH6t/dFXPNSITjG/WBRJOUdDFLo7Ql
         61Ag==
X-Gm-Message-State: AOJu0Yx9mQvoDI71btTFM7B2EG6jUOCNQDk/8MkdNyIx4oEiRsXh5jit
	btsHdKQfWbrqLNPBIVY9yr+AfQVFAkMFYK3hqH2XxroI1Vqpp4j2yfzulduMpHqwBWTez4s9lVI
	tn0NGcnK48TLL5i5YPn/yE3LRmyqzn1IYFNU1WWmsWNP93hG18Y7MMWLqoIdwgMXCxDInatGFyC
	f1qlc=
X-Gm-Gg: ASbGncusOx5PBpF7x+7YGpQ3JZ/fyxx/mBsLtURxorwPC7DAe9p7UTsi8bqvpfu3VbV
	yMiCbMUsiJwLvaKs85CwrtUoCcWGj/uUjH2nsWeMAtxnwlz3WHvGjH5EhC1W1YCyZd/81Q7CBIf
	KmXfkc3n5wtKqTeTXBtxoCp3AOjplUeYNZqs93l94JMsO1jE1K+GKO1uGWwFhAnagPyRVn9u7IG
	jvm/DqdC8HT7Pk8H+Hnj/xgNA2wMuuz+bRgj9J5WkjSdGneWU3derzAkuMBG57/qYTRZm+2aL1j
	nSO2KHUHrN7cJ+4PKO1b5k8+22GfYdkoD/LC/yACDurbjlBgzi6PPDqTiRfQ78so0+BIFXatXYS
	e+FXgldnoGzMAs7U=
X-Received: by 2002:a05:6a00:1acf:b0:77e:81fb:709d with SMTP id d2e1a72fcca58-780fce9ed1emr1694432b3a.16.1758759452036;
        Wed, 24 Sep 2025 17:17:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCmnC6D9ub8La7o73W6rswraBVe5NAYIjSRFJAf8tJOpz+cXdZ3JTyqDPDyYMWBgKksUL+sw==
X-Received: by 2002:a05:6a00:1acf:b0:77e:81fb:709d with SMTP id d2e1a72fcca58-780fce9ed1emr1694403b3a.16.1758759451636;
        Wed, 24 Sep 2025 17:17:31 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e6fasm262748b3a.1.2025.09.24.17.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:17:31 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:17:18 -0700
Subject: [PATCH 01/20] dt-bindings: arm: qcom: Document Kaanapali SoC and
 its reference boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-dts-v1-1-3fdbc4b9e1b1@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
In-Reply-To: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758759448; l=903;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=CD+1t7VjadwylddGJH0VCDFEMrl4ppThYBGWLrYy6dw=;
 b=GuSRx/ozZ/Ihssh4Bfgjn1sIS6Uwjt7Wp6oR1Ivkie4ZHTS6QdQbw36+FWA4AYwykUCnZFsdI
 T840aEw1GOsBKkNONJpSELvKTwpf+7idCW9qGGc3dBtU0SxDEd1fCQd
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: dH1VYUk8vomSNGvT58ibJSw-sWs8upuT
X-Proofpoint-ORIG-GUID: dH1VYUk8vomSNGvT58ibJSw-sWs8upuT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX0o22fLMG3d+J
 hqHXE/iW1VzrbnPWBYyaRBPWaruZaRKYGNVJrHzkwoKCdpgS/evLe8BVQhBV/2XONWesw3TG0hU
 65q2MhV07yGFndP7LvmVM+aAw5XMwDVPC6jTr9kcuxb4C43GMoX0xZZJND/MqSDM82DgX/2gTKH
 8MnENbWZICkg3IYV55mTgje6CAI/EjFYD1TnmE+h/oHRw7Xen1BIbHIkU1saqd/vxtLH/sGnbZp
 vDcW0R5iA6TrjSojeZqQo0nMqGRFBVLD6WxwBcxmT2s9a+4mNPH1+QAtxrqTzFb/ebmeZmsAF/t
 82bFeykPYT4YJ0GLcOMM1q1IRZGCazB/aEwjN+NJkZ0CVqTQg7WqSLKvEdtWjHbgA/69JpLl5+m
 ZnV9utKW
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d48a1d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-z8ZePDt8oiYOmukcGMA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

Document the Kaanapali SoC binding and the boards which use it.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 838e3d4bb24a..0e84220e835c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -321,6 +321,12 @@ properties:
               - qcom,ipq9574-ap-al02-c9
           - const: qcom,ipq9574
 
+      - items:
+          - enum:
+              - qcom,kaanapali-mtp
+              - qcom,kaanapali-qrd
+          - const: qcom,kaanapali
+
       - description: Sierra Wireless MangOH Green with WP8548 Module
         items:
           - const: swir,mangoh-green-wp8548

-- 
2.25.1


