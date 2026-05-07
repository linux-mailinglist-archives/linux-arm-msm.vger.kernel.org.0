Return-Path: <linux-arm-msm+bounces-106241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iElOMJAl/GkWMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 07:39:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2AC4E3276
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 07:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C91113020FE7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 05:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95909330337;
	Thu,  7 May 2026 05:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y28r68wE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/18BZPm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A2E3314D2
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 05:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778132364; cv=none; b=hkZZ5SRXWCnxwwackDarLxyzGKe3hYfM77biJFjl0VrCmcx2z3MqN5KBSiPrGFlDTOQNAoVKCoD3YEX4L4UZNEJ42/pfgW1iCXo33jKCJpgZnmj7Ayx+RKnRJX2egi+Yjvgq9k3XOSZJyTGOSnDQzsCSE6cyfzbGZEqjQwRKhvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778132364; c=relaxed/simple;
	bh=1bQKyQFuznWk2H7nFim3U/ajbldz2nkdFVHT2l1G8Eg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZGpTHRoDLANfoKe2C1zyf3FzQrIrpUzYMMdx5ZO8HpdnRbnjakFk16/6+6iv+EHvnpBFx6iWfihwPVHQIQX/SDZBEjQ8NYHhRVFk8e0BKev2PD+HK3mj4xWjO0p38a33Nolwsl2jxC4WOqzTq0C41ZBXvqpCKQ5APq47yVnf0pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y28r68wE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R/18BZPm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473eA7H1669567
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 05:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qLex6gOIHDgMu0sjfno7UaDjWHFJqKQo1alL3lhwg/Q=; b=Y28r68wEE4q+pwqc
	9/gWBjCqdEsuZjQcD4RaDP6kIibFxG7KDwWL/2MciRlq2tFTqv5k5va7tRdRLwkf
	rvF5UUKlzrPzx3gPSC++bPCqgBQqCsSEVH1dr9StN0x6ZzVyMr5eXStYvH35tzgD
	4PsVIKHkwaFY/441I8tO1ZJUH06fBFnrvAUjnKeny6Fty/aP03R0elBdx779IAys
	rMCukX4X90hqosYXk75cpNXsTCq36SC9sYFk/dBQz6PuLqtGZZOytg3P47ERnLm+
	J9rV6SsjMssWioAM+2s1gFR4asO0TfARwra/AXkdaUe0JGgVjOTv5/dBs0L6Y/iP
	D+oOmQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1p0bes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 05:39:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-837c4eb3bdfso304190b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 22:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778132361; x=1778737161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLex6gOIHDgMu0sjfno7UaDjWHFJqKQo1alL3lhwg/Q=;
        b=R/18BZPm2TeoTcjTlkgPxWlif2ktZgQpYNMMZnPY5NI3EDXYMYFI2PxGQ68RG6JWLM
         DvbE5XsdHhrlB5dKfVuGAHYpRZ5BnlHdaGAHnCuyrnFtwfSiX19ECjuQoFWCk+WJe1Gw
         lMtzVlxmTApoM84IO7p2ufGURBCVInpSm3Lq+LvHE90oTohz7F2ZVJbPMckw+ftGPj7f
         bX1UgNCoq8trwM4SsW1hxAsbkpj4GpI1wLfdsjKoyxZ686sP7sifm02ppMM06POHMsYs
         nshF5R0jk3owBHvAd/UWRgS0jYShe0M3ImputLVi+7gG1tBBIx0XKkyTJ1BKEjBknjpt
         J1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778132361; x=1778737161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qLex6gOIHDgMu0sjfno7UaDjWHFJqKQo1alL3lhwg/Q=;
        b=o8nUMMgERLjIQw9x3CJ7gpjDEWJmBDUkymlHgH2FMcQMOkWHqsO5+6+7sMdjW83HLk
         Mm8uy4q6bdiP8xoW4jPsNVd8CBFg+jl4X4r2hGy/hWLurLQmzP21xCwITB84/2UO7TYN
         VYAj0QNk9/7xSSsCLTzJSzY6QQ76w39MgKEHXx7vOuk7taYDyvVLWYNSYn+D6+CkuqcD
         zqSVPRN6YHB1Ca7LsvB50FRV8ilhfndFbqtH5ibBKMxsn7nSTcuHyGuf9FTEh7F6NtnO
         HOhiJDhFk4Yo6cDZ77oqe/E9bainZHptJHNVctH0POKu8UGuq3hwGXZDoVWAB0AcjVbY
         /QkA==
X-Gm-Message-State: AOJu0Yx+VvFYosZJU+7pJCvn8I5oPbaQ5TCAUu9pQt3SSFxyQHmLaOpD
	O8ohx6Fx/hRUUIg04t1SbYWDSMmFfmtej7P6yKIuidk+47iMHoI/Orw8YyOPSwLQ2Wx3p7eHn+1
	dQTlikQLCFFJ+ZpBeUAM75qHwjFcnsmCHzwzu8ok0K65R9VJ1oVdBaSWJ+sK1zwEXNDaW
X-Gm-Gg: AeBDievEKmp06vnn9HNPjAVeoh2tTNr27V6VdtgkZJyGsMJ1oCGRirsnVetMGpi4Dwv
	Q6opWRlW903fDMsNoTxBcmJOcFCclIaX/PCygmmE33OFxHxHZDx7ZLxy5N39aZbF5J6czNSvjUa
	pCPX8rtzEFV1cy60veX8jIchOQf9isv9NHE2VvwLISovlLpqy53mL8CLzuILG2jJxaRkXBE7Itl
	RoFut5wlPD95efDhOmM/XlPIw58t81wapAlwkA0Wx5VSk9QC43wLMDBMvLay3u5j1+EHAsKlHfh
	ec+Xk02ViTjdKUJYirDhwSo9nc+EehjC4Zyn2gYw//DeDeWiP+H/5nYdYIRC7o44pVfSzZ/IbtR
	b5ZpclexsO8C4us+KjBAACVX9VaTvOaPtVxGLGLr8XmgsAvk8KrQ2Q5C9k/2A5r4=
X-Received: by 2002:a05:6a00:994:b0:82d:29f:d003 with SMTP id d2e1a72fcca58-83a5b6d2051mr6064394b3a.12.1778132361431;
        Wed, 06 May 2026 22:39:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:994:b0:82d:29f:d003 with SMTP id d2e1a72fcca58-83a5b6d2051mr6064362b3a.12.1778132360929;
        Wed, 06 May 2026 22:39:20 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563ac51sm7389962b3a.2.2026.05.06.22.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:39:20 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 07 May 2026 11:08:31 +0530
Subject: [PATCH v5 6/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-purwa-videocc-camcc-v5-6-fc3af4130282@oss.qualcomm.com>
References: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
In-Reply-To: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1MiBTYWx0ZWRfXz245i8JlmyKI
 rNZIc3BLRXXjKHCUetXg+6dZV+g+yVr7E/9k+UQ2UOzO8KrdT9CLFwOb8AM5PFhTLzZTjR/64wl
 li0MNsp8WU0p3wHoY6iNpVNTrHn8UTpMm21IYvTkPKs/KKpzThh/+UMt9DFGNxVH2SVY+d9rJQj
 wg82/2GUzM8gu4lu+Ua55/JtpSdV3JKY+HNZYCIgEvZiSGPZ5kvO+aUmMwkMoPGbQTaeH2NGnC7
 ZGrifXBrE9hqQAg7/mWsjmfO2Z0pCdXIlY9CWGOso78H1nUp7yOsvDvvvZ3/Ff+lerzJFF2L5UL
 YUG+6L9JYdkj1Bi+AIJ9sEtHncz1CnuFvD+jRpVfueRTzh1QVZcyID+rr8VP18AQE+poJX0tuFZ
 vFRO/M59D6UQl18iSvXydCN75MpfSEJRvCBa7RK8DMWfPe6qvfKDmH+tyhvySP2TzmYHQ9AtoBC
 Vm3vqWb240yMCJgpIRg==
X-Proofpoint-GUID: uLhls5Q1TqlBxRoHywrWPUzzirPKGO0Y
X-Proofpoint-ORIG-GUID: uLhls5Q1TqlBxRoHywrWPUzzirPKGO0Y
X-Authority-Analysis: v=2.4 cv=K4IS2SWI c=1 sm=1 tr=0 ts=69fc258a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7hkWjQK7Xc3mONE6JcUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070052
X-Rspamd-Queue-Id: 3B2AC4E3276
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106241-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one. And update the compatible for camcc and
videocc nodes on Purwa to match with their respective Purwa (X1P42100)
specific drivers.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa.dtsi | 10 ++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee0764167338023c96342d895f2871a61c59..c31462ba393fd77b7124db2ce680663945e7fee5 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
 #include <dt-bindings/clock/qcom,sm8450-videocc.h>
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -5550,6 +5551,22 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 9ab4f26b35f298ad7c6c361b3e232edf07baf223..25cd547caab8fa64eb1a134068b77f5178f5c248 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -6,6 +6,8 @@
 /* X1P42100 is heavily based on hamoa, with some meaningful differences */
 #include "hamoa.dtsi"
 
+#include <dt-bindings/clock/qcom,x1p42100-videocc.h>
+
 /delete-node/ &bwmon_cluster0;
 /delete-node/ &cluster_pd2;
 /delete-node/ &cpu_map_cluster2;
@@ -36,6 +38,10 @@
 /delete-node/ &thermal_gpuss_6;
 /delete-node/ &thermal_gpuss_7;
 
+&camcc {
+	compatible = "qcom,x1p42100-camcc";
+};
+
 &gcc {
 	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
 };
@@ -256,3 +262,7 @@ &thermal_nsp3 {
 &tsens3 {
 	status = "disabled";
 };
+
+&videocc {
+	compatible = "qcom,x1p42100-videocc";
+};

-- 
2.34.1


