Return-Path: <linux-arm-msm+bounces-85436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F0ACC61C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 06:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3D9C30275E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 05:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE12C2BEFE8;
	Wed, 17 Dec 2025 05:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9LMNVPu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hqGIe+6k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9392BDC0B
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 05:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765951020; cv=none; b=nFVGfRMEEb/Q10jKsCsMlBPg09FoRnHZhkQ0n0y+oPck/ZMGbjtzAg3BvnhRPk01srYdp4JMrF/yU0wvI+cnXm5dyca1ZVhjF2wri3woMcd1QR2gdOgxzzeOuKF/8rE2NnBwhe5OPXdREm7rYWX/RRw6vvjOQfOaFN3gMD7+g6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765951020; c=relaxed/simple;
	bh=s0d1jH2f3VMRCL+/f1XkC+Xw6Tz/+dFKkRWVEYfmkHM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CoRFvzwYAaT8/xUil4oU8+Z9M9zZjN2jMGPfv1MTfCkb6S7J4YrDiK7VU2aK9oQfp4cpw2XTpLufn08Bcg9fCCwsuekBD60Mb+SXhaisWAPv2Jyx6+DqPujAprx6g20iR/fcu0k1/y0xqV/WY9u0al7R1ISuZn7GgvfnCFIpp5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9LMNVPu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqGIe+6k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3FFKl870095
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 05:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a9UxuDpSBBh
	Fj82s3DAZF5Bxk9j3WnCIsxDpWHsFyaM=; b=f9LMNVPumLfWg0Qh3K6N6m8cBof
	3k6QWZy591iF6FUiSYgzWgDELsKDDYWe4IppT+pdHf+rkKkignCxzJ1lnF/j4fy+
	Jq84+mMz2IWzQMTcBNh+M2X+Fn4zCO1s94ex/CMw7FB7jkOtFjuW5mPo1gJw2dyH
	BrfU5AANC1HEKFHqXsPmOewV7ws0O6fPa1MoqsUaxP5BAc+yV+AGZNdggyQsPuUJ
	PShGRzLtYZyFl1yFPl7NrrUpWhPxjYJ59TRlvEnyUo+IuVEsbXF7ToONuyg593KD
	svmrKrrEN3W0+D3bZKvvfLR/mtXAgcuMq4hwQXcAFaTBQ+TE0VidscNpR0g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fj1s4qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 05:56:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bde2e654286so4958438a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 21:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765951018; x=1766555818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9UxuDpSBBhFj82s3DAZF5Bxk9j3WnCIsxDpWHsFyaM=;
        b=hqGIe+6ka9opw7Q10FmwWu7mhrwKjNsD7Bw6pOen/yZJWvOafgXDfUXfCv7pCS0CFJ
         qe8b9n0r2D2vQzfCWRKKHTo8Qd3Wv+ZyvcdPMdAm/JS18l57cHS8r7deCMKNntOb1AC9
         CSfBVzqkwlCa5WobAD9GzSH8MaDL+hUblVF8qcHGtMMYoDf8ZfJNtQsR9wuoM1tVFJaN
         mCXdCYlJXrWmdFkQNS7VkDkdI2PI8k5hI6/Edcv+hfeieDE3uC5s893YDcHWbdBMfMSf
         93hOsNMKczEvAfiLenYrppwVUlzoHCYxuHEsw6RXFsCXeUalElx5DmqBALIIcQuFbcmA
         IVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765951018; x=1766555818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a9UxuDpSBBhFj82s3DAZF5Bxk9j3WnCIsxDpWHsFyaM=;
        b=HAesqc7GtmWCADj3Y+3J9jWMxT0qKBdWfc+ic3Jj4S3lU7dKsXHZ88Sc/MACFeyMI7
         5SLjobaQ/Ag96v+zQCYueQDahDVjXYig4OKPvMfaAFCcT9/LQf4X/aOWtPaujnfMYZOS
         w5JaxPO0GkAVWkVnu2zxWD/AZC7v6zJL4eTHz5PbsqizjS+qBotC3s3Y6zIvfWBm/pwr
         jENM9MlohknTFuHBI22t+qLMADlWEMj/+RK/HIGy5daVWxjQsMgHAYhm44ohVBlwoUUR
         DMLAm+QIgErFAc/X7V4GfXCiukpqNjrKZnk9jZLO18j9eG7DV6sRwKZfg4M0toH2Xhx7
         I7zA==
X-Gm-Message-State: AOJu0Yy81Uo36cEQtkJoKZWsGtfbNkW8z2QGyySDW3TfUqapBLS3sP+A
	Zf3ysT+UqQwPuHjERDYq9jeYqOS1xeT66XiNnl5ameUu10N1qz+n+L7Y5n9ri5lQhAd9o96NnCd
	RV25zVQl/RIaZPRxVTrvkUliei9FxfRRE83zLYOCAte0fV8OUOcKbESuLVcM/vZ/pFxDf
X-Gm-Gg: AY/fxX4+jiZNz/qcjlSlwE0rhWRUOhe4Uscl9/NgdlwVCAhaiCQUqpaweMmH0/djZ6I
	any3Zs54SsfPN98M5XMfjfEsygigbvOw+i6trwvDikavHI277qQ0WQUejCx6ISmgjMUPaEI9tOk
	/VOsBdx5iVB1EEZfNEsP5+GzS6aSDlEkM2qIjI2e+t+Jf0jsRa6yVE8xYi3PfLtL+EhLeoJpMcQ
	ZR+OOv789DPavFBAKLlGU/21LfP0lmUapm2+UWJreg7SYD0J1zkqDyPOUYs6v+ZWYByYJnPMHjX
	E+dLayp/Er4FWXNmnfPeg5b0nDUp/BOd0cbQKKCPvy9jTbaHeqvWvJJCm2bhJ+Dok76mPg7E+ap
	/d+xbFo3koAJhnr03JTbqe/b4O6t1FaNwAk9TA2bOVjmzrIzOAgVRWUoFw1cQAV2mKcpBRKu+
X-Received: by 2002:a05:701a:ca88:b0:11b:65e:f2d with SMTP id a92af1059eb24-11f349a1c96mr10332157c88.10.1765951017642;
        Tue, 16 Dec 2025 21:56:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGR4N8Tn3gQPwaAp0z25nr4vcgJR6P2SnrgWg0nhpDhTez0BIjteWxL6dc4XcNxhfLB2/i3gA==
X-Received: by 2002:a05:701a:ca88:b0:11b:65e:f2d with SMTP id a92af1059eb24-11f349a1c96mr10332144c88.10.1765951017148;
        Tue, 16 Dec 2025 21:56:57 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e30497fsm60166484c88.15.2025.12.16.21.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 21:56:56 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add Kaanapali and Glymur compatibles
Date: Tue, 16 Dec 2025 21:56:54 -0800
Message-Id: <20251217055655.638594-2-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217055655.638594-1-anjelique.melendez@oss.qualcomm.com>
References: <20251217055655.638594-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA0NSBTYWx0ZWRfXxN+se4h/Q0Ji
 h9NDHeNGtrKAI51F7SD8I/3JjL5040ApqzqlRfIyJ1A6na8EB7OU55UAcdrsVfiWees+gCCRLkt
 btI7WjpcYFY7XnTqVvBlz55maCBrZ0F9Vj/5ZYto04AtRAEf29whWBWFVMtKMF0jztZKltC75qL
 kkCXWBRspPOG86UO+GPO+cmLaHKcqy73ewF9dTn08xniVj1BNA35TFeooze+3IKslXX+h7sNSPs
 P5Q85EwGsv0nFWzimWX1CNN/T0KEhqdz2VsAulGKhsVAfVXoM/RhoV8J6MWfwbZSmgiqrW7hRDn
 luvpLSwHTr54h+4R7Clx42FiZrvlbA4OeDeSyZ4ADkw1eC/E88LkaMSPzxywsIZSrD3osUe/+hT
 evDCYRLv1KKQXL3S3Eqr9FbEuaA4wA==
X-Proofpoint-ORIG-GUID: rfYsmCUHyjmM8-ukgWGUPC5jtYgbNxeR
X-Proofpoint-GUID: rfYsmCUHyjmM8-ukgWGUPC5jtYgbNxeR
X-Authority-Analysis: v=2.4 cv=edgwvrEH c=1 sm=1 tr=0 ts=6942462a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zDLr9CS1etw43qhiqJUA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170045

Kaanapali PMIC glink platforms support features exposed by the SM8550
PMIC glink interface. Document the Kaanpali compatible string to have
fallback on SM8550.

Glymur PMIC glink platforms support features exposed by SM8550,
X1E80100 and Kaanapali PMIC glink interfaces. Document the Glymur
compatible string to have fallbacks on SM8550, X1E80100 and Kaanapali.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml     | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 7085bf88afab..302b338e7012 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -37,12 +37,20 @@ properties:
           - const: qcom,pmic-glink
       - items:
           - enum:
+              - qcom,kaanapali-pmic-glink
               - qcom,milos-pmic-glink
               - qcom,sm8650-pmic-glink
               - qcom,sm8750-pmic-glink
               - qcom,x1e80100-pmic-glink
           - const: qcom,sm8550-pmic-glink
           - const: qcom,pmic-glink
+      - items:
+          - enum:
+              - qcom,glymur-pmic-glink
+          - const: qcom,kaanapali-pmic-glink
+          - const: qcom,x1e80100-pmic-glink
+          - const: qcom,sm8550-pmic-glink
+          - const: qcom,pmic-glink
 
   '#address-cells':
     const: 1
-- 
2.34.1


