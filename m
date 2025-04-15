Return-Path: <linux-arm-msm+bounces-54379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59704A89A19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52A5216D76B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F072957BB;
	Tue, 15 Apr 2025 10:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcpJwzKt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D8F2951DF
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712826; cv=none; b=I9ZSYa0//TmKxJ4COC7KdLohXjnjbPkuu85+5CE8szanHptCIM1MFCqJKS+x1EAKlE+9K/fAJXNIm997dCkOSasatr3K+uY3cImonzpIQyoa1CPCaEF66aWMI5GC6oZKOSkDGzB+qqo3B82wMImjUjT8AT7aT9CMjldVN5oUr0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712826; c=relaxed/simple;
	bh=XyJrrab7yUxjzxK4VPgBdw3hdSYd1VL2NTP7FYQSMxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fPFXMxL3LNp/mOjnrc65FnS4IruLwQhijvLwvFm3AAIltoQAo7xvq1mYVZu/U0+Xeu7xp+tIIf0cA4rCbEB+2afWISWAHoU2XruvvCeBHgYamB4NfU9NRWI0ok9tg6aGE1Qobg15+6qD6Th2tKe1e9RycPY/IXFPQhGQKgs4x+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcpJwzKt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tHFV002235
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oIm+8b6P2AjVyXOt9VB2DqMMOC0/jRc+VnrGzCdYJbg=; b=WcpJwzKtWYU39knz
	kX8/I5LGWgdWtKbNtatMvYy4LIX+GkvseVNKEa7kcxp0qgwitxw1pEyj6PdPX3qg
	WVt/ibH4l/Wepf9+xgYBEEo3so2j8NPLyN//yhojVovpKsUqAjhKp6nwJjLer16H
	570zy7yA30CgCcVO5dLxmrU9fPBMN/jIG4YbFbLWATVSzWtoai4wMU9j67ytoZgb
	G6slkoj8k8bS8maLrfylf4ww/afzqdvoWVsw0C5i2iFABbxrgmHY51gPuDP3OS7Y
	ZWQd2lI3lbT3emComILvUOu1NdQ/AFIGkGC1Gq4SlncBv6QLgbtNngGawAvHqRT4
	sx0Cgg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vfs4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:27:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c793d573b2so960393185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712823; x=1745317623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIm+8b6P2AjVyXOt9VB2DqMMOC0/jRc+VnrGzCdYJbg=;
        b=N3mMHT0zXzaMzygUt7grED6gl4BdcKN0tU91s1npXQzE0ORngOMmVGWk34ZdiX7Eva
         KoZQrSPAtm1dArOAhnu+atOyy9uDBouJXzv5d2CYqi2sLga2YIcEfhSJG/FwuJywcFy0
         9NnGktKf0jQ6G07A8L+nQMTEDJhF4OfkhjlTiZeG+Yv2cBijSZnf3TWCrzOwoYj1sqej
         WVPwayjstgS+qjYkbZBPp5hq6Cq0miuB5yoOMZMs855ntqMhimchKrITmQI5GqxT9T4c
         7AVbPimoHGMJa6/BMe3BCKONVjltFLgG8cbjJnTmcDxaApQEJK9IIB6DdMKfVTaJLBqU
         5XlQ==
X-Gm-Message-State: AOJu0YxRlAOQ4fJHudcUhci6SMnO239fsRrD/emhZIoAR9WYrjmiokHZ
	BCmJBJFjGQEJ5apr1GDWAQ2puqegJgWzMaDoHjalpiKo6VmataTdlRVxAKl9z/zZWEZqEaur4qx
	weGqRoqDbeTEKbYHk9GNswE30TwHYSYygOzp1Z9P1/r/acraSfEfSyaWXRbmBpFhp2LPS36Kh5z
	H+rw==
X-Gm-Gg: ASbGncukryH8348GsZ30b0gBS9ggpZQvEGq+CkygUNlOr7FQBnABm8kaF8e1JGgdfJI
	VdXsZPtyLlmjf+Mb6a2QkmEmJyJazUzM/uGcW6X/lByeE644KpSsZWQpEcchW4eiK/xURUNHhOG
	O48gxPTJp9homOrgiGraXAThxGOSpyTslHdu0686v9qxoq82m53uw9FnzuuA1iBFskIbp1wI1fa
	uYCJJcYRJ2Rg3mvoXf1SbI3GywAuInitPs9R95jgo/4aQ5D9AQi2AIWWjYTpRJREN9ODOICfYv5
	dcvKaU2MXFG+v28hmL8KUJ44mOycKRfMrJmjr6bTeCebMhF08GUBmciYf31ft2vTifpG0sVk4Rs
	ZOMNtXIIMEzvd7NlVmbP7EWWn
X-Received: by 2002:a05:620a:172b:b0:7c5:79c6:645d with SMTP id af79cd13be357-7c7af0be2b0mr2252456385a.11.1744712823096;
        Tue, 15 Apr 2025 03:27:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuumvLG94klx+TnJLNT0DxONI7WvnZu5Yt7rXhdsuyUaYkOnHDsiKaUxJs0G6ArJ9VhM2FxA==
X-Received: by 2002:a05:620a:172b:b0:7c5:79c6:645d with SMTP id af79cd13be357-7c7af0be2b0mr2252451785a.11.1744712822645;
        Tue, 15 Apr 2025 03:27:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:27:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 13:26:11 +0300
Subject: [PATCH 13/20] arm64: dts: qcom: sm6125: use correct size for VBIF
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-drm-msm-dts-fixes-v1-13-90cd91bdd138@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=959;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XyJrrab7yUxjzxK4VPgBdw3hdSYd1VL2NTP7FYQSMxQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jRdxsWUv12aNX8P39ZBNX2e0lJN/E7JNsDWH
 QaLORme9EuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40XQAKCRCLPIo+Aiko
 1Y9WCACZNcOFZ5eYfrwfskCLw1Zu3EbVv/WZp/mnraFYsfXplSyz7DKwJfh9PlBr8ABtd7oxkxO
 zG0OgemX5eryJxYERNxvnQATcxZJq25kEjjllhUqBzYgOLW4bpeHFmbaVoiWKQBhxhTeY1yD8RH
 ApNPG0zzC9/agu0D29vQg7uY2WgBJwDFl8P0Na1zqJg6dVmLUFtR0JrRtKsDVmoC7anppOD0918
 lcXUscwHawwM5fq/tT0/zq6fTjsAQMx+tqA+mmaAVx6bPOhpG/BnrCdyPL/OublFBDxpfu0UxLv
 5PtWq/mPZ0IsNNM35J3DLdypTVWfd6vaqDnnlDjXzQxM0TUR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: rL-c-ghUZOU-5wfh_kNParpwKdDGHyXZ
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67fe3478 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=wazrfr_39O-6HVnBxSEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: rL-c-ghUZOU-5wfh_kNParpwKdDGHyXZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=591 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

Use allocated region size for VBIF regions as defined by the docs
(0x3000) instead of just using the last register address.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 091dbdd171b46c1aacb37b90c3fbce14422aa031..8f2d65543373e70b48b4015478e21e8e74fd23c9 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -1251,7 +1251,7 @@ mdss: display-subsystem@5e00000 {
 			mdss_mdp: display-controller@5e01000 {
 				compatible = "qcom,sm6125-dpu";
 				reg = <0x05e01000 0x83208>,
-				      <0x05eb0000 0x2008>;
+				      <0x05eb0000 0x3000>;
 				reg-names = "mdp", "vbif";
 
 				interrupt-parent = <&mdss>;

-- 
2.39.5


