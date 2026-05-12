Return-Path: <linux-arm-msm+bounces-107030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yH67OeGnAmpSvQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 06:09:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D439519795
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 06:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1ED44302F698
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 04:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F160315D5D;
	Tue, 12 May 2026 04:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="So3+h3e5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iT5X6WM8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2472C30B53E
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 04:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778558934; cv=none; b=bExbL6KHqpcEyhJ27pf5Ed00rnVrZfLNlqR98AXrP94R9AlPBI/P2v4snk3oEr4fAAYF6HKhgTO6S/WNdd99QP96yn0rroQjFjQGKcip1Nu+En+NMtVaw82qAGPbGFgtOb/o0PM+vDJo/Vj4CrgfwFrOd9MIwkyvcVDGYPkFxto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778558934; c=relaxed/simple;
	bh=QSWsO4NtB0gyoZ9UE8wQtjGZF5+pdJM1iPNPKJBGnf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Za5sXG1jXGnM6OgxMrDcfmor9MzzXBIBxzUOWp2gUmTPSkjTO+qAgZaNmRNY1QgUA1WLIvFD7jTNVuQDq7+iCtcNp8JdqMus/Sgg6Ohe58oHo5oydrsCoq2FtNZtVcErsxtdWexfvjD+tRhq7BBEnUH4c+7TCzI33DB3x3NYyC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=So3+h3e5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iT5X6WM8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6h4a866134
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 04:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5iW5TdGJXyw7GTZ7b4X8R789iXoMJ2Yg7+PSjFZ5I6I=; b=So3+h3e5lvFqRYL+
	HkmUGibOTVjjXqWXsoAKeXdPom8G8m9DFcWk5ijByiMR6FC8YJMfC1E1kKTfz5Ga
	ZqyvRbJSBDGn6OahWzH3e308481+hat8kZPba3hpOJfJ2V4RHsI1k98TElo4p3Vu
	g2tVf6ocynl/1bS6Ob0XdD5O3vaxN1uG/1LnYCV3HTTFhtTxjk8qTY1s5oY9LRV1
	iR8Cfi/RkRgYW2ipX4JeobsD9gPDBVhbQuJDwMPNTMKtKQv3oVRU2BCf+pLMfmqB
	iveO7LOn0ItNuZO/bXa7aMt+w/QQ1hbEdUhqsdhQME3TcK9jEt3rxHkLYJW6Ix7p
	ZutqsA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv295t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 04:08:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4530a90fdso124349755ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 21:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778558931; x=1779163731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5iW5TdGJXyw7GTZ7b4X8R789iXoMJ2Yg7+PSjFZ5I6I=;
        b=iT5X6WM8pWx4WHmWuvoN5aOBq3JvWqRDFNW7DeBTCQwyg6GoQ69xcQDwJhI8c/ZyVZ
         2fgN9eZBJKKz8dc/hSPd6pcF1DeiS/e4J16Mn83jYIBcnTxk9Ge1pXrXGu6RLkkk5XyV
         7vpFhtS7zPw8L2jnuX7YBDtpnRSSD6xSiplO4ElaETrfDE+81M+OeVINKtZqaYib6jdt
         mrI0PxREuU1UE3MiQAO3KQ5BNvRNEtIRlTlxPZ2ungwoIowZrlWG/13qLp4fLYAPJPAZ
         MGgRe3pTCCVZLgZPmcBl4NpmeJBO5MBOZQizLk7LG2KWCQMiaZXk+homAXdLvF4SbaOW
         wXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778558931; x=1779163731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5iW5TdGJXyw7GTZ7b4X8R789iXoMJ2Yg7+PSjFZ5I6I=;
        b=bY1PQPbA6ZWw19izxfuUmuajQ9ln+jSTSmvMHeLugYy97Y0OGBErUVbHuac3sYQlA4
         3RBC45MlIOx3awgBkMLljfWLUGE0RfpHtpsn80GIzFgRdPszw7apV3YQL5RzDbRqWe27
         NPYWGLdaRvscrH+t59bA/d1p+U25nHTo6ARNn0oqp8We05r2Xz/SQyXPUCnWhKM+fRIi
         hkrxTYfFGtrHUa5peZY7WRLHje4aEESkpE9e7kmGyQ1dqd2z7T9bTIvaboBos8OHLtN1
         PUuGDvIgxy/8AGwRalCaK3HSq5XJPBVAKIVWzInOIrWK77MMN0yn76FDTyO5jqMJ2DQb
         lzhQ==
X-Gm-Message-State: AOJu0YxlcSQ20PHUwuhrE/64sHpgLpe5gclivVnEMF5upoUXcpycVKwW
	vTNl5vWNp5Df1Uk+/318VXh7jLf7MR1C+7X2YxPsRWXz+W8m43p7AAYO0CY+aELW3e4N0vGQJjC
	b2i4r6C++QQdEhVHmHXu+sYCFKfgdEaQbyhM4wNoMUX8BReC2EJIFmtUx0Grz/0vdwBUG
X-Gm-Gg: Acq92OHzk7yB0FYd8RrDZtfxEhtqYDqS1/UV7t9ltbB1+r5i+QuyxWsJDOcwNeT9cU7
	uIKWDE51EHJoSlShADjmlfDk8hWsM53c79UrCzFiZZ/oZwCDgqlN/yrfWYlXItDPcEDGQXBCQHQ
	C9kFmBhe+PEBkULVsMcTwsLnQqd5oS/i7SU5vvqez2EN/ngNTrQcMZPKsFNCC+Qd/mPNOuzGS0R
	itcmd3iOGZI4jNaa3jqUa5hovN5/omuNry7beWhD68V9Mh3nUaKFrp/dqCAuAWgBZuNtkISWaiM
	CgmTLhnzO4QUGQUlvZ6UGFcEiSICItQfx9YEnsfAkA6TnuQnIHRHLUzfzjmT3MqOAmdJltpceKz
	lqUjkdVmROMtwqpFtnGjqcO/IUxE08A54Msqj
X-Received: by 2002:a17:903:4b03:b0:2b9:7ad1:bf2b with SMTP id d9443c01a7336-2ba7a2102eemr282246835ad.29.1778558930930;
        Mon, 11 May 2026 21:08:50 -0700 (PDT)
X-Received: by 2002:a17:903:4b03:b0:2b9:7ad1:bf2b with SMTP id d9443c01a7336-2ba7a2102eemr282246515ad.29.1778558930424;
        Mon, 11 May 2026 21:08:50 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d405adsm122646725ad.28.2026.05.11.21.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 21:08:49 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 12 May 2026 09:38:06 +0530
Subject: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
References: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
In-Reply-To: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778558905; l=3489;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=QSWsO4NtB0gyoZ9UE8wQtjGZF5+pdJM1iPNPKJBGnf0=;
 b=gfH0gl7LXrdq7byi/X6JFwIeqcpLx56NZFzcpnEaxVxou1o3ed1tKm7R+IyVufAIRNPzXChWv
 KjFGppUQdoaDgPP12iFAzFLNqNjDxmQNFFcbw2aD4BC8JuktxT4IgvE
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: NgmMcGi0XPD05d_IfxC1ZlvKk6kPx0tB
X-Authority-Analysis: v=2.4 cv=Mv9iLWae c=1 sm=1 tr=0 ts=6a02a7d3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=yuh6J1mAL7zzRkeivMgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: NgmMcGi0XPD05d_IfxC1ZlvKk6kPx0tB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAzNSBTYWx0ZWRfX6EQo5boM06l2
 G+Q69Bx1lQw+2PdLASE9T7eM/e4WTVY8K7J1Ug186BhOXBpdpJCJUjdbj3Z6JPJzZgFMLhDw3pw
 t5KQlLcXNoih44DbBfV+EenqWALicsk8Ovxuc0uPnuEpzPwwALNkbhCFTEGj6uAT6jMf2r13GwQ
 WGJpK/bnxFmvH4nMb/dGdQbqRlBRuAZLnDcGWmXgt0g1g665wScZkyPLlnety+Oy3uLlEEwiiAp
 q0SDIlltmoUr2I+3XFUjfoaklZ8uVJM5Mrk/nTTD3CQao/0nMqvBM1pnufL0tNZAC7YyoRggpbY
 3k37kIcB3fWLY8Yys/i74sIcLD/rcxr+zA/W957C7iRVYUgMYkhjEaDHWRtmOq0D49mtK0apuJ7
 i8wPnYoM+DKCOzLxYVadxLqfLeynuibDfjq/7wt2lbJvZ427Cb9Ds1D0o7REeOx8wbXeXG7Woqm
 j/+jmCO1L5zGncOFHXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120035
X-Rspamd-Queue-Id: 5D439519795
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107030-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add device tree include for the CQM variant of the Shikra
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


