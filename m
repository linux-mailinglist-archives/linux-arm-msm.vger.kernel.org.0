Return-Path: <linux-arm-msm+bounces-112261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lj2HIn9MKGpJBwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 19:25:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 224CB662EC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 19:25:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pIzGZsgn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EhxnpMU8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112261-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112261-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE5A5309A8DD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 17:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAEE4B8DCB;
	Tue,  9 Jun 2026 17:04:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC2A4ADD9E
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 17:04:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781024662; cv=none; b=XHUElt3DeGX+aoeRG7YOLFZubBkz60BPhCHk/9HYbolLMIOLQjpbYXwDJxvE6oAPyYnSOp1q9IbzB4rhwDZrhXBV7RMryV5BGd97W10bUgZDobJpYqD9W/ST9qlYw6iNI5OymSKu/qWjnjbea5LQI+kOK1v5Z19hfuSy4MEAns0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781024662; c=relaxed/simple;
	bh=cIvhz+aTGqeTefQoh76+5Nj2l++XoB8R6R6QKA8pw38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IAdVt9EUF9LASxGDGhHSq8U9B002dCZSF03499Nonoz5Y1LYCX7t6AeOqj653jqZYi8Zk2u7t2m2iq5tT4+G4wW50MwlbRK/OMTC9b/vyo9z9qKz0z3L97aRf+lRmQObNe7HP+KREo57j39JEhW6mnLw1wYe0eQXJFwi+zpgm64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pIzGZsgn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhxnpMU8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GOXoE2746249
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 17:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YX2PdgNHHCyhysHFsTSPjEsekZuo5eTizJoTciq+fxE=; b=pIzGZsgnk4mVJExh
	l0dEUEHMktUi8Ep5ShHnyP+tHFL8zZ+7zCEf3BWVXwn6Rer6isHMZC/lTutRGrlG
	+30rsHzqXfZVBqynM2JGVIHxsqf8ClhWjR98AaQNroSxghYy5vzmguYfj3ff8WLI
	sTrU4HY7jZCg3nc63c6Ud5I1lMXTR0JlQeTpzpU8AmIKWlOAjzPQmLoQ61aAhiFe
	+ueVm9NP8KAzUEk07gE+sYm4OhhQ1gen7F8MsBf813KDorDcWIo3uwmKCcBZ2+FN
	FtP+Q7/h9Hz5l4mxOJR3G/sqfYcNxrtLeieFbQMS2XIjveIl8TiXj3RfEkNOtTfd
	2b9tzQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wj7nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 17:04:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a366b61fso3378907a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 10:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781024660; x=1781629460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YX2PdgNHHCyhysHFsTSPjEsekZuo5eTizJoTciq+fxE=;
        b=EhxnpMU8s0Yzf8cbp4eRUOsBAw1pYQcskabdeb8FaWwLlkRUBor1wA6aWBIDLVrvoV
         wYE2h18hlVc3WwCyl/WgPi0tH96kJEuPbIY7kN0vfmxBmSlsVRhoyRCwZgY8bpKbazUm
         6e1Ze3SRjLALno8KiPoOyyyxV/Ecbi/BhA5tiavqxn9OIrdP9INdn3RFYuhNJQpr+RM2
         +tR81KPxcmT8AZB/25vrHcK2E47xutgvZ8te4vY4VNlBHEuQgCuq8H68j4Sv8drG2yMS
         uICLLvkzc/Tn83+ectQKLBdlWwH5KA0MCrDUoYenFE7Uo2qurhOfMOM5YRTagnqrMyNe
         rIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781024660; x=1781629460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YX2PdgNHHCyhysHFsTSPjEsekZuo5eTizJoTciq+fxE=;
        b=DVj1ZOnA1IbOzUNK2mQlxwa1yZVaUspFmRsj6cni7Vm+VnD2NSFiOyWrZ5BsulZ2/+
         bwhJRjS7YxI3Z18A/lrMVEGlyRa2i7qgXVKTk0yzZxWRlCafImdw89Wd81BNTcYZoFCd
         q6mYUlRxjNkWsQaqZJUuoHxB/tqnHQZ4PCEqcMIfUyX4Tqxeq8UPEd7A6nniDLUVfQax
         GMIjztpHIAMooelrps/DfDX7hcx7Ql4TodnhEXYKBv4u8jd0rDvskaLXomOaKKdeK3JU
         xvTbk7FJmxJA8XYn4rSsPfv9kiKAUSSttu6xlmyt1vtXuhEAhOff27EFaLLtOMpoQdlM
         6kvw==
X-Gm-Message-State: AOJu0YyOzQox8Vr37dJdgJWa7+wBlPAkMjPwHVNAnUk2QHB8v9GGhuLE
	j7mG1kzNC593aCFsnNt+m5M8T5lP6+gGyBCH6vZNm1pq/pvO3IaFF8kAdOmd7REjqjz+22GyI2C
	jmH8arKcIil/X4+cxhvB338fs9rwVssh2CbR+oc97t2SR8UxPAsqGcQpNeOWeA5qRaY6t
X-Gm-Gg: Acq92OHaHumO0iHMrqIBWYVsiE5WEUfakEEyVaoC9X0M+jUpG226BRyUzoOuedjXndN
	cBLK/LFX1Eu/kKM+NiB4AU1kUoyJHq3olvcLr5PM0CrE3tKb59dbP7rWcq2nTyWQPYsX1iCXnyc
	2ixVsKtSy/P/IPUw61LHdKdj+rgV3A7ZvdorlI7IhrtxWuCA5LDbgzSi0wdmqn2/xaSVbHBhFsT
	z5K2MdKZuVZGpfCXzB4yYI5UioV/RoVtA0V1RxF6oexIbsVgSf2A57azQeSFJtVpCxQOIbImGkc
	sXlDMhmZIEFQGQbryohU4o/r1jDYCwBH/G6EiqZpkzT+amU1Eh7n4V/uqm8a4zzOLGujpOPMbgu
	Gnpmjut0wSO9pdBTBfjwfdF0Oc7V+1KTQXY2H5m85CuW2WbH24ZWp7NDSZOF+RIGhNiOxtkCU1S
	fQIb6/a5+mD0/65XzYFHUYjKGldGwc1yqTdCCE0o/4xCUnK12N9gp+Ezvda974tLWenR4=
X-Received: by 2002:a05:6a21:730b:b0:3a2:e0d3:37d2 with SMTP id adf61e73a8af0-3b4ccfdb601mr26289934637.35.1781024660024;
        Tue, 09 Jun 2026 10:04:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:730b:b0:3a2:e0d3:37d2 with SMTP id adf61e73a8af0-3b4ccfdb601mr26289863637.35.1781024659428;
        Tue, 09 Jun 2026 10:04:19 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b9b3fsm17739119a12.28.2026.06.09.10.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:04:18 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 22:34:06 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: ipq5424: Move PHYs and PERST# to
 Root Port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-move_perst_to_rp-v2-2-6c731523d08c@oss.qualcomm.com>
References: <20260609-move_perst_to_rp-v2-0-6c731523d08c@oss.qualcomm.com>
In-Reply-To: <20260609-move_perst_to_rp-v2-0-6c731523d08c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE2MCBTYWx0ZWRfX0m8g7MpSIr7l
 pMPpIAP10nJ5TxAgOOEqAEPkWCPZfTUm5HsfUG3I1LnBtOx9BL7BHIrG04Z/qbd3+8pNZv8ccX6
 pEAMb/3U9sJYhI3tUaGHH1aMmW+f+a2Ic4sgR4cQxAs3pINNPEE3qTO/8tRaKbuhJlR78mezMRd
 iMWIKxzerGpK6lpCURFNAsFMf/w3GRDGupanD0G9qWmjn0RM3sAIaq2tkx8jb6EF2qMOFIEjBYw
 eewYCRS5JpdE6MvjmonXd34tOv/LSJDD9MDVSzLTqzObnEYTTGPfeyE+fet1FTmwwignXi/Mxrc
 91MJfmCzlaJI/YeolfoIZ28IKKtlAROskkHLREc9tPG0HkdvDMDMH1L2uKZMqphsQD6W+u0EQBf
 6Zl2gz3fmGZE3WiVgrKgDeYCcjrMvnwvdRUIU4LrOGMm1I0tKqcPMZl95IaIm4Owkp5TI5/QADi
 KzZFD6aSciyjhnk2aLw==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a284794 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ia1wqS2LDIYHZchi8R8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: N7eINAr0g9dGL39FiZF_cXx4ggcjoHgy
X-Proofpoint-ORIG-GUID: N7eINAr0g9dGL39FiZF_cXx4ggcjoHgy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112261-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 224CB662EC8

Follow the new binding style by defining PHYs and PERST# (now RESET#)
under the Root Port node. Avoid mixing styles and move these properties
to the RP node.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 12 ++++++++----
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 24 ++++++++++++------------
 2 files changed, 20 insertions(+), 16 deletions(-)

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
index 876bf6a8b8ff..702061e16a58 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -968,19 +968,19 @@ pcie3: pcie@40000000 {
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
 
+				phys = <&pcie3_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -1071,19 +1071,19 @@ pcie2: pcie@50000000 {
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
 
+				phys = <&pcie2_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -1174,19 +1174,19 @@ pcie1: pcie@60000000 {
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
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -1277,19 +1277,19 @@ pcie0: pcie@70000000 {
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
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1


