Return-Path: <linux-arm-msm+bounces-107865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGuJCpoQB2qbrAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:24:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB0F54F7BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B28231AB31D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028C6436375;
	Fri, 15 May 2026 11:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obtxanzc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PBdK+KwC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E624647F2F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845634; cv=none; b=npF4NuJEmEu5nagahXudJ13wP5qPgD9tluRXKU1OiBtOgZPZZt0AgWH6VB1S+0gc+TJvB6pR+xMg1+X5J2t/rJS3o0TrW72kicWA6LjRnr6htVyibXJlghyV3pCOBEeCAAWbbNJHFI1n2R9ISEu3Q4FADExs2eLoGF3uxvvv+Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845634; c=relaxed/simple;
	bh=AefraGkBhjA85yc0aNpkRsthLtWWbRBEb5hUi8maZn0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FJlVpKwTS3b7KxoTK8gnuBbhNQUchmDwikiB3vMTIBtRUttNW6oqoK+/bAs51wNMsrsV2Y9/FkBdX8VR1DbBNnXZyGeuIDKjGhCw5KXDNiMOi8Eupr8XFHNkbVu0DUOlqnV+0FwpOe1apLWiRmEoZy+L3wFmmk9aWsRJmPeV2kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obtxanzc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PBdK+KwC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F9O7EQ1714971
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t6qqW3hD3ibqQwwI8IjK9D
	fhS4qtV9tBUuV5fjw0IEU=; b=obtxanzcfFUgcA+ldkK5uOmCf6O+Yjj8xzv3Zu
	aU2IekNvFbscnDYUjjN+Z//sdg/e4e4QghjZ4fsfY5uJ6uTi25IWfzadwMmUPftH
	5M5730WQaS5iNLny2pSr+IVgCJpXOrrfH+O7ldPNY9kLdN1bl56ewhZM8jnfSLsB
	S1s+YwhvvfLpjw3+B+3irQMVNVpuSg9qgsUWBv3nRar5boYg755VOQ5mV7VRsIvI
	WlZiWS4v5kFa6/+POf82QJnpj4Y00l9NEj+YP3X+YMxtZ/SekmviCjnkr2HtZviW
	uITUVqnLRUfwg9U1e0Mi4dFgX6Kv3RgJ+I8BGP/uBcSQr2tA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxsvbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:47:09 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95d1b7487caso14869196241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845628; x=1779450428; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t6qqW3hD3ibqQwwI8IjK9DfhS4qtV9tBUuV5fjw0IEU=;
        b=PBdK+KwCWMjUYMD6VKk7x5KKs1+udoaKm/xpjZ7a3TUFfLzawWdbTxzeXHHIAAF9ey
         DK+r7d+7Ae30AHaAJFs5BcQUAcMpHyvpPaneypJW3oYJpfWDGK6bTkV5pPfzhZhPM9gc
         lq/BasNukFQLkDEym4IU6G6tye64hGEs51d5VlYTaYCwrOcbBb33fWIXhfZDWPd80sQz
         xxnqlG6NvrYVvYeYcLUsaXzii8lgaLwyj5q9M1BKHs/dRj9jSzvFF1tny5s5w5cRjJ/u
         M0ygdndcEYcMgS8i3L0yLdA/zjQqmOXv2yecqhbv4YdN8lJd7BZeR41eDBHxhXPIIxRs
         xZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845628; x=1779450428;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6qqW3hD3ibqQwwI8IjK9DfhS4qtV9tBUuV5fjw0IEU=;
        b=ByDhIwA14bnJaVEfHc+BJGJVCE0c3JqjPWB7PSn88xytC9OLau4W3vWwSPIhR67DCF
         734VYVDT47i5stHWW1bklgYkfhtHu6XpTlcxNSbaTCRu8MABe8T6EaXOCdSX8o7zEOqD
         J4HjYHxqEdojnbdFHDqxZfCgaxiQWUDQ4Z/vHGZWm81t3IOJpuLpTHb36MBcV6WKU1Mm
         rFTeBG3tDDnUgkyv/kPF8Z8TDJoLuByhgG/19S/J2Zhjy2BCHy53sDF26Kd8eFQFFlsJ
         pFiZ8HQYv+4Q/LtD3XaJbpp6tVJ2llI9MwgDB2z8tMWvlz5NWf6rzUu6khE/3YszJDgy
         TdQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9vgxWJYd7pWNiCuhgkCf2uBjW2fMK44OHi9ue6MppmzyyNa1bBcrdvdE/9AYEhXQ2RRg8SatUBO+fU1RF9@vger.kernel.org
X-Gm-Message-State: AOJu0YxDNhEykfzRHWJbc9qXon3VZAfUUCD9Id4dYuuixwzIVvFyHpFg
	jFPbXX3U8G4y//QE9dNsfTc43W5Xk2r8kWYbKr20cDZN7OMsyAnfmNe0RMOI9bXhXF3Kbag9uIA
	i0pwrZWsjMd/NeceK39o2oGFwYaw6BSZjN35uxzL0GwPAkLneMvWP8noHnx9ZNyoTOH0v
X-Gm-Gg: Acq92OE0tWiMKIXlXrj5qX89ZGNhWQCYnpoWV8Yx+IComkjEud6hyO+kgYcxpAxtty3
	dNHTAsBUTMqPfnS6mN0huw4IdvRwlFQiMPQH86P+l8CpxH6j/koBnywNPcZJqeKK10cYVJQ7RLz
	WIdFtkL1uJxAf54E421FeAcVGLrtbluidFqTpEKDKKBx3lvk5K5EFcbbidWE9JOP5A2JZ84zhZ5
	I8XIGBF+B0cmYi1osSlWOM8MZ/rfT/Y3gDjiZdhVozJgPKTEhV/ESjN0jyJiFfn3Kclr0pOBww+
	f7+Q2ecT9ZHVHaoAB1Fyni7eQ5L2mP8CalCOdMiHa+9QuyhkpcPKvIoc6eKbybjTkSx4mO5EkgS
	9NA+akb2kLUx8Lomq+YeH2tG2zZnVCywq
X-Received: by 2002:a05:6102:f8e:b0:631:b365:40ee with SMTP id ada2fe7eead31-63a3cb1412bmr1858540137.4.1778845628101;
        Fri, 15 May 2026 04:47:08 -0700 (PDT)
X-Received: by 2002:a05:6102:f8e:b0:631:b365:40ee with SMTP id ada2fe7eead31-63a3cb1412bmr1858517137.4.1778845627647;
        Fri, 15 May 2026 04:47:07 -0700 (PDT)
Received: from [127.0.1.1] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c3150dsm216853366b.24.2026.05.15.04.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:47:07 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH 0/3] Subject: [PATCH 0/3] media: qcom: Add Qualcomm JPEG
 encoder driver
Date: Fri, 15 May 2026 14:46:58 +0300
Message-Id: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALIHB2oC/yXMTQ5AMBBA4avIrE3SNmrhKmKhNWXEb4tIxN0Vy
 2/x3gWBPFOAIrnA08GB5ylCpgnYrp5aQm6iQQmVCy01rnYesV+oxSMbFGohs4ac0cY6iNHiyfH
 5Dcvqd9hNT3Z7L3DfD09VY/NyAAAA
X-Change-ID: 20260515-qcom-jpeg-v4l2-5014defb5bcf
To: Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed <akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gjorgji Rosikopulos <grosikop@quicinc.com>, afilipov@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a0707bd cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=0rZay79RH03Kq9A5n6cA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Aqi0brlqGoo_DnrcodU-28iucoc7Iavz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX+JMx7YdP4L0I
 jS2Lfblt2UpJTGxTEUkkZ3eaNRNcJPAoMnej5gbH6VbKbKiXwzji+giDhu/HzTH2iG/H+8EybG4
 qlFKHrzcqifhmW5jOsS62dFU6lyElyMpl60RYHaRcamlOYnMDIRnX+QQwcEaFFplsUEareb0B7j
 QRcp4anS5BMlBvKxJrGZnzl1GhpxNH4xxHEpnvqgayMFrCHUOgD3PJ2InsuDy5YUdltd/bwU8uf
 NeZyaeBNltIAPnpYGiw3BqMLNX/Z0fcRzoo3yWQXc8DuDWkH3+brSiSCDEuILfq74scb0dhvNsh
 yHkgot4uTly+l4i/ntsW6wsVyHPCkt4slBDzYo7ELbVIEvMxkeEtyL48qFy8aYOMsRYGF64mNST
 bbEUHLAMKSK/ML4V5mwcgQrTfPA5G6O8+jEqn6bjHgO0AamfCrnQW7CNs0QrQo4eSte1nmR2lrE
 GvaOPv77hOS4VAKXDiQ==
X-Proofpoint-GUID: Aqi0brlqGoo_DnrcodU-28iucoc7Iavz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1011 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: 6FB0F54F7BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-107865-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add a new Qualcomm JPEG V4L2 mem2mem encoder driver for Qualcomm SoCs.

The driver provides hardware-accelerated JPEG encoding through the V4L2
mem2mem framework.

Currently supported platforms are:
- sc7180
- sm8250
- sm7325
- sc7280
- qcm6490
- sm8550

The driver has been functionally verified only on qcm6490 hardware at
this time. Support for the remaining platforms is based on matching
hardware compatibility and available platform integration data.

Main features:
- V4L2 mem2mem encoder interface
- Hardware JPEG encoding
- DMA-based buffer handling
- Device-tree based platform integration
- Runtime PM support

Testing performed on qcm6490:
- JPEG encoding
- Multiple image resolutions
- Repeated streaming start/stop
- Long-running encode stability tests
- GStreamer pipeline validation

Known limitations:
- Image scaling is currently not supported
- Image width and height must be aligned to 16 pixels
- Other listed platforms are compile-tested only

This series includes:
- DT bindings for Qualcomm JPEG encoder hardware
- core JPEG encoder driver implementation
- V4L2 mem2mem integration
- platform support for supported Qualcomm SoCs
- runtime PM integration

To: Gjorgji Rosikopulos <grosikop@quicinc.com>
To: Kapatrala Syed <akapatra@quicinc.com>
To: Hariram Purushothaman <hariramp@quicinc.com>

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
Atanas Filipov (3):
      media: dt-bindings: qcom: add JPEG encoder binding
      qcom: media: jpeg: Add Qualcomm JPEG V4L2 encoder
      arm64: qcom: dts: qcm6490: Add JPEG encoder DT properties

 .../bindings/media/qcom,jpeg-encoder.yaml          |  122 ++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |   52 +
 drivers/media/platform/qcom/Kconfig                |    1 +
 drivers/media/platform/qcom/Makefile               |    1 +
 drivers/media/platform/qcom/jpeg/Kconfig           |   17 +
 drivers/media/platform/qcom/jpeg/Makefile          |    9 +
 drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h  |  253 ++++
 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c   |  370 +++++
 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h   |  111 ++
 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c   |  388 +++++
 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h   |  130 ++
 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c   | 1522 ++++++++++++++++++++
 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h   |   49 +
 drivers/media/platform/qcom/jpeg/qcom_jenc_res.c   |  268 ++++
 drivers/media/platform/qcom/jpeg/qcom_jenc_res.h   |   70 +
 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c  | 1082 ++++++++++++++
 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h  |   27 +
 .../platform/qcom/jpeg/qcom_v165_jenc_hw_info.h    |  509 +++++++
 .../platform/qcom/jpeg/qcom_v580_jenc_hw_info.h    |  509 +++++++
 .../platform/qcom/jpeg/qcom_v680_jenc_hw_info.h    |  509 +++++++
 .../platform/qcom/jpeg/qcom_v780_jenc_hw_info.h    |  509 +++++++
 21 files changed, 6508 insertions(+)
---
base-commit: 804a18eddd6d57bd554e0716034c764f48659b0a
change-id: 20260515-qcom-jpeg-v4l2-5014defb5bcf

Best regards,
--  
Atanas Filipov <atanas.filipov@oss.qualcomm.com>


