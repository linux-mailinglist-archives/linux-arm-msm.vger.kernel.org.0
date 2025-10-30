Return-Path: <linux-arm-msm+bounces-79747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E51C21BB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 19:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3688B3B8626
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 18:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD31036CA95;
	Thu, 30 Oct 2025 18:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwezAW8C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AsBMJLCI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F4336C248
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761848423; cv=none; b=eux7ci4dtpteLEi3cWWz+pwtTdndwSWM/m0N4qlq+TJTwKcuuKli/lPF6GYVgXJ65OeDEKx0QOjLPP+OneaL1guXCmwoozapdkR4B5h2rhyJhEo+6St32opbp29yYC8Ihs1G+mJANhA2p1ioaZzDI9PN6GNBpKuWQc4eKOYCaDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761848423; c=relaxed/simple;
	bh=O3zsqMWJzGuULuopyok7e97sOQQTNwEYCCnnTinaKZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ea9aLm54QfptYWy5yaQHjnimZ677meD85mHyB/OctKtgyK3EdosTnIypQyZjsTZyVrxQAqMl90S78V2K16R58FHTXbIyza/ftLE0WMKJOVwfKrJiD/pC8EyfEBYtBoqdDnqdMEvlA3Vp+LwFER8VeZ329/gZUGYqlIcw1ooewic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwezAW8C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AsBMJLCI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9P8wU1994640
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+NzvBLOWcvPqnstM3D5d7GCb11dmM+NQ69MqVR9iVIo=; b=NwezAW8CzNdegjyW
	bTS4PtVmQjMle7v5yuJQ83SfGGSbp39W45fxWW883w7i5arZon3seImbIs51/aBK
	sJrFyWyvIBWjyughKepW1Ydr0ycGU0h359AacODpdzPSit9NkY56ow4l1UoJ15gR
	Ej7Y6f3X9DCqGwm+UMomn4blNasXdN5NBOj7SMgy8OQLBL+T+2nq0Yu0U6VN8AMr
	qcqODhQoT9xtRJ/jO1NNMpXfgZqjc3LbXM/bbPMK2ASm3gecNQH7J3/n15imAyys
	kh7gJNplawqMZ8EB7FEcZpM+oaldZR0raA3SzZTqeEu9Sit7EROgcScQj82EXeoN
	+fY/8A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3wr72u8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:20:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8984d8833so59018121cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761848420; x=1762453220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NzvBLOWcvPqnstM3D5d7GCb11dmM+NQ69MqVR9iVIo=;
        b=AsBMJLCI4m8FuOcT5n2gZdyMwQ8P0HIU/rL4lQRQxwKPYAq3hRzTxpqikUmxPYRd7c
         +LhqVkWXgNPR+xPfiCYUOLvD9FMXSB+nvWQHKypwYZiFngiuzB8rzpeF+OUei4D4qQkk
         m30Tkbiypic+3owDwfBOWakvy4xYOtd5fuDggx1sl049dzZQnFFYdDdZTtl5kQzn6A+t
         7coLkflfZomKOZDQ2f2CtFdx+rQ/ZclS2rq6+p9hlQGvhOdbLr0Q8g6xXIwkaBSU+98S
         Ko6p+KQ73ZYOy7u8ozEmZtc5SjBV+fKCmeWNP7/R3h8+0e3HAJhKMajb5onKxp06N4jm
         6yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761848420; x=1762453220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NzvBLOWcvPqnstM3D5d7GCb11dmM+NQ69MqVR9iVIo=;
        b=iKmTyiOmFXAt6CqCJfY7YraG8E4Uph9opgsINNBt+PbIcRlRkhscmJ6O1+XamwS6xi
         1UQuLppIIbsyO48Wv2TgpsUyaJIZnRSTiAGCw5UKTdTnsPsxWzm+YBD6XVQ2YuHIyXJn
         LoBCkJGTbOrkUSyxihukCp4KFvHzvLetcGm0BTn65ixj6y+vl6lxZocTXGhWeGolru1v
         j9eCdyJFQk6v5URctHVdBUitQl/T9u2NBHb8yGK4AqLq42mc52qeNa0uPwIEHz9/nAgw
         6igqaLbh72LkzP59MFQGXtuAelDwtX8h7LNMKazIjWodIshgNlBfpNSvEJvcRD3Etg34
         aXcw==
X-Gm-Message-State: AOJu0YzotQifMvZZywkJ3AutyYvXe73ndySurNx/2HL7sbiu0pEhdQxV
	1B6if73tJAv4FvKdQ0ZZ2ZsT2JQltFdzTMKXMNl78DSHN14co+Gs0jp3QRPN5/Wi/38FFvhtOUm
	XbETnmmAugacV+c3i7+1c08MJ6t2WLHydwtDFCbLo3d0ZxgyyjLUlof8Fu7hFTi11mLYT
X-Gm-Gg: ASbGncvQot0ZBri4hMBEENve3833IBi77YI9pWsu0RlOTvUAlV1ENR2gOXCCaUXKhnr
	vaqwjkw0Dq0hHtgGeCFCpqhfjVtsj2ZmDMOEJ7BOr3jeJuJxnmBCXqFMGrugSP/8C5kM0I/yWyc
	hGU5kZOYDIeJPKQQQW+S3wKyXg3WGvh0mGjrHB40Sa3aExRKeha8kcGGPvbI0Ab+fQNR9ck+W+D
	ETlKaX6pH2rYHZ37M+QJSIpmW4wZBMv7Ni2ZWidQlz4a65GXFTw4B9BsSZSw8M4JdUFyQXAxcUI
	HNOiLs57TL04MlEp89Gf6WicFiejXZWb4aO+tCJB+QA3mC8mkg2u22OpwQHv9TCTRMlF5MpGwdb
	YHbmQvWod7IDSXyAsy6e67NhsI6HiFN/BGCrkLE7nkwPJ3zGtix+qLtxC30wnuQHga0E20xbVfi
	n56F0/1ntjlIQA
X-Received: by 2002:a05:622a:1456:b0:4ec:462e:23b4 with SMTP id d75a77b69052e-4ed310a02c0mr7595251cf.75.1761848420213;
        Thu, 30 Oct 2025 11:20:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdxkyXb0uGWv8KMJtRVs6WVDLh+jIIF3Oldvv0hhQ3QpXWIMAJ3FwLu42W9NQkouYa7lZbqw==
X-Received: by 2002:a05:622a:1456:b0:4ec:462e:23b4 with SMTP id d75a77b69052e-4ed310a02c0mr7594941cf.75.1761848419753;
        Thu, 30 Oct 2025 11:20:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a15c5436dsm3843171fa.33.2025.10.30.11.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 11:20:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 20:20:13 +0200
Subject: [PATCH 1/3] arm64: dts: qcom: rename qcm2290 to agatti
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-rename-dts-2-v1-1-80c0b81c4d77@oss.qualcomm.com>
References: <20251030-rename-dts-2-v1-0-80c0b81c4d77@oss.qualcomm.com>
In-Reply-To: <20251030-rename-dts-2-v1-0-80c0b81c4d77@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=O3zsqMWJzGuULuopyok7e97sOQQTNwEYCCnnTinaKZo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpA6xeVtEIHnIE8AH6d6S1DtZpdsBvUap5u4Yvk
 pGwbeHvcLGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQOsXgAKCRCLPIo+Aiko
 1X6kB/91wYlURqXwTnvVpZRjpNc48yO2iusLumRTeF56iQ5jCspfSXoeLCIH43Qr+20Fjgt2OHp
 /mdHTd1hOrWf5yEhBJKgEz+8Q3OWkb5IVPJAcjsjP60XR1YOjfYS5CimLONRZtUKDXmbqEW9bJf
 JTRpblmw6cY6OIeyg0izCMKgTi5SqRkBmgh0MdIbns2oUWz+CBOlbv94IQFPFgZMaK+OPE34eSZ
 /6wfVG8IvLQiAcpXo3rZc6q2m36ie8WqDtUzrVPraPW/Uf7nhiWS6rK14Au9WjE4HYnJBxgjYt2
 lc0U5KYivXXHfuTS77TjNz2MMQALj7vDUGk0jFMR85+RsGqu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE1MiBTYWx0ZWRfX4rhIelrBJIoX
 T5qke9iykMfIKl058y29Jthn8peYc3DVSdlHuiF+audR7JYEUlYprEgQke0imN6qwdfMO2eoBIY
 huFXAgAnog9pP2T9UZhK/vOck2UxHoeY6kPutPlmvykTjpuKZUMykVRhW+PsNWnQ9qs10RgOTXq
 3Is8G7yVbCcGtHhFKTu+/iWebojr2ja1IHB5xo70SmqZLOrevqJr8JnjVA5mUg8icWdifGQvYwk
 z0CA1QrZ9fStzngkaqidXgfs6418jR4OJprACNKRVOQ4UWrjHMI2O67rtKicMWX3cxCOjErTss0
 J1T8edr6cUTm9JoCtUPowlYfgevvJ12fn3b4a/xdsOctSQQPPAHbnEPBlIjpMI+nwjy5azcKIEQ
 +knD3eVIK63T+B+y0mTKk2siXBG7lA==
X-Authority-Analysis: v=2.4 cv=P+Y3RyAu c=1 sm=1 tr=0 ts=6903ac65 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=s93T1VwQXw7az0q5Bg8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: YB-cNi8zVkVYcrWLzQp3kijpq4_dQALT
X-Proofpoint-GUID: YB-cNi8zVkVYcrWLzQp3kijpq4_dQALT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300152

QCM2290 and QRB2210 are two names for the same die, collectively known
as 'agatti'. Follow the example of other platforms and rename QCM2290 to
agatti.dtsi.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/{qcm2290.dtsi => agatti.dtsi} | 0
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts               | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/qcm2290.dtsi
rename to arch/arm64/boot/dts/qcom/agatti.dtsi
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 43af25d17aa8314354b1ecb8617510cdd6c857a3..bd4436d2b0b0f1f5f8c2e4cb05bd328f32f27e0c 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -7,7 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
-#include "qcm2290.dtsi"
+#include "agatti.dtsi"
 #include "pm4125.dtsi"
 
 / {

-- 
2.47.3


