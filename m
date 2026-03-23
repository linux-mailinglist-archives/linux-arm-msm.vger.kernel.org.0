Return-Path: <linux-arm-msm+bounces-99103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DWVFIvcwGn6NQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:24:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E36742ED044
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A9BF303A860
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 06:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A252D8DDB;
	Mon, 23 Mar 2026 06:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVgwvTTN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SjxvZvHe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734452DCC01
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774246810; cv=none; b=l5VF/G8YwpqrwuxfrgqhK0ko91VxWB0cdJJ67mibtg9KZsFNL93qSIbKPf/yAEOJpmbsgMAkb1KoF5/5ll6MJOtZkGOy5wCw8lL5IqKw5C0b/EnyY60fR5kBYdQ5Egurzepm+PTKkYTypN2knuc1eL2C+K+bKlrg1cLtJ1gUW1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774246810; c=relaxed/simple;
	bh=5LhTzPA47VVCVvU48dN8Osb506neqFcECa5LFBwxU54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uCyR974a8dbODlU3axYCcs1Dz0pwdLgrCQkxbMc+U5kEP8ZwzlreWBLvC3EGqOPzwcloh+dGMaoGDDWsNdBkP4l003j0Fyjs2KSBdKDLJmSNH3TQkCoiymGXDxOIwoup1SuNYaiUbYPL6YGKoFvCH0M1RLFCA+fWGEwVraPGPb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVgwvTTN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SjxvZvHe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5ttv13310268
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WVShT/RzHvmaEBSZNtnMlB+wRftfPDOH0BEqNC/XQX0=; b=YVgwvTTNnc+G+gxP
	9No/rCHEYDKBamYWYqnD1pn6IzmkdAjjALtXGMwEZu/7uM7eaxtskinPKGbeOcew
	gTLPT5ob/QZdfujaFZnG1OTlW1Vpkn8D74f6O0u42I4hwN8tQCntPwcFtFs8+juY
	tIpk1nKA7WjKBnt+/KkfylzM8VcuBLisOjR8JygLABJ7U/fViozeqn/FP85jt92j
	5MUgM+4GkZamuL6UKpjmflCVE91QCS/H7K9hY+Tdf+cWEYdssTC+jx96Z4XzSVNE
	i+jcBCOv8k8BvIpH8eCmzIvNb6n/SlvaDX1fTV2XPkS3dN3H81cgKiwGhjnE+e8m
	HZHkQg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kj1kw4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:20:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0ffce2570so7626835eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 23:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774246807; x=1774851607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVShT/RzHvmaEBSZNtnMlB+wRftfPDOH0BEqNC/XQX0=;
        b=SjxvZvHe+cNYVhe9wKsYN2I/GBeOIff+6eXBrx8Xw7UVSRnHCD7RZ+R4Uwjj+5dD9Z
         XJj7sKcLXt/DO8AYfHIQeP/kBc48lkas0s8df1QqOljZdQX8I2x3KSpDxbz3SUX2QOK9
         Po5+dzfeT/cCYpIsvgOecZ8qO1NmiDZUsjXs+iTJqewlEGtIwpnfV1ybL9zYI/DZ4Feo
         wAIhx+k3TfK27mVMihGlxHtaFhV0MZrycfxTreD71IvRHdOnzFF6Czh/41hwNvrTY++B
         Id0tm2XNUBXbUcZqCAvfp29HjJb1PBpJ33806EZBJ/cqFPCcI4aLX+WwUb73VulgLr0C
         ibOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774246807; x=1774851607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WVShT/RzHvmaEBSZNtnMlB+wRftfPDOH0BEqNC/XQX0=;
        b=ZFng27IYmR40Uxc2PXC7gg/00yOEmyEXbyiLMU9BzLXBUpDL/T2WHtBwW/bE/CfKlu
         YSE7RHjdbuEA0JUxPIv6mGR2LP3BP7HN8ReI1FvkbRZ7/jg3RtKKu1Sg5MZGb77BiYbg
         uesQyL2Pu88gVL+t+7Amp0H+Uf8KjinmA1R+oSPg0v9cenL84JccrjtOkYoaTKltYaEm
         gUgGSxhMCHtvOvybksD3AXOfzhPyCD1BySwQVM9+qq6SmtcCCGuWEs6+xXbOwcBokuJY
         EcYdEjhib7N+v8QTRUN0kku9sTHlNhs4GZm8MOiVXvAIBcPU74aB6v+AtWKJHP+3FI4C
         XqQg==
X-Forwarded-Encrypted: i=1; AJvYcCU2TpbNhFdf17rN+bwvIbFcsCQQZiB8rLqxS66A4vs/HkHpi5KsDLtlu21C7Bi/RtUQxJhiWmVGV/QYFdmu@vger.kernel.org
X-Gm-Message-State: AOJu0YyO5hnn9V6IZzX66RzrRqPfz8n7Y2k091qeRGNcjUOok07axLgK
	Gn1U//I9102SaZrk1lULFle846llsIM2zW8cW7ofsLUgTS2DsD+alaNSZ7/rA5HfegPT7oOGcr4
	7NSLtIRhWfwewgrVT//jdzE93npju94bzD00Db8QnpRxVT2dyJq1ZATjBgtKWMTWmYL14
X-Gm-Gg: ATEYQzxLOsSbvh1sfN6hQBKfH7xLDal4wJPB4U7czgyVmKCrmnayMi16PFh8cmJE+H6
	YPBGzMLfEAmNfZu5MWgxn+yTpOjdVLwug1/zQrQj1IwueG9Gb1Fnq9XCzT5iRVJrF5rTY2/dRWW
	M/0qHFcBVVZmP6hHtAWA+D3dqCDYeIfrl9qQpcwQSlcNJKdWv9pa0TVVDt/OFTzsdDQyj/vIEoU
	3phrZTOH7Hr4ouZSy91FWTeZjdRth+iXcRSOIFAg3TrFyFwC95EktYcCNzndDlalcqRqUNFV055
	29z65dgQTd3YgAdGJD2i6oTQrXMUmnDKVoVcuatyuteu4Q4w05OHCFt5WVcNkCCYhWNmtkMrXuU
	K7U5WEjSJQMC5jokV3+BUYiRIMOy7SD/bI+I9G0c4fY8HhqIOFYJaUwWLxsxcbz1xlu8YWLD5
X-Received: by 2002:a05:7301:6704:b0:2be:884e:17af with SMTP id 5a478bee46e88-2c1095d7be3mr5037839eec.2.1774246807014;
        Sun, 22 Mar 2026 23:20:07 -0700 (PDT)
X-Received: by 2002:a05:7301:6704:b0:2be:884e:17af with SMTP id 5a478bee46e88-2c1095d7be3mr5037819eec.2.1774246806430;
        Sun, 22 Mar 2026 23:20:06 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c985sm11389751eec.2.2026.03.22.23.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 23:20:06 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 22 Mar 2026 23:19:44 -0700
Subject: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth and
 Wifi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
In-Reply-To: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com,
        Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774246801; l=4325;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=bE/hZYjoJtOCKPlLVk5FOjMBTyfzNUVv2PtnLBJZwec=;
 b=3H1pCMynmX0OqAvVM0wqdJx6GRRN8TW/AqO5ADVy1VFae/MKC0ZvMd2j5903vEQfkCIPWjAGj
 mfjsUa8p4umBnQy6yh3vIvdAkCQ1I2IHvOttXH4PvNLDilkfNaXPY8t
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: ouxD7bm6k4tuBM3V0UMMU-4n7VsY3MCI
X-Proofpoint-ORIG-GUID: ouxD7bm6k4tuBM3V0UMMU-4n7VsY3MCI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA0NiBTYWx0ZWRfXwG7FYaw8Zvvz
 rTMAngCh6G0tsD6vQFk8vPQfgXDs02bDoxjwt/MIj/J5bBuGEwVlH512OX0PW3GKUImi8ilEfOj
 lOLre0fHOXDFLJpX/2jQCo5yMqrRDKN86zaLsbEKeVUWE8fzBoBkB9EJ6XHvVRb74/lg2qag5UB
 vS8mS1jYlkTj7IJznwRd4zb4usKWFcIF+I7fDYwJWgPwNTL9kf3nWRSX/dwh2861PLMJYGA9r63
 Wu8KiqaqGsFlk36EmTI6lKle6A0IX1uy/d4BPP6yxgxzluK3AouuxzHaLamXglXpGlva0JiC+NR
 qrxkIEAPgFibT+n2WZ/1va3JVXoeWkCyrgV2tSxRtdNoKlLdJir56iENIS5l4/k0JtrweiUBuu0
 EwQ7Rl24NFLrBZYKUlM3S22ZkNmnAD7cXL9nYTEumUzitO8qWpcokxiF+m6Wv+3TkQdmfiN2w8X
 05+Sib6zXg2fbj9qM1w==
X-Authority-Analysis: v=2.4 cv=dYiNHHXe c=1 sm=1 tr=0 ts=69c0db97 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2oEaXugoZL2-_XV40pEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230046
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99103-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E36742ED044
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Zijun Hu <zijun.hu@oss.qualcomm.com>

Enable bluetooth WCN785x and Wi-Fi on Kaanapali MTP board.

Co-developed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 121 +++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 5054c5933687..d0f3909621c9 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -27,6 +27,7 @@ / {
 
 	aliases {
 		serial0 = &uart7;
+		serial1 = &uart18;
 	};
 
 	chosen {
@@ -189,6 +190,68 @@ wcd939x: audio-codec {
 
 		#sound-dai-cells = <1>;
 	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
+		pinctrl-names = "default";
+
+		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
+		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s2j_0p8>;
+		vddio-supply = <&vreg_l2g_1p8>;
+		vddio1p2-supply = <&vreg_l3g_1p2>;
+		vddaon-supply = <&vreg_s7g_0p9>;
+		vdddig-supply = <&vreg_s1j_0p8>;
+		vddrfa1p2-supply = <&vreg_s7f_1p2>;
+		vddrfa1p8-supply = <&vreg_s8f_1p8>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK1>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -827,6 +890,21 @@ &pcie0_phy {
 &pcie_port0 {
 	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
 };
 
 &pmh0101_flash {
@@ -880,6 +958,18 @@ led@3 {
 	};
 };
 
+&pmh0104_j_e1_gpios {
+	bt_default: bt-default-state {
+		pins = "gpio5";
+		function = "normal";
+		input-disable;
+		output-enable;
+		output-low;
+		bias-disable;
+		power-source = <1>;
+	};
+};
+
 &pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 
@@ -1011,6 +1101,19 @@ &tlmm {
 			       <119 2>, /* SoCCP */
 			       <144 4>; /* CXM UART */
 
+	wlan_en: wlan-en-state {
+		pins = "gpio16";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio18";
+		function = "gpio";
+		bias-pull-down;
+	};
+
 	spkr_0_sd_n_active: spkr-0-sd-n-active-state {
 		pins = "gpio76";
 		function = "gpio";
@@ -1067,6 +1170,24 @@ &uart7 {
 	status = "okay";
 };
 
+&uart18 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+
+		max-speed = <3200000>;
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 217 GPIO_ACTIVE_LOW>;
 

-- 
2.25.1


