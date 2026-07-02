Return-Path: <linux-arm-msm+bounces-115893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yaAOL6s9RmpzMgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:30:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A4A6F5ECF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:30:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aZiJcbDj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QPParWxr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115893-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115893-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BB13312D51E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C059742E8D9;
	Thu,  2 Jul 2026 09:41:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E0047DFB0
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:41:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985283; cv=none; b=NZTpd1M2yBhd0FAq4cIsdMP2SJBpE6UUI3cNKhgz3w35dPq7/FfeLzX9JmLh00T6UIdudOudWBaoLgyCpqYI+RgP1YaIHkPgbFUk4h4Bf/gozrakr6U45hw/seAoBYdbODkedlSzzAMalyqlzCqEUdrWexzZ2MrZLF5ibfHQEi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985283; c=relaxed/simple;
	bh=wXfhjO70bjMpmqa+YusJcPnCp4qslQXECJzeR+Ed9Dc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gqk/9x200ghYOCFX+UaMzsLJKxSCcGzPgHkp1YWVoB3Pe7osQNpij/vwjHlsWd5WFKOAxKLDB2Bmx9zh2ZG1yUMtx+0Fg8GoZcoSHFKIi1syB/iGuN+LXe62vZhbiTEOy8VUA6nQ+zSGi1PNaI3LF83di1i7gdB6vGPIs7TIhuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZiJcbDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPParWxr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6624jHCS3594415
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tdNbsM/vh/z
	GDl0DVvXslkO+C3xnrt/1ywscht/tosM=; b=aZiJcbDjwu8YA90zuU0MzatWkw1
	NTwXlDgOcLCEsIm3SO8s91eav+9zcc1C0CzLMDE7g+dCYIu9T91blAz+PMWhNsG7
	e/wW6aABuHydyEVKRRerfo4iiZSbgHD+KWIVB8iMU9BYprzt8J5IkODVVIQECk3L
	xnyWk4kTu0AsYRKd70d+ZY3BIsWY5fmYH3euODrcQ1sTufjHBpPvdw/0JI2U2WnK
	rTSNF0/4v7bxTXrr5viJgh/KcsgJR8/quHzI2rqQz/M03hF+0D7J22vT6FpxSzYM
	GT8mWWB3uYbOwtYbDmao5BzINM0Kpy2kIBHSe3xQVxurBPB536Q4eaDmBbA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9384-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:41:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso2581803b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985281; x=1783590081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdNbsM/vh/zGDl0DVvXslkO+C3xnrt/1ywscht/tosM=;
        b=QPParWxrKraSw+0aG0PsfY/TTLcqYV+0xTf1D8KDmHvrZEU9pUWEuXjlWgRCmiVHbs
         6dgE9bAO3vKgZsbUGRFJz5x5x2pqPSCnLpCLYq1wyjiYcW0xES1XtEy5XdKC85EfdcIQ
         n7sESMGyUspM2n4p5qWYx0W5AE8ibwXZLkeUYXCPl4gwenFeXWfzYFuuxeaoTGsv3Pb8
         B1f4BSon2fCPoaT4SAzcgakdqBBiv0aNJIGwirKYwkgMJdxbESkWVERD/uv9Cj+jC3ru
         an/9b8+dv57s86/tbe4pvk7Tk5HFRmfeIrnNRMFHKq/IkvUIC3QNxlqc+QQBkAlOw8sh
         zR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985281; x=1783590081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tdNbsM/vh/zGDl0DVvXslkO+C3xnrt/1ywscht/tosM=;
        b=oVmYPjcEfKkAAd/7427xVdP6ic276HZRstSKtXGWPznku0N7JXv5Xi8QWuh33BRadP
         3oz3IoG+relvQtRK3+D+EXCmwwWhhyDGk9q8UrOR7+nze/oVom4s/t16VQ09Ep24Vpyo
         jdi3AgdTXai7T+J/l5e9NQF//JoXCsyQl/TdTAEu+Atza7JKIvSBv/5Ee/y0OkOWfpcq
         QzZk4fCFJXBS/86YuBmW4iQrOitWZfXhVfp6St5LkudsX9FwTG/UY0wqlvJDfGIwO/Lk
         t0ypuAaozBFrYWGckAjvX4Kr/k+vimyQXdXNVWnLzm/TckMlW40EdK7Po+7OwR43VExF
         ZxRw==
X-Forwarded-Encrypted: i=1; AHgh+RrjSRMipOecQqBUm0Qh8Pc3tRdf6o8QIPDUSQ88W6WQbu6w3HatLHDZvq2dd3Ky72KjFLnz1B/Ke329/uCP@vger.kernel.org
X-Gm-Message-State: AOJu0YxuI99pRBiJsGTadZxayuRsMLjpAQzgB/n7raovCYqt37YuYZO0
	FfM2ztneww4+NvGc9hfLt2MDZEyEAblhCsCaJKXmWVRBa84FAgBfxNWt+oXGf7etOjGlBc67lGo
	4l1DrzE2ZnzxipwSPyUckJQZHVzt5fHNOWws468iT+GF6OavQbxuwYt3KG8WfpvtIcZAq
X-Gm-Gg: AfdE7ckVsZc49t+4BEI8CZ38AadcSGIliBPT4GKvqv8NI673y6icZV8iwdMLAHtfVGy
	bi2n4Fk0LoPu88IaSd7fKCpRwbQN435XiX28E87Jy3zNhnDi4+goNEZLRyGHHTStFiXRNwW5cGR
	+CpTntLdNY6C9ONK2/OUPOHlaLEQeQ/NpYul61nEwqFH7GlV6d7iJuGfZr+hzZOxsnkfZBTCrup
	oiWSU3JJB8+k1epOrnTLo/kMl/LTNbrduk+xz4xaODOR8p2HJ1MPSN9+PVCRQX8Ti3XxWZ7bVBF
	a4We7D35Ce3otSDxOcmFkWNWxO9F7cHvVpyn9CwrwKWCttWZ+KMdlgByB8jRvVjQbR+Qs71MFaC
	U7RgOCk2XqpBEcpsONNsG9RojxF66H9ZiTTUoRw==
X-Received: by 2002:a05:6a00:2d88:b0:847:bf8b:7d41 with SMTP id d2e1a72fcca58-847c5033e0fmr4300418b3a.22.1782985281126;
        Thu, 02 Jul 2026 02:41:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d88:b0:847:bf8b:7d41 with SMTP id d2e1a72fcca58-847c5033e0fmr4300389b3a.22.1782985280702;
        Thu, 02 Jul 2026 02:41:20 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb75d850sm1141595b3a.19.2026.07.02.02.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:41:20 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 3/4] arm64: dts: qcom: Add SD Card support for Glymur SoC
Date: Thu,  2 Jul 2026 15:10:55 +0530
Message-Id: <20260702094056.3755467-4-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
References: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfXx2rvDSJIdRbc
 haJkyrstZjLndQ/OyaEaC6w0Flufg5lAllGdXEzOLSeuiuDntUqmqJh9ZO18PbbX6bcIG/kD1A5
 BpehsHGaOIY6wvjU6awoNBEx1TuKsfM8ERXtnUQl3pzDtw2eSkIBmnM+G3YANUYw3f3Bpp7Qst/
 L5+44VzTZLv2SozZTOQlUIai0dtf4BbhuFYWPkvl+xFdwW02kTOx00TP2F9QR/mc4vxkwrbXAra
 2pMb8djKAiwpVw1v7u25VKE/YOCtk/rZzGdk0Uk6+w/CXPY0/CmcaAlUk1KyGNS4IWrczJUfj4K
 jOKVJEGcuyzAAHaTxBW6K43UweQKf0GUQN+A4ESznifd/2iVX7JWaZoGEo0D2cV9osKMygOf0aw
 NAChDKbZ+CywaSCn5uE86Sy99QvOIRPPyAWYm7vDk0MLPEFud+/2/kflxpenJffa0Lugk1i+qAM
 So0wJLQTcoYG/iRvWoQ==
X-Proofpoint-ORIG-GUID: PSGFsvoCQugSZQ7NNWFUBvSh95g3P0I6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX61jKCxSPJgdl
 MKuE+3OiiZq1D+0o1w+1I5EMUgMt3tvsSQascSNLXzqxTxKlMDqv37ZlXb7/RfRGT3UeUDacWD5
 eW1zy1tBtweFw8+XT/dKkPRW7evjN88=
X-Proofpoint-GUID: PSGFsvoCQugSZQ7NNWFUBvSh95g3P0I6
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a463241 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=9wC1NwHXjCwt_iaUHW8A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-115893-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:sachin.rathore@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30A4A6F5ECF

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Add support for SD card on Glymur SoC and enable the required pinctrl
configurations.

Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 91 ++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..70f3344b7382 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3927,6 +3927,58 @@ lpass_ag_noc: interconnect@7e40000 {
 			#interconnect-cells = <2>;
 		};
 
+		sdhc_2: mmc@8804000 {
+			compatible = "qcom,glymur-sdhci", "qcom,sdhci-msm-v5";
+
+			reg = <0x0 0x08804000 0x0 0x1000>;
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			iommus = <&apps_smmu 0xd00 0x0>;
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			interconnects = <&aggre3_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			bus-width = <4>;
+			dma-coherent;
+
+			resets = <&gcc GCC_SDCC2_BCR>;
+
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		usb_2_hsphy: phy@88e0000  {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";
@@ -5714,6 +5766,45 @@ rx-pins {
 					bias-disable;
 				};
 			};
+			sdc2_default_state: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_sleep_state: sdc2-sleep-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
 		};
 
 		stm: stm@10002000 {
-- 
2.34.1


