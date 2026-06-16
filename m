Return-Path: <linux-arm-msm+bounces-113470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +DhgOLOvMWqYpAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:18:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F4A69526F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:18:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Fl4k7ihv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="eIbZIt/k";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113470-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113470-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7121432733F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 20:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7C1388E6E;
	Tue, 16 Jun 2026 20:15:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7493303A0D
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:15:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640916; cv=none; b=NI9z/wxT3cF5PvGDgTpoEbOuOhuD+8eCKtOd45/sd7/onTPXGlKfv5O5zUxRYEq/zDp0Umd0OwiCmknkkQuKgD1jrLY+M54J32Uv6E061S9NUWHcIwTjth1Rrw9xy1uV81FFFNw9AJnke3do/4XeCwgVYGYdQp4hbPhLSGyBuhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640916; c=relaxed/simple;
	bh=JA7uPPlYbJfTqpdl3Px/nhirdDcaXuFxNnQSxNYA86k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bwSjwvs7d8dngbtVe1ogYnMErpeRx+vrmI+qKd4tMNx59dMRvOrt3hIefLS778Cl0IwvgRRVK71dp0cUF0HWq7XwckwNz0XylERwXUe6RCNYdycFDDP+qEEpSwlvNtO4kp/8eb4W4JQ5YdXqqSbqu6/1k10c0qdSRYOTsc3R1LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fl4k7ihv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eIbZIt/k; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOW3p3913710
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Lv3A9bJdf50
	Y8H7AH2wGw94DGe9qT+CHsEtGHaTuWDA=; b=Fl4k7ihvZv937yrS6a70wHK2M6f
	3NYmJa8bjlPByO9V5DkI8g04oB5wofs5A8mk32BrgJUciCYjriCGp9pKWAfQfCw9
	TWXovQTndraQhY2V+vyEBLwdtYeN84bYFk1qz46G7NfN0ellMlJzgDqG7JcLCsLv
	zhd+syXOfCDVbz6owfSPDb7jHse2kMhs7VXABcBnO1Ln1hSqP9f061tRjm2Oxj+c
	VQSQerNCouLxPuezZpl6phVknBp1wjlJEP8YNdQXNHx1YSY/2CSA6uGq827jISv3
	HmiIrM1JB/07rHFMagA7rdlOAcH9k+s/Rs7nrE7Z5BCmkCx2QNltQL4mNMA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7v0n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:15:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6a20348ceso7930405ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640913; x=1782245713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lv3A9bJdf50Y8H7AH2wGw94DGe9qT+CHsEtGHaTuWDA=;
        b=eIbZIt/kIb9+rQCAhqoWLR+bwQy3/zSQawl5/5CBdT4KcF00l4c7Fa92hoycNr7caz
         90zb6oDqRkhdzzf2RvZmVfriw/t4bNjBxqukfFS9zNMcbq2yLKjMafJ0IJXo2EpNBpj2
         d3NjSSLUiuaac/Qz+bgyp0med9mum7zGhJCpzmBwxOp8eDV9g+QXsZERboNZZUze+68+
         zftPfHClkHm9i+hwt1Dh9SpGAWcJV9jYE11/5+Mw3SB1a54Opd2dN14ge11OjJsDMTNU
         EdLzK9t6ftCpEqxutAEYQx7AARR4dkaJxF8prfAow/e4SVHwyGvD0k33VVdciuOzzGTj
         p/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640913; x=1782245713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lv3A9bJdf50Y8H7AH2wGw94DGe9qT+CHsEtGHaTuWDA=;
        b=TWX6GJcjdU8hgQZUwULt5BHyjqgF5fZd+9cFPRcf32VKs2iX8G1E3olU1+lzgJ/DSX
         ohZiYhc8aH35WaHYnIVU0dAjzvKcklw33aOtbOgjONNRAe8734IgGLeSMqRg6+7mL46K
         X96mrt2fUp+BtOIiVI/TzMWb3+qHTUrAsbq/2icb9w+oJNzWvbjqZdf/IzukbBjME2No
         t7sBph1OuCmjJWCRUShftkSdISJKyLgzQSAIHEAvNSyA7G68KF5VYTiNymAzdzamDU6P
         DljyFDNjUNhoSYfQGs1kGMESx7GRKc8LSPXhv29xlACVGafsD5prUzDciWBRYialBpZG
         RXQA==
X-Forwarded-Encrypted: i=1; AFNElJ+K0Vm1c0jJozFJZH5fubYIomKSdyMLQYhKynqTrhnKPwAxBbgmZzmLTEEqJV2D6GhsROsDt+yLXj6YHXDw@vger.kernel.org
X-Gm-Message-State: AOJu0YzzKcXA6A6XgyMBIU5f2nFaSeSxyZhd6alo9Tf9OgkXCSswyf6r
	w0k612qTlYDrNjoqC3vke/EHyUsig9rcuWesSG2Pum7YEoTqNcLOqXeWbWiBAbe6trqeCsTeE3d
	FfHKBosDqIvEY6NwodcWLwg/AJb6uvJ+evaIYnC2rkyvnv43q76NEtrD9C1tvcWKCH5oy
X-Gm-Gg: Acq92OFdm8ymkz+lc7nJDr1Y6ysMQERs9q+qRAuA/O5LrLjevSJmOWHDUMQdaF1Et2S
	y++p6Qh0yoG+FWA6CEYKou6DAHSHz2pBrZ3xfvgDkWGtSJ2DlDcEbTORlLvTaeD0w04x3dzjKwO
	SMqQDKfHrwMADwI7XsSKnZO4a2JU0kZqBMIt3ehwWp4LHR6kNvL1mw++a8IegHaYPCjWdluldyI
	ElIJ3GzlAWTycqSPXaFoShGTgdUheSlnTTF6FXsY/KwIMaqqYCxBkZ12Slrd5ErU7zePpt4Ln7Y
	2hvr+s5b7AgmepFoQrNr2AHVGj+t28zxOH7KfQ9J3Dez3e44+eQBK39+YHGDP1d+DpGNTe69+h4
	cJNOxU/S4J8wpHbZohBMcsBw4xfdFD9kGvAl0gaNKxfkyKvLKdZTnKwzPhA==
X-Received: by 2002:a17:902:cecd:b0:2bf:2369:a131 with SMTP id d9443c01a7336-2c6bc270027mr4609195ad.34.1781640913163;
        Tue, 16 Jun 2026 13:15:13 -0700 (PDT)
X-Received: by 2002:a17:902:cecd:b0:2bf:2369:a131 with SMTP id d9443c01a7336-2c6bc270027mr4608915ad.34.1781640912673;
        Tue, 16 Jun 2026 13:15:12 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:15:12 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratyush Meduri <mpratyus@qti.qualcomm.com>
Subject: [PATCH v1 6/8] arm64: dts: qcom: shikra-cqs-evk: Enable sound card support
Date: Wed, 17 Jun 2026 01:43:13 +0530
Message-Id: <20260616201315.2565115-7-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX0LjUNTwo7DRx
 JWZi3ZNGgueOdZUBVHntk42/SjRtMN45ZbHjaikkJSTbeW28AdR39BZ77GHy4i3SjdEDtPbHivV
 JzwROZRxMf76AfCTIn7BUKsXZQGpgBJxg3MBRc9nR25gjzT5S5pOWAPvDp/sHOU1J8xpBWXDq4U
 dEZByyfaVrFXsAEGnZNMt/9WC6BcA3USreB5xHdNZxO/QU9a4KDtB0PI9VmEQhq2AyCRYRLRM4b
 RweFY8TvXrPDC7+hkxJGxtvwut5I812pHP6hqsuJCvq2Q2TcZvyXJGJEDwyv027lGY5Bw52iNoQ
 WD1nauFoLXTXLvAA2iygrfEmrnPuG6i1YnNWXVdmk3G/XbFv3trFphd2DrGfK9H9I3EOtzhu3CD
 IIMohARTCrUZ5aJdHdfTXXWtylRELiM+ZB/tL0CAMWIRNZUrukjSa9oyT73xNOeNw2RqyYB2+sP
 F8a7pM6izbh4ra9HTNQ==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a31aed1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Adi4cCxjrerPaKIhsp4A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: kFW7V0QfGTyXa7IP8ZT21nd7_75vlfpZ
X-Proofpoint-GUID: kFW7V0QfGTyXa7IP8ZT21nd7_75vlfpZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX3E8Un07rJHy+
 hbODuVfTDDLvIce9GAqsBxkGtSU+xt+iB9ghnq6fzw46i9qa5pIQKmqVdJtaGsvLcW7RNpAACda
 L+/y43Z7vbSIlva90+gKDVYKtR/DEss=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160205
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
	TAGGED_FROM(0.00)[bounces-113470-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mpratyus@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 63F4A69526F

Enable the sound card on the shikra-cqs-evk platform, including
WSA885x external speaker path and DMIC via VA macro

Also enable the required LPASS macro along with the necessary
pinctrl configurations for DMIC and I2S interfaces.

Co-developed-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
Signed-off-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 149 ++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 6498ef47bf3a..76d41b645741 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,57 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	sound {
+		compatible = "qcom,shikra-cqs-sndcard";
+		model = "shikra-cqs-evk";
+
+		pinctrl-0 = <&i2s2_default>, <&dmic_eldo_en_default>;
+		pinctrl-names = "default";
+
+		audio-routing = "VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		va-dmic-dai-link {
+			link-name = "VA DMIC Capture";
+
+			codec {
+				sound-dai = <&vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-playback-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&wsa885x_i2c>;
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai SECONDARY_TDM_RX_0>;
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	wcn3988-pmu {
 		compatible = "qcom,wcn3988-pmu";
 
@@ -60,6 +111,66 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	wsa885x_i2c: speaker@c {
+		compatible = "qcom,wsa885x-i2c";
+		reg = <0x0c>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wsa885x_i2c_spkr_sd_n>;
+
+		interrupt-gpios = <&tlmm 77 GPIO_ACTIVE_HIGH>;
+		powerdown-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+		vdd-1p8-supply = <&pm4125_l15>;
+		vdd-io-supply = <&pm4125_l15>;
+		qcom,battery-config = <2>;
+
+		qcom,wsa885x-init-table =
+			<0x8470 0x2
+			0x8470 0x0
+			0x8470 0x1
+			0x0004 0x1
+			0x8602 0x60
+			0x8622 0x60
+			0x8458 0x79
+			0x810B 0xD9
+			0x8111 0xD9
+			0x813C 0x08
+			0x8102 0x04
+			0x811C 0x29
+			0x811D 0x40
+			0x8129 0x40
+			0x811A 0x80
+			0x8126 0x80
+			0x8103 0x6
+			0x80CA 0x85
+			0x80CB 0xE
+			0x80CC 0xC
+			0x80D0 0x80
+			0x80BA 0xC0
+			0x841C 0x4E
+			0x8435 0x47
+			0x86CE 0x09
+			0x8667 0x34
+			0x800D 0x08>;
+
+		#sound-dai-cells = <0>;
+	};
+};
+
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	dai@40 {
+		reg = <SECONDARY_TDM_RX_0>;
+		clocks = <&q6prmcc LPASS_CLK_ID_AUD_INTF2_IBIT
+				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -100,6 +211,31 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	dmic_eldo_en_default: dmic-eldo-default-active-state {
+		pins = "gpio71";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	i2s2_default: i2s2-default-active-state {
+		pins = "gpio100", "gpio101", "gpio102", "gpio103";
+		function = "i2s2";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	wsa885x_i2c_spkr_sd_n: wsa885x-i2c-spkr-sd-n-active-state {
+		pins = "gpio2";
+		function = "gpio";
+		drive-strength = <8>;
+		input-disable;
+		output-enable;
+	};
+};
+
 &uart8 {
 	status = "okay";
 
@@ -111,6 +247,19 @@ bluetooth {
 	};
 };
 
+&vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&tx_swr_active>;
+	pinctrl-names = "default";
+
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "mclk",
+		      "npl";
+
+	qcom,dmic-sample-rate = <4800000>;
+	status = "okay";
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
 	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
-- 
2.34.1


