Return-Path: <linux-arm-msm+bounces-106598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OK1vCh6f/WmwgQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 10:30:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8688A4F3B98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 10:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED72B305EF1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 08:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572B537E2FE;
	Fri,  8 May 2026 08:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQB7sXWg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vrgqz/Ht"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665B8375F88
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778228860; cv=none; b=t2EuXrUiaLwQlMyFlJsoqfirQVR59XvwPQhGzx18Tgpx5/Ph25RXzE69xvDMEKQArnnnUCQw32sLQ3i/huwXpoaJW7TRKWwQsYxU6WEA2X3bKJdsWnh1+W3JegG9K8sBU9OPvrlxZv7fw2jq4qxcYxEqzX8sRGMdEay2wgSVJpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778228860; c=relaxed/simple;
	bh=NSvDLxi0/3uXdnWaRxcc/CcSxlXav4CW6qth+u36GdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RvAMuQXXaYTC+nqwSMD5mVGEX+zJM1aYAOYKwiaYugw3Px6+yVe9RE+nso2N3vw6tPY1D8yhb9yABqLps05dSW051Qjc0Emg68Bvuzjz898PEjtYJmiWC091fdcsvFWgTl8uUkNGd3lxFWDVHpadDglJKfpSj5MoLAKRnHULGeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQB7sXWg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vrgqz/Ht; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6484WUGY1417673
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 08:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/10x8S0sWxZlzaPtsZ0PZjdBwBbbSaV/diC
	7aAKr1fs=; b=iQB7sXWgn4fqnyv9bRw+jytBXujUazKgCrXGatkPIQ4puotfM4f
	mU4sPPxbfV+w7XJak3OJykrhDWLzRTJy1iPqwh1yzjdaJjPa3SSSqr7tVArLeXWL
	xBbTdfNWDZhtxsrIbqGCTXFFRXBV1ONC+klLMnfZlCP6/l2q15F079ZfgZbjOwtK
	dcb61BH96z6aryg7gY15mY5TDp3ovtWfaSLJI2zJBKkPnYzAgQ8KmGXe0FZ7+9ic
	gwYehKSNgoptDu+FiGkjE8Dr47l75VeMwkPAE7pw9aLrvb1sbVdY63+rwAvBO/bx
	lQgfTphC08jkwBKbPYgqmQ9L4mH6K59FICA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0ywhjp53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 08:27:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3662eec51e0so683916a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 01:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778228857; x=1778833657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/10x8S0sWxZlzaPtsZ0PZjdBwBbbSaV/diC7aAKr1fs=;
        b=Vrgqz/HtKsGvGHaKkNanb3WRvkfqfjQR7KsuTXyuejrygAs9deyFf5aEWpaLb9AWAH
         VprcqqtFRJzKryoLjH7AuAojGp/9eujpVMRuHLLwVPGbWNOKPT9jVR7Sw1B54Uw3ZZ13
         URSs27uQcGmP4ZuahnMTxO1GW1Td8j9LqBMXbi7bHi3OOCpPX9zN4MOt/QWfeC36yjXc
         ST9ePtQVXdAv4AdGXwW6A5iBVyGsVtDVAHgTzIEGqH/TSW9tGJbyj5xcaw4hzG1b8ZML
         DbJKh+/EV5IvI3prl5WnT1flTpVysfpybASOTkvA5dglOJ5MJEZ0j9vfAQgv/UQmBklD
         1DRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778228857; x=1778833657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/10x8S0sWxZlzaPtsZ0PZjdBwBbbSaV/diC7aAKr1fs=;
        b=Rj6CldxYVgu6qpblbDLs44SiLJut2E0aTlJWjY6T5Vp52e170KX2OUX3kpbsT2ZbN9
         9f/kT9uaZLeD6acOxleosI7I+5p7JhLih66pmUS8ergabITO5WqUOWDYU+dirHiRryhc
         +jKZJ03iqDyTzPvFK6hfZcDz2OOzHUnhB8YquqUc7vOINei42+71MPe0Ii1nNUkLOg/3
         hQllmkLDQ5OiXe2TwTA8PosSVswCIeSbyEYjhrdG2CpKwGQgdrGjKEpyGEpRIDepcXv0
         9YoU0HBrf6V26HJL8ApZLWzswHOx2jyF2dw7DOgH+ACx4KiFwS3xhPwDlyGTJXvdBgKn
         eiPw==
X-Gm-Message-State: AOJu0YxGnIbRSCUYUsyxnF5VLhBw0P2J45ho6krfLQ/5hj5bez9ewDmY
	hnjjaz5K53d9i5GTCCTN4r3kmb5eHJsg+94Xr4uYW+XBhL32lsLG9D+0L0LjaLStpMwd92ObvNI
	hZMtpdgVPcp4dWLGsJXt7HD+Id9udFn5PMVOPcgWY/Jtlw1rYE28Ifr8XsBcBLFe60JaN
X-Gm-Gg: Acq92OE08qqiK2z0HJfiXKF2hRqCl/79LnXBk8rT1kAQg1CqgvRnDfk/dTXmjCq/Lj9
	Qy5bdELXAdgNYGoK0fb6LT2AbbZ7mpIsZCEFSq0SMH/Y9y526I9onHM3JNt+vvxWs+itNcHdSlt
	TA91crkuwUTkb6w4aLoUflGkWmFgjS9NKMLkBlRW0qbhYC9PP+0sq1mQIseayF50XFe46UGICLh
	tqXN1RItqWHqm8JptVKAN0BHc2ak1vwr06C8lAWHUzxmXVJLsbovyZZ+wqnQL6T69dHTWkOiLFO
	pVOXpWCxZajyBf59omJ45i3aaZYMzHsrt6MvWFNdr9/C/719dSryt0cRNikPLEgqEZnFECykrxM
	3tPggQWsxayMgoW+s9CkBlhsqqCyoQihCtRuVE1rMiWI+myGv2Zvj4M0iFhQ=
X-Received: by 2002:a17:90b:1647:b0:366:2e1f:393 with SMTP id 98e67ed59e1d1-3662e1f05b5mr4634255a91.21.1778228856771;
        Fri, 08 May 2026 01:27:36 -0700 (PDT)
X-Received: by 2002:a17:90b:1647:b0:366:2e1f:393 with SMTP id 98e67ed59e1d1-3662e1f05b5mr4634217a91.21.1778228856186;
        Fri, 08 May 2026 01:27:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-366490451e1sm794731a91.3.2026.05.08.01.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 01:27:35 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: kaanapali: Switch SCMI perf protocol to use power-domain-cells
Date: Fri,  8 May 2026 13:57:28 +0530
Message-ID: <20260508082729.37674-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bMAm5v+Z c=1 sm=1 tr=0 ts=69fd9e79 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=MeJGL77r1mcfaQ0cQWQA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: EpLa4QtP36viRB16Y3tvP1AJD7NYb4um
X-Proofpoint-ORIG-GUID: EpLa4QtP36viRB16Y3tvP1AJD7NYb4um
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA4NSBTYWx0ZWRfX4jXFK7riHzzQ
 WMRgfzWOO6rM5E/MaB5X8ApVyQQIgTuCA58LO7Ic8mtZ+xUWKjkG7M1tH6NZFv3XQPL3vTN5P5I
 fWETOgpdddRe+Rjgl05BopLGYAZDpa/5weY6oQU9aZFIhDMLzEuN6SnU1Ia0PnXAXXR57/Kamlv
 o3VChzELcsHDg8sJdnI9Pg3qsQeItgVtNKGDztUgJKw5P436H2OFDKvIUKGMSCbY2TWgRoL0cse
 C3E6Pm0YE523uxEp1yUPjMUNsPqUOJeGgctl03emul+0vfWyXJtqKnDuYROsDNuzvKNVkjX3Gtv
 pi8NfPa6PRf3G0t3dgCi5Ax8odoV4ckfR+qzugNYjCcjyGjmMu6s2oIH8qsemdhaiGlkSe8o7KS
 kavLziN3JjTuB1DR3e0CR05zmFE+JeQjYX6TnbDhc3HEaIrczsWqsKg7NGxxr+UsBeybXqMVQW4
 Ktc45RvgqPIBRHXybrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080085
X-Rspamd-Queue-Id: 8688A4F3B98
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106598-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.1.244:email,0.0.1.144:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.39.116:email,0.0.39.16:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The SCMI protocol@13 (Performance Domain Management) node was using
performance/power domain, not a clock. This was using the older
mechanism for passing the SCMI performance domain index to
scmi-cpufreq, which predates the #power-domain-cells support added
in commit 92b2028b00ff ("cpufreq: scmi: Add support to parse
domain-id using #power-domain-cells").

Switch to #power-domain-cells to match all other Qualcomm platforms
(sm8750, glymur, hamoa) and align with the semantically correct
representation.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 44 ++++++++++---------------
 1 file changed, 18 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1a..dab1ca696741 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -45,9 +45,8 @@ cpu0: cpu@0 {
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd0>;
-			power-domain-names = "psci";
-			clocks = <&pdp_scmi_perf 0>;
+			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
+			power-domain-names = "psci", "perf";
 
 			l2_0: l2-cache {
 				compatible = "cache";
@@ -62,9 +61,8 @@ cpu1: cpu@100 {
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd1>;
-			power-domain-names = "psci";
-			clocks = <&pdp_scmi_perf 0>;
+			power-domains = <&cpu_pd1>, <&scmi_perf 0>;
+			power-domain-names = "psci", "perf";
 		};
 
 		cpu2: cpu@200 {
@@ -73,9 +71,8 @@ cpu2: cpu@200 {
 			reg = <0x0 0x200>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd2>;
-			power-domain-names = "psci";
-			clocks = <&pdp_scmi_perf 0>;
+			power-domains = <&cpu_pd2>, <&scmi_perf 0>;
+			power-domain-names = "psci", "perf";
 		};
 
 		cpu3: cpu@300 {
@@ -84,9 +81,8 @@ cpu3: cpu@300 {
 			reg = <0x0 0x300>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd3>;
-			power-domain-names = "psci";
-			clocks = <&pdp_scmi_perf 0>;
+			power-domains = <&cpu_pd3>, <&scmi_perf 0>;
+			power-domain-names = "psci", "perf";
 		};
 
 		cpu4: cpu@400 {
@@ -95,9 +91,8 @@ cpu4: cpu@400 {
 			reg = <0x0 0x400>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd4>;
-			power-domain-names = "psci";
-			clocks = <&pdp_scmi_perf 0>;
+			power-domains = <&cpu_pd4>, <&scmi_perf 0>;
+			power-domain-names = "psci", "perf";
 		};
 
 		cpu5: cpu@500 {
@@ -106,9 +101,8 @@ cpu5: cpu@500 {
 			reg = <0x0 0x500>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd5>;
-			power-domain-names = "psci";
-			clocks = <&pdp_scmi_perf 0>;
+			power-domains = <&cpu_pd5>, <&scmi_perf 0>;
+			power-domain-names = "psci", "perf";
 		};
 
 		cpu6: cpu@10000 {
@@ -117,9 +111,8 @@ cpu6: cpu@10000 {
 			reg = <0x0 0x10000>;
 			enable-method = "psci";
 			next-level-cache = <&l2_1>;
-			power-domains = <&cpu_pd6>;
-			power-domain-names = "psci";
-			clocks = <&pdp_scmi_perf 1>;
+			power-domains = <&cpu_pd6>, <&scmi_perf 1>;
+			power-domain-names = "psci", "perf";
 
 			l2_1: l2-cache {
 				compatible = "cache";
@@ -134,9 +127,8 @@ cpu7: cpu@10100 {
 			reg = <0x0 0x10100>;
 			enable-method = "psci";
 			next-level-cache = <&l2_1>;
-			power-domains = <&cpu_pd7>;
-			power-domain-names = "psci";
-			clocks = <&pdp_scmi_perf 1>;
+			power-domains = <&cpu_pd7>, <&scmi_perf 1>;
+			power-domain-names = "psci", "perf";
 		};
 
 		cpu-map {
@@ -235,9 +227,9 @@ scmi: scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			pdp_scmi_perf: protocol@13 {
+			scmi_perf: protocol@13 {
 				reg = <0x13>;
-				#clock-cells = <1>;
+				#power-domain-cells = <1>;
 			};
 		};
 	};
-- 
2.53.0


