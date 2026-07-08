Return-Path: <linux-arm-msm+bounces-117786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bBJRIyWWTmrPPwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 20:25:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE57729797
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 20:25:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S0J2K3OD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HWMhLB3G;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117786-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117786-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 672A3301BC18
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 18:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA663BADBC;
	Wed,  8 Jul 2026 18:25:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E1E3438A2
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 18:25:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783535125; cv=none; b=FTmoXqaO/fAErTsmIM4aBz/vXAexyLivJSAuyLjSROio8tSYt0H1F5fidDzktZqBuz3M7r5pRynRV6AsdGXKW0G07gkj9kG6UyfQBrImkQ6EX/FCINoxr54N5/iL8tvaCZ1X5Qt088jnok2Hs4+W6LvKTbF3QXt1V5DKGfpxSMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783535125; c=relaxed/simple;
	bh=xEfWcNodSiJaimKcnO8lld02aNd9L/RRemVH+bXC/Qs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pcm1DnaJbLXReheOaa4KkhHQX38j8srKWJibZvJvW+DdD5jEdWuUqw3oPfVUIbDF/GT/fZC1okhl02q0u3b04GF95ZtU7eoZGUVN9L6ocxRlctgPMWIAltTlfdcrkD22QV2O0x5aRVFlO5VZjctzmtRayLAIVwZLhq6xcK03cU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0J2K3OD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWMhLB3G; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GLpHB3200048
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 18:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DlOq9cyGVjo1GSBmam8JHq
	IncEW7Ur5TJOCioZSLmxk=; b=S0J2K3ODUevZxf5v5BEoGFyQz+DKj/rkQbuwUF
	KNRDtROjiI1QhxDIAaiFI3uH0rFdi+eKjZN1x+P+G7LocbzkcW0j+Ut3U4hvFjXp
	1wUd551D5kA4hghQX/D9/2m3T4L/YO1BmdakF8gMWgf0jdqlj0r+/89ZZJYqqyAK
	spfo9WzvZ3XBA55Ox99QqBBCtGsRbWkOxW6qE20A8OfLzUshJPl3XjwxMUDg/syI
	7UySzfmvn1FZFB9NtyuJZlDiF3+hhraP30R+iIvdWZAGUmC+W95NgIWWIBZv5NJl
	MakU9FAOh0m+MoRjF8Wuq8YNCwN69IqCEBBSzfxPFccsAheQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5c945-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 18:25:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb687f82eso17514825ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783535123; x=1784139923; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DlOq9cyGVjo1GSBmam8JHqIncEW7Ur5TJOCioZSLmxk=;
        b=HWMhLB3GFwv3gwJV6vW8loRtFqfhRkfaTj0z2jkRKPge2hBNf1xz8Ckb4eWzafv4p5
         l19V5pPPUNSUdnhUXxgEpqZ5BBdfp5Y+6lUDdTyxOxrefNay43gMKurPDyTdzU/hGPsW
         5CDQ2+gQlV0Agdlo2WLBFMZlNN4aWcoIcljMzMWeQpH0FRs2bIp0Yl6HLlWrEXdH0kLy
         agQe5qG3fyeVgpMzOQr+BUYa+FvSjW5G40AkaDiKeMcaHz1uQ0fBcwgN6LOv+rEDpoSU
         HY9LRi4W9/LDsxA6Y5iXUwS4Am5vzFUEAK3X+/TKLiztazYB8rzMxo7pGw67ZwQatxvc
         Fcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783535123; x=1784139923;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DlOq9cyGVjo1GSBmam8JHqIncEW7Ur5TJOCioZSLmxk=;
        b=EKq4992bd+YBsYvuTmC4ad2LxOf/2aJnI0SH/fWes6YlHJxyiIUF6ZA3ZlBioBnlyN
         IHrZbMjkmQMC6EZjvKvUxYJ9MsnNFGTCaMWP0jsIgLaAc2qqkHfm2JNgUqRrJzroL43R
         YAJvLuEpOMKA54+y+LjHSsEoOMJHnLsj3oHSSUUcsU0ux27o/vfV2bE3djt42iGne8Um
         RoMZ/86xSMlsyuFUUL8qoxg94sosEgnqlppWpRh/fzEwW0HGjsGzRYs2++Y5kWOZTV53
         R/JrINI2IoY4pF8WTCGritKcOt9KCBOFTAl5AmvfAwgq7S2gNALI3odW/mRqs3ublV1M
         rASg==
X-Forwarded-Encrypted: i=1; AHgh+RpLB37iawZgblhK0C3ac4kbeFGJbyx6kcqvA1//MmLZzgKOAp0Ups+gcUQnwhp8g24WeivXAGWayKafFeB1@vger.kernel.org
X-Gm-Message-State: AOJu0YxsrFIaqP6+t6+ssceSHc6ivGxutlFUzTI2CK1GnqycjSoSmm/H
	rZCzXCjvqsfG0TJQH/UyCwX9yl4MJjbjxN17nLNKgMHnjK6fUh6uRBZ1DtXoG1IZr+Z7VdBRcjd
	SK+Xe6LxVhcj585JPmVcXssMp8Fk4xxNggeUmNsGagB/I4TSRDZZmJAIENUn1F2WXAiwRjUnuPV
	mE
X-Gm-Gg: AfdE7cmFsdGhG/JQSniLmDM86fXfhkUIA3xEe4kFgJ8+5LNVsXv3IPTbL72sS6MAC06
	DgLIq0d2cnZCn0OizTuYC38/d5TXq0k5Ig9Pc2654cu3S3NiSwK0p5C8Ynj0pCV6nQ+qtDyYrHa
	v2zgtz/7wcLUR58y3Z9IoKRvBQ90of2wDKYucwM9n5RikF33vQhz0V1ztMLFp3K6teBDGp26acL
	HYA+8O+n3YVhNX/p5ADXYpom1yW0QAEvRJ9L372+8zRGLNW1qE+UWhiWDK4fzOOB+ZFQi6GCq53
	TcoclCu6nQEyuxxWNTlC34Z2+i/MOFEdOyftgasZQxpITrSLYiWCChl6n/3cfU9bLg3GVTBQfSw
	PAp62SLCk9ag/emJfRXLDhKeU/z7tGTPo+7Gwp//gnQ==
X-Received: by 2002:a05:6a20:a10e:b0:398:7df5:2dae with SMTP id adf61e73a8af0-3c0bcf49b71mr4360033637.9.1783535122740;
        Wed, 08 Jul 2026 11:25:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10e:b0:398:7df5:2dae with SMTP id adf61e73a8af0-3c0bcf49b71mr4359995637.9.1783535122275;
        Wed, 08 Jul 2026 11:25:22 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5946sm2671098a12.7.2026.07.08.11.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 11:25:21 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v2 0/4] clk: qcom: Add Audio Core clock controller support
 on Qualcomm Shikra SoC
Date: Wed, 08 Jul 2026 23:55:04 +0530
Message-Id: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAGWTmoC/32Qy2rDMBREf8VoXQVZT8ur/kfJQo+rWCSOEsk2L
 cH/XtlpaFfdXJgLc2aYByqQIxTUNw+UYYklpmsV9K1BbjDXE+Doq0aUUEkkEbgM8ZwNNrOPyaU
 MzuFOQIBAFOOKo2q8ZQjxc4d+HJ86w32u7On5/EXXpA3MqX6BTxWYb2O97nIumBLNwYcQmCX9I
 tDfXj9m0bYvs5+wV8JrxQWXXPaL3AzWFMAujWOc+sa14CxlOhjGhRRUG0apEEzo4FRnpQarfcc
 V2poPsUwpf+3rLO1e/b8hlhYTrACkFYF6Tbv3VMrhPpvLln6oBx3Xdf0G1Iiz23UBAAA=
X-Change-ID: 20260605-shikra-audiocorecc-85efef073474
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e9613 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tvEzqpDY3YWCjbqCEX0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4MCBTYWx0ZWRfX+mykpPfnTsuL
 azdCXrDPg7QgvwAIXewj6SzGVaFUfr5a1S69VI4YbaM8zobC3LO3Hm5sYdtWiWjUSScRyJOVqjx
 gjrrgnP5V4mpZZ/lwfI1NjOyDpMAZlA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4MCBTYWx0ZWRfX4GPPG6jh04ny
 xExTHiztqMQ5FS34hl4WofzwZEPgFWd9tY0ORuHsh7LZ0FQba2iR9000x/SLnuICEM5FU7dnzv4
 kEgl7sgCzkc8e1H5KE+3FfYQDfJX4eWCWRRd6LBXNTQQzlACCCsEDsX/Q4/NHexTT6GwGq+JTgR
 uh1g4VY98U2F6tHOO3omhdBVlr/2P2wf1etHYRjK+VkYgfXIWgYJ4RpkeAQawBBLelk9i7MgvUf
 CoSpfvmBtyMw2HVXpUWUb0MStBoJyeHfRhC/glUVPkGtJYZxQrPOgW+3/Lv5AvYnCWaaFcbn2so
 JaYUkaeNaLq/qK8tm218wJ4rVGJmS2RD2hl1K+IDIm8uf7OQniSPG8lVuAEMMBK7nFJ42CVM5CK
 wFhd0CNYfvI5YbABlPmldwZB71C/1M+7GxTWj+JFnTd11dLmB+jmP3MfWN2ZQjEHkMEsAWjVP/+
 nbBhyKHUGBP7PyMACfg==
X-Proofpoint-ORIG-GUID: lYbyMG8Ds6KYZ1EC90uDIWiYcERo90oP
X-Proofpoint-GUID: lYbyMG8Ds6KYZ1EC90uDIWiYcERo90oP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117786-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DEE57729797

This series adds support for the Audio Core Clock Controller (AUDIOCORECC)
and Audio Core CSR resets on Qualcomm Shikra SoC. The Audio Core Clocks and
Resets support differs across Shikra variants based on Audio subsystem
enablement as follows:

- CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
are required to be supported on HLOS.
- CQS variant: The QAIF driver runs on the Modem, and required clocks are
handled on Modem, so from HLOS only resets are needed.
- IQS variant: no soundwire codes, hence no clocks/resets are needed.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v2:
- Separated AudioCoreCC and AudioCoreCSR nodes as both resides in two
  different register spaces. [Konrad]
- Updated bindings and driver patches to handle the separate node
  compatibles.
- Updated resets in driver patch to handle HW_CTL bit.
- Link to v1: https://lore.kernel.org/r/20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com

---
Imran Shaik (4):
      clk: qcom: common: Register reset controller only when resets are present
      dt-bindings: clock: qcom: Add Qualcomm Shikra AudioCoreCC and AudioCoreCSR
      clk: qcom: Add Audio Core clock controller support on Qualcomm Shikra SoC
      arm64: dts: qcom: shikra: Add support for AudioCoreCC and AudioCoreCSR nodes

 .../bindings/clock/qcom,shikra-audiocorecc.yaml    |  90 +++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   8 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   4 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  18 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/audiocorecc-shikra.c              | 809 +++++++++++++++++++++
 drivers/clk/qcom/common.c                          |  24 +-
 .../dt-bindings/clock/qcom,shikra-audiocorecc.h    |  49 ++
 9 files changed, 1002 insertions(+), 11 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260605-shikra-audiocorecc-85efef073474
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v5
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v6
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: ac83151a889855498d36288ddd36216d451340c8
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>


