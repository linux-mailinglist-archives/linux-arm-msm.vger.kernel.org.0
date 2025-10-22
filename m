Return-Path: <linux-arm-msm+bounces-78272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B09BFA541
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E9BB84FD5D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 06:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3E42F362F;
	Wed, 22 Oct 2025 06:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g87rnSle"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAC42F2603
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761115837; cv=none; b=dN7Ajdj3kZK/kGqaMRQEVJu8pQdsb2POmpnquMaK3bMPQ4TUjUp7WvOYCeXNIbUCLq9CQNZNvMXIpAoV8AORnx+4E7NT6pHMTe4g+11gVM6qrm3h4azouCTkxWZttYfTu2GXzhumiG7KXoqw9REIUmsxZoUEaYTXHlsijii55Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761115837; c=relaxed/simple;
	bh=AK+eOpCifQrdqxAyerpg5zHdAyrQIsKrccy3rba6YEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fw2O1CF8FlETbCAJJOhTRFgM3Wqsw5fUiA3D5Sxx7Pve0zdqqiLSiq6OPzyaz/+Y5PiPk2tCrfybIPuGpbCRR1aoUtRiuGXPL+T4XsPyPJv4i01wDKA8mQVL+ZOe4C/77hpaz7R2+L6dsIhp+L2k2aA1NjzKYphB3cOvruszXpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g87rnSle; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M49RdF025592
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s9mJDCjcSwaN3f8D9wmyTS2crTbn+Fud3WxhiyTqBBw=; b=g87rnSleme87DTFb
	geVCR+lQP/mNH88MTyd/aBd4uMbk5j2naRA7/AHcN/gFhYj8CvUeWPNxIj+UJaYG
	qJN4Wk9OP7DQxlpI+PCr6DYvhwDqTUgaYLERpwpdAEQe3z7PXiphytKvM7FtkG3f
	jZIZshFoT3pmAb2NiaLkTJVs3ttaFqSYT1FWH2LYiiM1pvZCstqL9WrJY8DCNu33
	LTJVmIlNvFNQx/zoJeMeLhxqe6oRLSTTFWf8H8h22wVFNtyFlMVBNHnrSQwriVyC
	6d/eNvNKwSAzKouFAQVDViZyqJBwuy6SL0edPnGArLgYoqa44cj9KP25WTltt1Ea
	s2m/RA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w83m8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:50:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-336b9f3b5b0so6856959a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761115834; x=1761720634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9mJDCjcSwaN3f8D9wmyTS2crTbn+Fud3WxhiyTqBBw=;
        b=GyCADEZhs+mFkyOMeWtl8K3rJVJklfIWhXKzfk5NVPfSwboIahoMRq3s2dw1t8DypI
         hO4J77CxZD1yg+rVoxcQPFqsFpNciInTYyKZeGwCfLKBQw+TX//ahKV18uNAnL6nc9yt
         0nMvUvgS6InaKhzyMhfZsiNEUx8f7PS/h+HQnNsbonHToy5e6mbHz68UHq1nAcDRrxOf
         X+9JNkUUHUVle2iEozpki8CqIY1TJfUbHNdXliPZprx6QpgGj7dwbvL4m+v908B1ZjM4
         e2mCtE81NuSpkpSA2tP00xAUWRORPPkwCd/x2iRwBRyoQvTwdxKGsBex3PEyogSW87P7
         ywyA==
X-Forwarded-Encrypted: i=1; AJvYcCUBbNhOhlRGa9OrbF8AnHmDybg/R/Pmj0w7f6/yqcq+0JtUI4vuVP+M6zUQeJ/AF4cPbS782vMZOiBRe6Q9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8rNjXdq2XCv1kiI6PGCSw3klv+8OS1KauCkNTRAlkLNcfijej
	cj3yyRvkEO88DdnU+7ExKEJjiB8F+V7C9DFBoBlEywaKVWSdfsiSDewqdT10+nWc0XhgSMYCDby
	thm/4/Y+wEjnPzkj2xIkVnJgLlhOSvRriF9DmkDC2fijbvHTxj6WfCHvUv/524wTsgVJ9
X-Gm-Gg: ASbGncuRHjVlQQZqemzmnzPy8hGlgrV8N8HTxHv5Wbsp3U57utg7WI0NltYX0O7+JhP
	2c07+MEkR1/BQOT7/iso4OPJVWpaJThrYZecJIDtZQp/HjaIW/agkDMqJ5wP2XdrdwdF//peOU2
	ChpXCiVGIx/TOeJ9HfVo43GUIxTJYSRgn8JtkPbn6hlaFRcERFXhEN67eN0ZypC9M2FgJRVPTIQ
	9aiOvsFiy7Or/WhAEc/BMn9RjnqKgO+1f7UEOTtFnIT9OO1zlmCzk25Vm5jvdNNfgVhxGSkDy3T
	VWep96p1l4rx2b6sIqFCDYZob8K79bRvxDz0pN+Dl5D+1BBNTacdlA86KHo592Z3dL+q2bSugxd
	mZzSwsnJ2wuYPfHa5bTUvqayRiBp7spKNrVb8aQGtMAFbA0hbmQ==
X-Received: by 2002:a17:90b:17cb:b0:335:2823:3689 with SMTP id 98e67ed59e1d1-33bcf85ac3dmr26314861a91.4.1761115833559;
        Tue, 21 Oct 2025 23:50:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDVc9txyy/LodTPX6Zl2bPT4KMUb2rb4Djs4TPJs7eGzSz76XX2iUq94kalMFF9cqfDmnbwA==
X-Received: by 2002:a17:90b:17cb:b0:335:2823:3689 with SMTP id 98e67ed59e1d1-33bcf85ac3dmr26314829a91.4.1761115833124;
        Tue, 21 Oct 2025 23:50:33 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223e334fsm1560285a91.8.2025.10.21.23.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:50:32 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 23:50:28 -0700
Subject: [PATCH v2 2/4] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31
 eUSB2 PHY for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-knp-usb-v2-2-a2809fffcfab@oss.qualcomm.com>
References: <20251021-knp-usb-v2-0-a2809fffcfab@oss.qualcomm.com>
In-Reply-To: <20251021-knp-usb-v2-0-a2809fffcfab@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761115829; l=1105;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=C2z1zpD5/k7zrrU1kiIxZnHAMyo8I2Wxj97A71MaKoE=;
 b=5R7Gn1k7ZEznAPlNPCPEnEY/Fe8DQaxDCQiOfn18V0Fa1yb9LsL9ao3QQcpKdWqRNYLa6+zJ3
 wsCMPTFtscwBx0YY5AvrZzEOyAmExpV3sXTe7M0fV2akCXWU3vhE5hT
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX+ucYMS8qSlhS
 nabGfw1NlwJAUpfwcdr5t0dOLV5ODrFxU04ws++96TlTFYuFQrCNsu3/JYoDdZ4uJn2Fp+bLpqX
 9MiApzeLP8+DTe+GF6feUECN1ZeLlefdK/qpIEfNa6CThvNQ9y/+vrJ20GY5p77lYA7phpnB/A9
 k/KFDI7bfUzl3VaprBxNtHX8HdaNrZ1zawvQtqVbrQOcGM1ephZSF5v1UJBAqOBumxNAJpLnTHk
 W4dBGeaPYJcn5FLI7vJ+80esGKEa5mFz/G1VxV6QJoU0rCO+cwhdaju8XYHKb4EV05cwnfyg6zv
 lCjhdm5v/TOsfZoiv07rVb5j62kYNEcTmL1SANIzOezmxcdxAJ99Q213tFEaMqc3dJh8qIatMyh
 UQDh7YzUmTnzRZGuGrnSTZTl0Wu+GA==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f87eba cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JlprKJ-Wy1uuo2cOBb8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: FUa-eifAZ0s0WeA5HgFkNvnwazmNW9KF
X-Proofpoint-ORIG-GUID: FUa-eifAZ0s0WeA5HgFkNvnwazmNW9KF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Document M31 eUSB2 PHY for Kaanapali which handles the USB2 path. Use
fallback to indicate the compatibility of the M31 eUSB2 PHY on the
Kaanapali with that on the SM8750.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index c84c62d0e8cb..ab1cdedac05c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -15,7 +15,11 @@ description:
 
 properties:
   compatible:
-    items:
+    oneOf:
+      - items:
+          - enum:
+              - qcom,kaanapali-m31-eusb2-phy
+          - const: qcom,sm8750-m31-eusb2-phy
       - enum:
           - qcom,sm8750-m31-eusb2-phy
 

-- 
2.25.1


