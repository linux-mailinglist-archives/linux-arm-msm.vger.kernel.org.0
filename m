Return-Path: <linux-arm-msm+bounces-95371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJiUDOllqGl3uQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 18:03:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6518204CA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 18:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 383D130A9A85
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 16:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47AD234CFB9;
	Wed,  4 Mar 2026 16:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iz40ZW9C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WwyMbyk7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647EA2571B8
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 16:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772643575; cv=none; b=T3yQpX2ouX/lx84TW68gzxzOs78791asrVtnqjCnZqVlc5UpwRx5jTPIfRizHJ/f5F6RqIN6Pu+iYKn1+RfHzO2Iggk8sbSYy9eIsDDKjZS5W5dJDYv7ScoL1sCzOAPL2q304dmB6BWBnunqSvgBTX3+pSg9IMLMtDi6mtpso04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772643575; c=relaxed/simple;
	bh=Xn6LICm1LxZFNUciZ3aVxZLsfouUvz6/34qPVK1M3Vk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aLdiXUccxHUO68eWa3ppRwrF+lPuV7hSSr4EQn8WwbT0gGNOsVlhIk+kH7yM8IfdP4IPzWcnF5JqCI+ibiGMDqoXmmJZ1s87Kz7apE2lVr+fJin3+h9JFe8OY+3a5503Y90tHbNsHhkrFnBRXpELpljqkhik/gfYUxvh9jTZuaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iz40ZW9C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WwyMbyk7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624C6osP2275085
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 16:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nhXsWxHw5nFB4BnfS1bTMEglnzdFhqqRKRt
	xQyd0tbA=; b=Iz40ZW9CUovv9bu87JpKNZ4RYG/O8FkJJPuGKnZloE6EeDSOoZR
	6gxoDa3EeIJwOXjnGiEN4EXZ1yEneECkyw04yYMgeP5W5ULtkt0kdMshta5KhskO
	+LcHTr+8vTzX7xjdYC6NF0a9rkDmEhauk27+n5lpxZntbNYSVXnFUywvPjgt9UMr
	+zjQ8ShkyPKoWuN4ej/fWCIzk+ZOdE+SF6uQ2JrG34Oi/F7iiGl47Ti5BktBZvio
	Z77s0A5om2B04VrJAebdxVEw8KKAJCTinUP+Z+8o7X2oCsrnWSUvJ10bpNYD9i6h
	hJro9P1VHEJ8/XCZnG+XOVttHvuzyfTXsIQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4mtkqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 16:59:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8217f2c9359so4133192b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 08:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772643571; x=1773248371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nhXsWxHw5nFB4BnfS1bTMEglnzdFhqqRKRtxQyd0tbA=;
        b=WwyMbyk7/15bVuWS+NYGv/uiHa7gyu622DvFeVwJDGB4ywnXw0MQro82D3nhW2NINM
         AQ6HRLZblcH48iga0sfqZLAZMM25LA26prmEyh5BhvkoK/sxwnf5f4uy9nd2TeuWbhqA
         lspFLeB7JUryA3ckNBfkm56/j5aOxk87HnDE7PFprDRSEerKRL5hrZg4SalpZcBihzay
         eF5UFCjXcqjxG0Ph0S4wEJAKy21Ujh1Ot+9Pd5U4A2OmDz04EbzRea1WV6f4t5QIwF61
         4q0nu+wKy+PDeP3U08g0XeE/b6YSKNvPEHfWs+FH6kb+W0VOj/XIiWcKvEi5L5SnrI5p
         ED+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772643571; x=1773248371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhXsWxHw5nFB4BnfS1bTMEglnzdFhqqRKRtxQyd0tbA=;
        b=ZgegPmned3s5l3IiwaDxbfdqBmkmOJz92OK9M2v+hErEGPiInTAloMklzMS6bLSRPP
         FKAlSucierdgos3m3Qov3UD5t8b9iVyJ0S9Hcuw46yHCm36rZBn49f41H4mZI/0Z/qcG
         2KOOvgXtouYTPrCLmHtE6F2vnaOe+CSlZIQheM9PW03YAv84Gbs9IE8dV62Ab3ud+S0u
         iRXnJ8sNrIV2AuzVw9xKsUqcGAe+ttfLi5EQWh3ml3en2v3QOvhGgzyBUbEvVeGMo8K+
         eiTvSlxm0HCcYSZZMQcvHol79tnPTFfIuVjbNjy1G5VrbwUnB5kyffov5ZseULli5ULk
         FNtw==
X-Gm-Message-State: AOJu0Yyguyt7uOmyYzI+eSHaJylWJZh9v55T5o5a1nN1xj+qHyL4tJRY
	mzsch0U8EB4E4z4xmXVBnxYXO2e7LGlzK8cdwON7y1asla6bncHJx/KvttOUFeanVlzi4Fa+SaU
	2MlY7s89ZLrPnnAHaYDewng8t7VmI/UZ4TcIs0e4Hzm/MFn0SnbcOd1EcVV3944ioLC2f
X-Gm-Gg: ATEYQzykzcR6IpQDy5+AS3qd/3qmRVIPASS2L586BCuhm2AktPi9hR0HAA/dLmz/B1L
	WYgd2q8L6sIYc7smo0L9QQnhdvfdqSJ7n21dfO0vVogKYZFlwlOo+faNGHXopmCV+HmsyO4zXZ1
	8el1pS+O6x2fX7Qf75cSd4CnjghrYwJqwPfYaq57G/irvZ6xdGyo9b5n1tOR1ZRlgT9Dy/2qIFW
	j5ORXjcPlscILM/LmYOwx6jSV7QKw1qVTJslzoXP+92/eR8p/Fi8CoEosvWujolqOuY0+fIAFZS
	PWhRgSDEz5+5Za0FI/ldKuIdqaeL0JqhtG+yfdDU9f25eTDggHHYuZDGaQzBZ8UZxovJSPk6OS9
	KjTNYa4rBCdStQD3D8qz7DictfmTMqR4KHKVhPSfANl4pMc95aMl+
X-Received: by 2002:a05:6a00:2499:b0:81f:3940:3aff with SMTP id d2e1a72fcca58-8297277e1d1mr1376803b3a.0.1772643571256;
        Wed, 04 Mar 2026 08:59:31 -0800 (PST)
X-Received: by 2002:a05:6a00:2499:b0:81f:3940:3aff with SMTP id d2e1a72fcca58-8297277e1d1mr1376783b3a.0.1772643570788;
        Wed, 04 Mar 2026 08:59:30 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d8bcb2sm18637245b3a.22.2026.03.04.08.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:59:30 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com
Subject: [PATCH v4 0/1] Introduce Lemans EVK IFP Mezzanine
Date: Wed,  4 Mar 2026 22:29:24 +0530
Message-Id: <20260304165925.1535938-1-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KOoevo5s3BhFxHAf8Y_cyYTIy2ufbRMd
X-Proofpoint-GUID: KOoevo5s3BhFxHAf8Y_cyYTIy2ufbRMd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEzOCBTYWx0ZWRfX3sehSLxusr6K
 Mvm4WOMhSS6vqRigzlTkdqRNQRaWJc2yFemiAV92hEM4vdRZaQRYqsMAFOOjSCFOrVggsezHWan
 KCXbiU3vUVAjAtQMUNDMwDqiamd8kSc3CzTYL6GT4UKGmKDiDiV+lsJHfMpxbacII566bDDtop9
 W2vEdgxUwVAQB7FIVoIsRTcNQaNFlpvguYm+WSKVfCRw6BupT1l4tbhBgm7/jnpZPAjLSu3B0bM
 VmawCNERCrXs4zcYeHmSv1HTbxlqynRPGBKIk5NLYzItiN8EMudQp+utEsCyo17iq8W6DqV4jVd
 hSQb+F0J2dYlR/EduHkNEtQzbH1JR+Pyp49414ILCs6np7+PGcLkGFLlE+IMthsNqmgwlOMEBjs
 rzr6NB3DVw6WILPA49MnMkcPGlM56YdkVOei6OFThjZDdaFg+mwsT3awyWbC2W9wkIfc3zSYB5T
 xc3ibBr5B6uSnzviR+A==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a864f4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xHOUzGFCKDqHGbgTw0gA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040138
X-Rspamd-Queue-Id: C6518204CA9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95371-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Introduce device tree support for the Interface Plus [IFP] Mezzanine
peripheral expansion card used with the Qualcomm Lemans Evaluation Kit
(EVK).

The Lemans IFP Mezzanine is an additional add-on card which can be
stacked on top of Lemans-evk board to extend peripheral capabilities of
lemans-evk used for industrial applications.

It connects via expansion headers on the lemans-evk and provides
following peripherals :
- 4x Type A USB ports in host mode.
- TC9563 PCIe switch, which has following three downstream ports (DSP) :
   - 1st DSP routes to M.2 E-key connector, intended for WLAN modules.
   - 2nd DSP routes to M.2 B-key connector, intended for cellular
     modems.
   - 3rd DSP with support for Dual Ethernet ports.
- eMMC.
- Additional 2.5GbE Ethernet PHY connected to native EMAC with support
  for MAC Address configuration via NVMEM.
- EEPROM.
- LVDS Display.

---
Changelog

v4:
  - Rename file to lemans-evk-ifp-mezzanine to align with that of
    mezzanine naming convention.
  - Add fixed-regulators to satisfy what is required by the bindings
    instead of representing the complete tree which is present on the
    board.
  - Update commit text to communicate USB-Hub, LVDS display and mini DP
    support will be added later once the dependent changes are
    available.
  - Remove "power-source", "input-disable" and "output-enable"
    properties
    from tc9563_resx_n node and add "output-high" property instead to
    align with TLMM supported bindings.
  - v3-link: [3]

v3:
  - Sort regulator nodes - Dmitry.
  - v2-link: [2]

v2:
   - Move "regulator-always-on" and "regulator-boot-on" nodes at the end
     - Konrad.
   - Drop labels for inner entries of ethernet1_default pinctrl node -
     Konrad.
   - v1-link: [1]

[1] https://lore.kernel.org/all/20260129172850.1175728-1-umang.chheda@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260202194234.3701434-1-umang.chheda@oss.qualcomm.com/
[3] https://lore.kernel.org/lkml/20260203193848.123307-1-umang.chheda@oss.qualcomm.com/
---

Umang Chheda (1):
  arm64: dts: qcom: lemans-evk: Add IFP Mezzanine

 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../dts/qcom/lemans-evk-ifp-mezzanine.dtso    | 263 ++++++++++++++++++
 2 files changed, 267 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso

-- 
2.34.1


