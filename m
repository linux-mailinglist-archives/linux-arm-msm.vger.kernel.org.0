Return-Path: <linux-arm-msm+bounces-116111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6d/1HqyvRmpobgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:36:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CC06FC22F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:36:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="kH/LVAXN";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Z694M0/Z";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116111-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116111-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 779ED303A402
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F0D36C5B2;
	Thu,  2 Jul 2026 18:34:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5430E36C5A1
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:34:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017276; cv=none; b=ZTSrGynGRcj1iPilk8p11rxckEPw+VyvWdjY1TjOQ8jUc5vyK4QfQZ+Rhcp+aNYjOHgjhMSQK5c1OrK3xCWMmUv4O23NNUZKbDTg2w242wsftUyy5Yi7khnh0YPH0RWByc1C+k/TtoruAWhLZLk1Ezs64j34v7AvJmYTBiP5q/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017276; c=relaxed/simple;
	bh=vEZCAk9bX58jYAl+/vm7G2IzcvyJQv724sGua82/GL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kn9dib0IHC/7WpS84rfPNGQHor1GUrWDKjoM98zZx+gV3b47IHam7Cn2nhiUs+QeMRXkigBCyNKnAR+OXIRUp43dJz21x9c44RwMiz5Ku81G8nEUMaxP3NY+pEhOz5Kkfx2FrH7bU5Nc0aYTlLMs4l4cdwDF+D9Vsg/6Z5SwinM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kH/LVAXN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z694M0/Z; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3T5H549154
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	INxEC9lkQk8WXwhSmUHbixXVYFbQZX7AQC+fRCLBU1Y=; b=kH/LVAXN8uwmEPzx
	0i0s3Crsm+jNbPl7M2PjPVPV5GFLa6IvAvMvSnoBPi+4xydboQHQc72cLyhLwzhp
	49tlfJGzDYL2ViY0zJDC733Zm9pjEAc5BeXEWn9mMyxKpqRBET3jGi6oYs9LD658
	7nFXvIm2WKz4/rdJC3dsA4AFvzlVTLzNwYr5JQtLv6WSyMhHhT2Gs8pYv6bMK2gu
	dMCw8s/K7RZ4otbiZ4QA7ySJZIFUX9lYRqj4prDHvuCrsxNO6NEz87eCZtkGrLFK
	4mtNdH9dhy1EHIz9DSJZ/hNki7Wq3RiXMi2o4raeN+AUihNLSUWiwdPgF/DzlWfl
	H55faA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98k876-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:34:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8620ee0971so2212634a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017273; x=1783622073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INxEC9lkQk8WXwhSmUHbixXVYFbQZX7AQC+fRCLBU1Y=;
        b=Z694M0/Z6+pBVaLOnyX6jO7ZZX/CSxIKQRhMO6VN6AJ5+eB0aNn59UBCz9S24AcaHG
         eFq2CPLNVBjpPMZGOZ2oObAGwfsc2POWTCtkfXsZ9gVru8Y2EqQl7XyhZxYgsmkgzzoE
         2eO/HcDp16HgDJnemabSnqvXND5/oGNuuvEgmBlpnbwmjpjSHGQLTEAOtt9xuqTAj70s
         nhZ3nnhPy4+ofwrAeIuPZsgkKw/qlLH95nWOMFzIt7/yLEvgy+2K3nHCZJlwlS9DsNwh
         8N8CGLko69z84qRkJtgYF9jClDJM+sG5/PCdLcWyQ2fIIPZGCUBTeniYmWeWtvbC5Kfi
         Jxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017273; x=1783622073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=INxEC9lkQk8WXwhSmUHbixXVYFbQZX7AQC+fRCLBU1Y=;
        b=W3i8QFsamCuiAcllSUYU7WkWUtwytFy+0V0y6NKRDGLlLgJX9ejkLCwTim8ATRjlP9
         GhcqOufHZlBgFGDHT8l0WbElOxxPbUThyQYKSHCCa3b7FwM5vFZKN2rBIBF9WV8EdD+U
         CP9fp6YB7b8JdT5jhPwNhqIxACYNC4eC1t+ndPyPR9lanH4KdFrpvVqcsA1HonhcB6Of
         qG4vOLg3l2E/NqPr9QX1Vh4EY2G/Od9RrIWPieqAE1qiZGmW270gUr24/Q2MOgOEf0cD
         SVM/QlXO7+sRHZiGS193AQoCWYEnJsj2vtfAoegZCL+k5UTDE/+goQ3iHxvTtVGEE64z
         WCEg==
X-Forwarded-Encrypted: i=1; AFNElJ8NUiTbyQfnyqdqfRcSpkp7+J5ZKH6CUlNPRSZBCK6l50k/fY2WL8EPzkWqp1WWWcuw7HHvBpH6EfFfW9XF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Y4kzc24m2B56IYQUaaKRJoO3Zu2NS9xotRNr5CvyXCghOYHF
	mquwx8ksytLWWpEzQsxolCNCfxi0pLMXaESrFiCArURkKogPf6ZPKimAYv/AsPEK7EqBCpcEO8L
	vzBCus22R7aY9sVCtkl5/2JLOxF8fbQF8r1om/EPza9BuX+41KRvng/Ln+CjeNoJC1q5X
X-Gm-Gg: AfdE7ckA8jWwnowtfZTCgzSSaUEBE4R4vhur8VqeBySE1YDDmSJOYrKVTTboTCH1vp/
	suudak6mQh81JCm/xsXkna9gH0c2a6D8UEMS9iSEoucYBCay+UCMVZfiegec6EXU8s1zWc90Xuy
	cADwj8JWrU20waKoMirhb30IXMqOUtyJk0cfoiRphi/j4xEQ3UsR7ATsWGzaxVMd5aplSZmxfrs
	BJWylBRvykaOIS4ViYN8eadxRdzD+zvZd27bFK+R46puehIGquWQbQf1ksd5fOJD+LnVA3QXX2Y
	vw0aSrWZ4ZsTov/flLVz2kSzTkgMLUdAjdtpCDZ997vFAD7oxwBZqpb0tXUuVHxeXTqTfiaNJq5
	ebOQZBnX6LPRalGNAHILX5e2Mmq/ZEn6j58VvC5X1Eg==
X-Received: by 2002:a05:6300:4049:b0:3b4:84c5:45c8 with SMTP id adf61e73a8af0-3bfed236e9dmr8276187637.24.1783017273224;
        Thu, 02 Jul 2026 11:34:33 -0700 (PDT)
X-Received: by 2002:a05:6300:4049:b0:3b4:84c5:45c8 with SMTP id adf61e73a8af0-3bfed236e9dmr8276139637.24.1783017272767;
        Thu, 02 Jul 2026 11:34:32 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:34:32 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:39 +0530
Subject: [PATCH v5 17/19] arm64: dts: qcom: agatti: Add DSI1 PHY and sleep
 clocks to DISPCC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-17-cc13826d4d5a@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: e8kgYbJkfBKvsBBOM-3JdCR7xaEevgrt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX09iq8c0yOB4J
 IeqoBsms6Gp7dII9kgUuYkgchvOvmHKVQogmwA4VbnMuSnZ7GKypjPkmhsCadoMzQkokZ4yf234
 n3qj2HFNQhtuuQ6rxLH3a8DJmif03v0DVJ1hVwa+X5ljKf9C/lns1u9imtriasLOEqaRH+QQvMP
 XRAvtYBXvQTcK1bQU6KAbOlrD02Cgxq6zR+4gbawBmbrHOs4A2XB+UVEblUpgatZyHis9OCf1r6
 A0/F1nRYX7KKzcuF+mTvg16666bcIt17s+HbOoV2KEM0UsI4/xZYDOqpVuMaS11OSppcz6GuSI3
 MPcbKe5x+YFUcASR5FQyplj7t3Rs7uSaq4d0yNcAti/p9lWWH59bD9tdQHhybLYie/scOjspSkw
 HTST5Yayc8FQqW0eZKlhYjr5KeVtJjaAigQfni8RI9q5Mjr3wvWB2Rr1rPdIa8+dBc65Ds5Qr0j
 QLy/+8QDvhhj6wEWATA==
X-Proofpoint-GUID: e8kgYbJkfBKvsBBOM-3JdCR7xaEevgrt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX8ixDpLybQPIq
 Yw9c9ZN2e9xM1vviHzeOga+NcJQVqtQpnoFepAezoYX/Lkcld3FJhdoz8WQLsC18nH3HF8OEcDl
 SuWaXsOUScOF2caTCI/4sMmTQ1W+soA=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a46af3a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Gd0QNvzNEKi-DX6Kg7cA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116111-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 55CC06FC22F

Update the DISPCC node on QCM2290 (Agatti) to align with the latest DT
bindings changes, which adds support for the DSI1 PHY and sleep clocks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f0b6ae9b81528a848a75f6884f1b27137d780f07..f1d93f86d0a62a813f76580362e850ab847e51eb 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2190,13 +2190,19 @@ dispcc: clock-controller@5f00000 {
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
 				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
-				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <0>,
+				 <0>,
+				 <&sleep_clk>;
 			clock-names = "bi_tcxo",
 				      "bi_tcxo_ao",
 				      "gcc_disp_gpll0_clk_src",
 				      "gcc_disp_gpll0_div_clk_src",
 				      "dsi0_phy_pll_out_byteclk",
-				      "dsi0_phy_pll_out_dsiclk";
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "sleep_clk";
 			#power-domain-cells = <1>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.34.1


