Return-Path: <linux-arm-msm+bounces-91967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJiNEFcIhWmj7gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 22:15:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D841CF781F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 22:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2A880300334F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 21:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3B4330327;
	Thu,  5 Feb 2026 21:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtrnWW7Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vfy/Ch/H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AD833030C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 21:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770326101; cv=none; b=TX1kBw7uj76Y0rtQ7bKaN+5Rc/Eu1N5Pywh5pnaJPUH4jxozHwj6FMuPw7HsE+wifQeYkI7fu2l+7FgkTYSDkEiQoIb1QBC678/CvI2rdc0/fz8rHwAoK+9FqdnjMx7TR4DKtW7Y/zt4IJ3fOy231PMR6Pv2CZ91zzT1/QXplGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770326101; c=relaxed/simple;
	bh=18R0qSSv07h1ngKxwt+H3ZLCr9zg7hRw+iZuIcr5Ibk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cOptey4DGKGHH29PoHfTGH8lVHlQpzPE7oJZOJcsWJKkU0sw2cDzTCm8HO2eCe66ChgQ43KrslooVWU769j2QBc7c1V2qa1RIjfpyGHXxg89uPXFzsCbM9sFpASsKnjaDY810Nuuxbkmqy89V1C0UpVG8bQ3NFFEuUf3zIvomuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtrnWW7Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vfy/Ch/H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615FrJpl871877
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 21:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UQOtBM57MmbHKjqpxUnky/tx6UI1uoodjbjNK5Q954A=; b=JtrnWW7Q9J3r7gWi
	R1LtMDcJTD0gMBH+7TBCv99FlO4j6sNKFyY83T+vUfXhNHWG/0qtXG3LoucScBzc
	7IUdswZ9vdUwJGBkl9brcIxWP/MidGAZdcxuafqj5xIi7oJBd5+yOcDMsZCARTNM
	MMPIA181npNTYsblVrkRunBHyKHGqG+UzpF+YTVQJ/AmDL0KInXeXC2WcQ0l62OJ
	qjHZd6CWxm+gL+d+DWACbZO8QjZuvR8o1/6TkuOzcusqD5Ug5M/2v5JJU7MsWXN+
	6rs8NTsqgOuW1xvIy6wfUcHa+EvDEQIHYIpsBkeiaQ4Xbmm6SZoQ8ctorr4bcn2c
	BWnMFQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4x8bh12a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 21:15:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c38781efcso1277121a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 13:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770326100; x=1770930900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQOtBM57MmbHKjqpxUnky/tx6UI1uoodjbjNK5Q954A=;
        b=Vfy/Ch/HSldUADnxLfEfjr7M84tULJqDaarRsPcPcSZlEeqIJdAlORB+KPDk1ibqOX
         vjaHVN+dpIELLAzLPElHBF5x0I0MVfwKFA6qkjAklwL5CwVFbxBjn5SFri+1aQ+ED9IB
         rfxNUVc79LTqyN49q1vBl0JBRbCbvaJtQ3kbSOSBltteW2WEW1wCz1xXU8QLiItCDjGD
         gQBX55/RQ5ctX3jInmBXumz79ncNhToux7bDjwOt7mgs/1yWX2N10r8HerkTbbnk1zhi
         ve4wsuWOe4qWADF6Yrkw9MpzlsKopA9GzQNtUoGPouUCWLxFwz6PctQVddYkdVIM3UIZ
         KFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770326100; x=1770930900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UQOtBM57MmbHKjqpxUnky/tx6UI1uoodjbjNK5Q954A=;
        b=MWAj9F1GWUFrg/+5o+TCV4Z1TvZv7f629VuJNFrGsBydw8QaKkpYNQfGsq4Gak7rgV
         95c4cWKRI9EGahO7YUh8u+HTAXDJAVB1udfS8iexNDvQWS4ykciR7Ej/eyJ8HPZTxwkp
         UNuaNQNMMf3A6n35cHmbjs2AuMIpFkqxupkAxZHzHvj6vFsjdYLB2/o9K4S6ffuBVolo
         ZRIrCF0kql0LPWD9Y/NGmabY7Om3vMRHxkQAfBLHz9ouBDPBZrGLZEkD17humgZtu7Ze
         IlkyVzDOukF+g6mVEMe+KQBUKPD1sfblcPVReIbWRwxcn3UwmJyJhmGliwb/2MMeQOsO
         EwkA==
X-Forwarded-Encrypted: i=1; AJvYcCVnfLqY2K4HZDuMUuJbCGvMi+E4NBrcOWKyztmOhUKBZ4nUj8Gj9gqBHDTjhe53RfghaNKh2aCFOPNZ9JCe@vger.kernel.org
X-Gm-Message-State: AOJu0YzGTTEv5C5TsftbNbAn8UmK6B/CD35WzByu2jkU5z0VuTjW5N3o
	uimZ56WYswrSsuyvTnBhIhwQ1X0WBcRkRHsvtcFkpjMeIefCJ400+CujN2o9cwst5N8ZOUuqaJK
	3DTU/BkMK5IISXy2w9ckRaLlQM7ogqWcRBVOYK5WbPl8K44VZBdQZmMqbsknik6vNMMx9
X-Gm-Gg: AZuq6aJVloh4GiknT8vaJIUc/L/LAobOQYlELvEz9Z5i/VeNexLDOxQueQWClcE/vQC
	QV6Vnha9bHIeC97hBNMfbqSy/H5eWD0H3KvbwLMt5fXVq2KpcxdlU3n3d+DNDc61zcQOB+aglQM
	C39W82SzImFmtc7RgdSv/OEIMnJKYI2uTM98ag4w0StKx5DMkJd/SjRTDe/z2Qz3Wjm3/iPhSDI
	SyD0LXwH6DQlLinWExRqIuK4Id2EA60XEy3U3HItpVdRRKHqBZRSY1BmJ/QTfawUBVosORjxcGg
	wHAQMm+qLbIW2wt4EFXBoZUJ3vU7AIaLJr8h9VD87f2s/0n3n9wFAKyPVHACph+xLsap7cLdOgo
	ghPedTHJfCcLThfMWqgVM0s+L9CzfP73j4GsEwGK/+QZM
X-Received: by 2002:a17:90b:2d90:b0:353:3f04:1b78 with SMTP id 98e67ed59e1d1-354b3b9231bmr322380a91.4.1770326100097;
        Thu, 05 Feb 2026 13:15:00 -0800 (PST)
X-Received: by 2002:a17:90b:2d90:b0:353:3f04:1b78 with SMTP id 98e67ed59e1d1-354b3b9231bmr322356a91.4.1770326099555;
        Thu, 05 Feb 2026 13:14:59 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b4575897sm74536a91.3.2026.02.05.13.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:14:59 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Fri, 06 Feb 2026 02:44:05 +0530
Subject: [PATCH 1/4] dt-bindings: hwmon: Add qcom,bcl-hwmon yaml bindings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-qcom-bcl-hwmon-v1-1-7b426f0b77a1@oss.qualcomm.com>
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
In-Reply-To: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770326090; l=4403;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=18R0qSSv07h1ngKxwt+H3ZLCr9zg7hRw+iZuIcr5Ibk=;
 b=ct2Lcman2D0ijp3O2OBhtI+OgvAyZBiLSBSefKZ8v49MDF28mLbLlJVF12iQxzg9g4BFKiJZv
 koTFoi0akIxCPTJhN0EQjFLTlTtDwIWl9bnXxb4j2kKcU4WPdG71E6k
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=GaoaXAXL c=1 sm=1 tr=0 ts=69850854 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=cA4Dq2qPJpiW46iHo-AA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: JV9-aTXsyHwJQZuUy_PQvjP9kStCIvVm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDE2MSBTYWx0ZWRfXxsZCpUpbUT9G
 lKopCFYLoDIh87EFwp2JRwNgV0KbQXvyVvLU5bVlMaMolyiHtDGC8Hkm9WglaVausxiMjjaPVO7
 tq8JOqEqqcaD8RsyPyfoiWuk5zmTIz6FCZ574iY+6s4SsTFfSHy7HEpt1zV99KK4mksarcDJMEJ
 E5PmA5gyHEDWHatSHSed/k/+D1cDrpmcelLIusCaJcGYwWy73vgk4dgYfzZlyVCmr3s5yxgybJU
 qnAB4YnYk+O+u/yQW75zavfH9d6YuRuyDUZyW0RqaoehSoGkQU1Qc2+n0eBsigTvhJVN2ni6usc
 iDwqRzRzKBcpk834g7iNSKdmsoWleEwPH0KYe3eY/VFe4l+7QdMX5fwRKZkp7FF/h980hx7WptE
 0/XmjqypoHAm0xQCWy/wgBKNBb7PUdomzWoT8svDNE9hXLrEHqHnKWBsDwLj9cV1e5sglALe9zl
 JIFr2rHUEkE3jpGfOjg==
X-Proofpoint-GUID: JV9-aTXsyHwJQZuUy_PQvjP9kStCIvVm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602050161
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91967-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D841CF781F
X-Rspamd-Action: no action

Add devicetree binding documentation for Qualcomm PMIC Battery Current
Limiting (BCL) hardware monitor. The BCL hardware provides monitoring
and alarm functionality for battery overcurrent and battery/system
under voltage conditions.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml  | 128 +++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml
new file mode 100644
index 000000000000..a0e8eaf13eec
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/qcom,bcl-hwmon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SPMI PMIC Battery Current Limiting (BCL) Hardware Monitor
+
+maintainers:
+  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+
+description: |
+  SPMI PMIC Battery Current Limiting (BCL) hardware provides monitoring and
+  alarm functionality for battery overcurrent and battery or system under
+  voltage conditions. It monitors battery voltage and current, and
+  can trigger interrupts when configurable thresholds are exceeded.
+
+properties:
+  compatible:
+    oneOf:
+      - description: v1 based BCL
+        items:
+          - enum:
+              - qcom,pm7250b-bcl
+              - qcom,pm8250b-bcl
+          - const: qcom,bcl-v1
+
+      - description: v2 based BCL
+        items:
+          - enum:
+              - qcom,pm8350b-bcl
+              - qcom,pm8350c-bcl
+          - const: qcom,bcl-v2
+
+      - description: v3 bmx based BCL
+        items:
+          - enum:
+              - qcom,pm8550b-bcl
+              - qcom,pm7550ba-bcl
+          - const: qcom,bcl-v3-bmx
+
+      - description: v3 core based BCL
+        items:
+          - enum:
+              - qcom,pm8550-bc0l
+              - qcom,pm7550-bcl
+          - const: qcom,bcl-v3-core
+
+      - description: v3 wb based BCL
+        items:
+          - enum:
+              - qcom,pmw5100-bcl
+          - const: qcom,bcl-v3-wb
+
+      - description: v4 bmx based BCL
+        items:
+          - enum:
+              - qcom,pmih010-bcl
+          - const: qcom,bcl-v4-bmx
+
+      - description: v4 bmx with different scale based BCL
+        items:
+          - enum:
+              - qcom,pmv010-bcl
+          - const: qcom,bcl-v4-pmv010
+
+      - description: v4 core based BCL
+        items:
+          - enum:
+              - qcom,pmh010-bcl
+          - const: qcom,bcl-v4-core
+
+      - description: v4 wb based BCL
+        items:
+          - enum:
+              - qcom,pmw6100-bcl
+          - const: qcom,bcl-v4-wb
+
+  reg:
+    maxItems: 1
+    description: BCL base address in the SPMI PMIC register map
+
+  interrupts:
+    minItems: 2
+    maxItems: 2
+    description:
+      BCL alarm interrupts for different threshold levels
+
+  interrupt-names:
+    items:
+      - const: bcl-max-min
+      - const: bcl-critical
+
+  overcurrent-thresholds-milliamp:
+    description:
+      Current thresholds in milliamperes for the two configurable current
+      alarm levels (max and critical). These values are used to override
+      default thresholds if a platform has different battery ocp specification.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bcl@1d00 {
+            compatible = "qcom,pm7250b-bcl", "qcom,bcl-v1";
+            reg = <0x1d00>;
+            interrupts = <0x2 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x1d 0x1 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "bcl-max-min",
+                              "bcl-critical";
+            overcurrent-thresholds-milliamp = <5500 6000>;
+        };
+    };

-- 
2.43.0


