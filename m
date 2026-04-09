Return-Path: <linux-arm-msm+bounces-102469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOwTC0Fy12maOAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:32:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A63B03C88B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 943F53076DDA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 09:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B7C3B7B71;
	Thu,  9 Apr 2026 09:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJp1mfIn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="idGYxkh/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C133B6343
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 09:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726537; cv=none; b=KBjgWBCxjqaO9QlK8t6CVUPFQIraU5QobMdgLxXog/fkvMn+YiT1PRcQ0uRkXuBRZYYU/NSLByZEVmYhLTY/ZwL9A+pE1IPhL2a/IWEmJ5CjpBvMfEpr2WRtdp2s33mqYmmUjXdA6yEA6Oj2JlJugbtSXLqtcDcsg+LVJdWR6HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726537; c=relaxed/simple;
	bh=f3VcSNn611opCTNVe2wVeFbuvVUH7zgswWxsH/PezuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NtQb6lxmTrP2PZGBaiJrg2jE6O/2IH09vurN1gbNA4cKO8o9uGwXgDGwpdr72qDSFw8dYHGLyeXqdgF1Ps/U7DPhoCM6s69s9KMI7t9EF3F5YEI2Z2lBpLjDCQhmZAIzYG+xwx3WtWVXHyVtimXlLPC7K2lYsjlhd6LKskdMjx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJp1mfIn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=idGYxkh/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63932l2V3326400
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 09:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qqgSOZ/Q3NlPl5exLfE3lkF0aJkdeSMwAV4+I0elz2M=; b=pJp1mfInFKOoNSqR
	BYATcf3OXwWjQnGeTG86Zb6d6O8WCxKRo2jdsCOeCSzO+z3FjHUGy/nH8+GKcKRu
	ekSVFpCZcX/Lxd+dyt3a+1RI2Y7jTdRq7j9gNuJtRpWg2GItguCsvHHSQT5bjg7l
	CJYbBOb5au3NwfkLV1LdCysIDSYGh1pbeKXDLcYgfwsR6Ofi/8RlDe3Aizlwv2yB
	O9Wg6fb7/775kJwjamPX9bO4ABXGGlE8g2XyWwLRLGsq9m5IGJIrfq5KQG7eLpti
	9Xa9X1pFSF+KDiHDUb5i9rPIY9096g4M6Tpn16dZW4pDRk6U38edN+TnPOpHMSf9
	Vl1QSw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddw9mtfuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 09:22:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b249975139so18998525ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 02:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775726524; x=1776331324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqgSOZ/Q3NlPl5exLfE3lkF0aJkdeSMwAV4+I0elz2M=;
        b=idGYxkh/ucm9LgFs9KWX6lk9mj9ejld0mzd0r46LmKixJBQNU+3IDqTJSJPnlZgeL9
         5rYwCqAhEm7CR81BAJZIDSltdQpusKKvStSBblulYga73atlrsl+/c30D9sDUU2AZGkW
         s9xGTuuFmctK3JOuC2yjVrjn+wMnmXtRnGudPGB+1xDnLChsXrQx/2m2APTaNq5AGCeb
         MpRHgu8HNKFTVD0sJhx74f2QxIlFScV7LzAX+c5VuiWw7nk+rF9tkXsCfjyPHZSG7bc5
         Kafig5bR0xEmh7fcoqrRcQ76Aoa6dax7oCDRSesKyhkZgVveF2NrEAW5SUOi4IcDIn4c
         O9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726524; x=1776331324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qqgSOZ/Q3NlPl5exLfE3lkF0aJkdeSMwAV4+I0elz2M=;
        b=lCoMJ6SOuTWCTQdqnvEYLT7JwysknLfDoiMVSjoHD19f+g72oub/wty3iGijzcOEiL
         mTw8t5VnE+C9DyL+gniBRiILwWixxC62R7o5SVlfz/h1xYNEKUWfMVZIDB7NTlg631pc
         8D5vZm0oyQIpmSW6y5r9J1XHHIsvYFXu+zTzUFQyZ+BdkNnFNPMsBc00DOUKjhiSh1dl
         yGHOcsPcHxxBsgPgysw16GZXVokCVSFScaqawTmZuH9kNPWpWdKHM4HqnSIESL1LFoqO
         ZCLLQrQPhZkXRF5iBT/WYS4J+P81lRdp1fGM2tWYi9YVkD3pqJ9HJleeKGRBOxPlTSjd
         Loew==
X-Forwarded-Encrypted: i=1; AJvYcCWpubyyG3aEJdvunZvX9ubtrKUFtcj1ZIDvFzBIoiEiGlbUeUR6P0AapCjJIHeth/AHoKFKBOJ4aLEh6rel@vger.kernel.org
X-Gm-Message-State: AOJu0Yydvk536JeqazJcnFC9Fer0swQyagVb0UfYmQONEJG/J8fyf/Aq
	EHxy0cg2xh7Z6fZGYNFFzp3q+ok3DXbENnCD/597aTZzi/odG/Zs+oHWFlZA09vcPrvehAPlxVd
	ZSkfNS9FHyZHn2d2O+XBRQCHJstg/NOJ//3YH9Smh0OZBkIM5o6b1sBHc4y6iuUU0ksxp
X-Gm-Gg: AeBDietD1vp2Rk8q9IDqCdTr2VgOvdPsWdaFEdw5XP8h1ngx37y1lgItueZr56tojoK
	XXfIvcZfWtdgnOAxtDuY1ls0QYgpJvIje1qNRjwrOwwUmK3/U7srP9pRtwoAlY4iGq4DZ28Rn6x
	m/V+ANYP90mt149w/d0o7QniCMpBA0rgB4SjXnRoIlyZyLhY7KKaHKMgrDYUCUCM8NbThf1AULL
	288EoRBVwV2hyLp54u2T71muf8vB4NRheb7iw0gFKwWnFrTsvuzwEqtQ/6JhRauvgEYIH7Mk3re
	IMkAL+FHsJesvIZ44f03GCUo/uvDpkI9GShzfKQp7a+4Do8g69Yp0qHT4doZ4jH5g1Sgyt/hYHk
	uUrItyiSb1mcrru9NVmSstORNYdyKxYcySVh+63mvZrq0uFswKC+w
X-Received: by 2002:a17:903:a86:b0:2b0:ac1e:9720 with SMTP id d9443c01a7336-2b2817995b8mr245081765ad.23.1775726524043;
        Thu, 09 Apr 2026 02:22:04 -0700 (PDT)
X-Received: by 2002:a17:903:a86:b0:2b0:ac1e:9720 with SMTP id d9443c01a7336-2b2817995b8mr245081385ad.23.1775726523598;
        Thu, 09 Apr 2026 02:22:03 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274978fd7sm311766815ad.39.2026.04.09.02.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:22:03 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:51:08 +0530
Subject: [PATCH v4 6/7] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-purwa-videocc-camcc-v4-6-5a8e5f2dd4b2@oss.qualcomm.com>
References: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
In-Reply-To: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=cfPiaHDM c=1 sm=1 tr=0 ts=69d76fbc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7hkWjQK7Xc3mONE6JcUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9E0jQ840tTI6RAY4ZWv_jzpGoX-xDHhs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MyBTYWx0ZWRfX6naZHoFsTF3H
 2KIW8HrNuoJvgmscMn6nbtrSnncc9rTOPu6TmEAQzNZE2Ns3MdWzB586nFpsGAsOGhCm7EmiaQ6
 WB3nDgDeO105g3rVx7pwm9rglKyR/1DnvMLS0h54ZheOncD3GWWamAvUvSs2B+Pbp0LG3aoyqHa
 Vb23tWPIukjJNBHIWosoeYLObdccVHRn7FEUP+JTLDFxTZWYTuRFOF9devSuwlSxN1NQXpZKZME
 C2jnL0MmSdNZmRvDCt4kD9JvDvZFokqEsAoCinxrr1xPhLKy/jPDOxoN8uRLOujPO7jfvrVQkLi
 4i9edSNPhFmyLF0E5z4eaV6DGt0mcqPAJFysAjvcPkEB8HLano9kP+9NxhPfOXLDxSdFY05gWqn
 BXZzdZwJAPJdtG6SycEyv4WbN3UQSL2kqqJ2Iao1F9B3vFXzRv8SLP1KngDKTcn55HWhRKz4sI6
 p849/c3AiTMKNl5INSw==
X-Proofpoint-GUID: 9E0jQ840tTI6RAY4ZWv_jzpGoX-xDHhs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102469-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ade0000:email,aaf0000:email,qualcomm.com:dkim,qualcomm.com:email,ae00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A63B03C88B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 051dee0764167338023c96342d895f2871a61c59..a736ff0508be9b3c12975f8af3e06effc662a7ab 100644
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
+			reg = <0 0x0ade0000 0 0x20000>;
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
index 9ab4f26b35f298ad7c6c361b3e232edf07baf223..ea65b8448836ead83f837e973ed536e8ea0ed8ef 100644
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
@@ -36,10 +38,18 @@
 /delete-node/ &thermal_gpuss_6;
 /delete-node/ &thermal_gpuss_7;
 
+&camcc {
+	compatible = "qcom,x1p42100-camcc";
+};
+
 &gcc {
 	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
 };
 
+&videocc {
+	compatible = "qcom,x1p42100-videocc";
+};
+
 &gmu {
 	compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
 };

-- 
2.34.1


