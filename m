Return-Path: <linux-arm-msm+bounces-88084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 49501D031CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 14:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAD4730DCFA6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 13:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF39471490;
	Thu,  8 Jan 2026 12:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BqyjAUZU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gM7+VL4S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3583B471491
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 12:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767876732; cv=none; b=fC1V2Bil/hjzCFxeGdFjSwC9ByJi05I5e6JNWb1SaFNTGtbGongn03Gv6iBiNDGBza0RowerwBUS6At+Q0tmWJEjFFfTv+dmu70WqiiJ0YLSWTAEAlXrseN8JozaRmmw2BnA3yG2sRSLZHaTvkP4w1m8SDcgetrjgKnu/CvfaaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767876732; c=relaxed/simple;
	bh=v+R2GyEEtLy/jrg6DaQ1HaFOQE6kRXDmQZsAdgSSTBA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=OUanQzq1lQzT/M3BOGn4bFZz0OlYCWtKsotldgI73PtGH8kVDnTrvyRPAv7C6pnZ6zIDdkom49/xhY7+fGNHFnyqEtVoJ3+Vmg6xD3EkAeLLwyl38B5/f1QwEPHxUdytcIZBJc3FXJMbWOilJyXtn9rWZZ721rELuRxVkKXhXO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BqyjAUZU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gM7+VL4S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608BJDpP3751446
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 12:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bRHVxDjLYahn82U9zuLx8+
	cgT5tO6EUiRW1cbfAHVoM=; b=BqyjAUZUeHnKpDWtMRo7NBsTqrk1Y7uPN5h/Ez
	X5dJjx++eCeuOosYxPM8crM/EvaDyGuUxcxzNG+K02aPgJtr1moH0q7iPnVjxJff
	7MP36bR7YLBZtND1qcT0PCmHqAnQLWsyDhYwRcS9ws4k3mFqwHb2GE/XIejueBtF
	FvvV8horiF2grobt9QhyVpK2vyWQkgmGB9yVQDsMnog/oJmNzzImjp2fwKP1NPtE
	A0+f9vCsRQUvY4zUDM82pIYONHOkWizVaGtUX6TsmjM2m28Ylw9oxhZFL3cxEjWv
	JB2IvIcTVt+hr7x2SxuaQQV/4VoBUEq+dCCoinFjT5JbpmNw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxcu995-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 12:52:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b895b520a2so3048958b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 04:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767876730; x=1768481530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bRHVxDjLYahn82U9zuLx8+cgT5tO6EUiRW1cbfAHVoM=;
        b=gM7+VL4SnuI62qy3S6X+OnBCK/+UOh8neiuo2Recs6ZOH1wDYaLQmvFyyTQR0GHZnx
         D5WwiHlBYLYxqw3+QS2r2GnT7q9+nrMMWiHz+Zq3itCkMZbPAf2EvPU0Y+smXTJ1b5wR
         NBF+5CUPVypFiDuv/5Z80R8QW2YzT26/Kf+pfEHX1WqZaJy0EDhynNL1kddP5EMRXAJL
         OWEi6m0WkvAOOEIUCRsWY/AiT48+TN5/9fRYBAT0igjVVp5qFhVQ8MqXroHr8wJ0WVny
         Acog+uhiEEDLExyP/2Dx02a0B8Or/4q+TBJy5onkYvc+GiAFhUx++VspuHS2jraqeimj
         bWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767876730; x=1768481530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRHVxDjLYahn82U9zuLx8+cgT5tO6EUiRW1cbfAHVoM=;
        b=Y7aBKZDM2VRk0UNZ035NW2MJ0F2Ir+hUhhcWvj9B0/Meo8mTpNy8O27Z+TIej+iZJn
         IddwSDjNXOskECNylI7WzcffyKTuMTbH63SKLjXLfKizxKkazDdc0BDvcPWZ+sfA5xN0
         HorkZtRCEITcT1AruqxMxlRRPqId8R8daoi344u8qCEFxO32cwsgKz/4TIG74E4/OVi7
         PSIL7X/2I6XhbkaFuPqrx2CRDJ600DvXjRVyd2lep+WsLDq+KZolBTVIUohUZExGVPDo
         eJf0dIK4tiNWCMRP1bM15dShZliZECqsW+JUT8a/gy45/0jbVgXuLwnNsytieteJBqY9
         SIQA==
X-Forwarded-Encrypted: i=1; AJvYcCVKUfkIUmzT7sMnHFmf46/aVneDiyiu7mn+Es0loAewb867KsHoajQcJotNT/ZBUYZnB1+2Fb4MS74RRxBJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ub6h5z6bDfEP7t2fUfoShLxqgIXhlylv9a0YPqsod8RdUofa
	WI0rosT7yTpb4uasfwSvG6dnm0+CYFL78O4HlqVNlUEJwySG8mFaULtRfAuwZfmWIDwWyDGZ0MF
	p5D15ufbVeNC8+Cv55PQcQzpi6mkS5SP4r6X5+P++ofKBRiNFcz02pY9dC9qTZFap5r8V
X-Gm-Gg: AY/fxX4YvcNpxWWin32PXhMa7QAS//qdemBwA9gacMK4YUnqmyOx4UNJmOl493A4f9N
	R4pulxQalsXCoCaiNnJx9IPo23oxpv6vRc45TbsriTwXGVrnXKT8eqjKH8eq9ZUnMDY1AebJVvk
	dSynxH1mt2Iiym/Y0uj+r3X94Hm3IcZma+CIqX3GwDXGxDr4SNSopXMPWmWk+x1BhkqrwMCocyn
	dJxl2JmYybzkX8fJcj2BTJLVt3WE/jzxrCGVX8t6m955C1LnasPWFLgByyXWnVcSCixDTKbALAM
	KKsuBRO40z0qq6JbV7MlJFfXY83Qt8xvniyRlHkpu6KThicRZgE3axlwENwh3zWbi/q5+lHE9Zv
	N9PzrBxNp+pCvwQVpRhPkDZ6Sh74q6dyk9A4yuzrllk1IHw==
X-Received: by 2002:a05:6a00:32cf:b0:7fb:e662:5c8 with SMTP id d2e1a72fcca58-81b7f6e3a8cmr5705918b3a.30.1767876729657;
        Thu, 08 Jan 2026 04:52:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgScV5G+Nz7moP3oIH4TzGt1E7jfvWoqvlXffiLCn0TQFdYyifLMTpIQmKxakhhybG49WCyw==
X-Received: by 2002:a05:6a00:32cf:b0:7fb:e662:5c8 with SMTP id d2e1a72fcca58-81b7f6e3a8cmr5705890b3a.30.1767876729185;
        Thu, 08 Jan 2026 04:52:09 -0800 (PST)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81dab89f2a5sm253302b3a.56.2026.01.08.04.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:52:08 -0800 (PST)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: mkl@pengutronix.de, mani@kernel.org, thomas.kopp@microchip.com,
        mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v1 0/2] dt-bindings: CAN: MCP251XFD GPIO hog support and QCS6490 CAN enablement
Date: Thu,  8 Jan 2026 18:21:58 +0530
Message-Id: <20260108125200.2803112-1-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5MSBTYWx0ZWRfX8orlKJJCG+G8
 20rX8VMc1JU2CzjWakjV2yRvSmY3+LcMvuM0qwkvlGrJCF+SycYHV29m3ibp7PL2eDP3vSfo58W
 h9AVhZoli8eGZEqi4OE0ZQmY+0819Sca5rhHO2Updoj7R7LuQG8tNll3wMZZJFGMW6bQoIpSlxN
 vvFiF6WY/43mhKSrwae6G488OuUP0kCewpn3c88jnWbqSvvm/7SBsGB+50byolK0KKlfRAs/3JP
 KVJtoIxkSD+qjRvcxdmRGeeYp2n8AXWTq2mJO3gg5HIlUyLHGdY6UUE0dsFPfai1f80Fueeeh1N
 +ckksd2kN2MXpOPzTtk+dFP8M4fIiA0YblJhn98xhRPbdPHQmvAgxo9GKcHcRtpaiFSEYO+DG5J
 YgtDLAXgCqIJ7WGCYj8VN9pZj5FNEt2qppzwJdLOodn6WMdxcbDX+YvC0E0bDI4byh86nuNit3Z
 PLXWoOrhCn3vaEzX8dg==
X-Proofpoint-ORIG-GUID: wkO5LzEyzO880oNiEavbN-x_N2wjoghV
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695fa87a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=nFuhNNRUEVbzmfeY_84A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: wkO5LzEyzO880oNiEavbN-x_N2wjoghV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080091

This series introduces two changes:

1. Extend the MCP251XFD binding to allow GPIO hog child nodes. The
   MCP251XFD family can expose two pins as GPIOs. The binding already
   declares 'gpio-controller' and '#gpio-cells'. Adding a
   'patternProperties' entry permits boards to define hog nodes for default
   GPIO states at boot, which aligns with other GPIO controller bindings
   (e.g., microchip,mpfs-gpio).

2. Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
   The controller is connected via SPI3 and uses a 40=E2=80=AFMHz oscillato=
r.
   A GPIO hog for GPIO0 is included to configure the CAN transceiver in
   Normal mode during boot.
=20
Viken Dadhaniya (2):
  dt-bindings: can: microchip,mcp251xfd: allow gpio-hog child nodes
  arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus controller

 .../bindings/net/can/microchip,mcp251xfd.yaml |  6 ++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 30 +++++++++++++++++++
 2 files changed, 36 insertions(+)

--=20
2.34.1


