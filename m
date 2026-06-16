Return-Path: <linux-arm-msm+bounces-113466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zPNdLxSvMWpspAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:16:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC8A695210
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:16:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kc4G34iS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="ZcMzzF/M";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113466-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113466-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 457BC3205141
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 20:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA345384CEF;
	Tue, 16 Jun 2026 20:14:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2A7386552
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:14:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640899; cv=none; b=DwIpvxjSUTYw2ayRNE53KE1yMKnb0PNNt53BuloYH44V3eNgQtAm5MP22e7UUfZtlvoCxcjCj4K+hMl9SCsMpyt7lBgqrM6fryd/3DyxX2f7FVGEGTcERoKdaNgrJ8KUwauhOqRl9ReNXe/N88GEhPM2/uVDCR3OhWah68wZZg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640899; c=relaxed/simple;
	bh=ODwdSoU7cqmB/7e1YsfTUheHlnTIX2vwYFihEXMDSfI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cd8kLoB2bD4CIGwYhF9gucNgsDwf5m3719KsD1VHe5VRgeI3KieEIPT9DatjcQQNNxKyJj0YEcLv1dlOsmVF9zqhcUBrvRIDtHKxXVdTc7WSt0+r2qbgBvDd5GNKi8d6AG0vGCgdSO0zn/KL1qagJHvqcJf8butF9C6Y7b/z6Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kc4G34iS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZcMzzF/M; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOSI63913510
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BNn1Y3z1D+8
	dRX7RzMyWh4L6G1MgZA+3f5EQFzZKjbg=; b=kc4G34iSWLnifCCD9JjC2kiZsdN
	j7Or0ZlNU/q8wkev6/ydsUG12zBM5aJi2ghtuzfWBRQe629OahN5GfNrP2WAV3Xc
	Fq14YvS7bc7T3a1I5Jx2XTwDg5aWbWRHrHUPC0UC8kho80xW0dzROJh10Qx1UJ76
	JkFXgLd016k8GluUXdIcA/tKPbybMMx3+4a29neTIwcQFwXm4AbqDd4SPmxfyVoH
	OdRTz6qq2TN4xMAHm8Cz/Ovz4YgI8haq5lCzHY74gQuKVWOjdMElnCX3vm5Sn86b
	WrA63AGRAk6xcl7g+9GuuckQo9B5RMGDaRZhJ7d1gT8dAhuK7PHM9dbWazw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7v0ka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:14:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf11699875so2175695ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640897; x=1782245697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNn1Y3z1D+8dRX7RzMyWh4L6G1MgZA+3f5EQFzZKjbg=;
        b=ZcMzzF/MYMJ/hxats3rF8BWCLM9olqUC7TqjyXZ37HZ/cSlAqWRphsU81xDSk5t1XX
         gyUl3f0dBpxLn9BHgjut4QoY86UTR+zxhUa6lv13tFV+++ISv8r01GU0HHVoflG9jdGN
         qrAIslTylfS/B3WhOPnnDLtCiG5B4E01SfgDOq8tXS+3aDQ6uXcW7t8oqqRtDV9PGM2d
         Ruyw+JD1owH6oSYghqqBwf7Y13u+/5g6rYli6Nx69174e/8WLhiPiUSPgtYbztbujhd/
         wOXE0K6nC7G4PjUSPcT6UTb2SvPOMH+rlpDq7u+98wp5gCa3/l0XASv2ZpmXN0K1Z1IG
         V1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640897; x=1782245697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BNn1Y3z1D+8dRX7RzMyWh4L6G1MgZA+3f5EQFzZKjbg=;
        b=tOz3YRUHEId6wFa94EDzGZaOJ2rqPj052z5vbgFzgTgD64ECrr2h2ibe41JlKNd60G
         qeRjNsuvn+fqr5WG7xC2JFkk5uzfC5nrMy/3zi7vQGMzPl4cUhMVN7KIK+UmHoDHqkZY
         oYzy+ToGqZEUH863n2MQDMPdqJVeLiS/XDyYzWe7ZOK5IfcV99JwcVaay+FeEwuC2NNt
         LPHQ5pWEKjj4IaxU6/hpgLI+O1/1CRIsIAiwobpUWlW95DzKFDdIrS+hMq+QNt0iZ+wF
         uiWVhIrpzRRd+UYCxkosSErEdLXuoEhGwi8sgcfXu67N3NYYH07yAUpaknsVbrL57BOd
         dDoQ==
X-Forwarded-Encrypted: i=1; AFNElJ87OoO1R0fJH63yToRVynkS+LG4w8+fta4Zej5k0OfvyastQIff5DcgRBe2CsXGyihasDQxyUoRc9d3h7Fv@vger.kernel.org
X-Gm-Message-State: AOJu0YyZxSrHqejwFjbNWsoY73MejgeyZuMu1ly1Rp3Hd+dvu3rB4eHW
	/xcfFG/MU0ClUUVKHbIj1W+Vt7mAFbB36LCwyCN90vRaC6m6KootAkgH/9tuMYUgrW8sWSSG0c0
	6JXqO6XI9coaU+rdovmO/pKs9fPSIaoOXG98YUm3x6v86yclFwrR1agNahffJPUFIFKPN
X-Gm-Gg: AfdE7ckY5jSf3b+8MJhPvsNc19O7FoeyzWHrUGJoeONafRnXAOVbk3U43iY4YQr2UHr
	T79F2w6FR2jBW2WicoqWKLqBfsvfKLnoIcxDAHycoS+o2mli954+5yYtVeDVKxbqfyqDiPnfCSH
	JFZG1eJ36vyTF5lCTaQUv+pRMdD5zf4cJUEe2OPgf182r4ufOfwVH+MOJL+zGuVRemkEcd5K3tB
	5IvKd8ezBzO99+izuuJQDB9gboia2+1FUVlvmI0tzeKkcz76xgGEI30OKoCYpXDHQrLGQ8VP4Bq
	WVr2iZlClMd65dkix0xssRJ/DShRrLQpxOirymf7m65xNFJ50ckpB+Zx33R6QSkxLbGnSTyOvjV
	4sAk9K1JJunMYShq1IJ2Uh5sMsNuhdNLJYQ1lrH6spiF1t8P/9MkI6ddFwQ==
X-Received: by 2002:a17:903:37c5:b0:2bf:1aa9:6c8a with SMTP id d9443c01a7336-2c6bcfd164bmr1794765ad.12.1781640897302;
        Tue, 16 Jun 2026 13:14:57 -0700 (PDT)
X-Received: by 2002:a17:903:37c5:b0:2bf:1aa9:6c8a with SMTP id d9443c01a7336-2c6bcfd164bmr1794565ad.12.1781640896810;
        Tue, 16 Jun 2026 13:14:56 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:14:56 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Subject: [PATCH v1 2/8] arm64: dts: qcom: shikra: Add QAIF CPU node for audio
Date: Wed, 17 Jun 2026 01:43:09 +0530
Message-Id: <20260616201315.2565115-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX50SpvZvUyHga
 mO39bVD83l8LfkkdKPPzC+IL6J170lt7vDjKyfe2r9XlNn+p3gMo4RWBEgUFGRAFkrGBCsJjYeJ
 fwP8wRjiusigwF4uUDUR2oqFsFTRQ9WIPNJ1JkicXEsyj9jRI0dadBupEKqkwmzlmJ/H6VJbrwu
 h4ujKLN0ugR3BpYhUTgp17bhMtORB1gtOZtggLUTMfHN6erMU0OhCjJA9CPWVdPyQ7OJe2XFZnb
 p4nfQl5FQQ6WUnfY9getrX8DyoqAvG+p6vZ7Ko/P5CkmlFIshX4Kmg1D67b/iGMw76lYn0fMgT8
 LVypDyyXL7BXygN6tOT3XyXuLO380mNPi0nRTEeCzaefg/rkYIWx8gASSc2Su/V0IfLuSMCg+bM
 WBThX0mddpZb1/krgUJ81ymNcaQZzhebxVDtWD5u56OgqGlQV9aG2WTaTmc9daSLPZPkn3ErJKE
 RjHBmVMd9UFHWxhyOVA==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a31aec1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=u7cSe3xy4d7cT3VL5CEA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: BcgUuuiWIXqCdaJd0pcFGGGaG_Nyu-rI
X-Proofpoint-GUID: BcgUuuiWIXqCdaJd0pcFGGGaG_Nyu-rI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX0W+Kg7FOg1Tc
 h4c6b2raYJK0uWS43/5U/yHs7ZDyndzg32pKarBu9yjlW82GhmKfR/RsCJlqQl4KKYlTT7dbJqN
 qhEX4AYb++zt7pRRTA682Zb8nmUPGfU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160205
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113466-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:harendra.gautam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1AC8A695210

Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
front-end links to backend codecs.

Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
the QAIF block. Keep the node disabled at SoC level; board dts files enable
and consume it in subsequent patches.

Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 46 ++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index bc4ad2bcbbec..e58c87fc8cb0 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2017,6 +2017,52 @@ dispcc: clock-controller@5f00000 {
 			#power-domain-cells = <1>;
 		};
 
+		qaif_cpu: audio@a000000 {
+			compatible = "qcom,shikra-qaif-cpu";
+			reg = <0x0 0x0a000000 0x0 0x20000>;
+
+			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_LPASS_CONFIG_CLK>,
+				<&gcc GCC_LPASS_CORE_AXIM_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AUD_DMA_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AUD_DMA_MEM_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_BUS_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF0_EBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF0_IBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF1_EBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF1_IBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF2_EBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF2_IBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF3_EBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF3_IBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_EXT_MCLKA_OUT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_EXT_MCLKB_OUT_CLK>;
+			clock-names = "lpass_config_clk",
+				"lpass_core_axim_clk",
+				"aud_dma_clk",
+				"aud_dma_mem_clk",
+				"bus_clk",
+				"aif_if0_ebit_clk",
+				"aif_if0_ibit_clk",
+				"aif_if1_ebit_clk",
+				"aif_if1_ibit_clk",
+				"aif_if2_ebit_clk",
+				"aif_if2_ibit_clk",
+				"aif_if3_ebit_clk",
+				"aif_if3_ibit_clk",
+				"ext_mclka_clk",
+				"ext_mclkb_clk";
+
+			iommus = <&apps_smmu 0x1c0 0x0>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		audiocorecc: clock-controller@a0a0000 {
 			compatible = "qcom,shikra-cqm-audiocorecc";
 			reg = <0x0 0x0a0a0000 0x0 0x10000>,
-- 
2.34.1


