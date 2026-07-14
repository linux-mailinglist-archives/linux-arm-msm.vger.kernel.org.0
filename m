Return-Path: <linux-arm-msm+bounces-118911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V+mGAzm7VWqEsAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:29:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FD2750DB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:29:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DP8zWPF2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SPwIlsGP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118911-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118911-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1BBDD301833F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 04:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5432DA756;
	Tue, 14 Jul 2026 04:29:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01402DC791
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:29:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784003373; cv=none; b=iBuIV1p12SmqSAATp8yRG1xxnujvcRlXbexrHMn+KqjHmHeqTmA6ca2WRvU239isvUzEGMYw3WT61P1OwtJdDJG8FO6G2LkTSkqaZbOR6Ku7BHbbNX11+9GFmDxBh5VZZR2yg/TomjxlQy7BHbIAXT8E5aC7hCWV8fE9bbAg4tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784003373; c=relaxed/simple;
	bh=ZQvK0C6JiF+FMSs4PbOUu2p+wZuOV8/Ns8q6nnz3kZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J9NNF/38s31YfX1TuWmnDEgVdnUs08j7XcRHCRtytpkd1ValDVMwS3i6b++Kx3kiGsDpd/Xsp2/40frtLSnBF5u3rtfzARk0cDmuhjdFJeB/bjShi11/Q8YeTjMCrSlSvuO2p9Ik8PUB3vJe+8UZBIM9ha4Qs1WgJCikE6DOcsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DP8zWPF2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPwIlsGP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38PdD3303131
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u1/Y33mFmGDlMS3sYpBNbK/O0k52IHx7NX0nZ2tZh8s=; b=DP8zWPF2CELWEpuR
	w0ItZF8vWcZW+CHqw39l7epbuhoyOJVgebtRS3dHpvobPQL3xhOvOFXxCbkRCZfU
	kmv/+M40H1dp8od3Y9OfSZD2IC0K8vupdfpjC4NEv3roDrg1v1W3hu09Jmt1iLPe
	8w9quJ3C8T7dvy6YyZMEpW9BN3nwIkmyMS7BBMxKwSqGbJcqSAOd4FKgkce0xeZP
	DT2W4v8iEg5jTFo6HMh9m35GbMx1weLxyconMZQ++cMemMts1O+lp4a+OBnzWyO7
	ZzVJ5rTJn9QKzo2TJvhKb/qAM6npFrSpmtMQaK7gMV+UWhJjzgRiiAsx8k4zSXTd
	JI/aTw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p1vuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:29:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so35106275ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 21:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784003370; x=1784608170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u1/Y33mFmGDlMS3sYpBNbK/O0k52IHx7NX0nZ2tZh8s=;
        b=SPwIlsGPTpA6FJ6To7MgxiyppoIw4OjqpHszdnXgM+svnNmxu5LnlX5/WYE5Z8/e/s
         OLukWiX4oHCwCuPcO9W5jyA+4T1jbXvzROD7xgiq0+MFAaPspraoZ4T/aP4KQMhnm3W6
         X5ZhWQ0vb+d2Z1fYZStK/hx3KKMyCVhOf/aefDzcdq9zWHcxYRr0K1EmYCLoEnLWRxfU
         gOLXJ5oPB2qJRxWN3dITccbBKp6DKJSLTVvikCxXMpcsB439kufNtM0Vn59XIgwcp6sB
         KQjRXhEbZSVHSELpOted4PLDdCgGPE3MJycyQYwLQD6O/QXcBJXpfneSbttuznGvDrcF
         S6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784003370; x=1784608170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1/Y33mFmGDlMS3sYpBNbK/O0k52IHx7NX0nZ2tZh8s=;
        b=HFa1dbEULXLENP2OiDLPft047xzsglQJHxgFRyFRdHZXdDJgO3VW8o0CacBXX9DNBc
         ngC4KzXATNa6/dg2JB5swn9m4nWJLAUDezUDGk1TC17lySV+vI83lk+sIdt36yWy93Nb
         Tsqb63DN0IFMUdZIgnx9MFivD+6JkY4WM5xeeuKs8yvRKys2GMESWEAyGicS+YmwA7eu
         WuENLzdVaVW0a2Nzan3CgWB6zAnBCdzQNxhpWI36cLkFRuI5HlI8DlMhRICqW8DPlYXG
         56E3qR54oQu+c2Ie6zXzPIHtHOAwSx2CIt9Z9j2J0qzuIX8vCROFEecmpHeNeEYY4eP0
         ZYyg==
X-Gm-Message-State: AOJu0YyfKpra1mmAAiCjWiCpF14i+Ijp2N1WOpZSLdreN7ddoyjhfzT9
	EWtUqbn+HF+uXS6p/Ir8oZ37ozJplCpwDRl/5mSxH+PJHPtf/WkTkRQwhy6yAbjHgLb76zD6Fcv
	UyIFtXFWIKQhRb1oJIGVEet+ziwb6L6JbepeRG8KiSF4NXb6IW5DmxCcJfZcO8h5XXmvU
X-Gm-Gg: AfdE7clUpUcCa1x48xEz1NKCdt1+T/m+0opoiTbT7MThg6rrOG+KOILkvWpizVkawU3
	2Sbal5x6W0GZLPiPwYEp7VYmOxclrg1bABxqJ6dBKUyyaCQ2QUAZWUcRCF8qt78Q4HOqZRJOuoL
	hpMwoVVsnu4BmSGKG62oaPyrbebXyjArtLEgYRDh23Pq9cWdhX6TCi2WlUBYT6Srzbft6PP9AZA
	xLsUoh48oUOX+/SNr5GTHDmYQ/Ghly1J3/Ut3tvtFnw1BrboGhjkuktLGgf27VCjDiy061MXR07
	dcV4hwwWIGwkEKNeUMzHiRVLKIin4kkyDMjEkuyZS5K5YH0O2Rvy7NbTcNnYLmQvLeXG5ruNsIn
	PMrFu1beiGHWsTljDcSkcCM6+H2Gf0P1mL4KoxOq1tJv44cwkM9Hgh4aHGyN5ZO1sSBQVHIgHvR
	GYlfT7mOwVMM44dCNdaGuxdPuAct1aQt20BNnM+RRIFrMAPQ==
X-Received: by 2002:a05:6a20:729c:b0:3c0:9c18:d5a8 with SMTP id adf61e73a8af0-3c35729f575mr953918637.69.1784003369870;
        Mon, 13 Jul 2026 21:29:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:729c:b0:3c0:9c18:d5a8 with SMTP id adf61e73a8af0-3c35729f575mr953875637.69.1784003369309;
        Mon, 13 Jul 2026 21:29:29 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm64388999eec.6.2026.07.13.21.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:29:28 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:59:16 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: ipq9650: add the PCIe support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-ipq9650_pcie-v1-1-4197749d06bd@oss.qualcomm.com>
References: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
In-Reply-To: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0MyBTYWx0ZWRfX6QooN/AwO7Lk
 lD5y2bbULnjra7cXESaT2QYF7lHsKPDQ8bWSP21c5VFbaFQuoOQrtFqdHWOTaUC55M7LZoGzhNv
 raYbcq4eiktRKy/a4pZO4Bf4c98BPIw=
X-Proofpoint-GUID: 8SNLbvzjuxOGSiVoJWa5AuBJpsUUZJX6
X-Proofpoint-ORIG-GUID: 8SNLbvzjuxOGSiVoJWa5AuBJpsUUZJX6
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55bb2a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Jp5qG-MpaqbX_UUodeIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0MyBTYWx0ZWRfX9l8rYBxo6A8R
 oalWzM5uoP6n2hYIlT3C4+LlTijbvgz6fgllT5ESV8b9jbTkkw3QTbcOafhmHL1BB9FqzUccvDt
 CbJjKE3WCyAbvdSrGtNZtsu3B/1T4S+C1rGvaKV87dPlp02SEMyK1ll4STp7fdhdQaddgS1kPmY
 tNwdegsV+9d/2ECZfuZJsh1VNcR1T+30lV144HrGIr40BgALpEhqEiuvdED0aFXMh7kuvvlskew
 GbLwf3xKgyTP58ps34NJ2lAzwlP8GfDyYQ7emQ44snRkRF0dGOV5zLzDAkqn582JoRa5O4Wo45e
 5D42AU8uw0L6qTl26fccRXb9PtAJfljSL/7r1H6ZlDiEltvL91mzXzZoy+V1Zvxghojnchab8R3
 EYdL7f6P9OhlmajJZ1FpCuCeCsPdNQZdno5KUH6hzQghEAt1lujtzUY4iLLe7YWcIbh6ugL+pjD
 N1nX6LwxqJTRdZZjVCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140043
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118911-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6FD2750DB1

IPQ9650 has 5 Gen3 PCIe controllers - PCIe0 and PCIe4 are single lane
and the remaining instances are dual lane. Add support for the same.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9650.dtsi | 665 +++++++++++++++++++++++++++++++++-
 1 file changed, 660 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
index 3d3b317c6a3c..8301a4090395 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,ipq9650-gcc.h>
+#include <dt-bindings/interconnect/qcom,ipq9650.h>
 #include <dt-bindings/reset/qcom,ipq9650-gcc.h>
 
 / {
@@ -200,6 +201,160 @@ soc@0 {
 		dma-ranges = <0 0 0 0 0x10 0>;
 		ranges = <0 0 0 0 0x10 0>;
 
+		refgen_pcie: regulator@6c000 {
+			compatible = "qcom,ipq9650-refgen-regulator";
+			reg = <0x0 0x0006c000 0x0 0x84>;
+			clocks = <&gcc GCC_REFGEN_PCIE_CORE_CLK>,
+				 <&gcc GCC_REFGEN_PCIE_HCLK>;
+			clock-names = "core",
+				      "hclk";
+		};
+
+		pcie0_phy: phy@84000 {
+			compatible = "qcom,ipq9650-qmp-gen3x1-pcie-phy";
+			reg = <0x0 0x00084000 0x0 0x1000>;
+
+			clocks = <&gcc GCC_PCIE0_AUX_CLK>,
+				 <&gcc GCC_PCIE0_AHB_CLK>,
+				 <&gcc GCC_PCIE0_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "pipe";
+
+			assigned-clocks = <&gcc GCC_PCIE0_AUX_CLK>;
+			assigned-clock-rates = <20000000>;
+
+			resets = <&gcc GCC_PCIE0_PHY_BCR>,
+				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
+			reset-names = "phy",
+				      "common";
+
+			refgen-supply = <&refgen_pcie>;
+
+			clock-output-names = "pcie0_pipe_clk";
+			#clock-cells = <0>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		pcie4_phy: phy@8c000 {
+			compatible = "qcom,ipq9650-qmp-gen3x1-pcie-phy";
+			reg = <0x0 0x0008c000 0x0 0x1000>;
+
+			clocks = <&gcc GCC_PCIE4_AUX_CLK>,
+				 <&gcc GCC_PCIE4_AHB_CLK>,
+				 <&gcc GCC_PCIE4_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "pipe";
+
+			assigned-clocks = <&gcc GCC_PCIE4_AUX_CLK>;
+			assigned-clock-rates = <20000000>;
+
+			resets = <&gcc GCC_PCIE4_PHY_BCR>,
+				 <&gcc GCC_PCIE4PHY_PHY_BCR>;
+			reset-names = "phy",
+				      "common";
+
+			refgen-supply = <&refgen_pcie>;
+
+			clock-output-names = "pcie4_pipe_clk";
+			#clock-cells = <0>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		pcie3_phy: phy@b4000 {
+			compatible = "qcom,ipq9650-qmp-gen3x2-pcie-phy";
+			reg = <0x0 0x000b4000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_PCIE3_AUX_CLK>,
+				 <&gcc GCC_PCIE3_AHB_CLK>,
+				 <&gcc GCC_PCIE3_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "pipe";
+
+			assigned-clocks = <&gcc GCC_PCIE3_AUX_CLK>;
+			assigned-clock-rates = <20000000>;
+
+			resets = <&gcc GCC_PCIE3_PHY_BCR>,
+				 <&gcc GCC_PCIE3PHY_PHY_BCR>;
+			reset-names = "phy",
+				      "common";
+
+			refgen-supply = <&refgen_pcie>;
+
+			clock-output-names = "pcie3_pipe_clk";
+			#clock-cells = <0>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		pcie1_phy: phy@f4000 {
+			compatible = "qcom,ipq9650-qmp-gen3x2-pcie-phy";
+			reg = <0x0 0x000f4000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_PCIE1_AUX_CLK>,
+				 <&gcc GCC_PCIE1_AHB_CLK>,
+				 <&gcc GCC_PCIE1_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "pipe";
+
+			assigned-clocks = <&gcc GCC_PCIE1_AUX_CLK>;
+			assigned-clock-rates = <20000000>;
+
+			resets = <&gcc GCC_PCIE1_PHY_BCR>,
+				 <&gcc GCC_PCIE1PHY_PHY_BCR>;
+			reset-names = "phy",
+				      "common";
+
+			refgen-supply = <&refgen_pcie>;
+
+			clock-output-names = "pcie1_pipe_clk";
+			#clock-cells = <0>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		pcie2_phy: phy@fc000 {
+			compatible = "qcom,ipq9650-qmp-gen3x2-pcie-phy";
+			reg = <0x0 0x000fc000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_PCIE2_AUX_CLK>,
+				 <&gcc GCC_PCIE2_AHB_CLK>,
+				 <&gcc GCC_PCIE2_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "pipe";
+
+			assigned-clocks = <&gcc GCC_PCIE2_AUX_CLK>;
+			assigned-clock-rates = <20000000>;
+
+			resets = <&gcc GCC_PCIE2_PHY_BCR>,
+				 <&gcc GCC_PCIE2PHY_PHY_BCR>;
+			reset-names = "phy",
+				      "common";
+
+			refgen-supply = <&refgen_pcie>;
+
+			clock-output-names = "pcie2_pipe_clk";
+			#clock-cells = <0>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq9650-tlmm";
 			reg = <0x0 0x01000000 0x0 0x300000>;
@@ -216,11 +371,11 @@ gcc: clock-controller@1800000 {
 			reg = <0x0 0x01800000 0x0 0x40000>;
 			clocks = <&xo_board>,
 				 <&sleep_clk>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>,
+				 <&pcie0_phy>,
+				 <&pcie1_phy>,
+				 <&pcie2_phy>,
+				 <&pcie3_phy>,
+				 <&pcie4_phy>,
 				 <0>,
 				 <0>;
 			#clock-cells = <1>;
@@ -371,6 +526,506 @@ frame@f42d000 {
 				status = "disabled";
 			};
 		};
+
+		pcie3: pcie@30000000 {
+			compatible = "qcom,pcie-ipq9650", "qcom,pcie-ipq9574";
+			reg =  <0x0 0x30000000 0x0 0xf1d>,
+			       <0x0 0x30000f20 0x0 0xa8>,
+			       <0x0 0x30001000 0x0 0x1000>,
+			       <0x0 0x000b0000 0x0 0x3000>,
+			       <0x0 0x30100000 0x0 0x1000>,
+			       <0x0 0x000b6000 0x0 0x1000>;
+			reg-names = "dbi",
+				    "elbi",
+				    "atu",
+				    "parf",
+				    "config",
+				    "mhi";
+			device_type = "pci";
+			linux,pci-domain = <3>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x30200000 0x0 0x00100000>,
+				 <0x02000000 0x0 0x30300000 0x0 0x30300000 0x0 0x0fd00000>;
+
+			msi-map = <0x0 &intc 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 2 &intc GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 3 &intc GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 4 &intc GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_PCIE3_AXI_M_CLK>,
+				 <&gcc GCC_PCIE3_AXI_S_CLK>,
+				 <&gcc GCC_PCIE3_AXI_S_BRIDGE_CLK>,
+				 <&gcc GCC_PCIE3_RCHNG_CLK>,
+				 <&gcc GCC_PCIE3_AHB_CLK>,
+				 <&gcc GCC_PCIE3_AUX_CLK>;
+			clock-names = "axi_m",
+				      "axi_s",
+				      "axi_bridge",
+				      "rchng",
+				      "ahb",
+				      "aux";
+
+			resets = <&gcc GCC_PCIE3_PIPE_CLK_ARES>,
+				 <&gcc GCC_PCIE3_CORE_STICKY_RESET>,
+				 <&gcc GCC_PCIE3_AXI_S_STICKY_RESET>,
+				 <&gcc GCC_PCIE3_AXI_S_CLK_ARES>,
+				 <&gcc GCC_PCIE3_AXI_M_STICKY_RESET>,
+				 <&gcc GCC_PCIE3_AXI_M_CLK_ARES>,
+				 <&gcc GCC_PCIE3_AUX_CLK_ARES>,
+				 <&gcc GCC_PCIE3_AHB_CLK_ARES>;
+			reset-names = "pipe",
+				      "sticky",
+				      "axi_s_sticky",
+				      "axi_s",
+				      "axi_m_sticky",
+				      "axi_m",
+				      "aux",
+				      "ahb";
+
+			interconnects = <&gcc MASTER_ANOC_PCIE3 &gcc SLAVE_ANOC_PCIE3>,
+					<&gcc MASTER_CNOC_PCIE3 &gcc SLAVE_CNOC_PCIE3>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			status = "disabled";
+
+			pcie3_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie3_phy>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie2: pcie@40000000 {
+			compatible = "qcom,pcie-ipq9650", "qcom,pcie-ipq9574";
+			reg =  <0x0 0x40000000 0x0 0xf1d>,
+			       <0x0 0x40000f20 0x0 0xa8>,
+			       <0x0 0x40001000 0x0 0x1000>,
+			       <0x0 0x000f8000 0x0 0x3000>,
+			       <0x0 0x40100000 0x0 0x1000>,
+			       <0x0 0x000fe000 0x0 0x1000>;
+			reg-names = "dbi",
+				    "elbi",
+				    "atu",
+				    "parf",
+				    "config",
+				    "mhi";
+			device_type = "pci";
+			linux,pci-domain = <2>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x00100000>,
+				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x0fd00000>;
+
+			msi-map = <0x0 &intc 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 2 &intc GIC_SPI 480 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 3 &intc GIC_SPI 481 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 4 &intc GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_PCIE2_AXI_M_CLK>,
+				 <&gcc GCC_PCIE2_AXI_S_CLK>,
+				 <&gcc GCC_PCIE2_AXI_S_BRIDGE_CLK>,
+				 <&gcc GCC_PCIE2_RCHNG_CLK>,
+				 <&gcc GCC_PCIE2_AHB_CLK>,
+				 <&gcc GCC_PCIE2_AUX_CLK>;
+			clock-names = "axi_m",
+				      "axi_s",
+				      "axi_bridge",
+				      "rchng",
+				      "ahb",
+				      "aux";
+
+			resets = <&gcc GCC_PCIE2_PIPE_CLK_ARES>,
+				 <&gcc GCC_PCIE2_CORE_STICKY_RESET>,
+				 <&gcc GCC_PCIE2_AXI_S_STICKY_RESET>,
+				 <&gcc GCC_PCIE2_AXI_S_CLK_ARES>,
+				 <&gcc GCC_PCIE2_AXI_M_STICKY_RESET>,
+				 <&gcc GCC_PCIE2_AXI_M_CLK_ARES>,
+				 <&gcc GCC_PCIE2_AUX_CLK_ARES>,
+				 <&gcc GCC_PCIE2_AHB_CLK_ARES>;
+			reset-names = "pipe",
+				      "sticky",
+				      "axi_s_sticky",
+				      "axi_s",
+				      "axi_m_sticky",
+				      "axi_m",
+				      "aux",
+				      "ahb";
+
+			interconnects = <&gcc MASTER_ANOC_PCIE2 &gcc SLAVE_ANOC_PCIE2>,
+					<&gcc MASTER_CNOC_PCIE2 &gcc SLAVE_CNOC_PCIE2>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			status = "disabled";
+
+			pcie2_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie2_phy>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie1: pcie@50000000 {
+			compatible = "qcom,pcie-ipq9650", "qcom,pcie-ipq9574";
+			reg =  <0x0 0x50000000 0x0 0xf1d>,
+			       <0x0 0x50000f20 0x0 0xa8>,
+			       <0x0 0x50001000 0x0 0x1000>,
+			       <0x0 0x000f0000 0x0 0x3000>,
+			       <0x0 0x50100000 0x0 0x1000>,
+			       <0x0 0x000f6000 0x0 0x1000>;
+			reg-names = "dbi",
+				    "elbi",
+				    "atu",
+				    "parf",
+				    "config",
+				    "mhi";
+			device_type = "pci";
+			linux,pci-domain = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x50200000 0x0 0x00100000>,
+				 <0x02000000 0x0 0x50300000 0x0 0x50300000 0x0 0x0fd00000>;
+
+			msi-map = <0x0 &intc 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 2 &intc GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 3 &intc GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 4 &intc GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_PCIE1_AXI_M_CLK>,
+				 <&gcc GCC_PCIE1_AXI_S_CLK>,
+				 <&gcc GCC_PCIE1_AXI_S_BRIDGE_CLK>,
+				 <&gcc GCC_PCIE1_RCHNG_CLK>,
+				 <&gcc GCC_PCIE1_AHB_CLK>,
+				 <&gcc GCC_PCIE1_AUX_CLK>;
+			clock-names = "axi_m",
+				      "axi_s",
+				      "axi_bridge",
+				      "rchng",
+				      "ahb",
+				      "aux";
+
+			resets = <&gcc GCC_PCIE1_PIPE_CLK_ARES>,
+				 <&gcc GCC_PCIE1_CORE_STICKY_RESET>,
+				 <&gcc GCC_PCIE1_AXI_S_STICKY_RESET>,
+				 <&gcc GCC_PCIE1_AXI_S_CLK_ARES>,
+				 <&gcc GCC_PCIE1_AXI_M_STICKY_RESET>,
+				 <&gcc GCC_PCIE1_AXI_M_CLK_ARES>,
+				 <&gcc GCC_PCIE1_AUX_CLK_ARES>,
+				 <&gcc GCC_PCIE1_AHB_CLK_ARES>;
+			reset-names = "pipe",
+				      "sticky",
+				      "axi_s_sticky",
+				      "axi_s",
+				      "axi_m_sticky",
+				      "axi_m",
+				      "aux",
+				      "ahb";
+
+			interconnects = <&gcc MASTER_ANOC_PCIE1 &gcc SLAVE_ANOC_PCIE1>,
+					<&gcc MASTER_CNOC_PCIE1 &gcc SLAVE_CNOC_PCIE1>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			status = "disabled";
+
+			pcie1_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie1_phy>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie4: pcie@60000000 {
+			compatible = "qcom,pcie-ipq9650", "qcom,pcie-ipq9574";
+			reg =  <0x0 0x60000000 0x0 0xf1d>,
+			       <0x0 0x60000f20 0x0 0xa8>,
+			       <0x0 0x60001000 0x0 0x1000>,
+			       <0x0 0x00088000 0x0 0x3000>,
+			       <0x0 0x60100000 0x0 0x1000>,
+			       <0x0 0x0008e000 0x0 0x1000>;
+			reg-names = "dbi",
+				    "elbi",
+				    "atu",
+				    "parf",
+				    "config",
+				    "mhi";
+			device_type = "pci";
+			linux,pci-domain = <4>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x00100000>,
+				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x0fd00000>;
+
+			msi-map = <0x0 &intc 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 511 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 2 &intc GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 3 &intc GIC_SPI 522 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 4 &intc GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_PCIE4_AXI_M_CLK>,
+				 <&gcc GCC_PCIE4_AXI_S_CLK>,
+				 <&gcc GCC_PCIE4_AXI_S_BRIDGE_CLK>,
+				 <&gcc GCC_PCIE4_RCHNG_CLK>,
+				 <&gcc GCC_PCIE4_AHB_CLK>,
+				 <&gcc GCC_PCIE4_AUX_CLK>;
+			clock-names = "axi_m",
+				      "axi_s",
+				      "axi_bridge",
+				      "rchng",
+				      "ahb",
+				      "aux";
+
+			resets = <&gcc GCC_PCIE4_PIPE_CLK_ARES>,
+				 <&gcc GCC_PCIE4_CORE_STICKY_RESET>,
+				 <&gcc GCC_PCIE4_AXI_S_STICKY_RESET>,
+				 <&gcc GCC_PCIE4_AXI_S_CLK_ARES>,
+				 <&gcc GCC_PCIE4_AXI_M_STICKY_RESET>,
+				 <&gcc GCC_PCIE4_AXI_M_CLK_ARES>,
+				 <&gcc GCC_PCIE4_AUX_CLK_ARES>,
+				 <&gcc GCC_PCIE4_AHB_CLK_ARES>;
+			reset-names = "pipe",
+				      "sticky",
+				      "axi_s_sticky",
+				      "axi_s",
+				      "axi_m_sticky",
+				      "axi_m",
+				      "aux",
+				      "ahb";
+
+			interconnects = <&gcc MASTER_ANOC_PCIE4 &gcc SLAVE_ANOC_PCIE4>,
+					<&gcc MASTER_CNOC_PCIE4 &gcc SLAVE_CNOC_PCIE4>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			status = "disabled";
+
+			pcie4_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie4_phy>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie0: pcie@70000000 {
+			compatible = "qcom,pcie-ipq9650", "qcom,pcie-ipq9574";
+			reg =  <0x0 0x70000000 0x0 0xf1d>,
+			       <0x0 0x70000f20 0x0 0xa8>,
+			       <0x0 0x70001000 0x0 0x1000>,
+			       <0x0 0x00080000 0x0 0x3000>,
+			       <0x0 0x70100000 0x0 0x1000>,
+			       <0x0 0x00086000 0x0 0x1000>;
+			reg-names = "dbi",
+				    "elbi",
+				    "atu",
+				    "parf",
+				    "config",
+				    "mhi";
+			device_type = "pci";
+			linux,pci-domain = <0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x00100000>,
+				 <0x02000000 0x0 0x70300000 0x0 0x70300000 0x0 0x0fd00000>;
+
+			msi-map = <0x0 &intc 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 2 &intc GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 3 &intc GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 4 &intc GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_PCIE0_AXI_M_CLK>,
+				 <&gcc GCC_PCIE0_AXI_S_CLK>,
+				 <&gcc GCC_PCIE0_AXI_S_BRIDGE_CLK>,
+				 <&gcc GCC_PCIE0_RCHNG_CLK>,
+				 <&gcc GCC_PCIE0_AHB_CLK>,
+				 <&gcc GCC_PCIE0_AUX_CLK>;
+			clock-names = "axi_m",
+				      "axi_s",
+				      "axi_bridge",
+				      "rchng",
+				      "ahb",
+				      "aux";
+
+			resets = <&gcc GCC_PCIE0_PIPE_CLK_ARES>,
+				 <&gcc GCC_PCIE0_CORE_STICKY_RESET>,
+				 <&gcc GCC_PCIE0_AXI_S_STICKY_RESET>,
+				 <&gcc GCC_PCIE0_AXI_S_CLK_ARES>,
+				 <&gcc GCC_PCIE0_AXI_M_STICKY_RESET>,
+				 <&gcc GCC_PCIE0_AXI_M_CLK_ARES>,
+				 <&gcc GCC_PCIE0_AUX_CLK_ARES>,
+				 <&gcc GCC_PCIE0_AHB_CLK_ARES>;
+			reset-names = "pipe",
+				      "sticky",
+				      "axi_s_sticky",
+				      "axi_s",
+				      "axi_m_sticky",
+				      "axi_m",
+				      "aux",
+				      "ahb";
+
+			interconnects = <&gcc MASTER_ANOC_PCIE0 &gcc SLAVE_ANOC_PCIE0>,
+					<&gcc MASTER_CNOC_PCIE0 &gcc SLAVE_CNOC_PCIE0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie0_phy>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
 	};
 
 	timer {

-- 
2.34.1


