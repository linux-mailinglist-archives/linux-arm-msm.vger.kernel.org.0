Return-Path: <linux-arm-msm+bounces-79321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F1DC180F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 03:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51E1918931F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 02:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284351D2F42;
	Wed, 29 Oct 2025 02:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fn7SmH3V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DM64cO6y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19CE1411DE
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761705104; cv=none; b=AAwm+UMKMLMfegc++avYSOGZlLrFhiCHId81E1YoCFM7ocmFQA0DmQPXVzPU7J8pzgjcQOBfRvSqpnqn/sXaQjUyhJjofV9OF30rs/htyZYcr8D1MhryPiC+u6pcNe5HRMCzTc5+UixI4wb9o8jRhKYjqF0JHcxHvIqTgQ1Yb6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761705104; c=relaxed/simple;
	bh=g7N28kFHcXcwHBlOAWcJiAHR4xwx/pSur+aW4iGjL6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U+LxYjA4pIn2hnZrCK8Mr8/0zQGk8j4677i+T0SW7mh6f3+AVlseKQ7QV/rtxkI+2Hxo3WZaw4OUV78ebo12+u/i7oz5l5AhrzNzoBhjwKkO0aNRmVWLS34hsUJKGGt5Ym1HnhkwK42wSdmR/ODwr3WXGs7idBhctY4FZhhp4k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fn7SmH3V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DM64cO6y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlO9u2539329
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RCz1pudWlWhAvVjENZQZb1b5kECSVZ47OjN
	VesESA0Y=; b=Fn7SmH3V3ELDvJaSFgHFh91wRDp0bROyf2S5xfV5QUZUC18cR86
	UdyRR7W3uQBmd5agw1VoxjTuG8IOMsQkqDCobygkPyvSdDeV6hwV/hlNEElK7jAt
	bi1/rl+DwA+mSl7VITcvi414awyuxi4d2JMxGntZzyXNQnwM2kpM2jlFJZw38Hm9
	2VTLCh9Aknj+OK27fyw4947WxRu8sepJL5/4r3z4ob8RqBxKVwRaxTlsJ68e9510
	m9Kg7VgBJaVgYHj2Bp+Y4QDbBGGT88DWJ7w5HHE1/akVsqWla3hKCdlhYb90a8hq
	2UPqL9yFEPKV2C+9Fr1MMsZ6WlXZ0mwTUOQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1gv8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:31:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32ee62ed6beso10770787a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 19:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761705101; x=1762309901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RCz1pudWlWhAvVjENZQZb1b5kECSVZ47OjNVesESA0Y=;
        b=DM64cO6yDCThbRkEbirCf3lnhrnVcG86TF5IcdsLj4QiY5RAzTE+IRiB44Bj0C4/Ul
         pj9ei5ahmhJke2fbsfDAcvaTA+fbv8f5lPwElDDoLz/p4NkglQw7C5rWckteNlwQa3B2
         bWFR6bkbGmZ3YTaojq/H8QeyynX6GYWuSF4+pbbTWzbYuJxNJvsVbPDQiT8cOgN/gvru
         IYx/HIsjIsWfB1RVIbIPC3oYHoFB+eZbWXbUd1skLTM7GjNzRnG5/rI19gfS8IWpq7RG
         lEmIi+TP/TucaODKvCnePsLraCvqltn1WJIYiU8tUdAcQ6y+FrbkuzVtQFFr+Tc01l8l
         IEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761705101; x=1762309901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RCz1pudWlWhAvVjENZQZb1b5kECSVZ47OjNVesESA0Y=;
        b=up4aFhGvhLhDrVuOTOmKZIS8Pami4svetMZBU1N04oSjomcyUxUUz40/JJTDQVuJEp
         IjNtyBfiqKFuxv7RvaNA8ch2eLsVd3WRwQ6KTcp+vG6vsbmIk+9+WVM3EPCds6YZSwP0
         E+4FsqTIZkh6+ZcuT8Ra8buNfvj1uYijgBMCkVLR5Covap/YqzC2jeu2JhmLs7pDgYeI
         qBPSrX08Jvfxf2wSS6VEA6zBIjxxw32rWiANBFwIC15zS9cafZ7VmOIV9MlGiOnC+1Dj
         3SDFngLMo8v/nHBBKWmCRI+OXwzc9pI6przdDM55QPXyCmsXGYAFUF8Yk52aXAIwkPLl
         z3gg==
X-Gm-Message-State: AOJu0YwK7gShDieJQShyCTt8HX/MxoJaOfDJKH+3zizU0kfQb4jgtl9Q
	558AC+cAc6ZJpQgq+ptesedE9EmCnHHPU3sg9tUG6Lrp9xodxrAX6Efun+LEj5BOgVY4rsQl7cP
	XBXBXhpAMRyT/Kixr7PObBD1La2TJBruyn47dtdEzsqoUvXKHGKZSwgOcE2SbwAzfrol+
X-Gm-Gg: ASbGncvchNje3LZs70XGak6QGRSjRvXqQYkQgPNZUvid/bunlE9dQ8Zbd0KN3DVp7i0
	mfyKKXCl0N8mmTZ9VDm/LQU/R8LgbNTp21Ubt5DpcvMs3f90Vfg8Ex0pcovMWwTWHSj1zNQEEDG
	vLL4d4FhLmIvQ+jgVNlYxW6MRxUZd4b6oVXbS2umhaRwTWgnY3Qxd5QA4ZkfL8x8ii9piRYD5g+
	Rv7x8iEEN59gV2cEZza53iqdTdquqpQM6JvHnasdMyzirL6t2vxDnsgBARHEgp85T/ezcVAa8v7
	gqokK/JxpoG6DNP9eqWhKGpt48BSx7RLybXC9q+RSE9Xazlju07rHtgi+UdWQhz0CarcdmVa/Uq
	UzdY1bw1nyLg5od1iuu+AuEZS/NKW1dU4jUWfJDiQVlRx
X-Received: by 2002:a17:90b:384d:b0:339:d03e:2a11 with SMTP id 98e67ed59e1d1-3403a15844cmr1480544a91.14.1761705100411;
        Tue, 28 Oct 2025 19:31:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEd0VAQmf31SXQY4LxoHngpjy8YiK3tt2nlnsdCIY2Qe4hB//DaYRNWlZoiONNgbDcIgRqpTA==
X-Received: by 2002:a17:90b:384d:b0:339:d03e:2a11 with SMTP id 98e67ed59e1d1-3403a15844cmr1480521a91.14.1761705099904;
        Tue, 28 Oct 2025 19:31:39 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed70a83csm13488875a91.4.2025.10.28.19.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 19:31:39 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, xin.liu@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: qcs615: Update 'model' string for qcs615 ride
Date: Tue, 28 Oct 2025 19:31:35 -0700
Message-ID: <20251029023137.381386-1-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Nu/cssdJ c=1 sm=1 tr=0 ts=69017c8d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=a1m0clyzLRKmXXX_jUQA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: jt5Qeokqc1Xv8CwN3MUhPi6NCuDMr5gs
X-Proofpoint-ORIG-GUID: jt5Qeokqc1Xv8CwN3MUhPi6NCuDMr5gs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAxOCBTYWx0ZWRfX1X8KAfqyJZIA
 Y5CqFyXycYjOjdkqi4BVBPwnSKvZmRQwfWjm2TRtcligTbBoi0jcaQuUtOe4YEzooevmlUUvRL4
 l1K+zpF2jdGOvUg4ppTrl066jqmG3Kwdgz9PZhmJGC0magQeT/Oy89fxIC7ccNAoA5yNJS7dEG+
 gJ8iYIZ8Q8df+dj0hB2N1Tx1cRbojwsjaQAAeTgR2ntcvkRAp0r+YMpooXsYZrsDwB4ufomYMP6
 +lexcyzBzwp5Zyk4mBIR0/mBumyP7k24VOcdBllQhCaMDYYFHA3LmZK665YYvIuTFMu5scidmA2
 xqQ9G54IDsxWhMRTJk9aBq5ns0V5IsZKRcU3WgJ9LltEJnCotvFb6gTbdxbhYuRHpid+iSuAXOp
 8ycviglFNhIVwnzmfnabsBbZKtFx5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290018

Update the 'model' property in the QCS615-ride device tree to include
the public board name "IQ-615 Beta EVK". This ensures consistency with
official documentation and release notes.

Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index e8faa25da79f..047ba656f67d 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -10,7 +10,7 @@
 #include "talos.dtsi"
 #include "pm8150.dtsi"
 / {
-	model = "Qualcomm Technologies, Inc. QCS615 Ride";
+	model = "Qualcomm Technologies, Inc. QCS615 Ride (IQ-615 Beta EVK)";
 	compatible = "qcom,qcs615-ride", "qcom,qcs615", "qcom,sm6150";
 	chassis-type = "embedded";
 
-- 
2.34.1


