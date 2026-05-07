Return-Path: <linux-arm-msm+bounces-106237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBENFbYl/GkWMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 07:40:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5BC4E329A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 07:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2BA830221CC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 05:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17A5330337;
	Thu,  7 May 2026 05:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8+IG58N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8MP5Pnn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1D130BF69
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 05:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778132342; cv=none; b=j/KCsdfPYVU2XTPPyJ1h/2YRUjsk3uWowWBJQoS/05Z5Y1+JjkOqPMcLDRWzfdgARkCC1lnzpPLSpEWwpznNSvw61g1oCGYNYopqbUqNg7TzSlvXnCJxI60vwvj4PVvEDWjuQj0Vz6MDjbZoxMKn3Md1Oj7LOBoffEjJM6oP8Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778132342; c=relaxed/simple;
	bh=lyO+hk8kt2i0G/vKlS7Khc05+qw6hrcZ6upbhob8yAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PLjKWuUNeV+B1FpG+txco8qqG5+4URISLHruEpw2fxkrCauoaqg08XO51sib/KVRjL4gMpUpg6+g/X21SCdgobi2vnlXa/+uK0JHiWEdkhFptGB6ZhV6LeskNm5QlOKc3tWfrMdQ5vwCtRUIFzhX/12SVT0FQBK+VXep/1Jk8Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8+IG58N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8MP5Pnn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473eRCC026468
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 05:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=; b=X8+IG58NqrBTCH22
	tHYBVMwUvFedaBdkj+jPp2A6Z5VSTbEXNAjRhLofOI8/DNs02laf9dYtPXHgwAvv
	M5WJV8sAdFwKWi7xxM3c4MQDoqPTO1X7cmv8m/qMAflSEL2gziOkj4kQRqgWu4/G
	ibsuSNAW6NnK9Yd6FdS6+nC0/u780+ik+KZGXOitv81kuK2j7aKuJvcFx8BxH+w+
	ZGXBjVYBcbwPoQJx13pXg6d0zXy39NPf1MODDHVvTGBKDMA/IX598RxQ7qzh75Ea
	ZgmKteF0+Mi0xhjwwJShi0a97KPnsc8ioT+d0TQVClfvcLOZSuhWdMiCrBANAwW0
	FKdEJA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t0ay4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 05:39:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83603145987so311708b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 22:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778132339; x=1778737139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=;
        b=J8MP5PnnUJxn3pNcaOu7onxfxXU6U7E9GD9GL9YYeJTcpjhkmm9GV+6tocS5g5yYIZ
         tw5ZQHwcl3KF5CSpQjEQcQ6xfMvaIK7uM5qamgOgtJW6YUXJd3ShoTd8JQQ9HRNOaZyV
         E+a7Ssf0pmS7QnWddHJJDn+moc5cfUaPCRA0kd2EYhugplrMwLMic93sfjJD63Q7IQNq
         YWE+9DQEatwnbXC8CB0bKlvjtgmMtwdzwmqfQHPo8nP9GaTLWvR8Cc8Ygk+R6uX2G1mD
         s0KwCqjZPLfzUUMBfjnot1lDji+Tc855U+1oel/X8NSKoSL3rzLi574EBF0BChSDLipl
         rN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778132339; x=1778737139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ERo4fxz8ldkSEDWEd1ES1kCT2KMTO3lKMr7TdTf8xA=;
        b=DWkfvhoHkAQFZJ6TLWJnL0QoROV0V01ziyEnOSmO8WjzAXVlx4yRucx/bK15llBgU0
         sHczukDiPbtOIv4ouJX3J6vUCQrZdhEEHwFohig0RAEkdzHC5oaMT8eVcQ32fg2npwn2
         Jt+w+iCqLVZwj4kHNixzpXeXhU69ZrlNW9JzGnkVexDtaRRQq5Lz/GuwNz2AuVc5u8u0
         VmDBQDYQ6nCmfZ7Nx1KI6HMK+3hf5x6z4fnidIfgq3DYdEeBlo1GKritui42ya5U1ef1
         0QtbtUjVuLTmQVreAx9GCqnogp0YSUaXcNyh9Zcybm8vchzDMwAFJQezQYSWEM54ygU2
         H8DQ==
X-Gm-Message-State: AOJu0Yxxmg19tAnMasF2MsHqtj/YU2PaRNL8v+u6iJvbaUEEVccf1NuB
	FXIQ7R8vNPSyjCepX1hDNQwdcYxLROtTYNQCyHLs2CyTDygZrfXELptlw/pEunsXhGi37KZS4v5
	9iO68oEoodjp2o30R3dhqFbD1KLn/Q8xpTel3IohMPL/o0VzjMETHl8/EJ1K1Eh9AYLeB
X-Gm-Gg: AeBDies3orBG7ddT/CLb3V+FIwn083q0xYaf5TRunsaNrBcaX2uind+o3iIaTrz2CL6
	j8dOrirf4//9YNdhJkl2TfUlsS5QqMlbQozLqKMfvdKY3aRrHZlMBXtFrz5TGnBiFrr2ZZGk7UB
	OM6E1qkvrMcpC+AeMO9XKRyDYiZmQKeNL9PHZ+DbKLeY5KuoZKDQ9bksypG0oK11ml+fw/s2RGm
	Wqel+cvb7xm76xoyFH48W6SA53rkD7pzkSj/nGYxqUHdgj+d9XNY1D5T/5lF6hdnxV895E+Ztar
	ZaONmk3w74FxCMLmBHKRl/I9ttQN/l5uo8n9pOvwzpRDZ3eYMI8u5LlNIMtbTATkYtDSWTfNEjz
	0T0poARtzvHLAuJe9R/3NXV4EeffUzIhSgT+cKtq1eS3JaAtFuelDJweWdcj+h+I=
X-Received: by 2002:a05:6a00:a381:b0:81e:ef16:b288 with SMTP id d2e1a72fcca58-83a5c0c51b3mr6243959b3a.22.1778132339364;
        Wed, 06 May 2026 22:38:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:a381:b0:81e:ef16:b288 with SMTP id d2e1a72fcca58-83a5c0c51b3mr6243923b3a.22.1778132338834;
        Wed, 06 May 2026 22:38:58 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563ac51sm7389962b3a.2.2026.05.06.22.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:38:58 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 07 May 2026 11:08:27 +0530
Subject: [PATCH v5 2/6] dt-bindings: clock: qcom: Add X1P42100 camera clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-purwa-videocc-camcc-v5-2-fc3af4130282@oss.qualcomm.com>
References: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
In-Reply-To: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fc2574 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-2Qx4yxcNGLJKJli3vsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: GIxzhYZGw6HjmRm7uIe98Hx6z_0SeApn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1MiBTYWx0ZWRfXxp7eM4JHaRui
 vBPW+C8ssG807XIl6Us13vxZAWZXWL3Suu4wpfVIppMF8dBzCRMnXBWxlMfc7BBkUcvCvkM5p2K
 MCNnNg3LV+zQpPdPtbmWmDC3PnSLzAsQHLmNoVawuUx/p/RhYQfIieuBkDIW6Xq/SeJGtd2rRj4
 qttFV4Cgkz5NNCeNPwVgvE0DyOxHl3Po+auN7J0Q7bJAc3MK7eJYFyAxF8GAN955OCtPPfxm8+z
 vlSHJ9P53y6xfdupxMBUiKE0CeNoXOQ+WmLnHAKX8nh0ous/ZxeXDDpB+/lIogebBBmE9bSD8dS
 GlJHXi38vxMCjVcAiegF3o7Blc6D/T4C0lRr5N/XnNHR0Uh/96PE0Mr/1HdF59+5jEPuQNPXfeA
 MgE9QK5p+KxzRl3UK0UphxtsYChI9aoeQaC0eJOZcCSrgzWwC9Kf5lYmEJCd3GXtuc+n9zhE7JR
 j0aUm25ss4H/oMJu5Qg==
X-Proofpoint-GUID: GIxzhYZGw6HjmRm7uIe98Hx6z_0SeApn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070052
X-Rspamd-Queue-Id: EE5BC4E329A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106237-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add X1P42100 camera clock controller support and clock bindings
for camera QDSS debug clocks which are applicable for both X1E80100
and X1P42100 platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml | 1 +
 include/dt-bindings/clock/qcom,x1e80100-camcc.h                  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index 938a2f1ff3fca899b5708101df7f8aa07e943336..b28614186cc098268ab0d8c32b21d9dd9508c9f9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -23,6 +23,7 @@ properties:
   compatible:
     enum:
       - qcom,x1e80100-camcc
+      - qcom,x1p42100-camcc
 
   reg:
     maxItems: 1
diff --git a/include/dt-bindings/clock/qcom,x1e80100-camcc.h b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
index d72fdfb06a7c716ed2ec376e061e4f0ca35f42c5..06c316022fb0d26ec6243b28477564d97f228c8e 100644
--- a/include/dt-bindings/clock/qcom,x1e80100-camcc.h
+++ b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
@@ -115,6 +115,9 @@
 #define CAM_CC_SLEEP_CLK_SRC					105
 #define CAM_CC_SLOW_AHB_CLK_SRC					106
 #define CAM_CC_XO_CLK_SRC					107
+#define CAM_CC_QDSS_DEBUG_CLK					108
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				109
+#define CAM_CC_QDSS_DEBUG_XO_CLK				110
 
 /* CAM_CC power domains */
 #define CAM_CC_BPS_GDSC						0

-- 
2.34.1


