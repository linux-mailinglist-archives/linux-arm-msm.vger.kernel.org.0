Return-Path: <linux-arm-msm+bounces-114873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zI/wCXAiQmo50wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:44:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 804C36D722E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:44:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=K7FDqHdA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=e0fayKy2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114873-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114873-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 911B730C3C22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20AA334EEF3;
	Mon, 29 Jun 2026 07:36:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E6A34D915
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:36:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718586; cv=none; b=anHIW0bSTEkns30zRa3mSwdc7EK1Zh2nuEywrAvbumMOgAXFmr4UdRVszKc4bzYUbEbdUvAmAp5sgbPrV+IxODnjC3qTej0fjFLyApilfKL7+AdwKfxSI1kQjAfgrW1Tj1LY/4u164ubjke6mmN2yiii9myyhKfSrVZrlhlL8e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718586; c=relaxed/simple;
	bh=T3CEPNSb8/M/dIWXVKivM2Blp2huvn6qcxNDVkeD2e0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M8KhdJst21awI2NYwZ+3GhYTpOj9DecJeGXecwICnyt3pbgh2s0nQ9t4flGag4dNoE8uUZaBZp3F3wH7g5HefMn4ZrwpgfA7UBy0Yvs2fz25xWioBWepSmcG6xdi7lbNrWPQIbeMqmpuJkdEqCsbfwBRWmEyVMzuctuqkiJT1Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K7FDqHdA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0fayKy2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rkds2116258
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0C+QKuMIW0soZc99z5bsH2GplHTlcg46DYutDjU8hP0=; b=K7FDqHdAOWM8RANw
	w8d0LOSvmepGPmsZw+w3gasQ6nXzv5a//W5IBXSwlx4WvMaiMApjNc2RY7TRAUhj
	mlFO7wNokVZT4BJMXyYOshr4u3PENaioqgVN1jiz7I60M1ktjevoYwIhLu/Qs28E
	kdUy1mRwg9E+pLOJXMlZvhDs+PKuZfLVJ5ZBxdHdzd55epgicIny5X2s4Cx4H5B2
	+WYTl95fOXRjPh37WcskqxyHIdR8bSz66gBVlVle78hhxP8KQLVXKjFHI00EEzqe
	oiLlM82kqcPsxlYnwUa0evExK3oMzOV+lASxpYQX2OQVVpSojr22RMDuDW/1UP2o
	NnOG0g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734dben-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:36:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37e1f96b248so37020a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 00:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782718576; x=1783323376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0C+QKuMIW0soZc99z5bsH2GplHTlcg46DYutDjU8hP0=;
        b=e0fayKy2iBd+oqR/GJq06YzWSed8wiVrKnVIyKOfC8qeyGMzon/wHP15dRoepD05hT
         xf1PSKDNKzqol6hLww5N3Mn4dAncbu6fxrQj0Bia+mxHh257ySCtEcXoJd7bZ8o1OBUd
         ZnA44RWMMkc8F6UYqxf7pnoCC+J7NLz0mprF3TtGDEgxvb+4KTvJ+dw9GI/8MfsSD/0J
         zm49X9y5zGFcfEUzP2sJoVA9ExCyXmnk/469UBtDSBaROK3frQH65KQwDcvDAMUSUf5f
         fIAMnmYhKfpqb25G4giLh6kPlIYXT+V7U/FLCwVRke5duXO+xsz/M8xVv9qXMd2KSFph
         /J4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782718576; x=1783323376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0C+QKuMIW0soZc99z5bsH2GplHTlcg46DYutDjU8hP0=;
        b=E75ht480be+Ja3WT6yPnyPVFGnZTxPPoPF1SUmzm3W0BPW+vnjhHWq/C8P7EPSyEoS
         4FiJ2E+xF3sZPAdzybnDnS8vnZ46lkrp+JUW3CsaWPJ5td59VL6+8xgRWIpE/bkLnBCu
         YhwlspiXSx49TeT1/j9eEihgZubK4H5QW3uY8s7cOQrY8oUQMsEbFdmkLMIJ8z+cQO7r
         pXlGV9mF7Boxop94cr7RJmWoPHBKyBN0S9lEYdPy0rL+a1jVF704junlx4ffUHSFRlAB
         rD9BDiPf/ehNUkRC8swZ3jVOoz9wG9JbBEUzJ4sL/RZDnYBnWn3lnPuY/TI8evzwkCHm
         fFBg==
X-Gm-Message-State: AOJu0YzyqJf3arPlfbtkNdmEys1Gqr9Oqf+/zt/Q/lx9sJ9oZnWhWkXT
	ga3WelRWRtbvox5TmdJtZwDP2liyTz4lmUF6GKhB48NxsU3MMC7NLwHBI/cBmXnW6kItYcJfJ4q
	wIELkZ0LJXHLEunctufT+FfZa8Kkd9s5MT5YDpT4/f2OI8xcYeDRvwJIq9cunWNAWV2cF
X-Gm-Gg: AfdE7cnGLx00Uu7pjqY4dql7gO+cDwSo16ep9M33Nn7EF8+9pLpNN7VlmUIh1InSNcF
	nVACDNp87VUbugvLP5neyUzu/AuN9jvBFW/4Emlcy9tmjxjyZzlihMwTfR/Ze86MelEdwJoLa91
	QCNLO010XCOaYxnkZQGNsHBAzgQH7DGL03JRfYax+R20C1PAxpm3O0xTLeWmI/kSMg8LXLoLLrS
	gwYXTuP+dfx5Y36worN0xmuGFycJpqLETQ4MdpuNTRDoObNOtvc9KtpACmBQ1ceXJNmZu4jhEFo
	5tgcimGb8uDtyQ+3smfiGzyo+OVUQtulavu0GQxWdrcPAuIgIM+pvGuoy4GznCRLpJmqHWqR0hZ
	YQoFeiKrZwfWmf2Vm5v6dNsHTIQX0LUMnNg01L1ZcWZ/w
X-Received: by 2002:a17:90b:4fc1:b0:37f:d9dc:557 with SMTP id 98e67ed59e1d1-37fd9dc06ffmr5040235a91.16.1782718575568;
        Mon, 29 Jun 2026 00:36:15 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc1:b0:37f:d9dc:557 with SMTP id 98e67ed59e1d1-37fd9dc06ffmr5040220a91.16.1782718574982;
        Mon, 29 Jun 2026 00:36:14 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37fa9629f8fsm4537979a91.8.2026.06.29.00.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:36:14 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:05:32 +0530
Subject: [PATCH v8 2/3] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-ice_emmc_support-v8-2-1a26e1717b85@oss.qualcomm.com>
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
In-Reply-To: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: oFmBkEABXNvLP9e0raBIK9zeRfLxiIHd
X-Proofpoint-ORIG-GUID: oFmBkEABXNvLP9e0raBIK9zeRfLxiIHd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2MSBTYWx0ZWRfXz7wtN55j1reD
 QQ/IgNr4BhrSIOk+Cj68lq4EXZrh3cd2oQwoLBmr20i/CXXegpZw+7SjwP79lArwtdMaC4IRp0R
 QugDdtRCP+ZXa9Tna1RzamHr49g16to=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a422070 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=uKQuvSuCY7vHg_iPvDkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2MSBTYWx0ZWRfX4rL9XABTlHeT
 P+vNVTfCZNAplCffJfa9KWQITr/rG4kPmHY3Dz559Ch/kpPj2zspdWzSm38OwR3QFdItzhaK+zl
 2Ra4oL0mz+dJn0UBqqEcgnl3mNk1HtJJ0Xq+38qxrLcxIrCmEvyW8kix8KBUcYeypJNnHkndC4S
 LUHkU+xldup86xl3zY/y0vUOJbJkBHH4CQidN9Pzrspsm8xhGpcTjpQtYWhdwbcZ7H2mLz+1uvG
 9DZObhui5r8e8rFbH8bvzWi6eORTaDHCLgh8m2mQcflqnXh28Vuon3mbW1jefHXIRRyK3NehEzn
 4ZuJnB7Tc6aFhPN7vetgkmwGaRIDtWxQ4DFGya8vU9ryLUkUKx+lyGfAmWmZ92us+EiTJMXPqoJ
 TNgFByJbE0jjl3ASFeOW8Qas6Fz+sQS30rLH3rJjWWg+k5XQniu5YYCtu0FcInrJz7n2JNtufQ0
 S4eG3Xp7UBCcY1jH3Lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114873-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neeraj.soni@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 804C36D722E

From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

Add the dedicated ICE node for kodiak and reference it from the SDHC
controller via qcom,ice.

Keep the ICE node disabled by default in kodiak.dtsi and enable it in
board DTS files where the corresponding SDHC node is enabled.

Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Co-developed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi                       | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts                   |  4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts      |  4 ++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts          |  4 ++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi      |  4 ++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts |  4 ++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi    |  4 ++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtsi      |  4 ++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi                   |  4 ++++
 9 files changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index fa540d8c2615..633ebfd86352 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1050,6 +1050,8 @@ sdhc_1: mmc@7c4000 {
 			qcom,dll-config = <0x0007642c>;
 			qcom,ddr-config = <0x80040868>;
 
+			qcom,ice = <&sdhc_ice>;
+
 			mmc-ddr-1_8v;
 			mmc-hs200-1_8v;
 			mmc-hs400-1_8v;
@@ -1076,6 +1078,18 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_ice: crypto@7c8000 {
+			compatible = "qcom,sc7280-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x007c8000 0x0 0x18000>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&rpmhpd SC7280_CX>;
+			status = "disabled";
+		};
+
 		gpi_dma0: dma-controller@900000 {
 			#dma-cells = <3>;
 			compatible = "qcom,sc7280-gpi-dma", "qcom,sm6350-gpi-dma";
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..1af10068edf5 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -1158,3 +1158,7 @@ &lpass_audiocc {
 	compatible = "qcom,qcm6490-lpassaudiocc";
 	/delete-property/ power-domains;
 };
+
+&sdhc_ice {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index bb5a42b038f1..ef126e29f09d 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -1093,3 +1093,7 @@ &sdc2_data {
 	bias-pull-up;
 	drive-strength = <10>;
 };
+
+&sdhc_ice {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
index df39a64da923..5b10ce277fcf 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
@@ -136,6 +136,10 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&sdhc_ice {
+	status = "okay";
+};
+
 /* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
 
 /*
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi
index 0add7a2a099c..1bb0e4b8caac 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi
@@ -98,6 +98,10 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_ice {
+	status = "okay";
+};
+
 /* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
 
 &ts_rst_conn {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
index b04888a98203..78e0309b699c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
@@ -126,6 +126,10 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&sdhc_ice {
+	status = "okay";
+};
+
 /* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
 
 /*
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi
index 38c8a3679fcb..ff26dee6b804 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi
@@ -88,6 +88,10 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_ice {
+	status = "okay";
+};
+
 /* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
 
 &ts_rst_conn {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtsi
index a4fde22e3355..ecf518f2267c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtsi
@@ -74,6 +74,10 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_ice {
+	status = "okay";
+};
+
 /* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
 
 &ts_rst_conn {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 8cac4ce9c851..dfefcad57f7a 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -744,6 +744,10 @@ &sdc2_data {
 	drive-strength = <10>;
 };
 
+&sdhc_ice {
+	status = "okay";
+};
+
 &tlmm {
 	amp_en: amp-en-state {
 		pins = "gpio63";

-- 
2.34.1


