Return-Path: <linux-arm-msm+bounces-84656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C96CCCAD052
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 12:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1A0D301EFF1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 11:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8946155C97;
	Mon,  8 Dec 2025 11:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JXrjCy+I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GXCP/ym2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4BF3B8D47
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 11:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765194369; cv=none; b=NPWaoU7bxO3ZKJdMDtOTtf0paILvkQpKU286Fh5gZZ189u/DE/76++47yqVJEVK0EQNZOvtKbTr+yo4lUY+i411fIdtx1eOMoqoMEP0DfnK56J+QyxvREOCLLsq3gaXXjQZA+20VK8KqHTwweuNZJIbLEuV7alVzREo3yA3XDsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765194369; c=relaxed/simple;
	bh=zjxVA0IP1kozltC5x9elRH7A0jqa5NIUUxx75+OdkmU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cyV9+V3eSUlGorOMhzEFzRiAL+VZ/VdPIzSjm5P1Iiqydx6OS4qY9Dl+nphHtAW0JFGhYJp4eUBSEujCQNuipiU2I133qsApf7lWczfMoAc4Z01TxdUJJcMSyU5SKiyAsXhW3fOjKstYh4bcHrcW3O5qKqewEVySuVBefH9c2qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JXrjCy+I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GXCP/ym2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8A3wHm008957
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 11:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hOMZW6MZTFNtxuEjO+Bj535YBxzKCQod/tq
	kfV3DXi0=; b=JXrjCy+I0BwfVGPTf1DSnRJL/gPpzjAUFHXTKwMXxZtsXwpq1Wh
	G5bcrx6+tqHyX3nMHJESCcwVSWa1RXWPVdR+us9FruUCDOrkhKjoQfrE7x47+KSg
	J8nJADcpXSJVCDYSRMvVJM8w+5ChKhY/AwvbaCNEHa3R8lViBFSyHfS2dh6wlyJ8
	ect/vdZy0saP8WMwb0MEjqgAsNi0nkT5GRO605Zkd8rJqkdVz+UJPyatrJBqsYkO
	zWyCyfVYsspJ01SxPf36/o1ggOkID8meshwo17KTFFBRKAcH69kHfuPBQBdQyJ9A
	J0/8v/IfQli6waDPIgFeB6jZnnZ17zCg4rA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awvke08v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 11:46:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7bb2303fe94so4911900b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 03:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765194365; x=1765799165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hOMZW6MZTFNtxuEjO+Bj535YBxzKCQod/tqkfV3DXi0=;
        b=GXCP/ym2F8iA2kO1q1ARtDvG5JFndDoUaczbissBi5EkAFCZMrvxBmITSLP+pz9pUT
         9dlhhOWvOUOl6q3waESb/x4LAmut20Ze3CzHx96tR/11bd9K1kfXn8DO0TMCZ2MPgZR2
         kjKyHfcr0AIdgT7EYdGKatPSlCCqwM2icEwZcyyfVdEZVHGS1hFSliSNDVgmwEO6K6sb
         Po5wGUyO6LPdD/KSeYRMIk157MsOOoeVXi7cvPdzvp+JQsret2FpDvST2qU5zfjaQMY9
         6uH0JVrqcw7dZ4Q5U0PpXvUdkp4+v9MQ4DrCLd6ptJoMXALbuwXf/ASzqkF7AjC+7vzZ
         TPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765194365; x=1765799165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOMZW6MZTFNtxuEjO+Bj535YBxzKCQod/tqkfV3DXi0=;
        b=sjDpqAZ45zr+d0O4IZrHuhH9Vv66gn8SYspYoLc1WTVAcby0EMBtOkCyvGIkP795cH
         fn+R346AL1DVKHYb2WwnW1yVKGM1Q1vhgAF7R08l4zQOK1bug+XVziB8NXJ0jxKWt+fn
         CVRji801nmc14G2gfZ5NWpUceCKEMdXIJBPJXMslNXvWDe9LFtNwkkge5MGDOHm6RnNx
         K6UG7JZp3YrS4+DdBA2pLe0V7g6HOpWGI6rZTWPWmQiKqWi9t4SNmVOBWkbTaJKae2fx
         WXcxcABVDFmOeK+gMWTxC66eZbc2VUmh6M/ejxcv2flQKRKCSUvJ7eb9iQf3QKiYIOiY
         iW7Q==
X-Gm-Message-State: AOJu0Yzt2Rwkrfmk+qs4nUPXyQcEWpM2qLWvLcTqUx1+vhB6nr3sJDBy
	auZrndgG+I0s87lC+fpgN60JoAhtHVnZ12LQjhk0zr11CuLT4gmIwUX7nhh9zpi/dV1BXnoZsqo
	s2ecQcJkAWxvX1BAWdMVe4aGUy05QdKRNF5Ozs5IaBLMgACws30mhHU0a6Kl7jDA7jpQULb4KjJ
	eU
X-Gm-Gg: ASbGncv0OX9b/9+suyEzBGKtUINgcEQHfGpL0JF1CzzKkkSKMjQs1F2RqnaWydIDihq
	7HP/lOXH14OQmttXhEGJWPqIN9yzB/hjz1tdezkC/LwlH35L0AjTWPfAG0TVc/h2Op7E8D+F/Ia
	pFIxHVFmkraDSZ5aXqA+Y/FnU12vuSYx6omfF/wWolAaSvxux3t+UGp+pNjvoRTayK2Scd54sqL
	EWoXBEH1Q12C0r8omtqUtqpZ60K6oJFz0NKf2brEw1Uao7xOYHBwSaN+dtLV99z7+58GiBVtzya
	S2ynh0kiCZ9wpJ7P6LZ9WOxvUS05xE0HUAQNQ0ttI+aUedwprKPdmrDXAB7J4PEqbz/ZPQgXbU+
	VEDZughEvhdVP6kfEIHa6kX+BXKreB0C1tp8Dsws=
X-Received: by 2002:a05:6a00:22ce:b0:7ab:88:e397 with SMTP id d2e1a72fcca58-7e8c3628cc9mr8354074b3a.24.1765194365449;
        Mon, 08 Dec 2025 03:46:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwX8WzCUs+PCgzoADP/Y0RIo4EXUbGmI70H7a3OxUNiCOmTxMJsEAUI/T6b1mm6b9+Y8HGNg==
X-Received: by 2002:a05:6a00:22ce:b0:7ab:88:e397 with SMTP id d2e1a72fcca58-7e8c3628cc9mr8354049b3a.24.1765194364954;
        Mon, 08 Dec 2025 03:46:04 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29f2edf3dsm13070258b3a.6.2025.12.08.03.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 03:46:04 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: monaco: Enable cpufreq cooling devices
Date: Mon,  8 Dec 2025 17:15:58 +0530
Message-Id: <20251208114558.2343462-1-gaurav.kohli@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cZWg-LfT0WLLHrbpffTMs5WlmBNxKz14
X-Proofpoint-ORIG-GUID: cZWg-LfT0WLLHrbpffTMs5WlmBNxKz14
X-Authority-Analysis: v=2.4 cv=UvBu9uwB c=1 sm=1 tr=0 ts=6936ba7e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=r9fjMy4XMW6mXo0kRxsA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA5OSBTYWx0ZWRfX+T9DHnNT+/Bi
 VE9RuF71Bq/Ou4E7fJ8lJUZvOSsB+y9A2Lqt8G7UByj9dLWrp+YsUorSkSTCO7ApReBHUS6KTUJ
 bz09TGPMtNFjVFxsUsqgUbiZiH5Fp2Egbb0z2VAHpLeNCKIVbk7nx+iwDAFiZHqLfNVL7FNEMu0
 rF96D2r1m5tT/3dGjuZDmtYDnAa0p+gduvVXWyK7zM1+gS9Fa4JQ7WOOHVTVgohZWHx7IjL6m82
 t/c75+gnfwPlY5f58aDySJI+4gJ7PDmBdrd7kmS4isUFcHpwI/4vqtoZfaIvOZmFhjU8ziudAZX
 bAF13jFGTHe1Oi3itYtlpPDnP1HoTntAt/7318dmb5BsVoKM4WIZeCElhXZ4m9GXevkSynRjJhZ
 FzsirXKlTyGyEF3oD6NCFvBxO9BLKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080099

Add cooling-cells property to the CPU nodes to support cpufreq
cooling devices.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 816fa2af8a9a..caac947efa34 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -55,6 +55,7 @@ cpu0: cpu@0 {
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <472>;
+			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
@@ -79,6 +80,7 @@ cpu1: cpu@100 {
 			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <1946>;
+			#cooling-cells = <2>;
 			dynamic-power-coefficient = <472>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
@@ -104,6 +106,7 @@ cpu2: cpu@200 {
 			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <1946>;
+			#cooling-cells = <2>;
 			dynamic-power-coefficient = <507>;
 			qcom,freq-domain = <&cpufreq_hw 2>;
 			operating-points-v2 = <&cpu2_opp_table>;
@@ -129,6 +132,7 @@ cpu3: cpu@300 {
 			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <1946>;
+			#cooling-cells = <2>;
 			dynamic-power-coefficient = <507>;
 			qcom,freq-domain = <&cpufreq_hw 2>;
 			operating-points-v2 = <&cpu2_opp_table>;
@@ -154,6 +158,7 @@ cpu4: cpu@10000 {
 			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
@@ -179,6 +184,7 @@ cpu5: cpu@10100 {
 			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
@@ -204,6 +210,7 @@ cpu6: cpu@10200 {
 			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
@@ -229,6 +236,7 @@ cpu7: cpu@10300 {
 			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
-- 
2.34.1


