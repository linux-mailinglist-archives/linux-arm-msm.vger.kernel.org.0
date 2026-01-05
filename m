Return-Path: <linux-arm-msm+bounces-87433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 154E5CF3DEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2E393145B57
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1600333A70F;
	Mon,  5 Jan 2026 13:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n8nccmDJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFMeIx2M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5585339B5B
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 13:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619402; cv=none; b=E2kKoPvAkYOf3idkLglQeYj51hfgb9BTKifspWQFWWNSLUKkts4jg+rm1Y/r/stDQfOYRSsXPYueB1qEMO/kb9RufwZ06Ks61pX3RvS2eEOQIlMb8FWpNkRdmHkVypT3+mO78XwPE6fKbsYmq4rd10QN9k+tKaSaFPn/1M6Yblk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619402; c=relaxed/simple;
	bh=fkI0IV5pKXD+Z8pE0/I4omqNa0GvsOuaX0Z626kXB7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BLazf+yLWwcAWC4EVsLI036pDP3LQH9JtoEfNVK63TJbQ5A79p/wtXpUBh0zmeu22mhUn0E81yJ28aFrTu4uA1K2BcL+4frKD8GxGwayOWmgkqaRU6D3+5TswbJ9EabhY0IkcYDVQC2JMKaNSmC1hSM+FKf8hLR5EbfChWMflIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n8nccmDJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFMeIx2M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058w62s593904
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 13:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QAPzsylvQAf0leJxcPm7SZsbOhaaSA1OJ2ImRJF3POY=; b=n8nccmDJ/JJz7aYf
	fUehwygErMt3Nosvx7DJzJvSz/99DHseo/mKYDB0w/QEYVTpFJzTpyzsgb5gRxpF
	+KHqpWhW7aNlCqfTo4l/iVLZcf0aJso/BegtqjItVWQR9906zpUoQ8XAFYMClIxu
	1x4xFt+/ubFPTHA4ImKEMQ7ceA/yMxiVHMiwdAwerdbuhHg0BQN8z2XDbaElBbRe
	AJKlt/Sb4qCjb7OJV9typvWgRX1J+sCQAOEzsqBmlZfhnvst1cvhTEUQWOiRvYov
	0UwfbFcFFfBZOr0QB8xnthHfXNFevNwGdzBJjETQPftaZE5KwEniZLReSWmJ/G1a
	CedowA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bga8pgnkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 13:23:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7bb2303fe94so14778124b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 05:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619399; x=1768224199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAPzsylvQAf0leJxcPm7SZsbOhaaSA1OJ2ImRJF3POY=;
        b=MFMeIx2MBgvvIz9W443fEDj5gxFzOTYdRe0l/6yyP9ZV+SUURPbkY/szW1n3UJzLon
         MdEWHjZN4cwL1KHAe5rh0BSfOQUgzfAiJwgej1wJG5yoUF1z9Arq6V6PcqKAU8SO1Aip
         jSyvfOwTIsu+iLC9j40IuskARyYtg5U+jPiYISmh07iQx9Ev6hiCc13CWIdHnQLnvtc2
         n7rZVDCFpSLX/9/wHV1YkUNF8DQU+0iz3DNHZDUkcirFg9O11bLxnxr1Y46rfcaJPker
         lRTnTFV3j56wsxs76OkRt4xnXLWEhMINxRVEJTAP0l1UYqywuvJ/FJQgKU2hRh/q8UJK
         UcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619399; x=1768224199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QAPzsylvQAf0leJxcPm7SZsbOhaaSA1OJ2ImRJF3POY=;
        b=cBvFjrGtZHTgRH48zdYaUDGzo0nMARhHZa498Vdt3QtNuVlX7U+0LjBJ+PYuJO1EFI
         h7IVz8hg8hCgoMCwlidTkYJCkx/zxRRnTLPljUS9VZdXW6hBdXXf6bo6uYva49smb5dp
         oJg8nvcOqmb7NQxAS7UsJ5cL3PbDmYJKFU5CbgU2Fr0mmmjngu9HaotfmQnn9ObG9OiC
         lMep+vy1RL64n1dC2/z8HrgpdifaxCbNkAyByYbpTYO+HlRtJ/Ez2Ja91UB8j34k+N9f
         z0BHcduGM4t0Za0YL6htyt606b1dLKGycsIX+isaBr/LzwmDyI5S8CtCtg0ctzPORx8B
         tvRg==
X-Gm-Message-State: AOJu0YxS9W6Lw74HOkLWxe14MJbDvmBWf7AXT56SR/bLLTG+gZ0m2wmI
	ussA9+bRCVg8iv4nEBNrQ+eSj69CUljRhXcdf3UyEMccMccnbbFxP2yTa4vDNO9NnZSiDpTMA4a
	hR9QpXxFD/xx7Xu90hPN4sL+jNZcXHBce9dwJPl7TJ7Zo7ZBgPj20NLtkYoG5JrPK5pwK
X-Gm-Gg: AY/fxX7syTa1V6IHmNLzQkAV3+mF6rKPF+3CsZ01i4O0qxfBBkMHoso0U5O05o4opNk
	wGNhP38SgvTC4CUtFnLX1B4sG2ewur6Xz61IJ6c/NadBjem2Rk3VjpsmDvI0MmhDbdiEwwlm5/N
	e+Xnz8yAqRDHnmWNkjCw7vDPbpbpWTm5UKbCZzFi/4ZC6/6h/zFIMNV9wUs+AXG14xIsoLr96eR
	hhhH23OULyC32X3LAzOPSMn/JVBJpLKcKrJr2d6BzU68SE6vkYCRn0cOGFG9p8Peh6FxO8sRoVW
	iePJAG1jTVLZWdq2maDICu7uamparyEyFkGI1PLfeJFXvZ++PCBUeBaSePZAKNyAEG5bqESRT/H
	/vla4ojoGCtWURarzojr/rF0qaYCg4wAzkqeF
X-Received: by 2002:a05:6a00:e11:b0:7ac:9d93:3efa with SMTP id d2e1a72fcca58-7ff6420d8b0mr42007409b3a.7.1767619399105;
        Mon, 05 Jan 2026 05:23:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXHIoRObBnpG+sDXEev7xVi5cr2hxbkLz+kqCHin71KDqJCUdIlqKzoFWOJM2Ny5kzVPST3A==
X-Received: by 2002:a05:6a00:e11:b0:7ac:9d93:3efa with SMTP id d2e1a72fcca58-7ff6420d8b0mr42007379b3a.7.1767619398507;
        Mon, 05 Jan 2026 05:23:18 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b127b00sm48426542b3a.21.2026.01.05.05.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:23:18 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 18:52:49 +0530
Subject: [PATCH v10 01/14] dt-bindings: remoteproc: qcom,pas: Add iommus
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-kvmrprocv10-v10-1-022e96815380@oss.qualcomm.com>
References: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
In-Reply-To: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619390; l=1346;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=fkI0IV5pKXD+Z8pE0/I4omqNa0GvsOuaX0Z626kXB7M=;
 b=N7A1Me2sKxNSdYcaU+4DCNbfiZ8wqBvjkhm5jGip5KJnozTrWsE1VUhhTDdOtzy+26dTqaDBu
 qI9HFMuG4A0Af0myuYSCsLX6xSFm7RoBTubjT19KZDQXv7oIVpw/IAR
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfX/Da/Srqow758
 HbCsMeup3m1S7W7vgSCPGhgtVp5udVGuUfci9I8qnJSDjD4OFPOoRODulUKHqUGILjTIIR6DeuR
 qEOXYo5e8EPmesM1t/WNOSKpm/W4QmiFsQ8opPYbxGmV/NmdZJsS/uTAkoNU//u+5pWAUCbWx8J
 wvhtJmGt43AvHmFDtWbDn5SzaxAiDk2w6HpiwMpySYs6IxOjnnbe7G5LZuOjvnxr/5uX3aQDA0N
 CZpQu17f18I302+CHnSjzIlZLWVxknuIyCf/1iG10k0cXk+tcb+r2deAsNxNCnKTd0NmmybFWQM
 vkCFi7SrP0TNDWA0wI22pI8l/h6bSUR0Y6sHs5acU1JsZ+sYyT+ENZDklYXrCljFWVibBMPCugw
 M/kq2fRM2x/rh/yFImbxE3AQz+0y8IlTmYnTTOOs+0PcEMy86/yMNufCya+a4y4E5Q/IOJhtIrp
 SfXjMlaV05Ld65TxMRA==
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=695bbb48 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=nDsJnkO8JLPJ0mjf3QIA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: KXbdgJgDgTsr8mMAtg3FF5_UeucrHZ7-
X-Proofpoint-GUID: KXbdgJgDgTsr8mMAtg3FF5_UeucrHZ7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050117

On most Qualcomm platforms, the Qualcomm Hypervisor Execution
Environment (QHEE) is either used as a standalone hypervisor or
co-exists as a module with the Gunyah hypervisor. When QHEE is
present, it configures firmware streams for remote processors.
If QHEE is not available, the operating system must perform
these configurations instead and for that remote processor
firmware stream should be presented to the operating system.
To support this, add the iommus property as an optional property
for PAS-supported devices.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 63a82e7a8bf8..68c17bf18987 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -44,6 +44,9 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  iommus:
+    maxItems: 1
+
   power-domains:
     minItems: 1
     maxItems: 3

-- 
2.50.1


