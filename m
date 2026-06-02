Return-Path: <linux-arm-msm+bounces-110833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GBABLQoIH2pEdwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 18:42:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE366304E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 18:42:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oozikyH+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cS+84T85;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110833-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110833-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DD7A30BD8EB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 16:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E6337647E;
	Tue,  2 Jun 2026 16:34:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62835374E62
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 16:34:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780418065; cv=none; b=WZkq4PFjEiUPi6kneaDsTBYVBuZw6oqmaSgsK76Qf8dyZe1jPAuQqxWtdsMp3abqG5Ei17d5SU1G2lFOCH0pEh//LRA2Dt7GEpKdfD+ypAhxK5f7TvIsC/xFkZh+Dtkt5AqW0skYx7vwyVb3LJ82V1NkWnFPcArlohaTvwieq1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780418065; c=relaxed/simple;
	bh=vPRuCmZhkBUOBh0DpMYjVuvAm1ugsgfsEoyTKkJ4wh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j9JZaMmC/JQCvmrhVWoaEXFsA4ieZ0suympbIn4fnT5bVKcsUZdaDXC46IDHPtW3w6/9MlJXjNm3YWO3zFaph2O0ENvKTsIrCGYxx2gDbIFXbs7punXJwuFDBJ6/8y05sodOx8sR6D607XiSlgweGxplej/D745uxkHcD0Fe9zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oozikyH+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cS+84T85; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652C8tKB4012468
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 16:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cIEaA2LUGN5ay8u6k98AA4kkSKHcmpA2O4YQp3JwowY=; b=oozikyH+x/N680dA
	P0tdpxSE/hgCFS55VorVJJT/7fyS4iu57ifr+oQOGM0i5jeyes5BmGQIk9woUfxB
	2KltE9yeQfX8JphzmsxuFe7PsaliWKEOZ0haof/QD0ntRKyJhCWX2tJ10y+NhDEm
	A08QqZLg7VJ/7m2fhnlQu8x25RoLfFn6Ba2USFaV8CiX7KJCUBFjit5rt/T2dAVE
	4iykF3gF/MZ7+XQAtj5co5o98Ue8yGNsqfRpSDL26qF7C51hd5j8UNsW/wpRQTLb
	mtdjHZccp+Z+zeWb1N3vl2WLnAPOduevj5VJn85iPn03EDnXS32oqrcbsq43Bnfv
	QN7pYQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf4jnw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 16:34:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8428384f31fso34197b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780418063; x=1781022863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cIEaA2LUGN5ay8u6k98AA4kkSKHcmpA2O4YQp3JwowY=;
        b=cS+84T856/q99zINynDqFCRlYgtKZ1HHGVmxFzmOY3kQuYDfp374q+qtMR3LyIx9CY
         bkKwTtdPSWCzcAtCp8/kHU8Ua6aI25++eWu48orSdSTZ/3VW0VslmdcXX64sMqgixCWz
         t/AtnWccALVkzmq7jjSUK4AYoJ8fojr0SoyKYpO0P2lanlzKZplp5ANdiBzrKFfNiF08
         Y9lBcqfiEleBDoFIDTWE/PBevMCHIaZy13Q2hM0CpgH+kxct2EWufSn8nyzIWVZ9ev6k
         JvSEcGwIkUgX+rbIpEfGqpvctGizZ3XVCj8zgbapG8A52SzcbOr/HGm2oM/3sNCNHNOI
         WtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780418063; x=1781022863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cIEaA2LUGN5ay8u6k98AA4kkSKHcmpA2O4YQp3JwowY=;
        b=r1NWFJs2NY5NlypMPGn5yS+JKHs97oPdori1GW7LcchOIrW8qYoR6MuD8RwrFviqiP
         QNHw0GGNetYmtqBWvXP9l8JVz8d1br+WsyH8UBx0JIiFGnxIcMJ0yE0dU3qdzJl0kl8/
         UbU4Nl4WeDkidZKhfaZ+cqkq4jnd/d2RxIjb7j9esLA/cxjWKhnoblmUM+Sd7qZe04Rz
         cVvE55RMawMU85x/yjcqSFyqahnAphr9Y5DsqSG0fGtr3ctO9TWXew8XJiV5AJvD8vaX
         KAEg7YvcjLSLtJcipMyNee+wn0mVOcqfDp65rlNHXBsRGeEcsDoatTAyfjRuibeRkhsF
         Dq8A==
X-Gm-Message-State: AOJu0YxaGoyKx4fzPtg+tU2n0UY5xy6UMR9ThqeJA2SkEdViCPyGBER8
	DSiEHZe8Psf+9FjLSBOT/bINDo12xVFQmMHX4v00lewy6ByyxW1lpGqRlAQRTCEB7P26l1TckuP
	0HdvqyeZO7app/FT5qXvsW65rERgHd7KpzoJu8FmuvteNTPBs1ggSis4o6iawFf1xxuZO
X-Gm-Gg: Acq92OEOn7QwQ8L+4cu0kvits65sMRAI9V6sJAjtSwNyKW/Hlbi+q9jCGAsc0/+iPkG
	3gD6OzGSWTE9eqIN1OdtKxixG6JvUmX3jimF5kOMs35BA3rBmfGU9MBSH3ocAIbnrhjx462HH6K
	kBrsHTX5xo7x4DmYhlkEErUZi/FwlNm/MyNLNDzANRH4pj4iWoGW2SR6aI1vB00gwCJ2OPPZ1wX
	hFAGdsbY7sVGh1GyIHEn+I69nBmAU5Q6K10aodpIzxadJcB9T+fpiuwZESMPc12UCB8d5373Do8
	4xLTqdtqbmfy38TploKMQtDIOGCGE7i4y0ONb+/MGFJ0l5QC6wq06TwwlBz+gu7Zl9nefph+nQy
	A96MvwUR5h3yZf5H6w9Pe3DUGbHLyNpHZEzrEviB5YTZ4AWsZj5WNTLc8CHXJbb7A0u+9/ooKeC
	qVBLNg8T9g6mrbclH4shY2rz3BohaFC7AAsK0wskXItVCS9mZjz4OT4CAPHvlxNmimn+E=
X-Received: by 2002:a05:6a00:1d8a:b0:842:50fd:4c0c with SMTP id d2e1a72fcca58-84282ec21demr325676b3a.16.1780418057986;
        Tue, 02 Jun 2026 09:34:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d8a:b0:842:50fd:4c0c with SMTP id d2e1a72fcca58-84282ec21demr325648b3a.16.1780418057342;
        Tue, 02 Jun 2026 09:34:17 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm292181b3a.7.2026.06.02.09.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 09:34:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 22:04:05 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: ipq5424: Move PHYs and PERST# to
 Root Port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-move_perst_to_rp-v1-2-8ee5b80316da@oss.qualcomm.com>
References: <20260602-move_perst_to_rp-v1-0-8ee5b80316da@oss.qualcomm.com>
In-Reply-To: <20260602-move_perst_to_rp-v1-0-8ee5b80316da@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE2MCBTYWx0ZWRfX48YN2iOPsBDb
 bNPbBz6W5Ue9sjFYlqm2AlEliwrYjoP+a/H6s8zfeUHHpoBlJClJo/Lng+gM7j9e5h58HJWSScb
 ISo8SFOWWvCqv+IA9K0zsK75g0nv39691Grittt2rnGBkYlIgoK2gSG8+6zjP6IR6nIk/DvnYD4
 QtQsFWoNXnsPMzJ/GVUQ5+tGicdwzht78DOFiXbhPR0McWxZck+aZYh1aiXI6feOHoZaRKj82vO
 U0CwKauSlAgQXbYYo+T7zMfcpLTQnZ35LRJSWszzFR7wnoC7Wc5sxrsmFVrerZap7UGGh4U3inC
 u4HyzSgFH6bLe06pcqHkTLE07RP8yTNW1jx8Za+Ea7m48S0sYbJxiSTlUnmIoFp0CANZF4LK3bI
 mJ4ilcAXoblMOThJxGqxZceyj5SC4zGBt73Ph55VbrHyhwPAf4YvWUiGEu9MNSB0eQAg+uLwnPh
 Kmi2lGjgPLaaVvl1ciQ==
X-Proofpoint-GUID: x4gTA-oCGAJ_rpYod1doFivlnuORJZIk
X-Authority-Analysis: v=2.4 cv=AJZ7LEvz c=1 sm=1 tr=0 ts=6a1f060f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_Idibcdv6X5oFpS-TOoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: x4gTA-oCGAJ_rpYod1doFivlnuORJZIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-110833-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4AE366304E0

Follow the new binding style by defining PHYs and PERST# (now RESET#)
under the Root Port node. Avoid mixing styles and move these properties
to the RP node.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 12 ++++++++----
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 20 ++++++++------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index de71b72ae6dc..be8657239c46 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -86,8 +86,6 @@ &pcie2 {
 	pinctrl-0 = <&pcie2_default_state>;
 	pinctrl-names = "default";
 
-	perst-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
-
 	status = "okay";
 };
 
@@ -95,12 +93,14 @@ &pcie2_phy {
 	status = "okay";
 };
 
+&pcie2_port0 {
+	reset-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3 {
 	pinctrl-0 = <&pcie3_default_state>;
 	pinctrl-names = "default";
 
-	perst-gpios = <&tlmm 34 GPIO_ACTIVE_LOW>;
-
 	status = "okay";
 };
 
@@ -108,6 +108,10 @@ &pcie3_phy {
 	status = "okay";
 };
 
+&pcie3_port0 {
+	reset-gpios = <&tlmm 34 GPIO_ACTIVE_LOW>;
+};
+
 &qusb_phy_0 {
 	vdd-supply = <&vreg_misc_0p925>;
 	vdda-pll-supply = <&vreg_misc_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 876bf6a8b8ff..6635f9259bbb 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -968,15 +968,13 @@ pcie3: pcie@40000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie3_phy>;
-			phy-names = "pciephy";
 			interconnects = <&gcc MASTER_ANOC_PCIE3 &gcc SLAVE_ANOC_PCIE3>,
 					<&gcc MASTER_CNOC_PCIE3 &gcc SLAVE_CNOC_PCIE3>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie3_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -984,6 +982,7 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+				phys = <&pcie3_phy>;
 			};
 		};
 
@@ -1071,15 +1070,13 @@ pcie2: pcie@50000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie2_phy>;
-			phy-names = "pciephy";
 			interconnects = <&gcc MASTER_ANOC_PCIE2 &gcc SLAVE_ANOC_PCIE2>,
 					<&gcc MASTER_CNOC_PCIE2 &gcc SLAVE_CNOC_PCIE2>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie2_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1087,6 +1084,7 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+				phys = <&pcie2_phy>;
 			};
 		};
 
@@ -1174,15 +1172,13 @@ pcie1: pcie@60000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
 			interconnects = <&gcc MASTER_ANOC_PCIE1	&gcc SLAVE_ANOC_PCIE1>,
 					<&gcc MASTER_CNOC_PCIE1	&gcc SLAVE_CNOC_PCIE1>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1190,6 +1186,7 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+				phys = <&pcie1_phy>;
 			};
 		};
 
@@ -1277,15 +1274,13 @@ pcie0: pcie@70000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
 			interconnects = <&gcc MASTER_ANOC_PCIE0 &gcc SLAVE_ANOC_PCIE0>,
 					<&gcc MASTER_CNOC_PCIE0	&gcc SLAVE_CNOC_PCIE0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1293,6 +1288,7 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+				phys = <&pcie0_phy>;
 			};
 		};
 	};

-- 
2.34.1


