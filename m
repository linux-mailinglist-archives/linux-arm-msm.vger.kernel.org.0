Return-Path: <linux-arm-msm+bounces-114365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hy67CjrvO2qZfggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 16:52:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 770946BF52E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 16:52:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=H2VrYqDF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NRlRRBAA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114365-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114365-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94FBA3084053
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57712F9D98;
	Wed, 24 Jun 2026 14:51:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661E93CF21D
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:51:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782312684; cv=none; b=EGeraleQWJS1MPaMDT3Ac4I2RHrokRypV9e1PrnkGbxitjIl0BN7E5H15hQWzxtt3hKgOeKicjAojHb0GIP8Ftlf6yMrJDPylplCasVKcpn56hUDTUjt0Fojo7KkMRXeci0TPwiuN8YyLH7m2SM741zLhynS4Dj/Xn2fSj+j2Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782312684; c=relaxed/simple;
	bh=a1V3XklcCFNCNRwd/JxOtuP9aplbPhlbops3erRwdsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sGwR7Vy0x7C8lEhnilWFCeLCUwa3Or8yo4pDjuXwR+hpbwzhCEh6dKnFy11oM+IztW1TfBX90SRb1v8bCAoNhaMyZIqaVxBr5iC6aA21mPB8SfaEcjer9e691bPdufw86LtMTTezXUrCwV/IPV56QCvhJSoxNWKS9h/1kTZ14iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2VrYqDF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NRlRRBAA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OEfMKY1725198
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qq/yz8mtPFZ3oCLSMk1E9CQBxOauGYYBlFgRIaYt3Lc=; b=H2VrYqDFijpFkxSe
	y9a3MDs6+ecu8GTNWOM8MJGXiowdzvFm4kPkyrXItSb7syV/yUtyrti3wipeAeK3
	Eml39LI4z7ml1K0cSDD3fc5X1a47JdeqIG6EP+TN+9XamCzE6y6AZ8trlMXZNWMZ
	JJ6rYV0IHAKM5LdD5dIID3GWbk47TQwnLQk1jLLZTMOp9moSG3K/WOJCKozKUk4E
	3/3UVSnwll5t3MKlFxCjpYgCOREfC4vU7VXuIYRsGzzrp+gBqs6ELHtPY0zdMLRB
	3mRVUpqc6+NJ6tOAgB82jcU2TqVj3MkPOCmqzO6mMnfbv+ZSPvh5pCcA2dmIuyub
	6yV73g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f06r32k75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:51:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a298cd62so815722a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782312677; x=1782917477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qq/yz8mtPFZ3oCLSMk1E9CQBxOauGYYBlFgRIaYt3Lc=;
        b=NRlRRBAASz2DPubC/SNx4XPPi7UMODlxk44XG7zax8G2YA9gMeZAXud2ZTKFdwAbfe
         wrZCq0It25oGfd61+VvIuMcotbzu4UYCNWSil5jOVZAHCsUPeW3Yq1pWeO4/c9vYmHVU
         xo0z01bi8HcGdsrrR8bi8waR9tj9i2FkSc0FfOBUeQEz+32NWjcQ3b+QblKSMTeNldIu
         EJYB8vU1RlILKxyr9kI6V/0CM73wsy18naACBDMIJZ+6+bmXIKQjPKk3qb02xZ6W6jsg
         r4bBHk0Ai/+AM7SqydTvb0ycNijN6ALGXMf6QJeTuJhiEuV+oLuVZW7K/XeAz8XjUneB
         RoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782312677; x=1782917477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qq/yz8mtPFZ3oCLSMk1E9CQBxOauGYYBlFgRIaYt3Lc=;
        b=pkyxNnosqmHhbu/TDQ7umZ/CA283XsMk+tj05g4MGWFjRfJU2NHQGR4louSG47h+yP
         Cs3QMbqgVY/fCQPbHbCfGIOxpcGhc5x3dusn4s6MUdW6wAIk/OKXo7PSQYi8gQ/zLGT/
         bmtpAiN0hIPdyCFYyhJYbQZfhiHJ/rWi4WzFu3MEYyJdmHui+vsjhmcgDuJeleqHd1Rp
         IqdnbTF2b9pUNxzywWlLZVB8oU9Sp8/wd3/FUEBCDKpjg18DoSwp1ULc8ajE9veWS1r7
         frLtnlZ/d1sNL8mPupHnD4/trNXu4GljCOP47H3vcLcS0VTZzU2wOYo3b+hXCk4Q1TPF
         wupA==
X-Gm-Message-State: AOJu0YwWVb+2z8cEaAreCxkmerGWqKIFBz2OKwn6V9aWDvHxhRYvRjOS
	m41UKuulw1i1DK7c55Px9HZVQMycMPku5EdHkXbjRYPiwBnGyJ0RnE9i+2diFShqPltX0epR+Cp
	WDlrYN/9LXYqoE0UjV0W8CUKsVBRMrn6NQwWk9yUzMovPe7spVhya76k+stE0PYETlbtf
X-Gm-Gg: AfdE7cmQkK5FwV5pWlRJKnl3qmZScaz7ye7aUF7wEy5YCTVAE1HNzUBxDY5wbQbsLXs
	dkDL4YuMkNZgLS0+OT8mzYX97kDMGsXtq4ak2hYOYNlzRwKVEfOEFXupQwDUGbvYPgpOwm+cTTL
	Yj8qbHHBEDx5sDr44p3Q7El0xjM5DmhZxeBoCMx4kbppXQagAeap/K5gl5uUOBEKCARtlHxuKuK
	dGPULuHv+6a0xwkYhNj2IrSmkRE3SXHI3S6XICypN1wlDHyqkaSYd+N7mgBvT6wl5mgMQcQAA8d
	qwlz/ov2P4MmxDc25p9MNN39v8cbGzIARgqJybrGj6EvzvsQzbpPwAHqMey5uLRlcadjnjGdBE/
	BgUtT2cbkRBsRj+Q+LvjcF7jXLN6lmnj1La1oZEiwyQ==
X-Received: by 2002:a05:6a00:4611:b0:842:4af4:3099 with SMTP id d2e1a72fcca58-845a2721ef1mr4899511b3a.20.1782312677403;
        Wed, 24 Jun 2026 07:51:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:4611:b0:842:4af4:3099 with SMTP id d2e1a72fcca58-845a2721ef1mr4899473b3a.20.1782312676893;
        Wed, 24 Jun 2026 07:51:16 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc839sm2643271b3a.10.2026.06.24.07.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:51:16 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 20:20:29 +0530
Subject: [PATCH v5 1/3] dt-bindings: clock: qcom: Add Glymur camera clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-glymur_camcc-v5-1-a321df74b1a1@oss.qualcomm.com>
References: <20260624-glymur_camcc-v5-0-a321df74b1a1@oss.qualcomm.com>
In-Reply-To: <20260624-glymur_camcc-v5-0-a321df74b1a1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyNCBTYWx0ZWRfX+J8efoyNGKd8
 wVgIahrniYQWgUJCd+LFoZjnGhWzkZUL+cOUvsIPKyChjVOe7h+wTi0xbmQVNmNtWH1T8nbTJvl
 fbUIm0PRRoi+0AroV/Oy34/W7m/w+uzIF6rHa9YtR8asplx8MFuMkXrr4ldY4wrUFdv7/Rl4dkO
 +tTYIjTx9fezoWpI0O8/QXloXdHimkjbnXlhUxzCZXH5SPgBJmImHy4QSsX2xdOm7i7oqz8oe2z
 rp0cPeK0gftcmBfCYRK44gKX4p+zucCbWMsVlif3W/kVcr2B7gArdXD8Fg35qipIXI4VkWOEWQf
 huZ5BUtAqSuuJHghcK6LC3MU9R42W+w2E3Ec0pwret5Q0WVU37bSBe29iAXfUodW1Q/Lx6ozK2F
 EKkDXaLUn0uKAPIyRIAmo5Y08/sVuQ==
X-Proofpoint-ORIG-GUID: YHjvGsLFOaknOdRhmxW_Y9VpLPgC9j8Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyNCBTYWx0ZWRfX3SYoBXJC3idT
 dl11J2Q5QutruISdFlMSmUcukK9eOOi+SDJKRA8eZu5NYSxyeYplgwnTsNlnwnYtfgAW6r8w4b1
 IddXHnpDFvs7aJw59WHnf/Bf6a1WOh0=
X-Authority-Analysis: v=2.4 cv=ZM7nX37b c=1 sm=1 tr=0 ts=6a3beee6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=EFDngOt3UxJXKfoqbMMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YHjvGsLFOaknOdRhmxW_Y9VpLPgC9j8Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114365-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jagadeesh.kona@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 770946BF52E

Add device tree bindings for the camera clock controller on
Qualcomm Glymur SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |   3 +
 include/dt-bindings/clock/qcom,glymur-camcc.h      | 122 +++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index b28614186cc098268ab0d8c32b21d9dd9508c9f9..e7cb8cfa957a47a2370f002d118664292092fb90 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -8,12 +8,14 @@ title: Qualcomm Camera Clock & Reset Controller on x1e80100
 
 maintainers:
   - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+  - Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
 
 description: |
   Qualcomm camera clock control module provides the clocks, resets and power
   domains on x1e80100.
 
   See also:
+    include/dt-bindings/clock/qcom,glymur-camcc.h
     include/dt-bindings/clock/qcom,x1e80100-camcc.h
 
 allOf:
@@ -22,6 +24,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,glymur-camcc
       - qcom,x1e80100-camcc
       - qcom,x1p42100-camcc
 
diff --git a/include/dt-bindings/clock/qcom,glymur-camcc.h b/include/dt-bindings/clock/qcom,glymur-camcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..0c93fc77ef268b5971e671c57ea5cfca3d630471
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-camcc.h
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_GLYMUR_H
+
+/* CAM_CC clocks */
+#define CAM_CC_BPS_AHB_CLK					0
+#define CAM_CC_BPS_CLK						1
+#define CAM_CC_BPS_CLK_SRC					2
+#define CAM_CC_BPS_FAST_AHB_CLK					3
+#define CAM_CC_CAMNOC_AXI_NRT_CLK				4
+#define CAM_CC_CAMNOC_AXI_RT_CLK				5
+#define CAM_CC_CAMNOC_AXI_RT_CLK_SRC				6
+#define CAM_CC_CAMNOC_DCD_XO_CLK				7
+#define CAM_CC_CAMNOC_XO_CLK					8
+#define CAM_CC_CCI_0_CLK					9
+#define CAM_CC_CCI_0_CLK_SRC					10
+#define CAM_CC_CCI_1_CLK					11
+#define CAM_CC_CCI_1_CLK_SRC					12
+#define CAM_CC_CORE_AHB_CLK					13
+#define CAM_CC_CPAS_AHB_CLK					14
+#define CAM_CC_CPAS_BPS_CLK					15
+#define CAM_CC_CPAS_FAST_AHB_CLK				16
+#define CAM_CC_CPAS_IFE_0_CLK					17
+#define CAM_CC_CPAS_IFE_1_CLK					18
+#define CAM_CC_CPAS_IFE_LITE_CLK				19
+#define CAM_CC_CPAS_IPE_NPS_CLK					20
+#define CAM_CC_CPHY_RX_CLK_SRC					21
+#define CAM_CC_CSI0PHYTIMER_CLK					22
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				23
+#define CAM_CC_CSI1PHYTIMER_CLK					24
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				25
+#define CAM_CC_CSI4PHYTIMER_CLK					26
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC				27
+#define CAM_CC_CSID_CLK						28
+#define CAM_CC_CSID_CLK_SRC					29
+#define CAM_CC_CSID_CSIPHY_RX_CLK				30
+#define CAM_CC_CSIPHY0_CLK					31
+#define CAM_CC_CSIPHY1_CLK					32
+#define CAM_CC_CSIPHY4_CLK					33
+#define CAM_CC_FAST_AHB_CLK_SRC					34
+#define CAM_CC_GDSC_CLK						35
+#define CAM_CC_ICP_AHB_CLK					36
+#define CAM_CC_ICP_CLK						37
+#define CAM_CC_ICP_CLK_SRC					38
+#define CAM_CC_IFE_0_CLK					39
+#define CAM_CC_IFE_0_CLK_SRC					40
+#define CAM_CC_IFE_0_DSP_CLK					41
+#define CAM_CC_IFE_0_FAST_AHB_CLK				42
+#define CAM_CC_IFE_1_CLK					43
+#define CAM_CC_IFE_1_CLK_SRC					44
+#define CAM_CC_IFE_1_DSP_CLK					45
+#define CAM_CC_IFE_1_FAST_AHB_CLK				46
+#define CAM_CC_IFE_LITE_AHB_CLK					47
+#define CAM_CC_IFE_LITE_CLK					48
+#define CAM_CC_IFE_LITE_CLK_SRC					49
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				50
+#define CAM_CC_IFE_LITE_CSID_CLK				51
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				52
+#define CAM_CC_IPE_NPS_AHB_CLK					53
+#define CAM_CC_IPE_NPS_CLK					54
+#define CAM_CC_IPE_NPS_CLK_SRC					55
+#define CAM_CC_IPE_NPS_FAST_AHB_CLK				56
+#define CAM_CC_IPE_PPS_CLK					57
+#define CAM_CC_IPE_PPS_FAST_AHB_CLK				58
+#define CAM_CC_JPEG_CLK						59
+#define CAM_CC_JPEG_CLK_SRC					60
+#define CAM_CC_MCLK0_CLK					61
+#define CAM_CC_MCLK0_CLK_SRC					62
+#define CAM_CC_MCLK1_CLK					63
+#define CAM_CC_MCLK1_CLK_SRC					64
+#define CAM_CC_MCLK2_CLK					65
+#define CAM_CC_MCLK2_CLK_SRC					66
+#define CAM_CC_MCLK3_CLK					67
+#define CAM_CC_MCLK3_CLK_SRC					68
+#define CAM_CC_MCLK4_CLK					69
+#define CAM_CC_MCLK4_CLK_SRC					70
+#define CAM_CC_MCLK5_CLK					71
+#define CAM_CC_MCLK5_CLK_SRC					72
+#define CAM_CC_MCLK6_CLK					73
+#define CAM_CC_MCLK6_CLK_SRC					74
+#define CAM_CC_MCLK7_CLK					75
+#define CAM_CC_MCLK7_CLK_SRC					76
+#define CAM_CC_PLL0						77
+#define CAM_CC_PLL0_OUT_EVEN					78
+#define CAM_CC_PLL0_OUT_ODD					79
+#define CAM_CC_PLL1						80
+#define CAM_CC_PLL1_OUT_EVEN					81
+#define CAM_CC_PLL2						82
+#define CAM_CC_PLL3						83
+#define CAM_CC_PLL3_OUT_EVEN					84
+#define CAM_CC_PLL4						85
+#define CAM_CC_PLL4_OUT_EVEN					86
+#define CAM_CC_PLL5						87
+#define CAM_CC_PLL5_OUT_EVEN					88
+#define CAM_CC_QDSS_DEBUG_CLK					89
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				90
+#define CAM_CC_QDSS_DEBUG_XO_CLK				91
+#define CAM_CC_SLEEP_CLK					92
+#define CAM_CC_SLEEP_CLK_SRC					93
+#define CAM_CC_SLOW_AHB_CLK_SRC					94
+#define CAM_CC_XO_CLK_SRC					95
+
+/* CAM_CC power domains */
+#define CAM_CC_BPS_GDSC						0
+#define CAM_CC_IFE_0_GDSC					1
+#define CAM_CC_IFE_1_GDSC					2
+#define CAM_CC_IPE_0_GDSC					3
+#define CAM_CC_TITAN_TOP_GDSC					4
+
+/* CAM_CC resets */
+#define CAM_CC_BPS_BCR						0
+#define CAM_CC_ICP_BCR						1
+#define CAM_CC_IFE_0_BCR					2
+#define CAM_CC_IFE_1_BCR					3
+#define CAM_CC_IPE_0_BCR					4
+#define CAM_CC_QDSS_DEBUG_BCR					5
+
+#endif

-- 
2.34.1


