Return-Path: <linux-arm-msm+bounces-55716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8198BA9D0B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 20:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1ED61B68A47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 18:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274C7219A86;
	Fri, 25 Apr 2025 18:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bYybe2Aw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD32218ACC
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745606733; cv=none; b=QWuqPRIQwsnxNux8hkG01V5xJTFzLoz/xwimAYovPOHMp37BVhU+LmqKOktqbVvoxzQfL3lAh2cgIU5KY3L3eorY0FUzyXPyDxbwxFU3f7Yg7XDkzmgTeYDtUGosB6PHM5c7TrPDQukLcZJf0pWlH3ZkBlDD0HRtPUNA3EdY1WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745606733; c=relaxed/simple;
	bh=3/pOVwyRlrNgkCJ6KBPsHy4woF59FBNMCP1DMrGQy2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pFBZT1uIcYgGgERK7bNHjDuGk4y8TKX7g60fgI0A+AFVo7sN6b3C0doMA2xZP7Dg6Khf03ezJVF3OHMfUmFy+nRHAVJWPROePES2MKR1NsimxWr2qdxl1XZD3up++rnqowDSc+FjIRoSGqHNmiaatPp/lTjbLbxpmcMJ/K3uKbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bYybe2Aw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKbF2014016
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EKJ3E1ee2NbHj1WRet4Kw0fB1IRn+u66pJmzaDKzoCc=; b=bYybe2AwRCnj9FnK
	Z4fRTEkcbFCH2xbRHML0ArWEYYX1HcF2Lk1yYxq/sHh3swU/DdFms0ZP2Iz/KP2r
	5CZ6lMgt4JKTdJS/0s1psiHfjyEh6CyRVFmfMHfYkwYsCcYfZaMXn5/sD8dAWP+X
	fMHH6e8qkEKTnuh8KkWrCb2XT73yKu9jK9efWiu645zdLMbJbkT79XzySB2Ccgcf
	gM5VPztTrob4OwV3Zz1kbIqYxBPRDOOhch9upXQJJrIFMzwjGaqy6LIb4Mmwfn/2
	aYCXMO2OrwWdFVVV0bNdXefCYwEqYIAqizGxa3IIuLjYxcJ19x1kLPN97qbhQrFx
	bCnGnw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1t2eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:45:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c544d2c34fso371029285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745606729; x=1746211529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKJ3E1ee2NbHj1WRet4Kw0fB1IRn+u66pJmzaDKzoCc=;
        b=F35nQvR91eC6OcsgAa6EXbx3sLUbAmiwFFfL82DCtSGvV2zUfOCyG1/eunid8jJW/l
         pwrFbwNKrji1tEZjVzFnyhCR5rEKvLUajreJaQzOscqzJAJRhIYMKey3RInfiSm0cNl5
         WWokCHUlOb7OQopRu3rcbUluxDJ4qFl46+aaSKv/a+o9zlMBQymxfEo7U/zNc2ebLWPr
         cklMd/7Endb/Q5yv9e7E3yv3z9dzZ2dc4eCNZ7tHCURCW7puk7JgCr9RLSYKplaIfBQb
         uNzXgyrVmTHGdjsonrAmLLbhtV7CcKv5nFMC8OQWEL38ld7XJF/FRrXJNhWe6SeWS2B0
         HPgQ==
X-Gm-Message-State: AOJu0YwzEUdA3eG8x8g/KQrmFxookv+vrq5J9NldghWGWw61XS1BUicn
	ImAIA1Z/u0piSHKvdtPxC0m/ttv1/7HnY9Lp2NmncT75EK2QVwpnqs5yX3vLkFzj/TK9B1+40Ow
	PcP1G0Fbi3zfo4en+3rCJJeI2FiuOkaO1xWone22Ibb9KGPytzJjVK2l+6V3fky3W
X-Gm-Gg: ASbGnctVtYQLTDwDdQPypnlw0BwRBS801KcJI2gd0H012rAezUwVevF1mPjq8NrLbSe
	QUmeLpU5CiWancj5IgoAlFOHxLBapdug+5bJETgW4y6wCd+Q0KR0+yfstV6CiCxqwmdbQ+Qoio4
	tMQ+cKREUOmGH0jhmlC4yhLfFDtDm9LOvEI3cBluDIEHJn4TOfpvw6ZcXqrmWgk0cGdTdvfKz0l
	BWvolVtAZxEFood3h+aVCPc3Vqi1iCUZ3uBUy8naXg7Ees0PRHruAPZV2XDJ5UFLjTbL0h22lQq
	tj4+KAABLVrTrXydHgsqF9cY6pXFs2ojeJq9PkjsNNBalplMc8ybQKK1HlYTDuGXXW22gDgjdu+
	OLLj0RpCsd2iruvg4xJ2JK2VQ
X-Received: by 2002:a05:620a:2407:b0:7c5:54d7:d744 with SMTP id af79cd13be357-7c9668731demr96252785a.23.1745606728730;
        Fri, 25 Apr 2025 11:45:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEggTNJKKFuCWQFK1y6LLAvfvg7a2JDYgPGYciMrnCbEgzFXsql4ztqCe+nuGynt3QcdsoTBA==
X-Received: by 2002:a05:620a:2407:b0:7c5:54d7:d744 with SMTP id af79cd13be357-7c9668731demr96248785a.23.1745606728306;
        Fri, 25 Apr 2025 11:45:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb8979sm688984e87.257.2025.04.25.11.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:45:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 21:45:22 +0300
Subject: [PATCH v5 1/2] arm64: dts: qcom: qcm2290: fix (some) of QUP
 interconnects
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-rb1-bt-v5-1-154b35435b4d@oss.qualcomm.com>
References: <20250425-rb1-bt-v5-0-154b35435b4d@oss.qualcomm.com>
In-Reply-To: <20250425-rb1-bt-v5-0-154b35435b4d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4143;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kyVnqEgktNyksbrU5xsGESzf3KJOgykR4CkPmnf+D88=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC9hEPXXv2+ps3VUM4jhtGZjJnOR8WJfrZl36j
 GHY5SEfkRWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvYRAAKCRCLPIo+Aiko
 1Si1B/0f0RgyVlECGEyeYNMl00MbZvpD4NSI0pkwHgF/OiFoRHxgI/cNV4t+7gdk8m6dqnd5Ztw
 tD0aSLuzxHAsOEf3bdsT8INEN+3h/FeBxlugX/KDEC640jAhdDWh5NILJZvn5M55Q+WvzQtzwVL
 vo3Hvi4Z2npHcUTfQRVGtTdCDtw8bax8zPeW6EwCYqoC9F42o30Xkl8PmLG9aoWIwJERPTVvcz1
 sHXoE+F5cxvQDyrWIQ8JwlseVg1IdQXJcCBBODgUUNJw09NwoJGyO8o/xs63G6aHW4hDCYNwCra
 ZdBapwT1WHmCqPj4dDYXUjmxB6LaclihEcvxE/PKFUKd3fHx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: bGVyEg_FtThKQ1ZItUc-cjYzQsQyP9OM
X-Proofpoint-ORIG-GUID: bGVyEg_FtThKQ1ZItUc-cjYzQsQyP9OM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzMyBTYWx0ZWRfXxHLrRrbW3yEi AkYtskmyM5VxyTccab2teCE0GRvzdN7AIaL6y9qq8jgmJyEZX5zBxGGy2Idgw5Mb2cScHrPGVRy GNLUquPWHMhPLMoXi6zQ9upTImEKpjYoEXDgiintN2fuO9LRh8OjS431B5lDa7AODxDSVrbqWqC
 2exESwY5Cj94IVPA9lkNKYPC+hr9SUrf0Q8+zlpwOJjQU/84p7rRolyPakxJjx+NCyJBuXCYGnF aJ3Z34+v+2AlkrSd6wf/0VkAk6lWON+LC917iz6TaATFVKeJ/+GgyJHYhQXCZ4/+c29w0DjT06F wuCSw4HUTfsF09TzucNKnp8Ft6n0JTw/oGuKI2iec1OGDe4lxS74QQIxGXwa4AMkeusfQSksmkH
 FmPT7EAgIXFPHkr9omdMZWAssOEUAUIdSPYyq6frhn2sSINTSdmtLVi5ntcbjHEkmXCtPgFj
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680bd84a cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9DfYs5r4dB8U4TQjKgMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250133

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

While adding interconnect support for the QCM2290 platform some of them
got the c&p error, rogue MASTER_APPSS_PROC for the config_noc
interconnect. Turn that into SLAVE_QUP_0 as expected.

Fixes: 5b970ff0193d ("arm64: dts: qcom: qcm2290: Hook up interconnects")
Reported-by: Konrad Dybcio <konradybcio@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 6a7ce2c6b88e51e126cb5add007a0857b0606a0e..c7946731438bae2882e6710c21504915eff30dfa 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1081,7 +1081,7 @@ spi0: spi@4a80000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
 						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
-						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 				#address-cells = <1>;
@@ -1100,7 +1100,7 @@ uart0: serial@4a80000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
 						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
-						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 				status = "disabled";
@@ -1145,7 +1145,7 @@ spi1: spi@4a84000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
 						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
-						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 				#address-cells = <1>;
@@ -1192,7 +1192,7 @@ spi2: spi@4a88000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
 						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
-						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 				#address-cells = <1>;
@@ -1239,7 +1239,7 @@ spi3: spi@4a8c000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
 						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
-						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 				#address-cells = <1>;
@@ -1303,7 +1303,7 @@ spi4: spi@4a90000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
 						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
-						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 				#address-cells = <1>;
@@ -1322,7 +1322,7 @@ uart4: serial@4a90000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
 						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
-						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 				status = "disabled";
@@ -1367,7 +1367,7 @@ spi5: spi@4a94000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
 						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
-						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 				#address-cells = <1>;

-- 
2.39.5


