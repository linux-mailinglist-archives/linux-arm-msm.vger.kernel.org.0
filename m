Return-Path: <linux-arm-msm+bounces-90295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGhoFe0fc2ngsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:14:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7C37183B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53B9B30205EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64971364043;
	Fri, 23 Jan 2026 07:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpIvgKb1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CsBRSL1l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911FA36214C
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152417; cv=none; b=pgwd3PWwWhm2zrpTs8BJr0aiNBMwBLgIGO6bmBK5gpmPUPMhTpwj7gnITl7QmiS5ZliR1/I2CRO0YM+zDOwYD+TXnKFSSTJjje6TTMQVi1IyBlWjpa3SrGJkRH2mSNNiyEh0zoquU6H6v93PUU5XSRlOUm47aAAGGCt2pU7GHpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152417; c=relaxed/simple;
	bh=8WPoiz6WeS7Iq/0SPTznPnFxvdhJ8gZ92GNK+mUE5jA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZZbrGK2yZdYETLtuFN1R72OLBgZTTInqCZpUk3sCkZ7lI/HQ8o9CEG5HA0yi1qyBhGZqXhLY+SxbXQ9wFnmKC0aIA/PHfo0r1duINxUwkggvt+b5V6lgTQGOK/ypvDlRgPOzL5bLcUXeS/fdlZt/XdU815Sb+efvWpl0dgkwiMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpIvgKb1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CsBRSL1l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N6rhu81325867
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+xifkoJxQcri5ptYGaeWZE8T0abAKKbAYRbss+Z8+Xw=; b=gpIvgKb1IlpgNzNp
	AAMiELRKBat6Kmm9O4+9zmqjQZMDWwCPIENA2SeRc/x/tmxTDNU1z08qghcZaJu8
	evprRDCS6EeyzcS0MFbXn5gT8vAzpgvrVnqqyjNoOSna7hQlFGtGITHSU9r60yVE
	RuPRKBzM8JrmDYQlAdJX1VSBQw+GQmOiXewzFecG90vEmUmQZWHkGqp+7kgOmhHt
	cgk6q1r2LrJ/YiAv/ZAI/GN5S8dCimYJzp15IU2ijVMFAJ7IA5VqzvgPLge8cOqI
	aqwi38DTHcwfMzLx/NkgOQMmq897GvFy7Z+CBcFvbX/Z5MgN8CkZIx+oOYG6DO8R
	JL3Q2g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv44c822g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f25e494c2so21192855ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 23:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769152399; x=1769757199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xifkoJxQcri5ptYGaeWZE8T0abAKKbAYRbss+Z8+Xw=;
        b=CsBRSL1ljdPHo6i2JJZVlWeXeBDB+r5CNiJY7JoV5aWKN+vTaCg+eg5OgJEKG3kXqH
         ++LbLnwbUTRrEYapFWJuCiDJSEPeU3lAy/RsNej4Q/hlaflTEPOMsZCR76JphhXZm/oo
         TITavQXxaIR6Kp5um8nTDDjCJWxJgoshp0m1QGCM5ChSqXf3/ElTdiGfHAHTMRYwl6RT
         nSi+qMh8FJyl2UY3MjsmLHbSUQLoU8YVaH9Ed7gSq5HZ65axkBtDgrfn4cPKWX4xXrQj
         vBpuGS5+jNg2QKmtZAgoGwVQqp4xSW3YRLt2y5RkzVwe34q0Jisl4jR02wauZYhK0a1O
         WTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769152399; x=1769757199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+xifkoJxQcri5ptYGaeWZE8T0abAKKbAYRbss+Z8+Xw=;
        b=poyHxXmj3ChTDPNrYqgwl2RJdaNBY2EsDA6vp/Wf0ub3FsGFTEhq9gXvIXYLI94Xn7
         6dRU0bkXYPaWHDTV5tNmOVyxOnfjhyMhYxyLM4svqLCoLuPx7NUESQwDjo4S60Dnaab/
         4pr20hM/zJRmsg3j3WpVndMVnupCbRMykNQCFhDUr9AyuqeYbl+R7VW8w46B06Jynr3o
         jPS1754Dap1LTiFNN/K7l3f7McuO8VnkaKi31q8HN7YAA0pkWuOd+IMk9FyO5A6hxQYm
         +cVvwBW2AyAeBXm6PLoVZ9g96xJff71KPmHM9BU4g0Kq3bbanIO3UDnnpkVGAkNItVhy
         TSjw==
X-Forwarded-Encrypted: i=1; AJvYcCWN4B7a0izngHBhswvdbBoK060I5hx4PlGcpZHj+bGui51Z2V0Arte/FqPG46q9GXTL2q1h0lTQTTiZBv0M@vger.kernel.org
X-Gm-Message-State: AOJu0YxKGEk7NldPJmGDg5D7hbq6uEaFekIpzJEFw1Wjw20QIFEKZ9xW
	1qGNBvdqX+q4Smf3H4azhaTeypjfA7sl6z0lhIZmfcU3LtJsCRSjN0ZdtA8q5f4yC0RThrF8FHW
	f1EzstILvIO5KBa6KXx1tDaYxr2sLDki/60Im0GB0vsmnyZ6XEH5dOits9rT72z7S08ET
X-Gm-Gg: AZuq6aJs+4pAWoKXG4iUYjVMHO8ahH+YbY/Vo6+N02xByRG9vDyPW75FNCBw50qNVUf
	OvAW+Tdsr/floLP33Wcfev3PgNnHlsfM9NBoTZwa/2/WODErtmySF/dbysuMTPAnZL7nS0BaV57
	FMtM4ObuRHabVw6Pk23dPj4SzNeA/lGlBqwn1TjS+u+AaNEyrSToQMK6PONRKT1iZe3Ci5MZYqP
	WfwqzdiLOJ/4UekKnelxT1PgNpLN2/+4mYaVErRlbNWAa6Xi9vk1eU5btLfVzMezmA1eo+TEXSu
	LpP0dxqNjeBPftPTdOepULEPQynD4fvKnNanYZTjJ2QgpsQrkK/eVZHHqysO0oLXexeYFJR0pO3
	4YibojqMu8LJ/B14zPfDFvvfDbO2uzWb/kf8=
X-Received: by 2002:a17:902:d585:b0:2a7:9e34:f463 with SMTP id d9443c01a7336-2a7d2f180d9mr57846985ad.11.1769152398719;
        Thu, 22 Jan 2026 23:13:18 -0800 (PST)
X-Received: by 2002:a17:902:d585:b0:2a7:9e34:f463 with SMTP id d9443c01a7336-2a7d2f180d9mr57846745ad.11.1769152398234;
        Thu, 22 Jan 2026 23:13:18 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978b8sm10979795ad.46.2026.01.22.23.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:13:17 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 12:41:32 +0530
Subject: [PATCH 08/11] arm64: dts: qcom: sm8550: Add power-domain and iface
 clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-qcom_ice_power_and_clk_vote-v1-8-e9059776f85c@qti.qualcomm.com>
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
In-Reply-To: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769152357; l=1165;
 i=hdev@qti.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=8WPoiz6WeS7Iq/0SPTznPnFxvdhJ8gZ92GNK+mUE5jA=;
 b=kCxf9LcPx1MyPM979mLfZ/jYDtGX/zqFe46nnMLwEXEsqsKVMzY/owKrkPnsn/Igy4ya/UG1e
 qdimX/quk8qDQu0432Rt6Ew37f6EyJTpous3eggYWaz/cjuh9Yav6YI
X-Developer-Key: i=hdev@qti.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=TLdIilla c=1 sm=1 tr=0 ts=69731f8f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=n08Rq-YSkjsL-2sbs4UA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: VRU1oVsA-CSVJsuLKdhP-PI7ivVEqEAl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NCBTYWx0ZWRfX80GJ4UHw5yyJ
 AlwuXf0bZFPmJs6EAZGtte3Bkldii5C93zPv8WHBH7f3PyXTsbsJduknwpqC7/Q4SQzz4w+LXOp
 kQkaXamTAZv0FBupathprMP8TurT46ldwM3290n66WSekx0X90SoW4xAHhkFGLInVrg0ZRpLzrr
 JeWUTJKeR8glujhAldwW5Q/F4SxJgVhd10XJhMMwQ2c7LEhX9+c9jZ4RqMpW+5TniCL8kzPtZXo
 IzpSLFJIBcOTqlxrvy9Yu8RwiKbaf7Fo0PLztUJesMS11izqFY/8TAwEvdUu+tetgWf/pXfI8y6
 O/TRomX5ZVACdamxnZCG6KOtGXhoigo6Z9HIUZ2SAQYkesUO0FzeldAG8cBZ8UaY7yy4R/DoKm0
 qbDcxCoqco/eVkx/iMZqIA0YVyjAr+tCuNV0fTFOQi447Esd9YoLAjQCGs26+o/OzgSVq25s7Lb
 0GQSpul25yehapNOrMg==
X-Proofpoint-ORIG-GUID: VRU1oVsA-CSVJsuLKdhP-PI7ivVEqEAl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90295-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,qti.qualcomm.com:mid,oss.qualcomm.com:dkim,1d88000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EB7C37183B
X-Rspamd-Action: no action

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for it's own resources. Before accessing ICE hardware, the 'core' and
'iface' clocks must be turned on by the driver. This can only be done if
the UFS_PHY_GDSC power domain is enabled. Specify both the UFS_PHY_GDSC
power domain and 'core' and 'iface' clocks in the ICE node for sm8550.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e3f93f4f412d..b6c8c76429ba 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2449,7 +2449,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d88000 0 0x18000>;
 
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "ice_core_clk",
+				      "iface_clk";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		tcsr_mutex: hwlock@1f40000 {

-- 
2.34.1


