Return-Path: <linux-arm-msm+bounces-88086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7508CD0387D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 15:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E630303972C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 14:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6472487069;
	Thu,  8 Jan 2026 12:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nSrtlj2S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJ4w3e7d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B07747DFB6
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 12:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767876744; cv=none; b=uLXKQZffxJVqWiS7hHcanhKabMa6V6NmMHd14LgWalkg2HSFqTKmTALmf7TIhCGF3DwC9IwiUQyiwHKeh5Ua3oTU5vCrGLpdGS56qVNQIRbw+AlccS2/NmMRoGrcUsSw4V5xv+YD244JwnDu4OctXXeXkrSRMZWb6JMxDe2Lw7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767876744; c=relaxed/simple;
	bh=XlRMvPPKlAymX2hcc4TzJppfzzrPdib+qTdDXUHtTAo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bScR2463PxawAGY4j5Jdz7IHSUHfipLJEAS1dqgXCdeEeR2SLhXs03FLdBohjmN57khOSLvvAXqxQHJLFXo6cHjFW9+fTbe1h3ovi+z9vGoM0wnZw/fF3Q7WgIQXzPr1zX9mnlu530YZBlq4Bxg7Kl3alINMi95QFfNl8P9ezwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSrtlj2S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJ4w3e7d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608BiHoX3751433
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 12:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqYeC64NCQvvq3+TQC/yLoL6U7dsEsommPyssm+Mo0A=; b=nSrtlj2SGTn/oJjV
	l132+tO5pym+vjxdim2eZasRecvHTJ/XZWHfRQXoX+QQ2dBvw8tlLWFAX4645QSi
	nplGN3/ZLNSCxresQ89Fo2jxfYYjrg6AHOGGFR1HZofzMkIr3Fymjm/CQLRs16ak
	rbcpCpkXf9yiBVfqsWWBQCWjIbc8mR2/kxO5oq0xkhn0XRpFsKUMtOOfFFRVcu1u
	N2oGHvlgxGXEiwo/qdHHaqWdSb8ckfk11IY0/zfrUgnQ4SRO55JIEpAbed9xxSfE
	MGiZURjOP423KcOssJdO3xZfBtLnIRuxv5sHjxCbS5c+uebhuP6BvdkzbBu0QnQ8
	XWvb4g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxcu9a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 12:52:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7fc82eff4adso1805844b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 04:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767876742; x=1768481542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqYeC64NCQvvq3+TQC/yLoL6U7dsEsommPyssm+Mo0A=;
        b=RJ4w3e7dDVzgJ1kwOZG2Jzvi+Oq0JScQsVnrZPH7bpZiOS4LV8WCRPt7ijONn/gEfZ
         AepBtrq9xgeXwj5zbGA10TgFeoGXDtfhuIbfsD5OHfOd5rNEfkhK9v6yNc9jWc498Ql+
         ukVdinRpg9Z0kznTAnuMlkv+noCSSBpy4x6voEmDkFu8iSbaAdRlm6w+Le6WhAc+MCCb
         faqbUufzJCg2wDW9Lme8xGfz5Vuj51Mlkad5dqmc97EdDVTEkkfnDjCPsf3K5igI0wUZ
         GYmvDUe6k1NRBHrPXMwesXDc4FypmafcLZyeSiMpBbF+TgWL5Jfb7uhwP2pAGv7pO0Al
         Ksug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767876742; x=1768481542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dqYeC64NCQvvq3+TQC/yLoL6U7dsEsommPyssm+Mo0A=;
        b=P8AfGEDS1cUuzCHotWDz1cLqeWKrV18GILyObUxXPr6ja/yNM4pasA7jqzRuHfylIz
         lR/j+v4xTqJdauFggyRxQrVaiYZt/N480DSEGD9L1FjVjV0YrO8EIt8bnwuMZpQILgOS
         cByj+d4zBi+6qWmbAVo4hQdw7rxPiIlcBkjxtfrqAUDiaiGWaf2jnm/HONsZ57TJAmMJ
         oofMJUT5lkjXx92eB6dukxMoDu/kyt3vzaSBp/Zk/8+rPh9H5TNnnUC575wD3h17kCyV
         tCpaaXIpRKqM8A6fKEdLlIRWHYt6nDJ7iFlGZzbZ7RCcRwIMSQQc6YnlhXJRgkzeQM5n
         9zUw==
X-Forwarded-Encrypted: i=1; AJvYcCWfrKZ6F3tZrtR9RbUWwzsFVGXT88WjniJymNn63lzS3guwf6ricz+anmedHz+KxxZHODnmYNPCEGpm97Nb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/U8XqBry/O0ACwfAzKlbLCjBuusSpYh5q8Jjgt+DauDAE0Njd
	jZd0eJ6UHYfzfmWO+6U2UoR2wiwCSNE3EScuTcqWshEYIGkt/nrHJTLuPyQyxst/mdOBa8NP/A1
	Wh3wayy1ScYUwn5l4CC50KyreHKdhwGFJ4hEtxfFMkT11Fdj6sBR5TJx7Oseu9wRDAlkz
X-Gm-Gg: AY/fxX7XKUSt3Sq15rU/ayE8fed/1+YKK/PfbEFd6mtxD+ig6wPcVnFE1Eh8AW8Cp9m
	8VG9AiC9vXGb4NV2W5xZZ4L1epOH9e++1Bw+74q+xmB4gbwtfsjM3QKWMeFlmWVUiRX+Hi/pe8Y
	b3ZnEaGY1HMMqseR7Ny3IFkj4wJw1gt8/WS/YJdJB4zmdKF8A4XtskXdsLUmstLUq4aBSAPBd6f
	5cvI3Y8tyEVUJZA7XpL5/UDoTHk1O2q0hkOz9TIq11WP0Zw8Q2okmbLtDnycWjsz33/kAsFklJR
	fqVflhV2I50uUEUrUKbNW6KEwLBE5PJwcjJ+tg92T4XRNc6qtcy2gJDi8ku4E0Sn9ogYx7OGVQw
	tPv+JRk3Ozo3za0G85gDTFfpbP8TWxiT1SqQgMYTNX4JxkA==
X-Received: by 2002:aa7:869a:0:b0:7e8:3fcb:9b01 with SMTP id d2e1a72fcca58-8194e130c64mr5945321b3a.23.1767876741689;
        Thu, 08 Jan 2026 04:52:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7fJWcSWnWEsA+4ccIsBSJbS+iZbKv78WluDAaYqqjbFF8xPa4rUh8bOAxTSVBtf4OiWxTCw==
X-Received: by 2002:aa7:869a:0:b0:7e8:3fcb:9b01 with SMTP id d2e1a72fcca58-8194e130c64mr5945293b3a.23.1767876741179;
        Thu, 08 Jan 2026 04:52:21 -0800 (PST)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81dab89f2a5sm253302b3a.56.2026.01.08.04.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:52:20 -0800 (PST)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: mkl@pengutronix.de, mani@kernel.org, thomas.kopp@microchip.com,
        mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v1 2/2] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus controller
Date: Thu,  8 Jan 2026 18:22:00 +0530
Message-Id: <20260108125200.2803112-3-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108125200.2803112-1-viken.dadhaniya@oss.qualcomm.com>
References: <20260108125200.2803112-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5MSBTYWx0ZWRfX1OWFKBVZbN0I
 1Z1soL7fNbGGYlw2Ms3KoDvvBZ4tDAOEqi4+LATUthhQCez6l9KRGdgzAGbGVY5eWryKTzGn96f
 vvyjXs22a3V6zAM9QB4d7lrLu4W+QCj9XxM+Q+jCD/TvSuf/Rhv4i6w4t+aONuptBkbNdtYwEvy
 MSueYMAc6ArO6WGDfNEgEkQsxDYIphc4PHpyvJIl4SR+qvajQb4+YhtlBYV1Qbi9kvrMQ2Q12qU
 Z7q+u/GY7O9XpG9XGrlhVABuasukaC0WAnVB+qfLMJgP7zITuSTEhNzLeT9rwgxmHzZI/HamXfP
 BnyStw9tbKO+wDIOOtJEDNVnP0Dn1OoS/iHY7b3WPZoIV/0jedy0fu0XU/OWE0XvRvJw//wEt95
 LMoogjzr+QMdxi8xB1UwMhWBQkkaVAZfquswXYGPS+mZaIN26gVePo7tZbhq47iBvenVXMmmOQA
 6UJpAzuqS/wy814aOdQ==
X-Proofpoint-ORIG-GUID: ibGvmynQVlIbhHNfrULiqz4eK1IutbrQ
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695fa886 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XYn_8lXowKPdo-AIkF0A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: ibGvmynQVlIbhHNfrULiqz4eK1IutbrQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080091

Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
The controller is connected via SPI3 and uses a 40=E2=80=AFMHz oscillator.
A GPIO hog for GPIO0 is included to configure the CAN transceiver in
Normal mode during boot.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot=
/dts/qcom/qcs6490-rb3gen2.dts
index e3d2f01881ae..f2f2925e645a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -44,6 +44,14 @@ chosen {
 		stdout-path =3D "serial0:115200n8";
 	};
=20
+	clocks {
+		mcp2518fd_osc: can-clk {
+			compatible =3D "fixed-clock";
+			clock-frequency =3D <40000000>;
+			#clock-cells =3D <0>;
+		};
+	};
+
 	dp-connector {
 		compatible =3D "dp-connector";
 		label =3D "DP";
@@ -1151,6 +1159,28 @@ platform {
 	};
 };
=20
+&spi3 {
+	status =3D "okay";
+
+	can@0 {
+		compatible =3D "microchip,mcp2518fd";
+		reg =3D <0>;
+		interrupts-extended =3D <&tlmm 7 IRQ_TYPE_LEVEL_LOW>;
+		clocks =3D <&mcp2518fd_osc>;
+		spi-max-frequency =3D <10000000>;
+		vdd-supply =3D <&vreg_l11c_2p8>;
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		gpio0-hog {
+			gpio-hog;
+			gpios =3D <0 GPIO_ACTIVE_LOW>;
+			output-high;
+			line-name =3D "mcp251xfd-gpio0";
+		};
+	};
+};
+
 &swr2 {
 	status =3D "okay";
=20
--=20
2.34.1


