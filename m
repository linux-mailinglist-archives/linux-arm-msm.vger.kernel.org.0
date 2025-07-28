Return-Path: <linux-arm-msm+bounces-66822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4824DB13793
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 11:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7146817651D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 09:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65C525228B;
	Mon, 28 Jul 2025 09:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ibiK2XYc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CCB231858
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695273; cv=none; b=OvaB9zzKJPzSxUmb3pmixyKmGXS6WEkxtl/xhVl8YY/7CTp5nsuyjeCjrbUgZ1zPudkP5iforN6KG60Pu/ccmRZKYr1cdTbtyFziBlwQVJERaLwQIyKJjdZjkVFh2OgXbsYU1JyNY95+9CkoSaftZlNaTUtbgfLT4mfbEoIiolI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695273; c=relaxed/simple;
	bh=zqnkNoyCUcMQhmxLHKY9Gi3VMuIrH4YTsW9s7c5Gj2o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=boDbr+guFMtjAbrNC6nvTiWa0tOc4NhUpUIDCXtfueBsHX0zw0kSeYlxgITNbwaVTNF9UFwpXgrI4xEG13VYKARRzUf2uw6bv69v61Ktta62Ceq2+7B5NppSzdRZMQTnNMqjybRFdOR5Tk1lR6JkKo+YUFwOwRQYP0lajCfJwpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ibiK2XYc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S4sWW7015427
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=b7Hl7crgNdmGx+VhQynrHEWFTnaZQ1iPpKR
	mc4C0Z10=; b=ibiK2XYckK01T3902IAhmNVVtCwFtNb76bf6IL8dS420tE/PiDG
	xc+x/DBVUWCgsyDujmJ45loUfwqUfTtM9Rlxo0BrfUGeUQS3hVj0lUnA0WVs0oIe
	KSTprp+q/2JoOS8e0Oc46CT2YlNfyaFjgEb7knqJEJfoLPrdhbwGHMWUCBrIhseR
	5DyNwOPVM0NIvVBsVC11v0a3MY9unR9jnbixw28is7rxTSOmmZL2B3TPerqwAQDY
	dv0UlhZ0rtyeKE6vaGObcoc5sg/6aYHV67Q2wfcqLweCaf4bWkcPhgPPBsIV1GG1
	L+JFa89T54JlxboUqlAQi3MiSpviiGDRd5Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xm0j8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:34:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7072ed70a37so42986906d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 02:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695270; x=1754300070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7Hl7crgNdmGx+VhQynrHEWFTnaZQ1iPpKRmc4C0Z10=;
        b=Bx5uBzPgPz4AsNWbXmWv2E/O27PYSrJ3DuxwkZOwgjB8sgfXWkwpGkPExNoJDQS/7O
         c5l/q57efwQi78EV2L16kd0SJbhDkptzozHUuzetIFP6Tgkxm2iiYnmGFB62WtE8yN04
         AbdxV18Wfz7pUc79HfNbho3j/SmYVfMcQNl3EsLVRBwHSix2M1qIYZ8UgvR+nAUYoY39
         MNNkxyBdH54WpM/y4+o4714bzhaQlYhsaPDuR2rsLANNybPcKeAK32/zVj2WjKqRa5wk
         s7TbNfvkkB882ntvYZuFimfvce9GGT+EaD9TacMJT3FhAQS2emBbKUtNB6Qql4w9eWo0
         FJ7A==
X-Forwarded-Encrypted: i=1; AJvYcCVHvy4NAaSfHpmTqhA2FLxFyq+SDJLdN3nVUwpkgrIy4OkQEts4h/epiRd9kfqTYA3YJPMpwC678SSQ1OkY@vger.kernel.org
X-Gm-Message-State: AOJu0YzaTNXLsyLkFXZn5m2687hejCvo034g8zsCfNgNxoHa+eIkE//J
	GW46GL6XUozYww/Sy/2Hx1+CY3XBj5XQ30oQH4meOOA79HSKddsgZTeCkKDlVb1+HqrrgNGBuZy
	Orn/RUPzal4tN7YQXxTiHtdP0XpHfXOodtXvbqVsB3VFuc6f48gPjaeXii+vQG9ecgbuS
X-Gm-Gg: ASbGnctXlM7xe94+fytsj+ls5h8WnNQcJ6LufIef8J5RPrWHSS+R6slfC/kfAQ6Vzh7
	IaRAw5j2rIYQ5cO7AxNY3kL7iYrls6f+qgzZpFvCC8wdA9qyH396/74O9P7HIS5VC3zCJlcS+YH
	TiT37vtZ+pBjHLZLFq5jW87PYLsNZx8CHAGXlN509v0led9raRcKVauhHDJKlIXBl1nfLdDDeey
	asyKHmpatKFKzj/ZvqnLExVOQ+uXfEocHgEq9f44pGRZuqglgEfRfwWbxslo2NUmYn2PQqGsdKs
	lPLDNgE7T2Jir2JoHgkMOFsNP70TT8Si5SN/5FRjtV9UdIsrMc9tz9OGOyPTSuVOcrtRRMJvrNI
	=
X-Received: by 2002:a05:6214:413:b0:6ed:19d1:212f with SMTP id 6a1803df08f44-707206b4726mr130255646d6.5.1753695270379;
        Mon, 28 Jul 2025 02:34:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmBuUjmN2qsrextYfwZktF/2jnsf2r1QdWDy++vciSj1T9R08MxWxRxnodqmEnXErIq7CAVA==
X-Received: by 2002:a05:6214:413:b0:6ed:19d1:212f with SMTP id 6a1803df08f44-707206b4726mr130255286d6.5.1753695269776;
        Mon, 28 Jul 2025 02:34:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:1c8d:97d3:bd02:4086])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778f237b4sm8320573f8f.76.2025.07.28.02.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:34:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: qcm2290: Enable HS eMMC timing modes
Date: Mon, 28 Jul 2025 11:34:26 +0200
Message-Id: <20250728093426.1413379-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=68874427 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=w5cLSrw8bnM9wMX07V0A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: bJ-F-Cw2C2arZWFzwNdAQ5BY7uoYeIOa
X-Proofpoint-GUID: bJ-F-Cw2C2arZWFzwNdAQ5BY7uoYeIOa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA2NyBTYWx0ZWRfX53Q4SWwVS9ZU
 uvN5TlOzeS2BOrJ5KecoWH7xXTE4pnFYj840TXmjrRMZrsKgtDQvvT7BTUFD9Qq/yIIHk4VkkSd
 DjVoL4OHEOMsTLpgfhfuaSbmcHDlo/Zw0rxAT9NTzuOFct5QLbcyp101owybrOaMRug2JOmQYU2
 1RUUwyPVgYWb5qlu0AhCJbR0zQ/chuwDSFQKBTh3GyAqGq7hvAnyJmKbLub03CTfJcgMnQ/clpd
 mLVNBbWsClhsce5W90DljqEntD7KbLYiece76WYAziu7j7W0WCXMY7LSrpiK6qLt2Ublww15GiF
 ZsuQVREjvurUHp5tnwAHCi2RDU7vUk/dh+t0gbCAee2xE3CoGqYPvuHv0gJmQ+fAAbLOmZ8fuuy
 lrVRpIUv83Mcy4osbBgv+pxiKo3MB1ARgLTyPUNJDw40EwigV1MNkf481lltrIjfXYsZw5rD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=821
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280067

The host controller supports HS200/HS400 and HS400 enhanced strobe mode.
On RB1, this improves Linux eMMC read speed, from ~170MB/s to 300MB/s.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f49ac1c1f8a3..72503c1d0532 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -953,6 +953,11 @@ &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
 			qcom,ddr-config = <0x80040868>;
 			bus-width = <8>;
 
+			mmc-ddr-1_8v;
+			mmc-hs200-1_8v;
+			mmc-hs400-1_8v;
+			mmc-hs400-enhanced-strobe;
+
 			status = "disabled";
 
 			sdhc1_opp_table: opp-table {
-- 
2.34.1


