Return-Path: <linux-arm-msm+bounces-63963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D04CAFC21A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 07:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EB2D425F2F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 05:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6FB21767A;
	Tue,  8 Jul 2025 05:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aqrQKsyV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C4421771A
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 05:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751953162; cv=none; b=PRIY/2VPoPMEjS7QQSpqdk+Q5ruJgQ+5L+ej5iUPdjDcgEmsOxYod4zoZahrCpaAKckqvRTdfxrUr1f19FG75NLJq7sAFkXhgeWcI8qeAmEtIA5hsPdsjUraL63Unq0U3j8Eriw0Jb2HjZGhQ5/q6mEwnJ8QoPQoflUqoUr+qkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751953162; c=relaxed/simple;
	bh=1emyH+IK8BKjfdzbHRwt2Rbs/u4wKH+8vU1UpJL6fT0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N3O6HoBM2O+dAzyHDae0JMPkU4sJg+R1S+zTOVRzwo/RSxF1zxEosvAH1OWlX1Af8QyR7DF8SuKdbVtIoXbM/ZCkdfYC5vOTfz444OJAbNlulih20oy7/fo522WJLqAL/dbPwHMeoUHVOskxQqHMb4tvXsk4bQqqhJK6CgIN/nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aqrQKsyV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567JWFiA013480
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 05:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WURnYbPhR9z1CJv07aeJTV
	KiCsxXUrk4ZKzYBZvXSWA=; b=aqrQKsyVpoRM805ZPQrjeP9zYsCQ4qkCaV7eAx
	SSzaGgo830tE/1PRv9FmHLr2n2njFKj6ayWnkH9zycfw7qcnOIoPIdxmOCBrwOrq
	25p+CWqXoeQL3EesTAbescPxXpTAmy8FJdJwFctZ+R2dOfthpcApWVmmG1RuHoA8
	Ekfjyql1J5V0HTNHuFqBvJ9ZqaV1lh8u8JmbZc1qXi4IFr0Or16WoMg7QesffDbr
	kcamksNHcIN+2ldh0I3Nozy6YDHrm5XwT1aIQmJxIJjBHNt21XiNrKGyNpYB1IBH
	MU5XI3t6ZKDXLtYRAdqHrS8ciCGZwxQTo9sgv8HFw5i1erzA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucmu86b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 05:39:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74927be2ec0so5984076b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 22:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751953158; x=1752557958;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WURnYbPhR9z1CJv07aeJTVKiCsxXUrk4ZKzYBZvXSWA=;
        b=oQSFM3DA2s+DvBzcRbYxJ1t4ZzUdUTO9L1R2PUYQlzDt9aC1tExTtXS64irAZ1nvtS
         2kVJo0bnjNhl2959ESDjsdxG3JTHK2PnsrktEWuWn7HnLAgczh1IUa3ypTKiDC+jGT56
         k5FKQ5N3cN1agEmvHIZYRrFxTF7phwey48dXLzdnGm5lcCgMLR9Bf36WoaVcQ6/oSGUM
         3tD7CtBkwslpSgh8lGvG73HxMfkmW7HFV1rfSo/Hn1Z3M5aNw9DZvtwyW82/v/OuMCQG
         yZh/mBFiX0rf7ASBTY2NRIbjUSy7JYn8h2kfTW1zD7hrM2i/kdDmw5KCQw27BT9tCnBF
         0a5A==
X-Gm-Message-State: AOJu0Yz5vDNwOL+H4aC9fm8oK5S+/CALBoCbKv0Q7lCOC4NXdE/kJ9i0
	/u08LqD2tNP4pmT9AD4M3LTx8LswGnBuAJh0RK/kcSWt2sJpMQhzfOZvE2fHh62FDrLH/a9ESzs
	fAM7ijQd6oQLHSVpcqHX+l6fr6+E/xjWgrxd+jGPf0hsV+0bXIvnB8h7aCvDDdJrX1RDp
X-Gm-Gg: ASbGncu3IjZKzamxvoHgW36WVye9mVgx7aNTjJcy2KOHW33IY25E2s6SNEz0+EvPz4d
	Ml2dds9ltbsGCNwZeZEtxbhuw26oYVdLWQHaiAY+p/JEw63JC8ffd/znM+tY+C3A/S1vAHBRN4g
	YN5pYsrthx3X/fUjm9iSRo4JeG54E4IRNyQwaAUOm3rtuhUGdUKW5+8GU/B8OD2Ktzn6nT6+HhI
	nSpGbkxmxliKREESgFZRHntBi/ouZ5RhUcIr8Wl4fysPq/MPZKziol1nJJI5eigcfEQZ/bD4vpZ
	TwDotcUMFKCNKA5mNrJAQIj14sxR9z4rMkwzUJWUUexfbT4Gd4XARn4t+N+VkYfomuGqtjLdVJh
	lXbiZUnHx2vTHBLmPDOkc/f1E60HrlRYgf5RKatL4Stj0ZAur8SPkGiUA0A==
X-Received: by 2002:a05:6300:6d14:b0:226:2ccd:8347 with SMTP id adf61e73a8af0-2262ccd8372mr16302588637.41.1751953158135;
        Mon, 07 Jul 2025 22:39:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnNPubQYj/nAyHbIsYn0URAigpEmEJ7FaZowa4Rm2DPi/7AzgzsZ3rrTLLYy0UcOS/1ramMA==
X-Received: by 2002:a05:6300:6d14:b0:226:2ccd:8347 with SMTP id adf61e73a8af0-2262ccd8372mr16302558637.41.1751953157701;
        Mon, 07 Jul 2025 22:39:17 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee450db7sm10531829a12.4.2025.07.07.22.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 22:39:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/6] Describe the IMEM present in Qualcomm IPQ SoC's
Date: Tue, 08 Jul 2025 11:09:10 +0530
Message-Id: <20250708-imem-v2-0-692eb92b228e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP6ubGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMj3czc1FxdS3NLy8RUcwszQ3MDJaDSgqLUtMwKsDHRsbW1AHs6kBR
 WAAAA
X-Change-ID: 20250702-imem-9799ae786170
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751953154; l=1750;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=1emyH+IK8BKjfdzbHRwt2Rbs/u4wKH+8vU1UpJL6fT0=;
 b=MJHshVXWOcBQUM5ESCbYSGa2MFbwQ9PTZaXVvVgJyY1s8u8hxK0YFR+vEpLesArUieVv/BNoI
 zolF/M/qlPtD6+4mhfgjmyvbMUdpe0Sin/XxMkZMdW4uR+wqfzh14LX
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686caf07 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Yu0Y65rDbttY8LA09AQA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: RUklVkzjy45WCVYzLMiaxsKWVnKmAwfT
X-Proofpoint-ORIG-GUID: RUklVkzjy45WCVYzLMiaxsKWVnKmAwfT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA0MyBTYWx0ZWRfX4GL/U5f+umIc
 /puI2JpxorHme8l35oIrQL7UQUhZmiAv2npxEPFo3ryPOIz/H7vEY/xfOj9z/b88SKvWWV7vwX/
 JqEWpqKTSEi6gdX3Zy9plIYBRdW9sTQvNZ5nhQuOVSou+EUcM66d5KWOQVOtuympej7W5xm9oEW
 XlUYYACAOrvOy38ESOKOWiVZudJkHhxEE/Xg1ntP7HjghudjDPl3qFgZXIOEmbBwgfg6XIH3+Jv
 NEupmuFawer2Q4X8WD4+suKlwD1ahFB7k6bHs3TQQ3Cr61HUOukJ4ngT6n9NgGNd8N0uThyYV+7
 aWt79CfhP0W7yQEijU3FCEKjEVPWWVT0VfBkp/OxbWv379vXlPNmcCwH9d7pm3aqwue1hzgtdpC
 i9pPiAvEt4F9tyFCoa7N+w0P/cTiaTBR3lDbk35h3xDgS0weckVvj24MY/uNjckcsjnsTh+A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=541 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080043

Qualcomm IPQ SoCs also have the IMEM region and used for the various
debugging purposes like storing system restart reason and so on. As a
preparatory work, first describe the IMEM region and susbsequently add
the required features.

Across all SoCs, only initial 4KB can be accessed by all the masters in the
SoC, remaining regions are access protected.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Dropped the IPQ5424 support
- Sorted the compatibles list
- Rounded off the size for IPQ8074 and IPQ6018
- In IPQ6018, use 0x0 for reg instead of 0
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com/

---
Kathiravan Thirumoorthy (6):
      dt-bindings: sram: qcom,imem: Document Qualcomm IPQ SoC's IMEM compatibles
      arm64: dts: qcom: ipq8074: Add the IMEM node
      arm64: dts: qcom: ipq6018: Add the IMEM node
      arm64: dts: qcom: ipq5018: Add the IMEM node
      arm64: dts: qcom: ipq9574: Add the IMEM node
      arm64: dts: qcom: ipq5332: Add the IMEM node

 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 5 +++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi                 | 9 +++++++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi                 | 9 +++++++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi                 | 9 +++++++++
 arch/arm64/boot/dts/qcom/ipq8074.dtsi                 | 9 +++++++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi                 | 9 +++++++++
 6 files changed, 50 insertions(+)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250702-imem-9799ae786170

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


