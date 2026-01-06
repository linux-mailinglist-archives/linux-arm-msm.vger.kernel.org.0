Return-Path: <linux-arm-msm+bounces-87746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 054EFCFAAA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 20:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFC6A325AF99
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 18:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA622E0914;
	Tue,  6 Jan 2026 18:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mu8cq5g6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzVOxAJ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928992C21E6
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 18:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767725426; cv=none; b=Lt2y0UTrJ50zccnSc96o03CsuVzoybV8idEeYPGOUzcLr32N/tGZJOyqz1aFUIlm5rCJ7sFPW2u9kkkv7dEV7Y2Pdoocab5Rc4yDHZl+O1p1c4fmCBTmpqEtL1NXyzUR31BA5BO/m10oh7x1+HB3HE3KmunMYeWe7H5r8934fxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767725426; c=relaxed/simple;
	bh=WJK8v+ikfFWQ8X+AXUePFUhOsqrjvPa6LQ6zJRngW8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mmu6l21hlUbRWbOFXTeOVYPy+UmcWt5wlnrCcL1rjAdP17it0TaXvtPuggZ7X/pg58IKyvivrAI56D3Q+udwdLgoq+H1Wlnrc/YuziaHke6DMlqYOCuko5OSRPa4tqZdPntrd2YC2xe68jh7Lh99BbRWUvSW6wjF+CQQbIVFlyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mu8cq5g6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzVOxAJ6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606H1XAj822839
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 18:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oxGyO55qREF
	giCeWyEmjYD1S47olcVgOHj5KlI5qppA=; b=mu8cq5g6eYg3Ehw0g+8s7ZTgLqi
	+eOuCsOPXXiDZulckfU8aL5v+J19pnttHgskgbCNYqBDHriLP1NaRfMTKqhNPMBq
	I/3T8q2FpACEtonTm+TPv+CvU+N21d9DeWi56esvxbI6tef32odmZrt/OZW8/MJs
	E6PqvyfFABhW9diggl3j+vhtDY5e9AqD/lKGpLU9lQwiKPuy7k+cnY9lwT09D/d/
	otUoko1uZMiB/cX/hStrStGzsaEdATp7PQ84uts1/CM7/jIdStlMnVDn2MsXCzVH
	UhYdoj+h9YxrS7zpchSrHi7xoZ9SJo2COanazgZXQGFFZC5ioW+jG5vdK9w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh6e80bkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 18:50:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edad69b4e8so2626501cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 10:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767725423; x=1768330223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxGyO55qREFgiCeWyEmjYD1S47olcVgOHj5KlI5qppA=;
        b=TzVOxAJ69rALZGVEKDxOz41pOfPPOCOfVk6xiN9/6Kkt8uBXYSTiFl/mUp9I1m0BiX
         Rqxl73Dr2ALYRQ9bh4mx6V19/AYq4pZtjPoWy9DIq1EWLwNjoiKszjlQxj6HfhgNRzmc
         bYhKR+x21hnGLKCiBdpj/mggMPrWLFO+OAiRZfiIp3EZalMrAyJ8vFMVV3baR3iZiNR6
         e+g0eIAleDfMxPq/Qkau/QBtLkIq19Exl6t+n7RfJQnclPQELaGpEqfgP8K2Nxk1LE7h
         7kA76Hqy9UDzZS5zSttLeEaTtp7lcz1DlIKTI3X0QLKV4TC7uu6pGcf4BUumvsIluykf
         XdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767725423; x=1768330223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oxGyO55qREFgiCeWyEmjYD1S47olcVgOHj5KlI5qppA=;
        b=RWRXxlWMjT7Tqdaj++YspSbSK3g0Ax/ILQfh0QbyC/kStKHzfYEiJo72qCnhJQYxRU
         N7hvReehh8O1uI3NELvyb7E+vtRcLMxsU/BXsVDCqcrYSzg3EDUDMJ/Qo03ZOd+K+9la
         OL/GrgxJCN6Nw8q+K5CN0EttdQqQc1PJQsHlirDnZYkX5MyJamvcxcv6mW/gTr3zA1FK
         2cuPgBByLOxLySWwn9MLQkp1ql1hE8exgNpYribcDm58uSrJ/X5roXiaKWSpMKoeC8d9
         ZpJbQCyg4Mhlfc/5aCq48f2EJ8hLTu8r1df/q69LqvAhv3tJTmg+3LYlZtV07/GW2MXE
         f9uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOaGn2Cmp3we1cFdUIWitxJA3e7lHjPM/5rBikP9WFYLTCnFpt3y2m04IVHxB+CnpfMQCF384V2+MQ5dli@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8X7NvJj0t58V0L/WdsOYaVRwKMABkY5Ctirb5qkchYovhXAtF
	breT5LG+SDmFh0rEr1aodHvusdgC1r2aW6PKysnAvfYviLqVBWpnSeEjmDgeMn38sZe1PqCjGUQ
	SMDfAodipBx5HCQqrajKb+pKkXeABn6ZvrGCbsYjQXc/mrfwyh0yTZKY3ttCJYIhGQKEk
X-Gm-Gg: AY/fxX7CzwuI3p/WeSlzmUO8CYb2zWXmpePcEyI4pLHWDuYkTw8rsrEQPyhc5goGHee
	PaZX85amMcpuO7AQgx9EwtiQPYf+PAIvoCtP1grU6etp8mNCECDdeUqZH9xLln1DSFzLOjc6TXK
	YVzryJmAy0Slc6Ci8s2rG8rz0jsWi6wUdpsnSOTj+fRZWtptHGxNV9qdAcVxkqBRnoiehBIiNS6
	VoN8hxQiMOEz08+MmiBh63A+ymKZdKKZcs+bBt7F5FkYji5DwnDMXhsfML0hZ4Nb0fsD4N7EgPj
	NFPRvKtZIf3iKkZDUU8QoMqTjKLycNTXro3eTAnuEwmsMsonZ+SyiEB3QS+P5rfYa2kTT2kXJaJ
	vzm43FxfEBg7jJD7LLetZhjrT0w==
X-Received: by 2002:ac8:5748:0:b0:4f3:5112:e379 with SMTP id d75a77b69052e-4ffa8418e5amr50859291cf.15.1767725422917;
        Tue, 06 Jan 2026 10:50:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4Y92IeccfpitSC+enhXDLNOmsyKVl7flVd3QYettphmAz61z9ta2Z40Ms6/errATxK6D0gg==
X-Received: by 2002:ac8:5748:0:b0:4f3:5112:e379 with SMTP id d75a77b69052e-4ffa8418e5amr50858871cf.15.1767725422457;
        Tue, 06 Jan 2026 10:50:22 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be65197sm2885576a12.19.2026.01.06.10.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 10:50:21 -0800 (PST)
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
Subject: [PATCH 2/2] dt-bindings: usb: qcom,dwc3: Correct MSM8994 interrupts
Date: Tue,  6 Jan 2026 19:50:14 +0100
Message-ID: <20260106185012.19551-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260106185012.19551-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260106185012.19551-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2625; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=WJK8v+ikfFWQ8X+AXUePFUhOsqrjvPa6LQ6zJRngW8A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXVlnTeJ4EoXxUbvJWsyCmy7cKKvtS8Hmh7128
 zt3ysrs6QKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaV1ZZwAKCRDBN2bmhouD
 1yucEACZoVM+YW6qd4zQqB5dvpPXjA1DAL2M80hQJEsPNWq+YgVPrXzueR/Jk3L36nPk6bwcXZi
 CDEgWrkSTQ2wdLrI10r0WKk3yHpFIuUXeQex5Up/r4WYJiLZfOkP1MFB0Fa6dm4+qZ7YvX17zs4
 6KiOUboig6h+oCX97le4zj/MlUuQQ/V4pelKVhHLAnWr9WquxGjQGOoOHsWt/dJllTgLJBdkG57
 J8DZzDyPUPPNjPKSJMD+DpMCFwITI076a90Knsm+dF6IWyK8cnoRbQISDC4EU5Inbl9Md4+j/mb
 PxoorUx84vaqgWCjc6HIPLnY+Vx4YG5Gbpoin53uqKZxhaoTubCAo4jduOqUV9TTnAbqFLTynCc
 m6e9k/w/au07wFmfSc6bhJxBsLpD41P4B69xBKhS4RCKB0jDOZRW4qis/BssIMK2H5sP+k8no08
 /2UwOVHLT6l18QuwMsUPau2jmWJfxxZZkcfn2V4HP3obltPenW7WhXu2f73xvLGjEk9yXxxd4M4
 2VJI3ftH8E2i9Iese5RpOLuDmkeezOHsK6XI7mOT4k2l0KaW0Z4AUm/vogTG3VORDxX7mEr/zVL
 ajYBwbk1IRCL8z5WQuX/HVZBp4JGs5qyMppyl6cQSDekSWNS9gVKWcdMQT02uY7Dqcb86NJ37bS IZWB31tHRlmLFcQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE2MyBTYWx0ZWRfXw5QjPm/nS/8t
 JHy9l7XF5d4ZbDpwuPyzJJM//PGHK+qNsdIXT7oDuGSIlgwwT+i4N2HVeL7R1XVAPVWKA5Ah2l5
 a5JM3rJFkuDTF8Fr92bUBEfWGM2Vtb3pDxaO5fcAfkdxCjK65ASGrxUA9ECuREKtS1Al+HLwEYL
 oMXPeCDixUSVjFOa5qT/73T56Vb3FnYMasL9O7bX5cHjfo4hezQ0IDLA3qfcWfA9Zrnk2R4oCm/
 aVyrOtr8d4/FmcrrPlizzHkPP4G8p7TKUV2NAy8LxEgMlq/B7XViFg7BDDXX1B4fD27DGyOOsdW
 UYywMc3v5wASlixOxZqsBmD0pvl7hqsG+HgyGuI89RqJBTQTX+JqZwUm/2eAwl2tOW+yC1Bv3tz
 ApN3i5dWvpj/lSGcarTXMrrvT1R6FoFqgrBbdqQeVohX3XONECgeaK453RaESgOnnIIun94e7i0
 MEwTPScVG1BqK/OBrNg==
X-Authority-Analysis: v=2.4 cv=F45at6hN c=1 sm=1 tr=0 ts=695d596f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3SqsvWQJRDs5ZQVTcbUA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: nMtyp0vYTfWlB7790ycRMq7u8PPGSsiw
X-Proofpoint-GUID: nMtyp0vYTfWlB7790ycRMq7u8PPGSsiw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060163

According to the reference manual, MSM8994 does have QUSB2 PHY and does
not have DP/DM IRQs interrupts.  It is also logical it has the same
constraints as similar device: MSM8996.

This fixes dtbs_check warnings like:

  msm8994-sony-xperia-kitakami-karin.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:1: 'hs_phy_irq' was expected
  msm8994-sony-xperia-kitakami-karin.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:2: 'dp_hs_phy_irq' was expected
  msm8994-sony-xperia-kitakami-karin.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:3: 'dm_hs_phy_irq' was expected

Fixes: 53c6d854be4e ("dt-bindings: usb: dwc3: Clean up hs_phy_irq in binding")
Fixes: 6e762f7b8edc ("dt-bindings: usb: Introduce qcom,snps-dwc3")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml      | 2 +-
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 7d94b5f7d8d7..c7d76a96d0b4 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -429,6 +429,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,msm8994-dwc3
               - qcom,msm8996-dwc3
               - qcom,qcs404-dwc3
               - qcom,sdm660-dwc3
@@ -490,7 +491,6 @@ allOf:
             enum:
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
-              - qcom,msm8994-dwc3
               - qcom,qcs615-dwc3
               - qcom,qcs8300-dwc3
               - qcom,qdu1000-dwc3
diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 3073943c5964..7d784a648b7d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -442,6 +442,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,msm8994-dwc3
               - qcom,msm8996-dwc3
               - qcom,qcs404-dwc3
               - qcom,sdm660-dwc3
@@ -509,7 +510,6 @@ allOf:
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
-              - qcom,msm8994-dwc3
               - qcom,qcs615-dwc3
               - qcom,qcs8300-dwc3
               - qcom,qdu1000-dwc3
-- 
2.51.0


