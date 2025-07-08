Return-Path: <linux-arm-msm+bounces-63967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4BDAFC228
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 07:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 925C61AA6A10
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 05:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5F92206A9;
	Tue,  8 Jul 2025 05:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EpiYJ+uq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6614321FF3E
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 05:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751953175; cv=none; b=u6v/EymsHIwlvpR3Z58+zKEY6i08UdkQ5kaicCrBrrwVefdOPw3IxgaPX6Gj6NYI3E6dWZayL6IOV0jdSQ4T0BtA5ORq+NOwrPZrhq+1vG3+M9eNSJBQwzqlF1/BbspOfLtNkyOa6zjXnA9pShjwV8fNe0GLCg5PDlRWFFmRoV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751953175; c=relaxed/simple;
	bh=vExvAJ3fzG/Fausbkf5FQmv3KT3IEQ63ck/Zdzvjh0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RxYU4l6T0ptwVO4miu7IW76at3fTC/y8lJvSO/HWx8vMtdb8AXHNOaG1XkJsbGdNV1vyHQavAWzdtPMrpCJgFv0pQ/e6t/BoDs4xxUXIBwYdTnqvLNVzzRCaXJXg4MzcxbWvRhkUfrbN+ut2OhpigY+pm4oYcqgG6Lre4YQo0V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EpiYJ+uq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567IM6rr028691
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 05:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d+ZZAEh66WZVpAW83aZKqsIX/NRJBq6LQmw2kBjpVis=; b=EpiYJ+uqxXRyyUGG
	toCjtQz9TD7j4avKK/dz8TQ5LhlF/iq0b3Le2iK//Q1SlOFbB2vjf/YJMbmP0ybq
	1/wcL0cZKGTCyGzUVSnqI3R/6GbY/thOMqY+DooDkxRmqHGDUHiLOQHVGDxjCkaX
	b7Fs8boZ2ZhcZhFJrgRmsgR4bPRlRc/4ttZ6GH8jpUk1FnY+ygVdhI+SOEuJ5yH4
	AswcXO2UrX0+uLSngotNtGVHwttapmft5gOECWw25fe9Y6AfBOCiQnlmo4ytgTRm
	Gb9/Jt9FnamKvV+6KkWuk5NJlxLw1sSv74oJJO7wQkVt1TCo6ifet6RAaWes9IA7
	LzmNdA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvefb6d4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 05:39:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748f3d4c7e7so2906950b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 22:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751953171; x=1752557971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+ZZAEh66WZVpAW83aZKqsIX/NRJBq6LQmw2kBjpVis=;
        b=Rity3AgjSvUWooIDGj3LUKHmnONWaJy+6Blyt5En37GnOST58NGfmd7Ynr7odkZ/Kx
         SU58+F0NKwxlZltzfZsnN2DbT0IQ4JXXXSdye+DtGOdANBXlEMgFXv+F7b69sgvGfn03
         gPRSqMC/W9OA0Mb14VZbvwY1dyxzEBw5u2xYJkyQvxgZz+bDMQSVfqTCzkbGc2xb8rMv
         B2TuZVpoAZvcziy4h/7+eEDwL1MjuaZ1oV5JpvHAudgp9g8fFqDJWaJQ4rNc9Wb+llyq
         bIleQjZ01zi3F6fTHQhbi0d0dAKdlw0JUY5DTeUFjga8Clw2uDZo5aehUacDaao197fH
         BGyg==
X-Gm-Message-State: AOJu0YzE+m3jKhXR0hm3OGVnuL/WxzysiTpNHh5vqNBbdWmEHFRq32GI
	utr1Qv/YjY49WNBZCV9aSkgAfpR0Bd9maADmNboTt+zaPSoViL3yGDr7SOHCH3ZkSOtM9O6NeIU
	y4+Be4F9C/uF52mmbmE2GBAoM1FPfY6jhfe2wgsrCbcRAmUzDfu6PO022p724pL2N6bMm
X-Gm-Gg: ASbGncsmy9tlauMjJuLkHxt9kY077qLue3y3RDTdrZSfNRn/77S86VHpmlDkbLKfirz
	/YjM4RsMm6rdTnRlfU5ttzZPpJZj9kCs8S+z9tZDyAp6RgZnT03p5GEFZbdbNilL1doljI/MEdX
	CQD3Z6Y7FC87wRM9n1jW3UiJdYUqJdS0kqHKC06LLUd2Q6huclqlGgtop2T+SHhTvRq7eXtYfrc
	07RnhfQNMApO1WGHV2zq85Dix1tv21R36YrVJgGvLutPZiYxlLyybB9cp6td1sckmD/lIOvTwub
	bq2v9/szCcPUA3FOmzXE+zqVrF3Vlshv1cZCePC4caS0cBfwTLBlOxxQZIAGxKY7hCcwPti4XM+
	ajlXxthra71+sni1M4h9sHluHkuy9/SYgdwA3r+UX7k27iObkVYA/s11oCg==
X-Received: by 2002:a05:6a00:99a:b0:730:9946:5973 with SMTP id d2e1a72fcca58-74ce6306594mr18295011b3a.5.1751953171057;
        Mon, 07 Jul 2025 22:39:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUmTvycbT1dMK2wfBPeep8DQqrSwRAvR5iGq9rzdl7pj0gdnY2VdZoY4Jd+Nt2uHK/ss8u6Q==
X-Received: by 2002:a05:6a00:99a:b0:730:9946:5973 with SMTP id d2e1a72fcca58-74ce6306594mr18294981b3a.5.1751953170615;
        Mon, 07 Jul 2025 22:39:30 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee450db7sm10531829a12.4.2025.07.07.22.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 22:39:29 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 08 Jul 2025 11:09:14 +0530
Subject: [PATCH v2 4/6] arm64: dts: qcom: ipq5018: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-imem-v2-4-692eb92b228e@oss.qualcomm.com>
References: <20250708-imem-v2-0-692eb92b228e@oss.qualcomm.com>
In-Reply-To: <20250708-imem-v2-0-692eb92b228e@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751953154; l=1207;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=vExvAJ3fzG/Fausbkf5FQmv3KT3IEQ63ck/Zdzvjh0U=;
 b=UmFCaM5iL2gNZNRx5sdIblNCa2cXd5HZso1dr08DbRwuQXB59xOR1LA84ce2PzcUcNnuDQ+RD
 D+Y2MkKfQaXDe+Sz1uUs4cAZ9OPxZdF8fsYeHlwc6+ZXyccvMwPyvh3
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA0MyBTYWx0ZWRfX/h61t5kCnyP1
 EWwd+trqgnVdFXc6aSUUsCFo6AFqoimvMSjBWwcTBqzeO3pmuVwuPRdB8l3umIA4VBgoEt04q1b
 mD2UAik/s0ea5UKih9AIgBz81WhI/jWQl0xYI0eTZk8ln2Tce9/YXLfxDb6WKo07JyqMtvkNnUV
 MwQXhS+Fu1rv8TVbxfEBRYtMXTw0E8jd7RVRULGMgHDlqQad2QMZOrEAwjeMsnWYXqFE80d27ZR
 Pq4kTkZJrKFkNbSCOBU6OQxkWnbesHlcNwkT2NKwWf9XopS+o/nDpUDVhHDc8sHrpFpRq8+vQpZ
 KeDQeMzN08SXZLn84fMlhBBSm1iqfSeiVoe3GOKIyxD0IGqPz1mz1kpXRxgFLrZI2XbLF8GxqRm
 df5zKMgjpNn80b4+J3lyVB5rEI5M5J5VmMV+N+xoxUwFfcvFaPfq2XBHoF1It96NrpnzlTZD
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686caf14 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=LzuAw_qlYXXAwiqMVrUA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: MREzkxNopB4ZzIDYZp3xt2erQ23HAc0x
X-Proofpoint-ORIG-GUID: MREzkxNopB4ZzIDYZp3xt2erQ23HAc0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=806 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080043

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 80KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- No changes
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 130360014c5e14c778e348d37e601f60325b0b14..c57d855e373b7cb26a3533f4651df078c1188fd0 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -278,6 +278,15 @@ blsp1_spi1: spi@78b5000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5018-imem", "syscon", "simple-mfd";
+			reg = <0x08600000 0x14000>;
+			ranges = <0 0x08600000 0x14000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb: usb@8af8800 {
 			compatible = "qcom,ipq5018-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1


