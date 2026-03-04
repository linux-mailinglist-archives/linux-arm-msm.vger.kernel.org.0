Return-Path: <linux-arm-msm+bounces-95393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JFjMTxwqGkkugAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 18:47:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F5820565A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 18:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3AEC8305252D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 17:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88603C2792;
	Wed,  4 Mar 2026 17:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0vjLvi3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WQIafM/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709503C6A25
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 17:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772646108; cv=none; b=ictPrjz/7GDGSLFMV9Vk6WjRV+gAGRLwRyjeHUQZJiqH6QNuGKptdYRBDawYDkj5ld0C43nt8fDgEjvns3yn13wyOydAANhjNOYW7fI7WGmLXPz9cfiOoGHLRjs2lSvZw//iAbK76b4b8dsDO92V4SfqhmiSeExvXjOIeM7EWWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772646108; c=relaxed/simple;
	bh=XXDrlXZhcUWS5yXrHT0sKR6gNpYeo1u5PaKEzVqYMv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bh+zBUJHWUxhLL8DVW2Nxfbqd2GZxj6hWLLMk1GmQF8EzFtctSdiSAAfTd++A3wl0Zj8AdeQ6bEINkMGOIgGv9VSoB1YM3u8SJfEutJE/kQXmAuvwTsXoNqqCOvBBpnC4dcS85Z32YYXRW3/yCZF2y8jNynYes8tvypTh6Nk6mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0vjLvi3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WQIafM/V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624D0mvk1422295
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 17:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i44vo9G1sgcNUMXOuwpN2jErGlIv0/1tRkQyHWiOwFI=; b=b0vjLvi3u8nIr9D/
	8B9gTBnOpVSHX0FpVqWQ61jRlbM62sAN6u+J7KkwaG3Ywr4jgqVxsA1XGI6O1ndj
	Gkqy1TFYGM3LWSpagKZuawOhSsr5SWWZWC+d6855Gm5bRcz5NUQoLORj9MkyrqXc
	LqHzX6Nhjo2Xew4KemJyMZ5KNhwK+/seu1It9zCdVyPH6OS0wRGEz3xKs8UHtHmG
	fgOxiwPYcY4kFzURiZoHuSU8fCXjlSEhFPuWgMWw8caKK+zz2qE6o1SRGK0FEFja
	UMoFjRl8EZ6RaF8j+ZbmvHcYPrhV2HWdrk5BOCg0MHDpcrUuxtL798a/trCoo6g7
	WACc6w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u2b9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 17:41:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-bce224720d8so4057596a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 09:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772646105; x=1773250905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i44vo9G1sgcNUMXOuwpN2jErGlIv0/1tRkQyHWiOwFI=;
        b=WQIafM/V5B04NKplh1pvFfyVQtrpGX5afDKGnbquwMFMOOl1hneUBxtSbLWQv8rbZd
         x9vndhS/GuC4Chb9zs4ISIGmiok6BSajfoTHYE2kmHoUsDozgAY+QEAoGc0epUVlnIcW
         7y67vrPHU3mk/eLamA7orYVODGvjepwv7Xutn8bwugXpBmk30J5IjBGnO/CCZfstku83
         rOwkFSZ5+u+FsLpEK+Q3M4v3J/STy/36+oelaGHsNwDXPt+Hno8vIHdvP/jJatwk5GOM
         1Ri0TJTkdO3VsRS6l9n1GaERyy/aWiMJy63yW2Uwh1/kTZjN7LER3sTXD/lDcQO87N9h
         Mrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772646105; x=1773250905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i44vo9G1sgcNUMXOuwpN2jErGlIv0/1tRkQyHWiOwFI=;
        b=RwtUtBo+qMYDTTHwLoIu0z7A6TBXMJB69hvR80Ku5m1Yb9KGPP/tAl3jRj9p7pmjUh
         eGp3o5Xc4Pb06Wb3ao0xvlTC3BQjc8kQFMAJKwMkBjZ9fi4pifAbvhAGA8CJxy7+yPYa
         QugrDbRvNsHsvbfeinF0JOy4QT8+zGsq2Hm8ekgclLOvTgEh63Dqw4z/gUylYZxs02sM
         r4VXFSGwwqNepSKglHZ9Kj3IXtKak/Nl2SpdZodVU9EDtsp3QQudBv0r3yf9d+Yf6z7Y
         1YCWvxLRVGSpwa58DdanHcoav67qB/RFLyD0pNlVXZKNDWymmy4ZLvQzBNCxVcu6tn7y
         T3FA==
X-Forwarded-Encrypted: i=1; AJvYcCU9IBGG9gfKTLF01MA+O3riSvuj5aTZtJTPNxYZ2JupQnTv9jstoWkvggw8lfTHU4SD/v/ANZP56YRvb6O7@vger.kernel.org
X-Gm-Message-State: AOJu0YwEg+4NMnUOVBSk4IaImwy4FbxvTOiy0539nno2GW8xgHAj6OuF
	5rYER+OYUQiF71hSkdLReZ8cCPBH+ZM5D2RTF3jOioES7wrjyAhCtplfrQtMXCLUq4FOmkf4b8o
	UoIURVIL3n3z0qXmvdeFt3gfZnarbytbW6y6BqZHsbfD8GdDzdSqRFSZJv+qVNMdfz1ia
X-Gm-Gg: ATEYQzw/nE16p1KWsNg9WOeE88gpHezPJaw+j+T3s7wkOGJ+JrB4EMOJlCQqFsTlSH0
	H8aBi0L93Q/n3cOuf52kVm6cGBZ8PraSRDUWBLye8avNv1WG/BAOkwVDFD/gPgMcNXayvOMfu0k
	9dUGZEnrtslrqBUs0ulP7xdwBQx0/WBuc/E/0CoXifbpU0cwLb7B4/h2NEWgkMBxgwr/1zu+7qh
	e96txDhr2nu8+yEzorzWjq0hZ9VL9arXV0dDcV6aQr0NxJK6xg2EH4RjwTbui9KBjbbQ305vVuF
	NhqEzQRMtI9vtwiWob4l0SQmW2Nt4Nhad7TwYQ6FDg2Ise38JJz9QtzSPertQvIC3zK2yr+1tJ0
	eIEtHUhbPw/WrWCmhAIy0YDgxsI26OyDuY4LHVo/helbTymQw+J8f
X-Received: by 2002:a05:6a20:cd96:b0:35e:c55b:9203 with SMTP id adf61e73a8af0-3982e1f259cmr2590288637.33.1772646105418;
        Wed, 04 Mar 2026 09:41:45 -0800 (PST)
X-Received: by 2002:a05:6a20:cd96:b0:35e:c55b:9203 with SMTP id adf61e73a8af0-3982e1f259cmr2590275637.33.1772646104941;
        Wed, 04 Mar 2026 09:41:44 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm16608794a12.3.2026.03.04.09.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:41:44 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:10:56 +0530
Subject: [PATCH v2 6/7] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-purwa-videocc-camcc-v2-6-dbbd2d258bd6@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
In-Reply-To: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 6RKzxjhoNQ19blqq3jSh3-Z6M1Q7saaD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfX3KPcnVhgXTdv
 IPOQLMesNr6GCg+jBXpzKDteU+d+hiF8fWfW5GgSgE0/mLw+IGS3jxOFjSXUv+QxcdpHRtBFthh
 +b98L1hjZzqQw/5JQDXJ0zIyTKrJr1iIrGqCgdhyRWtgH9/sTc5A0Y5PHRJuoUkjzWkNjFbqCpQ
 LfwMvjrBEUfgoVQkeJZhw4hRFjzNbPqdQXJ5cZXE7zZF6qffAG/M+Z29nBH5F9d6jYsafaASJ5F
 YcT73ZtxWF3Y6H4Yje+oVmiwErI5TwsVpwfVR9Q7ejpi79mf/1BDOUaqCPshvv2pVZ5bDq7HGLN
 2a98C/QhXV9ojsa0eJaiwCnL8tFNXVTK6LMB1YAAHw4GxGnmFqbtV9HioCR2Ob3pvR22otKEmDt
 9TW/l61ZpXiEnUmILcLYerooM/Z5qm4a41PQj3qRRMCQK7x/4LGNzAI4h8i6eKx07TAls/bqDAh
 bvWPllg8xqbKsZ+BoNw==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a86eda cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=2tf4Oca15tKvMlEum-4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6RKzxjhoNQ19blqq3jSh3-Z6M1Q7saaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040144
X-Rspamd-Queue-Id: 01F5820565A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-95393-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,ade0000:email,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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

Fixes: a8a5ea012471 ("arm64: dts: qcom: x1e80100: Add videocc")
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa.dtsi | 10 ++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index db65c392e6189920a137169b14b607c6acac6ce9..029ec012d0a94b05f8d4356ba4a95badeda65c39 100644
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
@@ -5464,6 +5465,22 @@ videocc: clock-controller@aaf0000 {
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
index 2cecd2dd0de8c39f0702d6983bead2bc2adccf9b..46ffe5353f3d2fe20e70fa8373c2591863708c61 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -6,6 +6,8 @@
 /* X1P42100 is heavily based on hamoa, with some meaningful differences */
 #include "hamoa.dtsi"
 
+#include <dt-bindings/clock/qcom,sm8650-videocc.h>
+
 /delete-node/ &bwmon_cluster0;
 /delete-node/ &cluster_pd2;
 /delete-node/ &cpu_map_cluster2;
@@ -22,10 +24,18 @@
 /delete-node/ &pcie3_phy;
 /delete-node/ &thermal_zones;
 
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


