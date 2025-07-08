Return-Path: <linux-arm-msm+bounces-64098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4810DAFD614
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 20:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB4051BC6F93
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 18:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06A32E9EB6;
	Tue,  8 Jul 2025 18:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nBSlKwxF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FBB2E972B
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 18:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751997951; cv=none; b=pwOSpmzqzJpCtV3V3+7DoXi6TBak/GzprzvbmrD735kvGzAWxav/3PHlAsI7fQWsumUwcPB2+WjtbvcMK86JvijcB9uvNG6bqBgOQX4Wj2gV07BOOj5tAPeQJeQTipNgBTdiucFQ7Ot24G0WzeA/iHh95NRBi4Zp6nvGw9ExMnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751997951; c=relaxed/simple;
	bh=3a0MWleIyO3gL2IRZDHzo83tNGJ9l+qQFqUNeP2HJrk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=klAxFubj4qQL9RWRSgFUyUpLniNTzmJG0tMLtuB5EO1W6aficqfyGOGVdWM0sssmwnSuNqDIU90aGdLRwJa/e/ePOo56skjkFThTRhN73+sVcEmp71nHPrQJWt2TCzmclybfQnEQ2E2vE6cjBcMkfnJzCorIdYPCoOOgwvlIVjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nBSlKwxF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568Ebk5E010416
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 18:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=v5EEqpTBsWK
	2r9AuHuvHgMamXxn21K03bgFNVlidZok=; b=nBSlKwxFq65reUnqR3XPaUODDaZ
	qkLr9zo66sQARJtTgLTARM37EQ84aGp3AaUq7ynXro+kdyERno2xffUVLfieVcwO
	H5aXwXy419XqvWmaFcPQYxAnfmg0GbQ+LOA+LCY/lQPy1AFwRQziFSj8CTzyQruj
	qFqGrabmJb5yeLQQqejREEsHkLu8ouvSxYiq+STCFD2aYUiHoVwAtjcrog9VKali
	/+EYoUjpMpCtcYDj119MQgXKcdjQdmnMUMHshlh4Gcva0gkWCnkwfWR6W32Jsoav
	k1KLSK851BBsqEnOIPgoC/u0ds/sKCdw2msK48sJ3caF0PurS/ksNBsvV3Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47rfq338ua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 18:05:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a43ae0dcf7so93637971cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 11:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751997947; x=1752602747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5EEqpTBsWK2r9AuHuvHgMamXxn21K03bgFNVlidZok=;
        b=juNrmrsDklNQsaPgpvC1Q86gQsIxzu3GqCc/6/8a97FtSGQ6IOiXpEnOHYcHk03Ikb
         6NTCGAr3GBDaNqSVyW+VBzRtVwjzRPltCZ0KHpuNzsu2DsrrBDPQZ9Efn5Xd06ttYJ6d
         V9rPz5Tj1suJ4hWOBJmtw4jgDAQNXZ0EDx8bQIlzyv262iiFPouzof8Hi1gQYqbkDPok
         0hNABvzrKdHAKcN0+XwRRF9puL0MlU3ay5rPNWHlW4NwG6ek0Ojas1P10H6LhWISEARa
         PG6ji8RnFPxHR4YRjG46kAErs+wq5pcfJBpHVrUclOtO3+HBtd5RhcTtX+rHidvb3lkT
         Mesw==
X-Forwarded-Encrypted: i=1; AJvYcCVzbNFcPv8Q/xaNEoBNaU9TCz4/H0O4YkZGe4VaxJdE1dqdnV3DLE23vJojVZ91hIbBnV0dKrO8zlMMng0y@vger.kernel.org
X-Gm-Message-State: AOJu0YyT0sFHUDb3Pbsv2zc9BNl05vebbRhwm5G9JRrhHA4lQj5/thff
	55tOge9aVOep/VyQksymi4hwudVlR7SdEG7RF9VZgwNRy9tL6MZBPUpzB3OA06t2nhefpPI2+qN
	9NeYFQBIRqQSsf/tGLilE9NBxBuycF2VDTOf6qS55cgu566jWt6anhkj4hvhHHRghhfA+
X-Gm-Gg: ASbGncvhkP72K94FFmb6cvFQtR1MmZK/t0YgtD3rqpEhxOgjs7dzB+2NTlOyx7NcJS1
	bEmTbnkD6AoL0luC/05X2Lwhy3nXmQ7DChP1ybFYfPpFpYkpbLug+sgTUsHsfg2YSS+NomXSzEe
	3+R6gGX9zNoKXvRIYtedRfv+dQ6vvK2V+Z+C1Qkl1cjZ1/GozduaxO+IYCxAi0P2PlpIzO3BGpy
	E2rD3TlLC/OyEnnHp4l7qxi4Jlb5h/SWuxtKSp+eNMU6nV0oXPf+xL2W496CqS2dRbfCVpt7CWs
	FoIi1BTCcuysvrORmTYjJfjCL13cS133lHk9TuhMtzPy2nhhXgUBmzBSdz60SlvtEIG4kKQRug=
	=
X-Received: by 2002:ac8:7f42:0:b0:4a6:f7a7:4d43 with SMTP id d75a77b69052e-4a9cd6c7133mr74848011cf.14.1751997947199;
        Tue, 08 Jul 2025 11:05:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhjWVmMm7n2+pNxplxU2Hy47+FGd6ZQWvQBUcOs7FaKkNrNRd0xCNwdMoqmPKRnemCM1vPcQ==
X-Received: by 2002:ac8:7f42:0:b0:4a6:f7a7:4d43 with SMTP id d75a77b69052e-4a9cd6c7133mr74847371cf.14.1751997946606;
        Tue, 08 Jul 2025 11:05:46 -0700 (PDT)
Received: from trex.. (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0a5csm13394906f8f.29.2025.07.08.11.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 11:05:46 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        robh@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 7/7] arm64: dts: qcom: qrb2210-rb1: Enable Venus
Date: Tue,  8 Jul 2025 20:05:30 +0200
Message-Id: <20250708180530.1384330-8-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com>
References: <20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE1MSBTYWx0ZWRfX2IugvIMvWQj5
 aMd68U5oW7qzXYOER2d9WMHJynFEZRjyi0Uu+33Us1PQfTmBx+zTaWXP814IyjAOUYYqZsluu+a
 Ev7BfwgeJRVXO6+QxEEqi6B0cGqtl4od9zvZuG+7xD1HHnNJFLG538grGr56ntT7c/9lhdevADa
 M2ySRqLjk3bEhKsXVfawdC0hfkIHORsFakM4knVG35OzfUEFQEtL7sYs0/cqNE3JA6zSN5PAszU
 WIZ/ep+2BJSIW4Kq9nyc9n75WlBveTIPX0EaolI4FCjzUc3piiQx+Il+O+Hgz7ZPiUpJWmho+0A
 juyJCeF71pdw4DjWcWVp/6iRaKt8Gyz06ToeKZT8mI7jCCY5NSHvjfW3REVh6nw1CoLOKQEAxou
 PRE+sQWbU68dJe1XALcJHL0nlgLhQFhFmUWvPOVkCFMP/JizdXoJovTCLCQldZztKgHlh4K0
X-Proofpoint-ORIG-GUID: rtSytjjVK7EVke40jMFDqdqMRO9pqyS2
X-Proofpoint-GUID: rtSytjjVK7EVke40jMFDqdqMRO9pqyS2
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686d5dfc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Qms5JgQ9tnEuTiNUcoUA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_05,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=730 spamscore=0 impostorscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080151

Enable Venus on the QRB2210 RB1 development board.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>

---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index b2e0fc5501c1..8ccc217d2a80 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -711,3 +711,7 @@ &wifi {
 &xo_board {
 	clock-frequency = <38400000>;
 };
+
+&venus {
+	status = "okay";
+};
-- 
2.34.1


