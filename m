Return-Path: <linux-arm-msm+bounces-63362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FE4AF118B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 12:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A935F172B7A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 10:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B86B260578;
	Wed,  2 Jul 2025 10:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyXLeDqb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DC825487B
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 10:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451486; cv=none; b=HeLpErlPuVG7o+ZKnesFDeO3Tfc877UNIHNwCP3hUwVsrMktZPebuyb5LlYNV3rCQruBTM420PfNiXy8DLFnAHeLyaqFBZwMdtB09D/hXnnY6Nzez2Cnh/HO7nS7tULO4hSTbjPT8GdIVhI4C07SZCQ9zBOkh3pTw31ijNodke4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451486; c=relaxed/simple;
	bh=FTU0yQHbOLuAOsUybPfK1jxnzYQyX0J9vLxVroO1rKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LQ0C5wz9W7mPbFb/o0kWl0yffTP7kyiO0SPtPGOTZCBOZRjd7BD57xL/tVHsmafhdsL4fvk+rPs0ht+AWZ38Fp2QplOoFJDi36zYbmd8hHL2V9HvkAJiARQbWVxaJjC4wFjYiPdhdK/eyTfDpKPIztd/kSuZLZQLhdv78MtDBBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyXLeDqb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5625dkFV018581
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 10:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBX4mfIGHvj28TXKQttLCh8fGJ1egnOpU5n32v/oz6E=; b=WyXLeDqbVRsW5ie1
	EKS9+x4hgswz/noDVSiyINsC2/xJQczWtN6JVeQVJ938YXf/6jZWpM634ZlaJg7c
	JidpicbQdm11eWrJNqEgCozBxd7/iDybjjNS2dkpnKBYqGlMcpNmq3xlpX6flgg4
	WSxIssFEQeBGjLXquUO7hDxOJGCzp7xITJui/AcdgtKE/eTQJ+wOYd0ITHSN7qFw
	q6OF4EYoSiqO0nu6hqE9VPmTIL8+brU3fWW9gwVDtLoXpznWvGd5eGa82eELwWN2
	UzKOJ4VOZmlGC4Pehr/vVZHttZkSVzcNpgc8OAYdVshXLy2jX63gC4ezDaoTtu7n
	ZIHmXA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxm9qj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 10:18:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748a4f5e735so4430961b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 03:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451483; x=1752056283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBX4mfIGHvj28TXKQttLCh8fGJ1egnOpU5n32v/oz6E=;
        b=MxTXu/yKHrc7Y15iA7RyKI9uaVle73grdA+SHDZiY7ZV1suy7lVMm8gJy0I2ryAAwA
         HBgDE3Dd8wmwm6jgoQfqOPQauIs7egpFA5jTp5BzLI9DiXPuisGNhAGP/eIKVcKX4fFP
         6qPXRG3tlC58Q2QHR0QpsUYEobIRorIRyrDkm3fkO3RLo+6Z0cXFo2NatMkfqWDPpKB3
         CcOfsGCCiQYUrMs30fIWa2E03D7BEPkndUzN6ZuNM1jtqbzZ7Ud4vSeiaUZlk1AzOGGP
         CNodVb8HJr2vY1Le0FyvW4KQMWkme6nHdNQXofwsoIl/7wC5pNzREw+YxO6wc+9N8nTX
         4TqA==
X-Gm-Message-State: AOJu0YymVNZBBTfSr3KSM2YoFUHZEa7Juf1r7UojSgrh/TM06jJLZp+7
	NyZclniDML/pLVy9kqADE+xfJ1nGp3o0en7KQVDUy8GYyG63cxqywb0U7Iu9tEKz2bgE8uwAXh4
	249TUb7mtpyBL6rnyhNdfI9rOJAsIaUvo4H7J4YipvfTONG11RIexrP4SChCC7hkuOxoY
X-Gm-Gg: ASbGncvbKY5rcSjDx1+1bgVG74EMKubm5MD7JRh61YBWfhYOWas4BRUIK6V+Usqkpk1
	H/ccrI7thVErhBdkhSxLDaph4SjYdetwRz3k0lGt/M6QBBKE4mmxwZ2AVpdbaMJHTmJCauTpgnM
	haZBGgeAtk4JuaEuo4SZmlYkYl0KRCWSuIXZXVlxudgRZXisRz4LZrGluV/+NURUgPP8vqISE7K
	OcWVM441E1Gi5fs+Vw+6S+F3mJcaReMhIqbUToadnq2/Z2flRhxywlmXBvxeUEmmusC2Slpt0rS
	1n0Q8/LFX+n4NKNDpFr65Vb2O7zYNzvIFIPI6QXQf4IvWHqxkjAXTj9PuKbFxka5JgfGoI4Giyd
	5rU+YmFuKZGB1dsNVvy9s+C7JNqcj5EOlaWTbeUqa/aLYvweUWHqkrDgs4w==
X-Received: by 2002:a05:6a00:848:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-74b50df8be3mr3504764b3a.8.1751451482995;
        Wed, 02 Jul 2025 03:18:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgRvV9sdTWMDvkgooI5Qo4vx1nVTA+9j+sC7mo45Nm7Wu2hM8dJNKd9XnCJHchrKqcKHSwlw==
X-Received: by 2002:a05:6a00:848:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-74b50df8be3mr3504729b3a.8.1751451482531;
        Wed, 02 Jul 2025 03:18:02 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55749b9sm14486315b3a.73.2025.07.02.03.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:18:02 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 02 Jul 2025 15:47:38 +0530
Subject: [PATCH 6/7] arm64: dts: qcom: ipq5332: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-imem-v1-6-12d49b1ceff0@oss.qualcomm.com>
References: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
In-Reply-To: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751451460; l=1172;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=FTU0yQHbOLuAOsUybPfK1jxnzYQyX0J9vLxVroO1rKY=;
 b=oiktSHHzoBU9Jz+DIjgHNaoFblRRZCIxVOBJapx3t+n6re0F1Sw+qnR6aGkjYg3VRrqblJnSV
 j7AuECJ97CIAPF+ZLOzIe8GEJRl1k7W3E4vsefDQkURRFU4vTR73j+W
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4MyBTYWx0ZWRfX8RWRXoFqAy7T
 ryphB3w1r0en/besaZFVF2ALqmcCfqViiKzErk28njBP9X9NNAfZ21VZQW1o5G8e/wpzwVJNe3Z
 hvkByR9IKBDynNMctPGAXFjdPN8vuGGykXk6tyz1HuYuvc17kH9LesHYF09bqwXTxeFXHeP6JSL
 KbOUmGK/Y34mjPKmqI41Ij+MI+2iRtXkY//bY0Uy+YK20pnhrOmk1+zP4zpL5qHZHsgrS6YZZ86
 6hUs9+SwNNp/WZcTi1Mj8JabyovxOXR3JYyJCm4pGivn8m21CtXrzvR97VtukCuUlHdA0RknD68
 Qg1vTV8KoQjP0uWXrEFVsE5HFEBAGJEI3otiYyQVwj0oiQn35ixOJ2FQ3/HvSFzVYT/EhlfWY5y
 O4acLKVlwBQDCMCEuNOAfDRnVVKb9nRYNU3pHaKbIloUCEBfCFzyFlZDpTrXUs8snmf7YZxy
X-Proofpoint-GUID: TvsqAK1AD0NSFablpGU9jCB9vnWqipIK
X-Proofpoint-ORIG-GUID: TvsqAK1AD0NSFablpGU9jCB9vnWqipIK
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6865075c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=g_gtcTFTaut2jdyMrvoA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=765 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020083

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 80KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index bd28c490415ff61624f6ff0461d79e975f2c397f..6f54f6e758309932a35d7156f32ccdf09dd36ee0 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -423,6 +423,15 @@ blsp1_spi2: spi@78b7000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5332-imem", "syscon", "simple-mfd";
+			reg = <0x08600000 0x14000>;
+			ranges = <0 0x08600000 0x14000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb: usb@8af8800 {
 			compatible = "qcom,ipq5332-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1


