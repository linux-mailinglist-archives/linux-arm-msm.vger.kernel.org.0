Return-Path: <linux-arm-msm+bounces-74331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AA0B8D635
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 09:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43E922A1151
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 07:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D6D2D5948;
	Sun, 21 Sep 2025 07:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mbZduiTA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2652D4819
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758438706; cv=none; b=oFqfOoZQIQtkmjD7KowjSHmezt8kTnTPAgaflGB80Bzv2iNPoP8AE+CipdNe6MrHOcoqc4VDDbH0hQrbfMy2ipGLpr4xwSt0dVT0z2SWJGE9D1JCbgrY1U4ZUkIqaYGy94VTTbGpVZxeEfPmtdD8i94SnmC2lFARql8vX1S3Z/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758438706; c=relaxed/simple;
	bh=redOLez6fIriMFkILfbpGmysM+ObU6M5aEyNYaHbMJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pOWhxxJW7JpjjgkFp630pjAdij4hQ+B3omCMSAObSJr6dRPuL1IxQ+1GyZtyNms0P83+A8YuFx6Q76pyd8zM4Quc9U7eB86pDs6rkAob2KvOWGEE3o1SC7rzdmPENGwFnWKeJoOqUGBYpusVYdzp7xn0xqcVBZ2BN1+k8q4FvVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mbZduiTA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L3hYvh028827
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sO6MMk22SdZdiNIAiwokJHffFe9hyurjW/sJUDfRXf8=; b=mbZduiTAXZ3M+RJo
	j+sYqBO19xYE9zCxYQ/vthk0UgSBkH+015hJPQknCnLq64X5XriGWCIxjLu5yoA9
	P3Lp3CpCl9EEziM2lmYvfmfA8wekSHldGDWhfzmZAxEy3pnemozCkH5pKTIB9vII
	LcQoNmQPe6Lp2/+4MnWxzl6KmPnIEZAV4gWlI2DiuWKPWOiFvHlX5OPHw5LKQFEg
	XHWrQyz51QbpLEOwDRjfvR6FmpnAtKufivA4H9xcZh1sqkwJqAe6QZV11CsNjsCb
	k2c0nCUpam0/1VipPbfWt29+TymZOIwgnKISNZCvgCg+b9MYkAe8DtGKvHtPe5Yo
	c8NZZw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1f9qx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5ecf597acso82792521cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 00:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758438703; x=1759043503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sO6MMk22SdZdiNIAiwokJHffFe9hyurjW/sJUDfRXf8=;
        b=G90jVZVnAZ9JQdQDDzbVkbGBHyqn0wYcZmhYCpvDgQpxnuOEAX1zMiBB2FHiwktiHd
         DhPY017w3JHRq5iOiubnt4UyRZd3Lj7o/OXAuM7j7S1KDjzsggJMa6cnGIzIOElCqUzY
         H6qrz/jtsnouIS8tJes90YwMs9tRnrg+bSH9FovCykMJQoTPDLTqPK6P3a+VSNJ0UyjZ
         UyQ5S1Rl/zhLiNZrU1yT98DgddbfAYgflIDSE7smevZbcvY4v3BEiMCpQNPIopjvv6qQ
         0ugDYbCnhp8Aj2EefsrdKP5QGDdsjlbDCaw++PlB9JDWolyLbOEwnoZ/tv4D51IvigwK
         W0rQ==
X-Gm-Message-State: AOJu0Yxxw3h4MOnOOLbHCumhWjx3mwSlMeJukh19RDMykjPbnp9Dp2be
	9ls7155nmDkyRk+YptHWH9O+hgRvXhJokw+CW07rKQAhnoN2CrcocIBgpMWMbq9VKzecPulbDZ0
	QHKcxE5/OSY+blbg82A+68Ou4CflpUtqWBgeCzI1uXvRixeqK9CMVHFXJQ/phqT6DNiRt
X-Gm-Gg: ASbGncuJGIbWMYlUe0SOqbLD3A8h5zqdnG8wU82ypFtMBSLuGvuQCxqRhg1UpCYY1sF
	FQOZg67PLjX66XS7S6Oxy0/1/+nYrcjGOm9XVIYKfzYtZU5CWTZWq/o72QgW9Zbxxxb5D12/Iyq
	3glLH86Po8KplSI4Q4DKyV8jH7hDLkW42XxXsSdc3L59WXFUatKwIRoUxbMTgmQmdMZz8yljWUN
	waDrgqSyyaOyGgGe2z1VKvdoqi1qsq8DmNx9vu/GsxVho9U43hChor1FSkHU/X9M3q61U1YqFHD
	cBpCjGel2MgGEvs/vxJL9a5KdXT9rVKPUavAOFpQhbSgBcOTXEnsrF0yGo+M9q0x6eF+pGVNQzk
	xp9TFASzQNxiX+HZGPrFce0r6EP/BH3AZbp9s9DkHEOUy5mjwzKOv
X-Received: by 2002:a05:622a:92:b0:4b7:a3ab:18a2 with SMTP id d75a77b69052e-4c074077216mr107112311cf.80.1758438703111;
        Sun, 21 Sep 2025 00:11:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGE+iquID9CtGDF1u5RitQ56fz6/en/URLR2HsdrnpUd2qjrd2YPRUh6Fskh+nNLL0a2v1fw==
X-Received: by 2002:a05:622a:92:b0:4b7:a3ab:18a2 with SMTP id d75a77b69052e-4c074077216mr107112071cf.80.1758438702698;
        Sun, 21 Sep 2025 00:11:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57e06875c2csm144031e87.4.2025.09.21.00.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 00:11:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 10:09:22 +0300
Subject: [PATCH 06/14] arm64: dts: qcom: sc8180x: add refgen regulator and
 use it for DSI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-refgen-v1-6-9d93e64133ea@oss.qualcomm.com>
References: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
In-Reply-To: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=redOLez6fIriMFkILfbpGmysM+ObU6M5aEyNYaHbMJ4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoz6UhLoyQ3Ovuu/Qbux/PsUQfYHpQ1abVBKWV+
 6C6BOqhPZaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaM+lIQAKCRCLPIo+Aiko
 1c+hB/4t4JBT3AxjKLoi7p6fu0CQoY2QGTEZkcUCGxhNYnCsA1/AVjbVxsDUsXxxmH5roYT/p3T
 Z6tgaEDM5VyrgbEOJJfe5eR4pFpBDhmm/G9JZQx23boekUxsIrsVbWxWaZ5R2l6xv2eu4JUfKS6
 OiVGp4Q1ax3XsfIkeg30MTNoDGZFsBVMxt0pKis5QLVqcl1lLcdW2wimvu4rlUTdsxJ0EQ8aVC4
 fQlZF/4IfGX7VwWmtqe5GdK3J+nO4t7OF+jP6KTXwZUKcAXdiDevelMaBD7uyAtgufuf7It4wV9
 Y14P3iG4OS2Rwz9keY2zKD7fJKlCJ6cGXbbyyyzjWj/7/dpQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: U8kPYsuZcV_lgCRLe61ScQa5hJhKJVQN
X-Proofpoint-GUID: U8kPYsuZcV_lgCRLe61ScQa5hJhKJVQN
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68cfa530 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=qPKPcSrW1Izi2Xt96l8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX8U8CxELGyows
 SGFk1mJjry5kdrUawoGExuk+kzEuAHZtOVOjZvaPrgu3KI4fu6Myz/A8PBE8SfaaZiTqrSW6jTC
 9MyJnUBUrl4tk37GJqk8wuaz59cbUgQJIDEKmPL5ssp3QujKG9hKlFb4hN62vQqbiUXr1EiOPKw
 j/e/OVQ+LwCC9F5LD+j1rfL0+br2MmavSgiVuHIhpy4RnL99cVeZlZANZVD/QqP8E8seKH4DRW7
 sddxK5JzAgT6xNkTHh56U/T+HFztGsMsC5Kdl+goNduGK85uIkC20nXGh4fOD3/lm6fW+kVujjR
 mhLfmC1kmBSJPmTL5MIG71banA/jVExOs1dLcJSAgfWyz1rh9x663lKEW2EqGrQAbvJggYIFePT
 fx58SGKf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

Add the refgen regulator block and use it for the DSI controllers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 85c2afcb417def2be3d99026c7febd9f9db25da3..e3143a4a41c948cf4ddbf4b137a1323366566fdc 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2530,6 +2530,12 @@ usb_mp_hsphy1: phy@88e5000 {
 			status = "disabled";
 		};
 
+		refgen: regulator@88e7000 {
+			compatible = "qcom,sc8180x-refgen-regulator",
+				     "qcom,sdm845-refgen-regulator";
+			reg = <0x0 0x088e7000 0x0 0x60>;
+		};
+
 		usb_prim_qmpphy: phy@88e8000 {
 			compatible = "qcom,sc8180x-qmp-usb3-dp-phy";
 			reg = <0 0x088e8000 0 0x3000>;
@@ -3116,6 +3122,8 @@ mdss_dsi0: dsi@ae94000 {
 				phys = <&mdss_dsi0_phy>;
 				phy-names = "dsi";
 
+				refgen-supply = <&refgen>;
+
 				status = "disabled";
 
 				ports {
@@ -3203,6 +3211,8 @@ mdss_dsi1: dsi@ae96000 {
 				phys = <&mdss_dsi1_phy>;
 				phy-names = "dsi";
 
+				refgen-supply = <&refgen>;
+
 				status = "disabled";
 
 				ports {

-- 
2.47.3


