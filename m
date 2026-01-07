Return-Path: <linux-arm-msm+bounces-87784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0C6CFC15E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 06:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 032C63054B37
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 05:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB61277CA5;
	Wed,  7 Jan 2026 05:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k62d1brc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CvTmRe2+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D36274B53
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 05:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767764122; cv=none; b=YfiOqDwm184yW8gnSQfrT3KU/w7XROH4hxfYo5IZOGfpbk8oYMP94eBZHYSNSorEpcpYnwNx8+I1kR7i/4+3uloipuTR9zO1Cek7iIA+tFDbpE/4ER4O7K90Gt+6z5hK75iAdk0s7BLvhtc5E1UKbSsCWS8t1aKql1qlHmtRewk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767764122; c=relaxed/simple;
	bh=Rd2oWqy4jH6gKVmMJzaxHYBgnnp5fxDA9W332BFwjEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BvbyQ0Er5mC2FfjKzXLRGFTkwpzlaK/KVG8H3O8majc+Z5gI3QjgKkI9Uv81ArPRQ/4RJoBFD5QkPsgE4TOL5YFDB9JRYICIiHf62ZjcC4UWhdOHRXfwj861/xcxR2+2sZm/IZL6dCtSu0hINB0My1WbWR6KMiPQhem2874LqW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k62d1brc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CvTmRe2+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6074mDjW1643113
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 05:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	epN5pM4ro8J0aEbfvjQJQmjf6Qd/DnroV833V8PcV48=; b=k62d1brcr5iWhA5d
	h3iTiqLaikEusciTlSYDp8cwj0D+yPIerjnGceWYqbtTVUDCnDUUSoHhRCyD/w0K
	H6DfIdTV9txn9IMBMkd6GSuAXc/Kt/G8fJH5AtvW3k7P0iBxYsJElB3bFv+jZeXc
	xclq1YpFBdl6LkkbxX/7P9LFUwFwUwY/TiHW9x9asYcqCXvsUZxnSjzkbzLCeHoN
	qnSXAbVVzrRmeMF5iEypvsDsm8SPLeHt62rBkGD2ZCOJCnOGrrPDUEs4zLu+GGZE
	DAaWCbZoeLRfTvogCGWuYGKgC8AbtHRFUnrBwwL/yQ99Wg21sA0zMF8ccu3dSpbZ
	PiMYrg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhgsfg4d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 05:35:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b0751d8de7so1425018eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 21:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767764118; x=1768368918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epN5pM4ro8J0aEbfvjQJQmjf6Qd/DnroV833V8PcV48=;
        b=CvTmRe2+naxyj6fBq3cGxbsEkyLvVi+jOX/9+nDm+EM4ev3FlENBpo1zguj6jSgxyT
         g+eEzcu6AGr26uk82pvE266XFAr64nhUQ2Kav9oZtSs/KUJDYL5u+BbVgkpwOTHRpr7K
         tKY1sA87iVWMNMKYPbrEmgs+gaNDq8l5+9PX0FW4F9A+cfe2JgIXaKujGWNKTCvrFv0d
         v/Xo0D5CjDAXr8QnBBMMkQyYrgl0I6EGPqQPQVC+sSMv2iSXG/3rYpVn0pL8jsIHTlYz
         mYu1R+nEQm0VeQQ8+6/YadkCTBeZMmzpyPoDC+JBP/QrL9e+CPnXOfqOiYZKnzjo/SEd
         LzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767764118; x=1768368918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=epN5pM4ro8J0aEbfvjQJQmjf6Qd/DnroV833V8PcV48=;
        b=RdqzxiMBLP/46drzPoAUMMjqhLKamc5/JrQmmVu1kx06oxxuyAjgQ6pb6JcRwCDFl8
         xj8YgoJjiVSaGkCqBSD/VfysXfyzRHhCGllrewAXSZmXKUwz0f09wTaR1NxvOzl58Eii
         ac9/K+PJTYqwoXiaX4+HtUi65mA+tcgWcvEcozkc95YBhbnQUrD/poc71yfz+MvZHTXz
         V/iANkDWKXok0TCD1mifgsmBbXmO71X4lR/oaWoj47ybmTMezJ3J3SlTS4vBR+sZwM/Y
         PD1SGo5QVg0EdLcKsL6+Y/U+lDbWZvpQPe1MlfysC7on6LWZNSWPmlKVeDdD0BOysAuZ
         xIVQ==
X-Gm-Message-State: AOJu0YyEGdLa+T5shhjTECo/7b/TrISoVx8iTMMVs/eHcJB+8kWDuFJu
	HaoI8hYwtuQkzdeUbUI/1lUROvkfsXDLKHX0cS3pG0PLrHIEkd5zFc46lGJSXR6bIl6BtqWMMop
	nc9tqC94jJr4/1yjpbG6uSjUrQyMIxE0VBtZXFnTv3EKh/wRW3todK1fgIAszYeFgwiwn
X-Gm-Gg: AY/fxX6Iz3YFCA9XQeb8nlVy+ipSPpa+b+29ilD4PwB9G/YBZZ23mfiHXLofdVTET4I
	0LWmanhk09XyuoH/SmntRpk0j9wMv6BFsz9vGzzgjn55Nmw1ropDi2Fq8+hO5OVppnOff9Sy7no
	9nyCyZJXgInuleGDFacPWGy3G9xqXH1/gm/YdTlERi9lTDctracNivgLbhk4fH5myOpxGsMXCjJ
	vWMfTfgXSUY2FFDtfE2RI8TPgpkhv4kU/JL7BdgJwqim9JhiOGnqdEC1Y3Q0Nai1ZO5CcCe6KX2
	NpQ8XN8VdqbPj15e9h+83RV56uKv3Tz94okq6A/eJHamUDdDnyeqOCNTpFLr4SDKQDdl8eGaPld
	tbj/ak0ecZh4oRDoA03CfLDdCjTI+m0RviW6PYFXKAom0nFYG6ePP
X-Received: by 2002:a05:7301:6505:b0:2ae:5d5e:9b1c with SMTP id 5a478bee46e88-2b17d1fb255mr1175685eec.2.1767764117695;
        Tue, 06 Jan 2026 21:35:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/QxKhmI1qvpTLhwmp9JWBE90uwQOqMfiggqzQL1n2dlmXvB8sr69JKO3HqfiCGdg6gn7JyQ==
X-Received: by 2002:a05:7301:6505:b0:2ae:5d5e:9b1c with SMTP id 5a478bee46e88-2b17d1fb255mr1175656eec.2.1767764117167;
        Tue, 06 Jan 2026 21:35:17 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170675076sm6120311eec.2.2026.01.06.21.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 21:35:16 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 21:35:14 -0800
Subject: [PATCH v2 5/5] arm64: dts: qcom: Represent xo_board as
 fixed-factor clock on IPQ5332
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-qcom_ipq5332_cmnpll-v2-5-f9f7e4efbd79@oss.qualcomm.com>
References: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
In-Reply-To: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luo Jie <quic_luoj@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767764111; l=1690;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=Rd2oWqy4jH6gKVmMJzaxHYBgnnp5fxDA9W332BFwjEA=;
 b=pbXe/zapz7RZIExVQUGbhTHrjkIywJz5nnPEHaJdE+KdNKlQKZqGfn1rXtxzsA5sgvhAAPtlK
 A/BJYcRwJXuCFN5irrod0p6gHo7Trh/CAGqtc9hX4y8tZ43WAOg5wwK
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA0MyBTYWx0ZWRfXx+d+76Aucb1N
 vEsxmbHzcN0Rntsp46+tax9yLasUiQRi54vFQeIyFLTmdOFke+7diZLrcMDVz+tl3gjw05Xw88e
 yq9o+0FS1wLewATxbqHlmbwL0dd0WC3MlVNrA47dYiyWXkAAcPnYnhHCYA91H2WvF7WrDTXTz1m
 UbeZvB1fryjZHLaYiwpuQcs+Y4CK133EJ/FPGH2/9p6pHpBehY5kh9VeuLq+E0jnbuqbGjS4BKC
 W0hhIWNtc5+qVHXiMY/Rhff/1kXNYn/TV1p0sQSUkuVC5I9lRiQbJo9UdZJw2hVYayaqQDnJ37e
 PGK1CSvkY1jrq77ERyPnfIv1oszomwNabgOxZRHUiePUoEARsyuHBPm4+g80ISa7vHB3agFQia/
 hI3gU/v7B7FyFz2RWXXIQH3IGaCa5lvqbUeDb3WzCIRBgHrzVRzwTamUw2i/DDArVKJjuJt5MSC
 g28b/uBRl1LVyTTGTww==
X-Proofpoint-GUID: u9-rRjlQrzocvEE8yQAYv-f8VTGye_5W
X-Proofpoint-ORIG-GUID: u9-rRjlQrzocvEE8yQAYv-f8VTGye_5W
X-Authority-Analysis: v=2.4 cv=Abi83nXG c=1 sm=1 tr=0 ts=695df096 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cZQRF-JHJlm1EiHCSyEA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070043

The xo_board clock is derived from the 48 MHz WiFi output clock (divided
by 2), and not a standalone fixed frequency source.

The previous implementation incorrectly modelled it as a fixed-clock with
fixed frequency, which doesn't reflect the actual hardware clock tree.
Update for fixed-factor-clock compatibility, and properly reference the
source clock.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi | 7 ++++++-
 arch/arm64/boot/dts/qcom/ipq5332.dtsi            | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
index 471024ee1ddd..e1346098ab0e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
@@ -70,8 +70,13 @@ &sleep_clk {
 	clock-frequency = <32000>;
 };
 
+/*
+ * The frequency of xo_board is fixed to 24 MHZ, which is routed
+ * from WiFi output clock 48 MHZ divided by 2.
+ */
 &xo_board {
-	clock-frequency = <24000000>;
+	clock-div = <2>;
+	clock-mult = <1>;
 };
 
 &xo_clk {
diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 2b1d098f9424..c076537c6504 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -29,7 +29,8 @@ sleep_clk: sleep-clk {
 		};
 
 		xo_board: xo-board-clk {
-			compatible = "fixed-clock";
+			compatible = "fixed-factor-clock";
+			clocks = <&ref_48mhz_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.43.0


