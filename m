Return-Path: <linux-arm-msm+bounces-116314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UEFkNZavR2oJdgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:48:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEFD70282D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:48:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gr484Pk+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=abjP8Ww0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116314-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116314-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D7DD3194C5C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 12:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C483C1985;
	Fri,  3 Jul 2026 12:38:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0EE3D953D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 12:38:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783082332; cv=none; b=pB68a0njusqIfWsc7QX6lytSyxsRVFYmUjEoSPENUQNlgCqGnE+soFB6XVw/dKFI2sSFAjejaqvHHr6C4sC/+5V0oFZamJ9owvqWTznwB4H3+T3RleIKASagXu5iAeF7vu/FH53fhni37VLWB8eDAem0mFINVaKoThmd9oTlbxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783082332; c=relaxed/simple;
	bh=zkvpr0+IBNpCcvVata0dYcAkxYLO6TWzdxrQ0fau8HM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FpHw9nJFxaX1xc3CdSa9v+LWkfJe0bh+/6cNtfq9qsryO+dfaG0XV9tlsfZiM9iLr4NP3TV70IAO1g1DQuNWs0b6Iio1DX3KUAoc9u63+79FprqxcST34vCUO5x9vLo4O/X8QezMaQuFC1TVetU1CMS7QbcAALWFvaty3YdQoSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gr484Pk+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=abjP8Ww0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BxjOI3053703
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 12:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1mScC6jo38A7a/6Yn25WN+90CHFBKwBJ8seDVQeSB8M=; b=gr484Pk+lWpQng+H
	vWXaNPKgyvYp7Lea7W7OIh185ynjrXqbr7hj+BhBdCyGoWAUvC18BA5BQzsYegk1
	VpK/BCxx11NWPLWQCq7+PtliTr8hvEZm/cndXKnnnYN1eUsVTtfgrU83OnJcxpTn
	JilevUKw6WdQKtOiYJXttwibvtPpJ1PAb8qRHGARC1X2Af17848Ct3WFOu2yz8cM
	Ox0DjsL95R0/9lH2c6Vs7ghk4054rDIyGkoWJvPDSzNCvt6y8yBae6ZsiBog4bs4
	YFn2YWiMqIcnwnuX4rvVfo1U7W138SFigaqoIWx/OoNq2qCmRN11Z3LrHSFKd3KX
	qJgVuA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j01fa3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 12:38:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cac01e89e3so8253655ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783082327; x=1783687127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1mScC6jo38A7a/6Yn25WN+90CHFBKwBJ8seDVQeSB8M=;
        b=abjP8Ww0MBvpch+xTSNQxCsYTyzsjBEHSIN26rEuuZZmO7cNz1dbHSYMu2bB4qELxK
         FWOf84cAlDFtxhQRCP2BZcJUsr9rspNQJ7mQj80i08cne6e6C+oRAHH2mMkIdZ1KnzQW
         wyXa7eGGG0VzCeexTYnu29cydwN9bAGYAN31ZLrBZLWfugffT2SYcY9p1HtupTT9pKp4
         KdFNyMiUlec1eZV1qQ4V+rqmG4d2ktpAuukFJ9Gi2rjF4TMFtXvpvlwF5VlkriiKsFDP
         vLbbeOubV2/OQ4RQ2mfi2VpPrtDsqVPwuB8+j/zKgw+w0d9nh6YOW1Xyl4XZUoZZ/NoQ
         jDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783082327; x=1783687127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1mScC6jo38A7a/6Yn25WN+90CHFBKwBJ8seDVQeSB8M=;
        b=sJWea7DSm0JidqZmK4BOwLZzf8CBpRS8Kl+8Hnm4H2vXpgTizJZb/fS4S/WigYjcOH
         baDyPRWyBeWHSBg7Rh7VIHgggjM0Dbr71pqhZm7K0qdRNwsEe6g8Gfw/okEav9kx68bV
         ikoekFUGB6NcSmLn4541BPZDjm4xsw+jjF3wOP2sHZ9QQuITYpZElOudBMQF1vUJsuxD
         sjVenabuNbWfDcV7/1Ru3p5WHWALBXJUxIXZsgVQcwb+FZYYeFvEuLyAIlveicc+Lcgw
         4fALHHHdCblVgRiw9OpFzVo+tmd0T7AZ3tK2ZBHXvnLn3zZW5tCD1nsoASeycmCPW8pu
         z6Pw==
X-Gm-Message-State: AOJu0Ywd+CpkRVfhBaJgBE3904RaCk/chMLGyTbrpHRldySsYHpGHjye
	n/ZYamxJTx18owneq7pZdUcV/eoRWnXKFcpRklfr+IF/dNk1jIyOcJY+nNiLPCwAs+y5mxwxcYe
	RaY4g/XY49FiFekz2TluRMUgXLiGlHXDBeD9VauacWcvEfy3O+CkX68Gu5guVDyDcW+yn
X-Gm-Gg: AfdE7cmFBVZjaltuR5oZgOql6LKy5RULNNQEI5VOnYtKAtyXUrdJPpOfnEBlxtAxdKg
	86vAR5lT0ZL+QNhrMM4XhGN6lzJC6WTvjGWk6sJkrx9HLmXOL19uhYEKu9ZWTdY7Z4izYjZlMTm
	cTFNUaaZvnSBpNLAFi84sxMerQF2K5bbai8x7TT6dzOyqSFpD+8b9q2uXVeH/NOijzLt2TAY7ZW
	SNWgej1tbdFoeKut7HXViiVdouEykoKAW09mY9eOGZGZuvhu/Po4gxmJuqK36x19XTKnzNjcQHH
	/vy29PxFkdm7VTyUTM12dwE0R9vtj6i0SlNPiERpM2JFys9yKg/VvIs2JCbi6sVkC4FZAKy7evq
	ecR5yi3MfJOExXroYEKciCw04p94TDNyYJtDjeNKkOLA1cg==
X-Received: by 2002:a17:902:d2c5:b0:2ca:5023:f983 with SMTP id d9443c01a7336-2cacb1c7b68mr39362565ad.29.1783082327426;
        Fri, 03 Jul 2026 05:38:47 -0700 (PDT)
X-Received: by 2002:a17:902:d2c5:b0:2ca:5023:f983 with SMTP id d9443c01a7336-2cacb1c7b68mr39362265ad.29.1783082326952;
        Fri, 03 Jul 2026 05:38:46 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm24356993c88.12.2026.07.03.05.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:38:46 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 18:08:30 +0530
Subject: [PATCH 1/3] arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E key
 connector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-eliza_evk-v1-1-7624440bd76d@oss.qualcomm.com>
References: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
In-Reply-To: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783082317; l=4231;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=zkvpr0+IBNpCcvVata0dYcAkxYLO6TWzdxrQ0fau8HM=;
 b=r2gXgCVhdvNcdW/UMeT1rjIg9QD4wDmufHv+cnbjL7M2R8v8it0L76UjXiwn5wFxkCNiQDtQT
 HWYJEUu5mvSCDG50kUpni4BIw8Y6sMKpnfyU1eIwBk+6lFwzE9UDx9h
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: rCfB3fnWtj0rJ2iIAR3V0ceSc_R5h_nJ
X-Proofpoint-ORIG-GUID: rCfB3fnWtj0rJ2iIAR3V0ceSc_R5h_nJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEyNCBTYWx0ZWRfX01HT5mpQlZ9M
 L+QARwoJe5fiA2p/xku58DemZ9rVX1LKtaqRKeco/VXatRBiwAxbOpvbFnLa4ciq+vFAc4oRX1s
 o9755s7L7UouOPwVNfCzSPgH84w2JA0=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a47ad58 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xTuWgevKKEmUOcCBws0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEyNCBTYWx0ZWRfX7C2+TQgMsAIu
 MnRF7guPhZhCLttSwPKVNu+9GLKa50/DcESZV2XmwNAK9xT1s8dQ/3s69y/OnPIB6jjL+LhaDV+
 AGevyRYyiWqgF90ywRCAwmy1gr3y09JUiwoxKbRTaYRUuiEPCdag4dK5rEpxUnmucSWXSRq/lP2
 OInewpMI1fGqKgZQfxbmSbEK9R7nsB2P0tkEW/Cheggbr8n6C9K1r8+K89tbUXgDWFA/jSwhy9t
 rPxn5+EFPqBvJNQwVYMM+hVHQfpBbEt9rVgVhr0rkW2+o5wD8BY/n9jB6JPGr2JVaCTEH43r+Rn
 1fZ8Bs/1QBd1a34W1wtDxHUEy1HScAf4Fu39HkJHxD+XSI9aBqJ+wOZcMMI1JdivHan7V5PPa+4
 L11gqPIH7Oysz6OUrvWTFl2b1qcSnao3JcePv5Cbc9ljbjkmuGAXOH5lcWraz60oCwq4/KArejJ
 DCFh88Y9wy8Qv9umJxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116314-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BEFD70282D

The Eliza EVK board features an M.2 E key connector connected to PCIe0.
Enable the PCIe0 root port and its QMP PHY with the necessary RPMH
regulator supplies. The M.2 slot's 3.3V supply rail is GPIO-controlled
via a TCA9538 I/O expander on I2C4.

The M.2 E key slot hosts a WLAN card connected over PCIe and a Bluetooth
device connected over UART. Model the connector using the
pcie-m2-e-connector binding, wiring the PCIe root port and UART5 for
the respective interfaces.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 142 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi     |   1 +
 2 files changed, 143 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index e47b24f8b827..ba41dbc34b81 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -11,6 +11,95 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	vreg_pcie_m_3p3: regulator-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&gpio_expander1 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	connector-0 {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_pcie_m_3p3>;
+		w-disable1-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&pm8550vs_g_gpios 4 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&m2_w_disable1>, <&m2_w_disable2>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcieport0_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart5_ep>;
+				};
+			};
+		};
+	};
+};
+
+&i2c4 {
+	pinctrl-0 = <&qup_i2c4_data_clk>;
+	pinctrl-names = "default";
+
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	gpio_expander1: gpio@3c {
+		compatible = "ti,tca9538";
+		#gpio-cells = <2>;
+		gpio-controller;
+		reg = <0x3c>;
+	};
+};
+
+&pcie0 {
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l1k>;
+	vdda-pll-supply = <&vreg_l3k>;
+
+	status = "okay";
+};
+
+&pcie0port0 {
+	wake-gpios = <&tlmm 114 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+
+	port {
+		pcieport0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
 };
 
 &uart13 {
@@ -18,3 +107,56 @@ &uart13 {
 
 	status = "okay";
 };
+
+&uart5 {
+	status = "okay";
+
+	port {
+		uart5_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
+&pm8550vs_g_gpios {
+	m2_w_disable2: m2-w-disable2-state {
+		pins = "gpio4";
+		function = "normal";
+		input-disable;
+		output-enable;
+		bias-disable;
+		power-source = <2>;
+	};
+};
+
+&tlmm {
+	m2_w_disable1: m2-w-disable1-state {
+		pins = "gpio35";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	pcie0_default_state: pcie0-default-state {
+		perst-pins {
+			pins = "gpio78";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		clkreq-pins {
+			pins = "gpio80";
+			function = "pcie0_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio114";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index e68a5fb99e2b..4d507b0651be 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -1906,6 +1906,7 @@ opp-8000000-3 {
 			};
 
 			pcie0port0: pcie@0 {
+				compatible = "pciclass,0604";
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1


