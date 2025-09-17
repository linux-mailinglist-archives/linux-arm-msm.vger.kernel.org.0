Return-Path: <linux-arm-msm+bounces-73847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87364B7D62E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0724F527D31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 02:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FFB2F6193;
	Wed, 17 Sep 2025 02:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q88Bzkzq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3222F28FB
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 02:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758077980; cv=none; b=gNTR4xWTkNdLZpONlH8JGkHy3OXVKczT0OGgxcxyUZUWA1nIAqYWqDOVyU9kpBo3gUbgcRQJ6Md7M29AhjHGL6SSvVCcaHkWHQorQaSm1fRRE/WSWBIdYmTlnmQXP5blz0cO6j4Wa+TfaCY6Z5yLZQzrc+1lL60gk2M4ivPZ9FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758077980; c=relaxed/simple;
	bh=lX+aFOuo0M+5Z4gsdoy2HlRedwm0x/VuIHnlk7IpHjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G5ckaA2/bRCp30GNoS4v7mwR4BouPgfR3lIsFNqg0Y3OTNMWj2oy1vg4+KmnW0LEdqlaUAOhaBK7mHAVFOwlsg8mLZHIHxBPVLaw81aA3scnLSFQxy0CtJLFG2bwrGgrZdBl7x/03FiqlTwlJSGC/6MsRLrJayI0U09dCl/Byd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q88Bzkzq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLb4ZG022342
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 02:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J73DgcNzpD45nknt9+JgUGgYXRHaFEjWhkJ1fzz24p8=; b=Q88Bzkzqwp7IMcJX
	ilG4VV9V49lr7mKxhHTX+NX1xXcqtKa1sWCglhUgwOdyEBpj2KaUXZDm4Eo4RVlx
	Nlr6N0aXwngvF02DvFUDb0aE+cZ/duyqvuRELYpOuGFN8JP1OO+9M8HS4Vo167ia
	uJZyqkzYpTpdEEASPM1W/XdhKIrjmfGrNEYh2+M4pvcG97ILWhOmMkAGlwYGLQty
	vWoQEORoSqlcue/H7N+I8FTwcmsVUDwk8fkenHS0ZEOuLulicAXwCHOAZm3NHQg9
	CR8AlWDTy11f4YuVeWalFeH6mqtqcOUNDlq4zvRa3OaGCH8we8RUdpI3WTxGWCAE
	99FW8A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy0rnfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 02:59:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so1023194a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 19:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758077978; x=1758682778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J73DgcNzpD45nknt9+JgUGgYXRHaFEjWhkJ1fzz24p8=;
        b=AFsISgfFUrMX/PYVbI1awqcGitsCnKfdiKC38GbRoMBgoA+9qhtKcH1mqorYpr+NGx
         JJQm8uRDIRi2z8fZcamJ90xVtyS8cIq13L1i9nv7YwbkTGu625xowgiO6Y6Ukmd+fxA6
         fuckky1RRwCDgTt6j+GzVnltaxCUMBUXRVY2vspJ2SfupprJ3B7pHKFu6Cj7n+r2Zs5O
         70kQEnRYZ+Z80vd9qwJ5bPkuE10hcYaXCdK81SfuxV9P7H6OEew3ItHDNWElPfc0CWfz
         qnxxYtyYM9OMBMaQRCzr2ww7tUKffhss/ARWVlQ7gHNu/Yy8KxD2Z7oTFbzEfW8PO61i
         zSgA==
X-Gm-Message-State: AOJu0YzWA7rT/2YINO86Tfkc0A/R9iMkVIxrsAB7FHCsOhjgS5hn6PBK
	bDwIbi12wiuVoHdXW36Yqq2YaxdqOlcCI8EAWTAeL3ELdwXTjyFTR1dLi/AUprUEAA3Nakeq+Gq
	i0OD79Rc0Z+/ChF6eQ5rK3kacnrwgBIuwZBFvI8pLXpWG+PntPrd53bQly0N1+tLdFGjM
X-Gm-Gg: ASbGnctNbd9CnVOVjpJ7jPMKSfqEre6Ntf56CP3fSNWHi2sC1KGkxU5G2sbQULn+KK7
	39M0yJeXjIpqw7Svt1zIAHdyt9ozYq/mnrt99aRzB2ocJY9oNRpWQALWyo/XS3K5kVER6xzA+h6
	wVEdLlYh/vNxdJOi8dCQ3EFIyqDekZO+TfJG7E0AKhkXe1i0kw5p8AzPIKSqYJv2qKL9kDZmNsQ
	Qz67hXNiA/3ZnGwGNWyY93xVIC305mEZ6zcen6iBGSb/Qt4ElSdUBJR3J+gwgpq+p9p9DbUEcY7
	fq7T6xAx1vcBcaFSZeongVHH9aTOu3Yqtk0N6DDRBjwfZ2hXO0DDGgMMKA5vLJ+DMnbUPil0Lh0
	boCSXQVIqDC006koAD/KFFktELYT0TscCnw==
X-Received: by 2002:a17:90b:1dc8:b0:32e:7270:94aa with SMTP id 98e67ed59e1d1-32ee3f757dbmr833807a91.19.1758077977639;
        Tue, 16 Sep 2025 19:59:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnGbBYLI1VpGLROJJo5/lrnKLENDGfIKa2deKoELg1rKbDBWlsEcJHbnT0N5W8AIChaXTnWA==
X-Received: by 2002:a17:90b:1dc8:b0:32e:7270:94aa with SMTP id 98e67ed59e1d1-32ee3f757dbmr833782a91.19.1758077977209;
        Tue, 16 Sep 2025 19:59:37 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a35b45d1sm15481872a12.5.2025.09.16.19.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 19:59:36 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 10:58:58 +0800
Subject: [PATCH v12 1/3] dt-bindings: arm: qcom: Document HAMOA-IOT-EVK
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-hamoa_initial-v12-1-4ed39d17dfc5@oss.qualcomm.com>
References: <20250917-hamoa_initial-v12-0-4ed39d17dfc5@oss.qualcomm.com>
In-Reply-To: <20250917-hamoa_initial-v12-0-4ed39d17dfc5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-56183
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758077969; l=1177;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=lX+aFOuo0M+5Z4gsdoy2HlRedwm0x/VuIHnlk7IpHjg=;
 b=+pQXXFOjg5w6p1p3IIjDsyVsLw/aLhJ2D+s9uwo3/k0wCLTG3E+gEY3FZg017G+YSmIlSdbPk
 To9CCqcmlE1AhvHo/BfAa3KridvQZGLJ0JXH3eJl1aLYYW/f3pMHWxv
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: xwVampWSKcgy49TQb0CsYCewlSUQa9rr
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68ca241a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Bh1HEMNN3wmc11-eFpoA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xwVampWSKcgy49TQb0CsYCewlSUQa9rr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX9vkP2W1WsTzs
 nXRspNslT9QzMCTecK0COCYKI22J4XvEO0BD2gbZyxiHyAJy+iwuB6Wql9Vypjobg4vvWAZjCSF
 njiqy5Wu6Bn94HETHl1/icXbi2Qng9O11ollgb+08KTExhrkgK9ine30x/mPt9Zgimmh4OtUvij
 uw6581w5iI6qunEa3+MHe50LZa20ncZkudxbF+f14qp2F7pU9C2GIx8hz4AyVbh42tOPDTsOvYx
 yRiyLMS2kJ0zP7TdbcfrP9C9xturg0K9No1yHu1z0s726IAAEjEFmJOCTX4gutXvNElB8mzgoFs
 iPrGOJdqDV39i9+pQFmpNknktawpFX96GCgGafylUnDT0tk7vpUIBLqJ1BZmzWb13N7a6Ppicey
 SS9SIKJb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

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
index 0a3222d6f368..349f526df35e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1074,6 +1074,12 @@ properties:
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


