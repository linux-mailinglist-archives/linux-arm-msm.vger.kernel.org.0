Return-Path: <linux-arm-msm+bounces-113469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2G5KCI+vMWqSpAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:18:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71315695258
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:18:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dqVeJusj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KyF4NyBI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113469-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113469-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0244931D089C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 20:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C185A35DA78;
	Tue, 16 Jun 2026 20:15:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60A537FF54
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:15:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640912; cv=none; b=DisfKRLECjNtlycEPrqulLsbcXIEESU1c1WWamZ5mB5WK4JHFv1Y0uUHMHUCektLIiMyhfNPCzxfEsXV8kqTmz/u5/T3NZHuYn5VA3t6zb2LdXtEjtkLwPVPRJObFGoa8TUnRDc2GBdtl+isVERHKHOGOCGxYmPGLXNSu1txJ4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640912; c=relaxed/simple;
	bh=atcpUkOzL3pSuivAPauqVR6oLoGe1mGTq4G0WtyAKLA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iac4/Q8CkDn8LICP3LkGK7W37KbzI8PfQpVPBVGk97fYLAtTKAltzq+PUOGL3Syg1EQL9EPlZ8ePloBnouRTWdnsl08aov8b6J5mSd4u4v4JcbEPPxFKFmJLNLn4wX5qlR9OrYdqZqG+a75rWf72LA+/BAw8IWLbN4ZfUrF0y2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqVeJusj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KyF4NyBI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOMwX3965396
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OQf8N/KrF/J
	eQXzI22hbkztmwDxMXYHbsouRLwV8Hfg=; b=dqVeJusjK6i+Of17b9ZsGDAB9S/
	r2sC+vm+u1GPz2T/nMKf7yUka0SfuhiIwPbvV5DS3XBIwWF5XIl0UOoKIV39FJSR
	He3xZ6HEjhOl/tYh5wyUdZb5OOZ7MyXiSpe0kSJVCMJswZzdQl5DIOs/sTL4A0sj
	Gx2DE+8PNAjH51BX6D12TjABI70fwYCw8lgm4ERUhcxbiEkOBybbmMRZq0hGF7+/
	kOAa/iYTb2qIz2lAlEhiTOJsKvZOckS8/yCkb5tlm4CMd9lPqyf+f3auYljhxpb9
	BF0m9pPeZGj/YyK3pCNqievcwuawIlGq6MSoStQu0zDQVHR++w15J7hAsRQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etx8kcmk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:15:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c888636deaeso138069a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640909; x=1782245709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQf8N/KrF/JeQXzI22hbkztmwDxMXYHbsouRLwV8Hfg=;
        b=KyF4NyBI03U1Ehz+xKOFL0v/nVrAl4fcDf8kJfH88ntHre2iXdVS2aqKtYlnHOo+K6
         GcEJxgEnAzl/m9ZDeok8peXcPVkvQTn2UML31VVy3eMKYxJrsjDp9qZokbteXoP8P/KW
         TO4ASPGL4smXqTMgsbchpwMjQcL14uv6cYHnyzLlBA6jRETEw0+cLqC+zYWBpSeiUL0p
         SKavW9Lh1Rtkp2Ki0jJY0E6gCP3CdGFr3+eZCKKiGawZ1nSkXIRWYq0H6cjXAXJEdNWI
         MVwM4gUi5j76v0HxfEnQdvkTNAWrgAk/JnuWCK21Kh9AlC0FrAulfGDfoK7Ycv6unCv2
         7z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640909; x=1782245709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OQf8N/KrF/JeQXzI22hbkztmwDxMXYHbsouRLwV8Hfg=;
        b=pjKHUd0VGHyTEn30zDSqAvZ3ujeG50/vHZvye4LihvnN5VRzM0P/O4rhcO6uDbyD0T
         4yUZMn1VzJkkX5GBgd+nLgoH6qQDmvL641OkODK+J1I0BwD4U9g6zJuiakfmW4JwVZPm
         ioCYuxC6X5VR9gD6SoPhfVAAzfqIfWlhUqOO6pZXNWNM7mvXetQ78Ga0Hie0dW8PyDDB
         Bnc/A9X8nAqeJe1s1KSiUYNybyA6Xg/wwr2DZtTjY8B2aLoU6W/8XLXtHpgla39M8Qsx
         F8A5qabd5S8s3wIMG7dmDKqq5jJOd6cIKcWj+pYtFj/iy/Cu5d87QrEfo8+5+1PSHEHX
         UpMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ViD0Zv3tFVlbH8RGBdFQ2MCyVHNkMK9YVKkDun8xeuqW6/tHI9mJHUP1pUctF6qfq79tKLjNqZUdZ/2rd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/y5i42pIYZySh/smwc1UqRRnHw6zO4CaKlefNPbJUWa8rPUwf
	HsUzcF7/LHbiRqAHXB/EMZJO37pqASfMI1H5LEzgJqNcCdigKJiYYQdVx3hJETeHMA+elwuQfBi
	L4RuOOGJL5pAquSPc+fww+mfATvwNH8XSHcOqOENgmf41Vn+jVeBA/QhFcQJ+MOYphY0B
X-Gm-Gg: AfdE7cn3QCOBM71S5hnFTExWfdXprw4I1F2MljkkwrZfd73lLLwSS3QcFP9dihlAeZg
	hqDkBlPTfs8WZ8gtF0XA4YbrViSHD59hHxNLaJzrU8JoSNzbxULm4KyA7LGGdKAYQMb6eVj0hSl
	NhrjtwyPf2v7ICUh3nw6kzQ0unaIrQwRWa1yyZKvW0KTbosXiyFFiW3uuCAP4ExxCCWDN2T7UoS
	sQbPnJ9PQwaLib1YUjQht5iseARFGS3eFsWwLWTpO4UIaTus5D6c0fI4pU/Ufv3PNSAs/nl2iPf
	nPNpInsJUvOINHlIMS9K/6KdewwUnhvX3s8T5g1oIh0nS1KXpahmfPb0uodyanDP5HtBO5+My9q
	utR0JVlkseGqgCRpOpMxes8IUeapdB+PgsWB1BWFS6Hxt9mwoP8zLLkXZ+A==
X-Received: by 2002:a17:903:19f0:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2c6bcfbb7a1mr1395755ad.7.1781640909097;
        Tue, 16 Jun 2026 13:15:09 -0700 (PDT)
X-Received: by 2002:a17:903:19f0:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2c6bcfbb7a1mr1395345ad.7.1781640908590;
        Tue, 16 Jun 2026 13:15:08 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:15:08 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/8] arm64: dts: qcom: shikra-cqm-evk: Enable sound card support
Date: Wed, 17 Jun 2026 01:43:12 +0530
Message-Id: <20260616201315.2565115-6-mohammad.rafi.shaik@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX5AS5ODARStQ2
 3ioT6P2BILGk5WIV54IZvS4590zOTH9OnPfh08bm3iurgJjp+6Fapnhu9krWE705FvM2he0xM40
 RKNkw6RbxHuEZOAGtxR6t1rNn/JxaE/FIKwGydIJU8p4O8O3ATQSxY8E19q9voBLdBvWDgs22sE
 BGUMXIKSutoSBqIaIB8GBh5KG6rAOXxV8UFN3aaz93+DYpThDm5q2xChzzawnDk9Dkv66o9KFs+
 JxQJPZaA0ryYzoT5Bm1RHDl8H9NVC0j2GyyvCcjIv+qChQNJA6Y4/ma6T3onUC1G0rQbQIyNOHP
 ws9ZpDdRXNftN73WOllDkygi2Zyndt9COMz7aR1Qdtu/tE+As5FPmJQaqIZ63xsjk1oHaR+2jFT
 45MFHAh4y41LEmI/ewyrmzTMf/JHbDjxkbFDwb75Aq/UzJ0zv8qRGxrYeTr8bgWvfaMJWPiIzRP
 QXb9zQLT981R0PGm0Qw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX7M+R3EYgr64j
 4w6UBncNd7khCuSwD3tI1L/BN2A8ZUlonOGcLEaIiqRPoaZAsb4FOn7sWzodwq9ysY1TwwPyygu
 +gc5oSHq0KTfXxcdqURnpTvwIz3z+Aw=
X-Proofpoint-ORIG-GUID: vhss9M086cCyZhra8xBB39nN9f4nzhrj
X-Authority-Analysis: v=2.4 cv=dZawG3Xe c=1 sm=1 tr=0 ts=6a31aece cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=sP5GYvF3oMY1wlZ0skYA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: vhss9M086cCyZhra8xBB39nN9f4nzhrj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160205
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113469-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71315695258

Enable the sound card on the shikra-cqm-evk platform, including
the PM4125 (Rouleur) headset codec, WSA885x external speaker path,
and QAIF backend links.

Also enable the required LPASS macro and SoundWire nodes, along with
the necessary pinctrl configurations for DMIC and I2S interfaces.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  | 222 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |   5 +
 2 files changed, 227 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index b88652703fb8..b68d196b9d04 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/sound/qcom,qaif.h>
 #include "shikra-cqm-som.dtsi"
 #include "shikra-evk.dtsi"
 
@@ -23,6 +24,74 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	sound: sound {
+		compatible = "qcom,shikra-cqm-sndcard";
+		model = "shikra-cqm-evk";
+
+		audio-routing = "IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		pinctrl-0 = <&i2s2_default>, <&dmic_eldo_en_default>;
+		pinctrl-names = "default";
+
+		headset-capture-dai-link {
+			link-name = "Headphones Capture";
+
+			codec {
+				sound-dai = <&pmic4125_codec 1>,
+					    <&swr1 0>,
+					    <&vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu QAIF_CDC_DMA_VA_TX0>;
+			};
+		};
+
+		headset-playback-dai-link {
+			link-name = "Headphones Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>,
+					    <&swr0 0>,
+					    <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu QAIF_CDC_DMA_RX0>;
+			};
+		};
+
+		wsa-speaker-dai-link {
+			link-name = "WSA Speaker Playback";
+
+			codec {
+				sound-dai = <&wsa885x_i2c>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu QAIF_MI2S_TDM_AIF2>;
+			};
+		};
+
+		va-dmic-dai-link {
+			link-name = "VA DMIC Capture";
+
+			codec {
+				sound-dai = <&vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu QAIF_CDC_DMA_VA_TX0>;
+			};
+		};
+	};
+
 	wcn3988-pmu {
 		compatible = "qcom,wcn3988-pmu";
 
@@ -60,6 +129,79 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&gpr {
+	status = "disabled";
+};
+
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
+		#sound-dai-cells = <0>;
+	};
+};
+
+&qaif_cpu {
+	status = "okay";
+	qaif_aif_if2: aif-interface@2 {
+		compatible = "qcom,qaif-tdm-dai";
+		reg = <QAIF_MI2S_TDM_AIF2>;
+		qcom,qaif-aif-sync-mode = <QAIF_AIF_SYNC_MODE_LONG>;
+		qcom,qaif-aif-sync-src = <QAIF_AIF_SYNC_SRC_MASTER>;
+		qcom,qaif-aif-sync-delay = <1>;
+		qcom,qaif-aif-slot-width-rx = <32>;
+		qcom,qaif-aif-slot-width-tx = <32>;
+		qcom,qaif-aif-slot-en-rx-mask = <0x3>;
+		qcom,qaif-aif-slot-en-tx-mask = <0x3>;
+		qcom,qaif-aif-ctrl-data-oe;
+		/* Lane 0: RX (mic); Lane 1: TX (speaker) */
+		qcom,qaif-aif-lane-config = <QAIF_AIF_LANE_ENABLE QAIF_AIF_LANE_DIR_RX>,
+					<QAIF_AIF_LANE_ENABLE QAIF_AIF_LANE_DIR_TX>;
+		/* frame length = slot-width (32) * bits-per-lane (2) = 64 bits */
+		qcom,qaif-aif-bits-per-lane = <2>;
+	};
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -79,6 +221,10 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&rxmacro {
+	status = "okay";
+};
+
 &audiocorecc {
 	status = "okay";
 };
@@ -99,6 +245,74 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&spmi_bus {
+	pmic@0 {
+		pmic4125_codec: audio-codec@f000 {
+			compatible = "qcom,pm4125-codec";
+			reg = <0xf000>;
+			vdd-io-supply = <&pm4125_l15>;
+			vdd-cp-supply = <&pm4125_s1>;
+			vdd-pa-vpos-supply = <&pm4125_s1>;
+
+			vdd-mic-bias-supply = <&pm4125_l22>;
+			qcom,micbias1-microvolt = <1800000>;
+			qcom,micbias2-microvolt = <1800000>;
+			qcom,micbias3-microvolt = <1800000>;
+
+			qcom,rx-device = <&pm4125_rx>;
+			qcom,tx-device = <&pm4125_tx>;
+			#sound-dai-cells = <1>;
+
+			status = "okay";
+		};
+	};
+};
+
+&swr0 {
+	status = "okay";
+
+	pm4125_rx: codec@0,4 {
+		compatible = "sdw20217010c00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	pm4125_tx: codec@0,3 {
+		compatible = "sdw20217010c00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <2 2 3 4>;
+	};
+};
+
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
+		output-high;
+		bias-disable;
+	};
+
+	wsa885x_i2c_spkr_sd_n: wsa885x-i2c-spkr-sd-n-active-state {
+		pins = "gpio2";
+		function = "gpio";
+		input-disable;
+		output-enable;
+	};
+};
+
 &uart8 {
 	status = "okay";
 
@@ -110,6 +324,14 @@ bluetooth {
 	};
 };
 
+&vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&tx_swr_active>;
+	pinctrl-names = "default";
+
+	qcom,dmic-sample-rate = <4800000>;
+	status = "okay";
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
 	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index dc3861489f64..86b323f2fa58 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -53,6 +53,11 @@ &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm2250-regulators";
 
+		pm4125_s1: s1 {
+			regulator-min-microvolt = <1396000>;
+			regulator-max-microvolt = <1396000>;
+		};
+
 		pm4125_s2: s2 {
 			regulator-min-microvolt = <1000000>;
 			regulator-max-microvolt = <1200000>;
-- 
2.34.1


