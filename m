Return-Path: <linux-arm-msm+bounces-115029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oEdQOKZiQmrf5wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:18:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 914D16D9F69
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:18:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Z3XvLFHh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aadn2Krm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115029-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115029-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F9C0302B839
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9253C3FF1AD;
	Mon, 29 Jun 2026 12:18:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257CE3FF8A4
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:18:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735488; cv=none; b=rtujpY8/4gjJAw5JOpkniNl6oRPT05eyGqWtcWvqK+Cwc5bFIO81CqM39QbXP7cc80dhgmhhGdzR+S9sFjx9n45xnZBc6fE/6Jo1ZDgFFKdt0TGZx1VtgfcTK/Ab9ul/uWr1Z0NfzaqSq4LOfVXAc3D2CAUMPlcfH3rhz69ifjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735488; c=relaxed/simple;
	bh=EpfwTK8DMrHR7AmYBFu6yIOOpnWyI3tL1DbnN9T/mBo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rvdr/DV5LoTorPm6IOct84Rj2RGYV0inetsvC6mPtn284jtTn14+CK5Dg+Fxo1EVKNugDcYI2qm1KHw5tmwmLqG7pNNcdtreRjzZ82Rjf3+0N9aGSfBI5e31HyyIizTqGz4RNhHDE6/1HhfOSRFWW0DJ36HCwQpjxuncUCwx+/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z3XvLFHh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aadn2Krm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASqRl2601127
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9XItsyKTjUi
	3dqEzWSdHOqYYfzfbJ9SxVGCmC0Jru0w=; b=Z3XvLFHhynfEXmoKptuebiv0wSB
	/1DT+gC1tmO9kYJLCGpu7uWvHI8j3yE8Ior5tHXU0jGpS0PW3T+E907VAjhJ9jVf
	C6M8WAoBR0p2LwIC/WzlSVcKNHuuLushMysp9bL5c908xag6u12wququdre27K8+
	SakaonsOXTpdxn4QDuigBR8prAv6eFqkQbh3wPKYQ5oVomrtD1E6hQdgDDadY7t6
	7Os8iNGoY2HtWkgWTy9Ycs1ky3UKZt+9BIOWzk4KS2xdPbwvvE8ZbOc2LtfE+sle
	o0PiUbw/5swfbOaVDwMoinrM+O9H9D06JiWIyOuS02YWlH6SrZBq9IiW/Cg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw8rc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:18:06 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bbd01d56ecso1327262e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782735485; x=1783340285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XItsyKTjUi3dqEzWSdHOqYYfzfbJ9SxVGCmC0Jru0w=;
        b=aadn2Krm103l4NgYrRSqDLpklbhnEIw0XOpIwVgBOX0m5p9Pc5rxsGPXCpTG3QXMgq
         50KoopEiuQyacz7wayJRd2TdxmimbLPzMTjaNu6i2MokNXBxUFqRqBCygsqMlb61FMER
         sh7eKFy87n1azUevIGEQ19W+CePyPBffx7VFD2F2EysevhHToQ1gENcy6TdBO3cpe74F
         u9Sbkxq3gt0SNjCu2RPgAgGEu1RG95orB7AeHATra7/JmocEwqNhXRWAoSpy2FfEqm3B
         uMCzO7+QhIdOF+CGfu/nU4X7yRNzbP3L+Irmr2YedAjnVLXY95lkqpFpxt1Evh++esNw
         kaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735485; x=1783340285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9XItsyKTjUi3dqEzWSdHOqYYfzfbJ9SxVGCmC0Jru0w=;
        b=JZXEK2nEcRpbpjKf2eHiGB7Kg6oXjpM0+v5D3dil7XfNgkqP6tgCyJlThsw094gdX7
         LXuGQvA3WxZTO29spTojhz0+rKLSbWsQHNatWYYe3uHFO/qz+RYPKkguuJZF3lfm8lXU
         vrikCmyf/J7vzAsrRFQxS1QOzH+y+pMHRDN54OuwrUPkdTh08YlQbWl4sz99A189QTQ6
         i4W9/Uqnc33y5wLOuZgAEh9X1OXlf56OkEftznyLZKdwUPcYfnigZbaM/dyph6BtrrJU
         JFNkRGycszMeQTuKEiRShRygQe8nsDErHMlon+GZ8V7ngzVGHZr6MGPaOWSJSBhHmQvB
         q/2w==
X-Forwarded-Encrypted: i=1; AHgh+RpkxQ/8RYc2utg25flxq3X7Z0dZwzgRdh914w6LZ7u13pon2cvMxs4kBiLAKC3mItbc+gY3nGGCgwByQDBX@vger.kernel.org
X-Gm-Message-State: AOJu0Yypy/JyQW4aoKNis8T2BzG5My8d3NFwnmfcV3tn1I7P+qh4V3KR
	zwphFlbaIrZGP7lOBeUzim3Vw8B8zUFuLrxcuHpSNXKv4djMv2j0wBFKYL3C/kFmQ/0WYLR4DWa
	wPMTLloM0VUIWT5prLr4J+6at/SRpiBOofoG/HQ8NiLtDFZhTXUTCQrTAxx3AhmUfp8WGFNruGs
	xdBlI=
X-Gm-Gg: AfdE7cmyke2BAay3T0HYwFhwFSDWvPY8NYw3lKIwFIUqsPXCD+8vc/2cgNBAIi6G/lE
	i/M2IiIWsIAvq8wpfcpj2q6n16uK/ra8i1bBjjxSLcWOZm1mR9OAQVRqbEq9mx/SBq5LQUsC9Qy
	3iBVzuLyPmJs0RjJEr0XqmJ9lv9msLJaGzVSOqVbC7f5AhiLkFoGOi6UvOaMyvyt+hljE6DdhND
	0E7rZyvoBARCZJO3dHCij1xi1SxCPykqeGLMCuriAFV3qGYEoeUX13Kro8NZhBSeI8wdKk8Ix/0
	CbFeofxyMpDk3LTX1R0TmAGSljeJvBv7h486U8Ck4jwWxCqIHsqHCaJtakdMzBr9cxIdTUuD5HK
	1a8grQEQTZYQgEkDinB7SJkRCj1b2B80hmR0=
X-Received: by 2002:a05:6122:c83:b0:5bd:742e:3bbf with SMTP id 71dfb90a1353d-5bd834b56bdmr1949559e0c.5.1782735485478;
        Mon, 29 Jun 2026 05:18:05 -0700 (PDT)
X-Received: by 2002:a05:6122:c83:b0:5bd:742e:3bbf with SMTP id 71dfb90a1353d-5bd834b56bdmr1949548e0c.5.1782735484726;
        Mon, 29 Jun 2026 05:18:04 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f46e0d15sm6837519a12.14.2026.06.29.05.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:18:04 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v3 3/4] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Mon, 29 Jun 2026 15:17:49 +0300
Message-Id: <20260629121750.3469292-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMSBTYWx0ZWRfX+8prPByaXguy
 55SllX9ReaLCwlqPyLvRzuJxPSR2ieg66Zz/ttCP98NQ0b78cejvEQIERr4kvQal6XjQ8RHXeFa
 16Kj2kuhQvRV06FmGiTQVldmIhbB+DU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMSBTYWx0ZWRfX9JL1z83AYygB
 xuZx7tiyOUPFP5pzBcEdd8ZjVEYS8KsknFebuXknAU5fyY3MXxLKKVWv1gxGPGKRv89hK27aaSY
 4WeWal7qIS2pFcAjEGeOMMVwHwcdKUnWcFAGaAi96cH7ttZIWAiCBvW8xsOxnAqBOrB/ekvSmCf
 tV1yHEL/YkwzJSh+DvnLKmzTAWaq50e3yWjNm9mH+3VhxiMzU5fCsKJETI5t24hy299SCv1EZpI
 2r3HnhWzlagM4yFiNSUaNL7kifYadNZQ1Yf9yqxry3cqs/wGrBjKFbUB5IxVkGniRQ86q6VLCAe
 aaILqsOmYyrwmx7lceVWTXH7D5evpn5fghuldaZ2D55nCY0ioK/Plyru9xMmPS79AY79SA4dlVW
 +9wNHrozKE57ITadX6WbJSa5Iovhb0yBIPusopF+n6epyY4z+0u98gm6HOVzNmFrxaFFnupkyVX
 RZCmOZDCXoURrc+PeJw==
X-Proofpoint-GUID: almlpT1cLGntyQvHtGfMmqZPpojniFHi
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a42627e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=-kxhiCN9v7RFXMsq0RoA:9 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: almlpT1cLGntyQvHtGfMmqZPpojniFHi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-115029-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 914D16D9F69

Add the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 78 ++++++++++++++++++++++++++--
 1 file changed, 74 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..d0cacb4ec35b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4472,6 +4472,9 @@ cci1_i2c1: i2c-bus@1 {
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
 			status = "disabled";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
 
 			reg = <0 0x0ac6a000 0 0x2000>,
 			      <0 0x0ac6c000 0 0x2000>,
@@ -4616,10 +4619,10 @@ camss: camss@ac6a000 {
 					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
 					<&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
 					<&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
-			interconnect-names = "cam_ahb",
-					     "cam_hf_0_mnoc",
-					     "cam_sf_0_mnoc",
-					     "cam_sf_icp_mnoc";
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc",
+					     "icp_mnoc";
 
 			ports {
 				#address-cells = <1>;
@@ -4649,6 +4652,73 @@ port@5 {
 					reg = <5>;
 				};
 			};
+
+			qcom_jpeg_enc: jpeg-encoder@ac53000 {
+				compatible = "qcom,sm8250-jenc";
+
+				reg = <0 0xac53000 0 0x1000>;
+
+				interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+				power-domains = <&camcc TITAN_TOP_GDSC>;
+
+				clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+					 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+					 <&camcc CAM_CC_CORE_AHB_CLK>,
+					 <&camcc CAM_CC_CPAS_AHB_CLK>,
+					 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+					 <&camcc CAM_CC_JPEG_CLK>;
+
+				clock-names = "hf_axi",
+					      "sf_axi",
+					      "core_ahb",
+					      "cpas_ahb",
+					      "cnoc_axi",
+					      "jpeg";
+
+				iommus = <&apps_smmu 0x2040 0x400>,
+					 <&apps_smmu 0x2440 0x400>;
+
+				interconnects =
+					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
+
+				interconnect-names = "cpu-cfg",
+						     "hf-mnoc",
+						     "sf-mnoc",
+						     "icp-mnoc";
+
+				operating-points-v2 = <&jpeg_opp_table>;
+
+				jpeg_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						opp-level = <0>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-400000000 {
+						opp-hz = /bits/ 64 <400000000>;
+						opp-level = <1>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-480000000 {
+						opp-hz = /bits/ 64 <480000000>;
+						opp-level = <2>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-600000000 {
+						opp-hz = /bits/ 64 <600000000>;
+						opp-level = <3>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
 		};
 
 		camcc: clock-controller@ad00000 {
-- 
2.34.1


