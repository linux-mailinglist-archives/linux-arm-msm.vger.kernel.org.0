Return-Path: <linux-arm-msm+bounces-73614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F9EB585AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 22:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEE803BF2A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 20:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934C115B0FE;
	Mon, 15 Sep 2025 20:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KuvG4uVU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04B62F2E;
	Mon, 15 Sep 2025 20:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757966503; cv=none; b=jjYnNENj/WMRw6V5neA2B7VS8I6o6LZs2lmFMv3AZ3V/AhNDktfY5NAce/YagUnK55Md8lTHPn7/9g0e4OUP1nMLK6izGjeR+BewvgAH8GP0wcWmzo/aOh4rHw2vxcNtr2J+XRMwiAJ6vmvTVuqOaVunSujT9pcJJw0tTb0kPdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757966503; c=relaxed/simple;
	bh=Z/rSIlwt03MqpM2HePi9v3L6cqhCSx4gNA1OuldO3fU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dRzfm5B3cS+VAvIbuaPn/6C5L8z1GdVfOED6KQjd0xNrN4rqfRai2A/a5kBtGLg9z3nIdOnAlpg7oBvI5jx7AicJKiEVhhjtQQvvFp5z6Nexn7jHOh5f40YaCrSwzOFFUV8T5aq2ckbKga9WzVkXvy6ncdNe5CUjHOhNehRzSUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KuvG4uVU; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FFSnxX010526;
	Mon, 15 Sep 2025 20:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=zt5R6u3J/J0sjOgpNUoyHVFiGzyUc
	L3NVtFMbUosQqQ=; b=KuvG4uVUuPiIgGlfrXzZhEgaj8MpFMt7HMYaMumXAqgCu
	UfTEW/dtNSpladA2cH+ejzCDeJRrMu5YSNECkMa8HmSQwgkTWfDXovglU+oB5QQG
	PIEknKG0oygFzqA2dw11F27a/BdgyYolu+AbpVd/b8onoT9oIbfgjywyuTpcxfH1
	TluPBR89b61pQor+edtWL46Wm/TjeZKm3cZ1x5pxB5GOOyVMLbYBP/Guy21GDgv3
	Z73phdexD61i+mW5wFwaGLbu7FZuHpjqJ31PBYvFjvUD/Bg+WaxkKoJA1TT19Brp
	9CGjZjDw9EZFdPxK84BnojqpoAu88iE9/SGLLWgNw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 494yd8k7rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 20:01:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58FJpGM4037323;
	Mon, 15 Sep 2025 20:01:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2hrmq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 20:01:36 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58FK1a9m008155;
	Mon, 15 Sep 2025 20:01:36 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 494y2hrmn1-1;
	Mon, 15 Sep 2025 20:01:35 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: sm8150: Fix reg base of frame@17c27000
Date: Mon, 15 Sep 2025 13:01:26 -0700
Message-ID: <20250915200132.774377-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_07,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=888 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509150188
X-Proofpoint-GUID: juADmj3c_Vdvibp9Unw2LvKM-ot_bfzm
X-Authority-Analysis: v=2.4 cv=M5RNKzws c=1 sm=1 tr=0 ts=68c870a1 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=rwT5y5aj_odyEoujqpkA:9
 cc=ntf awl=host:12083
X-Proofpoint-ORIG-GUID: juADmj3c_Vdvibp9Unw2LvKM-ot_bfzm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxNiBTYWx0ZWRfX/sp7tHww0Es3
 5Lm7DrDg1Y1TLFclBQTUVHtqdTYli0a64le5L/Mymda1a/0A81tOXKN/f3Blt+YK9akDkJJpwms
 1Rrsn32ogHvW6z0LaFLNlmn9zLKNXgJaLQ5tJGVIKVGEYWqRBvM85KlAlLEUuxxlf7I17YIonP5
 XvLlKZQttMk+OxxCnydLE2CJV127fEgQYe6hKZEFnQMN+SdoWdaNfuGZEnZXGHfv+f3vec/Zm+5
 4vdVUsIt9KvTSWa8fMqUtc5SAzjs1hGeAC4Wlwr2xFiudpFyEaY3p6+ltCk1DMeAVJrbuD7LGuL
 /zMlDkW/v3RMkrKgeFVFSCk4ai351NkFjjNNbcISv6JBX/BqWgo2xfiBTzrafS5RNgIEopESGic
 PRu3YizRStSA39lx+e3VstoyjaecNA==

The frame@17c27000 node uses the wrong base address 0x17c26000.
This does not match the node name.

Update the reg property to use the correct base address 0x17c27000,
which matches the node name and avoids the overlap.

Fixes: e13c6d144fa0 ("arm64: dts: qcom: sm8150: Add base dts file")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
Link: https://lore.kernel.org/all/20250913183018.4017208-1-alok.a.tiwari@oracle.com/
---
v1 -> v2
fixed reg property as frame@17c27000 is correct.
as suggested by Dmitry.
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index abf12e10d33f..6f55931f7805 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -4419,7 +4419,7 @@ frame@17c25000 {
 			frame@17c27000 {
 				frame-number = <3>;
 				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x17c26000 0x1000>;
+				reg = <0x17c27000 0x1000>;
 				status = "disabled";
 			};
 
-- 
2.50.1


