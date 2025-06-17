Return-Path: <linux-arm-msm+bounces-61587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB84EADC996
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 13:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F869178AB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075D42E06ED;
	Tue, 17 Jun 2025 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pv2HGJLb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C3F2E06F4
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 11:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160322; cv=none; b=oLoFq42FFq2x22PAiUVUg+ZyzgzesiV+JvI/+XD/PInstJrE86tAeESsuxOK4p/uF06Zkd5vUPmQFFcyMLH3WjoJzr4sI+FeZDrATL6SuEORjrY90vUmBn3JR2Sw0ZyA0qFDjKvHdLoDClQM4fd/ZJqaPhz34ZpSl7GWZzAgLmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160322; c=relaxed/simple;
	bh=E1iCTcsS77v3G62P/uVyBrWR5kONQvXzXySre5an/lQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o4EPVL6FE0CQvCutgHjqOrlqxEA/86SzlERx1ZBghUN5LAi8DNCcMcV0oTK+Ic76NQGGLnih5gBbvbe1vkrOsT6tPvvSTFzj9BQqlhS+vp/SbDuALYrNjYr5wwnuDGRxf2oVPOLV+bgLQzWcYRirilS+o4cBydNKGMkGt8R27T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pv2HGJLb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H6G4rH007205
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 11:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cMz4Fnkw42dvFNGDnmgQxE1WfqY819g/Fp920zyfuTA=; b=Pv2HGJLb0ujpvUug
	aBY5StzqZyNFOhoEhNVyf6QJBjObmvdgiAfGiLGApPJCdDV5WOdIEjtbEi6dxiys
	bcHP0FR2RgmcsUlC1z/yd2kQojrKoJBR3xU/BaWuuBqaALFvo9m+j6nLindT2WA0
	/d+ZFvOA67G3r1dUw+ffR7DPQXV0GDyoQbSVA80rHPTba3T2w2t0qrZiMyZFxK7i
	tZyxHOZkvFwuoswI2mw9nIEHUnHWsIhBEwVyVK1lsgkdNkFDtF2HK0AIOkdtKq/Z
	2pNfFUFolikPcl/KHE7YJKGuQDcRkpJYa8sGfHMEFj1VA94rez1V9pXOwOO8ZAYj
	vBHnMg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791eng2nd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 11:38:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311b6d25163so4887129a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 04:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750160318; x=1750765118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMz4Fnkw42dvFNGDnmgQxE1WfqY819g/Fp920zyfuTA=;
        b=ATiA2BeMycEd/HdkDtW9SJK/iEZXor2WHCzgmAtz/7zozWLjmJ73sWHBeiQE7m7k1r
         y9YuzlkMSDOOcdhMmSYmOM5gF1qY+BRA29FwQxRuJ0Kea5N3dEcUXHpDaDDPH2om40/z
         cV92iWQAlE3VNZfW1ueh9lfzWKGUnI0Y9pjNYu5ptwvfmpwQqqG9xGj78Va0JmQQNUyY
         UgzeJjoabPZc/2Wceyluq6cnqSR8nuHPZkLvCEqtLVHYpx71WpfiVZWi6OibLXXxoBww
         ZSXy7GEnEjofOqkiJ+25eXSwhzQptGDVTGYWHTfno9TS7MUKJh8jNskcB6Q6hJthgnR0
         5ZFA==
X-Forwarded-Encrypted: i=1; AJvYcCWn+LHP3cGOCmfUiTKP16mWBtfY8v6DVIQGCeacu06z1LWIRZzy38XIHFHtiFxHAEghELaqLFnVwejMdET7@vger.kernel.org
X-Gm-Message-State: AOJu0YwMIXOBez+SuByUSxT+skmn47JovFI29YOMpBO3gHCTlc7kVCZK
	3rhVK+TqEgqC2pLtkrUN26if3mq4Pj7WsgokMGsVxmrRwnsRm0cVV+AS7XElyGPM3zetPAJLinU
	m6+pye3bI53icV+IjyTfd3JBEf4+Orhovl/JV4pX1BTkhGWq995ywtVXXdEEHy0820NDk
X-Gm-Gg: ASbGncvDPiHiqgX9KTPevooO33B3xOmk7V4d2x0EQMQbKpUMcF7YpNopqs+feNDfsq7
	ZbFjyx+LORMoAEW9udsJDMv6rV9vwDB9/grp0W5m4YNujIGrwleEdc7JzAdVmgfFzSMWofN38Ty
	UoQraZgV/yoRObszaOmlW8u1ieGSqG1GWSNpqRhQuTj5CMeej9CmhqTIOTJf6oxIA5NJ2BjiAHK
	gi3n2dQkkOJdIeGkUFFqc352MtRKvKYlLwmM9QmuY5lAyMuKghcxoHTTJfXZ/kFbD+1t1nPFwt6
	zJyFl9wsKLb8REr4n2ZeQmDhuVc8TtsoMFu7mFmVgtd0U54=
X-Received: by 2002:a17:90b:5241:b0:313:2754:5910 with SMTP id 98e67ed59e1d1-313f1cfa246mr21138943a91.15.1750160318207;
        Tue, 17 Jun 2025 04:38:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZvtNTDKTZTtHD5HPpQivCD86gJ7dk0yjfKZ6IrQ6RrlfuiDM/2UhTEwkTqMMtGqXo4L6SMg==
X-Received: by 2002:a17:90b:5241:b0:313:2754:5910 with SMTP id 98e67ed59e1d1-313f1cfa246mr21138909a91.15.1750160317775;
        Tue, 17 Jun 2025 04:38:37 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a1919sm78246895ad.66.2025.06.17.04.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 04:38:37 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Google-Original-From: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Date: Tue, 17 Jun 2025 17:08:20 +0530
Subject: [PATCH v5 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-update_phy-v5-2-2df83ed6a373@quicinc.com>
References: <20250617-update_phy-v5-0-2df83ed6a373@quicinc.com>
In-Reply-To: <20250617-update_phy-v5-0-2df83ed6a373@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com, Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750160301; l=1245;
 i=quic_msarkar@quicinc.com; s=20250423; h=from:subject:message-id;
 bh=LUKDegSuWnJr6hX0g+GfZVrGfuVOoWm4/cMbstjOQQ4=;
 b=D8AYtjEvErNGeC4xuDdT2pk3k6RbH1ce/6zGxI5y4AN2K27UNlF8f2EN+DErCWTaZe1HN8ays
 t+bojCYqqOUD8V1A53RcPVMw3LK4oKE7gy4wJuk5jG1ULyRbK/LeBLM
X-Developer-Key: i=quic_msarkar@quicinc.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-ORIG-GUID: wjKeNMEQVg3aZlDXmivf0ScMFOFTR2f4
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=685153bf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=A2jF9ndpTPISZJbatkMA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: wjKeNMEQVg3aZlDXmivf0ScMFOFTR2f4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA5MiBTYWx0ZWRfX3eR/12fPBayW
 o4PAjCl6hiUH3y3Znx2N+PQBuSd3o+B5M0nNEmzD6GXeRaN2B8tI5mdCFV/h6FxMzl+6KKiwC8Q
 96Sib0RQBR5XjVosXBf7VXK7linQKcC0j/HZGnH1/GegMCF/mpUe+bnz/1YqPlhSNfH5Hutze9n
 zpkxCq21ddrB8/1l7+6y56u7aqrDAqzn4N5s2YJCBy4/wU4pN+l7Xi5KVz2loinyVNWSNHSBFbR
 qdVRaH8b57HKlCtE7Lko4VePzD44xtLQ2xXNiUkRlLKMgxS5y6s/Ii3E7L6kBkqVBjr2H0Z+XAY
 P9qUJT5GHGVcswBOf+HM3sS5tlBT+i5iz1O5RrLiiihJJNqIZ0MH2tyTl9hwdPbLa9QRJbp2hEc
 eeQudQgzYREH33crhIiiVlVPpOZrggoaphG+K7aVxiA25Yrjl7jsHMvvPj9m7ev6Xg3WIcB+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=919 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170092

From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>

The maximum link speed was previously restricted to Gen3 due to the
absence of Gen4 equalization support in the driver.

As Gen4 equalization is already supported by the PCIe controller
driver, remove the max-link-speed property.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 5bd0c03476b143444543c68cd1c1d475c3302555..b001e9a30e863d8964219c8bd61bc328be71b256 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -6462,7 +6462,6 @@ pcie0_ep: pcie-ep@1c00000 {
 		power-domains = <&gcc PCIE_0_GDSC>;
 		phys = <&pcie0_phy>;
 		phy-names = "pciephy";
-		max-link-speed = <3>; /* FIXME: Limiting the Gen speed due to stability issues */
 		num-lanes = <2>;
 		linux,pci-domain = <0>;
 
@@ -6620,7 +6619,6 @@ pcie1_ep: pcie-ep@1c10000 {
 		power-domains = <&gcc PCIE_1_GDSC>;
 		phys = <&pcie1_phy>;
 		phy-names = "pciephy";
-		max-link-speed = <3>; /* FIXME: Limiting the Gen speed due to stability issues */
 		num-lanes = <4>;
 		linux,pci-domain = <1>;
 

-- 
2.25.1


