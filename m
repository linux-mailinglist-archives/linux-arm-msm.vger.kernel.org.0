Return-Path: <linux-arm-msm+bounces-80988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CD3C46432
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 12:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AFC03A1151
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D665306B00;
	Mon, 10 Nov 2025 11:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ixtN1FZQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q5ucjBIy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909C022538F
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762774198; cv=none; b=FipLFgtCpsSa1d5Vp5z30goffx8d2emC8GQ/tBAyQE2anb09sVMAeptxXeGZP2i49a36j1S5qCE1Z0Z/qTyV6hTmsiHq4hHVCVf+vEa9Y71EoHxYgtNIC4gOFTXzb1IUq/9YmsrgoT3mcWG4t/GrcSDKrKRWUOA3lffY3DtO/pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762774198; c=relaxed/simple;
	bh=8xKXl25wfM0C8tmYM1yA2iBxK4BxYLRIBEfMfi+Dy30=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HRPErFUXBjKns4zR8f0cvcEMUFzDSPGndHE/8l6AIhwNLSIglje2fJOBJ3sPQyv5uTkTXUHMbQk1R1leiBwBpnxyLOLIzeKDMsHwVvm4sEYdZcooIDyaqDkOi/PrMJA5FqzRlkYJDIiBiB2bI2PUHjPnAZtPWWL+uL6KTU0gLKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ixtN1FZQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q5ucjBIy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA9BrWq2867907
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RK0d/o3bcwg5PXWQDXV02fF9ZPl8toqvLuR
	sMtlyQo4=; b=ixtN1FZQAJHMPwAc01uqs4wXs0H2NPrIvY8jgwBT1IC/MI42zrS
	EySPF4VfV6VvnuppZoDvn8SYj/CLHOQEHdGikP3LILH2YVd+iGwH5jBdi1LNbJa4
	R8qSDGVn2gJGEXIZvHmXl7YEjOhi91C/kLbR07mbURjADZ4oHZE6GJJgGBlb5RAP
	40nEj/HtdFo5eAHLMACGAd2m57BZAX4wL84mOMRWSSPq68NRFJBL0RjC4SM01kAp
	a03rlmhiFwDjjuYesreFBdKMKEmRHIhivLkW7roFtS5Ia2SaDevJbmvjrK+FQwG7
	HPKm/dbu023TDPNthfwZJCeFADyt8Hr0Cdg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd760evy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:29:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297fbfb4e53so23170235ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 03:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762774195; x=1763378995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RK0d/o3bcwg5PXWQDXV02fF9ZPl8toqvLuRsMtlyQo4=;
        b=Q5ucjBIyfj9KTXNZDDKgUS3eYU6eQSG9pRJLHfqr+24K4TgsUXxPbxsXa/xst69zcA
         AuI7QSFOYYpuDixTtA+RCNsCy3U/Cr7M6jl1nIrsSpW2k0btNnS18TsFv2WP99aR4hxV
         uReC/7v5hmRvsFuNulkWbJmQgEuNUsdTJEaejZGqbS4ERe2GpF4IOVBFeWmi30rjk0rV
         q9JCAl9zYsDQmISLn2JatCkjizpvaDMx1OfAwYyIiwA7bPeWifGldOpBQTGkCwOrm0dq
         DmDQQHcj4gRrZ5HmxqNXBpDxPEOdFVhsTfaN0w02T+lBf03Rnyt+n20mCy/UrzH2QaqZ
         iYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762774195; x=1763378995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RK0d/o3bcwg5PXWQDXV02fF9ZPl8toqvLuRsMtlyQo4=;
        b=hfR0oWrXst9mOLEXnP6UwSxt9hKRpdsiBTcluH6uD0AxApJHyla54qZelKES6i159T
         Ei92i9hO+p1+C/46sSz42YxlGgaXj+A9RaRh3PfXH7/UprTd52q6MfdBMtUyhg4WuMyT
         dqSAXYEy+lH4DuLbeFK4AeEefW1oOob8w+qgjgU4PXbkxa6HOR1dGT++RLT6+FQKXUng
         yFprwgwSQEIJenS0U/TlPn0GhcI+Xgg9KSvbxnJkbJSXStEYj7zP1RD3JK3l6Ga1qrXK
         jUCt9i+QnXA7n6gmrs9kTIjktlKU5/BvaUzIMIEcuff4ipVBXghDn0ewMBWoLzx9raBw
         uXww==
X-Gm-Message-State: AOJu0YyOwN24cJ/cf/dpAhq7h6cottc4OTWzTLy2o2yo+OaSYdR0hiA2
	H9eI0k14xIsyyckhxKpR8hZqB0Azlqg5Df3Hl+Lz7xDmJLAa2wEtdbr+tZAKR0OX+MUMBYcziyG
	kYog1TWU5dLWNGEYD4wiEdcrc/5AcI3Owb+3lDTf9JHeVpuOb0wRHBTVYxfgOCWZbkLrc
X-Gm-Gg: ASbGncs154tXMICIRUap68C+Z+Tkya/sd7Iw/juiaxbG3+FDpKMUYBqfTvQ1uT7VuuH
	ekttJxFTD7ZFRr05QMw4SXBZeeHpTI1PmWkIG3V7n+ZvKGHpyYqyFI0WhAoFtJNWrhNG0egPf5e
	OlZMq/gjGX7QsoIjX2d0RYgJ8Rcjtnf7UwJj9Ad4k/pbzdOmPQYXdmzsvVbxbksxqRdnwOV9QpW
	fkzrp7P2XXt/ldzVNVT00E8I0vZ3ySJWrG+66apfigGu3EdDqBD0kzGqMtb0EWWOAnsyTBSNVtj
	s/AvZm0yhBUkLx8JE57aszPE23iDq1igsc4A6mlEfJcO8B6Sk+jIPs+q6zupebT++RkttrD40y8
	Sns7q+oi5ptCph/dNM3gb6bNpPq0LG5AtPg==
X-Received: by 2002:a17:903:3d0f:b0:297:e575:cc5d with SMTP id d9443c01a7336-297e575cd10mr97124405ad.35.1762774195069;
        Mon, 10 Nov 2025 03:29:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMG6ovmdfjX+JC8Me1fTeukl5fm1TgWV8TPUNLWMYD42ZI2p8Y10hF6Q+EdEn8pCXJX3XaOw==
X-Received: by 2002:a17:903:3d0f:b0:297:e575:cc5d with SMTP id d9443c01a7336-297e575cd10mr97124085ad.35.1762774194529;
        Mon, 10 Nov 2025 03:29:54 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651cd0ee9sm144165495ad.112.2025.11.10.03.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:29:54 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: andersson@kernel.org, robh@kernel.org, manivannan.sadhasivam@linaro.org,
        krzk@kernel.org, helgaas@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com,
        krishna.chundru@oss.qualcomm.com
Subject: [PATCH v2] schemas: pci: Document PCIe T_POWER_ON
Date: Mon, 10 Nov 2025 16:59:47 +0530
Message-Id: <20251110112947.2071036-1-krishna.chundru@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Qm7A2twOwt-T3TVODIbpjXv1ItZGLWRX
X-Authority-Analysis: v=2.4 cv=OK4qHCaB c=1 sm=1 tr=0 ts=6911ccb3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5_BQsOELN8wEIR4Ca7QA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEwMCBTYWx0ZWRfXzioelCUZKPbn
 LLxFXmOaaNNLUDBYBoRs+8o5EEyWSpG7i1BHGSDxbpYCtmWEssUgDBas18Zq07V6b4QJ0NDX5Y2
 afOaOeVYfBMqTUJN2dN2MQhn2xdo2N9pI0rcqObGItx7O3TTaOJG5WzydfOnrk5wpSZ3dw0WwSB
 hi8vXifExiScM3Z791t6CTetx7P3FPWqtB0qvOebXK+GLNl/MSmmu0xHhixzO3a0Ibz7SYBx2Sr
 WqOva6vZa64hnkQ3I5SHw4dAlU/h3aguUUfEHqnao+OBhEc9GJ9vjoDU75AQvWuGsXxwVgbTw8M
 tGq6Cj0Jc0otKP5Qna2+dOmVCzVVzFGCCuSjWt4ydl80YPSvS+uTUhQ7duOS115bqZt80tVAUhE
 mbS0O0tqr1LjVZzXtG6cRKZ9ROl3vQ==
X-Proofpoint-GUID: Qm7A2twOwt-T3TVODIbpjXv1ItZGLWRX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100100

From PCIe r6, sec 5.5.4 & Table 5-11 in sec 5.5.5 T_POWER_ON is the
minimum amount of time(in us) that each component must wait in L1.2.Exit
after sampling CLKREQ# asserted before actively driving the interface to
ensure no device is ever actively driving into an unpowered component and
these values are based on the components and AC coupling capacitors used
in the connection linking the two components.

This property should be used to indicate the T_POWER_ON for each Root Port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v1:
- Updated the commiit text (Mani).
- Link to v1: https://lore.kernel.org/all/20251110112550.2070659-1-krishna.chundru@oss.qualcomm.com/#t

 dtschema/schemas/pci/pci-bus-common.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/dtschema/schemas/pci/pci-bus-common.yaml b/dtschema/schemas/pci/pci-bus-common.yaml
index 5257339..bbe5510 100644
--- a/dtschema/schemas/pci/pci-bus-common.yaml
+++ b/dtschema/schemas/pci/pci-bus-common.yaml
@@ -152,6 +152,15 @@ properties:
       This property is invalid in host bridge nodes.
     maxItems: 1
 
+  t-power-on-us:
+    description:
+      The minimum amount of time that each component must wait in
+      L1.2.Exit after sampling CLKREQ# asserted before actively driving
+      the interface to ensure no device is ever actively driving into an
+      unpowered component. This value is based on the components and AC
+      coupling capacitors used in the connection linking the two
+      components(PCIe r6.0, sec 5.5.4).
+
   supports-clkreq:
     description:
       If present this property specifies that CLKREQ signal routing exists from
-- 
2.34.1


