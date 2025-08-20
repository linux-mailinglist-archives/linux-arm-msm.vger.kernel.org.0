Return-Path: <linux-arm-msm+bounces-69886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3228CB2D66B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 10:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9464E7AB8F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 08:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7132DCBEC;
	Wed, 20 Aug 2025 08:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XbhWL9W7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28532D979A
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755678568; cv=none; b=HhxxXAtrSHd2D95gRo7eX5q5iRKeSijtsvYdHR8vgIEcRD8Fd5XgvZgolifZqG7tQBNlxOXi0ohmmCIXZuhc0rkOQcDK2+3/911bqiJvgIsW5npmY83DP+IFV+ce0FAP8hKpnTibeT8zXccGqgfsedribJfmyKMIgLF4xirtjcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755678568; c=relaxed/simple;
	bh=cUKVuatuU0/Edgpdfxw3c/N86a1mg3uApCUinYHTLyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AQcfDbdpRiZWNmzg5S0Gl8bzVQpeU7Z3od4M7Ftyk9+hllqvJJJaDlvBtbP3AYHk79XTR51i8RkMLCnBijWLc2Vl8UGCXZ2HtOqnAn8/7ojpVJjTR55T7pmm22Er8W8b5rnvhmtxBKc3oMY4SDiT5EBJWiMN4K5VT5dBDGBNI88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XbhWL9W7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1otti003916
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JGiuOX/3Gl5SQ8ZJEPIiy7Ut2Wjdc99qWaL4w8mdXMw=; b=XbhWL9W7mFtOw0On
	Md6vs4tmwOGE2wjJttE/D7KDSXYAqom/pH2/sflw0z1Xw8q0fpKTIyGeVNrNAGuB
	gGVzcwiBg9e8u+EzaM04/+acp6CnT6rEUvdj2UhNXc5JMwq/+e8w9HGBoCdKA9Wi
	LMoleEpWN2qfhyzt2ZsrAOld8/XjtCrt2HqvwHWTriAGrgdv5GHThgaNTeYyPkjx
	SyEw5Dyyk0aZUGlfpI8Td2RCeir2vM+pLiOxMwxik7WZ/rx2G7+F4YBYRRy3aErD
	UMlwXdnjgzVpWDP1zlKSbJadfOOaDVTz1u9EuqigEqFYv3eFeNcfKOugUQ/42Tax
	t+GQag==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52agyft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:29:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24457f4f3ecso76297425ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 01:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755678564; x=1756283364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGiuOX/3Gl5SQ8ZJEPIiy7Ut2Wjdc99qWaL4w8mdXMw=;
        b=YS+zvmjeLMjJ8GVC+/cP35knsHrc2KxHmZ2kgkF/WcWoYXXQnB2v2TMjZpH3NiQxGk
         n9OxKOm0FTJDUdeLbAjH4BwTjIH0a1vX7bxXMVZa0qtVW4K40WdsoupNh7X6IYZjXWBs
         hdPR9K+J2v9RaJGYkj3jrnh5Fn0cH6K5gv5O0u1N/3kKM+tmXDN+dtXeeuGtE80tJLb0
         KZb6ytvTNtc5P7VmUmJL8S8YUW78Ve0qRTQ9ib872MMGbNd7iCKUwmNF24oc8IIGRDMp
         UGVgcKLdJM13q9t+JGvixqkrAw+mlptrQo0nY7veekYibXCFZw9ge/4igm6lK/p7WgYs
         S7Tw==
X-Forwarded-Encrypted: i=1; AJvYcCU2L7HasW8JGmWPs54URXl739FtmGjPB0dJ4aHtkRxpdhx7yvE5sBbQEHHCA/zoU7lS70M5Yn0VHr362z/h@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc7hiusP7GX5oy3sGVybm55DyXiMr9U41E2O+DugXafODbXCik
	TYrsFupV+CXFm7U4y5sis+e6yPLRSRUKCECxPYYb4ParJ7og9LLrVLEb0lCb3dIBLm9qIeeDM5W
	MYheNy9cK/8145j4vzaRaUklkBE94nOl/VfzgSI4qp12If5hU4K1+1FPAKxVP+Snp5Zq6
X-Gm-Gg: ASbGncv+hhMmevrnYvJhIgvsRPZAB0zqFFHoIfqw0kuhW/8sWnywHPAGg7lvR5LxK6X
	ygT+OKMyfzXgTf/wuZAaw+YO71ZJ7T05AKfyoHWcdUiZnwv6Z4ZUuxP7XRcNMXbhylBBRSsahW4
	HJq799DqvwvQjyVfnCOG0ixASBZKp5djPVhhTgpHwvMjzhISsM7IB9uX3hTS6Uvf/vGF8hCZAS+
	Z9HJnnGTrN7kRVVJYugIWt85JeXqZ6UpEDpjc62QBKtzXzWY72pjsNq54XAYbq/KJSIzIdWbvGP
	hV4yp4NVEwF+A1e13FAMSKZBomgVZjmjIj1J2WM90E6TvmDiGgXakhVRiLa/LRz5uzNQHZbyMOk
	=
X-Received: by 2002:a17:903:1aeb:b0:242:9bc6:63c3 with SMTP id d9443c01a7336-245ef27bb12mr26602865ad.54.1755678564537;
        Wed, 20 Aug 2025 01:29:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuJc5jlXFWnGiYoLB1WpPpHS4FuxQkro7nZwC6fQBl/f109El4o5ghE83SpvySv0MBi2OCTQ==
X-Received: by 2002:a17:903:1aeb:b0:242:9bc6:63c3 with SMTP id d9443c01a7336-245ef27bb12mr26602405ad.54.1755678564076;
        Wed, 20 Aug 2025 01:29:24 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed53e779sm19037735ad.160.2025.08.20.01.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 01:29:23 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 13:58:51 +0530
Subject: [PATCH v4 5/7] arm64: dts: qcom: sm8650: Add opp-level to indicate
 PCIe data rates
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-opp_pcie-v4-5-273b8944eed0@oss.qualcomm.com>
References: <20250820-opp_pcie-v4-0-273b8944eed0@oss.qualcomm.com>
In-Reply-To: <20250820-opp_pcie-v4-0-273b8944eed0@oss.qualcomm.com>
To: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755678529; l=3994;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=cUKVuatuU0/Edgpdfxw3c/N86a1mg3uApCUinYHTLyY=;
 b=j5NiflaSgQGzH5k3irCGzLAmssdtB0MNKNmsAjE+zZf7QsSW5X3nxr9zNrCfcextwvlqln45K
 4cKrCm4HRKlAADynfcudFC42Oxfk7uIwFW96kSOlrvM83JUmTSEWsiE
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: G3o0p7zyZ-DExD1x7zgcG-RpriX4bSqn
X-Proofpoint-ORIG-GUID: G3o0p7zyZ-DExD1x7zgcG-RpriX4bSqn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+A6+ZbZodXlN
 YyfHikHCQ3AL7BJIWL6nOG/2tNA0BMaZZCrKrbHXs3q8oToTB4hI+ma9tFQOnkpqA0ESZo4TVxO
 XICxve4nAMXfvLocFlVjqCVrHe+TeQ0Bg6UuYMJ+60QcGwu0Y6h4YV51eAzAXIYcvx3YwmIjFUG
 op9W64cSrezoS3SK3Xejjln9zoqp0FKX4bKvZW9uVvNiPzDif8+OY3pf3Olb1leb0aizc2tx7qe
 hMyMWVVY8ZYH0Cj9mqcj+Z+fbhUmz1rdKCHql0Cdo26+6Q75RSKuT1JWVETLz84A3hCvfhoVv2H
 K3r3KctqyyjEdMDb0xBvvQLyRaYr1mvbJNoeDW3mK2DQ5tE3EvCYfDxmlqxtVyLvgllO1h31beB
 NZQq1H1JXs8Xoa2kG3jyuMeeJTxl2Q==
X-Authority-Analysis: v=2.4 cv=XfbQDI55 c=1 sm=1 tr=0 ts=68a58765 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=qQkGquXN9PvF_GGjQ98A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

Add opp-level to indicate PCIe data rates and also define OPP enteries
for each link width and data rate. Append the opp level to name of the
opp node to indicate both frequency and level.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 63 ++++++++++++++++++++++++++++--------
 1 file changed, 49 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index e14d3d778b71bbbd0c8fcc851eebc9df9ac09c31..fc05f5eee870ca67cbafab5d989e5f861d96add7 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3660,38 +3660,51 @@ pcie0_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
 				/* GEN 1 x1 */
-				opp-2500000 {
+				opp-2500000-1 {
 					opp-hz = /bits/ 64 <2500000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <250000 1>;
+					opp-level = <1>;
 				};
 
-				/* GEN 1 x2 and GEN 2 x1 */
-				opp-5000000 {
+				/* GEN 1 x2 */
+				opp-5000000-1 {
 					opp-hz = /bits/ 64 <5000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <500000 1>;
+					opp-level = <1>;
+				};
+
+				/* GEN 2 x1 */
+				opp-5000000-2 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <2>;
 				};
 
 				/* GEN 2 x2 */
-				opp-10000000 {
+				opp-10000000-2 {
 					opp-hz = /bits/ 64 <10000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <1000000 1>;
+					opp-level = <2>;
 				};
 
 				/* GEN 3 x1 */
-				opp-8000000 {
+				opp-8000000-3 {
 					opp-hz = /bits/ 64 <8000000>;
 					required-opps = <&rpmhpd_opp_nom>;
 					opp-peak-kBps = <984500 1>;
+					opp-level = <3>;
 				};
 
 				/* GEN 3 x2 */
-				opp-16000000 {
+				opp-16000000-3 {
 					opp-hz = /bits/ 64 <16000000>;
 					required-opps = <&rpmhpd_opp_nom>;
 					opp-peak-kBps = <1969000 1>;
+					opp-level = <3>;
 				};
 			};
 
@@ -3840,45 +3853,67 @@ pcie1_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
 				/* GEN 1 x1 */
-				opp-2500000 {
+				opp-2500000-1 {
 					opp-hz = /bits/ 64 <2500000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <250000 1>;
+					opp-level = <1>;
+				};
+
+				/* GEN 1 x2 */
+				opp-5000000-1 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <1>;
 				};
 
-				/* GEN 1 x2 and GEN 2 x1 */
-				opp-5000000 {
+				/* GEN 2 x1 */
+				opp-5000000-2 {
 					opp-hz = /bits/ 64 <5000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <500000 1>;
+					opp-level = <2>;
 				};
 
 				/* GEN 2 x2 */
-				opp-10000000 {
+				opp-10000000-2 {
 					opp-hz = /bits/ 64 <10000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <1000000 1>;
+					opp-level = <2>;
 				};
 
 				/* GEN 3 x1 */
-				opp-8000000 {
+				opp-8000000-3 {
 					opp-hz = /bits/ 64 <8000000>;
 					required-opps = <&rpmhpd_opp_nom>;
 					opp-peak-kBps = <984500 1>;
+					opp-level = <3>;
+				};
+
+				/* GEN 3 x2 */
+				opp-16000000-3 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <1969000 1>;
+					opp-level = <3>;
 				};
 
-				/* GEN 3 x2 and GEN 4 x1 */
-				opp-16000000 {
+				/* GEN 4 x1 */
+				opp-16000000-4 {
 					opp-hz = /bits/ 64 <16000000>;
 					required-opps = <&rpmhpd_opp_nom>;
 					opp-peak-kBps = <1969000 1>;
+					opp-level = <4>;
 				};
 
 				/* GEN 4 x2 */
-				opp-32000000 {
+				opp-32000000-4 {
 					opp-hz = /bits/ 64 <32000000>;
 					required-opps = <&rpmhpd_opp_nom>;
 					opp-peak-kBps = <3938000 1>;
+					opp-level = <4>;
 				};
 			};
 

-- 
2.34.1


