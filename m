Return-Path: <linux-arm-msm+bounces-65183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 461B2B07143
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 11:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C80F189E59A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 09:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17762F270D;
	Wed, 16 Jul 2025 09:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gWBFx4kw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82992F2704
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 09:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752656970; cv=none; b=sqQ+wqgfL9RfVV5Hrn/9gLefKd8xeqpmPBZtoLBdEc8hzvOXEGXRdfTSRJRx3OEqZg2LTFvOKBRwK61mrhsj1KgvuSEPNIMMDzq3ONnIFuI4108L00AwxzLgCSXSFl/0m5zAf+ZYj+e25ccFtKL5zmA1aqI33DXQdjdQwUjR83E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752656970; c=relaxed/simple;
	bh=Fly8KKTzJ7CWD+LVdqYCrxjMnt8d1gn0I63K2HEHwgs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oYy9vxEGggNGG3EGeJQMS7HsuhYG6hJqTORbfd9anfgBi5Xl9UXAHp6kcwBJELeNMxOqUsF0fIaJ1J497K1krUgoSaP6pHO0ErlHgi+mPLkq4wYTxZnWclY7iN+LT+4wKgQKuKUvwU8NO2szJp1a5jnDcJY4JjVkaenG/iyGykE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gWBFx4kw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G6eNhX003467
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 09:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ZSsnmMLXdvjAOfPiKvJiJHPk4pPjVmM4Mc6ZjXFXlE=; b=gWBFx4kwYIXr28Fm
	nWaFxgwPsuhwyg8PqFkxo3OC0AALOv5UeIqYG9kQCqlYtNycFTWWe+vx4rlT7V9z
	WIMIBiMfTZ4kMgPh2szU5BX/0QsgH3OiyX/nPEZRYlIEO9howtMD8n+yasoqw8LT
	5IWN4fpLLo+3/xFaZG16ntN/7G+AySAKsX+KPLEm/6fKmrfQU0Zof7CwFcifmqAu
	KbLvdqijLqUP4sRpznfytyXML6wlbzgWDocLjZfsYLuzU5WLC+S/X2Re5mDtMH6X
	HC0cEaB39ksSxIJgkDo3IHWHEDxhqeM3l7ZhoxlaBectXb1fV40DoyToHCS2wCDX
	GYU0KA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drp6en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 09:09:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74943a7cd9aso10103158b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 02:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752656962; x=1753261762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZSsnmMLXdvjAOfPiKvJiJHPk4pPjVmM4Mc6ZjXFXlE=;
        b=iVR0KezmuL94lMbBJcU1YKBKH6fRAdtrBM5ZJWQ4Q+d0mY8yfcjJGbg4sZT4ft4jta
         i6nNiRWX2Y125hcWfMEwLqRER+RaS3qBC9q1wUzClwmRHbpOHfrw/O/SW+ggc8Ih9dEU
         bRjQw56D0zFKr2Mg6iZWT1b+4nhSfdQTHJrsPkQSzcZPTiBOk5pmljtl3j3op/lAgoxY
         d/gnHqVnDSZ+lZaAtNg9nkt71E6I4V21FmRqh4bfRBbnoIVMRowIZB2eGlR+DqQFGJn6
         3mqrB+N/OCpdTXjQ7wv53REsOhSwHlKXHhqu1ztAsx3Xeo9xfim5gJTfgv+/QPv1c4hk
         x1vw==
X-Forwarded-Encrypted: i=1; AJvYcCVXGS7FOEd28pfj31KOojRkgVfdprrJp4AY6xvISQYp3lN/zrcVWXkmOzfJDOPMFE33Pvv5eqrohSCx1dc7@vger.kernel.org
X-Gm-Message-State: AOJu0YzEWRvlR1qj3Y8ToLhX5PtIKjJWGbGN4JMBp+fRweTMPXc1kSak
	Jy4Pkaj7XXd0FLfXQI2hqSvK8lSMFDMloSrm3l610Co4onWZYpSnu78lVQIhgMDcIVEdoOxQpnO
	7JLR0hbD8P9eMkWii/M7tYL/JLBdYy5blTpcGQxunmEIsKZ3l1qDjPGkPxHCISq18Uh+8
X-Gm-Gg: ASbGnctL62p+lYnP43aYSxYx/9kbnUWvHLH7N53/6KR+tNnL6l++PiZjL0WGOVrtT6P
	nSeRu3Ndix80azix3EDnsyyFZhwUNrawoMKFa/QmZ+KfPi3Pea6s8ffZWOEbP5q9i7991i4uWTy
	NynUL/yv3Dde2GydHEGrTHKlGkGzXc8FfN+Oh/LIZ3PXIhPK6vHYJLpT78sbirWHMz2COIi/jKW
	X9+MfcY8O6zNfHFZqQmsPKmhZhqVPSRGJMXZgb9mkK0fDYeguzcUphgkpQW6czHzj/urkwqgACJ
	S/VteXUSZy4yNPoUNZU4TfrqQ38tTNqoVhWh1qNbnJKdJ9wPOTDCiiJ5hPDpYos17boreUlfGA9
	y1babITC2T47euClueIbB2PhMFvQN2Ne/uA==
X-Received: by 2002:a05:6a00:10cf:b0:74b:4cab:f01d with SMTP id d2e1a72fcca58-7572508125bmr2534848b3a.12.1752656961619;
        Wed, 16 Jul 2025 02:09:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEZ5DQcZo62SqHIKjvUivRsKY84ejDfrmA/WQiIfHCdGmDowGSLYTWARk4UVwnc9gfYsuwZw==
X-Received: by 2002:a05:6a00:10cf:b0:74b:4cab:f01d with SMTP id d2e1a72fcca58-7572508125bmr2534803b3a.12.1752656961134;
        Wed, 16 Jul 2025 02:09:21 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd6022sm13926375b3a.8.2025.07.16.02.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 02:09:20 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 17:08:39 +0800
Subject: [PATCH 1/4] dt-bindings: arm: qcom: Document HAMOA-IOT-EVK board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-hamoa_initial-v1-1-f6f5d0f9a163@oss.qualcomm.com>
References: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
In-Reply-To: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752656953; l=1644;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=Fly8KKTzJ7CWD+LVdqYCrxjMnt8d1gn0I63K2HEHwgs=;
 b=S3euloBUvf6vGs39Jz7hp61Q+/lvXntgfNlGRqr/f2q3IlZ0HIlLOZdmX6IadZdQOf6CBZNRn
 di9Nd/MIndhDIsIg0SW9eDV0TN9X3zVATswL2FdRpmRipONRiaFqzRS
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: wvsIlZsAbD8zdgm-MbuRkn-pSZn3QJjN
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=68776c42 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=X4CchLBkMRYhfesQTxMA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: wvsIlZsAbD8zdgm-MbuRkn-pSZn3QJjN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA4MSBTYWx0ZWRfX823go/MSxYUP
 WB6h/Rm2sJBtTMpr4axqtFAHG4nVLvtN4sKsgZ7RS3BZztg7VjM+IkE80xR59YrZ2AoWI0yCqIM
 PpwxzSX4Nf9Ro/DrJXWoxGxP8lpELe0Wty8GdPhr276ccEBxXL15qdwIi2Vuka1DZi3CTOLb+od
 Pnp8h29AYq3xt3qXRiAAZoqna3cNuXUv680YoGAlTvec4ZB35AJLz5div1huS7JrtBM9E9pMpSo
 Jh9QT1xF9/yvQSR8XOhHs+qY76Vvds9gpqE0unprmR0EydPN3lF8/KFrEZWFbTndPL0bbOGE0MO
 fNIXd2LhukC4qgWpyQcmdloNvGaqAjlhJIrH8visSKDiwS5oxsoa2ZW/NtMhNpbB0m5MWSlfC/L
 mDa2xb29OZlAtzvo8RLJFMWxeRgjNMnpiSjwBt92EZYkPa37GQf/U+MuovWb95PCasp720FL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160081

Document the device tree binding for a new board named "EVK" based on
the Qualcomm Hamoa-IoT platform.

The "hamoa" name refers to a family of SoCs that share the same silicon
die but are offered in multiple speed bins. The specific SoC used in
this board is the x1e80100, which represents one such bin within the
Hamoa family.

Although "qcom,hamoa-iot-evk" is introduced as the board-specific
compatible, the fallback compatible remains "qcom,x1e80100" to preserve
compatibility with existing in-kernel drivers and software that already
depend on this identifier.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ae43b35565808ed27cd8354b9a342545c4a98ed6..83b09ec1100ca03044c832212a99e65cc1177985 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -100,8 +100,8 @@ description: |
         sm8550
         sm8650
         sm8750
-        x1e78100
-        x1e80100
+        x1e78100 # hamoa
+        x1e80100 # hamoa
         x1p42100
 
   There are many devices in the list below that run the standard ChromeOS
@@ -1162,6 +1162,11 @@ properties:
               - qcom,x1p42100-crd
           - const: qcom,x1p42100
 
+      - items:
+          - enum:
+              - qcom,hamoa-iot-evk
+          - const: qcom,x1e80100
+
   # Board compatibles go above
 
   qcom,msm-id:

-- 
2.34.1


