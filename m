Return-Path: <linux-arm-msm+bounces-60740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65439AD31A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 11:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C08117317E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 09:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7CD28C85E;
	Tue, 10 Jun 2025 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOuY4gDv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DC728C851
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547102; cv=none; b=KaYEmM/d5MJcXMyZYd7QbcXEgtr67trV5FJ/mUYP/hykkNA6LXgtxztUSq/+WSLSL35TwhUUtlMOO6v0LnHSZcnkjaHHske7NdtlrJgrl6QV+xQIELd6Ex0BTW9grUJNsxYFSiYuM4v6BqDFuSK+zxF0KBi92bWhPCoNTcZhTQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547102; c=relaxed/simple;
	bh=HUhoHi1MWPtGdUaOc881gyCv+iH4y9tcRtKU1bwDqHA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eFqvxEozeyXHyj56Eu35fNyQ0fx0a0vElHtE4sxeXuHEYEVf+cO/jxcqLWn65UMErxjQk1kuWGzYTk9OCQ9b5ATsYyh4LF7iKjcsarsgBNK1YNN+6dfuy+NrsGPLcrIIrVaUelVtb8qr2URs4yLidi1/KRAVpau3yRSh4hzdiNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOuY4gDv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8CB5Z011904
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7cC6/7ZRu9K
	NwaHrJD1RpFcJHBebpSHvwonwylon4MM=; b=DOuY4gDv8vmNF6+V98GKe15Hpte
	O8BQrCd+Uf+drJ8PzbkkcQBgg3DvOXg+AZCc8Or4FjMkuSv71ltA2i+XDj3kIvmO
	sRZyud0C3dIMZ+BnjAZXDQvloLKfhQL95j57V+YgjWG2yOGe6SgxrLndsyKh7/me
	SSM0eGLozpS5xAFqpGr5eTNk2cHBv0aiHqzMnBLUuDEE7OQKFQd7pnfP/R2yTS2w
	uesZmecsrB+DaSCaSWG1NObPmdE7mlQ0V/IMiJAzP4j7nUmlFRUwo7fbj46g8v4X
	zHOnwPZP6WbDfzQ7AG4bQ4msaDJYmextEhj7XgU53tPzVgo4SdXvY8W/KSA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcgq19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:18:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2fb347b3e4so886033a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 02:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749547100; x=1750151900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cC6/7ZRu9KNwaHrJD1RpFcJHBebpSHvwonwylon4MM=;
        b=EPfdEnMaNdVOinpTcRZGlGoCA7UcxWjpRTxy3rEFG5VKuoO+nu2eLRVEGl1fFJoHO9
         94+SK6g02T+BRa7gdhQyN3B9NMV1WaZ94d8Yj+hjGKLooGHQ/Ipm2XB9Y8iTe9niTfM9
         Slxy6FfDpCrrdX/l8NZHvky8BMby9NnQPNZGfxv97T09GEWRaaD+1R+O/wI8xE9dSf1Z
         mBp9lKIyYQpxSpLvs5gt3Oci67fm69Bl+vj5BecEeunM9y6kvUw2yOAvlDgD16TMKXGT
         sqfx8Yd4NogYieURoOZpCPA7CIP49ECcQ+vF78Zgvu7yZ9z86umvHpbGch3VamBSCEwQ
         kFTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUri49ZU0p4Igtx+YHwefOENY/KQ2y5LuSMHhwmkfizsGeOXWk7/yYCOlYAbIfZ5qfRC5dnWdXt0pKY2YJ5@vger.kernel.org
X-Gm-Message-State: AOJu0YySobBvbnBgyqiabXLJ8NYuNV/BlrjW9A7w+eC19zuSVZ5+psIP
	abs59w0RzGOJxTZL7jGvjGdZ5eB7JB7X/DK2DzF4WzKsAqao2Cgooko3mbP+HcEC6+MoXnhOvVq
	bfRO0DsQwy6zKhaj0giY0fzSrqUE2Y/9Ks704kcjjxwGlYG8TyEO8U57GWtbjhpFF9MFd
X-Gm-Gg: ASbGncswNKy5XIvRyWmDsam74oI2F7z37e5CV4A33f4z9lJh+B48q8uf4c3qNAAFjNS
	i/UgAcXa1R7DEIwUHCrat6B7knw8JIxhwZmATn2pGFtOYSrbFGYPquvg83oIXi2c65CxkHlY3zi
	5yZVSwkUOyqf5JD/R8EASGd3ebeUOYGwIwioZ5bgS+wQzvGQvx3yVMJlcm1vA+ASsF522CNCLJz
	8UhHyakMs9FdqSfaZ7VzMMD41Mh42Uo3HW6AVyiQ0pleqnxgJXLrLFgDAhAIBrXjbPycJRrVEZ7
	yx2RUoS7XcHhZtGAiYcGkrXVL2Bygqf4N99OLtFFcPcPOzvFpAjOF9Sds1cu
X-Received: by 2002:a17:903:1b45:b0:234:c2e7:a103 with SMTP id d9443c01a7336-23601d82e8bmr240817995ad.33.1749547099785;
        Tue, 10 Jun 2025 02:18:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtD01ys/IAJLoEmeaCTfMoHAoprVb/k5dZuU12KwjLOp6GW+Z8kpx3SnIZJJP7azlyc6ucSQ==
X-Received: by 2002:a17:903:1b45:b0:234:c2e7:a103 with SMTP id d9443c01a7336-23601d82e8bmr240817685ad.33.1749547099394;
        Tue, 10 Jun 2025 02:18:19 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603d14206sm66951195ad.34.2025.06.10.02.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:18:19 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8450-qrd: Flatten usb controller node
Date: Tue, 10 Jun 2025 14:48:05 +0530
Message-Id: <20250610091805.2997546-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610091805.2997546-1-krishna.kurapati@oss.qualcomm.com>
References: <20250610091805.2997546-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3MCBTYWx0ZWRfXxiG1RqmNROzO
 077bKxLYjm5V0VzpA85aD56wd274fDyvcKcdjGrMgG4bDSAOCXZExD5Csr7cKBUx9+jvbXzoM25
 VkRb94OXWeJkzLlfA9fMqUsIpxWdliiBHxTSeA4SDmMca2fDa6HHgS43Tpl2QKLH8U4uS7L/NoC
 NEWZVVY8ZuZ8X4f5LKmv6IvlV37etyBKTb3W/q0a8gFb2Qpn3JpzOjdIAvT40CSjP9siYYdv5rr
 mlyoRYxp4IhU6UhCGvnj499Z1WsOSC0ykEtPxznYA24vL1mY4wdFm8rt0j56Zmjx70wHmQ4GEbm
 QWTfP0S11ANW9cRpYU62Lv3MEUl/nMHk/N7at5Frzeu0w1nKLC1UxBJUx8a8a9Kwi8ZYmBmt7/G
 pn0Y0lRj+6GQwq3CPQ1OsExUNIRgpkgX5Dqwp44uxJ862qmCGEXfuFLua2umrVaez/Y24ZQo
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6847f85c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=gStOZqofneW8nAW_eEwA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: jxsLS7TsahD_m1MonbnomcWhNM4kTVeZ
X-Proofpoint-ORIG-GUID: jxsLS7TsahD_m1MonbnomcWhNM4kTVeZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=778
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100070

Flatten usb controller node and update to using latest bindings
and flattened driver approach.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 60 +++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
index 0580408485eb..bd6cb895b65b 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -500,19 +500,73 @@ &ufs_mem_phy {
 	vdda-pll-supply = <&vreg_l6b_1p2>;
 };
 
+/delete-node/ &usb_1_dwc3;
+
 &usb_1 {
-	status = "okay";
-};
+	compatible = "qcom,sm8450-dwc3", "qcom,snps-dwc3";
+	reg = <0x0 0x0a600000 0x0 0x10000>;
+
+	/delete-property/ ranges;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+			      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+			      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+			      <&pdc 14 IRQ_TYPE_LEVEL_HIGH>,
+			      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+			      <&pdc 17 IRQ_TYPE_EDGE_BOTH>;
+	interrupt-names = "dwc_usb3",
+			  "pwr_event",
+			  "hs_phy_irq",
+			  "dp_hs_phy_irq",
+			  "dm_hs_phy_irq",
+			  "ss_phy_irq";
+
+	iommus = <&apps_smmu 0x0 0x0>;
+
+	maximum-speed = "super-speed-plus";
+
+	phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+	phy-names = "usb2-phy", "usb3-phy";
+
+	snps,dis_u2_susphy_quirk;
+	snps,dis_enblslpm_quirk;
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
 
-&usb_1_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
+	wakeup-source;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			usb_1_dwc3_hs: endpoint {
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			usb_1_dwc3_ss: endpoint {
+			};
+		};
+	};
 };
 
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
+&usb_1_dwc3_ss {
+	remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
-- 
2.34.1


