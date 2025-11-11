Return-Path: <linux-arm-msm+bounces-81236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FACFC4D91C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 13:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 69CC04E9C44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 11:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B15357A5E;
	Tue, 11 Nov 2025 11:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWvagOSG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VDLYhqg0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F276D357A31
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 11:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762862356; cv=none; b=UJk+v+ClSmjGCBSxlBkOP1xSjvOBQYia+k671Y2gVBgC/lwfL6NmX1ic10nApP3yCttJ10mLH3V0mayB9FFiyY/L4S7a2b0p+e9iyAURyKPc27SF0BBA8MgueR8TNOo2cbV0omNv7fkA0Q0weCtzatVcLTU/vHwGtlL17rlj/Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762862356; c=relaxed/simple;
	bh=umYRjS14VQvk3pNqjkqzwG2eubUYVYeF5yKU4mUAtdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZYuPYYgnQye6lhKniIX77A7slHDe2lyBfN4oYCn+LqeqadNxOpv6ZFI7sB3DGCKiHtym6GLPMazj+SstxqUEguyBD+RrEwqjNomHX3umidbVTvCnQ9iFytt6tHGcoZGH7gqoZ/EAz69BwBVuio59N94pxHUs20JmOF9ATQcs9t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SWvagOSG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VDLYhqg0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGYWv2130073
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 11:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Igj9Wy9J+oZcbew+QWuqZEjGT7xng6V/MPrvRFcOcn0=; b=SWvagOSG+F95pVqR
	hq95ktNrCJfL3CZpSpwX8NSKa4u3toG/cguT7mQ9M3GopTd0lp5Rio5Tm/fevFmy
	TeJ2DEhXyNboy7CWFRbAMXfYtZkxCbP7nqDSCn1XVF6wnEELZw+UzW6pshaGoBzO
	YUMFJlqlBmc4CD6s/xte8MZo+Afv90SIlovvRyVZKoyGj2LXwGHCvS+Qm5H8AjtQ
	V27yPkXiM6/DEbXKkAMxfwrmQxXbX/H7t9B3VbMhpWmGmSu+1ahLYklEarrc8SGG
	/WwFLoeLAT4yAs8ZXqpqiUL60uRKrS3mU6J4hmSGvazr4hnJU2Q0GmXLuzL/bC6X
	25YQqg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abvhthgwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 11:59:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7a26485fc5dso4612198b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 03:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762862353; x=1763467153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Igj9Wy9J+oZcbew+QWuqZEjGT7xng6V/MPrvRFcOcn0=;
        b=VDLYhqg0yJI+DDtLWLRVtWS4VpTDiylQ9x5txbIPe51ovGu+Qu8fdL8HvJy0gQWl+0
         y0ueR4K+ObvjIkP69XKqU9pfSgnlRStv8DqAL5mj9LFj/PYFP70guj7T1NBhvcXB+MZ1
         soMeIt3zLIVDTTOqnQWtn2Fe5EzTGkSAOnm4JdIp99aeX5d3Dj0u4zLmnQHI62tXiB4G
         zjOFZ6eZTq8XJ3Gernn0qmyZIGR7RGCxASJfOTTqWFG8q6PiS/57cPj2/hLu7pPvuZK9
         BiEmWZj1Z7i+sqoYcbZzA7N/dbp7o/1EV0Q3xmQG/QmFJyWEn3B6+yQUX3I1nZUj/xbX
         K2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762862353; x=1763467153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Igj9Wy9J+oZcbew+QWuqZEjGT7xng6V/MPrvRFcOcn0=;
        b=NHw9CN/iXyfmOLXlgZDepzhAgG5SgQYSJNAm1imtMdb4Za0gKFwryGFXS9l2ELtiBX
         VNPEmxAHuDZpwZSLcGK+R3UdTNYclD1qCXUv9+nkXm0+yk3i4xsKbjibfiOzRCCyyytt
         M2UpMK84lC6rbsQwcPKYBgoHb9IftmOrOAGS2lFd8zpZxuKz2+yGzM7nzm2YyCOfgcDY
         XnSw9KWYDrNGX2ZbHgnerp3XadbZ8eyO8GVjg/6EDiFUn3tREVqXUL53KNfnmgIYFLYQ
         ABE8ROWfwbHVeTWcv/hBP+7ZeJYdfodc01elIytATzXLPWiJ9fzW/tjbfyvCmWu5wnRa
         Obmg==
X-Gm-Message-State: AOJu0YxbZpeICm6sagfjr23LhF8dw3+TaCNuXfgCqYU5eSCcP3yB8RLs
	4ruxnmtXT4/ANQB9TeMq/ac4JfJV3izRQ3aCAukUN3LbNy0R970ZAwcSxgG8zpnCeQyhqjzCVw9
	EKbKV94vYrire+A3iy4JSrcnTgM8H/8xUVxJ4LPfO2fKed9vqldFCRphznt9/Z7kEv/oY
X-Gm-Gg: ASbGncvkS7Yfm3fjqeDR1g7i3uXkHRqt2nPF61WabpQmWHBqykX777x+Vu5F78UKLV3
	XilpYeTDb87OjDfU+allkb3Tsz9DBERcXd5yPy1/pkPTdnSh8nBhtHjgqtX1o3ubtJFvdDscLll
	HkcnlnIi/+4oLlDdWiNJTSr8HdcVbB8tpKr1i3etgsSzFkXQpw43EHjd3FFVi/IvjIDhj/8OzLY
	G4B6R6F+CGFr+tMV+Q8FcTJ6FC2D2mN/2olSde2hMQwzutAGB25PW8y0WNg0P8q9XZn2AnNWbzp
	dw3vvoKKaRR/VRMdfcTgtuO23JtVsYepI2hvLpjrFZNiQkb18waMWnU1pc7Asp9rkcjxX+su4iK
	XZUwYi08pQgsPjfxX/k1z2x+9g6fA3ug=
X-Received: by 2002:a05:6a21:7982:b0:354:ce3c:50bd with SMTP id adf61e73a8af0-354ce3c550emr10615729637.60.1762862353270;
        Tue, 11 Nov 2025 03:59:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbh73kg9FHM9k+viUhgefi/Z0wsiwaKFPYW5/80n+UP1ah3qNbGn8RBoac2xMpqqcyhkFU7A==
X-Received: by 2002:a05:6a21:7982:b0:354:ce3c:50bd with SMTP id adf61e73a8af0-354ce3c550emr10615706637.60.1762862352742;
        Tue, 11 Nov 2025 03:59:12 -0800 (PST)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba90307193fsm15420333a12.38.2025.11.11.03.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 03:59:12 -0800 (PST)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 17:28:55 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: hamoa-iot-evk: Enable TPM (ST33)
 on SPI11
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v2-1-101a801974b6@oss.qualcomm.com>
References: <20251111-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v2-0-101a801974b6@oss.qualcomm.com>
In-Reply-To: <20251111-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v2-0-101a801974b6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762862346; l=800;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=umYRjS14VQvk3pNqjkqzwG2eubUYVYeF5yKU4mUAtdM=;
 b=19hNlQ6yuFBlMvGpjl3p5vsj+s9c+vEYltfLSjjDPPyY0td5cpZOP2r2/dZ9EbWOM+ffyk3bv
 XgLA26kvfgiBWiKFiST1aLwR3L9nTR64S8ustdiExjVH6ATCuSV5eAi
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Proofpoint-GUID: c8mQ_f5V0fje157M69eJiZAVPPqmvpHC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA5NSBTYWx0ZWRfX/6xVYYlRqkUM
 rUt0yWWDwDwGbo97x30cFkV7SPooVLtWonXFlhmBd2/5ibdWUbSll4LpBE4j2H6FbKKE0vS3D0C
 apicJNTQpZldeHqUastW1TDgol2sMU//aIO28/ofIBAJna7ZwhHePy4sYt+JwnNCEQCQD98Dnuy
 H/m2DBvv2Y5eG1PFYBrG02Y+TFseZbGpdHp1T8FA6uw8OavR7i85Xowx5PMIv4dToUf7ajfypiz
 D8jnBD2w41MHtqu8o+k//v+AltyMYt5uyWieobHxsoZgZUZ9KG1+NScq8P4EUCmBpTAa/VHlVVl
 ARfUeGp608hZh4mHqvq+PEJrp2gfb/Ln5IWBGimOC3SAJGZvHUTv/84buDXsdmKe7tn3xv+WZxr
 +Sjh7GoGsvexiZvOLX+Lm1IFapJPOg==
X-Proofpoint-ORIG-GUID: c8mQ_f5V0fje157M69eJiZAVPPqmvpHC
X-Authority-Analysis: v=2.4 cv=d4b4CBjE c=1 sm=1 tr=0 ts=69132512 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PNAbdjlqmVCGte-Ijy4A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110095

Enable ST33HTPM TPM over SPI11 on the Hamoa IoT EVK by adding the
required SPI and TPM nodes.

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 36dd6599402b..08465f761e88 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -917,6 +917,16 @@ &smb2360_2_eusb2_repeater {
 	vdd3-supply = <&vreg_l8b_3p0>;
 };
 
+&spi11 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
 &swr0 {
 	status = "okay";
 

-- 
2.34.1


