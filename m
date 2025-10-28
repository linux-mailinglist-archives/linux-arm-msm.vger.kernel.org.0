Return-Path: <linux-arm-msm+bounces-79281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1918C16D89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E338C1A28BF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 21:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B14354AD0;
	Tue, 28 Oct 2025 21:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jb4lnCP2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kAWff1uI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFCC351FB9
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761685215; cv=none; b=c1bp2BjY9F3fwvU6E3/lTXGenCt0ERoo2vSLcjU35xzVOz3SroZcohpFN0k0oewwYoH/YNe6eYtuU9dbQfyn41Ae7HW6D+fEZxbJYSpg1/+P9SArLkt+dUnRBPmFIUv56zIQOL2RCxLWW+GNIykYJhYxW/KB/C99JvoRXyNFrho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761685215; c=relaxed/simple;
	bh=EsmtIGGogp83Wk5re8Qo1ymE2FtIHHnW81gg07LjkxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MA/pC8xpMFlS+DXTULtCacRTCMULCPeNas9ytB7TDIPD+mQdoQr9anYCXGhtqnDailW1yKGN+oLIKBtT/E0Ejtidx4Yd3rCgsGEC1c/0jdvWPztYEAvulDB8wO1G1Zf+yZh7gbGvzWmfBJu8Uy5gT+mBv6hSBiqmvnxY7fSuPaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jb4lnCP2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kAWff1uI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJqNsa2510734
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VziEZZGKxOa0Rm1W6uu/3kIDvdp59RTq7ZhYSMj/7Y0=; b=jb4lnCP2QE+Dj1sk
	8w+zQB+pHI1fUeKzl4nAhMsGlHQ6qMSBQzkVzFK+sb5KRfqSVJ/w/esWQSBhhJUF
	loVt/ICWM8joT8KbgrAVzfO4ygUCuJ1+L77RfycRYNzCdHPd2ttc4feNmkxBQYlx
	Ks4rJBFBojTNKnXql3Ng6B28ol+TQ+aQe1Dc9M+erhCUS+99kDnSizA7vn7wbqz/
	v5mkQfqRanaZV0EB2X0nArtAlws/25iVAvD9QjJ4PpYxzJ/u+5UFiTWxfnjWw+Bs
	MBdaksDVuFDBnNVCKi58E4ErJcr7IdJuZ62NED0m4/PdFuuF1QD5fAcLyj4lxqnC
	E3aygw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34cd84xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:00:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e892f776d0so291421361cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 14:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761685212; x=1762290012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VziEZZGKxOa0Rm1W6uu/3kIDvdp59RTq7ZhYSMj/7Y0=;
        b=kAWff1uI8T6vdFIUQKYSrRnKuuV3z7ujrxezOcZ/lqt5MYBT+OomT6jIv3udJ3UJu/
         42QJogt6nrBX23OB+ZW88GnUaL+kW8WYYzsd8DmJvx0nMt0hQaadkc1JmLVu4AtneHPU
         hoHhkdpjvHG6EwQynoqeCcbNSa5iAbEY/hDO7wwb3gP3vc/bbyuQjfj1H3DYIc5lxXFn
         7DQa+I6umlvZguwPsrojynobgOApy+nKwG+lifVVT/Oqv2rlMV5Sm6D6PJfyvIo8d4dJ
         6BbXvHcKXuU8xUfptbP3uxumK4RlHpU1pfv5A0ixjR2THU187OyiTORlDeDKYVdieLU9
         2cXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761685212; x=1762290012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VziEZZGKxOa0Rm1W6uu/3kIDvdp59RTq7ZhYSMj/7Y0=;
        b=VP7LYhoGgepc4B9Bbet79DjGqIlShr0VJ82TBQwtNbXXdJ0OHa3ZXMxJF8T/VzsHlM
         n2c+YdKnRw/uW6WsU9yhJSuQwxSYGcr355Xzgfl7+hvVF5cAtHqdvRygkrlPDbXfD/+4
         CkQqC4KXx7YTuU60EAHlsRFPgnt4eEkZKbmknWNCu0cmN8LD/YdMfx9ACDe/7/joW7kW
         Qhe7HggrGI46yv0yE/FJg9WiA0GJPSy1JFS/O+PSz2c3nIO08boSsu86m3S6LsqQqLYS
         1fiKD2ZHnrUd6rXddYx9d83mwT84q17KcuRvtqfoCColpUVDN4Cyi/391oQBAtLgAVPA
         aPvQ==
X-Gm-Message-State: AOJu0YyrghwdI1F/x/2AvQg3X8qMervDdky9hJxBfEnRh38xqQVUNk/K
	KiYtNS15Ra0UqbJ6FX1T5JGcc8AOk83f1OCnqONG4rqWxwb99JMDgO4tEA5hn8CdVAu2jw1+EOa
	TAK+BCEpweIH7Vcj31Q4XNJFPX3C27JZMOXAILvVm0NVyUWlcYENbQ3gatWBphcjxJ8Xq
X-Gm-Gg: ASbGncs1R6VQhsIakHcZLBTc9goNsRPOl3Ony23yBrAtEUN7vY+75kqXCqnLsNPzelq
	ADl5OFP4IyB9PB44uoDEYx7K27xhes3LKxLcIHEBVw3NUP85jIPEqECNu7C+HYVp9vORR5PlCNf
	ZJebPkg6YOf59Yz/3TKSC/vAcOA+aTGOYimM4ChF1RIorNIWdh+5DA9SVNu8JL9OeT3Jbkc24wO
	KVRjeJ10MSU/HxVcHpRkoYxGbZhxApPhzGGh4tJy8vW1WXU7pxDbSJV296MuE3pZVSuvV2mSyBN
	NuMsXiCfeEiGkzKd1yVkcWuDQ2tjFDBRNJWPoo97trFS9zLv/O+ni1wJ8lFgUjBzAZMp7BRDKdr
	ceqE4kSBZfbzPDfZ0Dpl36rKmfbBXWSYZ0VoRPCeX+7Vtjw3sXt2PSdBj07HAgV+Dy7aQcEdQCY
	mv93nVNlfa7V7R
X-Received: by 2002:a05:622a:145:b0:4e8:b559:7b90 with SMTP id d75a77b69052e-4ed15c2be04mr8766311cf.68.1761685211106;
        Tue, 28 Oct 2025 14:00:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp4D699l/ScHj7pfWPbaPFKoz3mBy5SEBiI9F++8ubrl1KHnuXbAI3V3Z9L/DoSu4ZDbRHlQ==
X-Received: by 2002:a05:622a:145:b0:4e8:b559:7b90 with SMTP id d75a77b69052e-4ed15c2be04mr8765751cf.68.1761685210484;
        Tue, 28 Oct 2025 14:00:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f861f5sm3283594e87.107.2025.10.28.14.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 14:00:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 23:00:03 +0200
Subject: [PATCH 4/7] arm64: dts: qcom: sc8280xp: create common zap-shader
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-dt-zap-shader-v1-4-7eccb823b986@oss.qualcomm.com>
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
In-Reply-To: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6085;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EsmtIGGogp83Wk5re8Qo1ymE2FtIHHnW81gg07LjkxE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpAS7T+HSRF/+ghtiyTHIQaLfnd0SxBR4GSWkMp
 mM+P/YmLlOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQEu0wAKCRCLPIo+Aiko
 1R6XB/9dAt3BGICXtu+OkJl+yIc4PbcgFV24nXy89BncoNanCMevExzEIR3UvR6SySBSije3zi/
 nuTbuPCN7FSHaLsrcFrnKLzMU7wy+osvL2gfgZ8nia40bjzGQW5+vmybQ5c5EgletwAPYyehtXg
 pQTxoNYbJ6N2HIguojwSL2t5CNSheSSN8Fk+HyuvyJUajX6ohTjNB9jm0Yml/9aCSqlC6vz1rPW
 MsSN3+b40z1xto6TvAgQQ9hBjIk7GqyIXe2d+pBgM4cnvoUJ1OGDgHYBPp/+0dHDGqGtSZdf6NX
 n+lxG2ReX1DrOIs2IzRmVJGUnVxWvhIthvYkkkaJ+sYoyoaf
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: SiCYaPXa-0_igWU0qsdiMT6_3H-TSnEU
X-Proofpoint-GUID: SiCYaPXa-0_igWU0qsdiMT6_3H-TSnEU
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=69012edc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=B_G8A1FuJYmnm4XSS68A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE3NiBTYWx0ZWRfX7dR1VRuXSRlz
 8WzzwVypmnk5w3b2LFmUulm7ZcXpRAN6nIXveNFZB2r9O4ZkV2Dvi/NNlbqRWs4vHmTgRwG9gLs
 KdzlVxIVbbGHn/4KLRis50BKazBfDgCHdLUr0gmisTl8OB4grPKpoM2LwouLsjmN3X04MivZqc/
 Vl5Rcl+2MB7gVuv1hYrjUmSzuNsLoI/wgFXlnpv8N92wBzmMaUBy572NCLyWBSn1GDndjUTZ/oR
 gqBjVpHsLMlfUaQ2q6YI3DNdvK3whHXijGWIeXQq+mzeWR16m0VoU+H1sZqmnaYnDvHRcvnJBAh
 YcD8ZQ0LnCY4sswVcqUIZoHUFriuBrfZm6nVQ0NnZ7N9PvNM9IXvlkh0X2JI+42jF+sgPkayH+W
 0416epRCTgiEfkRjN2FCtMUkWVk57g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280176

In order to reduce duplication, mMove common GPU memory configuration
from individual board files to sc8280xp.dtsi.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts                   | 8 --------
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts                  | 6 ------
 arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts       | 6 ------
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ------
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts     | 6 ------
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts  | 6 ------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi                     | 9 +++++++++
 7 files changed, 9 insertions(+), 38 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
index 64e59299672cbf316b4eddb978e4583ff34c0299..524d44cbae740577e010f156308a715962db1a36 100644
--- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
@@ -149,13 +149,6 @@ regulator-usb5-vbus {
 		enable-active-high;
 		regulator-always-on;
 	};
-
-	reserved-memory {
-		gpu_mem: gpu-mem@8bf00000 {
-			reg = <0 0x8bf00000 0 0x2000>;
-			no-map;
-		};
-	};
 };
 
 &apps_rsc {
@@ -347,7 +340,6 @@ &gpu {
 	status = "okay";
 
 	zap-shader {
-		memory-region = <&gpu_mem>;
 		firmware-name = "qcom/sa8295p/a690_zap.mbn";
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 490e970c54a24203ab297dfabed7e21c2be244e9..858f71737d93fd8591ba42eb363748ac51699d63 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -225,11 +225,6 @@ vreg_wwan: regulator-wwan {
 	};
 
 	reserved-memory {
-		gpu_mem: gpu-mem@8bf00000 {
-			reg = <0 0x8bf00000 0 0x2000>;
-			no-map;
-		};
-
 		linux,cma {
 			compatible = "shared-dma-pool";
 			size = <0x0 0x8000000>;
@@ -511,7 +506,6 @@ &gpu {
 	status = "okay";
 
 	zap-shader {
-		memory-region = <&gpu_mem>;
 		firmware-name = "qcom/sc8280xp/qcdxkmsuc8280.mbn";
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index 0374251d33291fc5804c9be0dc649ccea1c1c0e0..69d0d6c12e58653f8cb56cb7d383ad9d64699d18 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -158,11 +158,6 @@ vreg_wlan: regulator-wlan {
 	};
 
 	reserved-memory {
-		gpu_mem: gpu-mem@8bf00000 {
-			reg = <0 0x8bf00000 0 0x2000>;
-			no-map;
-		};
-
 		linux,cma {
 			compatible = "shared-dma-pool";
 			size = <0x0 0x8000000>;
@@ -602,7 +597,6 @@ &gpu {
 	status = "okay";
 
 	zap-shader {
-		memory-region = <&gpu_mem>;
 		firmware-name = "qcom/sc8280xp/HUAWEI/gaokun3/qcdxkmsuc8280.mbn";
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 637430719e6d7d3c0eeb4abf2b80eea1f8289530..87bb42d9cc327a1d1811f15605a369dc8760557d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -283,11 +283,6 @@ vreg_wwan: regulator-wwan {
 	};
 
 	reserved-memory {
-		gpu_mem: gpu-mem@8bf00000 {
-			reg = <0 0x8bf00000 0 0x2000>;
-			no-map;
-		};
-
 		linux,cma {
 			compatible = "shared-dma-pool";
 			size = <0x0 0x8000000>;
@@ -724,7 +719,6 @@ &gpu {
 	status = "okay";
 
 	zap-shader {
-		memory-region = <&gpu_mem>;
 		firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn";
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index aeed3ef152eba0fff13f8fc150f32974bffbe8e8..ea50e370f69837ec9412efc17e2a41034b0736fd 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -186,11 +186,6 @@ vreg_wwan: regulator-wwan {
 	};
 
 	reserved-memory {
-		gpu_mem: gpu-mem@8bf00000 {
-			reg = <0 0x8bf00000 0 0x2000>;
-			no-map;
-		};
-
 		linux,cma {
 			compatible = "shared-dma-pool";
 			size = <0x0 0x8000000>;
@@ -464,7 +459,6 @@ &gpu {
 	status = "okay";
 
 	zap-shader {
-		memory-region = <&gpu_mem>;
 		firmware-name = "qcom/sc8280xp/MICROSOFT/SurfacePro9/qcdxkmsuc8280.mbn";
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
index a40dccd70dfda873fb963b71e39617a2025b86db..48b60f6186fc1d69178902f2cc3bee324144202c 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
@@ -227,11 +227,6 @@ vreg_wwan: regulator-wwan {
 	};
 
 	reserved-memory {
-		gpu_mem: gpu-mem@8bf00000 {
-			reg = <0 0x8bf00000 0 0x2000>;
-			no-map;
-		};
-
 		linux,cma {
 			compatible = "shared-dma-pool";
 			size = <0x0 0x8000000>;
@@ -581,7 +576,6 @@ &gpu {
 	status = "okay";
 
 	zap-shader {
-		memory-region = <&gpu_mem>;
 		firmware-name = "qcom/sc8280xp/microsoft/blackrock/qcdxkmsuc8280.mbn";
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 7b89d3d422ea62012daeb423e457a20e84eeb0b5..b7044b9d656e4991e737f7008a7cf8f0619dd115 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -691,6 +691,11 @@ reserved-region@85b00000 {
 			no-map;
 		};
 
+		pil_gpu_mem: gpu-mem@8bf00000 {
+			reg = <0 0x8bf00000 0 0x2000>;
+			no-map;
+		};
+
 		pil_adsp_mem: adsp-region@86c00000 {
 			reg = <0 0x86c00000 0 0x2000000>;
 			no-map;
@@ -3366,6 +3371,10 @@ gpu: gpu@3d00000 {
 
 			status = "disabled";
 
+			zap-shader {
+				memory-region = <&pil_gpu_mem>;
+			};
+
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.47.3


