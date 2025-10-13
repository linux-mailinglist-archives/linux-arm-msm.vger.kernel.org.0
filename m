Return-Path: <linux-arm-msm+bounces-76995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4F5BD2A99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC608189C4EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93537306B09;
	Mon, 13 Oct 2025 10:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OurtDfbJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BDD3064BA
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760352851; cv=none; b=CnLIsq07Wa2f3F3C+DHs4EG70bpRcmDl6Nc+U5Lf644LhA4z/3S3UQFcVTlHanlcXGDK72JzOocWrJ95J9CUIngCShdIsm2nU7xHOetFFNna2jxyc4LZK900hmjKXDMu0Qmr6QMhq/iJnow+PmkhZ4RtINhOAlKm1b1xFAqdXXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760352851; c=relaxed/simple;
	bh=zyQNUwXn+YCw1NiWz2KzbTMHzKmDdLyqHONjJeYldj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yvg25ArFRrqt6dFFE2o0gQ1nCnW8zHMW5QcP0zNMztF8Ultu62ureOggK6jxKkB7eyPtxgCd/t8sJ+kDcXSRg5kf0D8w1L+WVxsYVCAKJ1RT22og2vtYjes4FnGHaeD7dplzBI7newJ2UfPg/MtZyoXq/9AyW9c5IwINMvAlDUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OurtDfbJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DABYIg016699
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i7a5MTWxmvi3XHfiDstUA9h/EtTQ90XBtsX+f0facCs=; b=OurtDfbJmJn7G0mE
	I9Y+5JJmUWMGgdYX90/xiHq1zB14B/g3sFtxwOJ3RwI0NVsKNCk1rx7ghnrMLQvU
	AdVScQTU01e6UzPD+Q8G8gPhu7eWL2pmI/Ek1LbXxJhQwbiRRF2vTinSqj9adZOc
	ydjd6mcH5tlcxekad9C1bPPXYEUc2rHg7qMpELfn53lOjagED6jOxS8eM/sFgqIJ
	JCELOuf5pbxqHY4/Zlu/uZEJYIjfgLD8+wnN0IftrfTCqOd3/0WxVo5Rmaidud4Q
	X4I3946g3XIN8I8K5fq/hGRAp9KQBaH1VUsYSNBO6eCwrxiz5+/bjF3qu2cV6/t3
	xZuzAw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbhva66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:54:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3352a336ee1so17043899a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 03:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760352847; x=1760957647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7a5MTWxmvi3XHfiDstUA9h/EtTQ90XBtsX+f0facCs=;
        b=wBfm5WVl8j5Y5VNtJYhSRDj4Ehg4k2hJEpOUu5ushtF0Cj4JCq4o5iLiD3hlobbG93
         dZqMuugcxIfnhA2E5YUdttLlZdw5ZNH/D/YcMeU1ErAh633TJo+cqyVhfNNrvW9kOIpD
         iDzkTgoIR+QhswlJ0HnUtLlyEukXL0r9N94p6KKAzADlxyIAfs7Gur+5qQvWlxU8m4aS
         OXGGn3vqHKOKCOrMq712WGuytmVeQRmcq+2VKEs1OYjW85etwyS70eU4x99FAqRs9ssE
         FnF/C89GQPxrE9q5j6BIhZjcdfTkDLSK0Bd0rFjTJeCweu4t6Xz6+2bvxiyfJxlv0S70
         MZHw==
X-Forwarded-Encrypted: i=1; AJvYcCVJk1PX4h4NKtCrBH6d/t7WYeT/A6UGYjmXRJtvFARULdWxUrXeYPj7AwzN6skUZCmjXcdrlTrJszA4hstJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwyRW9yxaOYTL4ZngNRm8HS1cil09AJ2rApzBUl0ZXn50dkx/qD
	lDvqTTC24JTDsvJ/0K6KUSsOKBGw0fj7vOT2A227d+Pt8xpO9LSpPHiL4BKffaK3dwKqdrbJKJO
	rI0/KKaZs8IqW91emz2MffBoVakoUvretfyqxfbYXHpekCmjxBGKEHIjDpj+raShSrwBK
X-Gm-Gg: ASbGncsyrZTtMuRE/oSAvT8wa0TSf6Cp14+2TpIUkXs4vA19VphLYR39SUW38qIrpuS
	IvU6EnfAMf2xg6EESXJfU1CMTgAt3t+vcdV0Kbeu6KJubyRKBEUsf2mpkDTdI9poV18jv0WeqZH
	DPtc65ixKCJ0my0cAMltSW9i59EDs4h/TQekhFx+E/R+ep/3QvE1ex/xKMhxFGITLkwtanWbPZj
	Wu7KIeHFKMb8V2LK4iEA2eHstENTRMY8nB95MWrfFLICzpIKElDHZjMn5Hxxvq0w/P4BJryN2Vx
	ItPPLPG4FHkHjocsy6YPNOvF8sC5IqoRtYkGYU3Q37S888u9UxqqhtjIqApBzDptlp+DiAZ0DRU
	=
X-Received: by 2002:a17:90b:1e0a:b0:339:9f7d:92d4 with SMTP id 98e67ed59e1d1-33b51110ef7mr28806950a91.9.1760352847159;
        Mon, 13 Oct 2025 03:54:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgRMJ+7K8YTL8id+HqQG26nT2LHUMUcyjIqS6elWn7IDUMbrcaXna2wmd70NXIrZ//ptwSDA==
X-Received: by 2002:a17:90b:1e0a:b0:339:9f7d:92d4 with SMTP id 98e67ed59e1d1-33b51110ef7mr28806920a91.9.1760352846649;
        Mon, 13 Oct 2025 03:54:06 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626403desm11662295a91.7.2025.10.13.03.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:54:06 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:23:30 +0530
Subject: [PATCH v5 3/5] arm64: dts: qcom: sm8650: Add opp-level to indicate
 PCIe data rates
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-opp_pcie-v5-3-eb64db2b4bd3@oss.qualcomm.com>
References: <20251013-opp_pcie-v5-0-eb64db2b4bd3@oss.qualcomm.com>
In-Reply-To: <20251013-opp_pcie-v5-0-eb64db2b4bd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760352825; l=4818;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=zyQNUwXn+YCw1NiWz2KzbTMHzKmDdLyqHONjJeYldj8=;
 b=Xq7E3mW0MADg2b/YJ48xGeqRlGPOJorM141r+oyVNujfNESx+p44bJQrZnLWpyP+MyJTsL3xS
 ifiDm/PnCobC0SSC/TgRVc1GoLl4CERYyyUfbrHumJaJ4yjjQMR4rks
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX3mdWdRWdyOyl
 gZ1WLZkB+ci5wGHtPswNNAZXvEYtKALXwJZeepNP0oaXkuUg8+HWuX14hnJZDnFz7BzPZC7GfBh
 uvrcD5R20VXJmYvAR8bHNla3mUHW4Cl0LdV3vvHgFoT7iq7+kWXFEi8z0+nP56RxFwUh8I7YPJt
 aRyqVnrPIpk2hdNkQurVACOOARti0MiCIN2gxKVN2+QwGEfXybW6GlmuDPK7qPtxavghn+qXpLQ
 1E0QJ/RLR3Vjj0iLjrWIqSPRlir3t6OD22idUAFRGKyPZifVyiGU5VpRK7wfV7o62OFX9gVUT2U
 jhAnrtA1gzYGoLtP5LTyOJ5k0V+TAfu2hy3hU24vrpVIr7ztCn+77LEdLg5aFj1bwpo60ewLcSE
 UTBzbrIFU9opVQfY+1UhiJ+3ynQRJw==
X-Proofpoint-ORIG-GUID: 5FssG_nbP8FStPkDEMaaaUQNCdL728dn
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ecda50 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=xTuWgevKKEmUOcCBws0A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 5FssG_nbP8FStPkDEMaaaUQNCdL728dn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

The existing OPP table for PCIe is shared across different link
configurations such as data rates 8GT/s x2 and 16GT/s x1. These
configurations often operate at the same frequency, allowing them
to reuse the same OPP entries. However, 8GT/s and 16 GT/s may have
different RPMh votes which cannot be represented accurately when
sharing a single OPP.

To address this, introduce an `opp-level` to indicate the PCIe data
rate and uniquely differentiate OPP entries even when the frequenc
is the same.

Although this platform does not currently suffer from this issue, the
change is introduced to support unification across platforms.

Append the opp level to name of the opp node to indicate both frequency
and level.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 79 ++++++++++++++++++++++++++----------
 1 file changed, 57 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index ebf1971b1bfbebf4df5a80247a6682ac8e413e3b..0f2a389aafe5c7475a40adf8c43614a007429b41 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3659,39 +3659,52 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			pcie0_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				/* GEN 1 x1 */
-				opp-2500000 {
+				/* 2.5 GT/s x1 */
+				opp-2500000-1 {
 					opp-hz = /bits/ 64 <2500000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <250000 1>;
+					opp-level = <1>;
 				};
 
-				/* GEN 1 x2 and GEN 2 x1 */
-				opp-5000000 {
+				/* 2.5 GT/s x2 */
+				opp-5000000-1 {
 					opp-hz = /bits/ 64 <5000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <500000 1>;
+					opp-level = <1>;
 				};
 
-				/* GEN 2 x2 */
-				opp-10000000 {
+				/* 5 GT/s x1 */
+				opp-5000000-2 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <2>;
+				};
+
+				/* 5 GT/s x2 */
+				opp-10000000-2 {
 					opp-hz = /bits/ 64 <10000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <1000000 1>;
+					opp-level = <2>;
 				};
 
-				/* GEN 3 x1 */
-				opp-8000000 {
+				/* 8 GT/s x1 */
+				opp-8000000-3 {
 					opp-hz = /bits/ 64 <8000000>;
 					required-opps = <&rpmhpd_opp_nom>;
 					opp-peak-kBps = <984500 1>;
+					opp-level = <3>;
 				};
 
-				/* GEN 3 x2 */
-				opp-16000000 {
+				/* 8 GT/s x2 */
+				opp-16000000-3 {
 					opp-hz = /bits/ 64 <16000000>;
 					required-opps = <&rpmhpd_opp_nom>;
 					opp-peak-kBps = <1969000 1>;
+					opp-level = <3>;
 				};
 			};
 
@@ -3839,46 +3852,68 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			pcie1_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				/* GEN 1 x1 */
-				opp-2500000 {
+				/* 2.5 GT/s x1 */
+				opp-2500000-1 {
 					opp-hz = /bits/ 64 <2500000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <250000 1>;
+					opp-level = <1>;
 				};
 
-				/* GEN 1 x2 and GEN 2 x1 */
-				opp-5000000 {
+				/* 2.5 GT/s x2 */
+				opp-5000000-1 {
 					opp-hz = /bits/ 64 <5000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <500000 1>;
+					opp-level = <1>;
 				};
 
-				/* GEN 2 x2 */
-				opp-10000000 {
+				/* 5 GT/s x1 */
+				opp-5000000-2 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <2>;
+				};
+
+				/* 5 GT/s x2 */
+				opp-10000000-2 {
 					opp-hz = /bits/ 64 <10000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <1000000 1>;
+					opp-level = <2>;
 				};
 
-				/* GEN 3 x1 */
-				opp-8000000 {
+				/* 8 GT/s x1 */
+				opp-8000000-3 {
 					opp-hz = /bits/ 64 <8000000>;
 					required-opps = <&rpmhpd_opp_nom>;
 					opp-peak-kBps = <984500 1>;
+					opp-level = <3>;
+				};
+
+				/* 8 GT/s x2 */
+				opp-16000000-3 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <1969000 1>;
+					opp-level = <3>;
 				};
 
-				/* GEN 3 x2 and GEN 4 x1 */
-				opp-16000000 {
+				/* 16 GT/s x1 */
+				opp-16000000-4 {
 					opp-hz = /bits/ 64 <16000000>;
 					required-opps = <&rpmhpd_opp_nom>;
 					opp-peak-kBps = <1969000 1>;
+					opp-level = <4>;
 				};
 
-				/* GEN 4 x2 */
-				opp-32000000 {
+				/* 16 GT/s x2 */
+				opp-32000000-4 {
 					opp-hz = /bits/ 64 <32000000>;
 					required-opps = <&rpmhpd_opp_nom>;
 					opp-peak-kBps = <3938000 1>;
+					opp-level = <4>;
 				};
 			};
 

-- 
2.34.1


