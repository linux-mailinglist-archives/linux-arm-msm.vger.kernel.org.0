Return-Path: <linux-arm-msm+bounces-88588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AB5D13A5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 16:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7410B3051120
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 15:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375E52E7F1D;
	Mon, 12 Jan 2026 15:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B0qvEX8P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VXqO0ZiA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D842F0C63
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 15:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768231094; cv=none; b=UcCiRDPpXt6WDS9LlxSeX65GH/esfK7srCd8HaquRAHpXzbZ3Rv8q4xjLtvudyxQ5ST4/e7YhbVS2nfTZu7dr+Q/1vezXo3voOpimkiLjz3WVqzn4imn0pnbSRSoMTWP5vhsZWxeaYlA/fkrtzW8yw5lYQ0tVbRV0gTicSnhj60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768231094; c=relaxed/simple;
	bh=NxFptabU2j+7xs2D5bUqViZ6pvqo8VIQkUa/OgQ5A6E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bRCIzsiIzujtAlbd2vapQz0x2eT4GQEWSNoxqs5SCBhpcCWkY7Dp2UNoSBUeue6g+Grp2Bo3ThVTXdskMqxymTAO2yUgJPKKEwnl4btx1McFv1F3tgpQ6vW8p4Deq/REzd5eFSjKXzeVjJhp7GYJU9ceYuGA6PgAk+6kI1nu/CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B0qvEX8P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VXqO0ZiA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8QKKq113367
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 15:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1uz7GdQ1OohVNys4vghnlrN8fx0G37LqbV2
	TdppSdrY=; b=B0qvEX8PG0LjLuKGAwZYe1i5POpLuEr7VgUtNTLQ0waDNXDmcCU
	Y+bIxH8JaY5nf+XV6LFLbDiCeMheXb77kZR86R18dlEplBRxLjGPDweODQoll6M5
	F0EZ1+IEjZk1merruRqti4kOP2320/KRS2Q5jn/+/9flPI0GkqTlduwDTJHby82e
	J/gc39rut5P5USt+1N69zISNgEx1ifdLhARJA/MbMUQ6+LSozb7WbnDa6BTaGyU9
	w+7qYg1QzAFBAsM+IuHlcAvqFt2GbR+EB4nKVjA+m4PX1prn5onTvGYdAeKjw21O
	69Ic9duuWRnQWnAA8mB8qoPgmq/veJwOYeA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4uj7et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 15:18:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a089575ab3so70016395ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 07:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768231091; x=1768835891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1uz7GdQ1OohVNys4vghnlrN8fx0G37LqbV2TdppSdrY=;
        b=VXqO0ZiA1xFnSIqnHkY2Nl+heBxCHMHG4DX+/fC5o9oAWRk07CEfm/uqnjfjt8Z9g4
         I+2U8/6gP6bhjnoqS9cusmXWnGV4gFlDy/YX+kZSR65YM8Oy6dHR9N99iyaIFyCl999S
         Lm+bvDtu0nRnXngRd2Kn3hZ6Oob0qZtGO1j2ZkRBAJwFFFaeSBYbUBoh4/ZYiIwHuHMN
         0t4F9xG/sPOee6dxpANSaZIq9MOJXAcBPsGPbbFiZ9/nVcPV7sEadXKp/9bN8jRZHB9z
         9ZhyreR2/edbTOSEuvNnGblGyE6zdf8ZRfMoPizZlSlu99JS2PEPVQQxdI49QnDuF6w8
         Nheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768231091; x=1768835891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uz7GdQ1OohVNys4vghnlrN8fx0G37LqbV2TdppSdrY=;
        b=Mp5oUVin+k3VF0zULLGxsKNtOI1V2TxpcTnfbynE0xfKW4LG2ShTSuwiNpB7UWEH7A
         qsKFDhyRcljDSTTCgYG9oZIYuLIbI1Y0tfqSbrG7gga94642dyCyKb6kSr/2YO4ylQGP
         1/OBt5S5j8FltdIAfEqU855FruRSqm79xzIwObV/F456IZ1JGuYrU8pfS8kcWQUHtG44
         E3ReL/CpkuTX+zeHIC2Cde6ZyhpWLRVcN34AcUcwEPrN5jl8yMUypbRh3bJXo2ORMdBe
         f+uxv+RY7wDYcHAa/W5KdcVD/scaV4AyWCoOEYEMGg64RMrvfxOeKtsUb60AWj/HofW7
         hGxg==
X-Forwarded-Encrypted: i=1; AJvYcCW3lOnLvJKL3rLLG7ISlTbANtesHUyJ1SaME6thEARGGxuzXmF5UctrR1wdO8dF2td94p9yOVYrfBHM8TbD@vger.kernel.org
X-Gm-Message-State: AOJu0YwWN3Si35nTc1XAkIA7xZZHOykNSgy/QxQ05OKpvKGfAPOSQm0z
	ePYdYt5/rGONa2xKxwJhBlh12UMwX3AumocNm5yxol52f/3ieZrfvCQ7plRNiLmi/3aPjzhupIu
	/zas5t+jhDGXq7bts7+aL0DK3hvSDDSvlolsMI328gVsLLqadU43WZT0l6pumyu+n9C5s
X-Gm-Gg: AY/fxX5BQt+VlUecmbCWdjRDNrZ5l3B6Osb1B34TDpmQ6cForC4vtOeBbDZeq6VRXBd
	bD8FkLayxsULCiMm5nX0tDpszzN04TywUpbETIPEhy0Q0PZDkMGhLt3GIEp+euvhMd6p8WtsrLA
	zEbiWkfUK8msQI7Vs5+qHxH2uYwABT2G1Ep2zF5USMX/w+o1XuzxRl13uxePfm9o30T3sSDJr5Z
	a5fLqyif+QPPWWeeJi1dF5H1Ura2UOa352kCxMXJZjn8ig5cF6h1CrDNlkzoZoIdElkQSa8QJsP
	4UgF7U8J3t82s6vohN1TTquBJPMAhBzvAN2a0mFtzKq9r8vKdsTgCz29NkqQoG1HUNq90IhkLOS
	U4vaKBnoZ6Ct48bMlH2bVlwJKnLmusOl586RR
X-Received: by 2002:a17:903:3c30:b0:2a0:fe4a:d67c with SMTP id d9443c01a7336-2a3ee437a5dmr174542325ad.10.1768231091352;
        Mon, 12 Jan 2026 07:18:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFirjPHFwFcnM1DT/rHG0kFhSwVGgGjGlP/Wu/BnhCFZbEnN97JNwYjXc0mQEprqSGdz2Xvfw==
X-Received: by 2002:a17:903:3c30:b0:2a0:fe4a:d67c with SMTP id d9443c01a7336-2a3ee437a5dmr174542015ad.10.1768231090679;
        Mon, 12 Jan 2026 07:18:10 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88e3sm176103675ad.75.2026.01.12.07.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 07:18:10 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: sm8750: Enable download mode register write
Date: Mon, 12 Jan 2026 20:47:25 +0530
Message-ID: <20260112151725.2308971-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDEyNCBTYWx0ZWRfX3xSO0OOamgAC
 CMw2VhdeQITCrUoykzpTv4sdAt7iOXo1o3oL5hxprvQjwp/0MPTSAdNwC9zJ63KR3X5m/hO6iqv
 XDEMZ1H3xjcpLSVy3ltkzHMDsEawoTpOay9mNDg5p6uLeGlQvSoqUWq+puZi0lQ/vPnBtBg3dBJ
 JueiB2hfL8OVDZuOqnSVmIaoAJIlDh8l/U/KHBfSBdc8EgH2tjbzIFsgWTvF0LHrZiCQ0yMn4un
 ZpQQKktBipdmulB5tDG6iPq4x1UcB7iXNiiKUTziRg3ug8mkYxdMwldcjOaw9tjTvRUU3TwX8/W
 ive0nDbe6hn26ZEBZVbUoB10f6fhnI440Ey05712Aqa47OTyS7DBeBSrqY0A2lcSZVynea2SmnL
 fqI0zcGrrVzi08KBSa8FhbQ3N4svb8ZQQG4rm/XnftXwzlk6K6AXxuSOxQwl7W160lC2HpaLJpG
 0EXKrDXcRQ47Wuq0LFA==
X-Proofpoint-ORIG-GUID: GjFMj62dkTIWgt6bToZjiOmzFP0f9ouU
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=696510b4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZJQsJAtiAu0WCEyc7p8A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: GjFMj62dkTIWgt6bToZjiOmzFP0f9ouU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120124

Enable download mode setting for sm8750 which can help collect
ramdump for this SoC.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index c0734f6185e1..c812b2d26483 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -203,6 +203,7 @@ domain_ss3: domain-sleep-0 {
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-sm8750", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
@@ -2097,6 +2098,11 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: syscon@1fc0000 {
+			compatible = "qcom,sm8750-tcsr", "syscon";
+			reg = <0 0x01fc0000 0 0x30000>;
+		};
+
 		remoteproc_mpss: remoteproc@4080000 {
 			compatible = "qcom,sm8750-mpss-pas";
 			reg = <0x0 0x04080000 0x0 0x10000>;
-- 
2.50.1


