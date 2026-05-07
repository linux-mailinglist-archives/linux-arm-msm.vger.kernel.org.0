Return-Path: <linux-arm-msm+bounces-106345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CvKB4B9/GnXQgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 13:54:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E38524E7D06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 13:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E455A302423F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 11:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE64D3EDADC;
	Thu,  7 May 2026 11:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YR4uC2ax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HEPyvh3p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496E03EF651
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 11:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154833; cv=none; b=eJLPRSnmpp2HcGE+Q8/6SD+ZCZpyk+v913Oc0nrv3PI+G+k19WoHIfZi89Ca7F3sjQA0lgahrGVMNjMDYMmFZwZe3CZP7Qm+dOXaUOCw9ueJllj8BomHZ/92ClKDypm5lrH3Bk3Zbx12kFkQ420IbrH5Y9msPeB/eJ7lf/QpukM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154833; c=relaxed/simple;
	bh=sfl81u2ifZ0/GKHLGpn31j3VpS1n60GRSgz4W7+kkeo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ED+EiIMwCtkBHA6YA6RKS54vm/ssz2Y9HGaLvn04mU00tnI3XDkbz72mSqD+Ixv9oNi5hY/1zwt5DDac3RbiD5C4iDqJVihENd5MOs6mlqmqZ0CWr5542xSwBtIYncK/jcmzP/E4Q4CDTwIJSVVDix984+juc418Tfmr41l2XGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YR4uC2ax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HEPyvh3p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BVFh41926382
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 11:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=89zFx3dLXtbpfnKkvfW0+OhfkwJkSy5cdCw
	bfPbXPYw=; b=YR4uC2axPJ3/ATxJXnvfx0wwFSR7ErX3jvrpJHV1fUkumnCt3Ra
	Q44Y3h3s6uAz7u2pFfr+n5AIU9QZ3o50ZZXFDnR992WckABk+gJ5Ml88JaZKog1X
	+0YsWSR2ieVbmAtQD0nULmubU3MzVUH1iZmOmaxepe2Bh3zSc586ja28qkyANLi4
	03U4vJSt6hhl/frrc4Tco19U/OZxPLgbO64zFvFQES2iHBcTIytsS9boZ9FbvBVD
	m2cEL6DKhEIXaLGBHxACsO6yKvYCTYXph/ErPmTH0Q6GaaFYfceSlTkVPcSy/0th
	hFAE7NRSTrbXq+BG4GwIAxZb29+ROiz6qGQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0n2g9ar5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 11:53:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83836443305so408265b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 04:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778154831; x=1778759631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=89zFx3dLXtbpfnKkvfW0+OhfkwJkSy5cdCwbfPbXPYw=;
        b=HEPyvh3pu78yDoCsc2U8WT4y94HUkpMRw1DfQC16qxiPM2gc4R77ShiCP1zs8fBuuz
         WYijDaN7I0fwXzWWSZiMhztNCA5KIRwq6blwtKHM6cLweAa9xeESvEHQ2ftx7O2MI7oK
         2HoC/NOtd9HXApLBr148vyRHKWjwqLsLW40iIDOuWDrIQ4He1l0sVrbKv3XLbuCjetKb
         Cd4TfPfhZ9WicIvcLSCHv+5gQ36kB3eodZ01CqJ+IT70mXQTbuslcG+I628y03NnENML
         5bVL2nivyekp6yqY+F96Q7KvcmbpVfdFDq0XbcfghouSQcTeioVFmxSbT6UfONqRo7/e
         o4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778154831; x=1778759631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89zFx3dLXtbpfnKkvfW0+OhfkwJkSy5cdCwbfPbXPYw=;
        b=r7K3tSK/q8jDI7B7wmfT4B6QwF3H0XhtWNKpqNBvwnbcNH4U6X41CzUXEnjL0xlewV
         c0ShiwA8AZO5LMLPESrUqjCYeT9/ky8QDERfKgR21I3M0/LA3cv2j8KB51DroCraF0Vp
         Kkr43B00kfdVStm2gETiuF2c8dKWfrwpByg2SOWaYrTtf/0H08AQoWongJKrbysKdtr+
         4jjB52zw796+z4ZQOVXjLi8nPEZ3X8Iu5Fd0iz7GvWDQiYPRjQVBlMzwH5t43hkt2aRF
         MoavA1L+ZyfYvhn/DRvjuLULveNT5xjk7dHCIi3o2/gF0ZF0s/KvKmlaa6EN0hdW3z8e
         h9hQ==
X-Forwarded-Encrypted: i=1; AFNElJ/P5DNT37s2nbBtQghLqkx1b6ht2UAKOQsZzRfSuftGvcoGrlRSE7Uqurd3hyU5q9UmvkQXIbwdjepKOBEj@vger.kernel.org
X-Gm-Message-State: AOJu0YwvYsUGjq5/C/YOwMRH1+JrKSiILJBDtgOP6Ugvj8V1m0fJ1YBN
	4MQaUXxdyMoJdU0XILns9FCVkc+zoBFW7XNo5pXict4dA+DsYEhdFLfyYzMlgkeHEckjAW0fi1Z
	FBqHioEjZT8sMxkxhlCfvbQ5yT8tN5TZvVu5wOxZvwevoroYLk1gKTsoiz8YvXK6wlVME
X-Gm-Gg: AeBDievlVeQyhogU0+dJ5H1zFwhV93DpVXWzaCUBsoOf2TM2+FSgmhfg0S7NGEmaC9J
	y/LrZq53wtq0EpWZBWmUi5pizdlS9ZbwWafmONbaIFY3mZTJi1PDjsNm6OX8PLBV823lniiQBHM
	WY8GmXISo7x1agZTvnx+ky6P5luZCaCOkBCpga1lKtlf9YQuMNfiaQjjC+Ny3GaGal2QMqLse3M
	EgBZpOfUYjGrFphVqxGxhNQSVbOQynSjaVtAr3SpeiTqU3dhT5i19vMo2wffDht9tC/Gv5iDTcJ
	HpXOFL5zFeLJrAGyesmRFI5Et8WIhOLsd1n9AhZj4vwFZz0yBAIfRFR8gVHh061lquX8eAwuwmH
	mivCGoyVd6YCob+sQ4kyCrkdGnaCDGwmCzphgQsUpNb9blzly0DnvUigfmN5j+7MJMg==
X-Received: by 2002:a05:6a00:348a:b0:835:6bdf:c87d with SMTP id d2e1a72fcca58-83a5b0dc365mr6912952b3a.10.1778154830720;
        Thu, 07 May 2026 04:53:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:348a:b0:835:6bdf:c87d with SMTP id d2e1a72fcca58-83a5b0dc365mr6912928b3a.10.1778154830213;
        Thu, 07 May 2026 04:53:50 -0700 (PDT)
Received: from hu-anupkulk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965646254sm8976072b3a.10.2026.05.07.04.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 04:53:49 -0700 (PDT)
From: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mukesh.savaliya@oss.qualcomm.com,
        viken.dadhaniya@oss.qualcomm.com,
        Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: Enable CAN RX via GPIO expander
Date: Thu,  7 May 2026 17:23:24 +0530
Message-Id: <20260507115324.1814329-1-anup.kulkarni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Wv4b99fv c=1 sm=1 tr=0 ts=69fc7d4f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=HURNEOczjUzzROzEHuAA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: M1AgoGB3P4OzXClvCVfTf1HRsKphZOlD
X-Proofpoint-GUID: M1AgoGB3P4OzXClvCVfTf1HRsKphZOlD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDExOCBTYWx0ZWRfX9RYbI2irTS01
 Ho8WLLXaBdjz0Ryi7HmmsbCyGHN4ffDwj+kScqi2mlDXHigpnZHY12Xkd8xtKfpoXJFE7EnyQVo
 dVba2Wc0esQ3Trzy1bhNVMlPxZvbokgC81w3EnBSMvI9dezbrVX5i9B1z19CyZY56yMlL31W78K
 DHlN85cWk7Ul9naIzrLgNT7SqrTMKRa1BQqzTE8VTOJhWQw5KPJcIBBglPuwRSGgA/x5pYcYZKs
 5meHj3y3Sw0W6styb6X5JLETkXdIZok0wbW2HRrloAgyv7rFUMiJkcEaUpIkTbs3S47/85yb9N4
 lbsLwiuWWlcbQ8VYboWsmlGF9M2XlhBkxIIoIWomR6ll0BvYXj/0sNIIf83HIQwUKyIpTi9PGUw
 Sosk/+bi3frCWK4COlYneAzWjON85LSfI5DYmIhlMM3v9Sp4k6i3trwuQ7pFha2VvdHfQOV6iZ+
 Ay/8eSdMsgS/ZSvFALA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070118
X-Rspamd-Queue-Id: E38524E7D06
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106345-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[anup.kulkarni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.50:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Few CAN controllers, part of RTSS sub-system on LeMans, route
their RX signal through a I2C GPIO expander at address 0x3b.
RTSS subsystem is an MCU like sub-system on LeMans with independent
booting capability through OSPI interface and supports peripherals
like RGMII, CAN-FD, UART, I2C, SPI etc.

Describe LeMans EVK hardware  wiring by configuring the
expander GPIO 4 pin as hog with output-high, asserting the selected
line during boot.

Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
---
v1->v2
- Fixed commit text to include platform name.
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c665db6a4595..34dfc8d22b6a 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -616,6 +616,13 @@ expander3: gpio@3b {
 		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&expander3_int>;
 		pinctrl-names = "default";
+
+		rtss-can-sel-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "rtss-can-sel";
+		};
 	};
 
 	eeprom@50 {
-- 
2.34.1


