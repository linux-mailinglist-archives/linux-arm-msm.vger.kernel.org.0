Return-Path: <linux-arm-msm+bounces-77035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AC2BD3AAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 16:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1F5AE34D102
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 14:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B15C3093AE;
	Mon, 13 Oct 2025 14:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jU6kE/PJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E353E3081C7
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760366745; cv=none; b=B66DZLDqWEpcuzunXr2NnMMuvaaR0FRks2ZaRGHd5hFuDSjIvxu2R+bpb/2hH0Mo6ieTaIkRNDhD9FW6vfZmsEFA5l1lsTsieLCPxi4Gm2o7fmD/xoTc1UkI2JAhWWF3o3SKb48LlTnwZCjtl1+MnMMTBEuf/QGkHZ9Nju7/6Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760366745; c=relaxed/simple;
	bh=zl8hIpKvbWN+QijwoLKamyiycgWma/NeSFRF1B0Vdj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ws1pzFFQvzDnPUjz8YzDz9IyGAQPsmP1fKf8ArJIVQufEgSTQs3WzE3SGyqZvhWc6qWZd2i30IPcVHh+ULGChRqC6kUTp2djjqp3lR7PEdHukuXmhIJlcY1uThhmQlPnp4zZtWZJ66MZ21nEX+cY4rZiToSq6u67G1zC/K15fB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jU6kE/PJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAIJqq028760
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 14:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gwXP5tcdyruAD6Dm4Pf+yu
	RwyOaRHMeF/cpYgcLJAB4=; b=jU6kE/PJqLN0Kk9LWy8e+lubhfU8gXpOv+kOqT
	NqLEzZ8qoTQ9HloFggYgQa2nDs/WBNu6hKZQczbdx3df+C22sYr3ucGr5JA6+uka
	H2fRxnzL7gFw1idfBBxIywVXc+mpmB0QgsqiaPpr/Tc7v8929CWRWKwgHyyl9p/n
	1gURq+OqVpLlT1kfubhmd5u9lN6+bXpvNO69aMaLFpreZVFNioCYvV8GsWhxFyI2
	dRKcWjaDFMuFLZZm60C/EiaSmqIGrpADUsb+e9xwzBCKi0cnfFHc/Ky1J6vkCuM/
	cTHR3FpCWQUKUi3Yg1sp+iqIbOMg/dLkth8d3rUcWmpoTeAw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5d0ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 14:45:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-267fa90a2fbso108715985ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 07:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760366740; x=1760971540;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwXP5tcdyruAD6Dm4Pf+yuRwyOaRHMeF/cpYgcLJAB4=;
        b=ni9bn960juhfc0qwh2OD2ZfoCZchKDm3ePEwFTf71UxghaDuMOYmQU6zop8ub9rumc
         0qhTzBTbKmwG69TkWxZuY+olz7UlizuU+NPD0Q/UscYyaF9ul3OnHi4l/oK7ecl2S9ly
         KokI9EqrEXtU2p9z/sVHi85hUo5I28AvsUaEwV6XqqzxW2tPrnyh5fhecInYRMK1p8qq
         hJGLiFo98AteNvjP/kaQGIr9Qf6gBjesYyEyBKGQ81Jyh8poU7+TNFSjsusfTdsd/MrK
         X77bAVk7t9a1+V3VUoYsUKCAKS32YTyVS6AEUxK29FPpZeiPM3g2g25N1awf9Zp5X7NE
         Et0g==
X-Gm-Message-State: AOJu0YyZ6Ie/vodG9aIqsF8kl/7PIRLRzkdRcdMIjdd2FdYEK5ePU+gA
	DXe1rdtBntJfDsiHtPdoRMWcg9cTheHMxZvDqbh0TbkIx4qf4l5TvINmFhbT7CAFQZBjcuWG8yl
	fOlLoKZfJ47pVb8p/+5MZj/GGQck4lEguL8cRWXtUUh3eqrtGty9rE2tJ3yMkLMagAmc=
X-Gm-Gg: ASbGncsZbqUjakJ4Q+Ved94fMIXUJoHWdf3/wztD4wfcd3TdxI492lRsYm4ReO9DIgr
	vCuS+0VTDumFvrGy7Q1wdBx8fgjKmyy+UNKbHGcG+Nk1KOAeMt6OAVN2G/k7cant25XTCkdSAst
	JiCU+f2aj9LFRLIEJtxQYQmBr2Tywl6W3CfdCdXCbbWTrHqV377uBDaZqHUUjJ9rpKs/deC8Acr
	gzRCLx71DR8CAHcj13fsEyAred7iQHFzH3n6G/d0wo/Ua9R4hL3jSTb4y6SlPK8CwWmHEdEMv1e
	FyubP3QZ8RSHGwM6vmHhCEnqqWgi+2JJDaJwCkbyG9gez81ypB9K64UsLNi+8dXE05LI+A==
X-Received: by 2002:a17:902:f691:b0:267:cdc1:83e with SMTP id d9443c01a7336-28ec9c975a0mr351888755ad.15.1760366740002;
        Mon, 13 Oct 2025 07:45:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8v2QSCOSIISifuxLmtQAtazVk9mXHFYDyMw8d02GnJ8EiyKRKemYk99nDB8wiR9gbmzodIA==
X-Received: by 2002:a17:902:f691:b0:267:cdc1:83e with SMTP id d9443c01a7336-28ec9c975a0mr351888355ad.15.1760366739517;
        Mon, 13 Oct 2025 07:45:39 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f894c8sm136343575ad.122.2025.10.13.07.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:45:39 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 20:15:23 +0530
Subject: [PATCH] arm64: dts: qcom: lemans: Add resin key code and RTC node
 for PMM8654AU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-add_pon_resin-v1-1-62c1be897906@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIIQ7WgC/x3MTQqAIBBA4avIrBP8SYiuEiGiY81GRSEC8e5Jy
 2/xXoeGlbDBzjpUfKhRThNyYeBvly7kFKZBCWWkkJq7EGzJyVZslLhR0axCbl4bD7MpFSO9/+8
 4x/gAOCOG4F8AAAA=
X-Change-ID: 20251013-add_pon_resin-52f54018c35c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760366736; l=1667;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=zl8hIpKvbWN+QijwoLKamyiycgWma/NeSFRF1B0Vdj0=;
 b=KQIglZ3lnQwpTI8La2GX4uQ8fNHBOcFowFgSV47lbaNfIiTzT7+ulDLiufNryVjv9z1YcHmkc
 B/kqDYG9h6RB2n8oGCSUZT6WXsOxMGTWFB+xyQZROBtLZXGNjMkn17f
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: zby_os3WB3rWvn_4dCRc7_O4eJzgO8ZG
X-Proofpoint-ORIG-GUID: zby_os3WB3rWvn_4dCRc7_O4eJzgO8ZG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX29yAvM33nuJa
 t1Vr1rnxNzXi7zC+QRqSRd4MXNL+uSFT/y5Nj77ZaYdndIMlR4atzSzZWtR7eFoAP2ngq0pEsDG
 bDlvbwDrF1P5ybPYN/MJPUp1PjA7PGND3N6b6v3KliHZgVJbLGXx3A//MpI1lEIOBUjyZDtGs00
 0e4zCdr/u3Ib0nHqk9e9b/kS6BK/s7l3eGrqZIzGVzEOBAAomt2JsP/BRxEevv+8dMFHmE1Wxx+
 21eltO0CR2bxt6hMc20w+awVbOxvJIuRA7npF1TAHGd0gfHpbd+Oknmf7uHBhaqnCwomji04Y1K
 s2MdveN85D63MWcCkDLW5CRKa2H2KSPGkolFlVOTCOoDDM+R80i/lZNCsfBm3PQRd29pqnEBvv9
 o/N1HOUrpXYavFEsPYQJAYjwcAmWBw==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ed1095 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=mBVr95QgS-s2Q4V7d0MA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

Update the PMM8654AU resin input code to KEY_VOLUMEDOWN and
enable it. Also, add the RTC node for PMM8654AU.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts    | 5 +++++
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c7dc9b8f445787a87ba4869bb426f70f14c1dc9f..0df105755c328706475cc1974fc45557d0a7bff5 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -587,6 +587,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pmm8654au_0_pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
index 1369c3d43f866de9d8cd5cd4985241b99c0a0454..4eda7043b851f363d0bf053587fb1f5edae0c4cd 100644
--- a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
@@ -142,6 +142,13 @@ pmm8654au_0_gpios: gpio@8800 {
 			#interrupt-cells = <2>;
 		};
 
+		pmm8654au_0_rtc: rtc@6100 {
+			compatible = "qcom,pmk8350-rtc";
+			reg = <0x6100>, <0x6200>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
+		};
+
 		pmm8654au_0_sdam_0: nvram@7100 {
 			compatible = "qcom,spmi-sdam";
 			reg = <0x7100>;

---
base-commit: 52ba76324a9d7c39830c850999210a36ef023cde
change-id: 20251013-add_pon_resin-52f54018c35c

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>


