Return-Path: <linux-arm-msm+bounces-74756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7508FB9CAC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1EA416E397
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12EB5298CDE;
	Wed, 24 Sep 2025 23:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lP2TRpjt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6882BEFE3
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756917; cv=none; b=e+zSXdl09bvTV+csYvNrVGQNIw0hejjjQID+MxUChzNFxq0oDh5A8caPP/Docsr1n5deOXdxc8zrwjLb2+WTd7DnI7MvQnDNxUmFAGBYwdPTAbgaPmULLRVGMlLhle5rsxz3o6wcqkYDy87sUrqWwrgJD6wDYqoPqB05vIuS2Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756917; c=relaxed/simple;
	bh=YFE6gRJwBJey7qoAfsJWRiZl1FI7ewVERjhZ54aTXY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mmk7gjLbqD81ovhk7PYpWg/XMZYtF2VOnjuj+8xnl1LC9od9M4ruOkWlf0F5mDqIJFhrVcXqwuPoQ/OWeFSB5FPxCQn79V1nIqxWwVmRUAckdOlyjAozWPChWKmRLqDfGGbLZcbRjaeoDJkdPB2PK3shVYJcHu1kCmdweMzibjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lP2TRpjt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD414R025283
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZvnJ81KxkQIo11RALQNJeyWDefLx9wBbmisYnHSbMk=; b=lP2TRpjtxNLaRnYi
	1GHoBPrTehPeQclbB+aDJ0g9+Jea9memCE3JqEJdRji1Zdo3AmGJaRjBRnmGUuP5
	OpC9usv71XmRZpM8WpklVR0hPLMKYDxgEV0xOCr/Z1F96Hflcpo/FO8yLM+wglCN
	E9bjv/HatppoPWw3RlmFrIRIvhbwOxInYzJSfJP07YyVHt7CHAJY6ZaAxxYM5hGe
	x7Ht8HWY8NByPIQzmbUpZvFIyt3YCCDOpOqTp8NNQJOPtF6BhFIBBZjLznUaIHhQ
	A0b48nbOFkNlZU0s8puDPPMBvbEKADZgqIOHeXus654oys+MhdsMWIJ4R98qR6OU
	bXGB6w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyexc60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:35:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4f8e079bc1so205065a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756911; x=1759361711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZvnJ81KxkQIo11RALQNJeyWDefLx9wBbmisYnHSbMk=;
        b=IbJMwfrWYJp+3571EZvzNpk/M72cHzw0UipSOvfBVFMAPqdA3G19g/S9K/abyTWd0w
         RdGokQK9C1XZKlH/mlBEGdYEoAdvNHVu8wf/uUEHPRr9tajwaFYNk6bx2jYLHRL7u/3K
         MhZduaIMtb5/hGvajz+3QPPTaxojhkK5CEPv3TDDf/3rb+WIgTY0Fq/rSsEyoGqfmGAC
         K/FIwgSuB+Hp8Nbk7xz3qZ27xrNeTVTua77GZrgnw5Cz7Lf+TL/xfPlDs9d1V2m+yE9c
         Jaj6E3MY5qJuLsC913xa5fXVs2vwvvKmz+ChoAl8cSVUruoFYxK9j0/DLrxl2I1atvOB
         wFnA==
X-Gm-Message-State: AOJu0YzuqRLB/vI/sFGzPqn6T2oOYrWWwrak3rA4Z0wBdiSEmscOuQr4
	99p9PEYU/9NwA7dtNIYVLWE7scYkDmMf2DivnsamRX7U7MHnChWLPHM32ZbMCE/LLK3FIQrv2im
	obps63p2udP8vBZtz9ihAbS0/OT3iD6MPDMb+rcpaCLRubQ4bzats47nXoPbzsd6hteCl
X-Gm-Gg: ASbGncvAqYNJjHodZvGsUtrLRK1Fmo/KZZPR+yTBscAsKwWqeONNDhvJtIOmM7F7O04
	/JOEtf0Y84KrTIDGndoSEsPro5yEj+km2ncriMGlrQvqhvjgmSOKmuFKxTyniRad7k4i/vAltvh
	pO68ZAIUxIDt7HCAU76gp1B4bc/C4UukMSu4W4JpuHRDAvwGnNBkx1poyzqA57+gxdkPocGZUqx
	vEdL18qMsjDE97BkDVzgS/+5N9FQlZkf954A1vYf5UpEPPU2wan9sjnRjddzGW2JxuOUjBQvpuq
	Hrimp/i6eD8qLFtFUOMmAHMmA8w7iAcEDbULv/KA6o7LeB4fFqgsIr0Q8kJ8flHEX16gv/WGDAr
	tZqEEt4NMSPXNOis=
X-Received: by 2002:a05:6a21:329a:b0:2ae:fefc:feaf with SMTP id adf61e73a8af0-2e7c4ea142emr1577365637.12.1758756910795;
        Wed, 24 Sep 2025 16:35:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZshf7magBR8c6L1yQi+3Wkf6pFAYDU/U6kxJathQw18FK67RwzHeL0RkuK2ImFKF5YafX3Q==
X-Received: by 2002:a05:6a21:329a:b0:2ae:fefc:feaf with SMTP id adf61e73a8af0-2e7c4ea142emr1577326637.12.1758756910358;
        Wed, 24 Sep 2025 16:35:10 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e9a9sm212379b3a.15.2025.09.24.16.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:35:09 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:34:55 -0700
Subject: [PATCH 2/4] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31
 eUSB2 PHY for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-usb-v1-2-48bf9fbcc546@oss.qualcomm.com>
References: <20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com>
In-Reply-To: <20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Ronak Vijay Raheja <ronak.raheja@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756905; l=1111;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=g9oeeGr6I8KdbWoQAM9xUpSM8MuOeurLB0TLJr9UVOc=;
 b=85EyRAKxKUztOphPzLmjV/sEJUN9oi+oN9pXyNnRzVKuupm4S6iFFK+XVfMTvbawTRA4GtMZe
 iKaSU/Ob6tgDp/lR1g811dG0qbmiFrzcpd6WVdHA53Y8w3/EQfJSe6c
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: PBWwxJSibQdFTojmDVTWsRwsb5QjjoKa
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d48033 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JlprKJ-Wy1uuo2cOBb8A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfXxTmi8UKDIvHG
 67txLFXWqg/8ybqslCTmx2IM11Ytai7fmNE5a45bZM4C6fUrln6QrMOa6vVAp11KFgjhHtKUdUh
 0ZVazUIE5KisVYoW9QxF5L28CTIqrDO1xIkJpp7QsDQzZN9RFojjci/pqeU4N/rgqGdbPZZ51Xr
 DHPQ0xf4Wwya/oaMnLl6Njjk5LUdGuVS5YLV25pneIrvIvvpHiO8Py6/5NRnL11i895OxPXh6c1
 K0JfahG0xdjudSem+XTd1uphUPTooDGHqD95XeDvzrsLJkRoA2KqpvCOB15zI8Bkff7BS6D9Ir7
 hC1O6WkS7oyjT9JXQEMkT+sAX00K6NkA6Axy5VwGwBpMID5tUjF42nDBhGx1JfPIfpymKraV5BQ
 AcGtA9tk
X-Proofpoint-ORIG-GUID: PBWwxJSibQdFTojmDVTWsRwsb5QjjoKa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

From: Ronak Vijay Raheja <ronak.raheja@oss.qualcomm.com>

Document M31 eUSB2 PHY for Kaanapali which handles the USB2 path. Use
fallback to indicate the compatibility of the M31 eUSB2 PHY on the
Kaanapali with that on the SM8750.

Signed-off-by: Ronak Vijay Raheja <ronak.raheja@oss.qualcomm.com>
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


