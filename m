Return-Path: <linux-arm-msm+bounces-74967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A90FB9DB3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:41:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0062421DA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF2D2FB0A2;
	Thu, 25 Sep 2025 06:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lO/DcirY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103A92FAC0B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758782061; cv=none; b=bxUSMmmbTy769QZC2AF5kkx4ikKTYQSd6aZvxzyfcXC34DSlceMlpiqfWfaivcJc/5OEOpO605UcfRdB0JnxkgxgemXjO4oVWK7xEZtYwpXbj2jTfuLZh71L3pp13PG97xjkfpyQR0510BoLKfRPfj9PukDBZaHfAzSfyt4ptEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758782061; c=relaxed/simple;
	bh=zAluZpUSdpNgn+3ulofSw8QkVZRy9NzA5+UkWEERqLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YzmooE6FNSf7EGcLNNqYDr2mxWyk4/fO80vl+BtUFz1BVsFl3akjfK6BQEV+KekssRkXmvHhk8ax7QfUc3fTByoM78q5Nht2I4O1fLjZUwz/CDx0MoLF7pMIOzhLRYorfxHrFrptgyuQqREO4pp0Lt18Hzn/6iIIgBMaoiQgimI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lO/DcirY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1493Y003945
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ueg8cSB9cvZ8zN3y2yyPUU6opBQriygJdKD3HM9HZ1c=; b=lO/DcirYB2f487eX
	R09xbXyA83a/yT8wr0Kv6EqOfiq35Ks9m66ZVBN8PSndPkdd39YtUgGhL3WC5vWl
	CNkDKiwIYcuLYU3NA4Bturd6ANxBR8PHiFUD1fODtn749HLVHvlCbC7VElXU8Xzf
	YUHzY+ei/hczKpWfz0EcZuCgW+GgMkXA91pnCAD/BBQOaA5O//NmcBFKs9OAiHbS
	86PKlkFAUMR/ehT1LYjo0nFp36uUKqVAKZolGfh4hB3P1nE+ohG2PIGObyXuOLSg
	p46Y/Audp44o9+Eiw4mK311/xegu6YlYUYBvUGx8LKkFe6NYv19MPa0YwwmR63o6
	7PNO5A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf1ju2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-277f0ea6fbaso7845795ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782057; x=1759386857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ueg8cSB9cvZ8zN3y2yyPUU6opBQriygJdKD3HM9HZ1c=;
        b=d8nPFPVeL0NAQ1JQYodk/UOai1r8HZY9+Cqf/P1AKtNhfVzpzpiimlNbyAbIrd2oeF
         qsc9a6MCREe3rnPo7orzcl4vBw23id5YIKw4icCtSD4PpYbjpDRIR9VJInOTHSjhAJbP
         akkVe+ZVJ+3C+6HNLpvIeTYwuSOCVjsG0V+E2H+7kfaBk0ctN1OVYOj11EAQOx3vdQnz
         gA2KXhGjQpmIIjOCWpF6co1jTu2nrYNtBJPYf1Tkp9c0M/Eo8JlPEoB4w93IqUkFoJas
         I+lkL49nuxRpNnvNBSCDXhKyjiU+41DkiTw1HTxhW0UnYbwYX0p1SeHByFnLKDOQp+JA
         sUXA==
X-Gm-Message-State: AOJu0YyNua0mHIpijGa2NzKPZh/H8MhmoS4Pi/qgoBvUBzLgB97F3R72
	CnBdScV3UJjWLlsaLeSa9Q/JzNPtEd4fx0z6HT9Dwv0B8fXsEC+qozrwHsC1A+i8LLH3oim95my
	xThKsdtx5cmb+v9O1q7ooxiXzBOUQS8EiCqzZhVEF1ToTYlmdbszPBDtDUKyky2oc75cc
X-Gm-Gg: ASbGncsFL7NV3OIeKlnrZ+gNbIaffcotjdbGvYL4pWRpieCHtHT7KdN4Bcdv0pGfmcb
	RtFZZaejhX3SKVbE1a+Zu1i9uFjgJHHtSvm0fil8uSAQYWujE5tlYDg/jLnxIo/WPdLWFNgo9iH
	f32w54+aETLtU/xEW8nUwt0g7Uj+aX85cK016/n4m3eB8ySkFJtV45ne1JytjA/L+v8CThvoxnR
	+pA7J0+ppv8r/0Hwg+uQg7Nbk79+cUO9eXeIEnIzRPS4jt8uQ+/6mVdavlzunR9QMy47dkLGnzQ
	FHA7FIvx1NUoaKLN8y3dJaZTCSjBm2Lx3HvnAKIiJjwnPJOvWB8Yhx/ESNmLHmIzyb9ULToSLwS
	ajMEEKBdJ/FX63xN/u1xCH4hvAI8/4zofO1VSjWzo1Ej0/2t7/amQWBnzD2WC
X-Received: by 2002:a17:903:3850:b0:267:9a29:7800 with SMTP id d9443c01a7336-27ed4ae4927mr28093805ad.59.1758782057540;
        Wed, 24 Sep 2025 23:34:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpuQbjvhka6L8uxEmpmFi8kOowFBFt1od6WQeT/Ax2QNgL0pMDrQ7F4TD/30GBC+nOjY0wPQ==
X-Received: by 2002:a17:903:3850:b0:267:9a29:7800 with SMTP id d9443c01a7336-27ed4ae4927mr28093445ad.59.1758782057146;
        Wed, 24 Sep 2025 23:34:17 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671732asm13793515ad.49.2025.09.24.23.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:34:16 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:02:26 +0530
Subject: [PATCH 18/24] arm64: dts: qcom: glymur: Add PMIC glink node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v1-18-24b601bbecc0@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 94GasznyRug-i9rtbH_bhkXBmHZWvpiL
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d4e26a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=eTml_EgcGECvy2QnpD0A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX7KILCBp+OzjJ
 fxfaQ0tvrIXkQqdj2QsI6scRXkERfpV9Bnk1xWNf+dw0OhX70f9/ieejJXNsZgjSs70s+MAGOLb
 BEG3taGKTHG2K+LLnxMUjdyq/q0NK6zZ7AjGikKGrALM/drPVcZhchGQ/SzScCi/qn7t+5YaI8i
 pVRVfKpQI589XnYBCOMiq51nH8jIK4yGaSJY6Nb1LmQF4g/cDIAC7b3ULVsr849pHp/iQe6p4rp
 SSAWLRYL1k1C4tNlChGlnWJk8jpcHf5ValSEzR4D6aZC7x9elPNhaN6BU/E5nOvWEJZ3++hhHe7
 JhRxgBCn9xutRhML8h/5O1mFT+bEY9AXhIQwEGxIb2T34DS470JMjn2Wh5c0sE5xqyoZaOVF39y
 jZV0/IJL
X-Proofpoint-ORIG-GUID: 94GasznyRug-i9rtbH_bhkXBmHZWvpiL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Add the pmic glink node with connectors.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index b04c0ed28468620673237fffb4013adacc7ef7ba..3f94bdf8b3ccfdff182005d67b8b3f84f956a430 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -79,6 +79,34 @@ key-volume-up {
 			wakeup-source;
 		};
 	};
+
+	pmic-glink {
+		compatible = "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+	};
 };
 
 &tlmm {

-- 
2.34.1


