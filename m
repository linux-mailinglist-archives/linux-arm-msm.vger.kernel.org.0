Return-Path: <linux-arm-msm+bounces-109954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGHvCdu8FmqHqQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:43:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B114E5E1F82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 25D053012571
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6853EBF02;
	Wed, 27 May 2026 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="liPoEOQC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EXF1y0vg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB3C3ECBF3
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875026; cv=none; b=cocqOZQjuznAiUQDcDYuikQbrEkfPuMA3X6i6Gs3lbkfjUgEh8Q4NfgzL6MxPnUW2SxyPoK/Csfi6aVn8OdWe2D8tC29qVZfsXFDNx6BJnuHOeJCLJe763I+npeELrryinKHXaCWSA543M6Vodl3ulhn4sHxP4NRRi0e1StbDhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875026; c=relaxed/simple;
	bh=ak8pqRztC4n5CkdBOXwHRJH5rdifZ7ff4Lss7dcxTQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OGHnH5uwNrb3YYEJhfBZrTYastC5J5PmS4wP/+zn6nhSj2B7pOzafKWdl1mB+4aL0fYgB9oMH36nksqe1EcZNvYuGBRYipgSCoTOivHNDeiWcPkevhQ3RvQqhUGwXl6u/ccPj7uoPjCCpLLnPiIgpBXza1H6Vxnnk4QHnO4Sveg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=liPoEOQC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EXF1y0vg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8maKY051297
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Yf1lCNCDWPZygOQdkz4Rh2
	gBP/EIpy2DScuvoUBsa0Q=; b=liPoEOQC9gwr3IkgVVv0f2AOmbsm2Bb9QdjIzY
	LoACaEIfkLgamx+8Y3b591roQEuREELzQPfWCSJdaPRvu2MJApHCbhLHRxrgfLBm
	K9uyR+6BlRYpmZV8naBehhACOoKlPfBiL7788YtKDD64dJGS69qgQvd/jACAgxuj
	Z1HkwlaShWYxstxtGU20hLcHJBCgGP6bCgkX27OFCNpBtRulEHIW7S8rukFQV5Qz
	EWRQdMmzR3JRM1QNIzDhGa8r+8zTOdujZS81kVxRnHKUME1nZpBYRQ3uuJyZ6FZc
	QbtLI5HySRx1/g/1foPNohBSpoY0x/AKgpmbI5nSbFaan1Wg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edg5paxbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:43:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so59183455ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875023; x=1780479823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yf1lCNCDWPZygOQdkz4Rh2gBP/EIpy2DScuvoUBsa0Q=;
        b=EXF1y0vgb6yeRnCCysygrjx7HoNL71IlPPBN0HK26QkB+kn1hyq3Ft2HZFthaP7P16
         NfTrZC8Qsa25f2qrAA/ezlXRw0RJwRUYH6sg745jOrJDtWZq7y1H46hq/tFqw5vP7jIU
         6KQ+XRPEZ0I6diTvovQycLL2SYFuByZlq6nlIigOPUhpc45FOgcIYF9bmRLPSLnb4vp9
         eIWz+BJZ+Og1vkuauSo2d8YJ+UkChmI3C20qGKwbjAynSZZFqGqFwjn7O3c5B0hw9OPj
         ScGGszEA/WqElpvQtcM8LmAyz4bbVt8MoYJg0dWuwkrBa9s4qKR4Ihb3ftzgmKoK42ed
         WM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875023; x=1780479823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yf1lCNCDWPZygOQdkz4Rh2gBP/EIpy2DScuvoUBsa0Q=;
        b=mi8G9oF4wsNDjLVWV2ajusiqhO0g2pfe3QaOfgJC0+V3gBXv++XIuY1Txk063aoDbi
         HRHG8/Uj0LdxdEwIsTQWpH+gBOzCyOr1grZSpJNjQp1H6yfvzqVC2FkX+QvBrS0OKoLx
         GBptXBGMEGa8cg3mtrrczzNxPOtnZwHqd90JUWdbnh5YdAiDGm4MgpWMzVyE5dr2JS3y
         +99uM+9IGmOQG8jDt2ChPBWc/jm5AMYqfo5MCjZa9P8JkJNiCqdCe049o6A0uMQ2BltD
         Xyd2g6dsYED12BjzOv/KsJOweBs5VIBv6Apn+JsXOhX4U8N2+06l7e2D15mFCPrKhNpQ
         IRAw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZmBTptXudQI5/fBlcOh5eRj24S65jkSvVSLR9T6wc8SAa0LvZ+0C8ufWOOsE3VhqIJIvHwH72sD4TO1GQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc6GudinBhzM65ZcMMG1/0kAXkQFOJG2Wb7oj2c0wjVgaOkWvZ
	dSfUDUG5koe0wD2WS2T0s/ZZhWFyjNZyXp71jI1O72sYgQ8IFZZdd+lvJ6Qx4GGwxLCZjwTrFCX
	lLtATcm9bjdlQ4d78ITroIRVNA74w9cZ+dtcN+N4/btODdwJXok/8foMLDlFEZcZ9eFtf
X-Gm-Gg: Acq92OHP8AHxzSCblZDb3YPKKpo0/7qD2oWOKYr2niGeXtll09pjKEmjx35jnERNZAf
	1z0h67lonT8isJKFAFwrx6+AbbRurjg8TxC09/bx8+AjKpTHx+IQAjhCWK3mbn5JEdzJ8hY5jhc
	bk6cdg/TmdXxFw89FfGMbQpXRPByteLxTGCkOuoifWD56meFo5gVOPPS9voR5ijse9HUjeDicii
	E+O3Klqw9wanR1SHKkSYKxE4KMgMSlQqseImylCaNsThXhig6EkxrA1nCsIANBHemb/rupNl3jo
	zCDuNRVz7uxZFdPnx4+uMknVm2NDHEy1R2ZNibQGrsxBgG5OUdqqOIAmVbJjHl+UlBUE9letCYF
	QwAiADR92RMausL7SG0Yw9Hc1jLHzYDUJN9xxFUW0vE8fdQvgdX6v4na2DkA=
X-Received: by 2002:a17:902:e885:b0:2bc:e62a:979b with SMTP id d9443c01a7336-2beb0699cdemr244710425ad.30.1779875022542;
        Wed, 27 May 2026 02:43:42 -0700 (PDT)
X-Received: by 2002:a17:902:e885:b0:2bc:e62a:979b with SMTP id d9443c01a7336-2beb0699cdemr244709985ad.30.1779875021925;
        Wed, 27 May 2026 02:43:41 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:43:41 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 00/24] dt-bindings/dts: qcom: Fix PDC OS Direct Resource Voter region window size
Date: Wed, 27 May 2026 15:13:05 +0530
Message-ID: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4kFE_GVFMbinul5wpScQ6drof6nE3y3R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX6t23eWOmQNMl
 fv42/0QOi6vkKok+cnjluOAPDBlUH9yIr1jjk+UyOce0STZtxmXsfewf1Neng1Jd3ZEk/jQqViT
 I80c0Cz1YzfFTVVsNB9sPdPa5I7eYEXL7ch4YgJvUMxj7M6br4Cuq4XlAgvTAvcXsKUEPJJrwx9
 ge+CdUd7aReTHxg2uzrlBrqgpbtG6K4D+tX4yPCj4kKYakic/9UG1cg1lgV2P+XfVdcAlmEvR2A
 HsIb+VVoPyRIL63I+AId8m9d9QmAQt4HTxSgu8Ih1cNi9SjXxID9MAUpVKnQeBz2QJ1iLm1E+Se
 4XErTRMEaB1aUxQEX4evwxt3yKmQ+g3nB9YFJEZB2qABuXNJKFJk49QN7s4XohM2DMXcTdBaGzu
 eha/qXPTfTAsCki11SZe35yTgacC82xpigOo+tos1ZzaxWpBUbPuC0sVW1SZv5VsEgtbfz3nKKA
 vRTaTNiwfks0pdpAsNA==
X-Authority-Analysis: v=2.4 cv=I95Vgtgg c=1 sm=1 tr=0 ts=6a16bccf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rjoA1jeWjAGnMlSNlwIA:9
 a=bzHLEoA-GPT-YQmQ:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 4kFE_GVFMbinul5wpScQ6drof6nE3y3R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-109954-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B114E5E1F82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm PDC (Power Domain Controller) hardware exposes multiple
Direct Resource Voter (DRV) regions, each 0x10000 bytes in size, where
each region serves a specific system client like TZ, HYP, OS etc. Linux
only needs access to the OS DRV region.

Despite this, most platform DTS files described the PDC reg window as
0x30000 bytes three DRV regions which was wider than necessary and
matched the driver's QCOM_PDC_SIZE ioremap clamp introduced as a
workaround for early sm8150 DTs that under-reported the window.

v1 of this series [1] addressed this in two parts: driver cleanup
(tightening the ioremap clamp to 0x10000, refactoring version-specific
interrupt enable paths, etc.) and DT corrections. The driver portion
will be send separately depending on this series. This v2 sends the
remaining DT-only portion.

Patch 1 corrects the binding example, which still showed the old 0x30000
window and would mislead anyone writing a new PDC node.

Patches 2-24 correct the PDC reg size to 0x10000 across 23 platforms:
sdm845, sdm670, sc7180, sc7280, sc8180x, sm8150, sc8280xp, sm8250,
sm8350, sm8450, sm8550, sm8650, sm4450, x1e80100, sm6350, sar2130p,
talos, monaco, lemans, sdx75, milos, qdu1000 and eliza.

The net result is that every PDC node in the tree now describes exactly
one register region of 0x10000 bytes — the OS DRV region that the
driver actually maps.

[1] https://lore.kernel.org/lkml/20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com/

Changes in v2:
  - Dropped driver patches and send them separately so that it can be
    picked by irqchip maintainer.
  - Rebased on linux-next (next-20260518)
  - Dropped the changes which was removing second reg field in pdc.

Mukesh Ojha (24):
  dt-bindings: qcom,pdc: Fix OS DRV reg size in example
  arm64: dts: qcom: sdm845: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sdm670: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sc7180: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sc7280: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sc8180x: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sm8150: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sc8280xp: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sm8250: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sm8350: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sm8450: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sm8550: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sm8650: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sm4450: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: x1e80100: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sm6350: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sar2130p: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: talos: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: monaco: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: lemans: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: sdx75: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: milos: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: qdu1000: Reduce OS PDC DRV span to 0x10000
  arm64: dts: qcom: eliza: Reduce OS PDC DRV span to 0x10000

 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml      | 2 +-
 arch/arm64/boot/dts/qcom/eliza.dtsi                             | 2 +-
 arch/arm64/boot/dts/qcom/hamoa.dtsi                             | 2 +-
 arch/arm64/boot/dts/qcom/kodiak.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/milos.dtsi                             | 2 +-
 arch/arm64/boot/dts/qcom/monaco.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/qdu1000.dtsi                           | 2 +-
 arch/arm64/boot/dts/qcom/sar2130p.dtsi                          | 2 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi                           | 2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi                          | 2 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sdx75.dtsi                             | 2 +-
 arch/arm64/boot/dts/qcom/sm4450.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/talos.dtsi                             | 2 +-
 24 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.53.0


