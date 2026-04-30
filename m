Return-Path: <linux-arm-msm+bounces-105304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IYyNuYZ82nNxAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 10:59:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8041D49F8FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 10:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B6913007518
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 08:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A371D3FFAB2;
	Thu, 30 Apr 2026 08:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQFxpq9h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J12A6otc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175223FFAAD
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539551; cv=none; b=t9QthadkKazYNjTjEKQDHr4EmDBwhrcQlzNvZCeZB/T4/fIGzCgMjG+8S4VYV2wvvXkraakVNO2l50gu45J4RgnF+I+XwzIJANM2ywIB81EI5MrCO0kxY0V/Ezxa/I/OTGDfDJWDa0qPMqPQJnKHlT1cvI+3+oIuQqyzzie7dUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539551; c=relaxed/simple;
	bh=WIsZ63sCQ64dVMlhv7s4p6idYOqkQ1ABcVo8fUUo5wU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SN4IeB/x/2Fo7lraAXu+eKPhyMjFbsCSPVi8f86x+gtVPwfq1hNsX0ZDr3insQmrQaIUuBUC219yiOlkQokdC/Hl8ONY3OQl7hprlj9TEYxLcGC7Z2Ga56M22Ginn8z+th3wSCD2reSTALikipFPX0yJh+Yaqxewhcp+HtFcKbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQFxpq9h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J12A6otc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U3HC5o3729474
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 08:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9Rksv4cSEYx49OcGoEBr2k/skvGa3ntd8d7f4HoDII=; b=kQFxpq9hKjnC4RXU
	xRBMvX3Wr12/kMtQRVG8kaaQtnYAVJhedcXnLWSsfbHN5dsoTSV6EQ2ndJSHnnV8
	5YB3r/OcbmSeOAxUnd85SgyEkjWVOUStgAmv6MtrL2eHvFpYT1XX46cTJScxjBq0
	jawQB7Y6eoi14rUarHEt+K+HOppK/zozFAxfDaA/xHf4RCRydlCXXc5svLCZLojN
	EjlBNU88R4KHOS4msTdhVIdz9WWVztQGn9zu1SsMK3iuhhcVe5BdgZSEu5bP+2ep
	eXlWX4hrr52I+BBR36JFysNwGtcWGcVKXVIBsxlpX7qCwuicq92c1iD7uTpZ1Fig
	t4k14g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duy1w93er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 08:59:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35dacc40f92so711331a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 01:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777539545; x=1778144345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9Rksv4cSEYx49OcGoEBr2k/skvGa3ntd8d7f4HoDII=;
        b=J12A6otcU3OJ6bCve0Nk28kjw9oklr7VD2iIeg3opSlzpwWhuU/F5DTW1F5WJeZPoS
         w6uqa2nN2mg5MwaJME6koDt/+B1uxsISomALi8UIi6qyKNsuvHKTMV0bhNSj+D1VAnLn
         /CB1pYyTIwoNBC2ef5+IlWu15Ffsj+xarCk8177VVx/Vw2LbBSHTlOqu4PvTcqSMjC8+
         H8AGgZTlMzg0xSQBxUN9AwDbxBaJWWKtALSJZdTnd9tAJTbOOUGlxUw3BBrshjfIy3Cr
         rapoS/W1PbojQrM3UquaV95tfZpxMyjVIIqSnA/i6XudmAWdRc5IIK0TsVTraZTDsGvE
         k0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777539545; x=1778144345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R9Rksv4cSEYx49OcGoEBr2k/skvGa3ntd8d7f4HoDII=;
        b=GsyzT3LxnugDC+NdSszhwW6fSha5+pnWTOweW+d3N6Qe+UYE9hU9ss++Zz4vYUJ9Sz
         o7jDf6kiZw5ZcVU1HFDIi6nebN826Z4fQj4IAn+P6WiMRHVH7kgsJgCGSILTVwcQBOCJ
         zrID5YGsD0IZlaPo2m5UYy9Zy/xX6hwNlbl5JAuTaSh1dZO7HIe2oIU1bTrIiysyCmSP
         Dr4JNEii8lBFqQe6sI+iKPtJXy3Ceca/ySzN3bNKZfJ1/T505cKADyP/evesjmK3Gpfl
         /MTz5+Ne+qD9/tIUw8zOxcEi8vFS9Xg9pfZHX+ENfRSDVehfypPs3X8ZZyGHk/6P4E64
         dJ2A==
X-Gm-Message-State: AOJu0YwFxEkOXTfOahoqxv7Ynrk+krm9z96P4cs1mqvXrSY4dd/pR7Pm
	n6yVZPDoPr7EBYgu9vNnOPYr7bNkcKKQwuhXWIj3C0Og5mrX3sMK96319O1A83QA5oCZ4p8keYZ
	2L0QNl5uJm5uJHE1td+ufk3G6PQSIQXQOHpkV8U8XNVFJDW+QmtXNlEGM4tEL1P7sNJRN6tR3wD
	cz
X-Gm-Gg: AeBDiespZLxqVBVJV4rQ79WCgfSPCXgld9i6VVrkc217OB1/0g8GiAssA1iBxejqNkO
	zZdjVESwehJ2DLrNPAGa42nN2TxhEnJr7SMSZ7/TmY2B8DsYWzcpDYW6r5CSGE76ZwyvqBoKIPW
	pE4sLqiy+YJfHxSKHpGxaAAIOPDyVIybjuEjRo+5hhIQrXMjRRnpW1Ps2gRGewRfoaMPkWgBokb
	AeOsi7HG3jkZCRV9A2XZS0faTzORG6sQWZm0R6R7XvDQ2RBiOYOtWbfPUL+9Ks5FHNeMDinA9Ve
	I3JCp11VWvSBPhUHYSdq6y8+3dw2wo0Xvysy9q28oSg3m1v1vSe5RPVIoDPsFBy2tnSLdGBmTyb
	wUIu+xB3Z5LtxvxNDEyZqyUiZ0l/k9Oecl0YL56qoKjA9+nBsZRQ=
X-Received: by 2002:a17:90b:3e4f:b0:35b:a7be:ae47 with SMTP id 98e67ed59e1d1-364c30d1566mr1898822a91.21.1777539545482;
        Thu, 30 Apr 2026 01:59:05 -0700 (PDT)
X-Received: by 2002:a17:90b:3e4f:b0:35b:a7be:ae47 with SMTP id 98e67ed59e1d1-364c30d1566mr1898801a91.21.1777539545049;
        Thu, 30 Apr 2026 01:59:05 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bd5249c9sm1267312a91.1.2026.04.30.01.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:59:04 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:28:56 +0530
Subject: [PATCH 1/3] arm64: dts: qcom: Add header file for ADC5 Gen3
 channel macros
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-adc5_gen3_dt-v1-1-ab2bb40fd490@oss.qualcomm.com>
References: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
In-Reply-To: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777539537; l=4937;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=WIsZ63sCQ64dVMlhv7s4p6idYOqkQ1ABcVo8fUUo5wU=;
 b=QOC9EeFFaX6PTF3JbdlJ2kBDpnzrGCC7HCvHt0VHIHW6z+vtT5e+JwEcxoYdA7hzS8ISwNlHW
 NIyZseYh6sTAjPxgaKWmawYWHJoMpp3P2KN+Ql8gqAgP7eEdceF1Ajn
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: S0eMB_TOZZIx7ZcxvH1-bjLBvpKCipNJ
X-Proofpoint-ORIG-GUID: S0eMB_TOZZIx7ZcxvH1-bjLBvpKCipNJ
X-Authority-Analysis: v=2.4 cv=DPy/JSNb c=1 sm=1 tr=0 ts=69f319da cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=uKufQnq3ocnfyFJwv7kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA4OCBTYWx0ZWRfXxawIUpl7I36R
 vElAYzx57RfGzvBvFyY18nS/MwVAoEIpl0eCD04JYP8fKgHOVVsfIaF7twO9j4M8T0YWwYg+X13
 pH6RcAZsR3CAXU9i+viyffObiHcTNPEzZ5O93mWP++IWnokxPIKuPH0R8uHo6PXVF/x0KuF7aKA
 9oP1T1h3QGXbL124dHaJdTResGNd2AyndNCZQYU6xwaikQ81C/scpCEsQz32t3XxZ6rnh0tcPDz
 l8ckXPCr4adGwVSj+ryxgPlfw1/l1r10MEvVTNlkTeueiZaDV8sYqJkmC8H7uemq/LfV4r9ylvs
 CDmC+P1MuCkUbIOeLYGaPEg1BNLcbbUSW9VRc67rrH1e11Tnt/qu2bcxpCeaSLiJg2s+Z6ie+HP
 JSHeqP/+w8/UkS8+Pg6gU+GZm01dthDLq2J4KSA1V7xVHPxIFc0G75j3E0UiGhBW9RhIAiklEtq
 OIEIkP7bd5wpCQwgF4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300088
X-Rspamd-Queue-Id: 8041D49F8FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105304-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

Add macro definitions for virtual channels (combination of ADC channel
number and PMIC SID number), to be used in devicetree by clients of ADC5
GEN3 device and in the "reg" property of ADC channels.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h | 88 +++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h b/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h
new file mode 100644
index 000000000000..aa8e54d7e786
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DTS_ARM64_QCOM_ADC5_GEN3_H__
+#define __DTS_ARM64_QCOM_ADC5_GEN3_H__
+
+/* ADC channels for PMIC5 Gen3 */
+
+#define VIRT_CHAN(sid, chan)			((sid) << 8 | (chan))
+
+#define ADC5_GEN3_REF_GND(sid)			VIRT_CHAN(sid, 0x00)
+#define ADC5_GEN3_1P25VREF(sid)			VIRT_CHAN(sid, 0x01)
+#define ADC5_GEN3_VREF_VADC(sid)		VIRT_CHAN(sid, 0x02)
+#define ADC5_GEN3_DIE_TEMP(sid)			VIRT_CHAN(sid, 0x03)
+
+#define ADC5_GEN3_AMUX1_THM(sid)		VIRT_CHAN(sid, 0x04)
+#define ADC5_GEN3_AMUX2_THM(sid)		VIRT_CHAN(sid, 0x05)
+#define ADC5_GEN3_AMUX3_THM(sid)		VIRT_CHAN(sid, 0x06)
+#define ADC5_GEN3_AMUX4_THM(sid)		VIRT_CHAN(sid, 0x07)
+#define ADC5_GEN3_AMUX5_THM(sid)		VIRT_CHAN(sid, 0x08)
+#define ADC5_GEN3_AMUX6_THM(sid)		VIRT_CHAN(sid, 0x09)
+#define ADC5_GEN3_AMUX1_GPIO(sid)		VIRT_CHAN(sid, 0x0a)
+#define ADC5_GEN3_AMUX2_GPIO(sid)		VIRT_CHAN(sid, 0x0b)
+#define ADC5_GEN3_AMUX3_GPIO(sid)		VIRT_CHAN(sid, 0x0c)
+#define ADC5_GEN3_AMUX4_GPIO(sid)		VIRT_CHAN(sid, 0x0d)
+
+#define ADC5_GEN3_CHG_TEMP(sid)			VIRT_CHAN(sid, 0x10)
+#define ADC5_GEN3_USB_SNS_V_16(sid)		VIRT_CHAN(sid, 0x11)
+#define ADC5_GEN3_VIN_DIV16_MUX(sid)		VIRT_CHAN(sid, 0x12)
+#define ADC5_GEN3_VREF_BAT_THERM(sid)		VIRT_CHAN(sid, 0x15)
+#define ADC5_GEN3_IIN_FB(sid)			VIRT_CHAN(sid, 0x17)
+#define ADC5_GEN3_TEMP_ALARM_LITE(sid)		VIRT_CHAN(sid, 0x18)
+#define ADC5_GEN3_IIN_SMB(sid)			VIRT_CHAN(sid, 0x19)
+#define ADC5_GEN3_ICHG_SMB(sid)			VIRT_CHAN(sid, 0x1b)
+#define ADC5_GEN3_ICHG_FB(sid)			VIRT_CHAN(sid, 0xa1)
+
+/* 30k pull-up */
+#define ADC5_GEN3_AMUX1_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x24)
+#define ADC5_GEN3_AMUX2_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x25)
+#define ADC5_GEN3_AMUX3_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x26)
+#define ADC5_GEN3_AMUX4_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x27)
+#define ADC5_GEN3_AMUX5_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x28)
+#define ADC5_GEN3_AMUX6_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x29)
+#define ADC5_GEN3_AMUX1_GPIO_30K_PU(sid)	VIRT_CHAN(sid, 0x2a)
+#define ADC5_GEN3_AMUX2_GPIO_30K_PU(sid)	VIRT_CHAN(sid, 0x2b)
+#define ADC5_GEN3_AMUX3_GPIO_30K_PU(sid)	VIRT_CHAN(sid, 0x2c)
+#define ADC5_GEN3_AMUX4_GPIO_30K_PU(sid)	VIRT_CHAN(sid, 0x2d)
+
+/* 100k pull-up */
+#define ADC5_GEN3_AMUX1_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x44)
+#define ADC5_GEN3_AMUX2_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x45)
+#define ADC5_GEN3_AMUX3_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x46)
+#define ADC5_GEN3_AMUX4_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x47)
+#define ADC5_GEN3_AMUX5_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x48)
+#define ADC5_GEN3_AMUX6_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x49)
+#define ADC5_GEN3_AMUX1_GPIO_100K_PU(sid)	VIRT_CHAN(sid, 0x4a)
+#define ADC5_GEN3_AMUX2_GPIO_100K_PU(sid)	VIRT_CHAN(sid, 0x4b)
+#define ADC5_GEN3_AMUX3_GPIO_100K_PU(sid)	VIRT_CHAN(sid, 0x4c)
+#define ADC5_GEN3_AMUX4_GPIO_100K_PU(sid)	VIRT_CHAN(sid, 0x4d)
+
+/* 400k pull-up */
+#define ADC5_GEN3_AMUX1_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x64)
+#define ADC5_GEN3_AMUX2_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x65)
+#define ADC5_GEN3_AMUX3_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x66)
+#define ADC5_GEN3_AMUX4_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x67)
+#define ADC5_GEN3_AMUX5_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x68)
+#define ADC5_GEN3_AMUX6_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x69)
+#define ADC5_GEN3_AMUX1_GPIO_400K_PU(sid)	VIRT_CHAN(sid, 0x6a)
+#define ADC5_GEN3_AMUX2_GPIO_400K_PU(sid)	VIRT_CHAN(sid, 0x6b)
+#define ADC5_GEN3_AMUX3_GPIO_400K_PU(sid)	VIRT_CHAN(sid, 0x6c)
+#define ADC5_GEN3_AMUX4_GPIO_400K_PU(sid)	VIRT_CHAN(sid, 0x6d)
+
+/* 1/3 Divider */
+#define ADC5_GEN3_AMUX1_GPIO_DIV3(sid)		VIRT_CHAN(sid, 0x8a)
+#define ADC5_GEN3_AMUX2_GPIO_DIV3(sid)		VIRT_CHAN(sid, 0x8b)
+#define ADC5_GEN3_AMUX3_GPIO_DIV3(sid)		VIRT_CHAN(sid, 0x8c)
+#define ADC5_GEN3_AMUX4_GPIO_DIV3(sid)		VIRT_CHAN(sid, 0x8d)
+
+#define ADC5_GEN3_VPH_PWR(sid)			VIRT_CHAN(sid, 0x8e)
+#define ADC5_GEN3_VBAT_SNS_QBG(sid)		VIRT_CHAN(sid, 0x8f)
+
+#define ADC5_GEN3_VBAT_SNS_CHGR(sid)		VIRT_CHAN(sid, 0x94)
+#define ADC5_GEN3_VBAT_2S_MID_QBG(sid)		VIRT_CHAN(sid, 0x96)
+#define ADC5_GEN3_VBAT_2S_MID_CHGR(sid)		VIRT_CHAN(sid, 0x9d)
+
+#endif /* __DTS_ARM64_QCOM_ADC5_GEN3_H__ */

-- 
2.43.0


