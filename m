Return-Path: <linux-arm-msm+bounces-102571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBWMLE5q2GkhdAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:11:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 712CD3D1BBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 943FC3051E8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 03:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC6A2FD1C2;
	Fri, 10 Apr 2026 03:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2ASYaym";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FKj8bcXj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C44314A65
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775790579; cv=none; b=urZ+yE7R+xWPhu2iZQiyt15LZEwcKVz13oQAwxL96+AcuXH5s7iy03IIzdP6cR8sLhDrOfVV3pjB1gNHmNqgU/yKSzC8lqS1+I3s2W1hkVa9/Jwvc6Q/Vob4EIoguxT26krXglODWur9hR9Kogsje6BJs3SmWDWVqRYKnasXN2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775790579; c=relaxed/simple;
	bh=e9z45rpqeTTyOv7DPEBwl2VGtPMFpFdv1fEXn5OgATc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MzS9cnP9HGwq6oHbLyay4vMy+7dlPT9RBfq4XnMzoD/umDuxeFzjO+oiScPKTqTRxCbqAmXETWFxPhgS9Q0InjclbjaLtAs+6ZDyfc8ViqwHQf8XwkIynRHEWDkxrh1N8hGkihIwPjufFPpz04hw1N0l4DQK+GS9ojTCIGcvo7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2ASYaym; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FKj8bcXj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KhZhV2624709
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ZK6sxHdS1Zd3nHvFI8+glq4Vq32x7HAUAhSwXuepio=; b=i2ASYaymHNHGhxTE
	nlD9ta2xBQ0MoxnM6wOLr29tpRxR2+ByqLYfZdh5HDMPx6r9p84B9yrszKoaOxlO
	M8dc6sv+mfveB1HqFyM35PA4E3bG+kfYnR5RordKkE9n7oHWszEeICc1SOgbMFbK
	jKeHWB+njWh07PGWbx5Iccd5NdkmeIrtq2hqnEZGiP4secpzfW5Pjybz0JhsUsep
	csKVnRm/cnCFso2bf7bhBTP0a74fdezUBHwK674kv0qiBv0xVAETx/cV86XWc4Av
	yUAFCVBrHqJJIay1dR7PDzfWJVN8Lo5JdHnq69t7i7QraCleIPesQXrEcO0D+H38
	HqzNDA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decmu2fkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f0f2b2641so175201b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 20:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775790575; x=1776395375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ZK6sxHdS1Zd3nHvFI8+glq4Vq32x7HAUAhSwXuepio=;
        b=FKj8bcXjZNGcm+uwxJoieqEPuRiXazxLUn2xmOpsCKabrnnusPmO7J7KL1brXXoUO8
         JNn534SS8+Wi50QKVQK52NcjIyp3x7fvKOi5XM6hulEy61p2J3oGqRdudXBC0yixEQod
         BP1BSE4qrkHH19MB2OIN7LT+d/CtVd3Hb6r6fTaf74K9ehWZtH9jBat3KTLcxkRGp+Et
         gNfo7ZmnTmdjyARH/wIRgygQvHzpfkWoXwyWOaKIh60BvNv9TwghI2RT9pXZEy5fWowz
         en/xyoeU+JyrWS6xgSLP9e1LX+XvqVT0nd26jwZbQtKmFISYb8kxdXjsMLGVuOq2kPSL
         UJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775790575; x=1776395375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ZK6sxHdS1Zd3nHvFI8+glq4Vq32x7HAUAhSwXuepio=;
        b=YWlkp8c4uzV2wZdNT/DAfifit80W6jWrBFoTym1eLbZoJSbTTrndSHv70YEakd7rvc
         eN7qfmWMNELajoskkRq+QmGxA55x8dfeDUS2zo8xxDOibu6t2QedCmojn9hEitYKhB8P
         yVz3d+btiUBk689oOOfDh2ER8WDJ3GzKws/SgcaRLL/eOeZYvmVXZeVhGUAVYVjreNdS
         /vkX29ajm7tbG0vVZosNkfksXCSbV+Sq9KEpP+8y9pEQqfrSNuorke2J80xV4qGUsE41
         pRgubLnhHpAQVTd5hWeIS6gTfZbjQDq3eA13atllDtWZU749pGwrCfhdgQcu8LGf/0Nt
         anNg==
X-Gm-Message-State: AOJu0Yzv8e3o8KFpD7h/+bdWCq4/0l9eax1NPs1iqjd/RKm9GjBRfvNm
	V5g/s6qJPNu4PoAgPQo25AxvMiQRI74Z5wXVOI32Laa2Rb3hsJUhGNQ+1z8xRanP8IQQmI5feIk
	EmyFv2YnJzHPtXTEOXJh+vtRrukbBSfQxTt/RuAeXf4D3xKZWCRqfg5euWyWQdkyaeBS+
X-Gm-Gg: AeBDieshYasZYHRZHi85qS+ondVRqo6dpeKggPIipkhFJJPPEndkjsdf8Qj77xKSZx1
	LHh6v3IeHypSbezbCwvWfCe0NRHl9uG4qqElGYbjQOVpD5S+iEh9CLKJjDW+wd7xh1l7UHlJ6gc
	FGa9U09g4+KBV2l1TrewFNAwysoYjEhEqhEPOMilAyr1YL5o/Ble/SWfePV3hMw+LWXDpfelvM0
	p4EEB+qDL5n21W57n1dmx4Gymn3IxeYKMg+OMxeCsEBEcrZwPi2rgUhMLV0g10jQIZ5bO4qH+hX
	fpjIexNDsPLnYMaLw8aewdCbfnTL/qJ8PT1cCK/znUGug0+5JGpxJN5/Z/F+AQs/nqHIXC5SGiH
	M5dylzVq7Gg3tH8Nzhn2t8t/KOOsp4GA7vsxHv/TMSxTI7LxBijsDMiAzvJ3ow+IaVKO0khqTMo
	6z/fTXd8Yy
X-Received: by 2002:a05:6a00:3028:b0:82c:e692:1f91 with SMTP id d2e1a72fcca58-82f0c2b368amr1533406b3a.39.1775790575257;
        Thu, 09 Apr 2026 20:09:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:3028:b0:82c:e692:1f91 with SMTP id d2e1a72fcca58-82f0c2b368amr1533370b3a.39.1775790574758;
        Thu, 09 Apr 2026 20:09:34 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50cd34sm987452b3a.54.2026.04.09.20.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:09:34 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:08:48 +0800
Subject: [PATCH 5/7] arm64: dts: qcom: kaanapali: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-add-label-to-coresight-device-v1-5-d71a6759dbc2@oss.qualcomm.com>
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775790553; l=6784;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=e9z45rpqeTTyOv7DPEBwl2VGtPMFpFdv1fEXn5OgATc=;
 b=m7rMcnhUFzz2+Od1fssiCIIVGg4bfGkHX/awiPFLkPiCG7yLbXWWyJUfByPQNfA24cdS408/a
 QmzhrN1w0A3CnpWhAMLH+648W4OxObqFs0FYL+2j8LIiRAO+ngeQsOM
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: RZVZlRTeWeT6-GN4AF84tjKH9DY0gPuY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAyNiBTYWx0ZWRfX665uCWxmwsYk
 vez+u7zZirNN2g6kR0+X/4ZvTIL4/pLZC88TenbAq949Gxv7V94RHyPnlHVbayzvjfrgdYyRSD7
 pf2nuosZinP0MHf807zqIeMPA5WmDRdfgGecCLO0pdHZA4YcB75RaroPZ/jDnUdwP9ZqN+1/1tQ
 EE2HhRABYI9d2lnEFvsapS4CPo/MtectMzd/gU4AkBmqcmvQCIKbQZcbam8AZRDlNguQdYT5rsH
 nz6OwFPicIzv23f29UvnHydPpxRTt1aOigdZguC8jIqEvwHpOLUN0mam7ZusAcywSeA2UKASopN
 InsPdZfI7qbF5wSGzZw0ZkvCwy6hgjlvyKSo9QTbAf2s2YFm7RJt4gxe/O0EjAFrN3RwaisBKm8
 gvqKPeVLBiKRVjhS8DwMPeRi78KkP4KZwZhMcOLeH7qEU4q9zzCqhkXlSO1FdRylj4MKDRae1Us
 cgX6zaI1qNlSwfJE0QA==
X-Proofpoint-ORIG-GUID: RZVZlRTeWeT6-GN4AF84tjKH9DY0gPuY
X-Authority-Analysis: v=2.4 cv=DslmPm/+ c=1 sm=1 tr=0 ts=69d869f0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=y9sfTe8_aZ23gbbyZ4QA:9 a=V7Z-W9-LB9nPp9hi:21
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100026
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102571-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 712CD3D1BBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add label properties to TPDM nodes in the kaanapali device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 35 +++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1a..0d5714ddef9d 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4201,6 +4201,7 @@ tpdm@10003000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dcc";
 
 			qcom,cmb-element-bits = <32>;
 
@@ -4256,6 +4257,7 @@ tpdm@1000f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
 
 			qcom,cmb-element-bits = <32>;
 
@@ -4319,6 +4321,7 @@ tpdm@11000000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_modem_0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4407,6 +4410,7 @@ tpdm@1102c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_gcc";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4425,6 +4429,7 @@ tpdm@11180000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4444,6 +4449,7 @@ tpdm@11183000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp_cmsr1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,cmb-element-bits = <32>;
@@ -4463,6 +4469,7 @@ tpdm@11184000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp_cmsr2";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,cmb-element-bits = <32>;
@@ -4482,6 +4489,7 @@ tpdm@11185000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp_dpm1";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -4500,6 +4508,7 @@ tpdm@11186000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp_dpm2";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -4619,6 +4628,7 @@ tpdm@111a3000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_pmu";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4637,6 +4647,7 @@ tpdm@111a4000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_qrng";
 
 			out-ports {
 				port {
@@ -4653,6 +4664,7 @@ tpdm@111a5000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dlmm";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4671,6 +4683,7 @@ tpdm@111a6000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_north_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4689,6 +4702,7 @@ tpdm@111a7000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_south_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4707,6 +4721,7 @@ tpdm@111a8000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_cx";
 
 			out-ports {
 				port {
@@ -4723,6 +4738,7 @@ tpdm@111a9000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_mxa";
 
 			out-ports {
 				port {
@@ -4739,6 +4755,7 @@ tpdm@111aa000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_mxc";
 
 			out-ports {
 				port {
@@ -4755,6 +4772,7 @@ tpdm@111ab000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc_cmb0";
 
 			out-ports {
 				port {
@@ -4771,6 +4789,7 @@ tpdm@111ac000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc_cmb1";
 
 			out-ports {
 				port {
@@ -4787,6 +4806,7 @@ tpdm@111ad000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc_cmb2";
 
 			out-ports {
 				port {
@@ -4803,6 +4823,7 @@ tpdm@111ae000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc_cmb3";
 
 			out-ports {
 				port {
@@ -4819,6 +4840,7 @@ tpdm@111af000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc_cmb4";
 
 			out-ports {
 				port {
@@ -4835,6 +4857,7 @@ tpdm@111b3000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_pcie_rscc";
 
 			out-ports {
 				port {
@@ -5024,6 +5047,7 @@ tpdm@111d0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_qm";
 
 			out-ports {
 				port {
@@ -5040,6 +5064,7 @@ tpdm@11303000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_4";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -5181,6 +5206,7 @@ tpdm@11309000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -5199,6 +5225,7 @@ tpdm@1130a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -5217,6 +5244,7 @@ tpdm@1130b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -5235,6 +5263,7 @@ tpdm@1130c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -5253,6 +5282,7 @@ tpdm@1130d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -5272,6 +5302,7 @@ tpdm@11422000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipa";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6958,6 +6989,7 @@ timer {
 
 	tpdm-cdsp-llm {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_cdsp_llm";
 		qcom,cmb-element-bits = <32>;
 
 		out-ports {
@@ -6971,6 +7003,7 @@ tpdm_cdsp_llm_out: endpoint {
 
 	tpdm-cdsp-llm2 {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_cdsp_llm2";
 		qcom,cmb-element-bits = <32>;
 
 		out-ports {
@@ -6984,6 +7017,7 @@ tpdm_cdsp_llm2_out: endpoint {
 
 	tpdm-modem1 {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_modem_1";
 		qcom,cmb-element-bits = <32>;
 
 		out-ports {
@@ -6997,6 +7031,7 @@ tpdm_modem1_out: endpoint {
 
 	tpdm-modem2 {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_modem_2";
 		qcom,cmb-element-bits = <64>;
 
 		out-ports {

-- 
2.34.1


