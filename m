Return-Path: <linux-arm-msm+bounces-91431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI1LKPJTgGkd6gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:36:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA14C9348
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7507D301FA78
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 07:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F181339A4;
	Mon,  2 Feb 2026 07:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+Wd+vWJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eg2BYTF4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0648B288C2B
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 07:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770017617; cv=none; b=SwnyiOiPCd4+MY+ba0xxjbnkscU6JW9f4uAEG4Y56IzeHEfzUk/+aPtl0PI5jlcboosdumxy/0TK18PixTk2T4+I1SYOICWqvcgg9d+KRfrhxO2cOg6ybzTeZSmR2o+a6DZvni+M1AHGI9KD3Z06HkDkoHB1kYAEYuPmDE0Frls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770017617; c=relaxed/simple;
	bh=R1+9DqOLrdIccNKLonUBWlhCG72HQzlv0e6WIESPSBc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gi4rd5I+LIyD2j4sx+wj3UzdOglgWMXqHwIgNvEsUdiTT5d5UGvhXNltiDOa5F9+KOw1b1xcOVpe0oi4MK8nWwySmI0wwCF68y/9iDSUWKK/82M22Ik2SgdX/WuzUbpsLWWkL5fprE02zjZg+kDdol+n9tq4/FHrSntz+nEFiY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+Wd+vWJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eg2BYTF4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611MkwjN1126412
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 07:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xrKNFSOXyBq
	MJa3MBEKaaABiQhIrFJzIMzf+AyumQrE=; b=C+Wd+vWJNfvOug4w0HnXNXd1/vH
	lFI7Ot5JVivcNel6/F5I+gV/VEZs7eGDZY3cYwtzh5rB9Ygkmc6lvdbDPwOD/snT
	nKhOPro3Wf2zjQtLl9TVZ9sF3KW384Dr7VELPg4udXFETdadbfIewS/J/xaoOoFt
	KlzxxZ0ITAgoNMpWvZQSiuf+OKJvBIVYa7Wvd1EMnwk548fbQKo7vnUmfArVsgbW
	uVq0pWAJScWedt+BgFZetHdtBjuFkgLk4wskFy9SUWamvjV/mgkY/ZFbr6gNwr15
	EvTYR0pvy2rUyUgaOZ8qfqH7LUbZTX2nC3My10TBean/p2l1sjlZxGR6tRA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as4vexp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:33:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-352c7f19acaso3339304a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 23:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770017614; x=1770622414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrKNFSOXyBqMJa3MBEKaaABiQhIrFJzIMzf+AyumQrE=;
        b=eg2BYTF4uvGpZmUmu84WPDJgzjoKexV2I/xC4HoiZauZPw2s7h7nlgn/wZadCboK3D
         MMY8zJlArya7CCxCeJ3xS8B0AY0JEpaR46PSjNU6EAM7y3bBkslsoQOMWq24GKnSrgBE
         p+2TNUGDnJ7CHfwhC+c2k+m2RarCrGqvHwq3oH4SfVHAMqrSF+88+88s5jqMl70MDFEF
         4SqE3FKGGeqS8nJNxnzOfg3S7ut6RJZxGylaiIcl51yAka8SDextwlaTPwSkOGtQB8ry
         oQzhFotr8OlwIIqupOlPnuJoZKQNeKmuIa5a6Lg9ig5RvfZkSa6OOd7y1HbYQ8Wg39ZB
         34Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770017614; x=1770622414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xrKNFSOXyBqMJa3MBEKaaABiQhIrFJzIMzf+AyumQrE=;
        b=ov+iGUNnJ5OFnHiFI79pvYgQAzLbiARn58cLLHs/64UgPYY9FOnM14w6iGKZ+jngWi
         OANyhTiIKJrJdOX4jZYd8ez4EYucseldQCxVj7oT42N/v8rykByixQFkPUaNw0jhYQp0
         IBueMJYf9ChHiGsYdVgbNcv6fFFBMRHQaz5pXDWn5XwivpL/7Eu1ewZ85aOeHY4Vchai
         N/sGOjkeMo9gu+hRt7DpidBHDrc7gzqKWFfQWydLvlJeqV2lrCNmVGmDEdNjypCvuQ53
         0MOJd1RCYoQ6HEjSw3S4DVfJPLL62ucZcPAjY7mOVBSMeSll8XXJw0ymO/HW6scvM3Ab
         2rSg==
X-Forwarded-Encrypted: i=1; AJvYcCU4TJ0pccoM+grnVvoMfFhVs0vmsYZ7fCFMoRYuwGP4Vv6MUyWTW7IZCIaDt/rGErOYNc0RyEqGD3xS1r37@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx3EcuHzDXJ3Laqo8Je94jGVrOS71wzc6PO5D0VVukFm83Q9aa
	labSuv7mOQzNs2DYRpbft8xLQ4DLXy0iBMFLZ78jnXrjJaatnsjukTAIlC19cGzLKY8yhK5vpbD
	NkKqVbAKYL421khK97TNcMwVFhnfC7U6eP2gneWTTeK5tGtVQH9f7A84NCi2tzdeK/gye
X-Gm-Gg: AZuq6aI2Pni0ajpb4EL7Z22K0PJDq4Tsn0EA7YoW9MSTEmYCe7lBPojCl+8QbR/RWGw
	qnv1krWnUkbGBx+EH+rT9rnMDdrHE3smtOO3l54ZZTOObEcvCPs3wbiXHjTo/wGGA9Rq5DLkk/d
	ivsxnQHVAII0tk+d9Vc0mo4P0F2mkbeqJYuO3IfP85B2OzwRZt10kDyqcvQG4emNZTzVACAfN1Z
	8uxpbtWbK5zKoClKvZSQLnSikVwL44BJ+1SrXuqWDDKIXQPp4buoGHZ5pN2JyHIjtpkABGbRJNg
	RGYpTiZ0dFuhUslnCvlBU6PjqM5Ck+GoRI0BYBzq1wD4/4Ivfz62f+oaNo+h6OLW7CF0MZQ1PpQ
	hX8ZfkM7NMY8151Sa5zukuAI4puWRaWjjiKeCtrsUaFtc0pkhlPVD1zL3ZVz9RGvMhXI3eVciNS
	EkUycwj56Qe0DXCFE9O/U12Icp5peyv5MMsRja9Yc=
X-Received: by 2002:a17:90b:2711:b0:341:88c9:aefb with SMTP id 98e67ed59e1d1-3543b31337fmr9022449a91.5.1770017614345;
        Sun, 01 Feb 2026 23:33:34 -0800 (PST)
X-Received: by 2002:a17:90b:2711:b0:341:88c9:aefb with SMTP id 98e67ed59e1d1-3543b31337fmr9022429a91.5.1770017613851;
        Sun, 01 Feb 2026 23:33:33 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6103e25sm20758332a91.1.2026.02.01.23.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 23:33:33 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sumit.garg@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 1/4] arm64: dts: qcom: ipq9574: Add gpio details for eMMC
Date: Mon,  2 Feb 2026 13:03:19 +0530
Message-Id: <20260202073322.259534-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202073322.259534-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260202073322.259534-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OlxbO2TBFscgFSbmJdEDQltGqgkT6j1f
X-Proofpoint-GUID: OlxbO2TBFscgFSbmJdEDQltGqgkT6j1f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA2MyBTYWx0ZWRfX7+5PX0auArNS
 8uVYWmmhZgWHnlx0ePkQMBnHDGlAMB4UxBebaSQQAB2wTaFJQvmFJoKSFY/DDNaNHTHS8/NtJmc
 tDGe/DPpy/REhnfuUtoMgyrfvUxL4jo8NEB/XXUcCXNs05uodjvdtLZccWd/KariaZAi1aCl+Pd
 NCdiZQmAMJ9CA3QRoTaSp6kCQZvFU9Pc2SJU3Q2e8TNpMPEwiNXeR9EjTCH68QkRYGXwDLhj0yZ
 6oIvxxfA8ikN2sqHNlRg/nd5+rurbA5NFjtkqqRCfHSyolQnVxbb4egt7ohsvS8v5z2l1BlRSJW
 hBrg6mrPvQKUN5LyV2n4iNwxAuYpMUIjSryUU9xx6JF4XQ9ukuQ3mvrurfjOGt3ey759CptXGT0
 o4Nmk0pOCa/ns24SZjlGsHlbBxL2UuzKpc04DVqgPNL4ZkpANpRUR2AsGI1ehLP5dDknEqTmcTl
 4mykuJBAgjjUjDFul8w==
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=6980534f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=S5cnrtFl_diNh4JyZzAA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020063
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91431-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.119.20.96:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4BA14C9348
X-Rspamd-Action: no action

The RDP433 has NAND and eMMC variants. Presently, only NAND variant is
supported. To enable support for eMMC variant, add the relevant GPIO
related information.

Do not enable NAND by default here. Enable it in board specific DTS.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v4: Move sdhc properties from emmc dts to SoC dtsi

v3: Disable nand in ipq9574-rdp-common.dtsi and enable it where required.
    Add 'Reviewed-by: Konrad Dybcio'
---
 .../boot/dts/qcom/ipq9574-rdp-common.dtsi     | 32 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  9 ++++++
 2 files changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index bdb396afb992..e4ae79b2fcd9 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -169,6 +169,38 @@ data-pins {
 			bias-disable;
 		};
 	};
+
+	sdc_default_state: sdc-default-state {
+		clk-pins {
+			pins = "gpio5";
+			function = "sdc_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "gpio4";
+			function = "sdc_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2",
+			       "gpio3", "gpio6", "gpio7",
+			       "gpio8", "gpio9";
+			function = "sdc_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		rclk-pins {
+			pins = "gpio10";
+			function = "sdc_rclk";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+	};
 };
 
 &qpic_bam {
diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 86c9cb9fffc9..4b8c58982869 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -467,6 +467,15 @@ sdhc_1: mmc@7804000 {
 			clock-names = "iface", "core", "xo", "ice";
 			non-removable;
 			supports-cqe;
+			pinctrl-0 = <&sdc_default_state>;
+			pinctrl-names = "default";
+			mmc-ddr-1_8v;
+			mmc-hs200-1_8v;
+			mmc-hs400-1_8v;
+			mmc-hs400-enhanced-strobe;
+			max-frequency = <384000000>;
+			bus-width = <8>;
+
 			status = "disabled";
 		};
 
-- 
2.34.1


