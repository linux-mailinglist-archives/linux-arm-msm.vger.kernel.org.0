Return-Path: <linux-arm-msm+bounces-101233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YhkgCry8zGliWQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:35:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3C73753F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED35A3001B6B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 06:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E21032E757;
	Wed,  1 Apr 2026 06:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPbHFyjt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EbcunRjf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B4B314A65
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 06:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025337; cv=none; b=QchoxL+EUtIhfExeJIeAl++vCQytl41YoqlQmMgOAZ8OnkbSyEa8NGsFpHI1YNe9EVN1RabTWnRd58EuJHDgpGhx8kHHFWQSS+32RKeGcE4/fZZzbhoFrTzeV/123TdfDeXESSx8YeMlWkywnJoGj3agKEazI6w1U5nhXZ/uews=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025337; c=relaxed/simple;
	bh=pZgJfIlthTCYN9wLzuXbK0NjilNyt3lBCh93LAZc1mU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kGDyMmgaDdd4fksbD5sRhCl2A9mASQYKs4D0/y97Fy/VsZHbbLqNhP4KsKgsrzdOGulKsm9ajZ/Ocg2w25lcYcMuCer9bSwNKheUsPI026XX5QIydZuF7+v/b1srcK9DAi4BLiboajyX41iQcBZK8bpxhJxnMsbzUI5SY+Akdoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPbHFyjt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EbcunRjf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6316IVd43104016
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 06:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z/Xwg6NdWjuQ2U74auSCsp
	9k1g83Vjj3epMh9+/ls5g=; b=KPbHFyjt4rpCpD516jII9Yr9s2UkqTCBIWbdwU
	qOs08qv4e3WuO9ns/wKKo6Asyt9oGf0TEgl1UAJUSVc/xGNO9D0dkbpqgkRfVidW
	ghsrl3jltmfaQ7QGNuBPlYU9Wac3rf6XvlLOymuh79j+xxB6fDrsbr3g5x9OOJav
	XwUn3dTWrpnRL+g4QTEkB/8YQY7ZT+H++ugVI/CQGro385N3i4Se4ncI3K1raCHn
	GfUUVL6pHW+PTWcBvFfBhX0J6NElmcETKE14p9SqOY8XzlYIh+wiyTmYc5BTvUQr
	v4/pRJ9IrmZIlWJg4NLBO+OKuTA411JGNtiuTyfNPxDo8AhQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js22vmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 06:35:35 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-127337c8e52so11603992c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 23:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775025335; x=1775630135; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/Xwg6NdWjuQ2U74auSCsp9k1g83Vjj3epMh9+/ls5g=;
        b=EbcunRjfg54flc1c2L5a96boowEmgsgSm/sBEcmbjS5+AoICTtqlMwrLJrqmc/+ezM
         X6OPtf7rQYvHa+qOO2JkzYsXPDxJaNJf+PrpWT11B2EqpfMjrvnFwU89u7Ic5D5QWmFo
         ZNZ9cwLDbtmCpfsPnKCAEORRycE04MnYS3xUEmn1GsaNKs8CPTBgG/pIN/92DxVThSTB
         Ki0fzVHU9WltmlMQvqJ3Ddt1eWJ9sixdE9fGcFnVROf+KsdHqksVA58tEBWQGsEXTb0w
         0TYbyFyebjPyi57UQN4u3nHvcf7o5vv2KOVNaF2aIQlMyfO1pTNCWKTt0/vfyaio2te0
         THlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775025335; x=1775630135;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/Xwg6NdWjuQ2U74auSCsp9k1g83Vjj3epMh9+/ls5g=;
        b=Mlr4xY3vhXY4+c/oPfE60QR2aN5cyYI9gt+OUakFyOsq0o9E4Ulyqe+saU46hke8OY
         on4ky5Y/gxwrorn/BuCJT94iPlzhinYWp7WmLxGynnG+EJwcFjlNy/3AEq0VYVSnhD3O
         EdrwdiFkj/mYdeG5f2mwzUgZDkNLvXQCU97lMYx9rbvwqah692VxzhrQvRPUAb24wajD
         GnlvlNweYTI6yuUAkfMMbVuy6uCwydq8gjweDXe7oepSEL9ezSSIVqA8XU5t28d4Mp5n
         8ig3go+scwlyON5nd/Hpv9PNAdXmqtl7Vrq/unl2xon1NdCZE5bLe0z5ZQoUKFMFjLhm
         3/Tg==
X-Gm-Message-State: AOJu0YzDHzIqHM9gHPwICsMbLTdJwlAhH4Cp9js7tyu6o/921zjCOEWr
	8mZbUZkCLpVT5wy/KvuxOm3uPWM9gnbjOg1suRwp38nkQ4eAAZ9XMaK5ef6DJl3ESdkk/FywL28
	NNGbkLCa9xE72rP/7FVyQDypwBDqApP/sNNASAiSIUfllTCeFahwa6s11Qm/+Ng0GOm9e
X-Gm-Gg: ATEYQzwlLWDEYy844ld27v3QNZAf6fJNzCxAoCtxkr9XxPNRdJGlZGDq1bFgbweUf70
	UheJb/05xPsFdlQ/UWTv1Cl4zqTq25reXjRPBHWtmlsC10radZyttRjFIr3YtFzZQHL173maesE
	J+MQ+c5Bl5/qcvbL/w+N2erv6G2/tc+GaOgIiI8SHby8q3Y8egFEtT5K7OrcrWgCtEmoUV9eETB
	LNWuBo1jUek+1VR+NcQKAL16iz+32nA6r2KCXIxvPzA+1t++SmVuCYh7pU1/+MJ602t61fz/+3l
	tPaYzzY+MB9wNFFGfeNI+5vW6mm6Snbv2gMhJqJG1FHxaGbZHfXNSNyu/vQ1EgrY7MmXxycnBTW
	V9MVK6bYd5ZWfi5h43dORjklODkP0PnxJFebZoKzE5vkGOwE7TuKXqWsu5y9gkPzw9bGm
X-Received: by 2002:a05:7022:618a:b0:11b:7970:ea3f with SMTP id a92af1059eb24-12be6578552mr1536506c88.25.1775025334501;
        Tue, 31 Mar 2026 23:35:34 -0700 (PDT)
X-Received: by 2002:a05:7022:618a:b0:11b:7970:ea3f with SMTP id a92af1059eb24-12be6578552mr1536483c88.25.1775025333824;
        Tue, 31 Mar 2026 23:35:33 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97f6994sm12027550c88.8.2026.03.31.23.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 23:35:33 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH RFC 0/4] clk: qcom: Add common clkref support and migrate
 Glymur
Date: Tue, 31 Mar 2026 23:35:25 -0700
Message-Id: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK28zGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY2ND3cKi1LT4svySVF3jNGOLJBOzFFMLE3MloPoCoExmBdisaKUgN2e
 l2NpaADYT16dgAAAA
X-Change-ID: 20260331-qref_vote-3f38b46d5847
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775025332; l=2248;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=pZgJfIlthTCYN9wLzuXbK0NjilNyt3lBCh93LAZc1mU=;
 b=eK8hXo8iF5pBml20zvFA/MQ11chaCiG20yvmVZ0FOCsH2NDyKH08/z8TSXPXmxtA//TuxYMyq
 YcA4Rc1c0doCWSeDwd6IFvoEDW1HptLP8FhLcVUWBUPNZNX8KkFBAbM
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: hXHKZWmVqPkcDS8jqrkwPn5WPJEAfFt0
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69ccbcb7 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8 a=gTLHQjeEnPAAWBE9dSMA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA1NiBTYWx0ZWRfX4AruYQlwu8OH
 Cngx/2jGs1nObdfhmp3lULzz2Gxh7/gfdKEPYBYO0S2yJvRY+pXn0p1om4UcG6IEPngD7Cgj2Ic
 ANDrn2u10KL2JHxWM5bRPxHEo+d+OfTqECndEvzOZN+dg2BwqNFa5DEditEcZ3V/VRQWrmp+yIT
 Y9m1/D0B20LcdEkCE68525unQ4Z2ryfCjHI8N4de1HNCTX3TQegFdeTOKjf4fKTe+W5Su4lymLj
 7YJzSSEucslctFPVvxlKlDgCA2tKejXpaaFZ0M1mQ5wRuz68tQPL9o0ClrhRzS+IEs99+VxzrkR
 cC9/k0syWl4YunUWW9dgwIUZWTUgA8Oj6xMcnGOUjC+omS7TS7vq++g5ol9WPuPY8wAzZ8dCkvR
 3aDE7jHjGQabKORCcj8akOaaQhGpCVKy85bNUE84JHiL3fbY5v83o/NXUpphiQ4qThZasWjmOUh
 Abhv/dXMxleWOyrBnEw==
X-Proofpoint-GUID: hXHKZWmVqPkcDS8jqrkwPn5WPJEAfFt0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010056
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-101233-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E3C73753F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds a common clkref_en implementation and converts glymur to
use it, along with the related binding and DTS updates.

The PCIe clkref clocks on Glymur gate the QREF block which provides
reference clocks to the PCIe PHYs. QREF requires LDO supplies and a
reference voltage from the refgen block to operate. The refgen block
itself requires vdda-refgen_0p9 and vdda-refgen_1p2 LDOs to function.

Previously, these QREF votes were done in PHY drivers. In earlier
discussion [1], the feedback was that this is the wrong ownership point:
those supplies are for the QREF controlled by clkref registers, not for
PHY directly. Based on that feedback, this series keeps the regulator
handling with the clkref control path.

Another reason for this series is reuse. clkref_en registers may live in
different blocks across platforms (for example TCSR on Glymur, TLMM on
SM8750 [2]), while the behavior is the same. The common helper lets each
driver provide simple descriptors (name, offset, optional supplies) and
reuse shared registration and runtime logic.

[1] https://lore.kernel.org/lkml/aEBfV2M-ZqDF7aRz@hovoldconsulting.com/
[2] https://lore.kernel.org/linux-arm-msm/20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com/

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (4):
      dt-bindings: clock: qcom,sm8550-tcsr: Add QREF regulator supplies for glymur
      clk: qcom: Add generic clkref_en support
      clk: qcom: tcsrcc-glymur: Migrate tcsr_pcie_N_clkref_en to clk_ref common helper
      arm64: dts: qcom: glymur: Add QREF regulator supplies to TCSR

 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  26 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  19 ++
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-ref.c                         | 202 ++++++++++++
 drivers/clk/qcom/tcsrcc-glymur.c                   | 340 ++++++---------------
 include/linux/clk/qcom.h                           |  69 +++++
 6 files changed, 409 insertions(+), 248 deletions(-)
---
base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
change-id: 20260331-qref_vote-3f38b46d5847

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>


