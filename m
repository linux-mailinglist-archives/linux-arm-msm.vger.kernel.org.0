Return-Path: <linux-arm-msm+bounces-105015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCB3KSnD8GloYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:24:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BDB486E17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CED733020827
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADED44D024;
	Tue, 28 Apr 2026 14:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WW78sBvI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VfEeCoYe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1EA44CAC2
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386200; cv=none; b=eyESYdf5bCQ1Kbz6ZdNNUGL/EeKWFdpXzgdaR7vKT3Ie7twAeH+HpY9S88oWsiXaSgUeWffJmYZmIqZg8DBU00OpMdAXiEFlZJGHjC/A1BfyBCC2sBW0bkhFJuC4pjTGkqk0Pu/pFxNY4k8lCnr0kJe2hfSAqJJxHfPRO9v7ZWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386200; c=relaxed/simple;
	bh=dzIl8YppqJhB6Od+T2zCGC/CJ+cKszHfDpLPF2geGtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PioeJEPhbtrU2qwRBl4XsJWo2UnFNc8RFp16nign7J5DIwYSmWgFGGc6ETAanHXoqhAqVCumhLnw0mhlGl2eo41EflqfJ48p+GprdkNB5vwxafL4Aloyp2JNJ+cipaJCUlLImFqqiniuvYLx0PQXejuHjZiSd6SVCGv07S9UreE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WW78sBvI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VfEeCoYe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9GIVM662986
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yCqCzlz4VIr+zRAIjiPoA3dsT7YZuy9FJGQk0vmxxKY=; b=WW78sBvIUBy1eVFU
	njJYuxlMhWipbbcVudjhYGGP+XiDYinoeKFVUBhnPDAEGLfcScUrldggbPiLQx4w
	yRGYnTpOVRigSrjJgWenphU9HcLPtD80UsQ0NPNBxJCNY+Y2nRA0oaebXe1yf2ET
	XnvV+zwf2g5DC3bcqTe4l+IIwbQ6DCiXA1shrVwUbs6Je2t1uHc0Urky9gWUYWuV
	TWmdr6s7Zws1UD2ea8CbD5W5+zyyqfWV/QYthqt5G2CR7BfPyZYhNd+ZBIO8Mmek
	Ci+ElfzTMJxdzLH8mj+xDSTUQDkGLtZwg4YwdNwabusIJW1pSgyugppW5hNzLx5u
	Ey/iMw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtc5n4bnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:23:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a0b5478a12so131978216d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777386196; x=1777990996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCqCzlz4VIr+zRAIjiPoA3dsT7YZuy9FJGQk0vmxxKY=;
        b=VfEeCoYemwkTM59YTf0RVou51QvqCcBtqzIklZk7eUfFk/u/P1sJaeKwZ4ID0BT5aG
         RSwxEQReUAdmnQYKwKrhsCAb44buIOCLX2sSggIvrRASgtkc8LqLVR43JbzcwAyeMF8F
         4XN9Su5y+RAc1sgudX1dTFpfvN4RrOhnLIVatpRnC8oXYW2F/miRyXpffCqluLU2f3uy
         Y/IurEEyTmGO0psUeAAhAaQzdQbxK7YdsprsS+Q1P4VWbBOpjOSeGV/Ka98DIflKk6fJ
         JjM1WHzd/evBduwmKHf62e0wyZmaIBpbjd90oDShmEiBcTd3GYmWcI9FDk45kYYK6bek
         jOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386196; x=1777990996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yCqCzlz4VIr+zRAIjiPoA3dsT7YZuy9FJGQk0vmxxKY=;
        b=kR59pjKbAiBQLlTDhrSiqTsm2xjx+DYdNZKBGetslatE6evNM2rKWdoaFYZSyj03hD
         7hrq4jqdZrUv/w6ao3Jqt2kL4ZiFW799Y2X6qN1CCoMn4MA70F6Ivu/eJl7n+Cth4RTv
         zPXe7KmAcs61giOSwrg8aOEnISaN3Eq6UJzPUhCsA9FMhSK+fppiGsnQ5mMNvYvAF58L
         KasGB47SOCgPu0ed6NXgj790Zwota9vxD5jV7AZ8SUW2sxTic479zXCFVDktHf9m1V4H
         zOrdYbwiwM2B10npW6Xz/37B6jR+X7nVEv61mXKmnRfPKQ3EuELtaVhlpvW2tiRs44BF
         AOAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/2G5zmmoJxPP9s+DNx4VYZZQHTETWpF30vYTQScBWkQuC1E9UHl35SaWQK/NhJ0E2F2XKic9Tq8IvkS0rt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4xYzBmVmalhkZvbydprfJdpNhjEdqfeOJ7SzoQdazP0O+n1Js
	UqYE9kPondZV5X6pAWNbpHKc1ekkKBjfQLQayBFABlUu/15T/IlobsSHY2ofplBpZuGo8YfncOe
	H28Uozsopr74sQtm/NRWutEximXMyDYs+fHJ43X/E2JRHnnpQsRNDVhcTODRE/OxabMPG
X-Gm-Gg: AeBDieurOTIHavM/3MPiSpAAI49us9Wpkdfuznu6ekOfUJwXcxD35jwLYen0gKEPwrg
	1uZ+LAdaoN9BwYr/W5IEsGHbDqGyvNyOL+1hxRnOKDZOKUBWETlcmz2v/cCoAJHjfwxNQFzf2uQ
	P4vGtGqeelqUE8ex+vKXWgwA8rJOsqalU0paGHQt5hg+//IFabXt0MmB8laWgv8JdCWFIoYWvlT
	V4Zrv08nGyn1cwPtJRUZuyN0g1QDaEVzjHxKYKBh1GCwCrO5ycfZHmXwJ3aG8cBtRGrmJtLHyyL
	c9QZK35NQ6WhYGslpRa7c2muOo/WQbkKMg02ZG54emHNNKDJriM4RPMw44vr7+IZvO7UlLRmoka
	fZ3rv0WRi8haMzhZpslw7mz6acZZojyRsDbJa1sN8vXyIUpm/sAFwKgLTvPXL7q38nrhg9hVJzL
	aEDQH2i1NREbDqL8yZEjHDUcV3GqA=
X-Received: by 2002:ac8:5750:0:b0:509:5c6f:c0e with SMTP id d75a77b69052e-5100da85790mr39311031cf.37.1777386195920;
        Tue, 28 Apr 2026 07:23:15 -0700 (PDT)
X-Received: by 2002:ac8:5750:0:b0:509:5c6f:c0e with SMTP id d75a77b69052e-5100da85790mr39309901cf.37.1777386195170;
        Tue, 28 Apr 2026 07:23:15 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80ba9b8c8sm107072666b.48.2026.04.28.07.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:23:14 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 16:23:07 +0200
Subject: [PATCH 2/9] arm64: dts: qcom: arduino-imola: Describe boot1 NVMEM
 layout
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-block-as-nvmem-v1-2-6ad23e75190a@oss.qualcomm.com>
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
In-Reply-To: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzNiBTYWx0ZWRfXwKscpt98JqxO
 jEBniSIksLEm5U1ypX23NatjpRaw6+U1rGRvuuXyXspbH1RbCTPe7QBFCnAvf3d6ODb4woMlBY2
 tZ+vDShCs85kHmCLOvEm2K3fCsPjtJ6j9YoXUlFxB+8K4LgO7XybfhLY9rnE6wWX+gES3KZrUq8
 JTAVL7Fge/TTlgiDRO4cevXapPIwd3bxvPhfmgnOruoyEUEMGrK167rF84Nha445M9zwCaz2RXu
 nUu5Krp3sYbG/NFW0S4T2PKBGj7g6q0HvQ7L9+vq5Www7A7Qrt05J9zIfOCFYkbSvhw7bBibTKt
 IWPpI6Y6/kxhL4TyjUSJfh6lmhteztoJ+7ldeeheo7HAC27+wX4H/lZVJZLXFPo/H02QYOv9H5/
 ORnvk1T4hUMT0h6zmEkTsTTLjK4vumy5ghnyR/AFwZUUPLgSOtG6wspWaJcXhuw7ydDqn+Pvb1g
 sHKoALUnmEz4foipx7A==
X-Proofpoint-GUID: hhY4ZP53rHytj7bjiLvfDBLm3bFvbHF5
X-Proofpoint-ORIG-GUID: hhY4ZP53rHytj7bjiLvfDBLm3bFvbHF5
X-Authority-Analysis: v=2.4 cv=ZMfnX37b c=1 sm=1 tr=0 ts=69f0c2d4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=gjCkitBQ8UzLeNF7HDgA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280136
X-Rspamd-Queue-Id: 70BDB486E17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,0.0.17.48:email,0.0.0.0:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105015-lists,linux-arm-msm=lfdr.de];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[30];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.071];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.21.24:email];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c09:e001:a7::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Arduino Uno-Q, the eMMC boot1 partition is factory provisioned
with device-specific information such as the WiFi MAC address
and the Bluetooth BD address. This partition can serve as an
alternative to additional non-volatile memory, such as a
dedicated EEPROM.

The eMMC boot partitions are typically good candidates, as they
are realively small, read-only by default (and can be enforced
as hardware read-only), and are not affected by board reflashing
procedures, which generally target the eMMC user or GP partitions.

Describe the corresponding nvmem-layout for the WiFi and
Bluetooth addresses.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index bf088fa9807f040f0c8f405f9111b01790b09377..dc85cf94f71cac8666cab30ccf37cc2d2f8fd941 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -409,7 +409,31 @@ &sdhc_1 {
 	no-sdio;
 	no-sd;
 
+	#address-cells = <1>;
+	#size-cells = <0>;
+
 	status = "okay";
+
+	card@0 {
+		compatible = "mmc-card";
+		reg = <0>;
+
+		partitions-boot1 {
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				wifi_mac_addr: mac-addr@4400 {
+					reg = <0x4400 0x6>;
+				};
+
+				bd_addr: bd-addr@5400 {
+					reg = <0x5400 0x6>;
+				};
+			};
+		};
+	};
 };
 
 &spi5 {

-- 
2.34.1


