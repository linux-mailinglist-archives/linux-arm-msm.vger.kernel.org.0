Return-Path: <linux-arm-msm+bounces-116113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zUenH/myRmppbwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:50:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1006FC4FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:50:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ED2RE4Sd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EL0iMdj8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116113-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116113-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CABCC31F3AED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF08036B043;
	Thu,  2 Jul 2026 18:34:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88AC36EAB8
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:34:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017288; cv=none; b=PnUF4Ndgp+l+K5VkPQ+p4Rame41BPyC5rWgaQQ+kKbfPKOEcw6FVkNG49pMVQBDpQCXGJMv0JG9h9azkkEeg2Tm4GRotgiqEgSgPxw1p0X+kqFawiicXrEWUu3yBwLQ06cMA64wcO5yZZt4MvkM4QL1yX9eCypC/LiMvTorfrYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017288; c=relaxed/simple;
	bh=cx9dH+fPvbGPwctfTnUVbOozhcl/R+Um3kyHRpThNdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUpoh9xHUn3UftO/0sbvm9zQIrFDrFpyCzlwgMbEhQxrw2c5xyw73wi0YdPoj6tPv48CrHCeL5QKwigJWzZkYpmq6g82C2UHp+jNAAg6wDUNwXJmpt9jszFAIOJD08OEF+ZVuRDpefYcNHtSctoSoNbmL0VAyfeXJO88hU3wl94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ED2RE4Sd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EL0iMdj8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3BfJ680938
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lgZwKjPlID3iGtsiOBE7KjJxEWUWSAaIZvGXlBxzDIY=; b=ED2RE4SdTZzGShsT
	7DTAoGBkpVfH8pz2vijZwCXHrQsoRrk8ikDpUKpkkXw7wypremxboNeBrgCID8/l
	hvphS14kNjw7AFUGclFU3vkD4T55bcBltLY+tVVhCZVx/0Zokd3rH+Wua9OxAa2B
	MzsWpfPnk9Xxpr2tBax2lVHXKSH55s3rQ0JSU7ybF+7UEokd1b/qMNnjCSDgIsyv
	z86+PotnyYOF/swrgVhO/yVKXJ/8p0D+bOeRVJTSjFN6dwNmTVhLMzG0Xmbzj8bf
	lfFc+PA3dBoFCzOHnSGXZiJDpBhkm4inEGsDZvL38JcA5cYY2T8Y1uIKQHoL8D/8
	bHv5BQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwtfns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:34:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8478d2bea7cso964108b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017285; x=1783622085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgZwKjPlID3iGtsiOBE7KjJxEWUWSAaIZvGXlBxzDIY=;
        b=EL0iMdj8oMxMSJQvXDch+1Ouo+rEk6hVP9qwh+6JFNliKTNlXHr9/iL628JXvoSQyR
         27qX/4rBVlz2mbyE/NjHB5NTcckvTeVaf1+DD17ptG7P/vHY0dREOtep6VkGHgE0KuI+
         w+90VAuRqM7NUsSYg62FS1EB9YdpJbiNIk5TUPoCYRJY9s5y9Xd581DI7pVNCmSzfnTO
         z9cHKglJ60ypobZdXSj90Vg5XCRgFLeaSBWBPlJ6p05Wv0dezEc03PAsoLgYSQ36gjpM
         A2H60jxLEQru8StpqIEs3o6Y4wF/pJVD/rPtiPhnlYA/zLBopysWZ2kWlACsOVpWG9xp
         0m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017285; x=1783622085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lgZwKjPlID3iGtsiOBE7KjJxEWUWSAaIZvGXlBxzDIY=;
        b=JefB7wnCSYivXWVPwjn1ZIS0HEyC1xfJATP6uGpjYNflkN+BeLVmdFCZF2bJfco0xI
         xzsFuOIWKYxtcODkdqx6fxjyE/WavmxVj4pBRGghinNFYjREEWRdT5wdoedEBcvkHZI1
         GMOTjr06DdVXU9PlBbnRc7cqSIphZOZhZwe6AG7L6/BYc1ao+r1ZKLigD3L4YmfIROQB
         6NFM2ozvUlu8Ihoek/fmht1vj6PDdiE+xTQl4EN64k1aElDkXP6k95g9SYivIyXaraBd
         1AqQ6OdGRHeWujphYQ+5onNii/fNJ1023lWO82PD2OyXSVzFff7Sb832j+P6wFhzTJaR
         DdZw==
X-Forwarded-Encrypted: i=1; AFNElJ+bTrHMJKJ3cQ4D9iubltxSEGw9ASzPqzLTo+5v/UisP0qA5k+h3hnt7saPvnJ1DJGq6QCfI7W8cg4Ehz8j@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/vbjnOEI2O6twn7Fj6u7WNLgmvqF0Ti44kVahoHR3ID4d69wp
	iNFPinAJHNrFA1Jxh+OdawLNm4/lluEAEJLzxRwzbvOWcPQ3AVHUw7+hpg5jE5wFhFZH4z7cUSA
	vnily4S9P9qNRd033xeT5m97mNTGBUz9HwpctYu+zRIJd0qa6VGF66mFQ8Z2IPjNRqUhQ
X-Gm-Gg: AfdE7ckam1wZt8wu3yWuFQBb3XN8MLtSWf2dI0frR3xetwTx0RbqgmkxkV/Nr0OGqTK
	q3Z92Qna1zDQdprLsDd108k/Oa3wZZZw0aPmqQeEIDbCndlmZiZQuHXH4+X+q1fo12/Tgcreiqc
	g5WVBEjhwMn/wofIsu3uYdLF5Cr3b2FuOvEwN9p2Zl9hKUGu2kajQDhPdqSDxLxu1MOEe3LY6bA
	jRnjyASgyi2wS9AniN7Lnb9JQQA0G4E6eWT76SUVtcdMTC+jrOcNwYkpX1RAGLCGT5xGzI5zcPZ
	JJr0QTS3yWZSCc1UEyznc/Ix4RBYV2MRhjdUNKbFMJsHic5A3G/1jDtVZqPt6hgAXYN+hedJDLx
	Ytu1oHxebxxcimhBAZvYDoVXR1Jds3EGYWSNMy5FYaA==
X-Received: by 2002:a05:6a20:a124:b0:3b3:3506:cf3f with SMTP id adf61e73a8af0-3c01c5e8792mr1184354637.1.1783017285196;
        Thu, 02 Jul 2026 11:34:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:a124:b0:3b3:3506:cf3f with SMTP id adf61e73a8af0-3c01c5e8792mr1184324637.1.1783017284738;
        Thu, 02 Jul 2026 11:34:44 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:34:44 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:41 +0530
Subject: [PATCH v5 19/19] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-19-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: mW-zbTmGpDPP9zgrECulMnwoy4U2kPod
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXxEl7MsMbLPKA
 k0nr2n/8D8p8vwtHTF96988lkK4oz0BQ3Au9FU5cXkW+rb/nP7H8OyQngVJNOAf8znfA+QtGhRO
 ZAMVbIQyASOD6pvUoBzStYnIpNC+844zrzRUsN6TF3YDfEotHrdyJxfsXfOF1D0TeUUcoZB6KED
 uM4oSBn/Gg4YicI6pEabujKtfrd+yMo8nz5JYaeUEcYx+2DU1p2MpK3r34X96tglK0hxUDUfULV
 UQLq5oYK75kGvp6s27jaSjeu4K0wIW1wsjEdnFiDnlbDb9l0HbuwHg9TF6ggiefFyCw16YBqu88
 BmxEJ3zvJNJBKI+XBl8uivzuZ6YyXJdZaqUL2DMx+GzUL2fDTyih3Ff80lylCEUfcMAhO8m7XSC
 qavShkvWkuygkmBSUUup5rMN3Q0Acy7zpzL9TqHB61GmFqcW55puIosSGmNk2hzZgajrAQnPI5h
 yPM+D6kQu3qtYOQ0EqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX+4FDEo2OfE+j
 YCS8hQM9dy+sGEelXB1Y+bgdrVgQ9KOkk3DQSlu2BRly5uGhkqc7RnYK+b39XS/HIM3Dr59Lg4d
 9YY+pXRqYpEp4uYTAyHxLLyiFZClDe8=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a46af45 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KUIDwAxYdJFQKfevFyUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: mW-zbTmGpDPP9zgrECulMnwoy4U2kPod
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116113-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA1006FC4FA

Add support for Display clock controller and GPU clock controller nodes
on Qualcomm Shikra SoCs.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..39aa3a47564c55a3029763fe92cf485d2569a000 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -3,6 +3,8 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+#include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -640,6 +642,46 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		gpucc: clock-controller@5990000 {
+			compatible = "qcom,shikra-gpucc";
+			reg = <0x0 0x05990000 0x0 0x9000>;
+			clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		dispcc: clock-controller@5f00000 {
+			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
+			reg = <0x0 0x05f00000 0x0 0x20000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
+				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <&sleep_clk>;
+			clock-names = "bi_tcxo",
+				      "bi_tcxo_ao",
+				      "gcc_disp_gpll0_clk_src",
+				      "gcc_disp_gpll0_div_clk_src",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "sleep_clk";
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1


