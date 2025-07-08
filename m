Return-Path: <linux-arm-msm+bounces-63966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA59AFC223
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 07:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6769D426090
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 05:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4AAE21D3DC;
	Tue,  8 Jul 2025 05:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YoKI9n92"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2521F21CC4D
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 05:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751953171; cv=none; b=PwXVwDvEscdmcO0v7ymjAxqExSkuPQeQpwzA6L9EM0eAgn7G2T8NK5dBTb3mxvqSqHbqANqDwhtK2RJ/tZfvxFy6Y6Q8N8wiXIV5PqR2J/aI7J6r9s/6SLyy3BxhwNcCCC6zn70INWNiYePv+SwSepecGhSzoPkY5cIm7MS+1i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751953171; c=relaxed/simple;
	bh=ZbRPNTvMEhgKckZRC/YaxL1ERA5o41riyFHmHimT7S4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RD4SbvyMyyoTJroPpk8xlHjJj8ZT8uf/gy4j7D3YqiSkss21QPnssjXf6liOzfMMUYDeDICnoP8UMFLz7s+QysFmM9MtzcEHzUDatQtReelW79NhsP9OQCYV91cUgnpV5MssVYo2dhp5KlVfRhgFJRmDBXKQRnYAPe9eXJ2gEzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YoKI9n92; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567KAlWf032268
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 05:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B875Ut1LxkQH0pfjyUMhkUj/begigCh6lFm1ieI8OF4=; b=YoKI9n9246O4Jz6Z
	rN6uIHwtxzBCippSXinJw7ix3qFjlc+O3+9JA8QasjTE5zQOl4Pj3zs4YuVJmGrO
	puEUK6I2wb137SqToybekqeKmD4NLfcrD5ha8pQ9jN0PEvmlrWNUB9SGi3DHn1jQ
	Tu0t1GZu3yEMaJrzvcNS5FIONQ6xq9uVMBZFWYmGNoRDLQw0xIkWX4FazXV9cLXV
	2knNlNlVC958iErTF+cuMvkDlPpj3WLn0ry1bH08+iUH/UtH3RD5kPxiqpozquIn
	OfBNxPG7ZXTDCEAA261/JHdo16Ar60p2PAYKbfSfFhx+TrY9GmZx2qdKVMx6NDjp
	zLMX3w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvefb6cp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 05:39:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748fd21468cso3197592b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 22:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751953168; x=1752557968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B875Ut1LxkQH0pfjyUMhkUj/begigCh6lFm1ieI8OF4=;
        b=LGh72n+EUh3/mgwfyWVdgFcsDIfMWkascxFZTR4I9B2YL1CEzkcWXl3pcnp5XWLsUC
         +i59w7CA25qKlDS8+35B+URBJVuYf4G/+cRQ/LADW0uaumQoNlWNs2AJH1W06M5iK2Og
         EBWlGidjjBAFnlvetjlwHm6xjwQEkFUvNsAD5xDAwQJKdJ1IolcSAwDGQ54WrZRLx5r+
         JUdee/rc4gCx+BCoENlAsOs9MaLAR+nmrfLj+xtGHONHV1e7mJj4esmGpcOnGwxBUrfB
         URCRc8O1Cc3OE+latVIGFhJ241iNj93XrLbzzTIZ4XUrmbDqmKHpmpxOzHxCJE9YLMQR
         h8NA==
X-Gm-Message-State: AOJu0YzSUG8iTywR9SkIZGrkimQFv0lJ6Wi60hEvuDUkrcjMENEfMv1b
	NIpMmAyhn3wcs70Cum2O4l3qHsBXlXKzCOCp11FjszhDWdYCCHdVOyEgbZ0J0iXRAWTdGiFZxUJ
	fOJhenOVZdI2TuFtbJ/pPRjD69/gZBWTCQ3Dc81mHQX//yGT4jWdQXYwFZVRrcYLJaa03
X-Gm-Gg: ASbGnctCccqHDqWh1NFUsXIPeVvECpIrq6XlwzNOcm8VV0YjRawi1VXA+CrsmUtsVIp
	8hVobz3sgM76/FHl6U3TTVKLKFkhR11c2xfq9WEBO6ebXD+7b4KGKzfQXf0cpzF0SoD0/n0rNsD
	bfafGJobP4xoJ7fQ6wHHNNUMj6Xhqn9Z2Wac/D8ZriHRByB+Lab4S5/mYqN2H3rQip3Vd3LrhPa
	XoEXh0ezDKTcezwTIDgs8Sh9SbnteRIeLP/q98gzUcuKHpqSq2FbF9OxFrHtcVEJNbj/SlT406C
	XOk+MMKx37bwLTXrgoGfP1i4vg14SUpdzXu6DxbvAltUDTt1huBX98ixX7xA8ewjH0eFgmTFGyB
	QPkxXZnBD6vwIRE09w7lego18IGgnPlv/DfBEZXUR2pAYxS5fBprCKL5HvA==
X-Received: by 2002:a05:6a21:33a8:b0:222:d6a8:d21c with SMTP id adf61e73a8af0-22b45d24086mr3346634637.40.1751953167785;
        Mon, 07 Jul 2025 22:39:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqsTa8K45ENWVrx3fQaH3DIeugYzrPRudnvz0w9HIKrQLNQ/4aBFLuC8ysM0OhpDRI7LsgCQ==
X-Received: by 2002:a05:6a21:33a8:b0:222:d6a8:d21c with SMTP id adf61e73a8af0-22b45d24086mr3346594637.40.1751953167375;
        Mon, 07 Jul 2025 22:39:27 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee450db7sm10531829a12.4.2025.07.07.22.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 22:39:26 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 08 Jul 2025 11:09:13 +0530
Subject: [PATCH v2 3/6] arm64: dts: qcom: ipq6018: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-imem-v2-3-692eb92b228e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751953154; l=1423;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=ZbRPNTvMEhgKckZRC/YaxL1ERA5o41riyFHmHimT7S4=;
 b=BBhmcc275p3+rE4vL/bDxKij+4EN24vjolAUuuq//1QJhjXUY+kCpf/88a8vO67gKC2Hk7vD8
 g8vedYUDTphDA8bketJLnmZmdGIjnwFQ3P6OSwX5U7F4LqkqW557Ard
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA0MyBTYWx0ZWRfXwG0f7XmdBCB9
 90W/OsZ5ilTKmKpLnXPbTUnSzmJrKVVZj41w4rdWu6bDanA5/DsinkxexWaBHmYbwYJbXSCOe/S
 xTrwgVGGQB1aZ4q6PKKbDAkXaYLA05dmEyckDPopEGgn0nxc1eFL9tgVI/+Bzl4sMZipa8qf8T+
 cFR5xe+8ajBPBmvEzLMN8iRTvltrqWJVAOtKMJu1NshwvrFQXVCqlPsnmUyFU1YRrkZ6JLbDENW
 7HII3JnPqXBW7PKCaT9Q0fvsNmT+Cwa+UyGcePGbjjUEXwHrNXCIgr+QZy8iGIdrRiAxAW6vvUe
 F1cDSuMAHgPuSc8TVLomYNj+5aWJlXlBIAL8mUA1vnpdDIoeLcpd5p20Qjytqn8pesooo0gCTlr
 7qEekxZx0cVXmjJ2lkgzVbm9ZEwLwEzcp/FiIz4ZJbk0bstLlZPeEhK4O4cLljZAiCGcpOjp
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686caf11 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=kuyrhOGAXNEpbtS0LE4A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: U5j-lFfMiwtcPMEbXbnFjXlthsupXN4A
X-Proofpoint-ORIG-GUID: U5j-lFfMiwtcPMEbXbnFjXlthsupXN4A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=704 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080043

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 32KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Rounded off the size to 0x8000 (Konrad)
- Represent the reg's address space in hexadecimal format (Krzysztof)
---
In 'ranges' property 0 is used instead of 0x0 to align with the existing
format.
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index bfe59b0208415902c69fd0c0c7565d97997d4207..3b9e40045906b26b94e2d2510b0570d3eaf084ce 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -659,6 +659,15 @@ qpic_nand: nand-controller@79b0000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq6018-imem", "syscon", "simple-mfd";
+			reg = <0x0 0x08600000 0x0 0x8000>;
+			ranges = <0 0 0x08600000 0x8000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb@8af8800 {
 			compatible = "qcom,ipq6018-dwc3", "qcom,dwc3";
 			reg = <0x0 0x08af8800 0x0 0x400>;

-- 
2.34.1


