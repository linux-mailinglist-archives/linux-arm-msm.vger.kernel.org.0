Return-Path: <linux-arm-msm+bounces-106469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL8YNDCy/GnlSgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:39:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 494CE4EB368
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5914F3058158
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 15:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FF044D00A;
	Thu,  7 May 2026 15:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LWAYSYES";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vl1cFvsn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A15B46AF27
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 15:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167513; cv=none; b=I2TsflQhxQ3CKtb97odlJLg2kmWiYcGEcJtXWZfCKYLqOTUTKLu3AvaAnEzTnXHCvceURLVY/SQpGfQp2aeoHqdFB88TyJZJPXZ/KrJ+09CJrxq5CxjgewRiV9Flmp17UVi6npQAHRx7dlz136rTVdfyLfOhpX0+dL6x80Po4Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167513; c=relaxed/simple;
	bh=ih3AqtvxdrSPtCldRnisYtzCgyzMAnQ+QYbLGIbAp9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aJv5CuVeGgRWHtp4D1r2c2x0krufRqs40AftQJM8ynFuuwNQHzepo108RAsf43EOCywTi2uQEgZZLInJqOtDD5gAlLSgQMob5nW3AOhS5YUKALWtRyAIvCfLm8eZL5XMKhw/qQrKACstZk6kINyx1741Hk1OuNRlCLvnvQz5Zb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LWAYSYES; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vl1cFvsn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647Bxa9u2734190
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 15:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+sodB+04y/mdW/cdeZL+z+1VhhOZL3GKbJATgOyNhgQ=; b=LWAYSYESvvmgzGOx
	ZuGeDCIveSsdJxzhtGMmkhkB9d0hLh5zvSPgCuKllGO2/gjLQ7GoxOvZ+8pdHGUB
	KJtzP7511f9HHpgyexvDoSArItpj6N9yEWa8EvVoxY+mbm/YNwESbiRdgy6LC9Bu
	+ZKS3MxdMSncrx3AMJ3gagwV2V0tmpcM8jt5Zk+NelsffYsdqP9zMmfhzZ7Js9tU
	aHD3bxnBnPoGFwU4MHfaHc2CYKmfFxw0rOQZ/PyVSiNrPwLHBiCKHp/F3GPqaEiI
	vAsBWgQdVxpPZ4UpZ6kQ2xLOivxSe/Hr3AOqBRjm1//4obbgK3FORcxnClIxjE+S
	JUKQew==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tbqrt58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 15:25:07 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95d2ad5df14so1454049241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778167507; x=1778772307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+sodB+04y/mdW/cdeZL+z+1VhhOZL3GKbJATgOyNhgQ=;
        b=Vl1cFvsnCItSz7UK2NzulzV7Dme9ELNPmQsrCcOyUMv3N6hONRJyCEzoahw354mlmb
         tizquJBDh0DHodC/L0zP61qBo/EKl9+ZVAJg4qjSeNMk8gkKVcbFPZpNMx0bQhdBpQXK
         Liwb8Eg4hFTkUo1t4CBk9okcW7m21h9SwP9zjloq2+k0t9avpdbn7O89e47iWZ4wboZW
         tniAPuivwYUwdJGptN2hpxknjpxm4PS2fuyKWtZbO/2WTdsac+PbLeX1jvua8uFFoiuL
         oX0xe0vXG+B6YRLDk72KSeXN3nSc6Fs8aYlJH1++ilEAfxIH8iNEfy4ApPUXjuuzHnbD
         KgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167507; x=1778772307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+sodB+04y/mdW/cdeZL+z+1VhhOZL3GKbJATgOyNhgQ=;
        b=HPYkzQmfvYC9r593hr4ol1EIusaUi5iUrSxnGzIuIlhuGTdmMyVqGl4GFpb6kue5hB
         6n3WHyvb8hDxApeZ2ojsIx+coYCgjoJHEbBclXjEqYcaX4mUeWkRp2nrVLetwFk5rn4P
         CQIcxeH467360CSvGd8FVFQ84In9Q41SRj/bmd2/zI5EBW8DxlVILpdXBTnOBSf79gCx
         qzibTcoL/oJam/0oILR7ON3mwmRvSTnSsjWclNyFCpsv0oWQGsD+AmaUmKXJ/PnPLJdy
         VptyMaefJXAlKiadbAx8IGiijxHEE7WH0b2/bAucKC8I2xIMzD5Cwp28oC3X/JW7RRw4
         MrQw==
X-Forwarded-Encrypted: i=1; AFNElJ/AZr68MWU5DMnvTTwaK1suC1vQ9wkDWrFbR2+t/BbaFA9szALzM1q9GFLiq902eVhiBUVGi2alOjUd0W0E@vger.kernel.org
X-Gm-Message-State: AOJu0YwF8++3F1QB3nojid47spiytTvwY5YOzdBarOqJinslxaewESU+
	w7RdcO+NxQUz2z00kBN989Gix+TF8fAzKZHyZDS2i5oLyHdQDTqAR7/ed8x1+P2bo7Riee8du6w
	Yn8aJ19rkJwwSZQiCql5lGwXawMEAcBuEjAa8AqO7+elMl0iWbSeU4t2KlUgMADo4WYrA
X-Gm-Gg: AeBDietJVbe/7aFhiQQ5kAp/BBAlcUCG8FfdJpZ8UqocQTV7Wn3tUbLV2dgGrFfDrkx
	et0tW6Ct/ehLgXCeaVLuKH9SQtJrTL3MUJ9at5GTgViJjGElNN2zBgv9YCYcRQ0Lt+2KXXVo9/m
	qpgKgkxCMCh6XW5AO/bTl11IHdsBfw6vAFWruf89vqO8Sw/pnPfHjowZ54PlwUh1qpuqXRuqvVq
	yWOScyRZ4+smzBbPr2FK+pic8gxVL4jgoKKHKjEuO6yPdH8kRrFJ4fkPtpn7rA4TA9TMnpBn27R
	tFaNF3GD0niByDts8/I4w5clAiNZcRqsKF8bWGHFqRePgvgX26t2cozKffiSdvu9F9957QiXTaI
	9QfOqT7on2BKYQBlCSEzQbcIELdT5QoDeAf2ODjSgig0GPXZiWXucUs8T/Hd9oUUpkHaBhCv0IW
	rz0Nqzy3DCStQAdwWLYLwINdaoVu4F4xnkZaNZHQ==
X-Received: by 2002:a05:6122:2a13:b0:575:2166:74c3 with SMTP id 71dfb90a1353d-5755960bb57mr5381619e0c.9.1778167506650;
        Thu, 07 May 2026 08:25:06 -0700 (PDT)
X-Received: by 2002:a05:6122:2a13:b0:575:2166:74c3 with SMTP id 71dfb90a1353d-5755960bb57mr5381466e0c.9.1778167505322;
        Thu, 07 May 2026 08:25:05 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca583dd7e4sm240966b.58.2026.05.07.08.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:25:04 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 07 May 2026 17:24:43 +0200
Subject: [PATCH v2 8/8] arm64: dts: qcom: arduino-imola: Describe NVMEM
 layout for WiFi/BT addresses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-block-as-nvmem-v2-8-bf17edd5134e@oss.qualcomm.com>
References: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
In-Reply-To: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
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
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: TLBT4YlI-rK9fdVVqFfzf5whymf5bcpn
X-Authority-Analysis: v=2.4 cv=SJVykuvH c=1 sm=1 tr=0 ts=69fcaed3 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=7004nz7suiqLHAzt4fYA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: TLBT4YlI-rK9fdVVqFfzf5whymf5bcpn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NCBTYWx0ZWRfXxRXmVeq5Dtce
 AhPBsuJj5ngBlkp2wJo/VfOBXS0Ez8TAeA2x4xCOicA4YnKilfOD34dbaVt+DdOo0CDemwHNWtY
 wnXEt2mZ5VGinr3EE+nuzwWTsxHp6B34YXt17F2cW8/fCllV1V/MKG6aBErVklnc1lNuCJPmtIO
 VSxEm2lvyoXBXN7nid0S7/YBEboqmJvOHY/KJ0RNInwl6RmTSw+St62OGtH3ISmWbOJkbr2udmx
 UPNFill2W1luYRddO5F3EnBn2m1CrvgKcyUGl3/8/Rwv9BJY5Ak4aVisrmB15/D9AT23zYkzaUI
 LCmE8qPTMpohcf9MK7tlvmC79PZWQnBU0W/SK/qOGyrAbO36W3EiK21ir6fAGJeTh/jQUglfNxl
 L5EMzTczc0AAxeHLDIpdjkBSGKa9B3KANAK4SPtLfJZHDkAWyH2BorDyy8lOTniFCLc94b+mwaK
 yGntRc+GT2FgHyvQKxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070154
X-Rspamd-Queue-Id: 494CE4EB368
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106469-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.21.24:email,0.0.17.48:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[36];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.424];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Arduino Uno-Q, the eMMC boot1 partition is factory provisioned
with device-specific information such as the WiFi MAC address
and the Bluetooth BD address. This partition can serve as an
alternative to additional non-volatile memory, such as a
dedicated EEPROM.

The eMMC boot partitions are typically good candidates, as they
are relatively small, read-only by default (and can be enforced
as hardware read-only), and are not affected by board reflashing
procedures, which generally target the eMMC user or GP partitions.

Describe the corresponding nvmem-layout for the WiFi and Bluetooth
addresses, and point the WiFi and Bluetooth nodes to the appropriate
NVMEM cells to retrieve them.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index bf088fa9807f040f0c8f405f9111b01790b09377..6ed91cccae2fbf0723629a4db12d2724312d50b2 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -409,7 +409,35 @@ &sdhc_1 {
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
+					compatible = "mac-base";
+					reg = <0x4400 0x6>;
+					#nvmem-cell-cells = <1>;
+				};
+
+				bd_addr: bd-addr@5400 {
+					compatible = "mac-base";
+					reg = <0x5400 0x6>;
+					#nvmem-cell-cells = <1>;
+				};
+			};
+		};
+	};
 };
 
 &spi5 {
@@ -512,6 +540,9 @@ bluetooth {
 		vddch0-supply = <&pm4125_l22>;
 		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
 		max-speed = <3000000>;
+
+		nvmem-cells = <&bd_addr 0>;
+		nvmem-cell-names = "local-bd-address";
 	};
 };
 
@@ -557,6 +588,9 @@ &wifi {
 	qcom,ath10k-calibration-variant = "ArduinoImola";
 	firmware-name = "qcm2290";
 
+	nvmem-cells = <&wifi_mac_addr 0>;
+	nvmem-cell-names = "mac-address";
+
 	status = "okay";
 };
 

-- 
2.34.1


