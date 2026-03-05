Return-Path: <linux-arm-msm+bounces-95495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EbXDJ4GqWnY0QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 05:29:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F46220ACB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 05:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B04B93052720
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 04:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FC526A0C7;
	Thu,  5 Mar 2026 04:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U1P9Xhld";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RArLKMzQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83A326ED46
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 04:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772684944; cv=none; b=rvX7ZIybugLN7N944fei6hh5SESgcVc/Y/gRsaKmeebpUm7cU1qP+I7eUTUKHiVAMl0gGKN2DUCrKvBclJEyGtzL1UH/mvCcZ0ViP5up4N7Qt3HRYlGzGxa+KD3fS/fdO0tnS/l536VmtJh9PVUjI0E55MPBzWS4TORHY7EttRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772684944; c=relaxed/simple;
	bh=3grPqos/sxA/TcnNVfsMwSjlhM4yvh+Tt+Y5c9KsoIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P3i1kFcQCQpobPylF/Bo5L5tydxzvZOe/vB0nYDQyKfV8LPfkBSH833/xuVweAwG+WJ+3Qjy6gA0mOWLTPvKEHiHRMyEe/qPrM5fFPMOBLm151ulsvsXAvIyIC0rTefcZTUW8XY6N1aIzn5unm86/MdrL479DzmLKgfzqb+xN6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U1P9Xhld; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RArLKMzQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BpM71193218
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 04:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+0qvYpOj+GSCTh4FhMPJ74D2YOgGlJWQGoEszgurjQ=; b=U1P9Xhld0ad3rQru
	UNKKRxBKDmnD2JsRt15oMleiBb+6QcdpalwacaRV/gUY46E2jWs350VEV1zCwZlV
	+LP89yrST1zTBo3K4can0Gf6PNa3bCX3Rpb8FOW4yRzYIW+Joi9OXUgbw8GZ4kKs
	WeVQZ7apvGpqInLTTgAnhdalUaTDlKK3krZjL+U22pln5LRS3drP7ZL+Pn2yJquK
	d+GslPu5qKVvxC7eWQWxRPsxHKnhv6q+fC55wIiugoWqYcb2VnuRLVKZXPoJYPC2
	GADx0I6c2SaaToibD2lY8dW8t5qel+0FluVVvkWe06LqoTJtvj1+xQDWuDCWOVep
	gZkH5w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpqwg9y9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 04:28:56 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12721cd1a2aso111181178c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 20:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772684935; x=1773289735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+0qvYpOj+GSCTh4FhMPJ74D2YOgGlJWQGoEszgurjQ=;
        b=RArLKMzQnLag/E37p/PZThbk7RTugtNQQ2RQ6jE15iSmTHPHzz+7EbGiIccFk/aeUK
         rhCFE5y7bt7kB18cmFxCOCHk7iFGXVxhiRViAZi+BSrHNCdae9hMYXVMUbP5cNiysCMa
         K6Mpx+EioReQzMPwxu/VpD3vkdOJelMAFGRwjyIzsyi0+oht+59Gq3rRlOxqzM+vN1B1
         HA1f6pygscm+882fGneqTBKXg5JtOnnl2DHGCcRTtex/vChIponK+MYmQq0JN8ydTcPS
         qybVlgRJ0KGBq6h8ZzBaMoA5AdF7VeAkLwg1oPA3MZI1dPSO+e8PQ3OTE9mf6Rg/S3jD
         kj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772684935; x=1773289735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X+0qvYpOj+GSCTh4FhMPJ74D2YOgGlJWQGoEszgurjQ=;
        b=rTw1tO4FucsTzH53SQiW1tBz8Zp8whJHKJzNCsgtZG/TJH+eeYSWud21AZDJpXnX6V
         tnqkC3NrOuhAjm48kab/7vCsTToPV0fqA59L+GX6WXHoT87y1U6JFqTl9OEF/BN1KOkr
         GHLfK7hNIWCaSqcn+uKFzsHVpC0JiC9LcHsCc7kUE1Q2hJ6vcUlS5smrE4tVeF62AjBy
         2z8+VRy0lqlW63FpZu204oHqB+81PjrR7awsI7XHCcFN8VwAD+ajkJnZDLu5YXHYYvhc
         FIIC7+y6Yqppulej6mTonZDqILQz+UQyOnFnZHUqJ8q6JAPH6ZlJopJYY7IkToYS6YHo
         7oig==
X-Gm-Message-State: AOJu0YwF0WECUmHZQTS5cVVfFXZRMgBBuNDoAkX2Ip0C++WC6sY01zPJ
	NkgCmRDCrGsTx3GsISPPfQDYJ0hCm0E9ih3FsC3PaSwDrU6qf9voqjF2HoZH6e84/8yvxrFx5Xw
	Vw4xT8DNMS4uCbRZ181Tryw22dBYaWYz4cmlu4agEw8Ms68sBR+sw6z7wvs1BXImBHb2A
X-Gm-Gg: ATEYQzwcDIv5wSRfyguZiu0F4p+3DTWuekNHc/hYgD3IlYhDDn2BDytJbDO28JWdFJL
	zvocZVeioq0yUh8pjwtaWpfjZIGHeOGRAm88BjEu/QGYA9/2khuPITQPn5+/NeY0zdeV3THCbYF
	t+kriklLpHa6PCmnZvlkOL7GG4Ia8uhwGxH3jZTHunFl26q7yk+DW44Nj5wqh/2UL+F/MzYUNPT
	HH0vcZnhXewZxNTQSig9Hkgge6izDRKKEROIBsiP/Oa4pJa5RfP96LsMVfKATFTiq15Utdav/sY
	RJggchoqz+tHEauwcy61SduC6ffowh7LNyYweRJXwBaZSbbeTn0X5urrP4yQn7RzWI8z2mKksze
	8yUszwdvCeowXMJVqEFCP/CKXijLhj0XeN5D32xLVKOQF7xaTmAECuaDo52QeBqdbKTURSZ7S0Q
	==
X-Received: by 2002:a05:7022:128c:b0:123:3461:99be with SMTP id a92af1059eb24-128b70bca3cmr2384365c88.21.1772684935206;
        Wed, 04 Mar 2026 20:28:55 -0800 (PST)
X-Received: by 2002:a05:7022:128c:b0:123:3461:99be with SMTP id a92af1059eb24-128b70bca3cmr2384344c88.21.1772684934521;
        Wed, 04 Mar 2026 20:28:54 -0800 (PST)
Received: from hu-djaggi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1279cbd1993sm11164942c88.2.2026.03.04.20.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 20:28:54 -0800 (PST)
From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 20:28:30 -0800
Subject: [PATCH v5 3/3] arm64: dts: qcom: sa8255p: Enable sa8255p-ride
 board support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-b4-scmi-upstream-v5-3-f8fc763d8da0@oss.qualcomm.com>
References: <20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com>
In-Reply-To: <20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772684930; l=5572;
 i=deepti.jaggi@oss.qualcomm.com; s=20250501; h=from:subject:message-id;
 bh=IWhdCAnf38p0QfUFQDDgfqqYqbAllDJ54p52qROUU6s=;
 b=R9+F4R3m9iwbJxBDMl8BD3dpDGb1Lvq4GkQD2BbdQGucbUmEF/6HRusPiIcr69QDCDzFTCTxc
 YEROYTS18rPDGYXGPct1UC5vJ/polrlWP1TFlvvR59WmduDzFzwsiPD
X-Developer-Key: i=deepti.jaggi@oss.qualcomm.com; a=ed25519;
 pk=+b3H5UC/u0pUK5+btJ+35nW+6vKwJV1CfjJ1CJWuOZw=
X-Authority-Analysis: v=2.4 cv=bdlmkePB c=1 sm=1 tr=0 ts=69a90688 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=FU41NW7tA04laxmgGA4A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: bDrflITrzqZ9XVhuQkSLZs83mvxhCzTB
X-Proofpoint-ORIG-GUID: bDrflITrzqZ9XVhuQkSLZs83mvxhCzTB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAzMSBTYWx0ZWRfXyU1mXo6T4QuO
 iOvdirJZxMpKSYiXnUuJnE/kYjFA4ffZJebKL/4Ed7shWXNMeMIUyK6fv/GrQ0nm+Y7xa0ReAZC
 puAELFCULMb+z+JBlT0U01kog+JiM2b5mR39bMZ1nOaTlMHdxrbYdtDMC+1mLdz9pB8lWFrJNoQ
 8afFV536UJ7k4d4TqUa2WK1T7ZIssgxevKQ46dHI/xFrrydr4sxp4D9ZfYKfZCxYOrR4a7tvkcq
 4cwtNwOs6iwPXm9Bdrdug7XbaUF9zUSL07ptVNyJjN2MHpFrTNKvQ7oVERgeEd2xagdFRQ1eXvA
 4mDy66GgOpaBjjKzdwM3Qy34rhip+vkaFCQMp0/+TdK13lEvnhFw0dXniF6RQAH0ANutW4NAfws
 58l9H52keOGhlnrO/CiFYAY8p6pf563UoyR+lyWZFrnljH7UAJhzbNRVhBwrjm0rrpVUXcMS3jr
 lMaSUpaU1ZfXB32Xlhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050031
X-Rspamd-Queue-Id: 9F46220ACB4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-95495-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepti.jaggi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Nikunj Kela <quic_nkela@quicinc.com>

Add initial device tree support for sa822p-ride board, to boot to shell
with ramdisk and rootfs on ufs and uart10 as serial console.

Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile         |   1 +
 arch/arm64/boot/dts/qcom/sa8255p-ride.dts | 222 ++++++++++++++++++++++++++++++
 2 files changed, 223 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f80b5d9cf1e8..facfe99c2d97 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -172,6 +172,7 @@ qrb5165-rb5-vision-mezzanine-dtbs	:= qrb5165-rb5.dtb qrb5165-rb5-vision-mezzanin
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sa8255p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
diff --git a/arch/arm64/boot/dts/qcom/sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
new file mode 100644
index 000000000000..6cf277fcc072
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "sa8255p.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SA8255P Ride";
+	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
+
+	aliases {
+		serial0 = &uart10;
+		serial1 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	thermal-zones {
+		pmm8654au_0_thermal: pm8255-0-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&scmi23_sensor 0>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_1_thermal: pm8255-1-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&scmi23_sensor 1>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_2_thermal: pm8255-2-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&scmi23_sensor 2>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_3_thermal: pm8255-3-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&scmi23_sensor 3>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&gpll0_board_clk {
+	clock-frequency = <300000000>;
+};
+
+&pcie0_ep {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_ep_clkreq_default &pcie0_ep_perst_default
+		    &pcie0_ep_wake_default>;
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+};
+
+&pcie1_ep {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_ep_clkreq_default &pcie1_ep_perst_default
+		    &pcie1_ep_wake_default>;
+	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&scmi3 {
+	status = "okay";
+};
+
+&scmi4 {
+	status = "okay";
+};
+
+&scmi5 {
+	status = "okay";
+};
+
+&scmi6 {
+	status = "okay";
+};
+
+&scmi11 {
+	status = "okay";
+};
+
+&scmi15 {
+	status = "okay";
+};
+
+&scmi23 {
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart10 {
+	status = "okay";
+};
+
+&tlmm {
+	pcie0_ep_clkreq_default: pcie-ep-clkreq-default-state {
+		pins = "gpio1";
+		function = "pcie0_clkreq";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie0_ep_perst_default: pcie-ep-perst-default-state {
+		pins = "gpio2";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-down;
+	};
+
+	pcie0_ep_wake_default: pcie-ep-wake-default-state {
+		pins = "gpio0";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie1_ep_clkreq_default: pcie-ep-clkreq-default-state {
+		pins = "gpio3";
+		function = "pcie1_clkreq";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie1_ep_perst_default: pcie-ep-perst-default-state {
+		pins = "gpio4";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	pcie1_ep_wake_default: pcie-ep-wake-default-state {
+		pins = "gpio5";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&ufs_mem_hc {
+	status = "okay";
+};
+
+&xo_board_clk {
+	clock-frequency = <38400000>;
+};

-- 
2.43.0


