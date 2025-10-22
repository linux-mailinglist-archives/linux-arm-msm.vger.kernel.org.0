Return-Path: <linux-arm-msm+bounces-78273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B26BFA55C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BA097504E12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 06:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96612E11AA;
	Wed, 22 Oct 2025 06:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="acozxuFW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201722F3621
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761115839; cv=none; b=evpGo3ubt0DWNVsEUtnZrn7nCn1hdmZiT/lzm2iK1Syf+2UqQwZ1EKuerxqwHM5oRRpEn32ICeEFudEx08sI19UtWa6CV/kXWJEIIoeuLoQt7LFdwng749F6N4WTgmz3o86bCxQgSVfS0f6qEJcImy+9QC+4fmIefm6HVN6FYWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761115839; c=relaxed/simple;
	bh=R2uTwpKHPZ20EpsMj68tM8tKyulxK82YeGkwd7bj4Bg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qqI9L89oHZTYvozg4452sY6B6B+4dJjF+osGjEksFh8EerFHZU+lOw5tRyQAhCqUL2ck34sqjjtGEKRMMkdfH4B+09qxp15QdJICaRj77Sfih/1Dk/3II8+13PLcDMhWJL15djqb3y2s+m0+VecPEwJ8WLxA9hoWjE6ygJ8yyeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=acozxuFW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LKexHH010315
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aqqkie38Io4hu0mb64dIZJD1IDcsSkJekF9bBtAk5ic=; b=acozxuFWNNyrZicH
	stc8JyLtyz6HSKaKUMQ0+36x/4J6OrwZlVc63q5PS7sCATZgF8jc3N5F8qjl6yk1
	SiPNiuWCcSbCNrmyvxaAU8SJb0znn6R5KPX5WgxNAOrY8Jslxhw5V9zF9c4/64L7
	28Ea8XnPbY8najId7WF1G9ZgzmsLdbC5NHLh3qoGgjvWxEHtbh2WeVXmBQ3cVp2R
	v+vjTjV5c+5L81VS2L9p1EYgLBIgBEONtKGeRFnroMu1UH7oO/mGqxjJ4WQeLbyZ
	Pf2lwwLeqHfgnmn9AV9T8Cn6gEAZvW62YZtk75069AjGsTTEf6bCYhDQP4/NxNDT
	SjnStw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0hdg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:50:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eaa47c7c8so5151836a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761115835; x=1761720635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aqqkie38Io4hu0mb64dIZJD1IDcsSkJekF9bBtAk5ic=;
        b=r+j4dpWB/xXX+uXHKn7J1FHdB3DllihhVDhsGEiGWKDbhJtA+eNDJv7kbbKI6cjz6V
         ycMlx5wZvfykK7Scdl4Jf1ALSBx4owR1q+ih7mRguPIhOA5Nryr1rCQ90PM58PNBzQx5
         UPXC2pEV38Nv7YKmB/J6D2tKLERXA3OZgChtS9j6OQKuwBjhkXaaWJcRkGuPJ9vrZzHb
         Eun1iZtvVO6bZi4J9A1EBbYCjDN3jFcJlIRSPyoS6RsEjtLH0P8VnBuKhlaCfxfQHbzR
         5zVMETydXcnCpCH3k1RF3nG+CMVZ+zJZR/PtJ+ujQrVDLKVl/WGUUk6gT88pU8vvoy60
         k58w==
X-Forwarded-Encrypted: i=1; AJvYcCX9Sp8vX1pKTy+Q8ubzjlWEh2821GXMjntTRF9YQ3locRdXBVF3aFeNCFw2ubV00FUS6UgCgjuGFXn9eoIh@vger.kernel.org
X-Gm-Message-State: AOJu0YzF8ldINrUJ2R6thVJ4ogJCmTBktgsxXU/O9KuO5VTJFQRfQKGH
	hXAdB41uwlkSIh27cyawKhNXgI8Kkx+aEzZ42xsM/qrU+EgZ8gj6to2E837C5PzVV+MVvUj0D8f
	Hy2Zoajlbq1i6OkBt3c1oNJ/dJtWiq8Jbt1a9JDHXCzRDtFoh4aWUT0CtMx5uiR6vkZzX
X-Gm-Gg: ASbGncsA6XJh6DF0+M5EQdcSddHKglRu2m9nnpyGS95l6WtFb8+dZZCj70h5TWBebaL
	Ii/YqyCdWK86zeC6xXGvUTGjDJO6xSLw1+G8aIX0Rdk9imk/0t1aj8l60x4VFimj+OYnJHZw97H
	7+BjMRGabH5eMJydltBtguxkmTOT/2zBn+YVGYTp/M5Jr2tSWIJOLGZU3sMcislWu63a3THwF9s
	kBGToQVkhuxB61AzW3B4uVACsd5Mp91sna93cgYHG+KsoNo1IMcgUobVHPfAEcSGkhNvZatg5z5
	nm1RRhrsJAkNY8YC/hpfUdWaN+rv9v+2GwrF6U99d77rUX/4sw6igegRb8spHzp9Yp9Nvlz8nam
	QiotM1m1gOYzqOuQInivMIypcVeVBQU/XKRt2FYqmV0NqLKDEaA==
X-Received: by 2002:a17:90b:28c5:b0:32b:6cf2:a2cf with SMTP id 98e67ed59e1d1-33bcf8934ffmr22879434a91.14.1761115834825;
        Tue, 21 Oct 2025 23:50:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1MCPo5x+mW04/fDDzB+zbN3zM7FjsI1S5Bd83h/Ux6zbFYXkZe+R+NWCCsh/3pGGknR+VEA==
X-Received: by 2002:a17:90b:28c5:b0:32b:6cf2:a2cf with SMTP id 98e67ed59e1d1-33bcf8934ffmr22879401a91.14.1761115834395;
        Tue, 21 Oct 2025 23:50:34 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223e334fsm1560285a91.8.2025.10.21.23.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:50:34 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 23:50:29 -0700
Subject: [PATCH v2 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Kaanapali
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-knp-usb-v2-3-a2809fffcfab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761115829; l=1499;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=UA20oYIe2aKRt+hHDRY08ujyC1lJkXJo8K94H9otar0=;
 b=3AVv0Hfux1vndXJGtkEvrd/sB7HaosEIWlJIlOD3TbcH42qfehFrdp6qrGC0K1hG9Ctaz8zaO
 Q70neP76ZRYCGuBw0YFNtxN4BJd4ySveUfc6Iiw+esY64N3KZlI9G6N
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX555CE8ro7+cm
 WxJWKr7Xg/8rwrmLNE/bJb/N6gpdmlPzf/lcbXVufwUSMFocVloi5u65ycmfH1tpCOE7NQIJZ+Q
 A0rj2k/EMnHgc6eXj4T6YlS6WwMGFMyvO4HUgdZGrF485X5d/ySWbCbo1JNBSNTM64tQJlKbxwe
 Ru0lJ6YOPAHSrU3JUrNaqTshEbSlzt8jQmpHDjst+7m0tNCZnmLehhi4Zgo48sfZdrdHI9q9UV1
 TZ7xB46Gi7Wkcvgps1axBAZl+VFxjnaTwERfw4yof2s2c7XuU8A3SR3vxcMrBMDMT3WtZyKs6dC
 L1ke9mjeBoj+TFuLGHB/a+hhuufTKl05e4YiAX7IN6/HM+HgR6B3J+rb8zdhzj8ZQ5ApmVhRQqx
 WunCJCWGPKfyOkYDRcq0NlLhyttUxw==
X-Proofpoint-ORIG-GUID: VPLllkv-qZt5Wbw8ybT3ervvXP11p7NU
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f87ebc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=cFzXH3D4Jfz4SSrHOhAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: VPLllkv-qZt5Wbw8ybT3ervvXP11p7NU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Kaanapali uses a single-node USB controller architecture with the Synopsys
DWC3 controller. Add this to the compatibles list to utilize the DWC3 QCOM
and DWC3 core framework.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index d49a58d5478f..8d1ef81b3962 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,ipq8064-dwc3
           - qcom,ipq8074-dwc3
           - qcom,ipq9574-dwc3
+          - qcom,kaanapali-dwc3
           - qcom,milos-dwc3
           - qcom,msm8953-dwc3
           - qcom,msm8994-dwc3
@@ -200,6 +201,7 @@ allOf:
           contains:
             enum:
               - qcom,ipq9574-dwc3
+              - qcom,kaanapali-dwc3
               - qcom,msm8953-dwc3
               - qcom,msm8996-dwc3
               - qcom,msm8998-dwc3
@@ -479,6 +481,7 @@ allOf:
             enum:
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
+              - qcom,kaanapali-dwc3
               - qcom,msm8994-dwc3
               - qcom,qcs615-dwc3
               - qcom,qcs8300-dwc3

-- 
2.25.1


