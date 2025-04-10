Return-Path: <linux-arm-msm+bounces-53744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E090DA835CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 03:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0E22461067
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 01:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6AA18A6C4;
	Thu, 10 Apr 2025 01:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="paeU4x0r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52AC1BCA0E
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 01:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744248852; cv=none; b=Khn+aOiIGi22VqmUtwaLV1+CryHsYvaqvovcdVRM2xmsJenKbx2GPUhqdZrl1jKjzMq8DEQcRNEI7VmtsrDPc4tDdow1S8zPjG0mxvGxG6o1Lk12kf2Ou3Is3d+ZFdviHB5nBCXnq6sn19i6yDWbMDTTQGcMs0qKrBRLXWjyLE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744248852; c=relaxed/simple;
	bh=+EADU4VGExLgeSXK4lwo+fjfE4pV2JIAzUIFT8TnNTw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PT8iDJQiVhf/22L5/kOiYbxYZCUb+OVpOyV/799hlUhHcHunh0fONVHNd5dGpxyIiUbhyJRDA4AxwY8+Y2Nt6Bnky0MKsUk70Lcao3Sd+KAVFKHjc+BLRx+EX3iEePcvG8CR/A6rfrO0e+YFEoCICkOFxvCVAJzH+baGgyyhp/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=paeU4x0r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HF02V004679
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 01:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y+3FfrSNBC0
	rnW/pbZ1shOcvb9E0aupV7QcxaMUAHKc=; b=paeU4x0rLxrFhPoGJrczRk4OJ2y
	Pkw0tFRnIMmEg5h/98A/+VlOhzFrX52SRBH18x5nchp3RFQ2B6ceiKBxxrkBq3bv
	mBNbC/10Fbx6Y57QLE6fggGW7O3fEZVrunIUVkCI8+H/VIOTaKGrRv0Eq5W8JVqt
	ifqzInGkFFmSsVlArb3+7HNHrH7NlDrN4EzoquEdTTSonuwXqeARbbP7+yC6kQKW
	zuk6e/EsrtRLEx1Kf1ZnntZAF54mag1bU0er2pGZXcXPHDqiWWVlM5AXkinFuts0
	hvRMU8amlUKkS/qs/G6ZByeg5ax9+DBHa21vRRCLcnU02boa0P7HvJtWOOQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb5an6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 01:34:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff8119b436so227648a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 18:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744248849; x=1744853649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+3FfrSNBC0rnW/pbZ1shOcvb9E0aupV7QcxaMUAHKc=;
        b=bGB5ohAvlZN09ad45pJlMJ/fOrkn0s22/3nEW2rIFlBp8sZTLZrE2n/sUUXR41Jc8y
         tg2NF49MX/4oDKGSnKPa4NiPUcqnMr7OGeBcmMSwinXc/xI4c3HTDuYIX8t2B3wwop1R
         P+2e0jy+uTvzPBzIeZwnKVY0mptWRsriQLasLW2458rHTs7pFGsGW4hCCorvDJT99CSj
         WUvviRmU1bIKCVsD+QLELEhPuVsV+uLmeElgGvAgtCOib6MqDqz5DcCukHcoBDUv/Kml
         sZ+xVj4xBZ5/ZOAG0VOuRWjvw2zYBv+efrj0hmdct9M5OsS2+nlTeMw1xPpQ9CbQbUXj
         XHTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRuQINV/V7YEeldxb1UumkiNK4vb/XqV9cZ6NPGFy7T/sIRE5N3qrMV46A+vpUMwsdHTqShwZWw6kwUCAQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Hh6DT7FjVGql2UNgRgAJgDv0RsRX6vnRTXkKR8Nhq1Saugrq
	nh232DPqLjmKGkU69oqvr8MEyr7DiHbsvDhVh59xjY6dWmDPMhShwYSqKNKa1gZ0dx1hzygMBVT
	racGo8G1ZnMsHooR/Afp8hJFbEX4NhYTCIkBFuSE+nzguNKQsAjoMzNsvggEAnfwM
X-Gm-Gg: ASbGnct2LTBnppfdys28hweyE7/oVdP5oRUzkvbMzrLap87+OtUATyAOmkVr4P0htt3
	TD+W9slIoy0hfUTH1w7eb5LxHwW9oc/g0weT+It1XRjzgGVgzj2JbnsKTskScsRKJeaWZrUl8H+
	A3VuDLZBXF8twXoWZ4S3RW0bHmeZ9JgqDewtHT4kDWSSrBeyd/vzMUH+rCrGqp2M7ppkVBMuWaC
	rDEiigZiebEP73S6CdRvoLrbXAtUqQQf/N/cYQkfAJhfDkebTdCxthHpW3NQJCjgA5cH3Xg99Pp
	MdDC606a35m2tfpbqHnXEiq/cQP+W8lpASwaLP6ScHpo86eEbgbpCdIjyR1TcB0eUePFzU4=
X-Received: by 2002:a17:90b:270b:b0:2ee:d7d3:3019 with SMTP id 98e67ed59e1d1-307e5972f0fmr1174651a91.12.1744248849115;
        Wed, 09 Apr 2025 18:34:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7MCKoesf/io0c1ClAVPtM1es5MKBzBPeISdJZK2T+emvkEbwBgOvPufDeyPNVn4pVjc0MKg==
X-Received: by 2002:a17:90b:270b:b0:2ee:d7d3:3019 with SMTP id 98e67ed59e1d1-307e5972f0fmr1174618a91.12.1744248848735;
        Wed, 09 Apr 2025 18:34:08 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb596sm18801815ad.220.2025.04.09.18.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 18:34:08 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 5/5] arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
Date: Thu, 10 Apr 2025 09:33:30 +0800
Message-Id: <20250410013330.3609482-6-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jUUR-TTrTzaAOdhg9frxgkmXVjljXXcj
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f72012 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=wB5yJZRArZ6K3lEFQq8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: jUUR-TTrTzaAOdhg9frxgkmXVjljXXcj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=752 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100009

Add interrupts to enable byte-cntr function for TMC ETR devices.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index a904960359d7..b091e941aa21 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2427,6 +2427,11 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "etr0",
+					  "etr1";
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.34.1


