Return-Path: <linux-arm-msm+bounces-66386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B363B0FCD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9C5D3B08BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BB2278E63;
	Wed, 23 Jul 2025 22:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z6NPux/N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7638127511A
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309693; cv=none; b=jb4f1vLZ9F+qNgQdBk2J9npSHPlPvi1nNsGogKTR2n5hkJ+Pxrdu9+RuI+GzfVFhbwWjibzg42aBhe8Eim01Ij0m+eV5A/LcUBgl2AT6LU+fPmQjwfRKOEd4Xq8RZgjOnXH/qddK8m/CVJZ8El8JQqInpmkRR+YefLN52kuQLWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309693; c=relaxed/simple;
	bh=89IdTGEl1KJByV3edAjJliFKNNYIw95TE3HPTPmOzts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cmoJOGjTEDdy3NOAJeQ43fc4uZsbEJbFM0AgB5cmN3oQxNdZqct7s+m0cI0xrn95X6NFgTIxHiXnFa131OxYqUalD40k1l2xNvZdtzKlHmF5YKGAHKit3fy4qQo7/tuh9rgQeog/zXy7fYCyiuTycDE5OZ0YYliFkPuJfpv8zIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6NPux/N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NDxJcl002740
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k1140a+9O+2
	Qu50wuXuNC/h7aX5fpByKtVu2W2jNbBs=; b=Z6NPux/NB+95gIx9upFI8HQ+15V
	L1koxhr7S85+R6KjDre+FrWOGcYuicsKmPIUGQ52uz0k5xn4HbFTeT8BtBKvTL27
	S9pW9oYM0k7stSV+4fdEwbn3zXMqUYVsz4Vscb/tSwp39KZos4/yVmaqxFKGiaNj
	rBU0BZSVUHGGwrqWXM29nG4oXKY9iWAdLYLZ6pmoNX8KB8vSpa8V0iMaJGLpXy2c
	uCbSQwxQoAii6O8k05zNiIn73o2wzx08Vn8Iv7VW28fiJzLA0v9wvPk9gPrBEStB
	1RaN9Rq7uBU+UgT0bDprhADBTs+dxbGexa+uSgDAQLFtigWx9qTub52unrg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313khb4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e32df3ace0so32015185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753309689; x=1753914489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1140a+9O+2Qu50wuXuNC/h7aX5fpByKtVu2W2jNbBs=;
        b=hJOY5cz024b+pPJWRxGdknLYPkrPFlCAB3pe+sOvTKjmF9coVpAKdEIEi1PPDgMlxb
         PJUBH/SDisO13cO4I6m/+KH163G0OAmUd20aEvxvQEeM7FtQhtZEQIaSdb6mgNU4Do38
         5v2FckqKGa+aFF/NOAB+wT0A3P6IFfOKSuXyehfbhxs/A8h9wK3tMA0HzDJsnZAfXgHm
         LwlrsJivi1OEEeiBdyQMmr+kKDOJkDLfYs4cMkAbL44+CA/NnTLa8ycRdnSoY2T9YL6T
         E4MPObtYjLs/ALWQc8u21QgJSd0/fMrN6k6wxSZTKRXCJjROWx1K6YPldMXE0EzOe059
         I19Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZwXCRDJmzaDPqMT+lUqZcSpqTh4Ne+IDClOu/voa1yHJPExZ7j7yF8L1lpLLTSi+U4D296qmyOl5WxdPi@vger.kernel.org
X-Gm-Message-State: AOJu0YztTyk/XRiIVFL2Tj/Aubwao5g4r2qH68mpoMf3xcAtcsrFWfHu
	4cOBLsLPpa3ExPA9uj5/N313RO0qE26tLQBAM9KamyKgtgeOxbvE2jD4FTwJn0z4PGcGKyHyJFV
	Ma2zhrwFvdzJJxXD2tuxWF9L9XDq7PFRrBo7uGQ1lXgKBldOcTTiKawX/2Ig0uKPsO8UJ
X-Gm-Gg: ASbGncsnfVtgfZnYULUgcua77yHkOOaCMk7K1GkMAbtXf8bxD8kw5zLAKV7zOqzG/6C
	TJ6AE1OQmkcH40QfANgY/2zE/KjfmNwrz4invVyj+2UVinAULsrNUDunhKO0J3XSlfc6f1dmHtK
	1LHeVlJEwFsD8WGuREFM96bYs0bhZlN/uKlHF0PoYMhqVDia8lQHl1tmAUllfq3yN+aXz84mJsM
	3Jk3xlVMz/0Z587I6NdlAseANSjfFdEfq6YyqsMhPstn6BUsmxuZyZVccS0tCiC0zEThGov4ORj
	N0whE683Cu2nSk6d+SvNYDWpyVcN8m3UgaHn6mT6g1KagID4jNyhjw==
X-Received: by 2002:a05:620a:e82:b0:7e3:3894:112f with SMTP id af79cd13be357-7e62a17607cmr484604285a.42.1753309689281;
        Wed, 23 Jul 2025 15:28:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyfHbo3ZkEJOh6+0ceiCSgzdkkDR2pY17H1wQulirVUvpTPanhXji2zAV+s1xUIjYIzSC07Q==
X-Received: by 2002:a05:620a:e82:b0:7e3:3894:112f with SMTP id af79cd13be357-7e62a17607cmr484601285a.42.1753309688692;
        Wed, 23 Jul 2025 15:28:08 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad23bsm248520f8f.44.2025.07.23.15.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:28:08 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 16/23] arm64: dts: qcom: msm8939: use dedicated elite-audio dtsi
Date: Wed, 23 Jul 2025 23:27:30 +0100
Message-ID: <20250723222737.35561-17-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MyBTYWx0ZWRfXxL28cnnQs5TF
 9tVkeNjMpeWmKdm77Lko/JUIX+AfRV/7pMdHB4ilLDfQaw5cXSjyxYbHiu7lf4A7tGBiqQq9PJ+
 kiMU831MuOCanCfH9nyUv8o8Tf2XGMoI6llTC3S5XpqiZgMHxZfoI34eogz5cKIwEWxyqLNAkdV
 NiN0v2n6Q+gfFknQR0CfhZzrcb2tso6aK/VrH/jGkIYGDLibvd0UQtG8wojnBYx/9bAF6doxdTM
 sa7i938l+i2aS+c1AE/wVDS2Dy8wOnR0DLCDl8nnZrx/f+fePMPX/rRwyA+TllatmdvJOKgqs/J
 McAhBeELdnaE74t+QNvS1RY9IUJFJ5DbbhGerDHlYLrlalHZvBpUoSplRy1HsN7mEZ/aOwlG9N4
 nTON3e+hcmjfS+9IV2RnlIdg/N0QBESkSqLTUobhOjS/NnnfEaGmu6aSOzlbqAXRC05siCRC
X-Proofpoint-ORIG-GUID: hhU9H3_0gsxUkpk-stvhSzmekGWLKp0D
X-Proofpoint-GUID: hhU9H3_0gsxUkpk-stvhSzmekGWLKp0D
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=688161fa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=RbKoELg_0CB1znD9PlQA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=659 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230193

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Make use of elite-audio.dtsi and remove the gpr nodes from SoC dtsi.
This move removes duplication.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/apq8039-t2.dts       |  1 +
 arch/arm64/boot/dts/qcom/msm8939-audio.dtsi   |  5 +++
 arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi  |  1 +
 .../qcom/msm8939-sony-xperia-kanuti-tulip.dts |  1 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi         | 44 -------------------
 5 files changed, 8 insertions(+), 44 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8939-audio.dtsi

diff --git a/arch/arm64/boot/dts/qcom/apq8039-t2.dts b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
index 38c281f0fe65..1d1bd9273325 100644
--- a/arch/arm64/boot/dts/qcom/apq8039-t2.dts
+++ b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "msm8939.dtsi"
+#include "msm8939-audio.dtsi"
 #include "msm8939-pm8916.dtsi"
 #include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/gpio/gpio.h>
diff --git a/arch/arm64/boot/dts/qcom/msm8939-audio.dtsi b/arch/arm64/boot/dts/qcom/msm8939-audio.dtsi
new file mode 100644
index 000000000000..fe17bc28e825
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8939-audio.dtsi
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include "elite-audio.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
index adb96cd8d643..1ba802037989 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
@@ -9,6 +9,7 @@
  */
 
 #include "msm8939.dtsi"
+#include "msm8939-audio.dtsi"
 #include "pm8916.dtsi"
 
 &mdss_dsi0 {
diff --git a/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts b/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
index eeb4d578c6fa..cf55b854b7a9 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "msm8939.dtsi"
+#include "msm8939-audio.dtsi"
 #include "msm8939-pm8916.dtsi"
 #include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/gpio/gpio.h>
diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index 68b92fdb996c..bee5fff2a80e 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1638,51 +1638,7 @@ smd-edge {
 				label = "hexagon";
 
 				apr: apr {
-					compatible = "qcom,apr-v2";
 					qcom,smd-channels = "apr_audio_svc";
-					qcom,domain = <APR_DOMAIN_ADSP>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-					status = "disabled";
-
-					q6core: service@3 {
-						compatible = "qcom,q6core";
-						reg = <APR_SVC_ADSP_CORE>;
-					};
-
-					q6afe: service@4 {
-						compatible = "qcom,q6afe";
-						reg = <APR_SVC_AFE>;
-
-						q6afedai: dais {
-							compatible = "qcom,q6afe-dais";
-							#address-cells = <1>;
-							#size-cells = <0>;
-							#sound-dai-cells = <1>;
-						};
-					};
-
-					q6asm: service@7 {
-						compatible = "qcom,q6asm";
-						reg = <APR_SVC_ASM>;
-
-						q6asmdai: dais {
-							compatible = "qcom,q6asm-dais";
-							#address-cells = <1>;
-							#size-cells = <0>;
-							#sound-dai-cells = <1>;
-						};
-					};
-
-					q6adm: service@8 {
-						compatible = "qcom,q6adm";
-						reg = <APR_SVC_ADM>;
-
-						q6routing: routing {
-							compatible = "qcom,q6adm-routing";
-							#sound-dai-cells = <0>;
-						};
-					};
 				};
 			};
 		};
-- 
2.50.0


