Return-Path: <linux-arm-msm+bounces-85184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E43BCBC838
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 05:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2008E30087BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 04:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F8B315D24;
	Mon, 15 Dec 2025 04:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gd4Cx1lM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N0IcB4qF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AEA3176FD
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 04:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765774502; cv=none; b=DL7j0KUF8veh2uq074fte0g03i36qX8cfimd/iWGEr7RE15uVyurW999Rnz6A12L78RVOjDSuoVysfbnyzU1eJPRrpG3SWS4EmPsTFFVTCt5E+kNLKK8DmVreAcqidF2tw7V0HgYor0PbOjKR4Ta/dPHoM/qSSNUsOy8KWc4ykc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765774502; c=relaxed/simple;
	bh=OtI43I9uh5Dxj4J6JYHv+KXNtGFs6aWMCpVLpoCkE6U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ezvihrnIX6ntdS7b1/3SrbbnQuRj9Vu+3gs24P3guwSI2timYpCQ6k73VkDXEZ3crfnlrhVzygIa8qNKignZCmFTTuvl581TjaK0KrpGeAJr+24xNRXjwl8RwfGv670oApaF11+sCvQpl0LbSproA3d/ZNzxHZ8Ihv6xO7SJS9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gd4Cx1lM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N0IcB4qF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BEMlAYW3144133
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 04:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XCRRoZX5HFKwk0TtzOQqIO+LFtD6GUuisWM
	F/z8xudo=; b=Gd4Cx1lMtf3MaMJDukQb/83yDPwwIPCoTwjAb3eUG1yiHp0eLY1
	vbBB65Zs3joFElIkKvTVIfODlpujZt6LlzWc50kn7Hnrrc0PQHAotGpyWR8NCX7l
	fWp9cPx4t6WTeW9Ue9Cynztg2WuBkyLyO/gO1eZmZaxThgPkBt5UEC37McPJ7uJp
	dxbo8VATTmjVeuJ0HwmivHoAJ+ETFYHVjawLxFPcbV5FoybgzQb3X++9/4xMsVNw
	qHN4F7HTB6Uq1gqufkbUORt0X5Osswy+w4PRtxQ3eyWp0MVfOClF21n6hxdqEi46
	OV1NeASkoUlBPY8uYTodzILylvV/iXhlSLg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b119ak7ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 04:54:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b96038aa68so2785699b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Dec 2025 20:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765774499; x=1766379299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XCRRoZX5HFKwk0TtzOQqIO+LFtD6GUuisWMF/z8xudo=;
        b=N0IcB4qF0bT0H7vZSADW2nWuewyzoZTFuYJeKJvzJ+SFy3qZdBYr6XIRvB+InHxa6z
         iTBgdEVPpkKDYecMOsb29fd0ghbyNcOQMw6Qk6NuiCpoBx0yC6FKv948Hg74e/z1L3or
         twTpS4KXasTULXNMtFn34uBJLqXbToj3zMDGGyetxN1pCVrLFBhZXJ4Wu1TJyEkX4p1T
         9QAi1Ro9NRA/Qnt6qcajZ5LrnKcHIsJWB2uXQA/hckKdGMGQCQPAjDBuo8nYQCmGmMTt
         v5Pkte+Y9Rh144r0xvlvgyj9m9M2qyKMqIjH+qfne3tD5n5XHht965w0S5D4AmKn2VaQ
         lKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765774499; x=1766379299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCRRoZX5HFKwk0TtzOQqIO+LFtD6GUuisWMF/z8xudo=;
        b=PyRkTIUNIuIv7WkAXudDm5fQswHPSywz2d5WR6buCWHDhNTO9v7Nf+FASt9MjwtiMI
         n2BsLUEyvFYonefeLgEj5VZ4vAPg1lec+6r/AIDnNk3aSPcpRBsRpMUwJIIF7EQ4os14
         zPYTXcb+pOhHknreC1o9n/XD9kl1p6nyzXLY1nnm4fKl4uqBXtZkNMCqfQfst1jogCi/
         8beiyv2bmL9xiiVm8/7ONMHQ6OUihRSEioO8dSxfbPVr2el/3DfyjQ3i9uVMfkpITena
         E3peNvFLGcIC3w2FSrtGnL1qzc4jmKGjGNtkyUf0EaSKU5uURze62VIPLX2od1uUHwyu
         a23Q==
X-Gm-Message-State: AOJu0Yyr/yLbkoK4inFtg3scoTHgf3lycRxt64kszOk4ibdZlLWHY2l5
	kS7VO6M12EaCl4ZE4TSXDP7+SOXI2C/OkJ4yXg0dbP+Hp1UUEtkCYytVEG4j5YgHlv7vIxss9SI
	0D61sVCwaIgmwfx2sCQCjd0fwNgQ53J+cvsnnm+wZJJVz9dz5m0AnG47WSsTjyaCaW110
X-Gm-Gg: AY/fxX5E43H/3o7Kl8HurTmeGVyLW3hJ/LwwWTwoKPxOKxmgusAMj/F0xxSBoNyv9ab
	7exYTgIUxUnTJ6MLQjioIuKBKO1dSJzcxhSzt/nu0Lt+KEB7kFkVRu6ah+eSXr2NfyYUyg4k4sh
	1CSiPPO7wZfX1U9JfroHGmfUaDudOJGvChr7PVSsgvItXqceNEU91ke50dXH2MxEFButwLUe1N4
	lx37C9lG7ope1opS/Nrlbek33cuzkg1zlXvE1Rwm64IGGD+B1JdCRqne085F9GMM6+Npl5rndgU
	Bhohl4v58rx5CUJM6DBrcoxZ5ADM2MuxGtqvszbiwsjpWigz7C5PxIM25vl7oqlq1Q+rXWkoQQn
	5phxDhuSF0jVwQ9K8C6bDzM35/BxMYc1X3NlWEtA=
X-Received: by 2002:a05:6a00:6ca1:b0:7ad:1907:5756 with SMTP id d2e1a72fcca58-7f667936b06mr11473322b3a.12.1765774498650;
        Sun, 14 Dec 2025 20:54:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjX9StN1jhhvvUIZ1mWxtutuPbVNNSt7BZMg2/9K4HOgGDP2M7J+aTFxEJGdC2uHG+izMDag==
X-Received: by 2002:a05:6a00:6ca1:b0:7ad:1907:5756 with SMTP id d2e1a72fcca58-7f667936b06mr11473288b3a.12.1765774498159;
        Sun, 14 Dec 2025 20:54:58 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c4aa91d0sm11190997b3a.32.2025.12.14.20.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 20:54:57 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: lemans: Enable cpufreq cooling devices
Date: Mon, 15 Dec 2025 10:24:51 +0530
Message-Id: <20251215045451.3150894-1-gaurav.kohli@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA0MiBTYWx0ZWRfX70NpcaCXW4r2
 VPqFnCIi4c5G9fM+D90GVHTvK36UcL1acFbAAzXaIgdwt6iiAAGkdOqTR8/C7stezX2xHt5eDH5
 LAouXxLzYZUzI4V9D+NCqTr+NWyJIJOrJPHhLWaIEu47P11HyB9WI3HUdqLa1nWVodtMtgiRhvw
 bc9Yxh6DBFOaMambHnG7oijL4UqcKgEI86ew5NDKblOnO6huX4qWQkaokGcoCCXfVLP5wJ7Tn9n
 lk0F6xF6Aydsfw31n9wzFrkKkzL2/5lKnHWTnsuFIEaKENzSwvWglpACMz/iAYesdx7BGvRbbbq
 HVsgW6j23poPdmruJCu4hB7cnHlL1w/q2OecFlmFiSJQdPwQeZ1PKBETMkBbBTs7buq/Z2GEh8r
 rdi0L+vtOOrafYi3HDlgIgaxGJ77hQ==
X-Authority-Analysis: v=2.4 cv=LNFrgZW9 c=1 sm=1 tr=0 ts=693f94a3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZDMc2YS8df6EeW9c3AUA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: AwQEE6jyBp0GAONVNUygw9KxCDLi83uo
X-Proofpoint-ORIG-GUID: AwQEE6jyBp0GAONVNUygw9KxCDLi83uo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_07,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150042

Add cooling-cells property to the CPU nodes to support cpufreq
cooling devices.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index f80f9b950ed5..24f6ef430320 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -55,6 +55,7 @@ cpu0: cpu@0 {
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
@@ -84,6 +85,7 @@ cpu1: cpu@100 {
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			next-level-cache = <&l2_1>;
 			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
@@ -108,6 +110,7 @@ cpu2: cpu@200 {
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			next-level-cache = <&l2_2>;
 			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
@@ -132,6 +135,7 @@ cpu3: cpu@300 {
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			next-level-cache = <&l2_3>;
 			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
@@ -156,6 +160,7 @@ cpu4: cpu@10000 {
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			next-level-cache = <&l2_4>;
 			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
 			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
@@ -186,6 +191,7 @@ cpu5: cpu@10100 {
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			next-level-cache = <&l2_5>;
 			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
 			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
@@ -210,6 +216,7 @@ cpu6: cpu@10200 {
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			next-level-cache = <&l2_6>;
 			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
 			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
@@ -234,6 +241,7 @@ cpu7: cpu@10300 {
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			next-level-cache = <&l2_7>;
 			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
 			dynamic-power-coefficient = <100>;
 			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-- 
2.34.1


