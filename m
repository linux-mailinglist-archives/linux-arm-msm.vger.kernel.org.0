Return-Path: <linux-arm-msm+bounces-81828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE4BC5C888
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 11:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99C4B423C22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 10:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F076430F7ED;
	Fri, 14 Nov 2025 10:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Moitz2qe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sw/1YeCv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ECE30F817
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 10:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763115354; cv=none; b=eYUXLXgz7wDyxUsilaX8qnW+vReNgYOVUzy0xeZTuU59GZhyqzh8kBQSnd3US1CmBfzUqYx/ctEXfztLM7pa0Iq0/9+LH6t/EN0g24T8Cowg0G7TlqITQvrT73RKCJBxtAmUoK303W7Y1rNaBsRVY+16Jb6TFr6VqmQHPtAZoVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763115354; c=relaxed/simple;
	bh=P0Nz1N7c8zn+yPqau8Gr6He8EgSneu/IvWtZilEuYtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=E/Hi0QqlDnaNyf6LhVVFQnd27U3qobtbaJmpZAghiOsM3vETzLjl6uuOQ4KhB6XSKZC7fJ4X6B/vTJd8UKtZbexpTWrQ2T74jYJZ6L8+T75ZczrnzFv6J4rB+SFMRXSsPM48BO2ahASuXP26r0RnYZC2wnPfyv+Z2M3/yOX8DUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Moitz2qe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sw/1YeCv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8Dea71477262
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 10:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kuFBkpVz6jSNldrUV8Ccyx
	sAZqCRGWoimwqo5oDXNxY=; b=Moitz2qe8y3XDHyQqn+/Rg3LoOMkmTU7s3TLD2
	BWkIh7FYNeC0tzJzl+LMLOSaxp519R+4pwekIYWyBMwyJiSZRRDxDkcJxdWbnVYw
	4KmaxkHxRxZFBejSpXhsbRIfoHvz7BxxeZHMMIZb+2AV3/4fRyQvcXRdPTyqSKCF
	yTPZRRmK38FEuDEgOtBc6xLE9syXeL2kfYp2MblvFqjqR28nYBSkwV5Z0h7xAShZ
	JgKYgtTaLO+1rPUARVq5qJs1W69nRBvl0B5fWeLHRO2vceMN1TrxX1Ekj/Kw75j/
	FUHXp+nBq3hkrShlWpAge6yZrpqliWDs2gllZ8t8SumNtaQg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9dss1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 10:15:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6097ca315bso4175485a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 02:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763115351; x=1763720151; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kuFBkpVz6jSNldrUV8CcyxsAZqCRGWoimwqo5oDXNxY=;
        b=Sw/1YeCvWmMgTnc4U8YyMWyDDkvLYOgc4+7M6trHIqx6IlbtLKkC4I07QVWWvbF2en
         Z+IGYP/hesORxq2oGax7OgfUgcSKAZFUDwdrnjOR2B64XTFz5EmAVKn3wvRRL4+iy5xf
         HazmyiWBBzblQouBYeEeZ9DMuJ1X9YCwkpXML06eRXYiuFboFKpB5H83Ju2VI7POrpM0
         CWDHk9HbckaZhT7eaDTJNAN3wZNYtHPxVlgpfgBoowe53e3pbqQ4WtfqIZCPRiDzIABG
         +wPEPeHcCllvCdRgg5/Ha4DlOL6ozpjswDrCF5IkDelPz+nbPriOzL7qrUjz+KdKbBmD
         eUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763115351; x=1763720151;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuFBkpVz6jSNldrUV8CcyxsAZqCRGWoimwqo5oDXNxY=;
        b=iEvvTFUgychZ6aW+PRRb72z+D3UEkfGBdUF/2kAX2gC9OybFhb7YXD2fmADeqJKfjd
         n+Fqx4UanAsV5701zRAI9XPCxKL2ZBZ2BtrPokfWBYvxC9zj6m40kcwUibUwY0qIMLpa
         rEsBDq3g3j+yDWZ10e57T38ieLLbYeBA34WUeb7WmrYL/MtKfYn3uH8XfSI+jNvTk2LB
         429oGe0ZzKsmqEW5g1s4S63L9OfZ/SpdPbRmwjAmFh30W3tkxSSRj0rsfNy4kTk5TbWA
         O3N6sF9tFUbDdu2gVKnh2sizBmsu/RwOtsBrH6QnEIxsg4YnYTan1AS4FrQ5wNEaMo5Z
         NY/w==
X-Gm-Message-State: AOJu0Yzn26I6vqcv6J3H36CMMBdKZ1nA64/cTAO7RrpfOx0QBlHpyaXq
	5REdiJ0x4Rbr4S/EC60OD8giiApVFCPxNghri4u1X16/ukabg1ZgRjCTyQFcJGGAEgICeKchFVZ
	kZwDIkWbgHI8a/zIOMPics3c03sfqDvf75aXMVKixy82GMuPKzWgl/8vZwnZ6o4dNDP8+
X-Gm-Gg: ASbGnctbICz2LeU9fikNSAqLk6df/cwq6edu1LKqd898+GeTMBDShw/lTRf2T/jR2AN
	hSpK1Xq+sBqapdcufqmku3akknlUlhAVRbtp76Y+6UqN8Hd9KRh7gG0KBx0w3Tq1Q126C8VWeBN
	mOOmjL5naHXzl3sw3YMj18221f/tAlbqMWOsteBYJgEqEtKQKMsV1YagDAmVHGkdqpT2Esd9tGp
	LDutP5W66R9MIuAh71mM1nDKrSyvrh4DGhgBtq8ffrlSmZtMv1c+jVBYM2fkPSgvgPLALbtnGsA
	EW2e/lvXIrszAvQE/QSjzSgVXV4HEUbzXLw7WGNQUEUAzuYlvweZMXCqduIFJuVAHhSfz4Z6aX3
	c8InuYSHs2SEp7wZXbvtJ6E63XxeLjno=
X-Received: by 2002:a05:6a20:7352:b0:350:3436:68de with SMTP id adf61e73a8af0-35ba209f03emr3599594637.53.1763115350917;
        Fri, 14 Nov 2025 02:15:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRfS3Vh9Gt+XSHXtLj9ylJstm7ATmrpqIjh94XpWvKPtpjIRF5DZOiNms5oAxQgecqGo4qDA==
X-Received: by 2002:a05:6a20:7352:b0:350:3436:68de with SMTP id adf61e73a8af0-35ba209f03emr3599574637.53.1763115350405;
        Fri, 14 Nov 2025 02:15:50 -0800 (PST)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924be37fbsm4840458b3a.1.2025.11.14.02.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:15:50 -0800 (PST)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 15:45:45 +0530
Subject: [PATCH] arm64: dts: qcom: lemans-evk: Enable TPM (ST33)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-enable-tpm-lemans-v1-1-c8d8b580ace7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFABF2kC/x3MMQqAMAxA0atIZgO2VQevIg6pRg1olFZEKN7d4
 viG/xNEDsIRuiJB4FuiHJphygLGlXRhlCkbbGUbY0yNrOQ3xuvcceOdNCLVntzsWrIVQe7OwLM
 8/7Mf3vcD3T6IU2MAAAA=
X-Change-ID: 20251114-enable-tpm-lemans-a4ba3f36a20a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763115347; l=1315;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=P0Nz1N7c8zn+yPqau8Gr6He8EgSneu/IvWtZilEuYtQ=;
 b=UacOJ1AAXOmE/e4Vq/uyCGR3kdANifVqk2aMeagSDsYGnLzRz72hltFC6WtIptqtAqYQ1Lua9
 8ns1BH9vKlFD1uOHHTuQrKd5W2/wY7A+BZzG4EL2ev0Mpdn1QqsrGqK
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Authority-Analysis: v=2.4 cv=IaiKmGqa c=1 sm=1 tr=0 ts=69170157 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bj98aWFHw9KK_NaaSt4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: boLfk6llIXlez59PC80wA6N4ETGOxWtg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4MCBTYWx0ZWRfXw5uc30oWMvZR
 gkVsPXUXgDepexat/ZXiHTVsPKH3ABZOD+3b+HY33y/kjZ1qmPzQiCLDQgG8JEq1OFiAjrjb/6H
 MxKkEnafPUiZjrAbac/x4m554BQdN3LGkOxfVMJ2YU03wKEGvA8gD7qD6kDtpdC4rs9lmJtlZTW
 BCboojAyZSMchO8hSCOzpwAvTRzMlYlOjQEh/gaPv4/afD7/XA3tNT5C8zgGYlIM3k7cyOxM13h
 5NJ7KiW7gWiEifPqFXU4CSSZOXI2nWnm7Vwt60259n3Z2kdaZmfXfcL1J5SeCPsV/FbUdBERabv
 yxtRFzeopvqXJzeT8+LV+OOfxg1k0rYwr/bs2G7UXHkuWC6uzLzgeFTRf2MeWAlJLgrUMGXdDU9
 n4TciIOOZKBEkJxKwUazdFErcUn8fA==
X-Proofpoint-GUID: boLfk6llIXlez59PC80wA6N4ETGOxWtg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140080

Enable ST33HTPM TPM over SPI16 on the LeMans IoT EVK by adding the
required SPI and TPM nodes.

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
Hi,

As part of TPM support enablement on LeMans EVK, the following tests
were performed to verify functionality: 

- TPM detected via tpm_tis_spi driver
- Verified functionality using tpm2-tools:
    * tpm2_getrandom
    * tpm2_rsadecrypt
    * Other basic TPM oeprations
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c7dc9b8f4457..773893eb7673 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -655,6 +655,16 @@ &sleep_clk {
 	clock-frequency = <32768>;
 };
 
+&spi16 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
 &tlmm {
 	ethernet0_default: ethernet0-default-state {
 		ethernet0_mdc: ethernet0-mdc-pins {

---
base-commit: 6fa9041b7177f6771817b95e83f6df17b147c8c6
change-id: 20251114-enable-tpm-lemans-a4ba3f36a20a

Best regards,
-- 
Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>


