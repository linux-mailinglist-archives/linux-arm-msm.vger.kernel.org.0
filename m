Return-Path: <linux-arm-msm+bounces-82046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 40021C6295C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 07:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B8192351CC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 06:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EBD73168F1;
	Mon, 17 Nov 2025 06:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jk4AyU3q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="elHhCrdT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC146315D49
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 06:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763362214; cv=none; b=blK9FvSEFDvW91wSvHtIE8BvD8xZXYm5dbEZUxG7LXlBgwUAwenqeqmdnDmJj9RZWAPSrSYkXS82xbKHVJTNr2erqektMJbmxpbNF527Jp5JDOtW1P4m95lOITt6z9K26RFR8JbgKPJT7SrGBoUHpGYigAvVucEIz27nhswy92Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763362214; c=relaxed/simple;
	bh=dmLZzuKEbsIDV08HNgYOEZ07SsWbkHlT3HhDa9Bp5L4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dZIln/pNb7N/csF/QW3TRVMbIwlyW/bhqxJaZds7GhDxjwkGk0uqrRxzyiAefHX122Ur8jgUujeplkn6Oi66AIuzU1h9ddkzNX3Lhbx0bF4iINfPf3tcy9FUJt3GNUccWKclq2mltJA3CgAeeogcDdSiP6zcKoHS+yqx6LlU6T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jk4AyU3q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=elHhCrdT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4o14S2851913
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 06:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XrgRWENCzy7nh5ZW6Pr2rprzB8CmmTcZw74l071v8z4=; b=Jk4AyU3q5zPEFCzK
	oc3goRBWICc6rd8VlQJhW+lKkQdEA8k0FuSD/MO+hQyZ/mMoVel8f5L2bW5bfLRq
	FcGV3xYrseaLh8JpTC1ryybvaq8De+ehYG874XEsvF+5IvXcP5HOntEE8gr69McR
	vfHZqRpnF3O1A5W/VMRDhn5G23GYTlhCuMa6/DOBGVC0UTZSsgGFO/mfaSZthsji
	5YIx6CKclt67/PzeYzYgtsOpIejilCzVwWByN56IRzl1vru5p/Jdq7iNJl8J2c3+
	Igtch0LbZMuQK17m5l2S6qTVp66pIrvGQ7I5PrjMxaBKguU2NokZXbnBBQ81dO0P
	7eH3Vg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh0bmjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 06:50:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b234bae2a7so1277956485a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 22:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763362210; x=1763967010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrgRWENCzy7nh5ZW6Pr2rprzB8CmmTcZw74l071v8z4=;
        b=elHhCrdTnGabn84UZSTA5mx6neSUI0gf4W7EhyXflhlZaIwmnKhELmTFF3yeIJpV+n
         HArDgkM+k/PfCiizIB0DntC/YkX2APQYMyh1XCaEcXtDuqVdtdDFRmHAlHZ0OkbeRtAC
         Lby5st8mCSYn/6YZ70f9Qho1TsaA2qIfa6QpEGifdSzx7GfpcWhm+ggkni0u651+NuGr
         oiIbGBW4DKdSyGBoLQ8pOI6kNbHwxHoXbEV+whHeLfKDUVWZqkzVZ+0T5wWY/d2mDQND
         Mlns7Me7f4stTRyGdLO658fkAXiaMDx6ltmcuC4doTLDAHM0YFLuPA1jBpGN4ECvrC3Q
         kUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763362210; x=1763967010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XrgRWENCzy7nh5ZW6Pr2rprzB8CmmTcZw74l071v8z4=;
        b=hEqtBDzhN6BhdPoliXXq/mfu8KlmZ4VX+d4RPSR2K598qByPtGcpAy1arrF+1SjIAG
         YbSAniKHbaMPc167YKi85PK+JHzxkhASN1+U9ZUDZiblIAJBhrqbf9crQc4Jvpqzxa3/
         JH32JioRFMOtjjOE0wAt+IqPk9jmpBlq+Hnq3TEDx67wn4pmMz+SriVbDQDkN5CY5e48
         W5RZ08VA/CytNm4b9F8wampo+SjGNIWUCYBh2U2LzTy916++KlLET/WbeHclUf4A4CTa
         A23ChaawjinVKsJCU2q+GgjgJY3bwIx8dKfuCcvvCS5Aoo3M8OJsyTZOUi8Po3CFz+nA
         zJEA==
X-Gm-Message-State: AOJu0Yx86YRA4WZXD9VRY/J32FZ0axLVY8Zn18/hCojVX/RNzScABwJV
	72jCZjMDTUj9RutnzQRCMVd7ysz+MgjlADI04YqnQM2KkgMaRV5j9WIVCgnm0N++U+kfp/W82nj
	X8EgJ6aMWcNIVhZ4pzM64uSfWtE85Dkm6jnLzY1vI5QApPpDi1PPKxQj4AbWs3JlJVi7m
X-Gm-Gg: ASbGncvmusnROHDZivSv/bR/grX3TxoUKhMYRf4Dohty4K6lIDDwp3AAQhgKoU4O8TH
	0w7wvXPzVahX0pwGfQ1GZntSm6Poe1jgBrAi1TqjErcKJH6UbHoIVDNOQhuStDuxLa5wRpYGWWG
	AP9bgC4a9KBeXEbAJBCbXgbrQeKoGWH8xzJtFE9gJVVfZFV4E8b6ctHOrPhIJT8HiNrWq1qJU1k
	OqPbHF0OtBo2LmZ2gsZKsWYxH+USeR4IucsZfm/XsMpN+13+iiBEKvpd4vdYyePdwIKt/RbhoVX
	AXN2z07fsl0UaYbpI5kJMrtojJQpQEvoIkhgHb9LDy2F3889qUJMSs3Pdr0icRH0K7ZRcCPNA2o
	MLUnZSWG1bx3LyOeAL8xb/QeKhii2vgEs/qa+FkIenA==
X-Received: by 2002:a05:620a:2943:b0:89f:5f63:68eb with SMTP id af79cd13be357-8b2c31306b0mr1431346785a.13.1763362209617;
        Sun, 16 Nov 2025 22:50:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdeoGbccTvmcB+P8bz8EhisphiIhQAqbeTYpjxhEv/Afkb2M9pq3MhccgUGQG4k2PFA+J4rg==
X-Received: by 2002:a05:620a:2943:b0:89f:5f63:68eb with SMTP id af79cd13be357-8b2c31306b0mr1431345185a.13.1763362209175;
        Sun, 16 Nov 2025 22:50:09 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2db481f57sm498961085a.4.2025.11.16.22.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 22:50:08 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 14:49:32 +0800
Subject: [PATCH v7 1/2] arm64: dts: qcom: qcs8300: add display dt nodes for
 MDSS, DPU, DisplayPort and eDP PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-dts_qcs8300-v7-1-bf42d39e7828@oss.qualcomm.com>
References: <20251117-dts_qcs8300-v7-0-bf42d39e7828@oss.qualcomm.com>
In-Reply-To: <20251117-dts_qcs8300-v7-0-bf42d39e7828@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763362200; l=7287;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=dmLZzuKEbsIDV08HNgYOEZ07SsWbkHlT3HhDa9Bp5L4=;
 b=9M/6aMyHoxFB8pB6NdOZIkeghlNo5ye7VzvIoxgFNevZ0ZD/yuVBfcU5Pn+Tec6texStKiPdY
 VZsM+e0NFHRCJTETazv8D95abe+8cxhez++DDobGSZO0bGuTQOz28zz
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: dn6UvJntF7kD_HmRgYP1S3gzZUsb04l-
X-Authority-Analysis: v=2.4 cv=A8lh/qWG c=1 sm=1 tr=0 ts=691ac5a2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AJW_lgGcPnFSnOaGF9sA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: dn6UvJntF7kD_HmRgYP1S3gzZUsb04l-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA1NiBTYWx0ZWRfX6hxIVlOon+5Z
 tApsYtvCa+8tye75mMHzHZjBnto788VdEs4dPbO1OSc8aymFd78LsAsLdshT46fppFvAGNUVT9k
 f1NA5l1yTeeTvNDhFgZrThs4YRBymXQBuzTaot1TrnnYeJdb3AnQ/6ZrtDCz7IhV/rbDvbI6JCM
 FnatgaBObsCrzKEfrVeMp/JbWUlnSj3m6qFDXIWYcgfdVF6/urgOB2PkUzqCInVUz7r8RuqgvNu
 shGHPLzLWxKPsqLWDI69nt7TeMvZ65+VUa7bTTFzoAUU/e/xI+G3tRqntXa7LqDzVGVtHRwOm1Z
 KV+23OP7sQ7mXT5xoAnuNnzv6n30UAlbzGg5NImYpQZlpFbaZxZvxSzhpgfaiK0/5SbMe9ONY+5
 A7dMobrxBBcOm56naDu5fKDgrgr5OA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170056

Add devicetree changes to enable MDSS display-subsystem,
display-controller(DPU), DisplayPort controller and eDP PHY for
Qualcomm QCS8300 platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 220 ++++++++++++++++++++++++++++++++++-
 1 file changed, 219 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 816fa2af8a9a..e44fd5c33816 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4789,6 +4789,222 @@ camcc: clock-controller@ade0000 {
 			#power-domain-cells = <1>;
 		};
 
+		mdss: display-subsystem@ae00000 {
+			compatible = "qcom,qcs8300-mdss";
+			reg = <0x0 0x0ae00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc MDSS_DISP_CC_MDSS_MDP_CLK>;
+
+			resets = <&dispcc MDSS_DISP_CC_MDSS_CORE_BCR>;
+
+			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "mdp1-mem",
+					     "cpu-cfg";
+
+			power-domains = <&dispcc MDSS_DISP_CC_MDSS_CORE_GDSC>;
+
+			iommus = <&apps_smmu 0x1000 0x402>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss_mdp: display-controller@ae01000 {
+				compatible = "qcom,qcs8300-dpu", "qcom,sa8775p-dpu";
+				reg = <0x0 0x0ae01000 0x0 0x8f000>,
+				      <0x0 0x0aeb0000 0x0 0x2008>;
+				reg-names = "mdp", "vbif";
+
+				interrupts-extended = <&mdss 0>;
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "nrt_bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				assigned-clocks = <&dispcc MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
+
+				operating-points-v2 = <&mdp_opp_table>;
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-375000000 {
+						opp-hz = /bits/ 64 <375000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-500000000 {
+						opp-hz = /bits/ 64 <500000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+
+					opp-575000000 {
+						opp-hz = /bits/ 64 <575000000>;
+						required-opps = <&rpmhpd_opp_turbo>;
+					};
+
+					opp-650000000 {
+						opp-hz = /bits/ 64 <650000000>;
+						required-opps = <&rpmhpd_opp_turbo_l1>;
+					};
+				};
+			};
+
+			mdss_dp0_phy: phy@aec2a00 {
+				compatible = "qcom,qcs8300-edp-phy", "qcom,sa8775p-edp-phy";
+
+				reg = <0x0 0x0aec2a00 0x0 0x19c>,
+				      <0x0 0x0aec2200 0x0 0xec>,
+				      <0x0 0x0aec2600 0x0 0xec>,
+				      <0x0 0x0aec2000 0x0 0x1c8>;
+
+				clocks = <&dispcc MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>;
+				clock-names = "aux",
+					      "cfg_ahb";
+
+				power-domains = <&rpmhpd RPMHPD_MX>;
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss_dp0: displayport-controller@af54000 {
+				compatible = "qcom,qcs8300-dp", "qcom,sa8775p-dp";
+
+				reg = <0x0 0x0af54000 0x0 0x200>,
+				      <0x0 0x0af54200 0x0 0x200>,
+				      <0x0 0x0af55000 0x0 0xc00>,
+				      <0x0 0x0af56000 0x0 0x09c>,
+				      <0x0 0x0af57000 0x0 0x09c>,
+				      <0x0 0x0af58000 0x0 0x09c>,
+				      <0x0 0x0af59000 0x0 0x09c>,
+				      <0x0 0x0af5a000 0x0 0x23c>,
+				      <0x0 0x0af5b000 0x0 0x23c>;
+
+				interrupts-extended = <&mdss 12>;
+
+				clocks = <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel",
+					      "stream_2_pixel",
+					      "stream_3_pixel";
+				assigned-clocks = <&dispcc MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
+						  <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
+						  <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dp0_phy 0>,
+							 <&mdss_dp0_phy 1>,
+							 <&mdss_dp0_phy 1>,
+							 <&mdss_dp0_phy 1>,
+							 <&mdss_dp0_phy 1>;
+				phys = <&mdss_dp0_phy>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp0_out: endpoint { };
+					};
+				};
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-160000000 {
+						opp-hz = /bits/ 64 <160000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,sa8775p-dispcc0";
 			reg = <0x0 0x0af00000 0x0 0x20000>;
@@ -4796,7 +5012,9 @@ dispcc: clock-controller@af00000 {
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>,
-				 <0>, <0>, <0>, <0>,
+				 <&mdss_dp0_phy 0>,
+				 <&mdss_dp0_phy 1>,
+				 <0>, <0>,
 				 <0>, <0>, <0>, <0>;
 			power-domains = <&rpmhpd RPMHPD_MMCX>;
 			#clock-cells = <1>;

-- 
2.43.0


