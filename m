Return-Path: <linux-arm-msm+bounces-98237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLF9MS+OuWk5KQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 18:23:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FFC2AF7CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 18:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5AE3930D51EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 17:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2072E3F7AAA;
	Tue, 17 Mar 2026 17:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPs3Uf0U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ycz8d2cM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D488D3F65F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767317; cv=none; b=STqX0onHK9MrOaKhcUEkkq2TGzSfzPz8kMpjBBYsgwVSK0i63EwJTvPuTLDDYzVDjdGAvTudNRQUZNKSh8Q6RNe5jAgegT8NUGM1G1zBxlrc2+d1vYmb5Lnxkn5BQIiBz0+iTs2LVLkTYRMWipMofbxYOYEuu/nVOFGZeDfA3CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767317; c=relaxed/simple;
	bh=2PRsSq6yLeSUvG4Ur5vGs9rdyd8y3rpmOX+W6HIuq0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m+8vi9tnAs+JSVlwozC2KLs5Wq76+0PeC6gNVIm9VUCuZoqY8eaq1Gm4mljMclVEolBpB9ijOJF6pXdvD2iQUbTopMkZ6ucoxnp+/h80/NxggvXdpH6xAcBq6HVzedqvfOdMR6ROL3fKVesXIfwOZjZqOOH1GWhN6nwVoIEYj7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPs3Uf0U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ycz8d2cM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HG9wlO2006507
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6D8U3SIIqxAUg2A7bL5ROijtK+tS/p1xzFHgwGCOcp0=; b=pPs3Uf0UIkMVIugh
	EBp1F9Yzb1yuCDQnH69h8clUFg6i0Ocz56LuKo+vuHyEpr+43+kJJ8mxGhxdSX9o
	r+XhZ9y+iNg4i0zTKbuta5TmThYo3ByF0polMfuvc6iTR2i1ahmrxUhwL747wi0R
	bKD1cUxnk/uvWWGGcw026qdd9aiALNsTR9TAvEBoHmnzC9PycbXE/Nc5TJd8m2SS
	4hDKEgr6STBZWFkC7UzYb9zx2q/4JQ8QJ1berWmClugtWTRGuHQlr27dJnyXfR//
	ESxG5rBUOBr1NsIDCzXseUx8/K/tBOC9eJhty7sEhSz5TkKM0BWvelUw6JZtR5gf
	8PU/Wg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya83r7d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:08:31 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-948df60cec6so12953675241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773767310; x=1774372110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6D8U3SIIqxAUg2A7bL5ROijtK+tS/p1xzFHgwGCOcp0=;
        b=Ycz8d2cMjKZmkEbAHBV8hmIhfK9QGisAP1rarOayekOnJp/0LyG3o+dn/DtRykaBhH
         RE3FrOgjqS+2EQVAdUQBW0vQpw/qxg/xdYeum3s1DWPPUwSqVmgqwfYQwi9o37P+o8o6
         BRWAbRWkwBJK0nT8U0hpj4aGSzsOB2PS7jo/9rh2lHptl+DAei0wlf2nTpvpJgDqTAM2
         XQFpiiHjQEYcR1Oq/tYoC3OVyGJXSTOsGILDeZtpfyUjH5z7aDeAczjRvE9zLoVfxRdX
         o8WrxpLdt49FYK937f6wf3o/3Y1oqFd7P4zd5vYh+qc2o9yhdiqFqAbIP9mRiOQr0h/Z
         wWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773767310; x=1774372110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6D8U3SIIqxAUg2A7bL5ROijtK+tS/p1xzFHgwGCOcp0=;
        b=BrjFDk+ENldfH+gdJOWiG7bmRaDSZWuCdh3FLVvU2ZyDEF2Bj1iKBZFwSOZ4JvAKMW
         zm070UCHN8O+SCiBZht5zuaHZfCbwR+rpTqfsZrBbOu4WYbIA8tkSk8FHIU5U3vYHw5t
         R194LayQ70xA6/HFiIouFVVvxckjSvDFWDkY1Mmb25gHbW7A1neO9700u+Z3A9N5uBD8
         GClDcj0SDHcM6/Nzm8x9od8+VTpoVoq4XUJEArWz2qHhaYca5IQRO0J9JBVjQ2T+iVp/
         pLnVYX0VkGoeHsx0ovmVfRfYth3m+sT15sQnVYUyASSEbAbutSk0u19IU1FvMkFjlEtt
         dCdw==
X-Gm-Message-State: AOJu0YwQmw8GJUmmLcVcQgwajNi/6pObYxp2W2ewAO7GwxoOPjGa/C3F
	xTvCaCJyVbw/z/IWgwX79YopC4gnloWUpGQYq9nSEJg148Z8mW2uVNhrKIYrqYHi6cujFF8nESE
	IRqLpUjQZn2nuQ+DhUjk/VB7xYzFQzryiqeHf3/xylqQWFxnJwLvOQtKgb5FzjUiYJqTD
X-Gm-Gg: ATEYQzwKdxbXvcdeWDGTzuH5tzyz52SOA025qRMIAIyNq9btT03rkVoAHIcPBfp7n7z
	o5fOr7SiA5HB8Qjxlm4kreUz5QTq7w5GVCyD4rGw9rPttS14Rqiw5ksLBh4xWPdAEouUzjbL6qJ
	S60/TWI8KxBww/BPWUWP0t3Q/IDlmcuMlzlwewQmQET1SALsvuoo93Uvf0NpkGnGentDf+2V1oI
	M4C7Oj+W7Z61QP7A03YdfqxB7GfrkM2O/0TodOlkAGu8Cdm/be6QVPMKhDqgQ7bdEs7LF5Hv8gt
	fmQQxF952gBSrF641VL5gfkkElrTSu8DxcbhURdIbxK890l6a/WWLipbFXEbjUoIxy/sl77XCjV
	uShjUAmQHB2Lf6cebHiAcxmoBqzseDslNc10t0WFhaVMX
X-Received: by 2002:a05:6102:cca:b0:5ee:9f76:1ab with SMTP id ada2fe7eead31-6027d0bb01dmr266824137.5.1773767309940;
        Tue, 17 Mar 2026 10:08:29 -0700 (PDT)
X-Received: by 2002:a05:6102:cca:b0:5ee:9f76:1ab with SMTP id ada2fe7eead31-6027d0bb01dmr266804137.5.1773767309448;
        Tue, 17 Mar 2026 10:08:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm877072f8f.21.2026.03.17.10.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:08:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 18:08:19 +0100
Subject: [PATCH v5 1/4] arm64: dts: qcom: sm8750: Add display (MDSS) with
 Display CC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-sm8750-display-dts-v5-1-fb53371e251c@oss.qualcomm.com>
References: <20260317-sm8750-display-dts-v5-0-fb53371e251c@oss.qualcomm.com>
In-Reply-To: <20260317-sm8750-display-dts-v5-0-fb53371e251c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12120;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2PRsSq6yLeSUvG4Ur5vGs9rdyd8y3rpmOX+W6HIuq0U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuYqG9YfzbnsgHeT0I3p2zGC/SSGgJnfdWAOq6
 O81Lk+XXWOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabmKhgAKCRDBN2bmhouD
 131FD/43yMNKPx52KNwrRU4AOTvKm98UJcbBe5DjmbBf1wqeSxKPjDSOhyPujsOa3xGOrlniSOG
 53y9HgaXRDMCuCpAvp3Q+lzdH4Jy7F6mB2xl/VZejG+qx0bIlu1Ubd0B6PBWRO5c6cJB/4qrqEE
 Cd7qEusiZq60NFBYRgu4bz3nmzLCGrT0tjNz5C5RtV1wS/MLr3gj7vnQzPGuNr7ht+560wfU8OH
 XS/RzOnWCtlMGRBZdKnX5NAjxvS9SVnrVzgEGFXtIbcPUGZVqSuC0J9Zm+hJrAPARFMwXTKi1IE
 J2b2BC6dt03lSa4T3m53O3Jdi1MPNqkR/s//eEWM0atkkU5vWn4ztwv6+N8fIyk64HhwhF6z11E
 UQ4FiP7p4bhAkGvx569MIwUd1pf3cTpNy14MhKT5s8Pmt2n+2XA8GxzAueKv0KRCOjlotpMZ9yH
 O3spJNwQNjfSkGBl6MBm54f9m5oSMnAA5UPi35/cgAO8V/P1E8/ygXBO/UM+YLEP+YKtDGaNdNH
 ZjhWh/gTsn6Z7oxsNjN6boklonSdcVEq0FemK/8bULu77l1+2PK64fThTh7/bOHMrOpV4f2Q23f
 OZ6I50D2RiCJBdtJEDng7JAtGvyR/ph0uJ52uERti10RDvGYJ45x95B6Xz/wQS+HhEJCuBt/C1M
 vKmtJ1FX02cJxYQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: CYDwUa-oTp-uAQJaAMQ8byDJ6vA_8cZx
X-Proofpoint-GUID: CYDwUa-oTp-uAQJaAMQ8byDJ6vA_8cZx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1MSBTYWx0ZWRfX59//CmVnUB8W
 oBlC8l6ItAkGuvHrY3UAX6LRUQtlJY7i3wfOpI6g0x5nlEegso1zrzAu76sb6Azg3u7UBf3h4QW
 j0fGlijx1YtU6VToZa6obcqdU0ssErsJiEZsdNM7ktD+59RUQyEzNfujiympQq1eHfIRayc1rlP
 HsqW8ethByf8S6KNC4ZeHIAt/oWcQHeVzVRbo2WwEgImoNmbP+3h4OKNWZRjPEQZDupcAVxiojq
 JmWXx5VSZSpzEAaNaeZ6gB4k76gvaWlSco7z/Txgw97DhZsK1RMq5u34m2Vd6nKFKG9V/TR0H4D
 xuis+BtTdrfxO9lKrCmz98msz6yBmizNsCv9MbVRfZuz4XWJRAarUrM+ZRDRMJDl/2EHhjxXeii
 fLj71XSMtHCv8YYfhZSTMGnbHb10jW7i38x5faGZQEoWKKOKVz6TNerw6HoHYBuvP5CJwYXDTD4
 dxqJ58kFiW4tZHLTW2w==
X-Authority-Analysis: v=2.4 cv=Y8n1cxeN c=1 sm=1 tr=0 ts=69b98a8f cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=UlFr-3dliyVKfTjn4ygA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_03,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170151
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98237-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E6FFC2AF7CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device nodes for entire display: MDSS, DPU, DSI, DSI PHYs,
DisplayPort and Display Clock Controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 432 +++++++++++++++++++++++++++++++++++
 1 file changed, 432 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index f56b1f889b85..2927b8ce2214 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3,7 +3,9 @@
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm8750-dispcc.h>
 #include <dt-bindings/clock/qcom,sm8750-gcc.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
 #include <dt-bindings/clock/qcom,sm8750-videocc.h>
@@ -3001,6 +3003,436 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		mdss: display-subsystem@ae00000 {
+			compatible = "qcom,sm8750-mdss";
+			reg = <0x0 0x0ae00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
+			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
+
+			power-domains = <&dispcc MDSS_GDSC>;
+
+			iommus = <&apps_smmu 0x800 0x2>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss_mdp: display-controller@ae01000 {
+				compatible = "qcom,sm8750-dpu";
+				reg = <0x0 0x0ae01000 0x0 0x93000>,
+				      <0x0 0x0aeb0000 0x0 0x2008>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupts-extended = <&mdss 0>;
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "nrt_bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
+
+				operating-points-v2 = <&mdp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dpu_intf2_out: endpoint {
+							remote-endpoint = <&mdss_dsi1_in>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-156000000 {
+						opp-hz = /bits/ 64 <156000000>;
+						required-opps = <&rpmhpd_opp_low_svs_d1>;
+					};
+
+					opp-207000000 {
+						opp-hz = /bits/ 64 <207000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-337000000 {
+						opp-hz = /bits/ 64 <337000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-417000000 {
+						opp-hz = /bits/ 64 <417000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-532000000 {
+						opp-hz = /bits/ 64 <532000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+
+					opp-575000000 {
+						opp-hz = /bits/ 64 <575000000>;
+						required-opps = <&rpmhpd_opp_nom_l1>;
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@ae94000 {
+				compatible = "qcom,sm8750-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x0ae94000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupts-extended = <&mdss 4>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+					 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+					 <&dispcc DISP_CC_ESYNC0_CLK>,
+					 <&dispcc DISP_CC_OSC_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus",
+					      "dsi_pll_pixel",
+					      "dsi_pll_byte",
+					      "esync",
+					      "osc",
+					      "byte_src",
+					      "pixel_src";
+
+				operating-points-v2 = <&mdss_dsi_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&mdss_dsi0_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+
+				mdss_dsi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-140630000 {
+						opp-hz = /bits/ 64 <140630000>;
+						required-opps = <&rpmhpd_opp_low_svs_d1>;
+					};
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-358000000 {
+						opp-hz = /bits/ 64 <358000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@ae95000 {
+				compatible = "qcom,sm8750-dsi-phy-3nm";
+				reg = <0x0 0x0ae95000 0x0 0x200>,
+				      <0x0 0x0ae95200 0x0 0x280>,
+				      <0x0 0x0ae95500 0x0 0x400>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&bi_tcxo_div2>;
+				clock-names = "iface",
+					      "ref";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss_dsi1: dsi@ae96000 {
+				compatible = "qcom,sm8750-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x0ae96000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupts-extended = <&mdss 5>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
+					 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+					 <&dispcc DISP_CC_ESYNC1_CLK>,
+					 <&dispcc DISP_CC_OSC_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
+					 <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus",
+					      "dsi_pll_pixel",
+					      "dsi_pll_byte",
+					      "esync",
+					      "osc",
+					      "byte_src",
+					      "pixel_src";
+
+				operating-points-v2 = <&mdss_dsi_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&mdss_dsi1_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dsi1_in: endpoint {
+							remote-endpoint = <&dpu_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi1_phy: phy@ae97000 {
+				compatible = "qcom,sm8750-dsi-phy-3nm";
+				reg = <0x0 0x0ae97000 0x0 0x200>,
+				      <0x0 0x0ae97200 0x0 0x280>,
+				      <0x0 0x0ae97500 0x0 0x400>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface",
+					      "ref";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss_dp0: displayport-controller@af54000 {
+				compatible = "qcom,sm8750-dp", "qcom,sm8650-dp";
+				reg = <0x0 0xaf54000 0x0 0x104>,
+				      <0x0 0xaf54200 0x0 0xc0>,
+				      <0x0 0xaf55000 0x0 0x770>,
+				      <0x0 0xaf56000 0x0 0x9c>,
+				      <0x0 0xaf57000 0x0 0x9c>;
+
+				interrupts-extended = <&mdss 12>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				operating-points-v2 = <&dp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp0_out: endpoint {
+							data-lanes = <0 1 2 3>;
+						};
+					};
+				};
+			};
+		};
+
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm8750-dispcc";
+			reg = <0x0 0x0af00000 0x0 0x20000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&gcc GCC_DISP_AHB_CLK>,
+				 <&sleep_clk>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
+				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+				 <0>, /* dp1 */
+				 <0>,
+				 <0>, /* dp2 */
+				 <0>,
+				 <0>, /* dp3 */
+				 <0>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;

-- 
2.51.0


