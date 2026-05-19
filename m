Return-Path: <linux-arm-msm+bounces-108476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE2DN3xJDGoMdAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:29:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B03057D968
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 77A443077E0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEC54A3404;
	Tue, 19 May 2026 11:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6W7fzZc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJVWKD6L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B7949251D
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189740; cv=none; b=TWbYR3tWfK5j3E/PHFMfkp1iqDAIbs41EDtcTliHJSYIpu907gjyyI8j7gBxJZxRsQxqJy2jjOgPxxDwjY6Y0lIX8hoaO8Y8yrNZvlhmoU0DvIyWMwKYQ3k2Bu37SF6U0ehAKZYV6ycq1UHH9EpW8DslkPfmHn61N0My0JpIXko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189740; c=relaxed/simple;
	bh=JUEXjiXpIktTHbarzyKyF4Q45ihGQ06q9JmKCLzg9Yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mOzenqCwkrT6tfsjANHMrqaNlZfMjJNU45U1eRqSxYcEHNxkayCY/rgkF//my0sz/+1t38tnIwAV/Albq1nW6XsMDlaOmHylJHdHsGXs93OFeiszFoqmeO9Hi4Lqwr13dH8XKV8SByAAHWmMxVl1k5/94baT7ntm2P2u3pMUKnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6W7fzZc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJVWKD6L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JAZR17254340
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C6TFAV79DECQ6Z78fc32YOmIJytgUn5/nHkh9q/ori0=; b=b6W7fzZct1x/vio4
	PDpAdBzHCI+tSQcJJ0K+56gQKCvKq6Nu296nPMIeu5tjuTVlIarglx0oj4LTm1d8
	yETTbg1vJDzJgpVfQgUw+UJaosrs+f6hZP17oP97RBY7Tlq4WTTkEQRjKhWU3DPm
	de3tZ0PREcOwiv1Y3EKC0zY7J1MhWsvREwYveNwuJebpE3kSwxO3wjZh6ZP9Kdme
	buNEiVJaynjQFBhEInLQiNIqlUGT1+iCmW8xMNqQoxKiteMsPiLlWS7fGNvfeFiW
	J5ciR9+VJ4wG5NeAe+9hBlhXtZmXMRsJsV2C920zTw6g8MBnhwqPQ7NIMtc9ZYD6
	aX7spQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8h87skwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:22:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd00a65673so25171515ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 04:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779189736; x=1779794536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6TFAV79DECQ6Z78fc32YOmIJytgUn5/nHkh9q/ori0=;
        b=HJVWKD6LSTdrF1rgm+FvULbZl/bvuqoENcuEmCl4PzB0HoUgFe4CzQiiTBzG9clNcm
         /tbWFADZ2KOf/3sY7fWyPGZAlFmdkTWEzjK1WgKl0XJkHDi7C69dL7a1+krOQvm54yhC
         MeLbaitINJ/XnHJclaohLHbxfK1OOeboT6uiw91/9eKQS5StzEzq849oSvSRuItpjNN5
         tzFJtP9FAkUKdZR7YROqivr8rKznFbrYhPYGxHGKj/3LBGKDwzbuhwUo9930i+lWc44U
         MNKM+TToBTdhoVsJIB0W88TGrAKFhFenO1/GtHhkjepcM8aTF/RxAsgMr6pgNp0bcqOW
         IzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189736; x=1779794536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C6TFAV79DECQ6Z78fc32YOmIJytgUn5/nHkh9q/ori0=;
        b=q6VGAEiJX0dhMXJglF9x1Vubm43z+C3sffmtOiUguCtGnvmn5y4v5pwqb4c8Vu6IV7
         F75kSweT/X2of0PSOE9CUZScalAFpA9Gozg4tVCm0JSRxhqb/0OUMbklj0Gjv1OKUhEl
         8fTl52O+L/AmyxNq4Mxrwm2zyR+Jj8fy/AID7zfYKD5MCciNrAF15dOnRZx0fdLWX/Q6
         5CLnNjIICjFUPqq72IudM9Qt2svgt1pFRewqI7I6My3sDeTtvk+amdA5YJJq3xbKWZfy
         dsdfY2AjjrE0fTJCej4yWxLaqneUg0JWdBukWd8UXmFl4Tmac/43/+e3BBWnFmZIFCoh
         /jgA==
X-Gm-Message-State: AOJu0YxjW3H5q/mmEWAhQdGy0wfJoApOfZV0gYmQ3QtFpLS/XdSkQd7f
	R4iT0i1wPEI4sV8wAgRQjbJjWY7Cq2as0re7MPwBl5Z1B6D4SE8IUrcEU7D0eiMvIp3KYYjQD3h
	lu1gPK9QErzEKFGwmMtiE6tdM8wTI9YeiWfNGqFEaP254tg78Fxy5RbqD4WdnL5+ZaYMh
X-Gm-Gg: Acq92OGPGBksmH0xPx/L7csjI3/HWMXUJd/pwHQIV08hM1/t/3lE14fgSyKuqMDht3T
	QJi2Qori0G/l2W7bhEz0ghmycvZsJujvQBAXqM1eNAiRIQ1+v94jPYWpOiZoPaEVLT4Fx69hi+I
	iG/CN1HWBQ4rr42XSNcUmALfw4cwmA2pF3kMzEB6FXBlLT07mfgobi0FQSVtVANMxccinQHgMiv
	opl/mV4U9NWE3LgsfrUmDKI4z1QfIIhP3z0nBkIXh3fInvNjSphBSC4uE5AuAOuXJkZ+V2HVs3C
	24q+jTIQCRGzRqAqo6rSUwT9po+oZvfermI5Diqo/T5De7mEfkPHzgUkWcgavWJZ/SXBXoNjHy1
	tWT1tNqVv7MeT66VkgcElJcgj08RUAvCcSE0E
X-Received: by 2002:a17:903:78e:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2bd5277b510mr128237325ad.16.1779189736232;
        Tue, 19 May 2026 04:22:16 -0700 (PDT)
X-Received: by 2002:a17:903:78e:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2bd5277b510mr128237085ad.16.1779189735693;
        Tue, 19 May 2026 04:22:15 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe78b9sm192743605ad.43.2026.05.19.04.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 04:22:15 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 19 May 2026 16:51:24 +0530
Subject: [PATCH v2 4/5] arm64: dts: qcom: Add Shikra IQ2390S SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-shikra-dt-v2-4-c01b90fb4395@oss.qualcomm.com>
References: <20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com>
In-Reply-To: <20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779189702; l=3729;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=JUEXjiXpIktTHbarzyKyF4Q45ihGQ06q9JmKCLzg9Yg=;
 b=qs1bdAnb5wYepzdCe+VQK/Bw8na/AoGH5qmjUbKFj06jHlEKXg8jbV3qMQuxgxIuDJL1Av4ow
 5CAsfjjrturB0vjjQUSf1U//khv8TCu7fJJ6+hHjeu9pwE2x8yVVGUm
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: -MKyB05UCaxZqdUtTI58_cwFt49jUtyL
X-Proofpoint-ORIG-GUID: -MKyB05UCaxZqdUtTI58_cwFt49jUtyL
X-Authority-Analysis: v=2.4 cv=a9sAM0SF c=1 sm=1 tr=0 ts=6a0c47e9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0jgzHgEHJPmc57PvYrEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMiBTYWx0ZWRfX343ZRL+qgjTB
 adJ3W3KIQfbhyal3KdM3hRH5gJXbiFl1RCaa89rVbSEwx+8fk2QLMst/o7GjMSlq8BW8Ec/Y5lb
 4sPiBWZuCMv4yTyq28XzVqVQmVnQpc2rhwmGZpA1Bzipr1g7B1rhqoCtKTATOC5LHNakrrL7W5p
 bckz9f89ALtRPzEIHh2WNJpC2wQKMwXXHo+RUOzjBakAB5IbFgQhp7BPHtVOJVuxiEon47fONMj
 G3koNfu/B9UB/Mgs8NmSf0X1DN2UT+0h5iRdlegkc4nIe20xOXnmx+sJHUeW20tdk5ux/ZFVxN4
 WN3eezdjAw6K08rX0Dn5S8THXhasFLWAJiNW95q6VtXfWGrULFFAihX6Ez5NscEWmElgNqy70dG
 YM7l1mUpmrpUG9RcDnyTC/GqP8bgy6D/Do6iKZbNKb0FqcIGfUjpXr+1HqTcc29x/5TyfvksMm9
 ZYNHCtqpCwFPQ0F+j0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190112
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108476-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B03057D968
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree include for the IQ2390S variant of the Shikra
System-on-Module, an industrial compute module integrating the Shikra
SoC and PMIC for industrial IoT applications, designed to mount on
carrier boards.

  - shikra-iqs-som.dtsi: Industrial SoM without modem (PM8150 PMIC)

The DTSI includes the common shikra.dtsi and adds PM8150 PMIC regulator
definitions specific to this variant.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 127 +++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
new file mode 100644
index 000000000000..2495e1aef1a0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "shikra.dtsi"
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm8150-regulators";
+
+		pm8150_s4: s4 {
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		pm8150_s5: s5 {
+			regulator-min-microvolt = <1574000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		pm8150_s6: s6 {
+			regulator-min-microvolt = <382000>;
+			regulator-max-microvolt = <1352000>;
+		};
+
+		pm8150_s7: s7 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8150_s8: s8 {
+			regulator-min-microvolt = <570000>;
+			regulator-max-microvolt = <650000>;
+		};
+
+		pm8150_l1: l1 {
+			regulator-min-microvolt = <312000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l2: l2 {
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8150_l3: l3 {
+			regulator-min-microvolt = <312000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l4: l4 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <975000>;
+		};
+
+		pm8150_l5: l5 {
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+		};
+
+		pm8150_l6: l6 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8150_l7: l7 {
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <2000000>;
+		};
+
+		pm8150_l8: l8 {
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l9: l9 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8150_l10: l10 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm8150_l11: l11 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm8150_l12: l12 {
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <1950000>;
+		};
+
+		pm8150_l13: l13 {
+			regulator-min-microvolt = <2921000>;
+			regulator-max-microvolt = <3230000>;
+		};
+
+		pm8150_l14: l14 {
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <1910000>;
+		};
+
+		pm8150_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+		};
+
+		pm8150_l16: l16 {
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm8150_l17: l17 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm8150_l18: l18 {
+			regulator-min-microvolt = <400000>;
+			regulator-max-microvolt = <728000>;
+		};
+	};
+};

-- 
2.34.1


