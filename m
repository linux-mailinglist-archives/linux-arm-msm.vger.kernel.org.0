Return-Path: <linux-arm-msm+bounces-95059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EObnK2qXpmltRgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:10:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B69F1EA989
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ACF42304B12E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 08:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923573876A8;
	Tue,  3 Mar 2026 08:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPa5T5yF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="idQDjhc2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC06F388E72
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 08:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525265; cv=none; b=KtFwlA+AOSfIMzxidJaN9T/BLrjI94BN81UeH1249tee+U3vxoAHtV5xqMqhFsiBrrVuYIr7TdM1lcT5Qmqd+hE+o4ffgngXSnsPktK97M66tFFB20u7qfmRM0EDRR0PE21RHju2b9+fHG5PAcXVHjIuqYVVHOH5CevoKEqXcVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525265; c=relaxed/simple;
	bh=uWu9jIBwX829aGDTef07/6Q/TFFzpbhM2ciDeQWkElA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ddq6e7Yl54P3gZWRee8bDIspUef1UM5AvTb2yirCoFeeKr3SmleMiNZkr21MzDNByWGUk4KxJ9wkd3pfqd2SztKMKi0ci9SAoolyezvuMJ9r5vwO2AUNwYyv65KK7PypFPb29sKQ9gwcxsBu5YV3pDFtnui0wHD+Rq/oPzG/sT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPa5T5yF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=idQDjhc2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6237xBE32855593
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 08:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hjowCjXGIsH
	C4zVtpmF9MuQz/xIMztOUoGVJOyajdTM=; b=BPa5T5yFftYt5HotpDcnu1/sd+8
	1QKoID4zPum5xPGh+7krSfUfnemXeCAOxfpW7cn7icNMckq4lgeZdYjXCfLijI7J
	q7IClxAvPqaLxa3df+MevNNfdpwVVvaAtb3kHkT7pv/DxH6BJvNOOieCTSEXtKNm
	fwRCkaFpLW1q6k3RopHYLfkkE5oJTh4r6YUISxMCXzZddm4e86nGyCxykuwz3Fkp
	VIQ19Bbd/n324VfyRuugILUnoLIhfDlH3L7olcxYis0GC0EvbhUgGtd9Nswn8pzV
	ao0JzGjcQy/ezbu9SQtsac+n0azDygPFwf1tTpu0da7IBxpUKQgHCexnIwA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnuqu0136-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 08:07:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35982c5940cso1876107a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 00:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772525262; x=1773130062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjowCjXGIsHC4zVtpmF9MuQz/xIMztOUoGVJOyajdTM=;
        b=idQDjhc2LFP5UmVKEyJjA46fLKN15e9yKg8bFnRhzNWkTlomJrFkvN+JOnmKfwW4P6
         Ok/ttUUEpefIL9Mrg/os0axv6gIfc5doJmdyUHK6hCXO/YHC54t/7JbTkGUPp65XIAVd
         i3rfW6gFttPje/uDUThm866JkD1BjUaozVfQtxvyaE9rHdEOwphcnuZQfi6x9ZcXpLlG
         zS7DrIysus2ZfLnEDVMkFo9AMbe4jts+aCku53X4Bk87WkpZokhsQmxHlC1D4phBcgWp
         tAKVhoRxcAjXJ+DERxk/jR1lFMDqA5syVpNY9wsGH/AzvjZ8RMUaSIF9HnL7UUqgoogd
         wOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772525262; x=1773130062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hjowCjXGIsHC4zVtpmF9MuQz/xIMztOUoGVJOyajdTM=;
        b=PewKLRWHT6uSuQ0z2kHdUoi7f1ZMCz1V9+TfjnOiSbARLCFQwX4nrQAbKAC32kcJpV
         kvH8Wopu01wmgwdGkMISTQOlqrFN+BXT2tz0gcnxJxHtiFD5iRHZJH9zdskCsyYeSK4/
         UA3KaCbszMxiupzBHwBlN9QNwSmL13Q3Y38Yktuf5w8TQJijC7HPUyp1KGHPy5ekqRO1
         jdBXgM++yz+OJ2ZzrP0uo5cRF/JVafA1NnsQ71VIfPS9B4e60VzXJveTlE8YQLoGWAIh
         YNtidi9hesGwuuPwwTiAWc60g/BfYlKSLBa6N1FVMAmr0IWZxxm+9+ICLpMu8nRXgbkb
         K4hQ==
X-Gm-Message-State: AOJu0Yxqdex3yD2qg1jgqAWMUgO3TDDXVo3LcJQhjuOZ1kaoyoILBRtp
	tmCYZahyjTjm2iZKB0eCTD7EUgHuQSjf0jq8zfzPAwD4nabor4pED8LzKG7n3l8jD0+JnEEI0oA
	2EE5r+8Xr6Q3zcot9AQxW/ApjwDnEmBuRKRIIhNVgI4YUJ9d6sR23cfe/6xPjQiIXpAbHs+8HmI
	rE
X-Gm-Gg: ATEYQzwz+W+IFveOyBEgPg2oZdCiJtUUI5P3gas7ozQq/zhQaXWVv1DShRYg5BLMDym
	4Sd6/QBt7iye1Pn6Oai/Ooj+5zZHdGCcYvCi4iTX91hY2IH81pDZCU4P5SD4f0o+pKcp1xHYlBj
	hGR1mQlejkiZiN/e8a6kE5pWLoVHoeNgo95pinwStCtMJ/H+TO7O6E6jRT9S6QBTd9/itvrKz0F
	tYpcVvfG5PaWQnByM0EFIeEYHGRF8mh5hujFHKhc7ypa99HIoZ/r9lZykTEFw0+Oi0KfysJWXxN
	tLaXs7MXQG6SquC4FnnEoMlBWbWx3ca1ppeOCcOztuetHKo8uE6hRJ41NOGRvEcfP2NkOtIHVri
	hdI1AZuz8Nsm++Fp7L4kzFebjKpwoo89WfZ5p2Wsej9ksKL/YgEhYQOI=
X-Received: by 2002:a17:90b:2584:b0:34c:2db6:57a7 with SMTP id 98e67ed59e1d1-35965c34750mr11978637a91.8.1772525261849;
        Tue, 03 Mar 2026 00:07:41 -0800 (PST)
X-Received: by 2002:a17:90b:2584:b0:34c:2db6:57a7 with SMTP id 98e67ed59e1d1-35965c34750mr11978619a91.8.1772525261395;
        Tue, 03 Mar 2026 00:07:41 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c3acea3sm1445883a91.16.2026.03.03.00.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:07:40 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 1/4] arm64: dts: qcom: lemans-evk: Enable GPIO expander interrupt for Lemans EVK
Date: Tue,  3 Mar 2026 13:37:25 +0530
Message-Id: <20260303080728.479557-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303080728.479557-1-swati.agarwal@oss.qualcomm.com>
References: <20260303080728.479557-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=69a696cf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=bqNqw6pGn9JH-5OicrIA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: BDa_2nynbSEz4ZcwfxgcTxRKQr9z__kR
X-Proofpoint-ORIG-GUID: BDa_2nynbSEz4ZcwfxgcTxRKQr9z__kR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA1OCBTYWx0ZWRfX3BzuwvGijbTU
 q40CWpatLrF0Z1QMAZZRCIPN0s1XcYIlh7q4wU8pXO0z6Csj4MJfiLzBZwEluZlU9taIQvZ/qyq
 E5i8uwumZ7IEM5v0zmwqd0zeFF+BJoI5cVU7+QAZaz++9s+0oUJgr+TxB5CIOs3mbKjjvHrR4Fo
 lFBREnahjfO3J9gApB4vzXXv0GCxk+uWuY4G/udsxEzbAQd8HQsiIgmcuASlDRZ8Dn+xv3I8weq
 IKeSL6+8SDi/fzD36uEDGw6FEMh/9VWzqCT1NXs1/M9aTYpsELx+o3aT3k2yqEVvtLgi7ZCb9bj
 3kPunbYKLJnWSSLRuociO1qGUxKElvwqDLrtTXNfuh2rXhrRTzGRx789Ek4i//WiTPiDaEqEutj
 tVe+Sgwc9lfwha93RAkvFsGnrhfzj9Hrll1hgfGIuyZYW1TVvv1cEMNIIlB+64Tuuc9FVSFiTui
 hzQTDtRsFlqFW7qvr3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030058
X-Rspamd-Queue-Id: 2B69F1EA989
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95059-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,0.0.0.38:email,0.0.0.39:email,0.0.0.50:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable PCA9538 expander as interrupt controller on Lemans EVK and configure
the corresponding TLMM pins via pinctrl to operate as GPIO inputs with
internal pull-ups.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 44 +++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 90fce947ca7e..397052394930 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -546,6 +546,11 @@ expander0: gpio@38 {
 		reg = <0x38>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 138 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander0_int>;
+		pinctrl-names = "default";
 	};
 
 	expander1: gpio@39 {
@@ -553,6 +558,11 @@ expander1: gpio@39 {
 		reg = <0x39>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 19 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander1_int>;
+		pinctrl-names = "default";
 	};
 
 	expander2: gpio@3a {
@@ -560,6 +570,11 @@ expander2: gpio@3a {
 		reg = <0x3a>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 139 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander2_int>;
+		pinctrl-names = "default";
 	};
 
 	expander3: gpio@3b {
@@ -567,6 +582,11 @@ expander3: gpio@3b {
 		reg = <0x3b>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander3_int>;
+		pinctrl-names = "default";
 	};
 
 	eeprom@50 {
@@ -804,6 +824,30 @@ ethernet0_mdio: ethernet0-mdio-pins {
 		};
 	};
 
+	expander0_int: expander0-int-state {
+		pins = "gpio138";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander1_int: expander1-int-state {
+		pins = "gpio19";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander2_int: expander2-int-state {
+		pins = "gpio139";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander3_int: expander3-int-state {
+		pins = "gpio39";
+		function = "gpio";
+		bias-pull-up;
+	};
+
 	pcie0_default_state: pcie0-default-state {
 		clkreq-pins {
 			pins = "gpio1";
-- 
2.34.1


