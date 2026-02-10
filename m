Return-Path: <linux-arm-msm+bounces-92416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI1fKVDYimnrOAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 08:03:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 080001179FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 08:03:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05A86301AA7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 07:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1282FD7BC;
	Tue, 10 Feb 2026 07:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLyrW2AD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K57jEasO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A402202F70
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 07:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770707018; cv=none; b=lIJJgv/rP5VCE42N5tzvosW19kS8GtKlOmsAnblFIiqOaPo7QmB4f3eE2HjvaySlPSbN3ylm01l6X5t18PC/VDLTiK5S4DAUZtKjszK4W3OUoVWd1IAX4nUqW5ivATnkzNI1B/1vvmMqkJPAuGk7h794Kgzjw8I1WJk3nrr6qaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770707018; c=relaxed/simple;
	bh=XwP5uTxkLWQ5tkjW1ofQ72i3pe6+4ajraSJONQFthJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hyHPRkfr43msMGI7AF0iYxVgIFxK1OfhFGVkMDIVaKHufshyOhLRBVZH5g7ddJ76DMBPmYzjQXEsGT2Hfb99lSK8LaxUhDM+VcOV46Yin337zAjS1qvH8E5RAdhy5YaoRv3LFXF7/+kjKPWBXnyHRYovFvf7GkGrYDUfIn375n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLyrW2AD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K57jEasO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A53jsb801129
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 07:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=y2QWcgpLtdLC6e5rpAeqlld+b2NVOZIT7h1
	ngQSO8ok=; b=DLyrW2ADuz5Me6bSmzFNUpLyPt3/CHOQeB3tqmS6ncNmm2YbnBl
	4DwJ7F95bgI6xU2kjODbsei9U6ZNE47Gf1AqFCSOeobJhzPxucv5TQ1GkmL+uVr+
	RGQvL5fSrmwaAqKLPql0gikrXkFSVjhW0wpT+m9YfcC/vh3ws9HUQXxCWA+Bl5NI
	W0OGqvqiXuH3X5MvnbHCKlqoCRLU8zn/bEi7iyiDEtBPUN9k6e5NAtn/Xbh44BbH
	kkGpditkzZP0k9Y75qCEEHXeiXYLtBx2RNppWar2xWz1SFOSnJI6OtarQB32mP7s
	fhwagt1yRMfI+aMKulEoXNcUueVyd/wq9vA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7x6u0b1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 07:03:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c68b97c0adeso3792401a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 23:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770707014; x=1771311814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y2QWcgpLtdLC6e5rpAeqlld+b2NVOZIT7h1ngQSO8ok=;
        b=K57jEasOtGFqv7LhH2AtBeVXmZeV6CPqXxvEOfRaCTMSQNcHGu0nKCoJLCuOyP9ulV
         BMHWo4MvoQgO13h9y4Q+6pTPaYPZDKRdgH9WScUqQtxie0KdI1gOFGEme9E3KZH2fFgy
         O6kk70J2ZP+JHgYB+DXWQA9jR73hJBJ4Sfr4KbApdCj6co8T+1rHKhLxzcPVG87xDJKt
         fQZ1uxeDfiN4nY+IECOdVN9wRqoWXl1IQEh2AgkJ2OTTSFBYxgWlKtBM/PfMSJ2gjl/B
         syyCGRqcNFVO0VX/xDG+ALnS65uUt/BNVc4qIGrrIe19iKFx/V8FNY+86aWrZL9t439k
         uXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770707014; x=1771311814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2QWcgpLtdLC6e5rpAeqlld+b2NVOZIT7h1ngQSO8ok=;
        b=taSEv5tA6Qsh8PjpJuo/vqhRuuctZWDDjRPMCKqx6Td1/HD8B3JpFkPYpxz/VvHkgL
         haDShukRrRhFdiDzsOsxuP2VaZnUYAm17BNyq/VJlUgNERsIacmNf2M5LNmRPUJm80UZ
         8CmQnCBfw49CQ6wE3QvJmO1XO+HeCdSZdxkVs1BSstf5LvLi97wLVsOeuusbl6o5pAsw
         tgOrDIZmMY3wDuITa2sbJM6TskDdgFwq1BMMPguIj2eDANRw4CmrH6J/QzDOsjvbglcH
         z/MTocLZK56G79OAgtjqs+j7imCj8PbfjbJDF1JFUxezJ25pp60iOS+ZepcgxZx1Fetv
         or7g==
X-Forwarded-Encrypted: i=1; AJvYcCUI5Jd0HXC+K4lPJMJmmv01JS9K1k6e9xKMcuWDr+xXfCTbY3rTcCrQtg3IWeozMOBYix4Ra1wzTA5LU26K@vger.kernel.org
X-Gm-Message-State: AOJu0YxmYdm7vCum0Png26hd9qCcU3gqqzdSTaC6H1Axs9T8XfRpNelk
	VNZ5Hmabn1DjOLp7XATovBq7yFf23FOPuNqrmWKkdYzR0mEje8w/6kFx9rj/fe/ldRK4K6aaJRr
	Ys00ZLxblg8HPWGh3sVj5BOhsvsynW0YKPaxgEQgDHABzxBY/zPRygR9ZB2vGZe+3q583
X-Gm-Gg: AZuq6aIqF9KpBT1mh98ftB8PKrBenA5fPJbxZWiLUIS5dnuAY7sAQzpDmxw60Ho143L
	hIde9mUvFrMliyIGZ7kTYtoOe3A745rL2A6Gg/kLGfdaSdiS+sZmNenzdJOqIF30KP/XYJTCDcH
	xUxN60DFTDeIg+0TqIeOQap1+tyP15NGvYQ5g9yeCJzSYGAB/dDLX3BXM4zJb0vcKerQNiBUdWJ
	bwG91YBdUdcc24IHUx3kHa6IkrUIN8pIXfd9Ac27nWDe0oharEdd4ns00BWw1zyJRyz20SwcjDP
	QlvLfndmAjdpxzviewjLLlP8QF/hzjsuGCtzbC39ykIAu1UMSsgTYOoG9AG0h0nEw9tnTM2CqlF
	9stzq9/35TdlEZV9+mb8kCGd9zanp6XOElt4iJQ==
X-Received: by 2002:a05:6300:800a:b0:371:b0c2:4acf with SMTP id adf61e73a8af0-39415b45664mr1135895637.7.1770707014080;
        Mon, 09 Feb 2026 23:03:34 -0800 (PST)
X-Received: by 2002:a05:6300:800a:b0:371:b0c2:4acf with SMTP id adf61e73a8af0-39415b45664mr1135870637.7.1770707013520;
        Mon, 09 Feb 2026 23:03:33 -0800 (PST)
Received: from work ([120.60.129.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441695f7dsm12859924b3a.23.2026.02.09.23.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 23:03:33 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mani@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gaurav.kohli@oss.qualcomm.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: x1e80100: Add '#cooling-cells' for CPU nodes
Date: Tue, 10 Feb 2026 12:33:21 +0530
Message-ID: <20260210070321.17033-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _JyPxOpv63zwi2eugLeIbDBp-iAMG1xT
X-Proofpoint-ORIG-GUID: _JyPxOpv63zwi2eugLeIbDBp-iAMG1xT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA1NyBTYWx0ZWRfX/rdIm8Vvv2yy
 tWFUOz5mjDX/Je8f48w6EkPv1P6pNC2qurWZCP3NVZwcURRFsewElefAsHDxRJHpXqFK7D4Njyt
 MYeNtinfrGjGDMNUYqcBtKb1Rka2i0YH0rQXasdw2o8G5BQthNKc4vU28dPLIaBkG5M/zSXFQkP
 NmwTOsMgSad5LXIpIHbMS/JSVawHFOs+155RIMtIxrjP1HiD07TtlYX2JuXxRZ0RSWj3C42R84X
 iBGqLHLarQovjasHmV+SdDlfNGPEZu2Uxuj3i+6o11vVFGryTAag9tqjlWQIscDktfm4HTOLonI
 XRT+BncKdfLX3LL/9y1tP2SRjQsg7DFw+Ks6n6rhSnKHdqJLXDEZVIj2LWjD61HJ44w+il9Ilua
 gJmjdR6P9NtOTqnnTB7MUmPma0Ep8yGalSFdlIsFuztuggK9O+pl5pjqH8qcr81v2gepN2acmcn
 Qutt9RgpLig4phIMdmg==
X-Authority-Analysis: v=2.4 cv=YfmwJgRf c=1 sm=1 tr=0 ts=698ad847 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=wzz8CQ20vw4U8Sx33GCDJA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=DIVSntv8tsQZXXiWbfoA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100057
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92416-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 080001179FE
X-Rspamd-Action: no action

Enable passive cooling for CPUs in the X1E80100 SoC by adding the
'#cooling-cells' property. This will allow the OS to mitigate the CPU
power dissipation with the help of SCMI DVFS.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---

Changes in v2:

* Rebased on top of v6.19-rc1

 arch/arm64/boot/dts/qcom/hamoa.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index db65c392e618..799e405a9f87 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -75,6 +75,7 @@ cpu0: cpu@0 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd0>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
+			#cooling-cells = <2>;
 
 			l2_0: l2-cache {
 				compatible = "cache";
@@ -91,6 +92,7 @@ cpu1: cpu@100 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd1>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@200 {
@@ -101,6 +103,7 @@ cpu2: cpu@200 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd2>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@300 {
@@ -111,6 +114,7 @@ cpu3: cpu@300 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd3>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
+			#cooling-cells = <2>;
 		};
 
 		cpu4: cpu@10000 {
@@ -121,6 +125,7 @@ cpu4: cpu@10000 {
 			next-level-cache = <&l2_1>;
 			power-domains = <&cpu_pd4>, <&scmi_dvfs 1>;
 			power-domain-names = "psci", "perf";
+			#cooling-cells = <2>;
 
 			l2_1: l2-cache {
 				compatible = "cache";
@@ -137,6 +142,7 @@ cpu5: cpu@10100 {
 			next-level-cache = <&l2_1>;
 			power-domains = <&cpu_pd5>, <&scmi_dvfs 1>;
 			power-domain-names = "psci", "perf";
+			#cooling-cells = <2>;
 		};
 
 		cpu6: cpu@10200 {
@@ -147,6 +153,7 @@ cpu6: cpu@10200 {
 			next-level-cache = <&l2_1>;
 			power-domains = <&cpu_pd6>, <&scmi_dvfs 1>;
 			power-domain-names = "psci", "perf";
+			#cooling-cells = <2>;
 		};
 
 		cpu7: cpu@10300 {
@@ -157,6 +164,7 @@ cpu7: cpu@10300 {
 			next-level-cache = <&l2_1>;
 			power-domains = <&cpu_pd7>, <&scmi_dvfs 1>;
 			power-domain-names = "psci", "perf";
+			#cooling-cells = <2>;
 		};
 
 		cpu8: cpu@20000 {
@@ -167,6 +175,7 @@ cpu8: cpu@20000 {
 			next-level-cache = <&l2_2>;
 			power-domains = <&cpu_pd8>, <&scmi_dvfs 2>;
 			power-domain-names = "psci", "perf";
+			#cooling-cells = <2>;
 
 			l2_2: l2-cache {
 				compatible = "cache";
@@ -183,6 +192,7 @@ cpu9: cpu@20100 {
 			next-level-cache = <&l2_2>;
 			power-domains = <&cpu_pd9>, <&scmi_dvfs 2>;
 			power-domain-names = "psci", "perf";
+			#cooling-cells = <2>;
 		};
 
 		cpu10: cpu@20200 {
@@ -193,6 +203,7 @@ cpu10: cpu@20200 {
 			next-level-cache = <&l2_2>;
 			power-domains = <&cpu_pd10>, <&scmi_dvfs 2>;
 			power-domain-names = "psci", "perf";
+			#cooling-cells = <2>;
 		};
 
 		cpu11: cpu@20300 {
@@ -203,6 +214,7 @@ cpu11: cpu@20300 {
 			next-level-cache = <&l2_2>;
 			power-domains = <&cpu_pd11>, <&scmi_dvfs 2>;
 			power-domain-names = "psci", "perf";
+			#cooling-cells = <2>;
 		};
 
 		cpu-map {
-- 
2.51.0


