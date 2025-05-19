Return-Path: <linux-arm-msm+bounces-58387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF7AABB79F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AE2A16D72D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 08:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017F72797A3;
	Mon, 19 May 2025 08:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPPwF1kx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E12027978F
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 08:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643684; cv=none; b=izclQqowVZo9AVzmopH+lZMKBb6TnoIQwSm/37AnQhWXZYJ9ZnxlT8Zq6EBp4mK4RjC4nvjTgKGFD5oP8g8JaWiHPmB4KlHk3xMBEg9y+Jsh3IP3XF9dvKxRFo7DxPV6UIM2KJwj17v1mlOqh83VENDUM7XSTi8A8ajjQcJj0WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643684; c=relaxed/simple;
	bh=fZC5iEDyN1WRoOmVWJh9DWv+C3+DDRc/1OmPFIpcscw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P2H8gFFgdaGZw6qoME+fTM9CNGslFZapHQrWUlRCWetAMlJ6oCEQ6JyGrqccfpmVSxhVkCsGhz5UyLvUyyvaq2KqmGqusW54+4shGznOQV1Od8p+cNlIv9XjsqQpUq0m9LYk+Fm27NJAPFLe+4EjTa8GoauZFPrtZkz7fsCjL+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPPwF1kx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J4Fd1Q014725
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 08:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/5b1D60mKVscDIbFquf4+neBMATt7Zc0JngQlFyNTPM=; b=PPPwF1kxcpXFaOyM
	bGk5xZqzz0LD6y1Yds15ogk5dQIPwXPh/M7Sf/Xp6/zGj5AxMdZbFQwwB8i/Ajxy
	GhQv6llV+ckJ9tFK5p50mrX3mPz1zmpSejKoiaoWUg2zhjr12wzZqOIjMf9J3/17
	Ngc2dZoglecWKEU9A8WSGJqBoyfFGgZnDE9DoGMUyw6tAKTstLAttrVOkkrw1H/d
	e+3J2TubvdxC5d4/1BT1D9kaTVgJyJlUK34zeJqWb/jLOke3kXt3pGNTIOrhtSx6
	AroQnHTYp3x6Oq9oPHoJhMSnDnBBw1yusv+iwhj4FRglsQKOnYjPkdAjcANBsawh
	ms3pUQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qwengqvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 08:34:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-742a091d290so2688297b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 01:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643681; x=1748248481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5b1D60mKVscDIbFquf4+neBMATt7Zc0JngQlFyNTPM=;
        b=d02TtldNgfjf9DIPSkLLk2FRPBLYfzkHZpdSBnB1TybG1SRWU1jGmid9QS5pbpSleN
         DGcqNxhvvJQERTi8cEG9Q1ltU/GyTu125abp22SjtKTWTktl3lJzL3hJ9Xj/A0bBieHk
         fFz0Xv/ZDHJuFYg63Y8xfED7bQCJKMSzsn/mpbUf4MF3cy79gDnZdp6SdOkct+Cai4Uu
         f7qFiKadavV8koYWyZqRqtbxBHx7moXTDoVzsb8Q7zXR2DNJzCGs8GUNccwW4NnmLEa0
         z35/0CXf0nIBeGtaKDaiuJlYJKUZ7BOgYmCNPCmdL3oryBDM+wmGcWZRUIRpJAmKqxqd
         jkgA==
X-Gm-Message-State: AOJu0YxIdCR01kd480mEQewcfSAQ9NqDRMncjLPYTVrBRngJ7KxmFD0U
	ewv7RhrYKVCtQ0yk3JGWElz9/H4Y2Pg3fJgjs9jZtLnvPQhIRPoCguFxSZifMbDxGu8Y6Cu2e7y
	u4DSGPrjrY6vhglyNeuQpXnU9tJ3vFsB5Og/wEaoBAzpmB6rRlPt5YJq3DD8wa3pO/79C
X-Gm-Gg: ASbGncvKe1r0xbmtSwFIMFZc0KA6gqnXbtQeGtJ8QcnkYHqmi0bK32yXN/i8B0cGqGB
	p8OKanuo5EQ4NOEwbE4qn6ZR/VVAAaS07WkftTxhTxqmgRvfPm9mgCSCaS/9uFuSh+qOlO6KfJw
	aDK0GQo+v+PkBMkf5sXz1LUnmtj+GoA6TN76hwZEBAbhNkXIFW2PSJ2jtSZKQcTiu+G/SbEzqRJ
	UmwhqlCuLkXrmEoVe9aSavjU8faZX5ASr65er/3jjfPWBtrLW6KKNynB0F1TUWLVAKL0RbLm4Jh
	1tsodtLpXSnapKo+sQp2vY8JOVEu6nplvJumZOm+yDaa/4k7drvZ5RGSs+eXCJpQkEznQxsgi1M
	AXH8jrrGVNcqBywMqMmsOLf6nU4+xALHf14/CPLs8LSGoa0A=
X-Received: by 2002:a05:6a20:6a2b:b0:215:d38f:11d1 with SMTP id adf61e73a8af0-216219bd5aemr15696596637.29.1747643681019;
        Mon, 19 May 2025 01:34:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1QQZg5f/JnejbZmIH8vrFWqCqoHDMyJqtadf6lkZXSiF2OLDv4iZwOSQm+b4Pz7CIeVQoLw==
X-Received: by 2002:a05:6a20:6a2b:b0:215:d38f:11d1 with SMTP id adf61e73a8af0-216219bd5aemr15696571637.29.1747643680645;
        Mon, 19 May 2025 01:34:40 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a2cesm5705475a12.9.2025.05.19.01.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:34:40 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 May 2025 14:04:05 +0530
Subject: [PATCH v4 5/5] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-wdt_reset_reason-v4-5-d59d21275c75@oss.qualcomm.com>
References: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
In-Reply-To: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747643657; l=1279;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=fZC5iEDyN1WRoOmVWJh9DWv+C3+DDRc/1OmPFIpcscw=;
 b=Bgjf2iHKk0lwDDhpu/9ynKhNsCD/0q5OQzljDVtG5yvVk6VDs60hLeVXDG/tF7epQZdd44u/i
 Wq+/YSHPFBdBu9zvRIhcplEw6J2GplK3Zb9uArZwi0gFTqLWXFjUixn
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: 5Rp-XZIzfiv04dpOQzfhPeJTBukoYpZw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4MSBTYWx0ZWRfX7Jtd80zXOloj
 JicR4QxkUHCEoYQ3ky4kZqRleQBu87V7FgInMOA0SdY+656dSQSlAX0rBc7NNnt1CAYU2w15vYC
 B7OIDLYA8TRAAKorNezt/gncunTfXDv+2NEG0JP8gEOvr02RndUWOz91WrrviRsPf7qESAxNYra
 0DzLUDTZft5W5bS/rMTIEmbZ7mSLJE28Iq7F/ncJ1WXJ1IqquNi5Dh0TkgcYZSNX6WSt4e1IF1r
 VmiVCkQCjdnKxSnIgodWsCyzdZ+EeYy1ySYX7cc9CCE0tSqx2dujHdkLDomDEOQH++bRG1rkbtP
 m8ucxOi65bNzc8MzxViSLcARiJUG+Xb+CBGJGJHciRt4BC6twyK34L5IRk6WncGPjpMqsPO426f
 Z5UovD46GadjDwvfPcimzyociegZoGrciYyhhXtS41hdnej3HfRNL+ayqnuH1OOYOq5848t0
X-Authority-Analysis: v=2.4 cv=Wd8Ma1hX c=1 sm=1 tr=0 ts=682aed22 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 5Rp-XZIzfiv04dpOQzfhPeJTBukoYpZw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=911 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190081

Add the "qcom,imem" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
	- New patch
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 4f18ea79502738c2b9cb4b13e8eb4ac4ddd89adf..8952d769dad4ec4635759d6eae8344aaf1d8a79e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -380,6 +380,7 @@ watchdog@f410000 {
 			reg = <0 0x0f410000 0 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
+			qcom,imem = <&imem 0x7b0 0x5>;
 		};
 
 		qusb_phy_1: phy@71000 {
@@ -486,7 +487,7 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
-		sram@8600000 {
+		imem: sram@8600000 {
 			compatible = "qcom,ipq5424-imem", "syscon", "simple-mfd";
 			reg = <0 0x08600000 0 0x1c000>;
 			ranges = <0 0 0x08600000 0x1c000>;

-- 
2.34.1


