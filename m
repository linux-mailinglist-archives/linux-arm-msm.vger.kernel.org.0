Return-Path: <linux-arm-msm+bounces-111194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HcAmIJdvIWqCGQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:29:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C0463FDB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:29:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Lbh1XYPw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XFcgi+18;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111194-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111194-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60788300F7A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 12:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9DD644B681;
	Thu,  4 Jun 2026 12:21:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C2A43CEFB
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 12:21:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780575674; cv=none; b=BUoQSv85JL/flAoySFXwHRKyr//htbsBrs+Sxdk0g9rwYMUk1QBYv/b8mkg+IKQhPRrwG9JMkQ8HzlSjHT5Ip4qldVTvCQQ8d8z1E3ks4lx39Eqf5rWKOrlgjKyvT2ke0jCBya8ccePoAa3YiIL6wcYLBIa0mo2zrR9Hm+Yg3Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780575674; c=relaxed/simple;
	bh=DRvh8QxawSDwpvKoFkz2PnI7K/Ntuiei1ZywQHsnXW4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K1sO83hXFcU4Aa30yt9vvTeKFPL8pHdSKtgEQXypRmalDoQ2T6sUCznAc3j9snXJ7ppfhZm+G4m0fdG8rRlnnBf817tq7/MBXK/zd6AePi1cCTqYT2vVXianAf1GKImkn29aU5xPR3uhvjxNMecBvtFX7A3VMIj0ihnaUnehxWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lbh1XYPw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XFcgi+18; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654BdgS6994526
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 12:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N1a0zVA1H38
	h2GIyEe6nGYiHzDUyiFxiJj0Sqb5Bfp0=; b=Lbh1XYPwVSYg75VxrUvuGfeqknq
	dMh5Y9CNj/bKSlu0fGl/B+jnyz4PjhG0PoU9nEvlXzmUzLWkSOZDUD6jmchfhVnO
	rPCA2TaLnUhuXHO19mraIIGSMDwF0T+dZp7QZa+lBTrjbsV7lr2G0r58Kfx3+uVo
	R8QrzsWMFrSBRMKQ+V7d5179gkD6KtzIBDDGAsopqeKSfsFpVNPoJueHtit3tDGN
	106PUWwPxg2C0RJM4pyShW3wAqtf61tvcGRZ1yUg3aMGl3Z3CEpD2Ey6pLXZsFq5
	IjY7j2R4QFs35SYtTi8bYzF3To6hDMsRAz3SkBMVt6p4tzf+6xsyDkaCTqw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek374sf32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 12:21:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d982d932aso903451a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780575672; x=1781180472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1a0zVA1H38h2GIyEe6nGYiHzDUyiFxiJj0Sqb5Bfp0=;
        b=XFcgi+18QGvQUlVSwGKYp4NQNyGstmDzUNwmfTQ+eX1+cOqgALIcHtPbTEb0uFDTX8
         PAPDrGyz0l9UGFF5dI1/wOWWmg2ZPKZMNArEMlCLooHJLg65bdWbhliuAdeYDYk/dAjp
         jZP5mZoRC8/JQtb47redcc4nPID0Uw+PBRCxQ1Nz0mwy0auDWKIMpktpb3SMGCJPNkK1
         1TYF3a3FnLjmmsjuwF4KClAd4h2dPxwQTrgDCyQ7HfI8wBtbeZwWNflx5IyjZ/Yz2FOk
         hb8upKSQy77sgl01iQlLOSmE+VX99eplmWSDtgYY41coDpJeQ7sXRGvchQsqvAcIRuS0
         Os3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780575672; x=1781180472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N1a0zVA1H38h2GIyEe6nGYiHzDUyiFxiJj0Sqb5Bfp0=;
        b=B3It9+q/IMuBQCn6XYF3Dh5iRbBoBwtZQ6c1OYJJWPUr0OXUVZDXRE5OzidKrG9zyy
         Lsq3E8mBMT7hAg6HyxA+QB/l4VgMOiGjSyt3dailhC6e2/6oFa1HxtbMJSZD52FNbMio
         sFFHZ0JPS3zisx9s5/QGkUjT3Q66V+sQcIYCC5qtr30g89lOC9YcKiNFSuNZipcAmxdG
         e8v/WVkDwGO62uOz68LwFXnX0ffuw+cvJV91VCU/X9TcqI7HOJ5s18RTPUSJ2gb9vv4j
         X5J9k6XFedmMOKgxV2Ucv7qYCcsmlG+rYylMx2mPbeQNW60CSDwxJ3JtVucnjlG4IKEl
         LO3w==
X-Gm-Message-State: AOJu0Yx8RE2cPHE1StebjE8a5sukADT11+xQUhkOR9gd+cbU3Yk5Gpfo
	ipAXEEPdgPujXxHw592W/Zref5bC2LKjwxKFLyczvwYU4c7nQ/RPqS3XTNTwdLySUcV0AEg07hT
	4LNDGr+hHfYV5z4xOVtnwRtQ2spPCl4ScxmqR6dE6LL/hrx6D8sD1gjp8Z/dQ28Xvfp/z
X-Gm-Gg: Acq92OHuX8GpUwSSE3M8zW2MHSBKjqBGbH3UkICAIfCSUucK7Nr7LTK2hsur0V1IJpe
	67SIkxTKJfZ8HZnv2IATHjwb95GN8EFqE8binI25QQOc/ZkQcQ/VU0BuxdJ/Xjya9l2ex92nET8
	NaIkoJYcucGF2qJmoIErO0k7DyWZ/DCC+4z/meEdnIHmy8UnvYc8RFsEwLtPn+RIaMCxoNDrQkp
	d/0E0eqNV/bQv3y+ZC82RpkcRYlDRrlFvQ4ZfDjlFJ0bDeZqYGpJ/wkz73T4MYcofDz1dmR6fy7
	yUb4e6dAYF5VNSps8C5ZcG9gyB8jA3V1uw6W1mmt+Xx7YB54GJQghmBaLJXcK40ztdG80EqDey/
	MYbiQnloS3Zzm8yrFeLkiWfYO3W1gd2UhY/XS3YfQPd30GAAeaY3sV4dKPWkYKTk8SY4=
X-Received: by 2002:a05:6a21:330e:b0:3b4:931c:3c7c with SMTP id adf61e73a8af0-3b4979857f8mr9268699637.44.1780575671982;
        Thu, 04 Jun 2026 05:21:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:330e:b0:3b4:931c:3c7c with SMTP id adf61e73a8af0-3b4979857f8mr9268652637.44.1780575671523;
        Thu, 04 Jun 2026 05:21:11 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df045c2csm4796903a12.12.2026.06.04.05.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:21:11 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V1 2/2] arm64: dts: qcom: Enable SD card for Shikra EVK
Date: Thu,  4 Jun 2026 17:50:45 +0530
Message-Id: <20260604122045.494712-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260604122045.494712-1-monish.chunara@oss.qualcomm.com>
References: <20260604122045.494712-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDExOSBTYWx0ZWRfX6A1dwX+nPLU3
 FTJnNCKbRHs+Uvu8zwydkOR8JrLnzJunfNhZGb0WxlImonsiU0E5d3rf3p7vdSNheULpHcxUxct
 Usd7dH4nLtIbjfI3FuXMN9Yi+yhzrnEkw2hzcClwvl+s6vkyPOmYkKetccOIRk8hLnTejd3+CIS
 opz+3vj7xH3k/mitbwGlO4aN5+qd2UYE+iG9ZA17DOH/8voXkeLyEvGKk3hBeOcCnRHsndCqRFx
 UPYGeT9J7bQmnbkGXWCmU/CqIPmorl6n7M24Xwk3jT2izXEhGwoa7pXoE91O40VVPdxprUizRfa
 hpgqNkSCSYMK1mMRrqk1gDNqEbJivc80cMgBghXdMfN75Q9SiR+EygPdIZX8yOmACC82uKQ4DJQ
 XhmG2MqM7kGi+/7Ehwl/4vNLK5zgbxf3pfZbMU4tQQsIsEJDNe4t8KjH9nYwGRxv2lFL32IKv4J
 M5I63BTIO1uVjRRYV3Q==
X-Proofpoint-GUID: BefZBmNbGWY7fIEI8sHjGWRVr1XJTL7U
X-Proofpoint-ORIG-GUID: BefZBmNbGWY7fIEI8sHjGWRVr1XJTL7U
X-Authority-Analysis: v=2.4 cv=eJsjSnp1 c=1 sm=1 tr=0 ts=6a216db8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=lMopsKi7mrnni1fC4lMA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-111194-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:kernel@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74C0463FDB1

Enable SD card for Shikra CQS, CQM and IQS EVK variants. Configure the
vmmc/vqmmc regulators and gpio-based card detection for each board
variant.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 18 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 18 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 18 ++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index c2ed0396533a..53d8569a7c65 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-cqm-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra CQM EVK";
@@ -15,6 +16,7 @@ / {
 
 	aliases {
 		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
 		serial1 = &uart8;
 	};
@@ -95,6 +97,22 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&pm4125_l21>;
+	vqmmc-supply = <&pm4125_l4>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
 &uart8 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 3bfd0050064f..a461c5a03d63 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-cqm-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
@@ -15,6 +16,7 @@ / {
 
 	aliases {
 		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
 		serial1 = &uart8;
 	};
@@ -95,6 +97,22 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&pm4125_l21>;
+	vqmmc-supply = <&pm4125_l4>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
 &uart8 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 95bd797d009d..ede4dca3e7c0 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-iqs-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra IQS EVK";
@@ -15,6 +16,7 @@ / {
 
 	aliases {
 		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
 		serial1 = &uart8;
 	};
@@ -103,6 +105,22 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&pm8150_l10>;
+	vqmmc-supply = <&pm8150_l2>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
 &uart8 {
 	status = "okay";
 
-- 
2.34.1


