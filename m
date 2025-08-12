Return-Path: <linux-arm-msm+bounces-68641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC99B21C58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 06:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1538164469
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 04:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCDA2D781F;
	Tue, 12 Aug 2025 04:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jBvPM3Vu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D6F217736
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 04:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754974346; cv=none; b=AZQwmVPOQB0GdHuyAV22UbqEyptV0/hiBPX0/a0hKdGF9I5lHAfkAUXvWrvQ1sgZ2QDuF+/b2ytYI0j8qkoKZlCLo611/afd8FmxMmfMeu7NUt33lzZGuQKkCeZvY3BQrdiipRm58ETUUoNHQ6D6U9S1CppbwSITJDaF+F8+REc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754974346; c=relaxed/simple;
	bh=keOPTciquSA4p02WljqtBMUoteLbhLVc28UUhuCOfQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Rdhw/zhnLUjUYBVs7L1QO7BuE3VYXQLPora+LINewUKZs2vsPkyl9iIjC844Y1lrrLpoNJ380caZxrxAAbhPGtRJTmGXPULqT2YdBF7zVVBHBr/WOnU6Bh2tDzY3HaydaSR/B027wlOCjjQ5ajzwAgHRfUoUVKiZYzPb3kw9+0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jBvPM3Vu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BGf6wf021869
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 04:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+v4I7Q97HUADgUFEs7f+Pr
	vptjZ+glS7epDTdSXOiqg=; b=jBvPM3Vu1VjtJdQobzKFG7MI/v9r+tEpgbwJ39
	4QurPij0Bgg4x//SHrPCOGWEPkBFhnI7irTVKeg+EoQ2UnrK5X+4xlc0XDLM5x39
	lxgLucTfNJ6/2Slc1b2T8c1N/mOtU3RZSG5yit1Ho5XTngpcPwTOznfhyeO0Xf3Q
	VQCnpXYn+sAIuy54iTPyz9c0oaV2HjUdiiPAD7pIg1hnRkItQVupoZWD9saQmAFw
	IYiw/IEbVw7waIdsFxSiMWOVGXZ4w41V19qusjkq6oULlRFMhajGzhr2MYZu0Tks
	RM5ayBIOPXmFwoqf41qfuOSI501PEYcHNW1N5i0Q4mvjLFfg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj46st8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 04:52:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-242fe34add1so4258915ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 21:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754974343; x=1755579143;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+v4I7Q97HUADgUFEs7f+PrvptjZ+glS7epDTdSXOiqg=;
        b=wvXnkj4vdSSfRdkkXZhIxPj4hdoo3IXU/1T8HLY9uJ9WftnevSLMryXofaxXzehFIA
         eb75nmw9Tykmba/Xwjeu3BRykna2D7kJ1HLAH4hgM1bhkINdGi0B0zRDNNZPWZStryFS
         +3WbYCmwmn3K2aid0icf7y+PkUDr8RObb5I4IRdKxnnNJSOUM34R7sHMgxWEOHQwAlCA
         nj9xuZBoMty54V4JdBoZM3HKGrU+DT57qfNcUOfiijmU2DkI3hcxaAPjSgSHXlh4+TDJ
         QKvopBY4Og7Ykh++QgIM7vOK+U/KipefVdUrRpjq1LnTv+4Ol1c1O84ia+b1Cz4aPMgF
         QUVw==
X-Gm-Message-State: AOJu0Yx6agSZkeERmnKfm1WXZS2Bue5RWY136/OTt2EO7aJTv1ZJMG3i
	oEtosI3TWD4Sz2bYu9vQ507rwt7/UmPw5pI2qnWQ6Sa3vpUd+by59S1LFaiuYUNbC/gWjhRh4bD
	fekEsSLkCW2f8puLBAoPuVkyZTM9zd3N9P1rzFwrR/PRZqsgTx2sGy7BEZ0cVLq5i8UoUhT7QVg
	pj
X-Gm-Gg: ASbGncstFsV/3FbRlL0mHpreoZWtAN1SJM3LELLSUGsLSEth3r85rSs3vMNAyzMjKuK
	OES8cIwqWpjsm9Og8qktSQa5vLF5uo6a1HXm0zVprGbjbpVd4VQ5I6ln/UNwbZMzcj3IcojZEpu
	gdtb00alrrtBZahTR9fDxEG1teG2zbfRu4i3vymg7yVQQDb/thbGFB70H1lYGqK/uN8v9PctkZD
	4oy0ciSEDRTp8h6vqqw/flWy1hjMcuXHMPF7QnZx5/+Er+pPBQfxd/jigUz2PQa1L1zzhHFE42M
	V+f5MUGu/dplKjPe+l4IK56tmO+6pFt4xnTVRSpcC07Yo7JML4A9Une6tcEFEhsR9ywVs/m8SGd
	iNFgkgv2MvgyGODI2Uft6lNICxJJiL7xE9ruUp81ESlR0MSdnca98F+laiYaXXQDy83RnQbb2+u
	k=
X-Received: by 2002:a17:902:f68d:b0:242:bfdd:4100 with SMTP id d9443c01a7336-242fc360a3emr32943435ad.47.1754974343237;
        Mon, 11 Aug 2025 21:52:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqjilSokN8Xz2NAcRSfcsKgGxkpfgvqLlIxZzpG/SVEk/p7hxnKUIR/MkpuiGK/RhwX+PDog==
X-Received: by 2002:a17:902:f68d:b0:242:bfdd:4100 with SMTP id d9443c01a7336-242fc360a3emr32943185ad.47.1754974342791;
        Mon, 11 Aug 2025 21:52:22 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0fb4asm285629825ad.60.2025.08.11.21.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 21:52:22 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 10:22:12 +0530
Subject: [PATCH v2] arm64: dts: qcom: ipq5424: Add reserved memory for TF-A
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-atf-reserved-mem-v2-1-1adb94a998c1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHvImmgC/2WMSwrCMBQAr1Le2lfya4yuvIe4SNsXGzBNTWoQS
 u9ucOPCzcAsZjbIlDxlODcbJCo++zhXEYcGhsnOd0I/VgfBRMcMF2hXh4lqVWjEQAF7J40hqbU
 7dlCzJZHz7+/yeqvuUgy4Tonsb6SF+h8VjhyV7PlJMRKmk5eYc/t82ccQQ2grYN8/4gxa/bEAA
 AA=
X-Change-ID: 20250812-atf-reserved-mem-bf388e366f75
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vignesh Viswanathan <quic_viswanat@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754974339; l=1582;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=DowvsxMqe7mQ1mJ78TGuzzaLzFMh0ArYDeyQ3gsV86g=;
 b=Us7HCWkCJWg1rKiAlWkEPrhYZ3A0uFb62a2GPp7wbYMVnT2K0mPgrk6ElVKisAxiKueMPmGDV
 umvXTqIw5+kDzHGQVsGxxoidUXkrp+81ix+Oz2p8wVOUu2/iirh/Mql
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX2vwIvSLe82An
 sP1NU+PGdd3eHz7ECrEKzhrJ3ehqwBM4P1OL4bLMRp28ZSPb+LQfzZKU2dMiN83mWFjQMnb3jPG
 LdDKOTvntCM7nt/6OOnE4w4NqcHFt9M+qWYF8QFPXiEkPZl3L3MbpfnFYHtbfmrrdBib7DvTUr/
 9Solyvb5qY3fAeI5VcxVJB7jAAjDSn1cIbDLqZziLHmiFO2eDeQ+YEkQtQhPSN4mkGEsCcicGnG
 7s/Dk3TNyr6sCqWrFQZIocmD5mTP5dWqy3Ejq034iEOG9NkillOxlFQ/yuTQDGed8DHNpuXo6zt
 8Lhpk61H26rY9zUSt7Lj1X6LjVrL4QZOWpwxwTDyP4El0NSgkv6oCbgvdjvWtLZ1Ei+6SSaa89d
 OMJoLwVF
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689ac888 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=LHHpOU43DGDhQHPplI0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Tv4fJOG-n9PJVALpqQUVA4PTX7CD3Nij
X-Proofpoint-GUID: Tv4fJOG-n9PJVALpqQUVA4PTX7CD3Nij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027

From: Vignesh Viswanathan <quic_viswanat@quicinc.com>

IPQ5424 supports both TZ and TF-A as secure software options and various
DDR sizes. In most cases, TF-A or TZ is loaded at the same memory
location, but in the 256MB DDR configuration TF-A is loaded at a different
region.

So, add the reserved memory node for TF-A and keep it disabled by default.
During bootup, U-Boot will detect which secure software is running and
enable or disable the node accordingly.

Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
- Rebased on next-20250812
- Picked up R-b tag
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20250624-atf-reserved-mem-v1-1-43b1940e2853@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 2eea8a078595103ca2d3912f41e3594820b52771..e31e328bdf0e9aaaec3019e5a7bd71c7126e5fa8 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -163,6 +163,12 @@ smem@8a800000 {
 
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		tfa@8a832000 {
+			reg = <0x0 0x8a832000 0x0 0x7d000>;
+			no-map;
+			status = "disabled";
+		};
 	};
 
 	soc@0 {

---
base-commit: 2674d1eadaa2fd3a918dfcdb6d0bb49efe8a8bb9
change-id: 20250812-atf-reserved-mem-bf388e366f75

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


