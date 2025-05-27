Return-Path: <linux-arm-msm+bounces-59625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93741AC5BE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 23:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 094A49E1DEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 21:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33411215046;
	Tue, 27 May 2025 21:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEmTkq5A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9302F21420A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379902; cv=none; b=FK8g65a84XY2qqlP1prHOTGfNc6iCiydD1vdAiQPx6cYRxy4V/ObFGe2KcsRWJpvJst4w69/JaRwzBFgvsPxlXyemHrzdAgWiSUJxRnNzYAABW+yuGARSxYMyC22tKdOF2ZF/mUcnVeOAy5APA0GTfOi7vH2SGzt7zH6rEmSfpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379902; c=relaxed/simple;
	bh=NhOsYBi6tADTMUAiHJ0Qk3HAGnZPId0WGmI4bIdXuV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VoGJQoV2xZdebjaKDtCidN3Q2OdRY8gZ1FOJe8RP8RaatUQi89nJkqCzrZIFiQDMeIgg0R+2dEeA1q4hWpd0jmBgCeEJBZ7SHN68d6LwQfPpcxI1evJWmIbeiLjTkmf1Yg5j7PjwY6lJkeYcB6rfv/9vetP4HcnwP9a7kf5jU4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEmTkq5A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RJl7Gj030369
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8gIhfclnLH073VsLY1ttHA/tXRnGUkM9HdwYW3xYCyA=; b=FEmTkq5ApBPdiyy7
	fYfR93tebQ/gtSyFOXu9QDIhyhgfbwvc6f4hTt2Wm6kIecV/JYbRXGycx+Eh6suM
	MHaef/GAhoUyd3z7Fy0l09g4yLPwaZeGfU3zp+JLI/vyh+pu27QRoN0ckzPPByNO
	mWw2yZieD6yxPQLqZ72AHmDkq8Si6nEfvWhZnsZSGu4IKJlx80icxvPhkdKJjMmf
	C+P0znTmdcovkywfsnT2Mplic/KYKztLXEcdV2PtITKXgAiZ6t90wZwfftUH1X3I
	1IF0WFfn1k0J+B2ZMR1tBNc+drLGFYDwYLKETg+XwARFFsZnGWMoJ6Dns8LjlR1W
	ttVgmA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66wgf4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:04:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74620e98ec8so201001b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 14:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379898; x=1748984698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gIhfclnLH073VsLY1ttHA/tXRnGUkM9HdwYW3xYCyA=;
        b=AwCjj5RDev/si0pkqay+h3FLJ/nQIkXxVWqiX7WCfCf25FabsJSjyoHpeV/CHpUtUw
         n20ESzUHhojl79I5NqwsLatroRzipRT9E3rHwI455nD3wXt2xvLAw/8w6KfieU5W88XF
         Osung8YW3Dq+ouMYQwDCgaAPdW46vA5xj/gb+1p15Z1E0ts4gQqIbBkq2I2EO+2U8i/e
         77AyGgo5o8GImAmG+yDXGNpBkIHLsz4U+3D2XuoUVF8u+SNtH0+/J0bACg26xiRvy5/Z
         +8Gye71nKRbUxaJV05CF7BSKLT9pZ+S399AIdxlbadgKPx1TDSTae5tPB9RMaO1IJ3ch
         1/XA==
X-Gm-Message-State: AOJu0YyBCLa55LKZh/WE/gZerti318r/aQrqPclBabHl4JQeBVdOi0Tf
	RddOr7VZbBGBtpDg5+0jSfJO0rnHpCqef8I01ixmTEfgafDN8W/6Bajjvaz4mkT5GdCu3brpe5n
	D5ybAHc+Aol56XeJfoLDGo00cr8LrXLwzSeye6ialrV7hVhkiH4VsAcoflet3H/VRJ6Xx
X-Gm-Gg: ASbGncvYhhP4v2xDWjfatGbqZrFhPuvTMrhZc40vVCA704234QN5UODDiwZMg1fRHGp
	XKhqwHYIowOxfbhSdN+a7jZnDyQyVZMWhMNLB6cE7uxbUD4qWnqhgMtE7aoV7wX0V6i6yy5dKUk
	1qFRtN56/6kVu0a6i5txnmVGRNJP5fqsY52VKMWlp35BT2gkWubJQLy5vBel/oT21Y+/6oYYrpY
	n5ift1ZCCDsUCHfqo8ecyEfTWjFAj9E7zprl041yBJAg/sz1qhLz+89OFhCLwd+hWvBVXGxVkUy
	YnRea9wn7rPiPUhqLlG5oWKyXw91mIqPJYwmr9mXFKNEuP2BuyTExJDtWn48eT4BoKY=
X-Received: by 2002:a05:6a00:3ccd:b0:736:4d05:2e35 with SMTP id d2e1a72fcca58-7462eae8737mr2671743b3a.3.1748379898173;
        Tue, 27 May 2025 14:04:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErVuSX8VnhDC5c80QonelHr5ry9GAhDcphlE+t5DRrIAcd4JLsqfnIcR34CNcLszXepePuHg==
X-Received: by 2002:a05:6a00:3ccd:b0:736:4d05:2e35 with SMTP id d2e1a72fcca58-7462eae8737mr2671698b3a.3.1748379897734;
        Tue, 27 May 2025 14:04:57 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:04:57 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:39 -0700
Subject: [PATCH v6 03/10] dt-bindings: usb: qcom,dwc3: Correct the SM8750
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-3-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=1199;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=NhOsYBi6tADTMUAiHJ0Qk3HAGnZPId0WGmI4bIdXuV8=;
 b=lobSYcFGVwh8sfpUcLjkgbtPofAxzVDKJAfkDY2FUYjTHx3YXT1XBfydR+LmUIt7NbMLEs17M
 4Jec41PnZl5CSCqn6HniNcEqQYvBtscZOhyooMC3wXeStWPigeWIgmT
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=683628fb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qiVRAF7mJj4RLuWAUSQA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: QWNrASCPnGErF4cyiUDIjB5cqdWQwpKv
X-Proofpoint-GUID: QWNrASCPnGErF4cyiUDIjB5cqdWQwpKv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfX/mSyOaoB0u0x
 9hh9JB8B+cWW/fF1dIx9liLn/L2496gGyTATH1AsF8NoERz2GTXzfG1Zb+FqYJkPGTGrM+xeq5W
 /H9RddwhTnZuQiA+DupQBOBaINYLuXXscWVPQLxDhN9QGG5JvRwLUsapWIalrk9A3gYmgU+HzCE
 YfjqRs4sjYRn3VkdJIpp0SZ8PlQQPC6GgmLVOfB6PwvZVHS4nid/6kRNBGm62RpjsiRLdfipPkF
 UITIaZEYdBZaYhR1dyZ4HZoZYBCTYfL9PnosfkGf0l5wUGlN0JEp4KGK2xSzB4kTI81nnMJtUyN
 YRD0XSEBCUAmw0qHOOhsy1CEybCOiP4UvOv5FWBAK9YzdhJWPXMzcoR/hdn/lUfIU2/qqYKYZki
 py1tHfActFyV9DW+6gU6umgd46SSj33Jm1+bnd9VLSa0WP6DYvSLg71/xc1v4hKuBAnCM++m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=495 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270178

SM8750 does not require an XO clock in the dt as it is the
parent of the TCSR refclk_src, so move the compatible to a section
where the XO clock is not required.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index a792434c59db2e6ba2b9b3b8498ca43f0f8d1ec4..298b1472ccbc4cfeb04927da29ea40b9883d03eb 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -227,6 +227,7 @@ allOf:
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
               - qcom,sm6350-dwc3
+              - qcom,sm8750-dwc3
     then:
       properties:
         clocks:
@@ -366,7 +367,6 @@ allOf:
               - qcom,sm8450-dwc3
               - qcom,sm8550-dwc3
               - qcom,sm8650-dwc3
-              - qcom,sm8750-dwc3
     then:
       properties:
         clocks:

-- 
2.48.1


