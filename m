Return-Path: <linux-arm-msm+bounces-98116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MXUH+IfuWmergEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:33:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 159EF2A6D6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:33:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4C0932CF150
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0726C35AC27;
	Tue, 17 Mar 2026 09:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPgtEMjV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EULmuLAy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA96D357A43
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739310; cv=none; b=Wikp7VpqiceATo9W5zlcvG/7rrL+dDa9HjRqwyyBAe+mSyVyRS2iupfB64j/TyjxZecHSFc9mCuY7uA3Q89ro8OQPD0vmzWtOYYGYMXc5gHtnOuDwO7rCfS1RkZFq0JxA02DwfYClkbl6qo8E0NItnWZpVPwzUWMenPWjWXkvPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739310; c=relaxed/simple;
	bh=W0ePF7DSyLM6ErnudVAGXiEpWPL8oXrFoEf3HGluwoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ggzw9r1DU3kBj0NNOyyMSitWQ464di11WmgZ4NO7pWwwz9ZvcnYheI1Q/vMkSjV7dFEAgLRfMcXcDxhRNJCJsL/Gk2V7F9vMC59ehEsATVJ0xPzsxx+73KhfVEDKMU/774g4k+Ri0kZEo9pZXmBCflEqbff7h4AsulmJHsWs91s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPgtEMjV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EULmuLAy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7CAj31639186
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPmd0rGBaUjGHe4gcz3hRnnXTBejiTovEjj6NmcJC8o=; b=pPgtEMjV96R2QJF+
	Mp2JnoKy3zbxErqIsGV1hlz/ZbZpQ/leKgeab/i+pQXoK0u2a7rTfV5d+24R7Qb+
	menIRNxLyiJvRllHbcQbPLfitUi/QbhUePoHqgRXtypHu2RtOh05FbPNCjYXuQMY
	gPD1FPfERvXYWW/tV7vLLPGMAK6T9O8KMReQ9z/vXmqJWUVbLk8nwgMoK7RIN2t5
	z6UvaJrXseWsUUL55LHiM1uGls29mu4fdi0ToX4DRAiapPeTJ/QElhYA+Pnxp3bK
	s+FPr1jr5R9kfVmOTWZ3U3KHlST2vILlVJM9R6Rat9PA0RKlK4bO9K6BuNGg/Knl
	JQUTkw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke0bjx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:21:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35b94e2caf9so11699499a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 02:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773739308; x=1774344108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPmd0rGBaUjGHe4gcz3hRnnXTBejiTovEjj6NmcJC8o=;
        b=EULmuLAyIfwptrNqPJ4fctLl0pzV386Gg+kW9Jl+fvpcZvJpmqD4+i2HX87fUx+vxS
         kKGnJlW/WaPyizDA6WI7ddA3QxjwXd0RK8WffsZkSXrzI2ZGA7NTP0s0WGlQxjFD2oDm
         d4vYPkGqKcrxi8plQvui5oIzELSpY5pkXNuSNsJQP1TCSRiMbqAUkkZbwbzJLBN8sLhR
         4TTrIfY0taw/kbOdxmQ5CdiHcJT6XWyH7LziTOPPN22MFxxnVIuFm+TbAaU+zLSsG1bX
         uUgrlllEZD9Bzr2RvXCkFKUffvfL/r71a232CxodzvG8hulF1TsfiFvkVJ/B85B5cRZT
         KdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739308; x=1774344108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iPmd0rGBaUjGHe4gcz3hRnnXTBejiTovEjj6NmcJC8o=;
        b=rqDvXe8MQhv+JwJ9yA1cxfEP8ntIyMUKh+Q7MdO+GnybI6orgH4gFiB8RBt+N+OJs8
         lEt73UV/XjqjtXSTGBuAtvz1Eiel1vNvIQP2jKEXCuuUqcGoTEFvx38CjfXAT2MHe4RV
         mo7Vd4rszICJqQrzI6NJgp6EN1muEue3d1rFt8fKHPgJ0qtP4CwklvDluTuqeESf6Ev2
         a2WedTpNf+VkVzB7sj0ydpLcNTq9DxWhKvNas3epSEeo1NdhN+rHgHSycsvGlDQkKiwk
         x6HCEwtvtRTc0bZj+lkOGpTYgjKxdR6r4wVmcB/22JCYdi+z5FUojeLO+arXq5k625nl
         S5SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaE1quormVowVI7Mo+mGr7P6+nRZ9Na7/ImFvxa+Ds27Ki29YaC9xEDqd9rcITyOZ4ptU4s/ZQce9BfkU5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo6vlH/eFfjtJMTtNXkSGQ8xkMJ/z2nkGIdC9w/ASejUD5rH/w
	xgALKaylTQyVCHKJ+CUIKXeo0s8zOl5DqLmjrG46YLInkWCAdN/s7fJp/jGwknbM8DMX+RKH9es
	uDgLbHib8gNsna9BLDqRtYEqblkxvXQ9UrB9OWCFZVD/+GXh2HjlfYjtc2mps12cnWZoQ
X-Gm-Gg: ATEYQzwX0hN+BeFEqWIm8/RzXdHBViVhfIBTaLAvMclzquTCElkG3geqojzKG4BVcq2
	hc20TTdLfgaAjoFr8lWfEQHJ8JNHv9cBvr/pmhUM0QtHn8ZDd+taj05DHpWURJMHoMqRVfEIIHz
	4alFEMacltSqBlWTbfvYBTafg7qt81M4mGDUpgWyCYOrqm9xCvRNutneYwjzNb8rAZQ5f+ZMUli
	ZwnPgBBBm6wY6WRJZHtn7XcLt/Jzhi2N9FvQ1vxHD+I/qwNYdvmz0Wlyosm4foaNG/7iedzloDp
	5/TkvIKs/RhV1jxZxMME4PidcrEoVKTsdGwZcv0vlHS+TApfoJ0k9jT9vbMbs9cE6QxH6HYUDuW
	gKdcwHryAxl5rt5GGSqjY+Ba51DI7H06wm9C1ZxET6QsyAiI=
X-Received: by 2002:a17:90b:384f:b0:35b:a44f:b82 with SMTP id 98e67ed59e1d1-35ba44f0e61mr5134694a91.11.1773739308355;
        Tue, 17 Mar 2026 02:21:48 -0700 (PDT)
X-Received: by 2002:a17:90b:384f:b0:35b:a44f:b82 with SMTP id 98e67ed59e1d1-35ba44f0e61mr5134632a91.11.1773739307784;
        Tue, 17 Mar 2026 02:21:47 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badbcdaa6sm2331968a91.15.2026.03.17.02.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:21:47 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:50:43 +0530
Subject: [PATCH v3 04/12] arm64: dts: qcom: lemans: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom_ice_power_and_clk_vote-v3-4-53371dbabd6a@oss.qualcomm.com>
References: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
In-Reply-To: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739265; l=1453;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=W0ePF7DSyLM6ErnudVAGXiEpWPL8oXrFoEf3HGluwoQ=;
 b=Ke72qXA5huMugw/wMSL3AKWhmc0biYEYdBMY3hvTw6Ds863BWT1nbEIa5Pr2+oc132VZ7/FmF
 J4BBE7XQ23VB15DpKfAziVH/e0fJs5XRPXdKraQet59QxS0JRKMFy+G
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: xmHNiDE-7bTbT7SemejLhQUHXzcek4NZ
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b91d2d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4MiBTYWx0ZWRfX2iggV1EtoAwE
 c0nCbAoYgwkYmBsjHzrvzIKPxDJHKQg0KXhTni1soJJvgLa8LFXPYl/W/yfjVlvt9c8dtDKAWp7
 x4gjj17UntBUUNT6HPXz9PPwAjACFKrLPPus8ROpcFt9I++fNnUVU02uOlE5cxPNEZ6d8eiFbC3
 J+us/A5uo+DHR8cxoxAD7xajXvicv+97hk49eS15rf9UI4/A4lpZoUpPZGDl9+Cy4Ml3w/rHKDk
 NMMVruc+I/zf6gSh6tTM5z6WflSbUrEQetYP21YQvA03PrZbIry8JQAlHtF8UrO9I7x2OXHE36g
 XDzcrhuQOcRAmSXwGVIpV+AzD/t/+bm3UR1T6oHm6MbCTOIxmGGWY0FvpGiaYr0tqo35FC8oaCD
 AfHm/blqHED4A87lZfm/Sbc+ecp2dzNSNB3MV4EbsHWtdM6xGrZ5vpoiwRLrhaVQkhUAWdcnXTe
 g18QIbGR4IL/UoNIwoA==
X-Proofpoint-GUID: xmHNiDE-7bTbT7SemejLhQUHXzcek4NZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98116-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1dc4000:email,1d88000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 159EF2A6D6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the UFS_PHY_GDSC power domain is enabled. Specify both the
UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for lemans.

Fixes: 96272ba7103d4 ("arm64: dts: qcom: sa8775p: enable the inline crypto engine")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 67b2c7e819ad..cdfa42293022 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2758,7 +2758,11 @@ ice: crypto@1d88000 {
 			compatible = "qcom,sa8775p-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


