Return-Path: <linux-arm-msm+bounces-106918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KJJL+HPAWqKkAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:47:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF81C50E27C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 528673019A15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D65139E6F0;
	Mon, 11 May 2026 12:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7/Yqea7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6/jC0W4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCF739F16D
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503474; cv=none; b=pas4wZnwsSjn9wv2Ux3URA6Yqk44csnusBAdAgsLLakxuK0FGlj66+jp06gn0dhZtEdGeXxZn7rP2rDZY6+qU6X8Aj3t8JO2ifw+lt9qWgHSfKFDQnQ4mOvYj/SLl1diOHdAPZLzrkwmYTK1oKT9b7RLUanVn8Kn/ZB+bxIoxCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503474; c=relaxed/simple;
	bh=noK88RejQ7TULAoLNVAOYJRaxyYokDYOmwAURCVno6M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dJCVOgsas7HiHypvRt21ioOchruaGDpOL7Gu6AjHUopdoOTsprMPvw3BhqoPv1zMZdsu7o4fudhljAJzluXoMueRsOC/A9W6m4L6vpHhXllkcwZX0PPrsmU8zdCixkPuhTizmcKEVtZSpE1mUUAnAj6qzqjwm+fFQdnc8+tBR0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7/Yqea7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6/jC0W4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B9D4tY653467
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RXe6NoXBOtmI8I4ffQqNOi
	T3eXKiCCfDhBTTD2wkPjY=; b=f7/Yqea749zusuMRugOS3hHl0X0pNYoJVNEt4R
	gK8hiBKLaDfABzgkVJ6ff/elzJSQ/4NMSKfdoUYiUJASmbrlwpPnCEDoZvDSSkaO
	pvNtRmd3I09tFVB0rnWQxY0/ynAdZ6c/6w4WJ11FzAZfPU4lFbdMivVgtsyGZRa8
	/cFW7ibYmAEosnPi6Mr983m5Bo4LPq4XV70bljU49Ic+mhWE525Jk2gxuKvKfk6H
	kHXkof2kAPmjov+0fKiXU04tRHOMFts4xOlLt9A+g1ooi12ReSy5SWbciHXe1act
	umpHRayXNTeBG4EeWbcKo4b+RcFIqv/wj1p8+e4KHy4xiKHA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xu9qtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:44:31 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7bdd1ef8648so93289167b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778503471; x=1779108271; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RXe6NoXBOtmI8I4ffQqNOiT3eXKiCCfDhBTTD2wkPjY=;
        b=V6/jC0W4SUZJ8XOqygC/jL1tYzKbZSGHwvzIQTYhpWiXEOvctTuQfbjbeFa8QLxdwP
         se0jaTEH6QDuJ27jEjK3V/XysyaWm63YeXQcUwoI5XZm0bSFUFg8dG9uwxF4N/XswATW
         GPQZ720jh+8eJVw8jP5TDHV7T6M960LUu377yWCzkQnRFfSXF3QlxvgrChJx3xl8ef0+
         ZcpvNo7+9f83awrgS9OOTYr1WmRH+w2mJXgfYTKWy1t6P50FZpexJhntUmNY9up4jIT2
         C4NlTEzo1k2SYid18/dIc9epcACyp/GHa/rsBWwoHsUT01b26r29SvXFmdYg7mPad2c9
         NlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778503471; x=1779108271;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXe6NoXBOtmI8I4ffQqNOiT3eXKiCCfDhBTTD2wkPjY=;
        b=anUEA0Q72aWqNvKqtjl7e5k5JQJT2p9uf530Oo7xgUhrYyUACTS4E6LFBIW77S7F4m
         9GNKSsF33EHEDE+HDUdeRGEza+Ua7RdZhj1MGWyPVyJELqOLZIuLAgNW3akjBbnC5VLP
         cETijT7kUUg5Zj8gKPL9V3CfUm2D0sQqbFwoutStLYtHjLOV+qWueOqmaXmKEwk2yQuY
         +ziqn+EUyK4e4TTHFQWXyT2VWOBRa3fJ5Pnj6/qJ+urGKV7zuc9k9RMP1SLzMjD0NZIl
         pM3gM3cf8FgAyBz93ceOXYCZdvmDqzxjET8yaFdJX5UtpNHc7olodlwK8iRj2bgLZJet
         WTxg==
X-Gm-Message-State: AOJu0YyjZKVcXsyAD8n8cYKp3RPBTIiz3ink6QWrIYsUQwrYmOm2YbwL
	jNyeiFwUs1kbn5DsKfF9WiRc+DjJfHMB9sZTFvg78ThEf/fPx/9YX5GlRARqbGcyisIjncMvCs2
	fz4EVtQtCb5wnWCwhQt9garvG7IskBXAOa4x9c7okFrLbWBI13HL4hh1U4hrTMzzIGPfE
X-Gm-Gg: Acq92OGIGGOfBzDJuH1cdLIcsn2YNySLoO4xdYvFM5qrKos2ZDICFhZmgL7KLPL/IkI
	OnEjdRMUdhr00o80SIfJ/W4w/zuKVdGX0x9kH4d4X9nmlUx08xEyZe+vHZosCaqPq7R/W3ZJZgn
	ovEItopPBRoBXHOxBiRahqNMbkzQWok2hZ1jG6K2v2gJWwIxl5Mat++1algxwVdf1xcbE9PP70i
	kV2xXyuzuBCv84jZLYhH9vXDcULrV+PFEp7gTy4KM14wXW85YUaubT7co9PJx9soIb7kyFxIwTk
	ctF/g3TfQ4uyxBp0c+KSeUVxazRsTxrFiyQzcA4lTiI9ft+WnTRjA5IifxF0TNanjvya+YjIEQN
	fW+VGNxceULaBYPp8C+Wh7MX81uimGFb5IqiBdyeVX6yZP4zN8DRhTMrC7J5Yi2hA3T6V5SVzpy
	Myyaeq/jlB6KHjcI/F9vM+aXv7nL1C0PJsfQ==
X-Received: by 2002:a05:690c:92:b0:7bd:5af0:3bed with SMTP id 00721157ae682-7c10333370amr85000537b3.21.1778503470609;
        Mon, 11 May 2026 05:44:30 -0700 (PDT)
X-Received: by 2002:a05:690c:92:b0:7bd:5af0:3bed with SMTP id 00721157ae682-7c10333370amr85000147b3.21.1778503470167;
        Mon, 11 May 2026 05:44:30 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm149641717b3.27.2026.05.11.05.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:44:29 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH v9 0/6] Add driver for EC found on Qualcomm reference
 devices
Date: Mon, 11 May 2026 18:13:18 +0530
Message-Id: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAObOAWoC/3XOz2oDIRAG8FcJnmtw3fFfT32P0IPoTCM0sdVWU
 sK+e91Q6B7cy8A38P1m7qxiSVjZ8+HOCrZUU7724J4OLJz99Q15ij0zKaQWs3Dcx8hjSQ0Lp1w
 4Bj6TB2NJaoiO9d5HQUq3h3l67fmc6lcuP48TDdbtnzbNvAkYiA244MG7KJCilt6/5FqPn9/+P
 eTL5dgHW+GmtpgZQapDs43TREqCVXoH0htIqhGkO+QtWmujcCRoBzJbaPiR6ZDRFoKbFIIMO5D
 9h2AM2RUSkgwgOEVmAC3L8gu0mmso4QEAAA==
X-Change-ID: 20260309-add-driver-for-ec-3fa478f264d9
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503461; l=5277;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=9i1GJWm4OIJeTC8XHqFxrwHseUOBG1giB+zkssomCkA=;
 b=/TapYJ3YwJc0t2QGxJ2qZnTHGiMLtoMYEKms609Lde9YnkRncQNldPX6I3LugBuNVAkaaNtvS
 C/ZSbYBv7VrCfsJ7lUp6RFvZ0jOrF0V1fH3njW0NGzGl23RoxxcHoBK
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a01cf2f cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=iX_g8SPVEExGA-XIGasA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0MSBTYWx0ZWRfX5y7swn9WqtoN
 k6DqdvCe37hzsiX6TNUtXDcAZfpDtqnMuZiK0od7/u62mzgUHhkP0CFWF3zDLDe/XzZYWWNMubg
 C5VUBsVR7sbUZvsDD5ylS1RKXWvGRMmdSywmIzNK8o1NLV0JVbEMUW5YBuSAadv/c8mvOj7b6a4
 mu65ER3K845A+1c70rD+ftpaEWGYEN0RchhA+SMT5+ccuNV6I/AYeDggMTKRuSkBFAaVLa20+jo
 gfTFv2jslMOGirrwMuPe2Qd3rhKis4vjLlW0c/lZQdI6mQ6Rth40mCX7/hi1F0uASfvm7nnm44e
 XOSYEDHxei77XnF6PbtXcPXIarwrAJfZG+hTjDcm+H6xuS0FXSguToZMWXpEiysvaAiCiR0OrHY
 15OPs+/6nxVJlxEJSyBgcLMzsjMg/Xru31sgfGr5OFf93XJBH/4xGCDgybMADot1d9a1I0T7C3y
 QNiPN1PPTOmRfmQIUTw==
X-Proofpoint-ORIG-GUID: Saz3sUkcHqw1ARoH0uqexBvISEQ6R6AR
X-Proofpoint-GUID: Saz3sUkcHqw1ARoH0uqexBvISEQ6R6AR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110141
X-Rspamd-Queue-Id: BF81C50E27C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-106918-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
reference boards. It handles fan control, temperature sensors, access
to EC state changes and supports reporting suspend entry/exit to the EC.

---
Changes in v9:
  - Remove blank line between i2c call and error handling in qcom_ec_read()
  - Use explicit ternary (enable ? 1 : 0) instead of !!enable in
    qcom_ec_sci_evt_control()
  - Add trailing comma after .pm entry in i2c_driver struct
  - Link to v8: https://lore.kernel.org/r/20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com

Changes in v8:
  - Add missing linux/dev_printk.h include
  - Fix byte offset typo in EC thermal capabilities comment: 0x3 -> 0x03
  - New patch: enable EC_QCOM_HAMOA in arm64 defconfig
  - Fix suspend/resume notifications inverted: swap EC_MODERN_STANDBY_ENTER/EXIT
    so suspend sends ENTER and resume sends EXIT
  - Add depends on THERMAL to Kconfig
  - Fix MAINTAINERS binding path: qcom,hamoa-ec.yaml -> qcom,hamoa-crd-ec.yaml
  - Move Glymur EC node from glymur-crd.dts to glymur-crd.dtsi
  - Link to v7: https://lore.kernel.org/r/20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com

Changes in v7:
  - Fixed alphabetical ordering of MAINTAINERS entry.
  - Link to v6: https://lore.kernel.org/r/20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com

Changes in v6:
  - Add missing includes: <linux/bits.h>, <linux/device.h>
    and <linux/err.h>.
  - Change the thermistor_mask format specifier from %d to %x.
  - Change loop counter to unsigned int.
  - Replace snprintf() with scnprintf() for safer string handling.
  - Use sizeof(name) instead of the EC_FAN_NAME_SIZE macro directly.
  - Add missing braces.
  - Link to v5: https://lore.kernel.org/r/20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com

Changes in v5:
  - Fix subject line and commit description, drop redundant
    "bindings for".
  - Rename binding file: qcom,hamoa-ec.yaml → qcom,hamoa-crd-ec.yaml
    to match the compatible string.
  - Update $id URI to match the new filename.
  - Add <linux/interrupt.h> and <linux/slab.h> includes.
  - Switch to devm_thermal_of_cooling_device_register, remove manual
    unroll loop.
  - Ratelimit all IRQ handler log messages.
  - Promote unknown EC event log from dev_dbg to dev_notice.
  - Remove redundant error message after devm_request_threaded_irq.
  - Simplify qcom_ec_sci_evt_control, resume, and suspend using direct
    returns.
  - Add dev_warn + early return for zero fan count; driver stays loaded
    for PM notifications.
  - Fix thermistor presence bitmask documentation: 1 = present, 0 = absent.
  - Fix snprintf format specifier to %u to suppress -Wformat-truncation.
  - Remove unused cdev variable from qcom_ec_probe.
  - Fix typo: "exluding" → "excluding" in register map comments.
  - Fix capitalization: "ec" → "EC" in error messages.
  - Link to v4: https://lore.kernel.org/r/20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com

Changes in v4:
  - Fix fan count calculation to use min() instead of max() to correctly
    cap fan_cnt at EC_MAX_FAN_CNT.
  - Remove unnecessary mutex lock/unlock.
  - Disable fan debug mode on ec module removal.
  - Fix issue reported by kernel test robot.
  - Consolidate hamoa-iot-evk specific changes into hamoa-iot-evk.dts.
  - Add board-specific compatible strings as per review comments.
  - Link to v3: https://lore.kernel.org/all/20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com/

Changes in v3:
  - Revamp the bindings and driver to support generic ec specification
    that works across Qualcomm Hamoa/Purwa and Glymur reference devices.
  - Add ec nodes to Hamoa/Purwa CRDs and IOT-EVKs.
  - Add ec node to Glymur CRDs.
  - Link to v2: https://lore.kernel.org/lkml/20241219200821.8328-1-maccraft123mc@gmail.com/
  - Link to v1: https://lore.kernel.org/lkml/20240927185345.3680-1-maccraft123mc@gmail.com/

---
Anvesh Jain P (1):
      arm64: defconfig: Enable Qualcomm reference device EC driver

Maya Matuszczyk (1):
      dt-bindings: embedded-controller: Add Qualcomm reference device EC description

Sibi Sankar (4):
      platform: arm64: Add driver for EC found on Qualcomm reference devices
      arm64: dts: qcom: glymur-crd: Add Embedded controller node
      arm64: dts: qcom: x1-crd: Add Embedded controller node
      arm64: dts: qcom: hamoa-iot-evk: Add Embedded controller node

 .../embedded-controller/qcom,hamoa-crd-ec.yaml     |  56 +++
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  22 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  16 +
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |  16 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/platform/arm64/Kconfig                     |  13 +
 drivers/platform/arm64/Makefile                    |   1 +
 drivers/platform/arm64/qcom-hamoa-ec.c             | 451 +++++++++++++++++++++
 9 files changed, 584 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260309-add-driver-for-ec-3fa478f264d9

Best regards,
-- 
Anvesh Jain P <anvesh.p@oss.qualcomm.com>


