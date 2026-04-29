Return-Path: <linux-arm-msm+bounces-105230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMJiEf0S8mningEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:17:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A74E495845
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 509193022A1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 14:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D03A21773D;
	Wed, 29 Apr 2026 14:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddKnYgV7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BMABeuWa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811152BDC1C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472146; cv=none; b=FYguAVViP/unS1Fd3Uis+4rtVvVdyADh5s5iK2EV4cyWgP1GEDfFd0WL1wuGC6Xj1hTkMxVzRlRhgYdqhupG5JlreNUbJhNjiZy/f03lHUK2/gTEDcGSIYd/L/UF85Lo8e4zLEje3c72p4ylKbAIrO/AtYkV4S4IG4TXqQbpuU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472146; c=relaxed/simple;
	bh=9e/rU3y9FiY3ZktFyJuwJcqEkyq+fjBmIt3hjGxM5Bo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aO9Dl9G3airSOZhT5n+MwrBnmzWLl7DvXyck+wbTKHTHxzux9vMjp+8/mzF7tpQQeqYw7WkeyxUfcRdr+A3zM38rZ9TuY2r/f/A3BGaZaCAHiUCydShM7VT2qmtHmEvNXirOoaQ12Jam9dGVWZBQqu9OPkaQhbZ3DWyAN3vhXQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddKnYgV7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BMABeuWa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCeYkK317094
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sCH7Ji4S72tbjTt1JN9O0xKaoBsRwmicvzKvcsw0nFo=; b=ddKnYgV7kEyWmxO4
	yEpDzIOMrYfcphw13CU4DbmuSXkFzVb1KpT3mjh6NQv4UeSMvZ57ZQSk+9SKRA1w
	9ITvLVkQJqzqrm8tlM2UfyjWxSGMkYi7Ie69eCVgdWjJ0Uuq2eCrzCpkXN3rYVE1
	P+oT53qfjTNvPenbaqyQKHb9DPXt8r0IaJVETAfWay3IOSdWEydVfML+Yw16BTAI
	bAnEBCpN7YaiBgXuC0aTH3Ei/OcBlAZ5qBlXzTx4/+EAnupFVAbDZTlqNCAIrOE1
	bTljoTSa229RNE0HJVTdt3a12Wr7LovDBf5b72OciFySDwP+KXohAjg4VGMquakT
	B+UYKQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duj6t8b3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:15:43 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-65019ce8b1cso8071090d50.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777472143; x=1778076943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCH7Ji4S72tbjTt1JN9O0xKaoBsRwmicvzKvcsw0nFo=;
        b=BMABeuWasSFijIdVEujncYaSCc8LbXPVIm1faNKn6HnUaWluDdLHbK4uede8ROj0mU
         Tpxe2te+6cWbALeVTc5zpQRq26hlLn5vrkCHi3V0NrKVoPgzkTQn3iZ0LJ1ag6pGVFjd
         bXcoTokPz378E+2x4C1ugP8dXBB6hPiNm0lwphaMn0iCG+xQGoHGT2QdJueMZ3Rwdd1W
         QwZhyIO+xkd69JDSvkx34xdcYm45wiXUnJIX1ixRDcU4RsxES6icMSsbI6e4EBWaJ9N+
         P/2XcVNEQX15lKN7m+txOVZdswkeF//c3fSenM7I3MjB6Gz2BtTxC16Tgw2hiHelvJbL
         0CDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777472143; x=1778076943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sCH7Ji4S72tbjTt1JN9O0xKaoBsRwmicvzKvcsw0nFo=;
        b=ATanIkJi0pZh6QAJ3dxGzd/rxTC8B6AANgYcA23SkP3+3wzSx4IItV9LS423xD4uCb
         5oNhKXeJR6bP1ByMH+JAA9IUDNRca9T9mk13G2mDCAWoA3qM3bxyFP9dS7rNOKHUzyfz
         DmZkTRTCeWfIBcvJMm2RoC9YB2wyUpo9RccTCBYJ3jvLVlRCui/HiRYkByPa2JUUxvs6
         qNI/s1nm2zBKN0r3DhP1m4GLzbmFALZ1bpX/MpKnp5PdxjPeoFmzknWu1xW6SPB8A/XT
         O6VOD+9jGNBiUjwiFL3uJyKTDRYG6gT2t3Sy9je2+oI5XnLNIGQxceSjjx9jYxuYFbaO
         JUYw==
X-Forwarded-Encrypted: i=1; AFNElJ96wLrdae+FUFxWHPo3/HSnaKKzgdCQ4a/Hab6pdj5AzUsr0zzeP25aLkHDe6u8VXSLgMIvsqk/8DP1v+qY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3aTZBKNVC8XddREBgWzrxsVLHlIjuyW4hQRhVuhor4cOcyCRO
	zZXsKxY15IV0MMppfh/NwdapxdFH7Cq3O6/DxWnr3p14GArAcxJ8+KpdvvfLvDhxV5SrMXfvuHN
	gmsjB3DSaX4Sz0mP9xV+kCC+s+j3T/VA2gSanJIZ98GJ6uVv0P3R+KOjiKAWwIEgirEs4
X-Gm-Gg: AeBDieu+eT0JJxjxEct4iN0kQzrSIbeHFW/uRug1szpliqiCT2g40y4k+z1Njr/rh6j
	HyKGi8qn58Q4SNiGcQ3NrTmfcflc6Y72VDtwtPC2Dn4JHr6+ePDhGapqxTCaVRDAhv+c54vLVtL
	roK8p6fdlv0Z/L60YGF2nXqua3+YyXW5E6wxGriVfmcyS6Bedz1PVZw0Gtyeykx86HhfnIHH0Eg
	+Zk0oc04J97KDyOP/PPYLLSSr724kkakGr195iQ0s3JKKFZQmu2oXbgwu0ecCR+x+JAx2eLX4QF
	1vf005L5pcz+pcYaA2NKFAKllSTtk2KxrSdu+/jxiKnLxEk7eeIB+jO6gKGX7+ZHQUlmLbhSJ6v
	C7OZbUQkG5eehYI4CIlTh9l3Ucw2yaDnecfAcixN5S0FJBErjK5RQhLn4USSter4=
X-Received: by 2002:a53:d9c8:0:b0:651:bb90:714d with SMTP id 956f58d0204a3-65beee8b403mr5127264d50.32.1777472142879;
        Wed, 29 Apr 2026 07:15:42 -0700 (PDT)
X-Received: by 2002:a53:d9c8:0:b0:651:bb90:714d with SMTP id 956f58d0204a3-65beee8b403mr5127227d50.32.1777472142304;
        Wed, 29 Apr 2026 07:15:42 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bff2c2eccsm1379533d50.0.2026.04.29.07.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:15:41 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 19:44:56 +0530
Subject: [PATCH v2 1/4] dt-bindings: clock: qcom: Add Glymur camera clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-glymur_camcc-v2-1-0c3fd1977869@oss.qualcomm.com>
References: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
In-Reply-To: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: dw7A0fDYqlaPPRL9ERabs_2SPRi2Q2Kj
X-Authority-Analysis: v=2.4 cv=KcHidwYD c=1 sm=1 tr=0 ts=69f2128f cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Dk9EUgma8fqr-VUMxRAA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dw7A0fDYqlaPPRL9ERabs_2SPRi2Q2Kj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0NCBTYWx0ZWRfX1miC2oD9qkuC
 5vIgnhHSbwBbfZiOfQFXgdGg0jiICrks15Imz0k80/pWgAK9n+9kAbviHd/sFBfmYhYIG/K2Tl9
 iNsneSII1ra0nvCXdfQz0Nr9bAN1l5hO+kJ1rL7s7q+Ei6V6nAm3yhXAHcvmqFdT+ONDH+b8Qne
 mW+mt60tb5zCVk76+xQd+mp4RQvTisWmc5Wb7n0EXtLF28lGXpK3w3MRMvLVBTg1dMcW9apyA2V
 LUHmurFE9qObOz2Y6uND7XFiXZIiM/ReTOFMi9HQ2UI6TcBDuZz0f+75BXTT09zZMyC7ZKLlwYT
 Ag3mZVF8B4SsByV2fdK3FGNS01/QFv6opyKf/ExQbU7AcsjxPItVJ5Pq10ufW6SlHlwhkdjO/wU
 YYX0Z1OCUm1i7mvZPcabggXpA9Y7CADFTcYhvRw25ox2yVh2I7FOJy/rGZ78clAGaawjSY30fnS
 3YE1QGOwESykj2LFFzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290144
X-Rspamd-Queue-Id: 0A74E495845
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105230-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add device tree bindings for the camera clock controller on
Qualcomm Glymur SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |   3 +
 include/dt-bindings/clock/qcom,glymur-camcc.h      | 122 +++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index 938a2f1ff3fca899b5708101df7f8aa07e943336..93a379a4347cfc83f647e6f52d2af2713cd06514 100644
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
 
   reg:
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


