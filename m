Return-Path: <linux-arm-msm+bounces-97428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEysD7Dps2l6dAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:40:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0EF2819D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2F9853023D4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C498F3914ED;
	Fri, 13 Mar 2026 10:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F6c/3hCN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EowINb+v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06125390C85
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398336; cv=none; b=fq0xKrXr4wjxdO4tPm9R5EI3aeMkC504qNNeExHnleY53M6rXj2uAK3Cvc7sKIV+J0zQzuIuf6rSsbpGZh5FcII+2/oxE+ttKg5nsMUW7NYLRuW7j3x5eXfvIIF5THrsYq/Uh3tE29rk3qrsAku2SE6DajACBwj59HEpxgk58eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398336; c=relaxed/simple;
	bh=ss06xA7c+Jl0D9yzRUP0fPwdtdct7PNSEddMP7dz9FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NTdVcqVngxuuFQOeooahMI0sUxp/tTDJq0MVR3MWAc3eZ77MRjJO+5G4A63NPhWMufzFhQgY2ipM1AL1sWm3p8SpNdw9EccnXAOuXZwyfDtQOFtTP91a0pEU7vQigwv389qJO/KLAefFCpZozAJwgATG9e8AOnBEf83kdFXagRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F6c/3hCN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EowINb+v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7JKLW237571
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4U3lR51szCl4UcZcaOTV6Q1X2KXRulg8n/uwJzS0aQ=; b=F6c/3hCNC3/FVL1y
	HGj7uP47TVFtyw2DpWBP3oQpB3i1HFc8bs4gODL4H3AnmJSxVYP19vNY3MuuMwh7
	UeWvkRloptccFSNRYOtp/K4XCgZG1V4PEqXAjXk0OiCt/G/8Ha60UB+EShgOSCX+
	vdxFr58TrGsrVLnXSAOtb7agvvgwPBaWU9+dBy11L9r9e/fGjI8C1H92ytn0ZesV
	iGPLSSvkFv8zwqUWn7DbIfkwvNE3IUSS1KON3L0xRmM3xYZj6oPBONW2/AOfHJk7
	uMdSOnVbHA2L/1BpGHStOFgKdW0B5SU876R+cqVZfNFMUtthUEJvf1C3IOoQ2PIm
	EgJlOg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cve3d8q38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:38:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd77e5e187so1119609085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773398332; x=1774003132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4U3lR51szCl4UcZcaOTV6Q1X2KXRulg8n/uwJzS0aQ=;
        b=EowINb+vNWEgMxF+uuKYCgu30piSOsIKrSQkfW/vGdlws5zqzl5vWcOrJMfd7DaadK
         KmOnHLo5OH1T/rPmbFsGAAwhdTSftTjots8WIdQabD1lRzmJYF3R/7T2jt8T2KXBCQzn
         iP9rYWBgQuijfQW6Byy5zvKcEGeWFcc7wUFlfMTeqUaMeKXt8MwKSL4AeJ8K3ll/l5/g
         wSSuqc83tTrmhs0GRYU4keGm5aizXcPxQNIW/hWs+99Hf64lcNp+ndl34npFvmQSrj2K
         cGKppUCYpsW7AvRAo9+ZywYhiIxMapaFneNAqeeRUuKwXvcwUQezob1MGQvbYWxDT4ta
         oVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398332; x=1774003132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V4U3lR51szCl4UcZcaOTV6Q1X2KXRulg8n/uwJzS0aQ=;
        b=PEcYoS2WKiRuelCw/8Y+jqq99fEKneduqYF0Tt1ijGDgIHZrhwJji7LVypKQD42/AQ
         EYlJEGr1fFjxfsfaQXes3ngE6LiwRA0AxRcJDdb0EmFMhfcORz8dcSSKhrs+sabFvZW1
         dLh+D5HaQp/Zqn3/FtShyV6icMrESGSehX8Fav2VnUXuLwt2OrrRfY13Gj22FyDKiTO2
         szbNQWe1BRsXMVc54oyp1Gd0+xzqfXT88Gn93dC3/69M/eurH/5oZR5xse72Hdxu94sj
         lAHcm796qE+q5io32WPwQSVCXA6NMApoJbOXpUx8zG/ktEFwIz8myLLWRdkWhLXBZJdi
         hTIg==
X-Forwarded-Encrypted: i=1; AJvYcCVQpACIvthCr9svMDWNRdCbLfDCeK1Zbs0hAo1kWFxXMrF13JM6/zDpLTr0O/kYeFu6ht4dVGQX+kN9qk8f@vger.kernel.org
X-Gm-Message-State: AOJu0YzcDlFgMcgrxTWZqwywBsSRddSzrMIEkY7HfEwsDyWW4peijXbA
	jOaknO3SJ0I56WdG/oACSkP8wMB2WSw3ZPU2mLCYWOZTf5REm7DBcPOr8Udoqwi7Hke6U7SM19q
	/nf7jTbKc60BUuqK2yQYhZn7kcIFfKv2HNCx1/tuIC4dy7dB2fycNmSVmS5+aurCwccCA
X-Gm-Gg: ATEYQzwOtgl/R3/Gghvt4vV/Rn4PC8GRs+uHHgcTPHt0Rq4ytt2k2st+6xZS2WzgvOs
	4fNSUn75L+AmPM50K9VyueCgvAcwpQ3eLSwbQOylxCHKnn95j4CqXTvbLuL148iyuoY62sqcqZ5
	1fDFrwOrnJVo4ttN+ki9fmiQ6YotGDQtp/NGO3k7ekh/V2APjHZetnZ0blmskeitqZi3+Y74Ol3
	9y96v4dbhXnxDV8qfPI8WFrZLlvG4Ug9WXDZCNMuYlB/fPQMrE/XMJtapYvF1R3o9ZnFgfEVtvz
	chXEoevpU567yKyZvcCF3eu3dCbp3f7v891OCa65FKqhsU08eGKpr+c1AcbtztSVLOsww6zBw9Y
	D/ebOf14T/lskvQhEbS2ERAWe4GBkyxqv9rfhui/aTNOW+r7aoR2udCk=
X-Received: by 2002:a05:620a:c50:b0:8cd:9b31:23b7 with SMTP id af79cd13be357-8cdb5a17a90mr358682285a.2.1773398332266;
        Fri, 13 Mar 2026 03:38:52 -0700 (PDT)
X-Received: by 2002:a05:620a:c50:b0:8cd:9b31:23b7 with SMTP id af79cd13be357-8cdb5a17a90mr358678585a.2.1773398331700;
        Fri, 13 Mar 2026 03:38:51 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48556426be9sm20183445e9.9.2026.03.13.03.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:38:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: richardcochran@gmail.com, r.mereu@arduino.cc, m.facchin@arduino.cc,
        geert+renesas@glider.be, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/7] arm64: dts: qcom: Add Monaco Monza SoM
Date: Fri, 13 Mar 2026 10:38:19 +0000
Message-ID: <20260313103824.2634519-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260313103824.2634519-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260313103824.2634519-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zGDS-hf5BAAZA93PCVSwEEU30YNzAT9n
X-Authority-Analysis: v=2.4 cv=FLwWBuos c=1 sm=1 tr=0 ts=69b3e93d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=wMphO_-U-tlnGu-niZMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MyBTYWx0ZWRfXxMZMZ0KvY9Kk
 S1idUZZeWqd7zoZewdWFjPxiWhImbUCyiVECWC5+MDfWVTTCDusCySmp3XsrLcOGwy9oWyippyx
 NtPXWbP8dZ2NN0WKmQ4KLZa24lWI7B8SSj9dYav5mx4IJ2wpzSa0qPvWHuL54nlAwaU7xxJMuiI
 f0urNPTiIoJiNFn85EhyneSlZSgXKXpOlZF5Ep5huJ2CNJE8KEJd45NwsEJhykroHnBw46hiUT/
 X2DuYwjAw3sc349+zrCxY5A21cPsIjRrH6idznX/GRPIVODlr09BJrVLZPvFBYJoUChnP6pkuow
 eOL8XeQVDzhGMADOAq4mPFH1rbEOIs+N6W+ivuwkxnfW1r/Kx4ZsQDargqqa/sHyU89QpC1B6hM
 G3zmpXwN1dFJe+1ooOeTDsw6mNpcTbKttJHf7gSvL3GoIKXdSXqtoRc4eZxpBIi6IJrMv9vhhUF
 CXVj7bx1+YTJgYX+/OQ==
X-Proofpoint-GUID: zGDS-hf5BAAZA93PCVSwEEU30YNzAT9n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130083
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[gmail.com,arduino.cc,glider.be,arndb.de,oss.qualcomm.com,kernel.org,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-97428-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3B0EF2819D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

The Monaco Monza SoM is a compact computing module that integrates a
Monaco/QCS8300 System on Chip (SoC), along with essential components
optimized for IoT applications. It is designed to be mounted on
carrier boards, enabling the development of complete embedded systems.

The following components are described:
- Fixed S2S 1.8V rail
- PMM8654AU RPMh regulators (PMIC A and PMIC C)
- Display subsystem/phy supplies (DSI, DP)
- Enable GPU, GPI DMA, IRIS
- PCIe Gen4 for both controllers and PHY supply hookups
- QUPv3 firmware declarations
- REFGEN always-on workaround for USB2 HS PHY
- Remoteproc firmware names for ADSP, CDSP and GPDSP
- Ethernet SERDES supplies
- USB HS/SS PHY regulators
- On-SoM eMMC

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/monaco-monza-som.dtsi | 323 ++++++++++++++++++
 1 file changed, 323 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi

diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
new file mode 100644
index 000000000000..9b5ed55939b8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
@@ -0,0 +1,323 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "monaco.dtsi"
+#include "monaco-pmics.dtsi"
+
+/ {
+	/* This comes from a PMIC handled within the SAIL domain */
+	vreg_s2s: vreg-s2s {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s2s";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_l3a: ldo3 {
+			regulator-name = "vreg_l3a";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+		};
+
+		vreg_l4a: ldo4 {
+			regulator-name = "vreg_l4a";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a: ldo5 {
+			regulator-name = "vreg_l5a";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a: ldo6 {
+			regulator-name = "vreg_l6a";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a: ldo7 {
+			regulator-name = "vreg_l7a";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a: ldo8 {
+			regulator-name = "vreg_l8a";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a: ldo9 {
+			regulator-name = "vreg_l9a";
+			regulator-min-microvolt = <2970000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_s5c: smps5 { /* LPDDR VDD2H */
+			regulator-name = "vreg_s5c";
+			regulator-min-microvolt = <1104000>;
+			regulator-max-microvolt = <1104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1c: ldo1 { /* LPDDR VDDQ */
+			regulator-name = "vreg_l1c";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <512000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c: ldo2 { /* LPDDR VDD2L */
+			regulator-name = "vreg_l2c";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c: ldo4 {
+			regulator-name = "vreg_l4c";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c: ldo7 {
+			regulator-name = "vreg_l7c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c: ldo8 { /* LPDDR VDD1 */
+			regulator-name = "vreg_l8c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c: ldo9 { /* QFPROM */
+			regulator-name = "vreg_l9c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&mdss_dp0 {
+	pinctrl-0 = <&dp_hpd>;
+	pinctrl-names = "default";
+};
+
+&mdss_dp0_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l4a>;
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l5a>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs8300/a623_zap.mbn";
+};
+
+&iris {
+	status = "okay";
+};
+
+/* PCIe0 Gen4 x2 */
+&pcie0 {
+	iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
+		    <0x100 &pcie_smmu 0x0001 0x1>,
+		    <0x200 &pcie_smmu 0x0007 0x1>,
+		    <0x208 &pcie_smmu 0x0002 0x1>,
+		    <0x210 &pcie_smmu 0x0003 0x1>,
+		    <0x218 &pcie_smmu 0x0004 0x1>,
+		    <0x300 &pcie_smmu 0x0005 0x1>,
+		    <0x400 &pcie_smmu 0x0006 0x1>;
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l6a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+/* PCIe1 Gen4 x4 */
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l6a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&qupv3_id_0 {
+	firmware-name = "qcom/qcs8300/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	firmware-name = "qcom/qcs8300/qupv3fw.elf";
+	status = "okay";
+};
+
+/* There is a HW/FW issue preventing proper REFGEN hardware voting
+ * for the USB2 HS PHY. As a workaround, we force REFGEN to stay
+ * always‑on in software, matching initial bootloader config.
+ */
+&refgen {
+	regulator-always-on;
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/qcs8300/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qcs8300/cdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp {
+	firmware-name = "qcom/qcs8300/gpdsp0.mbn";
+
+	status = "okay";
+};
+
+/* OnSom eMMC */
+&sdhc_1 {
+	vmmc-supply = <&vreg_l8a>;
+	vqmmc-supply = <&vreg_s2s>;
+
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+
+	no-sd;
+	no-sdio;
+	non-removable;
+
+	status = "okay";
+};
+
+/* Ethernet/SGMII */
+&serdes0 {
+	phy-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&tlmm {
+	dp_hpd: dp-hpd-state {
+		pins = "gpio94";
+		function = "edp0_hot";
+		bias-disable;
+	};
+};
+
+/* USB0 HS + SS */
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l7c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&vreg_l7a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+/* USB1 HS */
+&usb_2_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l7c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
-- 
2.47.3


