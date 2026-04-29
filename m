Return-Path: <linux-arm-msm+bounces-105108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAEtNT+I8WmchgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:25:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A87448F2E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4102E30792D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 04:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A159638B12A;
	Wed, 29 Apr 2026 04:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XK8RH6gC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwWVFUDy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558C538F25E
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436604; cv=none; b=OMHZo6tfLNXlGA85soWa82cDOenVf5pHIyL2ZE9DIagli9rwZwIIz5eBhJE9Mhjq2WQ2QTgfH9R5yGeJu8qzMz8FAdKqRJVAzllq072PXedqmlvEyS/2c76v3G/yOpTfM2Sa4dHrY5EnqZlZfbBAkZ6+ZFUazmRgUU1wkpVVFkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436604; c=relaxed/simple;
	bh=/3t3rqT8fqV1+HN4uB6fWJFPqT2keSdILxMvfOZM+Pg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dLcVs8xIEKwGxGzPRHY3OsiB8xysxjydL1WJNpO1+m5AKY7+ZZBuo+lzcm+ZxrgMF4u9E8+RxCPgKR1tNEdiLecnsTTedlRkZCeB6l3fCEAfxjRon2McpLHoDXnezUql8agNy1E91H3lmY+JAtopojfQt4m1aT/jLZ7oVi67zfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XK8RH6gC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwWVFUDy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T35t1A831353
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQdLrKTj+Qbw7jgoPEFhPIKDij8coJlWzW1Mxsre+eI=; b=XK8RH6gCHKt20o08
	+yay0hZPJoZ7bSirHLjGms20brp0Q1dOLwN0rGd1o6pfuaq7Lymi+rVT+pw8xnbN
	i50RG49SmjOfV/EPh2ZMz9iUEOm6mHPrsdXA08pGwm+SeqjDlmqAHJ/lhYQ2EE3n
	xEE8/i3Q1y+pyrYSMzzgQY2WqU5KSakbcnN0L7SgObsyhn4qJZSsevLqY0X2jxMy
	Ij5Ke61V3IA+YyqaTMEs7YQ7KYXWUPTpDylYpkjyt/N9TPeOKuddguUD6FecFtkT
	6cUI4irK1L50pAmkDt7Z2CWGXpysA9sQJECrFAfa72U2KINRo8yQSNLnTjT6tCSd
	pW215A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqa0yp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:23:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f74bcfb86so14778183b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 21:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777436601; x=1778041401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQdLrKTj+Qbw7jgoPEFhPIKDij8coJlWzW1Mxsre+eI=;
        b=UwWVFUDyxGQJ2YVC6tTgubt7T0Oco9rkzuA8NOkPnkwI8YHpwFf6J1RM/uQTQBiD/F
         yq+0YdSx8/9XOiItHxp4MEpe/K2bUY1ffAPYPoxciATIchD/ShlAUbwOfJCGcDF8gF1E
         dUjUFneaWa8dxHcZn6yxxzOBezulvB7k5Anit0nrndcssb3xxh2rRXRLLlGeKwArk7e0
         DLaKEZhl14L7wVOAgspkyODYFNJVqA5G0Ii/4sYn6KEtlBBoiBSH8XklIqsGqou5Gk9B
         4jtChp5t3rCSNvMxbeBOWy9epIIb7p7yq06PUo65bE033feW3C4Z08pLg4o0Xo6JdyH7
         QuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436601; x=1778041401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mQdLrKTj+Qbw7jgoPEFhPIKDij8coJlWzW1Mxsre+eI=;
        b=rEgMzztBSvlv1d4e1VP0cdC9850VsjXRkonkSFOkTmNO/Hsvk9Zmq+Ugo3v2b021rE
         wwiVsqylXYoIvwXRSs7JqvFkTDPGc1Ri511n4hxv1Ts4vhA4N0Pbt3I8CHKKAxxrO04l
         uI1YxTbhEryeCDnq5slEtgbXRl1PcT5Wm1wAeFhL5SD3lNpZZC47fld9+qIuiCyfB+J1
         lp+eflU/u5DA042UTr9iUpmHNMgZy0wNkWVGoRS2Fyzav87KrPn7GJg6BR8yj9Bimi5t
         XXsAaHjUYn/ntk3Ak2D/vO5JlvYQdGyzstJenbpgnMf+mnquTvmuqew56sJgdGyIcm/M
         ZqpQ==
X-Gm-Message-State: AOJu0YwTyuAVfLnYpAt068wobxCBptbwO1+DuASK7OGN2Qycv1pbsqEg
	Wrt28wJmG3Gsyfo979/1c7zIOzT+voTD9tiLQEF6y7BF/VKJE21X/JNhtGlxyxODJmlSxfn1d9s
	vY/U02EE8+9z0Ln/Uxo8+dIgkXiOW7CqyxH5ldyeIi+zOgJCe2ZEaRCtW7w3Rtp/hPE9U
X-Gm-Gg: AeBDietcVjiOm4qGBFGIXu4xkIJnmlZw1lqMVOgU22+2rYsqgmyco6g82nAbVDjcGqP
	WOMv2nyqBjerC9oEb/d28G1meSfV6jp9SG/q65JVYYacbzvMFiZ9P0c4Xv1Ajhr8I0tp9SM/pn6
	TM7+w1osT7XHLWHR333wfbX/2nJa+lCyLnLXAi7PCn/I12sFiFcef9mNme/qRtCpPTVqQsNkL/X
	dwM5ziHSEQGfvAsUtZ8opWg9Ym7O61LSbL5i+VAMX3xSZvN5ES6kfA8V/ldjgPMC0DT7NWFzAeM
	W9LHqf85a8VN9xYMKC1S4fW4jyxMXb2YSwbNF4+H5pvJLrOFsNKpVzYqqYllyrhT10o/nlf7ZQW
	uIQXh8kw/hWUZYbI89WfG3EPOisPMpOM5/HiCiiyCayNFcHs4ISSPEG7ArkIHbKHIyHo8
X-Received: by 2002:a05:6a00:7611:b0:82c:24d5:21cb with SMTP id d2e1a72fcca58-834ddaca2a6mr4879490b3a.8.1777436600849;
        Tue, 28 Apr 2026 21:23:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:7611:b0:82c:24d5:21cb with SMTP id d2e1a72fcca58-834ddaca2a6mr4879469b3a.8.1777436600417;
        Tue, 28 Apr 2026 21:23:20 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5a074dsm602200b3a.10.2026.04.28.21.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 21:23:19 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 09:52:45 +0530
Subject: [PATCH v4 6/7] arm64: dts: qcom: kodiak: Add QSPI memory
 interconnect path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-spi-nor-v4-6-73fb1bab03ba@oss.qualcomm.com>
References: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
In-Reply-To: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777436569; l=1377;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=/3t3rqT8fqV1+HN4uB6fWJFPqT2keSdILxMvfOZM+Pg=;
 b=oLEY1TE6amPJ+BGtiW68uwqYVzXTghJp1RhvGxaqaDWXn6wn4vH3GJYpnAM5OthnzgEnInx0q
 9wG1SDYzWcfD4dCSzcEhiM7SOxQDmtO4BMrN/a+TY7oPeFK7zNF/Neq
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: rl-ZoZVWbM9uDPC54HuKip_O6iE6nxLC
X-Proofpoint-ORIG-GUID: rl-ZoZVWbM9uDPC54HuKip_O6iE6nxLC
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f187b9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DDoZI6XnaA0zmnrO1bYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAzOCBTYWx0ZWRfX7HkWgLhwJzi6
 CqD39k5TbAG7phBBnnH5v443llMrOinNQ16vl9kxOPbplrS/90tovPL9XNpO7u0jyk9ttIYcM6b
 Mat2oAEqHKsl0ddBwUry3jWH3Z45AFDZycDjFYZKkIX8VgFYmKaEGfVSEy9AnNWhLTzX3jF+Hbr
 MVSVMRwqvUwgfAkhKwy2rXLVFZ7OHzailThgmIZaUwAo3kUOxj2LOebtRw8ByovKLIDhvL2cmpf
 lA236Ltgcq6TV1sLt8SsM1kdq4wELEktKPADsA6VeDfH3ja82yLV5s8sMFLaSiM0Vu8X+SPwQLP
 kN6Vn6BFduL15IjLn8FjEN8IO0JSx1DC18u8E2gwcwcL/Kfn0aDFlvtCrfg4R/7jpP4bnrDIM8F
 T9I/40M4lHPm5MqdcDNJc+9n+OdXJ0PtLhIGC0TZxlVW0DawqGl0+X8rjnkTjCmql9vtpEg1HeX
 Rhnog/MQ8h1WOwN1DDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290038
X-Rspamd-Queue-Id: 8A87448F2E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-105108-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[88dc000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add the missing QSPI-to-memory interconnect path alongside the existing
configuration path. Without it, the interconnect framework cannot vote for
the bandwidth required by QSPI DMA data transfers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..01e35e34ef51 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4312,9 +4312,12 @@ qspi: spi@88dc000 {
 			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
 				 <&gcc GCC_QSPI_CORE_CLK>;
 			clock-names = "iface", "core";
-			interconnects = <&gem_noc MASTER_APPSS_PROC 0
-					&cnoc2 SLAVE_QSPI_0 0>;
-			interconnect-names = "qspi-config";
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc2 SLAVE_QSPI_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&aggre1_noc MASTER_QSPI_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
 			power-domains = <&rpmhpd SC7280_CX>;
 			operating-points-v2 = <&qspi_opp_table>;
 			status = "disabled";

-- 
2.34.1


