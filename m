Return-Path: <linux-arm-msm+bounces-61558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D294AADC5BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B6501897F60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8993C2951CA;
	Tue, 17 Jun 2025 09:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePN/lwWM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93F2293C6E
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 09:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151245; cv=none; b=ZzS+hbWYuc9LMWDG9u5AfxR6N0849RtJ2B3+DNiSR5nPQIXR52oTGCXWnvHDyx8v7snirSJulJ521HvQ0O8LicMI11QmFQD03URkkDgjljR/IXO9wpF7nL4ZvLxeRLbvoE6O/6ziBFiEJSaxXNCcupTm3ENU0W2Jb7CAz3gWnQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151245; c=relaxed/simple;
	bh=HpCmu2Xxf2CKasxkFlZBU3mNBTm4LYqEUU50Qj7bYcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ri7yvvAhl9zjeArTNljPzV0flh4127NawVqnG793Ws62PBy5DtiOU4izm+ASf+yU7DDg/qLDkkXxmpK7hYUU59FfYiJ44HidROnlX5B4gdnjTEh346RV/vMlRtkQRqfikfsqUZ1fkjjzMd8kMjheU7aJwYPdtTnPDRKrstSOuf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePN/lwWM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H6bPLv019473
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 09:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=v8VxgZncMLU
	vweLJo/cjubLjIJAD9fPEBEdpFY84mSg=; b=ePN/lwWM+0vp1Sjida6wPoRuxmP
	HlfzCkLq4oNI37xybN080wnV5zG9jmOtYKyeKkjw8xMvPOpmx+NZP6EY11BaaU4y
	MZyuuxHxsxlMWfyPPUKWiCUHep8MwhUtp72hGESkT/9b/RKh6AsUjM7sADh9tvnM
	fi6TOceDMlFr49iwCyZv4qmJ3nq8/ZX2V7zrX9K1s+DJh2cIgQuuZFLthquJsyIS
	9SfC6BtBjPvI+sTayGmIwBUKqItza0P3X/VmQrMKs61EmibszUG+VhV/x3OMGCvf
	ZYsybNqPTLAkErosO3qsVsLDdLKw+cM6w4WYsqwChK9/bfIYlJ/MGh7Dq5Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h97mvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 09:07:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b26e6b84a31so3568984a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 02:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151242; x=1750756042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8VxgZncMLUvweLJo/cjubLjIJAD9fPEBEdpFY84mSg=;
        b=SNe6Q47TryJK2cRv+hsJqT3datvetMq5TQL/FHCPfYTgMzs/THxu2QT5EFVi/V5Mkl
         5C51cqavwFUIOp5xqtkbGTwJSpX/7IAO1tC9s123o5GCFGHKyvRpRYKl/seMlMP66GQo
         ZAP/zKJ//h2ufPP0k87iV0BEeouS8VZO40ftUAy6F/Z/DwQfkoYJMgxuQgbs1C2ENJY6
         RONo1mJbiKkpMy+O/jiGMRy6gnJVIJDEeohp4XGsFwnsmI/qkPqKg/wyf61m7BrkTnN+
         MAzOUlRZ0nft/uYtbUuJFTLF5Xke5Ra5Emj5g9ruS8uFAzxBUb7mK2ne+yuC8V9SAyD7
         WteA==
X-Forwarded-Encrypted: i=1; AJvYcCUXEFZt9i3pLBPghRABdbKvdj8iX7F5EYqH09l31EkcULvnEkRVkc3/saQgAxMIiX7WURkBzWNkj6+u4j2R@vger.kernel.org
X-Gm-Message-State: AOJu0YyQYkVWei45oXacCh8EdoernXkfVWBnvcjXWMp+TCRtEUoWdnb7
	XlGynxgXMQkg2ymGHHofNgElNJHmsnmbti8Z7K4wzpVw0XbeHUPNbFfJnKPoRiejbk142mYcqyN
	nYl+DldbpK05rDTWx3cfLYQCQh2b27VNxe1VCZ1h4w4ySeSgZOKnPV3VjVarg39/dy+qX
X-Gm-Gg: ASbGncvtTUASHB1Bqw/K0QbOHsidFT+19dplolG0f80VJ57NrWzFQ928LlYjflH80VZ
	kK3E8OY9M2hzSbdO58sPJ6LxsQLasK13betXRzJXgL2id8D+hXx2yHbna311JlOiz4W4b+509Bw
	hnW0kuvdU9NQKAoxXbK3rw1OHMMIrOy8XumzlBsymh9uTICyZXSCYXZvc5gudW2otEaO7MKxGub
	X6PBhJVqrA2EpquFdfMq2FD5jC4Cy9UhvHYRDRXBSzJR0HxOGoZ/jtYe+66Dez0S7g/vBV3QTWk
	eRRGeW1JsPQQkYohCHi4DBhwUFoBJP/dHI8gPMRU3HR15KxZYX27ze0r5LtCLA==
X-Received: by 2002:a17:903:19cf:b0:234:d7b2:2ac4 with SMTP id d9443c01a7336-2366b00629cmr200740515ad.17.1750151241750;
        Tue, 17 Jun 2025 02:07:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQFcFoHfGO2OG62bjBmAIXOgg3ajRa+GMsZLmM5oo1I6OCeOlHJ67+7+KcYPcabd8OdkgVsg==
X-Received: by 2002:a17:903:19cf:b0:234:d7b2:2ac4 with SMTP id d9443c01a7336-2366b00629cmr200739995ad.17.1750151241328;
        Tue, 17 Jun 2025 02:07:21 -0700 (PDT)
Received: from cb9a88ed5d41.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bdb39bsm10017370a91.20.2025.06.17.02.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:07:21 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Mike Tiption <mdtipton@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: qcs8300: Add EPSS l3 interconnect provider node
Date: Tue, 17 Jun 2025 09:06:51 +0000
Message-ID: <20250617090651.55-4-raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617090651.55-1-raviteja.laggyshetty@oss.qualcomm.com>
References: <20250617090651.55-1-raviteja.laggyshetty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8NnjK2Q4cwKkAG_OVT-51NItzzZYUbaL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA3MyBTYWx0ZWRfX+pNSB/y2CRmP
 mkQB2b6OUFFihQcLECKNaG6HR3kVXsXVOCb4Bc9c8tLm4lUdtzjKkuw1w9dUEcTIN8PB2YaQVzA
 8Evi8UBXxof4BweOpvHYfceQp/ZHKe/GXhX9xu0atWeAfr7D1e11GOEA5U0j/ofydQdjkRC/I7L
 YrUFcRQ87TEo+cFapb6OWYGp+zF7jmREBuJ+NmZaCdzTsvB6Tjr+ye2m2f4cmJUGQcayu5bmvp4
 v8bQEfiFxMvSQodi7aBshz2mwp58hxmCrff8Q1g/omKPCD3KcFYfSKWmzbVZgyQtRp/pPCPKcNF
 iDfKYUu8rwgULx2y122W9WsUQPFnmzqlJgtNZiSEUz6JifqwM+1MsKzSPzWrJKEHmm2XI8fligP
 /KBJSJkAIjoROcKpopXxp8rpUxINfdz4YU10Zaxib7riusQxWE/LXtTlb9h4xE26Hl6zJRKW
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=6851304b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=pcgX-mRZKd7nGorDqcQA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 8NnjK2Q4cwKkAG_OVT-51NItzzZYUbaL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170073

Add Epoch Subsystem (EPSS) L3 interconnect provider node for QCS8300 SoC.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 7ada029c32c1..e056b3af21d5 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
@@ -5433,6 +5434,14 @@ rpmhpd_opp_turbo_l1: opp-9 {
 			};
 		};
 
+		epss_l3_cl0: interconnect@18590000 {
+			compatible = "qcom,qcs8300-epss-l3", "qcom,epss-l3";
+				reg = <0x0 0x18590000 0x0 0x1000>;
+				clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
+				clock-names = "xo", "alternate";
+				#interconnect-cells = <1>;
+		};
+
 		cpufreq_hw: cpufreq@18591000 {
 			compatible = "qcom,qcs8300-cpufreq-epss", "qcom,cpufreq-epss";
 			reg = <0x0 0x18591000 0x0 0x1000>,
@@ -5455,6 +5464,14 @@ cpufreq_hw: cpufreq@18591000 {
 			#freq-domain-cells = <1>;
 		};
 
+		epss_l3_cl1: interconnect@18592000 {
+			compatible = "qcom,qcs8300-epss-l3", "qcom,epss-l3";
+				reg = <0x0 0x18592000 0x0 0x1000>;
+				clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
+				clock-names = "xo", "alternate";
+				#interconnect-cells = <1>;
+		};
+
 		remoteproc_gpdsp: remoteproc@20c00000 {
 			compatible = "qcom,qcs8300-gpdsp-pas", "qcom,sa8775p-gpdsp0-pas";
 			reg = <0x0 0x20c00000 0x0 0x10000>;
-- 
2.43.0


