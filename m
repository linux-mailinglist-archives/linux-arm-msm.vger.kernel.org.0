Return-Path: <linux-arm-msm+bounces-68098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AB8B1E501
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 10:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA34816DCF2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 08:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5822741D1;
	Fri,  8 Aug 2025 08:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adC18uwO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC55527380C
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 08:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754643200; cv=none; b=ZFmIN7hDKGe0dFm9Bp2rkrsSoZtdvF0MJt3qPMF4NCfCBrts676yMoET+Lc14E6L8MwxvLoVU21U63Bo5O7HQoYqgjiUwNZZBtMOJJkFmGw5Mxl00Q504GV1BaYARRLjjrA2aA8PKXxeQaEOTXs+mizbERs0A/2ksGzgAY5LXAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754643200; c=relaxed/simple;
	bh=23E2L3+GM5Ne5G69gtx+iV/0DudIvZsRZTXNlVujEsM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VjI7K0IDy8pFx0xKs6ebQhdXyQ4KrvGemTj0RPwpJ+7yHw3L+JcvJ0kjVtnd3ipdSIEG9equUTg2zwUiQqGMeMy5efRvvck+xdZ6YM2chyF/zi587zp2m05dLaxMYKt393v4RFp79fbvNSA9eGnGFB47zIfttgyzswHppKuZ9oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adC18uwO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57877koJ018054
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 08:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WFXsE/Pq/OO
	0HhZLOEUiCFKFRSimd89W5kjcE0yBaHY=; b=adC18uwOjEKNRUPUah1X0XrBKjr
	NMGk48BH8w2E4P6CBLMFbfId64DCep6gma0n4suB7o8x5MFqKgvBJ7tprkP2OIc1
	9Dq+wrua2YBu3InDSjLx3SfeUuWf2n/MSIjzhvy5j02+0ufQkWXxSBFveb9uQDSa
	GfpagbISfmqGsHCKWXOIse2AkiDNm/9c+e9/9nwnql6FE7em9yQMbzcAEO7/zn35
	VA+tkoDSPQejKSvRSY7Zc56YtWUFvNbJK6Dua30py05449Ug/ErrBwQ+KVgtom6z
	4M30jB0Mx+U4ZlFk1Vh5FkJGe3tlh+ZLglc4jyfryzwR2r5C2EQqKy8X7Uw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c586eyc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 08:53:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b081b2a94cso64785801cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 01:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643196; x=1755247996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFXsE/Pq/OO0HhZLOEUiCFKFRSimd89W5kjcE0yBaHY=;
        b=jpL6cd1YU31NHpZY9RMMFpRrVDttbvD7LSmk5NC6iTij4r+6oMZr3UxRJoG0cu/eK6
         Q1f3n6OmkI3/eIBjyy9johsYBmIWZebg0hfpspJBMtKGgeYEsjzQbf1y0NhhbcrtGGl7
         QHE8rxiZw3W+64pQCVGVeOJOqQt08438NlcTePjkSmSWS2WNuscWEOlQwcj5ujrANRjP
         SFdlaBBzHqON6zIgz/QtS09F0QDaGsWBqRBbNLL5EMG9ayvoKob3OD0wy0ihbf7pHHse
         dQ0p9RzkyU1ONvwnzm3nwE2PpuIo+LxbEcSU6t1r9lxiKfISNEV0oAV7yQ5kacJxPwzp
         xUGw==
X-Gm-Message-State: AOJu0YxJWu1k9fGRBKIqA9Io9RlfFwvJWoKzfMZvTNLGZbX+Jqu8vbiv
	g36ZjD2XzcgatamQsnmWaAbk0DzMJALT3BCASw1+eEOHu5jrahXJK4ZiXxLYbyfJtQ82A6EJovs
	MC8EPGGcCWGI5HzICpL1gFXyYi3E7+uQ5T/IPt5UNNBkvdnN1YpoqvMvPaAIVm41ahxnF
X-Gm-Gg: ASbGncu/hvem7DFnGUAPR6OvdmkU4dXHE8fFSmEsfMSlfDW7dHbGWYtNULs5sS1HjrG
	6EZkFtj1pFQFYm/e88lhKplTmUqvMCQmCQ+jZthKOV/CX66S6wvE2oxvyzZf3AgMt0yjyIeqPlb
	2ZImLt2pMLk6tCiU/WrMGS3KwgvwZ9bVX3uPHKXgCqUau3fuhvScMpW2iC7jGWuuw9JTJlKDKHX
	G5VT6cZ1bGcSsfg6l7btSgNkoVgVXupu6RstcEqHQN9dG0mbxEBF0PBrAeirpC8kG61BbEUX2pr
	Fz16vtvuSyDFAp8ngYvGTP/+XR0fa9cJF5FGYTGPo38AF9M47SEtxs62+TwJR4EepPdEv/HPc9k
	RMObwaobfJf6f
X-Received: by 2002:ac8:5701:0:b0:4b0:658e:bd88 with SMTP id d75a77b69052e-4b0aec6135cmr42498181cf.7.1754643195909;
        Fri, 08 Aug 2025 01:53:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIyBTkjW23ZduxStuoNxrstWFgHDzUxrr3Q04wuEvn2ojWkOcLrw597Hn/gTfb6Ox2Lqtjpw==
X-Received: by 2002:ac8:5701:0:b0:4b0:658e:bd88 with SMTP id d75a77b69052e-4b0aec6135cmr42497361cf.7.1754643195415;
        Fri, 08 Aug 2025 01:53:15 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5e99e04sm123818745e9.11.2025.08.08.01.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:53:14 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 7/8] arm64: dts: qcom: qcm2290: Add Venus video node
Date: Fri,  8 Aug 2025 10:52:59 +0200
Message-Id: <20250808085300.1403570-8-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
References: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WJW0aZyqwgvd0gmtuI7k6z6J4Utbulbx
X-Authority-Analysis: v=2.4 cv=MZpsu4/f c=1 sm=1 tr=0 ts=6895bafc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=KD12_Wl4P5iJQNenjFgA:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WJW0aZyqwgvd0gmtuI7k6z6J4Utbulbx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfXzudao9nrEAV8
 gUnUvQyo4iAF0EB6ExZPcJ37osiI1156dwcizQTBBclU3Or6/WhLcEHm3jdkuVdPNTpx+5WatsP
 d7xSkHqEmSQO+u97OEWDTbqPF+s9ywIgSy7NThVxOEeDDgUR2NefDbOrX2rdHbPveA0r1smyToD
 yHRHpWK4rc4RMULVyEPgmfXWxWATd/qZOtqbIqAf0dLRYCQ6i8KLgvFPexFdM2460uVrOlToKjQ
 vJDcLO03BqEXnE6dDlzJAlnk9ntGNtMGRIs0HBPiOe0nitDeVXhVFX4mhnDvUROQ4AVjQffuqKx
 h6bkHsv6V8Tgj55es+BMcHzn6YR1+snTBXUGWLHgq5IDrIpEFJYE7nuQFiUiBTmsnIF6Eg2kKBY
 c9/QsqDQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060064

Add DT entries for the qcm2290 Venus encoder/decoder.

Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 55 +++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f49ac1c1f8a3..7cfacd189a10 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1628,6 +1628,61 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		venus: video-codec@5a00000 {
+			compatible = "qcom,qcm2290-venus";
+			reg = <0 0x5a00000 0 0xf0000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "throttle",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			memory-region = <&pil_video_mem>;
+			iommus = <&apps_smmu 0x860 0x0>,
+				 <&apps_smmu 0x880 0x0>,
+				 <&apps_smmu 0x861 0x04>,
+				 <&apps_smmu 0x863 0x0>,
+				 <&apps_smmu 0x804 0xe0>;
+
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
+					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133333333 {
+					opp-hz = /bits/ 64 <133333333>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;
-- 
2.34.1


