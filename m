Return-Path: <linux-arm-msm+bounces-98459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MopOBGeumngZgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:44:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 810D42BBB63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AD26130471B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D783D75D5;
	Wed, 18 Mar 2026 12:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZI695LtZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4p1A3I5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA9F3D75D0
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837685; cv=none; b=NDuSeqKUTQMVAQ+tJRmrkRBcx53PBw3adac8sSy3mfzcqiyfUCUNUXZc1uLBVdwowTY6HauvOaeLNJHpaGqjp8JSyxfy00HhfU6GZch9xGTVfbBUxYsMUHm/R7+8A7NHh8p/ZVJoImvBkQdnNJwpciRpxbT9NETOQ9plEs1c4pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837685; c=relaxed/simple;
	bh=vHVi3HpnuTyeFgM6r7yOwJKxtmmp832ydAxUg9JS4kc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NjaA8aymTV5+npY00jqdki610tmNDBjSxaCr5Eco3non26ExjjiBMbD0xxp5+32MPlVwxbyxdKl61sin3txOeIi2Sp2ATpd5AgmZiN1JMd548u3mZvXKM2oxyyx6QsgDPXLmyXdWEWLRPEJW1U73VuO4ziIY8f9mp9VkG9bcKq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZI695LtZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4p1A3I5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IAi4Wa008780
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 12:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MNPeDJEhaPj
	BjdqxIt+R7AAcY2Fwhn6fypcd/nzle7o=; b=ZI695LtZt435IrnQ3dyLIJvFq/y
	AHro0ovAJV5zZyzyEkt7J/01qRW/yer4RPhX8bICRx2/6FnaOV3YC6wivc4NM2U7
	u9bJB6MmbcNYKlqHyhWu0nuxWENjJeXBWnPtiNT6NcMpC9QfRsyCWtAMeZ01UnXd
	SaHwm2sr9Amcvro+NSzZN/mwXY+JY0Pc+KGC8ZmLCIoaRybfNOGhWmpKzfOigw3y
	4112nAcV/uBQMZxMBj7DCKn9nVyUQ6foT/6Ap9MWZELZy3GO3Gsc9yOvDCnBkrXX
	nU8wn6xUcTMy8aLwKdJz5qE5CfcX12XI/LX95c+4VqJvzGo3Ne4CJOdDqoA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj50c71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 12:41:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0d15416b3so33254746eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 05:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773837682; x=1774442482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNPeDJEhaPjBjdqxIt+R7AAcY2Fwhn6fypcd/nzle7o=;
        b=a4p1A3I5SYck7RAFADubjSvk4rEM2Hg2dvvGdZKBvHo6qXOkSevC3ZIO8GD5NwFgoH
         C2GWZk5EcRYBbfJfapx46vbR3r/VOVJ3IgwGKAWojAKo/iHdsORXbGrCwVRkcdOKz1i1
         yGGr2JctoHmN4J2jlewgeDw6Ue4CpsmIBgkBOnPNx3v805XGFtEzF4wdStScz7YUxP0i
         iajZ9HVveQhP1qkVbpXtDR4dpejIB2L9/B0viRfZuzhC/bxjRRpSiipq63U8SmsM7NRI
         KtdHZFKLNf8oS5GxspCSAt8NxUPg1CSNFW8/lvjTSAvvHP8B3NlCbK77iRZ9HmlBvDlU
         02Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773837682; x=1774442482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MNPeDJEhaPjBjdqxIt+R7AAcY2Fwhn6fypcd/nzle7o=;
        b=LVB88j/FV/HqopLD0+9S9EtojUBjtMeFfFM9fGa9o8mO1WFggnOwfPXXvZFHcxcLTS
         6iye9bdgZy/iFiaOqAsNpuz9WQFeYpm9bSX1SvEnQ/Qk0UhN5BFgHxUYmrCLjxIm2pHL
         +PkHeMoi67WJJw7sFcepGTXpb5BPi66GjKFougk79i2IxB4wSMvnjFNhwv96GgNLHQmm
         pCipQxSAAeaQRDiD4ckOC4lRHrQuo/i3ySIZASNQ5+OA/Lw71aYrW/y57/tuJZn2q9lE
         efgSr2ltGG2kwmDvD9CkO4S+z5o8B0Zuyo76IKT51Dzehg6tKRFrJVCjewQe9YhhIwTG
         G3Dw==
X-Gm-Message-State: AOJu0YwwT2g4nsQlwhwaF5w52lAMQsazSDBzR4k2xY/DDZe8VdvVHmLs
	rBcEP7ZbOT6GlGSe4/iZg860YROZY2k98rPMaSXat+uoGWrbDIf9aNf9e4hDcShAAoXCkmGtQNM
	5nR/7SpXl4BebVjJp/F6U/GSQbN4VCkbhSaYNSOuFrEzy428OzdeSZV8875bHtJjg6KJD
X-Gm-Gg: ATEYQzybnn3NE4YzBMXYC61bd62dZh3hYOXjIWFvFpHco8BP/Ku8fWhz/qJZA/dLWKd
	Z1+63yOMm6MaRN9rX7Rpk0FcoOf24zJU49QBGnL8io66Y3m1ks0IXSghpzKjiFlDQcmx6Wh2trG
	7PccYHkJ29OwAvD4MkaR9Zj8paUAagWlnXwKod5YHrx7Cdc+XXo2ucuFSOeRD+FwzMQ5/jQ4szt
	Y28QEgrX0QoDHWVbuSF7IXUM3kpo6rElCcuTJRtBlPoUxfClRpGz6/jzt87mnhvQcrXUgL6D/Ka
	Z6IA/Gt82e/48/ebYevV4IgBm7XibAszyrchmm4k7+x9gHRpzGChpy8rqsf5vDZeI/eozh9Vwu5
	66ZeiPNW8akS+z5UMjZ4GQjPRIUpZydw3CGSaE6LO/JtiJKvsm4U7tgOte9K9wT92H08eQfepkt
	L88sh8qHP6/g==
X-Received: by 2002:a05:7301:6785:b0:2c0:dae2:9c50 with SMTP id 5a478bee46e88-2c0e5115c33mr1504538eec.31.1773837682074;
        Wed, 18 Mar 2026 05:41:22 -0700 (PDT)
X-Received: by 2002:a05:7301:6785:b0:2c0:dae2:9c50 with SMTP id 5a478bee46e88-2c0e5115c33mr1504509eec.31.1773837681133;
        Wed, 18 Mar 2026 05:41:21 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e53b5fa1sm4454521eec.10.2026.03.18.05.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 05:41:20 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        pankaj.patil@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com,
        qiang.yu@oss.qualcomm.com,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: Add Mahua SoC and CRD
Date: Wed, 18 Mar 2026 05:41:00 -0700
Message-Id: <20260318124100.212992-4-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318124100.212992-1-gopikrishna.garmidi@oss.qualcomm.com>
References: <20260318124100.212992-1-gopikrishna.garmidi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEwOCBTYWx0ZWRfX97+5JWsolehr
 cib883U8zaO+PKpVg/DwmR05c0UKxtFg4FWR3XXnHba+3/inF8vDENGEsd+jFLIPfYJ7TX4kWUx
 sukRLUfXbcRCEsU06MX6izsRiuq1Eqj9kbOnteLl8+BP0t2/BxY7N18xLtdqLK3kJhKFjpczaz5
 GfAXFj/Q22/gYXlQuuQkJvkPoudjIyZNY2oL1EJbPrX0bulPBW3aTsHBkMF82UGmiod1gD4vM1/
 IX3fYuT7xAlvAjwOCIATqhwcjs79iY/gqyidvT1pt/JOkBJPMhDfHg3siOh8FCooVhNEr+Aih7q
 /wmmqhsZ9boeX8/bnFVGv5xwvM2BniQOKXHKhP2zaUHJiyk101oqKh900pEopDv5THYPXqnObRn
 bKsGyNBXFzGXxtBvuQm6EAFz7AJsCHJkLdciZI0sNeYcIwmmuWxQDJkPn2sIo2sn6XJtj8nwD73
 IrmtwOo3akDwolADo3Q==
X-Proofpoint-ORIG-GUID: tECGzk-GS2kyyGNtnU1jWOLIXV6UPIg9
X-Proofpoint-GUID: tECGzk-GS2kyyGNtnU1jWOLIXV6UPIg9
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69ba9d73 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=4nuuKY_MPYQNcC36K5wA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180108
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98459-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 810D42BBB63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce support for the Mahua SoC and the CRD based on it. Some of
the notable differences are the absent CPU cluster, interconnect, TLMM,
thermal zones and adjusted PCIe west clocks. Everything else should
work as-is.

Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile            |   1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/mahua-crd.dts       |  21 ++
 arch/arm64/boot/dts/qcom/mahua.dtsi          | 299 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmcx0102.dtsi       |   2 +-
 arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi |   4 +-
 6 files changed, 325 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-crd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/mahua.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 317af937d038..e85ff36012f1 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera.dtb
 lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e269cec7942c..4e0b44af073e 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -282,7 +282,7 @@ core5 {
 				};
 			};
 
-			cluster2 {
+			cpu_map_cluster2: cluster2 {
 				core0 {
 					cpu = <&cpu12>;
 				};
diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
new file mode 100644
index 000000000000..9c8244e892dd
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "mahua.dtsi"
+#include "glymur-crd.dtsi"
+
+/delete-node/ &pmcx0102_d_e0;
+/delete-node/ &pmcx0102_d0_thermal;
+/delete-node/ &pmh0104_i_e0;
+/delete-node/ &pmh0104_i0_thermal;
+/delete-node/ &pmh0104_j_e0;
+/delete-node/ &pmh0104_j0_thermal;
+
+/ {
+	model = "Qualcomm Technologies, Inc. Mahua CRD";
+	compatible = "qcom,mahua-crd", "qcom,mahua";
+};
diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
new file mode 100644
index 000000000000..7aa8d26b2b3a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -0,0 +1,299 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/* Mahua is heavily based on Glymur, with some meaningful differences */
+#include "glymur.dtsi"
+
+/delete-node/ &cluster2_pd;
+/delete-node/ &cpu_map_cluster2;
+/delete-node/ &cpu12;
+/delete-node/ &cpu13;
+/delete-node/ &cpu14;
+/delete-node/ &cpu15;
+/delete-node/ &cpu16;
+/delete-node/ &cpu17;
+/delete-node/ &cpu_pd12;
+/delete-node/ &cpu_pd13;
+/delete-node/ &cpu_pd14;
+/delete-node/ &cpu_pd15;
+/delete-node/ &cpu_pd16;
+/delete-node/ &cpu_pd17;
+/delete-node/ &tsens6;
+/delete-node/ &tsens7;
+
+&aggre1_noc {
+	compatible = "qcom,mahua-aggre1-noc", "qcom,glymur-aggre1-noc";
+};
+
+&aggre2_noc {
+	compatible = "qcom,mahua-aggre2-noc", "qcom,glymur-aggre2-noc";
+};
+
+&aggre3_noc {
+	compatible = "qcom,mahua-aggre3-noc", "qcom,glymur-aggre3-noc";
+};
+
+&aggre4_noc {
+	compatible = "qcom,mahua-aggre4-noc", "qcom,glymur-aggre4-noc";
+};
+
+&clk_virt {
+	compatible = "qcom,mahua-clk-virt", "qcom,glymur-clk-virt";
+};
+
+&cnoc_main {
+	compatible = "qcom,mahua-cnoc-main", "qcom,glymur-cnoc-main";
+};
+
+&config_noc {
+	compatible = "qcom,mahua-cnoc-cfg";
+};
+
+&hsc_noc {
+	compatible = "qcom,mahua-hscnoc";
+};
+
+&lpass_ag_noc {
+	compatible = "qcom,mahua-lpass-ag-noc", "qcom,glymur-lpass-ag-noc";
+};
+
+&lpass_lpiaon_noc {
+	compatible = "qcom,mahua-lpass-lpiaon-noc", "qcom,glymur-lpass-lpiaon-noc";
+};
+
+&lpass_lpicx_noc {
+	compatible = "qcom,mahua-lpass-lpicx-noc", "qcom,glymur-lpass-lpicx-noc";
+};
+
+&mc_virt {
+	compatible = "qcom,mahua-mc-virt";
+};
+
+&mmss_noc {
+	compatible = "qcom,mahua-mmss-noc", "qcom,glymur-mmss-noc";
+};
+
+&nsi_noc {
+	compatible = "qcom,mahua-nsinoc", "qcom,glymur-nsinoc";
+};
+
+&nsp_noc {
+	compatible = "qcom,mahua-nsp-noc", "qcom,glymur-nsp-noc";
+};
+
+&oobm_ss_noc {
+	compatible = "qcom,mahua-oobm-ss-noc", "qcom,glymur-oobm-ss-noc";
+};
+
+&pcie_east_anoc {
+	compatible = "qcom,mahua-pcie-east-anoc", "qcom,glymur-pcie-east-anoc";
+};
+
+&pcie_east_slv_noc {
+	compatible = "qcom,mahua-pcie-east-slv-noc", "qcom,glymur-pcie-east-slv-noc";
+};
+
+&pcie_west_anoc {
+	compatible = "qcom,mahua-pcie-west-anoc";
+	clocks = <&gcc GCC_AGGRE_NOC_PCIE_3B_WEST_SF_AXI_CLK>,
+		 <&gcc GCC_AGGRE_NOC_PCIE_4_WEST_SF_AXI_CLK>,
+		 <&gcc GCC_AGGRE_NOC_PCIE_6_WEST_SF_AXI_CLK>;
+};
+
+&pcie_west_slv_noc {
+	compatible = "qcom,mahua-pcie-west-slv-noc";
+};
+
+&system_noc {
+	compatible = "qcom,mahua-system-noc", "qcom,glymur-system-noc";
+};
+
+&tlmm {
+	compatible = "qcom,mahua-tlmm";
+};
+
+&thermal_zones {
+	/delete-node/ aoss-6-thermal;
+	/delete-node/ aoss-7-thermal;
+	/delete-node/ cpu-2-0-0-thermal;
+	/delete-node/ cpu-2-0-1-thermal;
+	/delete-node/ cpu-2-1-0-thermal;
+	/delete-node/ cpu-2-1-1-thermal;
+	/delete-node/ cpu-2-2-0-thermal;
+	/delete-node/ cpu-2-2-1-thermal;
+	/delete-node/ cpu-2-3-0-thermal;
+	/delete-node/ cpu-2-3-1-thermal;
+	/delete-node/ cpu-2-4-0-thermal;
+	/delete-node/ cpu-2-4-1-thermal;
+	/delete-node/ cpu-2-5-0-thermal;
+	/delete-node/ cpu-2-5-1-thermal;
+	/delete-node/ cpullc-2-0-thermal;
+	/delete-node/ cpuillc-2-1-thermal;
+	/delete-node/ ddr-2-thermal;
+	/delete-node/ gpu-3-0-thermal;
+	/delete-node/ gpu-3-1-thermal;
+	/delete-node/ gpu-3-2-thermal;
+	/delete-node/ qmx-2-0-thermal;
+	/delete-node/ qmx-2-1-thermal;
+	/delete-node/ qmx-2-2-thermal;
+	/delete-node/ qmx-2-3-thermal;
+	/delete-node/ qmx-2-4-thermal;
+	/delete-node/ video-1-thermal;
+
+	ddr-1-thermal {
+		thermal-sensors = <&tsens1 7>;
+	};
+
+	video-0-thermal {
+		thermal-sensors = <&tsens1 8>;
+	};
+
+	nsphvx-0-thermal {
+		thermal-sensors = <&tsens4 1>;
+	};
+
+	nsphvx-1-thermal {
+		thermal-sensors = <&tsens4 2>;
+	};
+
+	nsphvx-2-thermal {
+		thermal-sensors = <&tsens4 3>;
+	};
+
+	nsphvx-3-thermal {
+		thermal-sensors = <&tsens4 4>;
+	};
+
+	nsphmx-0-thermal {
+		thermal-sensors = <&tsens4 5>;
+	};
+
+	nsphmx-1-thermal {
+		thermal-sensors = <&tsens4 6>;
+	};
+
+	nsphmx-2-thermal {
+		thermal-sensors = <&tsens4 7>;
+	};
+
+	nsphmx-3-thermal {
+		thermal-sensors = <&tsens4 8>;
+	};
+
+	camera-0-thermal {
+		thermal-sensors = <&tsens4 9>;
+	};
+
+	camera-1-thermal {
+		thermal-sensors = <&tsens4 10>;
+	};
+
+	gpu-0-0-thermal {
+		thermal-sensors = <&tsens5 1>;
+	};
+
+	gpu-0-1-thermal {
+		thermal-sensors = <&tsens5 2>;
+	};
+
+	gpu-0-2-thermal {
+		thermal-sensors = <&tsens5 3>;
+	};
+
+	gpu-1-0-thermal {
+		thermal-sensors = <&tsens5 4>;
+	};
+
+	gpu-1-1-thermal {
+		thermal-sensors = <&tsens5 5>;
+	};
+
+	gpu-1-2-thermal {
+		thermal-sensors = <&tsens5 6>;
+	};
+
+	gpu-2-0-thermal {
+		thermal-sensors = <&tsens5 7>;
+	};
+
+	gpu-2-1-thermal {
+		thermal-sensors = <&tsens5 8>;
+	};
+
+	gpu-2-2-thermal {
+		thermal-sensors = <&tsens5 9>;
+	};
+
+	gpuss-0-thermal {
+		thermal-sensors = <&tsens5 10>;
+	};
+
+	gpuss-1-thermal {
+		thermal-sensors = <&tsens5 11>;
+	};
+
+	gpuss-2-thermal {
+		thermal-sensors = <&tsens5 12>;
+
+		trips {
+			trip-point0 {
+				temperature = <90000>;
+				hysteresis = <5000>;
+				type = "hot";
+			};
+
+			gpuss-2-critical {
+				temperature = <115000>;
+				hysteresis = <1000>;
+				type = "critical";
+			};
+		};
+	};
+
+	gpuss-3-thermal {
+		thermal-sensors = <&tsens5 13>;
+
+		trips {
+			trip-point0 {
+				temperature = <90000>;
+				hysteresis = <5000>;
+				type = "hot";
+			};
+
+			gpuss-3-critical {
+				temperature = <115000>;
+				hysteresis = <1000>;
+				type = "critical";
+			};
+		};
+	};
+
+	gpuss-4-thermal {
+		thermal-sensors = <&tsens5 14>;
+
+		trips {
+			trip-point0 {
+				temperature = <90000>;
+				hysteresis = <5000>;
+				type = "hot";
+			};
+
+			gpuss-4-critical {
+				temperature = <115000>;
+				hysteresis = <1000>;
+				type = "critical";
+			};
+		};
+	};
+};
+
+&tsens4 {
+	#qcom,sensors = <11>;
+};
+
+&tsens5 {
+	#qcom,sensors = <15>;
+};
+
diff --git a/arch/arm64/boot/dts/qcom/pmcx0102.dtsi b/arch/arm64/boot/dts/qcom/pmcx0102.dtsi
index c3ccd2b75609..db2da9ef4f01 100644
--- a/arch/arm64/boot/dts/qcom/pmcx0102.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmcx0102.dtsi
@@ -46,7 +46,7 @@ trip1 {
 			};
 		};
 
-		pmcx0102-d0-thermal {
+		pmcx0102_d0_thermal: pmcx0102-d0-thermal {
 			polling-delay-passive = <100>;
 			thermal-sensors = <&pmcx0102_d_e0_temp_alarm>;
 
diff --git a/arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi b/arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi
index d89cceda53a3..7a1e5f355c17 100644
--- a/arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi
@@ -8,7 +8,7 @@
 
 /{
 	thermal_zones {
-		pmh0104-i0-thermal {
+		pmh0104_i0_thermal: pmh0104-i0-thermal {
 			polling-delay-passive = <100>;
 			thermal-sensors = <&pmh0104_i_e0_temp_alarm>;
 
@@ -27,7 +27,7 @@ trip1 {
 			};
 		};
 
-		pmh0104-j0-thermal {
+		pmh0104_j0_thermal: pmh0104-j0-thermal {
 			polling-delay-passive = <100>;
 			thermal-sensors = <&pmh0104_j_e0_temp_alarm>;
 
-- 
2.34.1


