Return-Path: <linux-arm-msm+bounces-114386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mxu3AYcrPGp4kwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:09:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 619C06C0E30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:09:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YBmqaRTr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AnjND9mD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114386-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114386-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C87DA303939B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11CD5334692;
	Wed, 24 Jun 2026 19:08:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F0D33263B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:08:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328123; cv=none; b=hsPNyFnm1REtiYoAqmNIH7OezSgBpvM5eTCz1Qb/MsK1Vwu2c6nEf/Qz2IFyF/JRPdwWZplczL2Ol7yXSJDQEiZu1URRlpze84VDKnQwI75ZKalTIcLsfBJaiqHZpqgErynUS/YhDJXgPY0KA054ZWNo/p7mpPcrX+Nnr7z7ARM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328123; c=relaxed/simple;
	bh=VwWzfAW5Y3rtN94V8GT+TiSFlqqWwD4sFhgs5ySHZ+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SMqTA878hcUy8PqTDgKzHAFaawbo/mA4HOpRVPMYLHQ+imYc5IRlfDoMXZjSsz/+nMJokmwyF3z33aNhbc4t+m6M5QKNuFAyzulF0PMFKY/fnTe5CkZDC8WcPGXmwklbv+PMky+XauzyZuloZosTBUQkMPtyIrIDS96P47lrJ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YBmqaRTr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnjND9mD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OITIsr3666420
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bcLj/8grHtyEunak906CP6boFR5bOdJvWa5
	DwUNzQYA=; b=YBmqaRTrsnQ4Ez0Z227rNEchLw2VBUhRvOb5VbXVwMLU7xTFGpH
	Dy9u0Aa33RqjJyp1zb1/31/q2Xo3EPQbSPz4XlODXxNsXqs8YKozyQ1VUS8uCB0B
	KaABOIyEPB8ubunVIRvskg5CaDMqBXgOG+njg94mvmc5iVQEjomyUF94DMAi1gEc
	tKVV0cJwSqD3fBsINMxh2ZkWsU/1mSAG0z6zhyrP9C37/f+piUTG20oq+U+myvQT
	Ke9F/v47H3vZ22r0YdtGhdoMzB/qI9yPj4z8TLqIfn5X/jH4FCyQOk1TOatfUuv6
	8vjhVtdCvRr7IrEwRBQ6P+xRaQ/iEYyiowg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbr50m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:08:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845438fbd9cso1382252b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328119; x=1782932919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bcLj/8grHtyEunak906CP6boFR5bOdJvWa5DwUNzQYA=;
        b=AnjND9mDRqwhQCATsUkHaH24oblxUvFqjYWDNWzjwnTpXcpR1OZ9RpTER3WbfT1Jap
         DT4Wkf6dUX9EgfJPSb5/BWwAdCOybN2j0rinkRPrpgFz4LSc3EAJeq+n8nsL3TxZFtFr
         lmWDnln/3IZGMlwvlmGjv9h8FVq2Cuh5MeY7DSVEThJB58YdNsJT02VtkSPkS8KbSP1E
         Jr6nQp62VbG8K6aRkEI1uEA7GnzzRnXvuWtqAwajQozFx5wO0ICRYQDx4H6a6OU56jNQ
         jsilXtvyvgEcFs5eVfVPoZ7FgeEQ2+9hTKBIgUQQAS2x/rLPNafFcTN2sMag88VWHkyB
         D5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328119; x=1782932919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcLj/8grHtyEunak906CP6boFR5bOdJvWa5DwUNzQYA=;
        b=RN5/SS+lwG+WH9h6qIg/h1LFFGXJx11rLXoltgxIa4T1Nz94AE8DQ8qNIxPQzpV3US
         MUwHT9avi5ZKfoBXAYw29c4WAflBfhsf5B9B86iYWxLnXzytcxA5kr0ErIYVzKYTzu43
         MCkTSKvVax3HyqBhwtV5SlPfdBvM9iUEfO63pvmZBrUsTzHCxx19UQpayQfnzq6FFvA6
         GufVAgwKdRDZEhfrbw0Uv+CX8oh4xjJw54UjvgSJmeFJ9lt5fzZY1k6c07qRtjVtgFqn
         0ljOxV+ijr1jA30F4VaqDu9/mBaQHlutiToxSHJhRDA2jmnTP+Z3RyQW30cZOi/4VmSt
         9epA==
X-Forwarded-Encrypted: i=1; AHgh+RogYZOwsGWvHWu7lqxrGUr55h88CMFCTQPN1zLlZMAtT7J0HLXhSTatAKVWG7iC5ubBz5mOUZtyrqy2LJsE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg2aoOrc7iPFvwLKeQDJKuZXBEPkRYRDr4bhyXHHvuJoRWkqMI
	P0lzyewppZrm9gYNuRlrKjllu/NxUJdWGAt0qlbstPCtMxbhkSAKQJqHK/EPNyl+QH9/PNdgeGu
	s3ULrt7ZtT8lXKgfGs4rc1/xSt7gpEz+kHq2Tw/CaoU72bmIjmRUus5G+5tmA6xlVKruh5qLaL4
	VJ
X-Gm-Gg: AfdE7cm9orgVM3oVGwSlKQjYcu4XNmQ05mAfPbd+gYLbYNjVYJFe8QHvQvYDPc+3s2r
	YQhfGGYOIOCWtraEeHei2kqZKv7rrhQXHZQk8c7BUkBbciLClf/5t4C31lQ8Cufs0g4ZETCcWV0
	Nr7UFqzZIax0k7miMUBmmCRY7q9KEHFMF+zlmjyCjWog+A7q/t7Q7JKWIHUndrBzgO8E5jl2WnF
	Jtj1gSvwkW83+ibPJ6ljeAn/b1IojlNrDtE+DdPBJhdFgZu3Rg8x5hqQlrb3dhlVCQpat/KGPwX
	rZC9LLZBPqdFLqq8ca2bq5qvlh+mPKbW94gFU3ujYfgp0gCV6yQtNG+zU7BvNRJog3qqbkTnjsO
	lOLDKxrKmkdSu09K/U40wxsQzmGJ3nrMdOw3BkQ==
X-Received: by 2002:a05:6a00:182a:b0:845:2f67:a0e6 with SMTP id d2e1a72fcca58-845a2ca7ccbmr5417319b3a.46.1782328119308;
        Wed, 24 Jun 2026 12:08:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:182a:b0:845:2f67:a0e6 with SMTP id d2e1a72fcca58-845a2ca7ccbmr5417279b3a.46.1782328118722;
        Wed, 24 Jun 2026 12:08:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:08:38 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 00/19] firmware: qcom: scm: Add minidump SRAM destination support
Date: Thu, 25 Jun 2026 00:38:11 +0530
Message-ID: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfXxOgiIue//GuU
 G4F/u1EOmTq/GVXbQ3pwcADAY9py8tpvvL7NoHGFBI7ml0epG0Nm4JspJtmY388qOtRnKAVycrf
 VFoWQYpS/W3gGYb5YvsAI2pkx0e0Itc=
X-Proofpoint-ORIG-GUID: mIcgDTHGRtRLTqu7rB8F0zQVYXxJrz05
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX/kkAvLCQmkRJ
 WETgXBEjMNAf3J2KUpfXn3dpeMEE2M+sXaFggVhkBqjnFrx+8iGrpcL/TzIekWypK1eaqR5wjzz
 cyXR1XD7H+5aZDHs1w+OJmmnA2wHCwaAN1XwBJFFCa72HOpry2CH39Y0VPrTexeTzCAm0CuunaR
 OUaxt2iMBe3h0vkaPQEVtB7+OxBG5EQby44I3BO7ukhTXTGDZFTlr8anSU4PeBlMtVTo6Redte2
 2261H03Kw38RJHbKc6zBdjJf2eLF0OgoNVYA4vu0r5SIyc2avFGL35HIzPhFwx73CXgqyeA4GCb
 eAj72rNROhCRFyAEVRTx4YmRqPmANfFcvDOb80+f6zHiUwRJGbkgwP/VQudSX3lYp2pai6cCENq
 vyLsaLHhS9FScAO5PnYuK3YiZd9ioA==
X-Proofpoint-GUID: mIcgDTHGRtRLTqu7rB8F0zQVYXxJrz05
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3c2b38 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CSD38U4Wc0CwKdJc0hQA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 spamscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114386-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 619C06C0E30

On most Qualcomm SoCs where minidump is supported, a word in
always-on SRAM is shared between the operating system (OS) and
boot firmware.  Before DDR is initialised on the warm reset
following a crash, firmware reads this word to decide if minidump
is enabled and collect a minidump and where to deliver it:
destination (USB upload to a host, or save to local storage) and
OS is expected to select one destination.

This series wires that mechanism into the SCM driver:

[1]- The SRAM word location is described via a 'sram' phandle on the
  SCM DT node.

[2]- Add minidump-sram pattern property for older soc which supports
  minidump destination support.

[3-4]- Trivial change for consistency.

[5]- A 'minidump_dest' module parameter (default: usb) selects the
  destination.  Custom kernel_param_ops expose it as the human-
  readable strings "usb" or "storage".

[6-19]- Add the support for Kaanapali and other various SoCs.

Change in v4: https://lore.kernel.org/all/20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com/
 - Refactor commit text for 1, 2, 5.
 - added new commit(3/19) for existing  issue reported by Sasiko .

Changes in v3: https://lore.kernel.org/lkml/20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com/
 - Addressed some code improvement comments.
 - Removed example from scm binding.
 - Added minidump-sram binding which follows qcom,imem binding.
 - Added some more SoCs which supports this .

Changes in v2: https://lore.kernel.org/lkml/20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com/
 - Remove the restriction on the binding change done in v1.
 - Remove sram-name from binding.
 - sram definition is introduced and merged, so removed the refs from
   v1.
 - Minor change in the log as per comment s/find/get/
 - remove reference of sram-names
 - use minidump-sram instead of minidump-config.


Mukesh Ojha (19):
  dt-bindings: firmware: qcom,scm: Add minidump SRAM property
  dt-bindings: sram: qcom,imem: Add minidump-sram pattern property
  firmware: qcom: scm: Fix missing smp_load_acquire()
  firmware: qcom: scm: use dev_err_probe() for dload address failure
  firmware: qcom: scm: Add minidump SRAM support
  arm64: dts: qcom: kaanapali: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sm8450: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sa8775p: Add minidump SRAM config to SCM node
  arm64: dts: qcom: qcs8300: Add minidump SRAM config to SCM node
  arm64: dts: qcom: qdu1000: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sm8550: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sm8650: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sc7280: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sm8350: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sc7180: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sm6350: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sm6375: Add minidump SRAM config to SCM node
  arm64: dts: qcom: qcs615: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sdm845: Add minidump SRAM config to SCM node

 .../bindings/firmware/qcom,scm.yaml           |   7 +
 .../devicetree/bindings/sram/qcom,imem.yaml   |  16 +++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi       |   5 +
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/lemans.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/monaco.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi         |   5 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/sm6375.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/talos.dtsi           |   5 +
 drivers/firmware/qcom/qcom_scm.c              | 120 ++++++++++++++++--
 17 files changed, 201 insertions(+), 12 deletions(-)

-- 
2.53.0


