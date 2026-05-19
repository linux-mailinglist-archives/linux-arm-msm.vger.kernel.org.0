Return-Path: <linux-arm-msm+bounces-108475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LorOF5JDGoMdAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:28:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8653757D934
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 84120307390A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9165F4963BC;
	Tue, 19 May 2026 11:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WnTob3+M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NAiVWFS9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D7F4968EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189736; cv=none; b=lGJxaNFveOkxJWJvW45lyO+R++wfQS6ES2EDBG0RX49wAt7wIWThli2zBo7qlImFLCIttTzT0m4/q2fZf7Ohs4ELZ5v76CI2+c5Cbt0qBC4j+LDVVhj5Cb1vOu2ZI3CujEufgzZ8xkvCeixnjxMET/1z1ntiIRDWzkDmhCaQF10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189736; c=relaxed/simple;
	bh=ROfWYzqfLTfeWEuSE0CQdQnZtXIf2oyWevn96M+Mxqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DBLbYoUmIpTqebt9iQPLEGxuMF8bXOIIJpzj/reaWcsapReQO7PuL0CDTBbSYUyRMZyAk5PL5I1TWOI9+hCzs7iUnumvItRnkVOBjq7Pm0rTs1Swk+V/TKE7nKmThUuqQkkVR6vLdTpMp8W0u8NV8ub29dQL+c42VRbDMPvZbeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WnTob3+M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NAiVWFS9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JB97dZ867050
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IfCZBMhzSxU+6bFyzhG5aUVHXkjtGzqCHGeI9Odt9/w=; b=WnTob3+M2nl9fu13
	YqmnFopwWZ4Uta0SKpMeP4yYCkLcSl+3NGgkbQI8ZQIGhaepN2/BLVsDOK0gkv/W
	MadvYwIj7OcxqJ+WFmWCQUYGwez95sHcaMdSqlvB74Rxt8bGp3uG1eIeBWXdMNEN
	vasCf0vMLg+s6fJD1TMQgLixZbSNNCLN1uOALYkVXyDvh4t9ETjTmgt72+6QUVRw
	2ocXhyH9k3gXRjX9d8ig446PBNvusNm0QbFJ1A/hUx9jX0XGitrCOjScvHvqwOki
	1fwBiBvEwT4ou0n6YkN2aSrXolcgxOuiP1IqB5Wb5FfsYUrGyqzwDLFwm5z2OAxH
	byuFkw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1heyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:22:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3684cb22502so3185690a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 04:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779189731; x=1779794531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfCZBMhzSxU+6bFyzhG5aUVHXkjtGzqCHGeI9Odt9/w=;
        b=NAiVWFS9Gf/ClcganLy2iOBYB/oC1UBCb1BqlZLWT9MNmEJZbJs3FTIq/3JNItJXVT
         muX5di7jSZIYX9LMDg/tYws7UTKW3eY/W1IFvtA+9zS+MmawBUvv80udl0rDD2Wj4lWJ
         nWP0QCp1t6OaQejten+O6ch0E4Dapkw91IUlc49vUWl9+Bx0Os2AQ0l2dlXr6FoblvVL
         2tz7rohPbDEOsGjHWEZ6npOXANrQrFELXJRFz2ZfNsokC+QxSmoU9nObvLyC3Y5jPmnK
         1cJS3+uBHzj4sfqEIhamL1dHMi4ihhapqVbgDd1XLBQB9oyiLK6B4EbAic78ri8xFrkw
         5WDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189731; x=1779794531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IfCZBMhzSxU+6bFyzhG5aUVHXkjtGzqCHGeI9Odt9/w=;
        b=M1dPAR+i2Yoh3Mg1Wk9z6pHxK1yqbMRvHaURTjgpYG3immdRqjTDLbs5S6vVr2/RKU
         Vl0LtzsRGq4gpCFuCXu8S3w+5FHrmsO7tHrnEpiSUpb6kxuNal4TAbvfvfgXndHKNqq9
         9iXFuMU7V2QcdGiYbW85WMq5sbDTpu3r0lUDn2EWG2coQTDiOqHKwuG9niNYCpYYOJ2E
         IHsmnfMRE2bWr48NsoHXKviKiw+pompdagoiWPUwx1ZN8i2rfm2P5Y7xK0fu3dOyl41s
         dxIJayWkpewgHDzODBeZbs2Q1ZQwHO3r/XsYFGdhIaE3x6DSTKXampq5L8oZdsPgJBoQ
         8m6Q==
X-Gm-Message-State: AOJu0Yy1SEWpONjyJEfT7QEBgozVqEvTpqpKVzwQutojAfpVwRcRGITC
	dd2QbZm8KKFQRAAZEiN3vmBOmHK/4BUC+VNdYedC+qeBlApiU1Q4Zm/K5BZh0OegK5JYVdys+Qc
	Brn8MQrajU0Is5ALbRVtb8BrpT4KWYSHMCvoeRxhMFLbgTPU4/5jUCOD0ssGst+Z0IsKW
X-Gm-Gg: Acq92OEIhi/iffZLzwmVT5b5pAFBp3hqYwhxns8h4BhI5eeu3RCWpRy+Or2zDFJyWuw
	KuvUiWyL/IgoPJo+Xp8a6Kr8WUN69oX27t8mIgzLG/fD0rGv3xaVI9IZFXhWMfd38hGxWpF6/AW
	xLxufv2AOPbEB7RlN7z5rzW429UhZLglMWoBHrcaHpVMvVobBgX+cOqJPeJIj1Xxol8I/bZKZXB
	1CkjZtoysImsZgQW6653VxhtrHl3/UeyC+V2cE/zLx5U/9Fu3MxI91O05uGByIbUAO2056jSK0K
	9J8kxVU3f8Bn4hKrbnBtdLLbixJs17kt6k2WN3O9zrzUwk/FCOfFk9npprwiU7lEUDd5L8ECD20
	8kj4pjifWQ63R4vw5gLIUkxaSdg2b2GSvrATPreQddbRdT5M=
X-Received: by 2002:a17:90b:5110:b0:366:1c9e:99b7 with SMTP id 98e67ed59e1d1-36951dd286cmr19479020a91.25.1779189730755;
        Tue, 19 May 2026 04:22:10 -0700 (PDT)
X-Received: by 2002:a17:90b:5110:b0:366:1c9e:99b7 with SMTP id 98e67ed59e1d1-36951dd286cmr19478978a91.25.1779189730169;
        Tue, 19 May 2026 04:22:10 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe78b9sm192743605ad.43.2026.05.19.04.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 04:22:09 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 19 May 2026 16:51:23 +0530
Subject: [PATCH v2 3/5] arm64: dts: qcom: Add Shikra CQ7790M SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-shikra-dt-v2-3-c01b90fb4395@oss.qualcomm.com>
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
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779189702; l=3493;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ROfWYzqfLTfeWEuSE0CQdQnZtXIf2oyWevn96M+Mxqo=;
 b=pP3MfIHGhn/2oScZhcEZ5nSDWVAT+MjrRFL+l++qEoyV2NLrC91s2HU+2wfbjUJBflxtID4b6
 GO7T2+s7/HFCQdZ5ob9rgpy/+9aEd3YuQE0d14egoVbvmn8RILw7tki
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMiBTYWx0ZWRfX7rAx6TEcB/uB
 /wBcVe2RC2inUYTQNQFaQyE3CmSlaw1cnR66lSDrKWm3ZWwruvJ7QAxB8u8rCqteeoNOa7SOZfl
 eDVl/9Zct+ZNzzNJbih4mxQxxnlZwym0qMRTpYLObOVJOIvwIfmKqGZdz/BIbzhE4ZWYJStkxRx
 SJEklz2Z+Z3BvJ4PK1vOt1TJLSMAHggtA8jm59xLOrpH/28aCU98hZskehI8r09fb2TAsrW6hUL
 bjqY/fCVnn1J8XJoDZ/zcxe6wOWF5LNpTPzV22CCTImdKz7RPXuVu7KPuuJtkvjPUC3NJ57oRUm
 h2AvR5043Q99OylHkH0Qfa6nazphspaVzq2lxSiPGhPc5zKFKRQaV3qNNMzQDDqvJNPQ6d7jSAH
 aWS/xxpwOgbw81LUf3LzeIMwocyZmshV8Vc4+gCjY1KzXv+1PsSqpZNlUhggfsPhSVlsPSOTIHc
 scTVvTyJdKRdlg8r5vg==
X-Proofpoint-GUID: J7swnjosMAVmTCoU34fVMjkWKaoa-qTA
X-Proofpoint-ORIG-GUID: J7swnjosMAVmTCoU34fVMjkWKaoa-qTA
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c47e4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yuh6J1mAL7zzRkeivMgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190112
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108475-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8653757D934
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree include for the CQ7790M variant of the Shikra
System-on-Module, a compact compute module integrating the Shikra SoC
and PMIC for IoT applications, designed to mount on carrier boards.

  - shikra-cqm-som.dtsi: Retail SoM with modem (PM4125 PMIC)

The DTSI includes the common shikra.dtsi and adds PM4125 PMIC regulator
definitions specific to this variant.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 112 +++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
new file mode 100644
index 000000000000..401e71720519
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "shikra.dtsi"
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm2250-regulators";
+
+		pm4125_s2: s2 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm4125_l3: l3 {
+			regulator-min-microvolt = <624000>;
+			regulator-max-microvolt = <650000>;
+		};
+
+		pm4125_l4: l4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l5: l5 {
+			regulator-min-microvolt = <1232000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm4125_l6: l6 {
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+		};
+
+		pm4125_l7: l7 {
+			regulator-min-microvolt = <664000>;
+			regulator-max-microvolt = <664000>;
+		};
+
+		pm4125_l8: l8 {
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm4125_l9: l9 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm4125_l10: l10 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm4125_l12: l12 {
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <975000>;
+		};
+
+		pm4125_l13: l13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l16: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l17: l17 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm4125_l18: l18 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l19: l19 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l20: l20 {
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <2952000>;
+		};
+
+		pm4125_l21: l21 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3056000>;
+		};
+
+		pm4125_l22: l22 {
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3304000>;
+		};
+	};
+};

-- 
2.34.1


