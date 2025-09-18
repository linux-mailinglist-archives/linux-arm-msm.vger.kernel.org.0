Return-Path: <linux-arm-msm+bounces-74099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA19FB85DA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 18:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E24D5652D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 15:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6A5313D5C;
	Thu, 18 Sep 2025 15:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bz2jjyCV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CB2312806
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 15:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210903; cv=none; b=UwNcLZLqljdInA9d3+6aJnptHvc5fjJwtyPYUGhKEN4zjvv9XN12Bc36ithOK1vXoWTfjXXuwbKgCyjYusvp1n7nT4GDXmPPcRSqHBOnu0Bb9M5E2S9NHTbGJSe+ut1wS4joymPvCeFTJz1jrtwSP/1Om2/ZUXcwEoPsBP8QYSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210903; c=relaxed/simple;
	bh=TrV+frHKp8A2bFzxsG2fj2eLK4upb9k/aGE38082JM8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pWpIsy5+ENE/+uoIDhlTk2YVZQtMaAETpqGgMt+h9Ct68+/CWQV0p/lXnPxyDc8yp95TgZ5qtvv/z0x9+tYu4rGkFfbAF0erlkM10vYQmtVNqIMIGi9IMwcszuqBvtQCb1b4VadDPE3oIPV0GVpRoQJrzqIfLrxgrLm8pGJ9duI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bz2jjyCV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IBSipU029741
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 15:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LU5pItXmiqnd4o/P2E59yLiYc8TuhTKDEsc
	hoWWnvRw=; b=Bz2jjyCVnLTxqJonWjLOUioz4+ECBbJhasAduLwF+udTWq0IDbk
	aPcekNODRAFTsB2gUGNvuAgMYe+K1WanO2yFUMWKLHmGsmRlzvihJzZ5qTVkJ6Gx
	2bbgJNKUHwvPWd6aQcfs2rdEA4YvVz/mbhWDM9Fdc6KzUF0naNVZEmk6fEuQhE2F
	3fMasQ31lcP+vUu2rnz5s0LR5Tr2ghttQYqbvSWnmITuIRd132S2lfdLG5oUggh5
	coCREGKlzMvAzpUPAvVae19tfYjKtQVeLk1OgHgHWRWB8yBmQnWtQjgFdp+QynNv
	XMrO22BV83WCvsYwvfWUNO432KmGxqe29QA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy0xyqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 15:55:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7916b05b94bso25572626d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 08:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210900; x=1758815700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LU5pItXmiqnd4o/P2E59yLiYc8TuhTKDEschoWWnvRw=;
        b=qDid5Nv3g7RqTY+EUrJEilJTtLLfbSGBlXsd0juCtCyHCxQ0CPr33W6FpHm+TFkcDR
         rtHQ4BYIBK8CfzMVQGk5SISwnlZvLSliCMqBl/8upIE2LMctn/kZB13FIfHMeqOIq1Tb
         g5WoMs6X1MzZeS7wHgcSczolWXh+vNoxjYBTJS+9p4eYU5ZQo5YYLzQZU5uQ/N37rlhT
         qzGn8ah6waSDAjjLAW2L758cmdZe+nYuW9PElTjumOC6QHm4WC9kyQGga1UvTx9txdUc
         +IpAXCkPiwjXhswJUCW/kj4kKpyW9ARasdbYTMJRkslrb0ZDead06z0DD/LNoy4ercbX
         IYkQ==
X-Gm-Message-State: AOJu0YwvmPI/d05c+B+L+rK3NQlyhAmB+pbZqIgQRMYWUaFx/n6Ezxll
	Z7lUB1cHQJaeJItAI3Azsrqpc8RmohVsbAQx0pS2JHAItYtab+/mwwrqLRKDKztz0hL83DFctst
	qOT8fn+WRBB/do/2z5qGaMYmxh7ZP86gOAiZFC7X4ti3uSnX2e/GZbUF222g8cJyCypiE
X-Gm-Gg: ASbGncvliWl70LaPGJ5Uz/7hsByQOYLz5EnmqFsRXj9bydFej3mITpKfceMD3QpC0GU
	gUkXeqVSEtki7gE07ygClqsLGKX/fhS7RANgiG9HMRI/l5I/OuRijovTMh+rLCfL3A9Jw07gXWo
	p/Uytm6YlCTmR8QD2e88gk2zD4OawZu06DKS/iL78VASjqwMFEp0lkl07jdhygJFh+ARzaU1IxT
	BanEV743hIlIHR17SYsct9eeBd75+JejrqU5JeWecRLcyfz9AOYVpa4JMT9Ve9gnqhr+tkVLGfi
	9q5qwOamr20OvEWyWRhb+ofxa7NTcqDQLcWnHNjzOVRppMes3TjAMMJUX+AOtRKlXwnfy822OYE
	=
X-Received: by 2002:a05:6214:2022:b0:784:be20:64e9 with SMTP id 6a1803df08f44-78ecc6297bdmr77300356d6.9.1758210899764;
        Thu, 18 Sep 2025 08:54:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPqTfGJSu0pVm0mj7H6Eq6hklqspz+RrX/TH168uK1ggsxUzHAvffXmh5lREb28mNN4fUGfw==
X-Received: by 2002:a05:6214:2022:b0:784:be20:64e9 with SMTP id 6a1803df08f44-78ecc6297bdmr77300056d6.9.1758210899228;
        Thu, 18 Sep 2025 08:54:59 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:81ce:8337:616d:c2d5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc5f4386esm223209166b.15.2025.09.18.08.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:54:58 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: qcm2290: Fix camss register prop ordering
Date: Thu, 18 Sep 2025 17:54:56 +0200
Message-Id: <20250918155456.1158691-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VnV6Ilq5xYNfQyhY9HiLoVo374ISINgY
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cc2b55 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=ssarpNazB3TWaIbJ0ZoA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: VnV6Ilq5xYNfQyhY9HiLoVo374ISINgY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX/DR0U9fqxb3W
 ef7TWJinXg+rmxwpuPuH6hba+VwcYwGW6d4UOyVWOhpxjxsBuFaCgUVOwncUer35SsU8jIbkoK1
 bCxwnT6bc0g9ISG9yyp5DIZgMNjFbTyyZ1fPQj4yCxtTTGhhK6QkiKSnNrovPAYJsDE7b/5g5Iy
 Rl1ZupSlp1yUraA2OSwUQDawtSWb4YT9G4avIqzB0w+VhIr/J6970mfsRKTeRhmqfghRK6F8NB3
 n76/3RblUzywNUqDfrPj3GwkBeCO4LpGfd1hRGc5TyubF5vwwFhJXXRqQ5u/lFm3ca2F0prGjlc
 BKbR3rHqKMZlPIi3zoMff3QLLm2u/LbKq3lcv2QntTtzeSQZ5T0F8Vx39j0QXMXfyHOP59arzEk
 nBpVeRRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

The qcm2290 CAMSS node has been applied from the V4 series, but a later
version changed the order of the register property, fix it to prevent
dtb check error.

Fixes: 2b3aef30dd9d ("arm64: dts: qcom: qcm2290: Add CAMSS node")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 08141b41de24..3b0ba590ee82 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1685,25 +1685,25 @@ cci_i2c1: i2c-bus@1 {
 			};
 		};
 
-		camss: camss@5c6e000 {
+		camss: camss@5c11000 {
 			compatible = "qcom,qcm2290-camss";
 
-			reg = <0x0 0x5c6e000 0x0 0x1000>,
+			reg = <0x0 0x5c11000 0x0 0x1000>,
+			      <0x0 0x5c6e000 0x0 0x1000>,
 			      <0x0 0x5c75000 0x0 0x1000>,
 			      <0x0 0x5c52000 0x0 0x1000>,
 			      <0x0 0x5c53000 0x0 0x1000>,
 			      <0x0 0x5c66000 0x0 0x400>,
 			      <0x0 0x5c68000 0x0 0x400>,
-			      <0x0 0x5c11000 0x0 0x1000>,
 			      <0x0 0x5c6f000 0x0 0x4000>,
 			      <0x0 0x5c76000 0x0 0x4000>;
-			reg-names = "csid0",
+			reg-names = "top",
+				    "csid0",
 				    "csid1",
 				    "csiphy0",
 				    "csiphy1",
 				    "csitpg0",
 				    "csitpg1",
-				    "top",
 				    "vfe0",
 				    "vfe1";
 
-- 
2.34.1


