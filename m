Return-Path: <linux-arm-msm+bounces-118765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vetuBRnZVGo3fwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:24:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D792B74AEAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:24:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CENCMxgk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hwoLTxM1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118765-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118765-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AEA1308E5F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FAFE3F4DEA;
	Mon, 13 Jul 2026 12:18:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7C53F23A4
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:18:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945121; cv=none; b=ucocdJwXLD7xSGypvd8oRcRhke8JBXN5sI3yYaEFhGGT6T0UmXFjq+Ic8L3XfgW+3s2Unu2jT+SeJm5jblOidl0brCY3eXDMlPPPTf7rqaUHB7/FtAHZCc/o7h6tL7vI9ZhDMsU6E43DMWDGsVejQ03lD54Rw/7beomfjnTwfnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945121; c=relaxed/simple;
	bh=KR0BBZeb2lASNJ4/im4q8WiVNxgehLdJ6hZHz0ZmtGM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gUxDxBvX8e0eoFsE1ve33K/yVwSN4cQGv3QPAD5ZjieJcYoArsDB54PjlZmBHyM2yGS2LqZGli3Fjq0bxMxsrx76pfLrKcsX9sOnr2ZHHquDgsAHnzvAOKtS3Id6sT1Vx6F4Xkt2YYGIgcdH7DfyEryfHBfVpTRlqQJs3GGFWrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CENCMxgk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hwoLTxM1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCE3641561359
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UA7LCw1pRQm
	NvmLxL2+hfWUPNsSaDBH2DOoLdU+gEK8=; b=CENCMxgkIm7PVM12/ishIAf+9E1
	LArf2zUkPTCVuzxgHIL1BgYQq2SfJ/7O6ixDLZ1JUGVEyTS29SnI/38FxRdVx8Fr
	cIsR68cl2ayO95nINQ9gdGxxPs8aFPdFk5ZS2PeJz3S6YbXYjwnIUpoDJdGNiC9F
	ThMd1JwjcnkPG8X4J+5ldYXLrGRrH25NG25zjypRmRClth0VN6F6nBKK3OaP/Qd6
	cGq0hBVewgoBXDBgvFlNf/GN/bKo8aEu6mgkSck5s8BV1/RUY/ZHuqccD76vch8y
	CfJVXRe8ms5qgt1yAcP+EorRf4SNbWr32ke33Bnpj+oOpRzPc9DOlzkm06w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3aeqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:18:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8482b95574dso3682306b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783945118; x=1784549918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UA7LCw1pRQmNvmLxL2+hfWUPNsSaDBH2DOoLdU+gEK8=;
        b=hwoLTxM1XGi7vQRbYmadPJuDpa5Vt+HZJx4YXZUojzQIx/dcmDDVaD3x96PdOO6ZsP
         QCzJVvdlUYbvpaN5sorJ19mjSu8ZgKv4A/aCTBxLuHhBOt//CHjO+NhLgFI24MivU0vV
         yLw7AjQ9e/3hzyEx2Zd35QBrqJz4U/H38Zy1NuelcA3KMD8CIdNIccBywA/0c5xX/f7M
         rmbR4WwXot25d35XFi//JhULBPdHhC5P94FjxPJX7qv3D2VA5jq4mFHcYaqZZHNVqSBk
         xK90aWqizgoP2m3kGjMV2yO+9yJYJX9gcAUrf20g+CCgByV3eVcfvtfxwVy6SbMMMkjk
         tq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783945118; x=1784549918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UA7LCw1pRQmNvmLxL2+hfWUPNsSaDBH2DOoLdU+gEK8=;
        b=iG11o4LbYqvXkho4kFfxoBQtNIAEVFTyGZPnB+I1HCrw30vAadPMbq70b7PSipb4oO
         snuuSd1Gych/ILMNdT9vWD5R90Gf6pXK3VMJ6x33eWwofzTz8wv0yJW8SX1nrZ9OQb9b
         3Wq5E0dsxWpa0WyuU+8TSri/NV8ozqfNV43RfFkyDm6XwtbuZ5k6djLejAaqhJgzf8h2
         uWl55UrDAkMZInUCR0QDaVifCZU/Hf9zINpZ6akihzeM6M1CsgKLjaznC+fdvuGW9RNw
         vut3Ps4PT8UvhbY5fue/5PArXTeAuZGPNmxSYfgs1C/P6S2FMFv2cthspsFtXCLTlTiQ
         bsvw==
X-Gm-Message-State: AOJu0Yylh2g+bhljYUR2uGtIQInu/XEdFxqDH8mW9xd6KQXgkicMzMdN
	c3173c6t4m9b+Ao/mcJ6E2I3wtVUkYXyakRnMF1fXqnBJ8W6T2TTaouU5urvlPrH/ORi8xq/gpI
	fY1UaF9V2ledsspzvN9U3Um2N71EPiTWmC+kRDDmdElvfRquRA2xCUSBc7PuDRyVtmcJe
X-Gm-Gg: AfdE7ck/PtVPyZoeyQ3tZSdwtI7AChAAPDCdZupJ713Jsb4f9tTu3yxz6CpZKRHUmmm
	7tijJdujGPU+ragGByxrhku+j+Mau0yE67OaUU4xHOdPo3OuHA8RMnW1rroVWcmLj1QiM8jo5gA
	+Z6mABFsZhhzuJlAD6hnk3V5psiIlLTW/Q6L4hXd4xIQFA7sdm8dwUMiKeDSPMkjaZd7CDoBdD+
	YT4uk/HGDin3PaGap2TUXxLY8PNQ/8F46aDu7QPhEHZr+4q38ioKhtWP3b2Hh9y218fvNjehVq5
	b3G/lJ9yVC/qNsQGC+cWTfXXfJv1snDjG//7HMsWZTFC6+P6tAj5iJc9aLQOsP4OYzC5/gvMzpk
	8XRF+2PlB3FRa8OzTxlseODPkjuF8ZRCU0u8qLCja
X-Received: by 2002:a05:6a00:c82:b0:848:57f3:8f99 with SMTP id d2e1a72fcca58-848897a0bbemr7774786b3a.56.1783945118414;
        Mon, 13 Jul 2026 05:18:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:c82:b0:848:57f3:8f99 with SMTP id d2e1a72fcca58-848897a0bbemr7774751b3a.56.1783945117719;
        Mon, 13 Jul 2026 05:18:37 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84880a4abf1sm4375340b3a.16.2026.07.13.05.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:18:37 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 1/2] arm64: dts: qcom: eliza: Add LPASS macro and SoundWire support
Date: Mon, 13 Jul 2026 17:48:15 +0530
Message-Id: <20260713121816.2728888-2-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713121816.2728888-1-ravi.hothi@oss.qualcomm.com>
References: <20260713121816.2728888-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfXy7o5xHSydnLZ
 v0U3EzRtz8eEFUCSRjGNOYBpD6t0l/5Om8qsec15uAoMbRGsKuX3VvDQWbF2Fw3Og9q4JU+Rg4t
 6lL/7H+9IPi3V5DWiuYP6eawafc+rcUlWzsyM/ZUgDp5zbHR0Va5+tawAiHok+lJ62lbnx7eemT
 zad3dvrwQ4Ilrecpdkj5Ma/Nyo+NcY7+YAvL09MiIJHD7iDI2uB5ZsI2ulhHYOrAO90NDSO9deT
 bZjTWFE/yXpfBG9JrZugfiy/ehMTjBw0g5zg8D3nnDvd6mucCzPJYL5xQRIbSpcroNKqAXf18vh
 0kKUjvLx4JKQfv983rIbhYM2efQIVOXWEYVkelMsSLmG8rz+n0DaeP975y3kbIlHZNKY8DWehet
 kdyOutfe506yhoucTBiDkdwO7VL5eUdRIzR/LqSRH2Shwl72UjxdktFv3oGrk/l1Jo3P1ZVKwYY
 K/9gYBkR0OccSAIDhSA==
X-Proofpoint-ORIG-GUID: ua2XOOKWU1qn9ZsQuiZM05CH3QSKaXre
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX0FMOXqS8WKbU
 toAsgP1SIc9lPu6X0sRRhGKp4pXRk5lpm3OWBNnWtWbim8FL/ZWEGee8iU5VDqFNLViVp5xb2z1
 iusvvcHQ3NOqZjCNQ1RAVAvKY/vB6IU=
X-Proofpoint-GUID: ua2XOOKWU1qn9ZsQuiZM05CH3QSKaXre
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54d79f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=PcHVJfkmTI8Dtvd-WTQA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130128
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
	TAGGED_FROM(0.00)[bounces-118765-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D792B74AEAD

Add SoC-level LPASS WSA macro, VA macro, SoundWire controller and LPASS
LPI pin controller nodes. DMIC and WSA SoundWire pinctrl states are
defined inside the LPASS LPI pin controller node. The hardware is similar
to the SM8750 platform.

The WSA macro, VA macro and SoundWire controller are kept disabled so
board DTS files can selectively enable and configure them.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 192 ++++++++++++++++++++++++++++
 1 file changed, 192 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index fa6a22f2da6a..d9f5ba6219f9 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2056,6 +2057,78 @@ q6prmcc: clock-controller {
 			};
 		};
 
+		lpass_wsamacro: codec@6b00000 {
+			compatible = "qcom,eliza-lpass-wsa-macro",
+				     "qcom,sm8550-lpass-wsa-macro";
+			reg = <0x0 0x06b00000 0x0 0x1000>;
+
+			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		swr0: soundwire@6b10000 {
+			compatible = "qcom,soundwire-v2.1.0",
+				     "qcom,soundwire-v2.0.0";
+			reg = <0x0 0x06b10000 0x0 0x10000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&lpass_wsamacro>;
+			clock-names = "iface";
+
+			label = "WSA";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <9>;
+
+			qcom,ports-sinterval =
+				/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f
+					   0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;
+			qcom,ports-offset1 =
+				/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15
+					  0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
+			qcom,ports-offset2 =
+				/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f
+					  0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =
+				/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+					  0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
+			qcom,ports-hstop =
+				/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+					  0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
+			qcom,ports-word-length =
+				/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+					  0x08 0x0f 0x0f 0x00 0xff 0xff 0x18>;
+			qcom,ports-block-pack-mode =
+				/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01
+					  0x00 0x01 0x01 0x01 0x01 0x00 0x00>;
+			qcom,ports-block-group-count =
+				/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+					  0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =
+				/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+					  0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
 		lpass_lpiaon_noc: interconnect@7400000 {
 			compatible = "qcom,eliza-lpass-lpiaon-noc";
 			reg = <0x0 0x07400000 0x0 0x19080>;
@@ -2070,6 +2143,125 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		lpass_vamacro: codec@7660000 {
+			compatible = "qcom,eliza-lpass-va-macro",
+				     "qcom,sm8550-lpass-va-macro";
+			reg = <0x0 0x07660000 0x0 0x2000>;
+
+			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec";
+
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		lpass_tlmm: pinctrl@7760000 {
+			compatible = "qcom,eliza-lpass-lpi-pinctrl";
+			reg = <0x0 0x07760000 0x0 0x20000>;
+
+			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core", "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 23>;
+
+			dmic01_default: dmic01-default-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "dmic1_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio7";
+					function = "dmic1_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			dmic23_default: dmic23-default-state {
+				clk-pins {
+					pins = "gpio8";
+					function = "dmic2_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio9";
+					function = "dmic2_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			dmic45_default: dmic45-default-state {
+				clk-pins {
+					pins = "gpio12";
+					function = "dmic3_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio13";
+					function = "dmic3_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			dmic67_default: dmic67-default-state {
+				clk-pins {
+					pins = "gpio21";
+					function = "dmic4_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio22";
+					function = "dmic4_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			wsa_swr_active: wsa-swr-active-state {
+				clk-pins {
+					pins = "gpio10";
+					function = "wsa_swr_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio11";
+					function = "wsa_swr_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+		};
+
 		sdhc_2: mmc@8804000 {
 			compatible = "qcom,eliza-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x0 0x08804000 0x0 0x1000>;
-- 
2.34.1


