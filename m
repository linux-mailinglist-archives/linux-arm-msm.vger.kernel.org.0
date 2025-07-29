Return-Path: <linux-arm-msm+bounces-66947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B90DB145C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 03:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0857D7AF03C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 01:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80CCD1F63D9;
	Tue, 29 Jul 2025 01:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eo9KS3/z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E201F419A
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 01:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753752756; cv=none; b=JQSSYWMxbMvUVtEO8il1tVF68+KnlZr+SM5cnJ2BCasAbvfeoqLo7oUDKdpRO3TwfFM6+JhkBsIG8GDtyacXWayvs/J1ALBifE5bmtJPUyMx+ZYckcv0uBTtk4Z34hcjqWBSuex5jjANVSsYs4OnnLVcjIVORKZICD8MGq03kNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753752756; c=relaxed/simple;
	bh=V/BYua6XV5/Slbr7KyRoyAjVXwrPIJnzOCaS+fPHr/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MgF0WMyCeNLUdV/O9a4je625c6hH7T96Qxfkb9CmRXDOuSyzWwf4XhiqUO4SWMp/UQEeeQTjZqSBt9tSEIO8gRJV5WLhNsH9NNGJlDaDDjjyFj0+L+sjFcTrxTGnWleYH3r2BRbmBSMYW9muFtIDV1/o+p+lA+vBbQFCFZx8fpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eo9KS3/z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SLZGge018954
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 01:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aiEHcRFSNvC19gKAUGSHHtMUwHZqb4Vo2WDBxZKJZbs=; b=eo9KS3/zDF6fnfMz
	MVCyWDUv60kzcvYBaiQ30Ac4MhSQn730f+PStpnei90FnaPFvWXoAosx/jyeffy+
	GTdSKa2ITeB0tP/Yy11+K+sBB+WN7qL5OGZlFQo2IbX91SLZ2CQX2A9x1rOxHNT8
	13mQfArWvb4mAlyLQapVvudVMTOSFGGnr6jcgMF0QqklBIrih+Xw8IyZY9Qt9u9u
	ASifOrpHI4tvUGtRmQLo9pb9j69RwTSAdHJG6jHTUDiU5nlB2QUyP+bK290LqJG7
	QV1dKmPD1DHBtzgA3UWw464p/eg7ytuhVsyLdEn9d2USptyE+tcVCPkgXxKNYsD9
	SqssrQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q85xdwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 01:32:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23fe98c50daso17462385ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 18:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753752753; x=1754357553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiEHcRFSNvC19gKAUGSHHtMUwHZqb4Vo2WDBxZKJZbs=;
        b=vzKA87hgrU6756sWYgFZZeIXr+A5tdk3RPpnR2aXfz0JI4apsGfZUXRKZzSTMNPW1c
         qC/ziWF9lyZJIbbnQT2rJq288G7FpRr6yuPXBiR63C1xaQyqbR9lhkNu04yMLuMPk35I
         0+PRUkrpbAjTiZinCMys7SHP5Q347FZrP+Gp2rKfeSf3MA+Mr/Z3Jxxui1Q0e1nJziFs
         ntmWuGVSmubgIZK8JQaEAUx1XPUx+0DAzQRRdWHqxZUskQOp9YOKTHcS5RuSv3bT1aV3
         KYSC9ADhIol6SphYIoFLoes40ZXojPvyAu2FZYwdNvG/6gnNOxbGdDvHaMA4vpPg+gmc
         8JVA==
X-Forwarded-Encrypted: i=1; AJvYcCVWb3Iy+pmZQpsEdKx3OqREvDsyhc/jDWTtkN3IpGffihrqbEMVsfyEPBtXlu4nbY7d/nKsHqq3VniburpR@vger.kernel.org
X-Gm-Message-State: AOJu0YyMp4XzkOKBQdDSfKxDm2F8q83ex0oyV5/Fn2y0uHoh+t25eNa+
	OCyy6yXF28EBK4DiB+O41gM1zqhMg/Rck6/RvQCbrQvCWKHJM/tP56ytv+N+8ASSQOVXquqF95R
	9/U2Ms5k4uZYQX/iC/eOCLy8ACV4lhNa1gcn18lBWHzihZCwRcwsdJUSPK6p74UA1l7Tt
X-Gm-Gg: ASbGncsB1iejXYXFsDctO6jQo6pA5drXu/4BAH5njuHE2BXwxpX1k9ZaciCP/f8E+O0
	dob6T/8KeCQ6MFvvRQug7s/lI90/PeJfvuNmE37NZ15OfiBnfrLIXWiBzf1syoPt5HyywpG9pDC
	YYjXSC3vtCDA6hiD+Z7UoTtZv06Iv9ZxytWqMNzarI+7NoDy9ulFDpLZNfqjQekhLgEGpzdpBmh
	C7vha6MCBHfvUEtOY5cmLLzfCqalByQdcbdsw+s5BZunwL5X58BVDXlm6SrzusFVsmvxGb7MWGN
	OkwyGnl3qaaRMrH2j7ku2PeTty7KzXCiTxx0oxKTYWM9gPx8+lWIY1uv2bPEF7T3PvGaioSjmlG
	YBP9mZZs20QEZ+Zi0obh3nwFhGbZGhJhhiQ==
X-Received: by 2002:a17:903:b07:b0:240:8f4:b35c with SMTP id d9443c01a7336-24008f4ba02mr101012865ad.10.1753752753120;
        Mon, 28 Jul 2025 18:32:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA0DJQLyo6uFYmcVpFDq4c7tgBIsAVsNRpcx8bgpwkzKnMfZjMLM54SIhP+teyT4i8kz5row==
X-Received: by 2002:a17:903:b07:b0:240:8f4:b35c with SMTP id d9443c01a7336-24008f4ba02mr101012565ad.10.1753752752715;
        Mon, 28 Jul 2025 18:32:32 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2405bca90ebsm11210625ad.6.2025.07.28.18.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 18:32:32 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 09:31:57 +0800
Subject: [PATCH v3 1/4] dt-bindings: arm: qcom: Document HAMOA-IOT-EVK
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-hamoa_initial-v3-1-806e092789dc@oss.qualcomm.com>
References: <20250729-hamoa_initial-v3-0-806e092789dc@oss.qualcomm.com>
In-Reply-To: <20250729-hamoa_initial-v3-0-806e092789dc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753752746; l=1169;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=V/BYua6XV5/Slbr7KyRoyAjVXwrPIJnzOCaS+fPHr/4=;
 b=hbWKGwBk6osvTAY7lNFqYRDcEvcUgSdipvrnJKHUeHpYaSt94QDYhew7WazfpMe0fq8lDipBU
 ZqUfMtrhQrdCAua7qS4rQbuzCRltYqCc/4OnSQQL3uYOzECl+CXTOsJ
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDAwOCBTYWx0ZWRfX5PUIdqI6NfB6
 0GZCbJaxySgcG43Vfx4ADRV1afhsVh2afmz9KCGzvRokqNDnrfjOZUA+6Dcd2/M1AO/tZs06j92
 3tk+yFF3oGgc9DJAQdprSJKVxDkxTv8fprejO89OMkOmTxd1Nh/WeoVO9UhJDiZLHec/Cs8scqD
 UgNCeuXrp6y69Hz5nGOlHartUwpADMowJCQWvY2l7b/U9UBXCw+evjePanyesWaM0Ovc+T6klXs
 l0EKGLnV367+M7Rz4mhDpJ83vX7zkw7vJQvjGKjjDYotWWe8+8QoS7DsWNJ1HWuvYh7VcAYSjlo
 hSWKIE8Xyvh830H8ToDOtCeDmlD3ZaNBnzJugdMWERsJk6yw552TkJU4p5kwNuNSZs1b4E44t0a
 pQmijkEFy+gLL2zB6NVCf2UJJAPpllDeCkm2Cl9uE3bBWID0jZjRYQ9AjmliJysQn0G4t3qK
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=688824b1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Bh1HEMNN3wmc11-eFpoA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: rV7JfMePzBPCgF25QjutrgPTngh1JUJv
X-Proofpoint-GUID: rV7JfMePzBPCgF25QjutrgPTngh1JUJv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_05,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=978 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290008

Document the device tree binding for the HAMOA-IOT-EVK board, which uses
the Qualcomm X1E80100 SoC.

The EVK consists of a carrier board and a modular System-on-Module (SoM).
The SoM integrates the SoC, PMICs, and essential GPIOs, while the EVK
carrier board provides additional peripherals such as UART and USB
interfaces.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 47a7b1cb3cac1150bcde8c2e2e23f2db256ab082..65003e16fe72dd4eec9423030fed6078b4a79959 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1165,6 +1165,12 @@ properties:
               - qcom,x1e80100-qcp
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - qcom,hamoa-iot-evk
+          - const: qcom,hamoa-iot-som
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa

-- 
2.34.1


