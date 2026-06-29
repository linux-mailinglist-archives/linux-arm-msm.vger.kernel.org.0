Return-Path: <linux-arm-msm+bounces-114874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3lfmFQ0lQmrH0wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:55:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD3E6D737A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:55:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UQFtxksp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IMFz03gl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114874-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114874-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 582AF306160F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DA63BED69;
	Mon, 29 Jun 2026 07:36:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DD9343895
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:36:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718588; cv=none; b=fF+qYl1KgBRu9V4+LkdVh1m3GVx0lj/4RFNEYimTUfXm2zvrFwqHfhxnEGdomeXeIvYaOEeAddkrnc3bAb0bRNFyJhcGkV/D8bPI7nzj/FWWzfazQ4G+Ljpu93zh0i0x5IJqdCQWHXweD1/+5UUR1OYIXDKxpZFpO0Fdh3ylEDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718588; c=relaxed/simple;
	bh=KduUOH5T9zYNaEkE/nsatQgUrv9nJltvgQhA+2jmxok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ch0Lxw8pZWD8nFlVpIHfhxoYqsQlGbgPfqZOBEVEl4nxWR3/jwxpJ4zDkPm/ybfaY5g0OXQDKj9LzPtjz6BN4glT58iMx/TugW7RxicUl2+fqxWmW2q/8nEJ163r24G/VtDwWOYFqRwxRuRZ1EnIu+GBYwD35GqugLlpq4v3H/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQFtxksp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMFz03gl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rGuJ2115242
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gPwTaRyfKuZR6KfUFFjBnF4+NUecOQtXCIM2vUB7JVo=; b=UQFtxksp1UkCHC/I
	ro16XbVYsZRhyq3fSunKqUqvCsgCTv9+IpOwZxv+nhkvW6aMVpfl2U423DqnDgz/
	ZyzqfZ5+wxxlf8L+bLCIyftwt0tYL0G0TV803zO9BxIxXPsdsHTGa62nFIPsLETo
	75K/vrCXYMcR5etZBPhJh++cw9yz5R3mrYXfXin6YMjE7oYsqygTK4JR2CL1fRa7
	/r1rzUIoKzqDqffdHFMHvVXhSyVGI9b2gQkyOdFJrJCUvoTa9TDi+PhDEB2eMS0/
	3lyGdV0ugYaYfb2le1vrCM8uXgWYxY2+hfwTG6iTJrNn3oBE+FH0VG5Q/SITIMeQ
	iaDMkA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734dbev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:36:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fb9d7b524so1465802a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 00:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782718580; x=1783323380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gPwTaRyfKuZR6KfUFFjBnF4+NUecOQtXCIM2vUB7JVo=;
        b=IMFz03glEgbCrHa8EmbCp6FM7ssZRZT2YsLG99x5rFWSp+6uoc/YdKWKoWnuJ9mCwg
         DKcX6jabyADDY1NUgxooFwjTphFXieQ+zjiUVJs3gYTAb7aDX7gXMMJ6xSvURZz55pWO
         Bfylmcd5IMQ8CU/oOOoqH/S6F3cBAsIyFFDCDDkyIsjiRDU4Lw4YODzB0fRg+Ufwyu5H
         nvUEf+0T9tIVcYwDG6h8ULZgzQ+tXO0gpP0QMeSpBWl+eNTOQM6re+Yo08rl3ObCYiDv
         KJ9rjBIwqVLSM34FdTk/eFOCliVg+GJfm3h3CSymt7WXNMlfkQ8PIkzIC6CiBVX+s/4m
         oRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782718580; x=1783323380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gPwTaRyfKuZR6KfUFFjBnF4+NUecOQtXCIM2vUB7JVo=;
        b=BjIdxAnULFx2gWQOCb00t2uyUzJ8XQPCB6SK8hLO/v0HaWpkQQEZGVDGgo5sAlG3VG
         4JnWTFwI1RMNnAg7lgps9MGi/7R9RBgjG0dLlqGVZGbu43njjj2lw94Jc13+SMlyeZmP
         CjUBhLYd8HkBlOAq2Nn+gupO4+k67KvaWNrvtkSbjZ6mzkdt4ZFkF5hV81ewaJSAQPuT
         tUDp+dxkzhEU+4oaqzJV7qYNN8FTveOVXCA0Xe6dU7TnsEVi0WvsLQOKHy5r73uBPUy8
         lliFv99UtqY/UPwLExnZuu2RPxQylFT/2Wkw+EJ0gp9DoyPnQj4FrBsNhq//dYS2BWBR
         5JIg==
X-Gm-Message-State: AOJu0YytIOVbC8WaMSye2wEIH/8Bm+PIhWX8wI+8l+5G9i8tyRLR/J8J
	sW0GaqsOZiY2g0Y5G0eSrgAz4QDEy7C9+Jo+WO2ILMyhNTcvVF3r2rJrJo2pFPQ9rtkW7MYrKtf
	RdSdwzjtirDBgYq5ewQkaC9ZOgJa4eNQVghT9ZYW+DiGaeJU2YUUHorRIQbY/yUZjjkYr
X-Gm-Gg: AfdE7clowS0I4Jgyi6i0FZJTvhS6If10xes7UeKbpyj1v8BG92wezYcHMHUWSbyCkqn
	Ka7lU9/o9HPkA0tnqQcNS6gaK0D5Nk685p8oSvHRCL1dJVR8nnlr2wWDS3nlpMU4cymU24DHvGT
	jT5ztE5xlO+VgaGHcbty0Y67YzPEclaiRdkL04ByOzVklDUHDky+5oTsTE1k07E+exhL4cZF97e
	ETaVt3La+CSpHc2KM5tAwlRK2ogv0+wS6n2hp1Lc0BvcPVKYIAEWePGQef/zCqZHc4HXyELIUeD
	QjKpX0jlIIfFSfKMzaRYBnEAp7bl6wo78LTRzdo7YDl9jrxS8neb+aWPzfSO52CMiqvtHJr90SP
	irJdncYjktdyErAOam8bUSRNATEUCAdFHuhIeDHYFiODO
X-Received: by 2002:a17:90b:3bd0:b0:37f:c239:10f5 with SMTP id 98e67ed59e1d1-37fc2392925mr5471924a91.12.1782718580032;
        Mon, 29 Jun 2026 00:36:20 -0700 (PDT)
X-Received: by 2002:a17:90b:3bd0:b0:37f:c239:10f5 with SMTP id 98e67ed59e1d1-37fc2392925mr5471903a91.12.1782718579547;
        Mon, 29 Jun 2026 00:36:19 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37fa9629f8fsm4537979a91.8.2026.06.29.00.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:36:19 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:05:33 +0530
Subject: [PATCH v8 3/3] arm64: dts: qcom: monaco: enable inline crypto
 engine for SDHC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-ice_emmc_support-v8-3-1a26e1717b85@oss.qualcomm.com>
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
X-Proofpoint-GUID: LR93YV4C9bFbb-UCVSWJ0m5SkkvADNXE
X-Proofpoint-ORIG-GUID: LR93YV4C9bFbb-UCVSWJ0m5SkkvADNXE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2MSBTYWx0ZWRfX2o7p3QMdlEEK
 utULa/i1Jf9cq3uFlm7yDgmpV+8uGVCBM6Yp9J++KHhUo1Q4TizTYlMpy4cXDwuqPYn8e83kbV+
 tp0bW5GDMMboo1nePQTxndn2KZ0uYiY=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a422074 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1TJM2g-zu_yJeCZsWRQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2MSBTYWx0ZWRfX1BiyqREra1U0
 zfKTrtEviDYIV00092a1T9nj2qRMFNuMQy8FHO+HrtqC/Ej+gLs7MimZZrNuWZlKmpHfwU7Ipca
 LZyDBn3JIifPbZz/0USQbkvLOiwlkxfoKe5iwAELgeDe9cp4tbNSI1+pe7AYF8J+mvYGT1Zug/+
 8SLhPcn08oiA7XYCC7RDKdxRSkwb5WAXrW4WCkQ3Ngd0Y2Tlz4d4aVqW7X+fv6Np4IPsVyBEbKF
 pPfPqFeQ+bopiRrSBk3DoruNYKAKC6TB9VwUXitXRwnyam1taG0FEBxZgxQ/rcGuOasYblK3rZt
 f7yRkPuT9J6O9Vw2GdL6KgIrzcO0SBG7WOM6Bejmk3/MHUDYOiL644rx5Ihq8reMYtG2AE4ii9S
 2CSfrR2vsxQPJQWPSWmb7S+CyCDYfgx/cGcAKVdH5lCrnAYDqnzlxDTZ5kFt5eWbzAtq+oJ7UIQ
 i2ueMIUc1CDLbPZkwFw==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114874-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDD3E6D737A

From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

Add the dedicated ICE node for monaco and reference it from the SDHC
controller via qcom,ice.

Keep the ICE node disabled by default in monaco.dtsi and enable it in
board DTS files where the corresponding SDHC node is enabled.

Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Co-developed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts        |  4 ++++
 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi |  4 ++++
 arch/arm64/boot/dts/qcom/monaco.dtsi           | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts      |  4 ++++
 4 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..2c7d6ebc54fa 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -705,6 +705,10 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_ice {
+	status = "okay";
+};
+
 &serdes0 {
 	phy-supply = <&vreg_l4a>;
 
diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
index 9b5ed55939b8..62c6f45025c1 100644
--- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
@@ -282,6 +282,10 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_ice {
+	status = "okay";
+};
+
 /* Ethernet/SGMII */
 &serdes0 {
 	phy-supply = <&vreg_l5a>;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e4c8466f941b..71f4bb164ec3 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4835,6 +4835,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			supports-cqe;
 			dma-coherent;
 
+			qcom,ice = <&sdhc_ice>;
+
 			mmc-ddr-1_8v;
 			mmc-hs200-1_8v;
 			mmc-hs400-1_8v;
@@ -4867,6 +4869,18 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_ice: crypto@87c8000 {
+			compatible = "qcom,qcs8300-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x087c8000 0x0 0x18000>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			status = "disabled";
+		};
+
 		usb_1_hsphy: phy@8904000 {
 			compatible = "qcom,qcs8300-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d82..58c4a328bd3d 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -726,6 +726,10 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_ice {
+	status = "okay";
+};
+
 &tlmm {
 	bt_en_state: bt-en-state {
 		pins = "gpio55";

-- 
2.34.1


