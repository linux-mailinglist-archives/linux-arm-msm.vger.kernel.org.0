Return-Path: <linux-arm-msm+bounces-84284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C2BCA24C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 05:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FD50306D586
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 04:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34552F9C23;
	Thu,  4 Dec 2025 04:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G4uHAAmB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZgJdhu/a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA422E8B74
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 04:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764821537; cv=none; b=LEVai8SROl2oxQjPCh65iJu9Wgj6fGvm4dftbLIqWdnDamgu2AUWej/OZcDmzwtjx1z5hL1fVNIZ3EaTOxZxvdAfDlGdnUVZ1zDbyqB8WIUP6BH5M7RXrNfIAQWeTLVl1+BG7WmCMrsbsgiMy+4tolJ4I9Wsko7UkfwrABqtSFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764821537; c=relaxed/simple;
	bh=0cpz3vXl0wj9Gl+KItGGITcwNYSL/Iv9Dkrw9dzNVD8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LPgS8fPBfNb3DpMlU6oUs1aegsPeGrro6YpkMNoEarnKy53JMywBWMZLX0e91aLcocQoEgrslw9qb9Vy4uJuGfbph/4BP2T+c+jGM9HC1s7Y8IWArifBwz0HSNJI0KRx3FZeyLewmnm2Fbg4vFtPWfvNYqikk6I3mpwZUhYxass=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G4uHAAmB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZgJdhu/a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3MhN9l1975059
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 04:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VZjWy9N9F+rybadEEEOL/8NRFhM27kXlAYs
	FGx84kis=; b=G4uHAAmBoR2whUWeX2qVwfWk+IPxRo5QWu2v7lQyzTwC8GX1GqJ
	ggiObNmDPSnqOLl/n2ba1yVMRxwlQ9MScVputtP5zkyItnSOL8xpWq+ItuIhrqjU
	GN2KTbUcjNKfoF/oAV4qgv0kyVLoOnEGDWEuUoKf7c52bVauhVBkKeNtY9Gv+XkX
	djbbZk0A2gO7+YuC3mNRM4bYrbvMjphO9A6EsLJM4LRWltk80QTVlIpCA3hHlMxB
	iHv94YAKUIlN0S5Y0F2G4LjKq/SxZCAxI1dMd0m7hUCDJu6Rb2g/3YqA5UdJuce7
	KbrZCh9T2unsjdueUdg4FNtzwXVAj0OfwYg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmbtjr9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 04:12:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297d50cd8c4so14992275ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 20:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764821534; x=1765426334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VZjWy9N9F+rybadEEEOL/8NRFhM27kXlAYsFGx84kis=;
        b=ZgJdhu/aQI0ABGsoJyd+lBox7/nC8CUyreawSfviKwVtVDrWFmxanNK5LLhfWuzo5z
         H3IVpa+3YdmadccAOfXhsqnJb7g9c3TNYeiWEyKjCofnZDKR0EgNJTvQwrjkYuLwocAS
         pF56LUS1bgmo5FOKeSfKT6bb0EIereZ8d9h2plEUXPjsf+HzUtWkrb9JZNDeiIpfmJVS
         Fnh+78/N12PGsIEJlpF1BclZ1oJFFX2hts87tkBp9+pldpAsrPtlc52YMbszsncLLedr
         7vnCK9a34RRQs7mrd0bjNOTc1WE4OZZbuR4Go2FDUc0jzVnlUBlOdPN3GwbBzsL1k5xi
         6nng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764821534; x=1765426334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZjWy9N9F+rybadEEEOL/8NRFhM27kXlAYsFGx84kis=;
        b=lb23jy2m6ui8d8v13RURc06gOAQUyrJlvtkUtlI2kUK5pGVBZuUISPt9iav1T4riwW
         hJ0yReMBttVc8lpMzU+gRySq4rHO4k7FoMkdUETvbMZM7SjkWuJILATB0SzaCCvDf2SF
         A8hSNsbOMfV9FFcHA72VkeijxaaoplBI9an1+7w+4rNqN/pwDB5U2d+03AfcZ9eTwuAY
         nHNEj7FV4FZicvWSvaqT4UOQ9Ef9eWDf8dtN6wFMx/0iURuENzTn+n1hRnHTZdM9kU0x
         8f5/LNWrZymFArBTPFp3wobX5/cKQ1rBmNcBPAau+R0tDvgHH4ofgH8v8aarHhglvU15
         0Ofw==
X-Gm-Message-State: AOJu0YwappUF2FEGCg9a3ANqsE6q0YYvUZXFzFE/38AzCOGG9gMfqikp
	pobT5K9GB9+xlxCUoZDmINLv5gXwfd0igwx0S7mBjz3v8+sY+LhiG1Qn4MV+jEx9o+9Vr11m78Q
	pmUabABnuWEDXqHVjZk7y/J9VES1muJYMMaBVi2hyudIhkLp9vBtbD2BamfaPPBuAuUPE
X-Gm-Gg: ASbGncvcB0RJc9Z+Ok7GtEIktZMxz3oSfrDalQ1n1AGbo22NA5rblwGXHkb7JgJvDfo
	hvSpImQ4hnYS8xW5EFsX/kPRSYC6bah2iffyK/Lh4kU5xWPWsckBRSmW9AJkozbY0fCt4GHvMbX
	O836E038FmKFbmDko8AmQzSvNJRKvv+wgnfsmVzwdISPXI5ZrLPvyiRGKCc4vamomD+eEyl5J2z
	SzGXEcX2bPcjQGbBXMJgvwQN0Zt8yrSI7ZL7Cl+IAdMbMpPkoitp67dlKofR3H6fLkW+GliWLvT
	3ochDKuUhj+n2qu2hqoYxCrp60iGD/hun7MG5RQEShhneaAK/PwPWkEb9H+39miQDSc62Xg197d
	GiLKgRlXF0TzWT900rATdPpFl3L01wXsrVw957cI=
X-Received: by 2002:a17:902:e783:b0:299:e031:16d with SMTP id d9443c01a7336-29da1ebb19bmr17930905ad.33.1764821534102;
        Wed, 03 Dec 2025 20:12:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHC137dMAN73xnyCri7U2zSn5tVupickDj9G2vXo3zjuPTuudD414ldmzI9/MscykMW1ehgNA==
X-Received: by 2002:a17:902:e783:b0:299:e031:16d with SMTP id d9443c01a7336-29da1ebb19bmr17930585ad.33.1764821533631;
        Wed, 03 Dec 2025 20:12:13 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeae6ae0sm4020695ad.93.2025.12.03.20.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:12:13 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: monaco-evk: Enable AMC6821 fan controller
Date: Thu,  4 Dec 2025 09:41:58 +0530
Message-Id: <20251204041158.2613340-1-gaurav.kohli@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KNBXzVFo c=1 sm=1 tr=0 ts=69310a1e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4iCNTN7zYcp67ch2OxkA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: hYtmlgx36-Z2kDH7rCNLtSVnDUQEv_05
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAzMSBTYWx0ZWRfX3Vj9jFcK4j0z
 eitsRsdJxK8FuzCfOuLEDeAIINDURBa912SGVDqM/2NEdtijN2ZRvmsrWLMR5egPHubJx1r0WvM
 zAd7XiLKSyDNsG3b02xRYbl/yhLIAcI4BPOeH1JbtesWFGmwCkV7vSgDaUCdU8qqV4EP8P7NJkq
 PNOmMxL6nujoF5W4Pfl0mFuQQ0O8io0TtWVSxPbwg63kKVsfEXo+/kR8cx1Aa+VLauy7xPi/4ji
 OCPloKfVhrFQaOoA0RBN2yY8hqu4k8j2dHox1l1dwIlnHHfYmRptagqXqXOQ0NhEb3v16+G5ZS3
 eGc9OyAboNRz1b6A7LkICSmUQ7gi2qUTA+TbjpQs6KbOl/5Z+06TD41zyi/xBHaFANBTNE58hoc
 9aHg0F9xI2YwlBPSwFlyiOdaLwz7Rw==
X-Proofpoint-ORIG-GUID: hYtmlgx36-Z2kDH7rCNLtSVnDUQEv_05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040031

Enable AMC6821 fan controller for monaco-evk platform and
configure pwm polarity as inverted.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index bb35893da73d..2f3ff4aa4847 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pwm/pwm.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -323,6 +324,16 @@ &i2c1 {
 
 	status = "okay";
 
+	fan_controller: fan@18 {
+		compatible = "ti,amc6821";
+		reg = <0x18>;
+		#pwm-cells = <2>;
+
+		fan {
+			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
+		};
+	};
+
 	eeprom0: eeprom@50 {
 		compatible = "atmel,24c256";
 		reg = <0x50>;
-- 
2.34.1


