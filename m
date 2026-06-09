Return-Path: <linux-arm-msm+bounces-112226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9jCiFbM0KGqLAAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:43:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA69661EA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:43:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=M0Ti7pr0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bxCAve8d;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112226-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112226-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88E1432158A1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 15:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC9549219E;
	Tue,  9 Jun 2026 15:32:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076474921A1
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 15:32:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019178; cv=none; b=mSo7IAPJLGB44n6b/mcECgCo/a6KjFWmbK57jMaDJEal3ZxbCCHcBmc96GSS86EdRgiPBIatiW7RHnUYhiO21XWdh5O/7iwxKnwEoaae5BBqoVF7x2e8qliJ3na2aGis+9wUjONci3XcAd6mQ1BkI7jAmjTbJpMGDCY4VYCIYWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019178; c=relaxed/simple;
	bh=Dmgsusx5VlRpQbmWA2DPJ1aIryKzbrubTphjJA0vkQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P+FDX/I/mfrio+ij66BZycximGBGCk6PCqA+GuDgTzwVZ1c+yGNT79km1RlXPIpssDU1SGM1xB6DCiQKMB8fURzTyQLDUS91JAHzke1R7T7/wHDpzC+/IneLbEUTST7A2O/UdrnEjs4h3alz0A80liGwtamj1ZaImMJDRvJBNJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M0Ti7pr0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxCAve8d; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CnMLt2668556
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 15:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7MebkYWIC9fX8koapdNnYcES8xX/c+X/JbaqIYNwUvE=; b=M0Ti7pr0lxl1YnMT
	/D2HX5jKSvASrexR5PfeNR8ZeWXaAiCnug6gJyheGBj3tln+m/vCvJjt+O77OtNr
	oKVjlgnHOS85s7BPdDXdBvOIT9hggvGhsA0AuSavqsnWLIHnqRQ1iZeEcMxAfQ8H
	eX+gXNjrcvRmEpCuGOI7V3y7XNJ+P9AcTOSQtohCxbj5xq1cJuh2hj06MbQu7xO2
	3IklUfXTDenlm2gR6BJoE8OYki1GYLobBYGBV7Z/g1pndsi/nDm4nIKjRdIYvrkH
	M26QKJC492yPGa+dMXCg3EPLCddn30/L7ZVJHHOvvJgJ2HA925g/pMm0cs5eEe5r
	Z82ALQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25tb4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 15:32:54 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6e907a982f5so8594127137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019174; x=1781623974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7MebkYWIC9fX8koapdNnYcES8xX/c+X/JbaqIYNwUvE=;
        b=bxCAve8dVY1gt1KBvtx0OWNeMNk2bhODZLTO9q6/dwMY1OJQRlGh/g8Uhs/omn63/m
         ot0Af1BhzK8/zq3ddU7T7xtQoO/4rHWlRmjlZa5UIEE+cnC9aYAsOHwgXBGxRdfz3D96
         KVhaJH6LfliKI0Brh7SSRTEDH6ddWSunZXo8+KXZW8JNWgYzrJlBxUufYSdMscnjxpEq
         /OFZ/b37LVU+Q6o16EnIQaKhlJhs2wvFhK4dLV9eg4rlmh+SS6cFVvcE3lF+W+l/NKde
         TYTeV4ynoMcrLnU9DqeJ67M4GQhh9iLkpUTozIeMsDN1igm/1oyMe6E78gHbk4PbW4US
         AOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019174; x=1781623974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7MebkYWIC9fX8koapdNnYcES8xX/c+X/JbaqIYNwUvE=;
        b=qlwIqwDd5T5SsKzknwHCixymRnh+1dC64iqjdRcMyoUgFMQjhH4uEDi8rNDp0GU/ka
         uTpXTAKkJevokdC8LRoJ89pGeHR47tp51+U1mHsq6Y6vrF7nagMdyY2X8VsSnLdFtVAu
         LEdY5qeLj9ciVJefWZ5FFZNE755igKtUMRKaBEFFhMGH7sq4M+6RV5nqtuCimh4EDquO
         4OdvzmLiHXFppnFu4ZTtZUoogg5Hyf0lI4znP1dTzmEXJ3BlpDtJn8DHv97sfvW9zvOu
         n3V0VJi6qZ0VoU2aSd3rVFA/YHeBAcOMtFFoxEWZEsDX2DNw6dwp0XH/hknlwMYyUo9X
         kdPw==
X-Gm-Message-State: AOJu0Yx2gSsOlUSIPFeAJxnkHgmI1AEC/rVAIOslkI7I5gk+8HQahHTe
	+dGtVuQ5uKXb/IIXx24wBBVwIVXu/PDta00vGK4gjkRrMV0fzFChJOs4R6PYv4yKDmnOqX1p2cl
	ZIozSS1VOcNuMukUEDgbU9tlS3oOkAQwBgEr1Ame3RvcN6XZf1hDAAkx2ZVoM0lEsWSOvi5mKTK
	YC
X-Gm-Gg: Acq92OEGzqOHzTTgaTsA1B0yrAerX5Cazmf/GbHaqKq85cwMs/u1WVvbqpPdk0wBF7f
	FoStUuABfDdFiK7cLVGrDp1awmQUX6zPznPA9R45j6nMGaspKvkXa7HPhMB3/NcXVd9H5XsQ/5l
	cEuq4uSUu3n0dP/cABnz7WtEOP9ArvrDHGJN6y2yEurUFjgY/slW72AvgoivWAAx0F4FrtAgY7M
	P/3HITLcDsRkiVZaT3BzTJKRFypEQIiBwOT7BO2sowKOlAnkn7xSbtgG9ylYbzrZScDFnUm17pX
	4DdkJEj5/4n8x7TOTxA4PBYZ2RIaApQYVHGSHLoQW0nkPRdC4KX3rEn1Wr1XLF0YzLvlrj01DdB
	UEvQ1Jcnz2QHVsSlvroY771Aw2s9bRJptshAsBKDHAUEymfbnHVnQsIb9
X-Received: by 2002:a67:e35a:0:b0:6cd:23a8:3a31 with SMTP id ada2fe7eead31-7002b522c64mr5141141137.1.1781019173703;
        Tue, 09 Jun 2026 08:32:53 -0700 (PDT)
X-Received: by 2002:a67:e35a:0:b0:6cd:23a8:3a31 with SMTP id ada2fe7eead31-7002b522c64mr5141072137.1.1781019172738;
        Tue, 09 Jun 2026 08:32:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm60938203f8f.37.2026.06.09.08.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:32:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:32:37 +0200
Subject: [PATCH v2 3/7] clk: qcom: Make important ARM64 drivers default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-clk-qcom-defaults-v2-3-0c67c06dca11@oss.qualcomm.com>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=37987;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Dmgsusx5VlRpQbmWA2DPJ1aIryKzbrubTphjJA0vkQE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKDIXfj/XqvjlpLxDV8v4AFUfFm2KHKuPnBS7a
 wWEuAV/7rWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaigyFwAKCRDBN2bmhouD
 1yTbD/49M1OBJlzNo8agFKPsORR7mIZXILdfzYGkPLNpWPvaIxlBMKyL8cJl9nkk3qhHhq+yiQZ
 3bNgjrXEYlIAGSF42Ru+YwZDMHEhISOz18ZM3cvL78a8fMtDwYzW+HZqgVeRMIL/VwJxuyQdrSe
 u9JcwyySHhfcfYBnb+4iMv8g0TXxs/6WxpefwPj5rlkYKxdmBExcwXjE2yPBzZfSRO65Pa2C0Ng
 kh3UVTtzmEDEKQRyK1Smfkrl8Z32RiS2ywgDslWGwRoydKVqD1Y0ZrqXAAz0vGMROnvAz6q7aKb
 QF53LzJMk19D2IICmn5TBFS75pknAOpDx/zF6pc+hpVyErz5fl057wfiu49IBcuU1xQU4w9WHlf
 Lv6pt95xJMWehF6Vh6c0IILPWaNxjwhr80Qe6F6W+0UyJUR74FPvSBX5bHfTFY/XKjLO0L16lgA
 AZbeq5O1JljvaBYdbAbs4WTM9x39Ic/rs140laMCkzSH728RAGvDHMsvZfyHLSnlmoSFKefjcM3
 VSc8c6hkSQgK+MPWDBUmBdxgNnvPrSEDjn/XnTwex3kYdMx0iLJZ9d4mR2qiiNyeuUaiXxfRvmb
 VB7yVHDFSy9SmOImtN5QdHP9K2lGcH5Wb1Ityr8OVQShyGhAgugvqm4ytIAE6cB9LrODisacCtG
 HcWF5StZwy4Gr1w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: Kfq8vEAv4s5JE00UBbGcPHgFj2pDDrox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NyBTYWx0ZWRfX6Hy3/N+0Aybd
 QZnEF731rNvPSBXG5jgn16A0pJ2UTO729jb5zJYZGKsXpVgQABzQgFFpIhCGN5ekBQbCrl0hawp
 DYs7LtZqyCSOZv78Wv3IkN5/qpPRzWNBrg/xbB3B/dV2xF8vU0pMGwBmGAaum0nFxeoPl6OPokD
 Uy8m4kpqs/Oh6HNdZ8PN1H3EoF3eH+urqsOJG0wqaHBBDljYfoFO2G2BgQseIdeZiq975arqcWg
 P8byp1Ixh1WYdcm/GRSjmtCbT8FofllgSInODsC9QaHauy4oiGKny6QZFUNHfFmFeiqlVJWkAwT
 eHpBimBOdF3JRpWP6sY1ohDBgsZv6U20OscVoZTlGEsk3Ee0Qg19IEATSj9hbU6sZFG01XHYgzQ
 hSoOjAcImwhgG9EIiLHGI2Sn7d9OYz8V4IgH9Qm/1WC1KJbefFQKgsGT5fbAE9M/z/GTKeNjx2l
 mR/s3Z/z2/mhUfrqoFw==
X-Proofpoint-GUID: Kfq8vEAv4s5JE00UBbGcPHgFj2pDDrox
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a283227 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bqaog6Zag4lIKP_6AjkA:9 a=91Ohj-z5vtWLULLE:21
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112226-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5AA69661EA7

Clock controller drivers are essential for booting up SoCs and are not
really optional for a given platform.  Kernel should not ask users
choice of drivers when that choice is obvious and known to the
developers that answer should be 'yes' or 'module'.

Switch all Qualcomm clock controller drivers which are chosen in
defconfig to respective default 'yes' or 'module'.

This has no impact on ARM64 defconfig include/generated/autoconf.h,
however changes few drivers for ARM 32-bit:

1. multi_v7_defconfig: Enable QCOM_CLK_RPMH as module, because SDX55
   (ARM 32-bit) uses it.

2. qcom_defconfig: Enable QCOM_A53PLL, QCOM_CLK_APCS_MSM8916 and
   MSM_GCC_8916 as built-in, because MSM8916 is also used ARM 32-bit.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add defaults for msm8994-8996-8998.
2. Move defconfig change to separate commit.
3. Drop Rb tag becauase of above.
---
 drivers/clk/qcom/Kconfig | 122 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 3b8768d80d89..d8281ed68dc5 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -23,6 +23,7 @@ config CLK_ELIZA_DISPCC
 	tristate "Eliza Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_ELIZA_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controllers on Eliza SoCs.
 	  Say Y if you want to support display devices and functionality such as
@@ -32,6 +33,7 @@ config CLK_ELIZA_GCC
 	tristate "Eliza Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Eliza devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -41,6 +43,7 @@ config CLK_ELIZA_TCSRCC
 	tristate "Eliza TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on Eliza devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
@@ -49,6 +52,7 @@ config CLK_GLYMUR_DISPCC
 	tristate "Glymur Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_GLYMUR_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controllers on Qualcomm
 	  Technologies, Inc. Glymur devices.
@@ -59,6 +63,7 @@ config CLK_GLYMUR_GCC
 	tristate "Glymur Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Glymur devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -77,6 +82,7 @@ config CLK_GLYMUR_TCSRCC
 	tristate "Glymur TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on Glymur devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
@@ -94,6 +100,7 @@ config CLK_KAANAPALI_CAMCC
 	tristate "Kaanapali Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_KAANAPALI_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  Kaanapali devices.
@@ -104,6 +111,7 @@ config CLK_KAANAPALI_DISPCC
 	tristate "Kaanapali Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_KAANAPALI_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  Kaanapali devices.
@@ -114,6 +122,7 @@ config CLK_KAANAPALI_GCC
 	tristate "Kaanapali Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Kaanapali devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -123,6 +132,7 @@ config CLK_KAANAPALI_GPUCC
 	tristate "Kaanapali Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_KAANAPALI_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on Kaanapali devices.
 	  Say Y if you want to support graphics controller devices and
@@ -132,6 +142,7 @@ config CLK_KAANAPALI_TCSRCC
 	tristate "Kaanapali TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on Kaanapali devices.
 	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS.
@@ -140,6 +151,7 @@ config CLK_KAANAPALI_VIDEOCC
 	tristate "Kaanapali Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_KAANAPALI_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Kaanapali devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -159,6 +171,7 @@ config CLK_X1E80100_CAMCC
 	tristate "X1E80100 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_X1E80100_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on X1E80100 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -167,6 +180,7 @@ config CLK_X1E80100_DISPCC
 	tristate "X1E80100 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_X1E80100_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the two display clock controllers on Qualcomm
 	  Technologies, Inc. X1E80100 devices.
@@ -177,6 +191,7 @@ config CLK_X1E80100_GCC
 	tristate "X1E80100 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Qualcomm Technologies, Inc
 	  X1E80100 devices.
@@ -187,6 +202,7 @@ config CLK_X1E80100_GPUCC
 	tristate "X1E80100 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_X1E80100_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on X1E80100 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -196,6 +212,7 @@ config CLK_X1E80100_TCSRCC
 	tristate "X1E80100 TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on X1E80100 devices.
 	  Say Y if you want to use peripheral devices such as SD/UFS.
@@ -204,6 +221,7 @@ config CLK_X1P42100_GPUCC
 	tristate "X1P42100 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_X1E80100_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on X1P42100 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -213,6 +231,7 @@ config CLK_QCM2290_GPUCC
 	tristate "QCM2290 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCM_GCC_2290
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on QCM2290 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -220,6 +239,7 @@ config CLK_QCM2290_GPUCC
 
 config QCOM_A53PLL
 	tristate "MSM8916 A53 PLL"
+	default ARCH_QCOM
 	help
 	  Support for the A53 PLL on MSM8916 devices. It provides
 	  the CPU with frequencies above 1GHz.
@@ -238,6 +258,7 @@ config QCOM_A7PLL
 config QCOM_CLK_APCS_MSM8916
 	tristate "MSM8916 APCS Clock Controller"
 	depends on QCOM_APCS_IPC || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the APCS Clock Controller on msm8916 devices. The
 	  APCS is managing the mux and divider which feeds the CPUs.
@@ -249,6 +270,7 @@ config QCOM_CLK_APCC_MSM8996
 	select QCOM_KRYO_L2_ACCESSORS
 	select INTERCONNECT_CLK if INTERCONNECT
 	depends on ARM64
+	default ARCH_QCOM
 	help
 	  Support for the CPU clock controller on msm8996 devices.
 	  Say Y if you want to support CPU clock scaling using CPUfreq
@@ -279,6 +301,7 @@ config QCOM_CLK_RPM
 config QCOM_CLK_SMD_RPM
 	tristate "RPM over SMD based Clock Controller"
 	depends on QCOM_SMD_RPM
+	default ARCH_QCOM
 	help
 	  The RPM (Resource Power Manager) is a dedicated hardware engine for
 	  managing the shared SoC resources in order to keep the lowest power
@@ -291,6 +314,7 @@ config QCOM_CLK_SMD_RPM
 config QCOM_CLK_RPMH
 	tristate "RPMh Clock Driver"
 	depends on QCOM_RPMH
+	default ARCH_QCOM
 	help
 	 RPMh manages shared resources on some Qualcomm Technologies, Inc.
 	 SoCs. It accepts requests from other hardware subsystems via RSC.
@@ -356,6 +380,7 @@ config IPQ_APSS_6018
 	depends on ARM64 || COMPILE_TEST
 	depends on QCOM_APCS_IPC || COMPILE_TEST
 	depends on QCOM_SMEM
+	default ARCH_QCOM
 	help
 	  Support for APSS clock controller on IPQ platforms. The
 	  APSS clock controller manages the Mux and enable block that feeds the
@@ -366,6 +391,7 @@ config IPQ_APSS_6018
 config IPQ_CMN_PLL
 	tristate "IPQ CMN PLL Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for CMN PLL clock controller on IPQ platform. The
 	  CMN PLL consumes the AHB/SYS clocks from GCC and supplies
@@ -384,6 +410,7 @@ config IPQ_GCC_4019
 config IPQ_GCC_5018
 	tristate "IPQ5018 Global Clock Controller"
 	depends on ARM || ARM64 || COMPILE_TEST
+	default ARCH_QCOM && ARM64
 	help
 	  Support for global clock controller on ipq5018 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -392,6 +419,7 @@ config IPQ_GCC_5018
 config IPQ_GCC_5210
 	tristate "IPQ5210 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq5210 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -400,6 +428,7 @@ config IPQ_GCC_5210
 config IPQ_GCC_5332
 	tristate "IPQ5332 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq5332 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -408,6 +437,7 @@ config IPQ_GCC_5332
 config IPQ_GCC_5424
 	tristate "IPQ5424 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq5424 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -416,6 +446,7 @@ config IPQ_GCC_5424
 config IPQ_GCC_6018
 	tristate "IPQ6018 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for global clock controller on ipq6018 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -443,6 +474,7 @@ config IPQ_GCC_8074
 	tristate "IPQ8074 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for global clock controller on ipq8074 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -452,6 +484,7 @@ config IPQ_GCC_8074
 config IPQ_GCC_9574
 	tristate "IPQ9574 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for global clock controller on ipq9574 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -472,6 +505,7 @@ config IPQ_NSSCC_5424
 	tristate "IPQ5424 NSS Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on IPQ_GCC_5424
+	default m if ARCH_QCOM
 	help
 	  Support for NSS clock controller on ipq5424 devices.
 	  NSSCC receives the clock sources from GCC, CMN PLL and UNIPHY (PCS).
@@ -483,6 +517,7 @@ config IPQ_NSSCC_9574
         tristate "IPQ9574 NSS Clock Controller"
         depends on ARM64 || COMPILE_TEST
         depends on IPQ_GCC_9574
+	default m if ARCH_QCOM
         help
           Support for NSS clock controller on ipq9574 devices.
 
@@ -515,6 +550,7 @@ config MSM_GCC_8909
 config MSM_GCC_8916
 	tristate "MSM8916 Global Clock Controller"
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on msm8916 devices.
 	  Say Y if you want to use devices such as UART, SPI i2c, USB,
@@ -583,6 +619,7 @@ config MSM_MMCC_8960
 config MSM_GCC_8953
 	tristate "MSM8953 Global Clock Controller"
 	select QCOM_GDSC
+	default ARCH_QCOM if ARM64
 	help
 	  Support for the global clock controller on msm8953 devices.
 	  Say Y if you want to use devices such as UART, SPI i2c, USB,
@@ -619,6 +656,7 @@ config MSM_MMCC_8994
 	tristate "MSM8994 Multimedia Clock Controller"
 	select MSM_GCC_8994
 	select QCOM_GDSC
+	default m if ARCH_QCOM && ARM64
 	help
 	  Support for the multimedia clock controller on msm8994 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -626,6 +664,7 @@ config MSM_MMCC_8994
 
 config MSM_GCC_8994
 	tristate "MSM8994 Global Clock Controller"
+	default ARCH_QCOM if ARM64
 	help
 	  Support for the global clock controller on msm8994 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -634,6 +673,7 @@ config MSM_GCC_8994
 config MSM_GCC_8996
 	tristate "MSM8996 Global Clock Controller"
 	select QCOM_GDSC
+	default ARCH_QCOM if ARM64
 	help
 	  Support for the global clock controller on msm8996 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -643,6 +683,7 @@ config MSM_MMCC_8996
 	tristate "MSM8996 Multimedia Clock Controller"
 	select MSM_GCC_8996
 	select QCOM_GDSC
+	default m if ARCH_QCOM && ARM64
 	help
 	  Support for the multimedia clock controller on msm8996 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -651,6 +692,7 @@ config MSM_MMCC_8996
 config MSM_GCC_8998
 	tristate "MSM8998 Global Clock Controller"
 	select QCOM_GDSC
+	default ARCH_QCOM if ARM64
 	help
 	  Support for the global clock controller on msm8998 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -669,6 +711,7 @@ config MSM_MMCC_8998
 	tristate "MSM8998 Multimedia Clock Controller"
 	select MSM_GCC_8998
 	select QCOM_GDSC
+	default m if ARCH_QCOM && ARM64
 	help
 	  Support for the multimedia clock controller on msm8998 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -678,6 +721,7 @@ config QCM_GCC_2290
 	tristate "QCM2290 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on QCM2290 devices.
 	  Say Y if you want to use multimedia devices or peripheral
@@ -687,6 +731,7 @@ config QCM_DISPCC_2290
 	tristate "QCM2290 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCM_GCC_2290
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  QCM2290 devices.
@@ -697,6 +742,7 @@ config QCS_DISPCC_615
 	tristate "QCS615 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCS_GCC_615
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  QCS615 devices.
@@ -707,6 +753,7 @@ config QCS_CAMCC_615
 	tristate "QCS615 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCS_GCC_615
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  QCS615 devices.
@@ -715,6 +762,7 @@ config QCS_CAMCC_615
 
 config QCS_GCC_404
 	tristate "QCS404 Global Clock Controller"
+	default y if ARCH_QCOM && ARM64
 	help
 	  Support for the global clock controller on QCS404 devices.
 	  Say Y if you want to use multimedia devices or peripheral
@@ -731,6 +779,7 @@ config SA_CAMCC_8775P
 	tristate "SA8775P Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SA_GCC_8775P
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SA8775P devices.
@@ -741,6 +790,7 @@ config QCS_GCC_8300
 	tristate "QCS8300 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Qualcomm Technologies, Inc
 	  QCS8300 devices.
@@ -751,6 +801,7 @@ config QCS_GCC_615
 	tristate "QCS615 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on QCS615 devices.
 	  Say Y if you want to use multimedia devices or peripheral
@@ -760,6 +811,7 @@ config QCS_GPUCC_615
 	tristate "QCS615 Graphics clock controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCS_GCC_615
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on QCS615 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -769,6 +821,7 @@ config QCS_VIDEOCC_615
 	tristate "QCS615 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCS_GCC_615
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on QCS615 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -788,6 +841,7 @@ config SC_CAMCC_7280
 	tristate "SC7280 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7280
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SC7280 devices.
@@ -808,6 +862,7 @@ config SC_CAMCC_8280XP
 	tristate "SC8280XP Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_8280XP
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SC8280XP devices.
@@ -818,6 +873,7 @@ config SA_DISPCC_8775P
 	tristate "SA8775P Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SA_GCC_8775P
+	default m if ARCH_QCOM
 	help
 	  Support for the two display clock controllers on Qualcomm
 	  Technologies, Inc. SA8775P devices.
@@ -838,6 +894,7 @@ config SC_DISPCC_7280
 	tristate "SC7280 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7280
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc.
 	  SC7280 devices.
@@ -848,6 +905,7 @@ config SC_DISPCC_8280XP
 	tristate "SC8280XP Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_8280XP
+	default m if ARCH_QCOM
 	help
 	  Support for the two display clock controllers on Qualcomm
 	  Technologies, Inc. SC8280XP devices.
@@ -859,6 +917,7 @@ config SA_GCC_8775P
 	select QCOM_GDSC
 	depends on ARM64 || COMPILE_TEST
 	depends on COMMON_CLK_QCOM
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SA8775 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -869,6 +928,7 @@ config SA_GPUCC_8775P
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	select SA_GCC_8775P
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SA8775P devices.
 	  Say Y if you want to support graphics controller devices and
@@ -897,6 +957,7 @@ config SC_GCC_7180
 	select QCOM_GDSC
 	depends on COMMON_CLK_QCOM
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SC7180 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -907,6 +968,7 @@ config SC_GCC_7280
 	select QCOM_GDSC
 	depends on COMMON_CLK_QCOM
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SC7280 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -917,6 +979,7 @@ config SC_GCC_8180X
 	select QCOM_GDSC
 	depends on COMMON_CLK_QCOM
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SC8180X devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -927,6 +990,7 @@ config SC_GCC_8280XP
 	select QCOM_GDSC
 	depends on COMMON_CLK_QCOM
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SC8280XP devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -945,6 +1009,7 @@ config SC_GPUCC_7280
 	tristate "SC7280 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7280
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SC7280 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -954,6 +1019,7 @@ config SC_GPUCC_8280XP
 	tristate "SC8280XP Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_8280XP
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SC8280XP devices.
 	  Say Y if you want to support graphics controller devices and
@@ -972,6 +1038,7 @@ config SC_LPASSCC_8280XP
 	tristate "SC8280 Low Power Audio Subsystem (LPASS) Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_8280XP
+	default m if ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on SC8280XP devices.
 	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
@@ -992,6 +1059,7 @@ config SC_LPASS_CORECC_7280
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7280
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the LPASS(Low Power Audio Subsystem) core and audio clock
 	  controller on SC7280 devices.
@@ -1011,6 +1079,7 @@ config SC_VIDEOCC_7280
 	tristate "SC7280 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7280
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SC7280 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1020,6 +1089,7 @@ config SDM_CAMCC_845
 	tristate "SDM845 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_845
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SDM845 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1071,6 +1141,7 @@ config QDU_GCC_1000
 	tristate "QDU1000/QRU1000 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on QDU1000 and
 	  QRU1000 devices. Say Y if you want to use peripheral
@@ -1089,6 +1160,7 @@ config SDM_GCC_845
 	tristate "SDM845/SDM670 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SDM845 and SDM670 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -1098,6 +1170,7 @@ config SDM_GPUCC_845
 	tristate "SDM845 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_845
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SDM845 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1108,6 +1181,7 @@ config SDM_VIDEOCC_845
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_845
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SDM845 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1117,6 +1191,7 @@ config SDM_DISPCC_845
 	tristate "SDM845 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_845
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SDM845 devices.
@@ -1127,6 +1202,7 @@ config SDM_LPASSCC_845
 	tristate "SDM845 Low Power Audio Subsystem (LPAAS) Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_845
+	default m if ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on SDM845 devices.
 	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
@@ -1153,6 +1229,7 @@ config SDX_GCC_65
 config SDX_GCC_75
 	tristate "SDX75 Global Clock Controller"
 	select QCOM_GDSC
+	default ARCH_QCOM if ARM64
 	help
 	  Support for the global clock controller on SDX75 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1170,6 +1247,7 @@ config SM_CAMCC_6350
 	tristate "SM6350 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_6350
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM6350 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1186,6 +1264,7 @@ config SM_CAMCC_MILOS
 	tristate "Milos Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_MILOS
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Milos devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1204,6 +1283,7 @@ config SM_CAMCC_8250
 	tristate "SM8250 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8250
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM8250 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1220,6 +1300,7 @@ config SM_CAMCC_8550
 	tristate "SM8550 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8550
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM8550 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1228,6 +1309,7 @@ config SM_CAMCC_8650
 	tristate "SM8650 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8650
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM8650 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1236,6 +1318,7 @@ config SM_CAMCC_8750
 	tristate "SM8750 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8750
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM8750 devices.
 	  The camera clock controller has a separate cambist controller which
@@ -1256,6 +1339,7 @@ config SM_DISPCC_6115
 	tristate "SM6115 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_6115
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM6115/SM4250 devices.
@@ -1286,6 +1370,7 @@ config SM_DISPCC_8250
 	tristate "SM8150/SM8250/SM8350 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_8150 || SM_GCC_8250 || SM_GCC_8350
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM8150/SM8250/SM8350 devices.
@@ -1296,6 +1381,7 @@ config SM_DISPCC_6350
 	tristate "SM6350 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_6350
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM6350 devices.
@@ -1316,6 +1402,7 @@ config SM_DISPCC_MILOS
 	tristate "Milos Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_MILOS
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  Milos devices.
@@ -1326,6 +1413,7 @@ config SM_DISPCC_8450
 	tristate "SM8450 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_8450
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM8450 or SM8475 devices.
@@ -1336,6 +1424,7 @@ config SM_DISPCC_8550
 	tristate "SM8550 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_8550 || SM_GCC_8650 || SAR_GCC_2130P
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SAR2130P, SM8550 or SM8650 devices.
@@ -1347,6 +1436,7 @@ config SM_DISPCC_8750
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_8750
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM8750 devices.
@@ -1357,6 +1447,7 @@ config SM_GCC_4450
 	tristate "SM4450 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM4450 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -1366,6 +1457,7 @@ config SM_GCC_6115
 	tristate "SM6115 and SM4250 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM6115 and SM4250 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -1384,6 +1476,7 @@ config SM_GCC_6350
 	tristate "SM6350 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM6350 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1411,6 +1504,7 @@ config SM_GCC_MILOS
 	tristate "Milos Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Milos devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1420,6 +1514,7 @@ config SM_GCC_8150
 	tristate "SM8150 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8150 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1429,6 +1524,7 @@ config SM_GCC_8250
 	tristate "SM8250 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8250 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1438,6 +1534,7 @@ config SM_GCC_8350
 	tristate "SM8350 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8350 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1447,6 +1544,7 @@ config SM_GCC_8450
 	tristate "SM8450 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8450 or SM8475
 	  devices.
@@ -1457,6 +1555,7 @@ config SM_GCC_8550
 	tristate "SM8550 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8550 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1466,6 +1565,7 @@ config SM_GCC_8650
 	tristate "SM8650 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8650 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1475,6 +1575,7 @@ config SM_GCC_8750
 	tristate "SM8750 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM8750 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1493,6 +1594,7 @@ config SM_GPUCC_6115
 	tristate "SM6115 Graphics Clock Controller"
 	select SM_GCC_6115
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM6115 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1520,6 +1622,7 @@ config SM_GPUCC_6350
 	tristate "SM6350 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_6350
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM6350 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1529,6 +1632,7 @@ config SM_GPUCC_MILOS
 	tristate "Milos Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_MILOS
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on Milos devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1538,6 +1642,7 @@ config SM_GPUCC_8150
 	tristate "SM8150 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8150
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8150 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1547,6 +1652,7 @@ config SM_GPUCC_8250
 	tristate "SM8250 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8250
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8250 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1556,6 +1662,7 @@ config SM_GPUCC_8350
 	tristate "SM8350 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8350
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8350 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1565,6 +1672,7 @@ config SM_GPUCC_8450
 	tristate "SM8450 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8450
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8450 or SM8475
 	  devices.
@@ -1575,6 +1683,7 @@ config SM_GPUCC_8550
 	tristate "SM8550 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8550
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8550 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1584,6 +1693,7 @@ config SM_GPUCC_8650
 	tristate "SM8650 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8650
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8650 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1593,6 +1703,7 @@ config SM_GPUCC_8750
 	tristate "SM8750 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8750
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM8750 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1611,6 +1722,7 @@ config SM_TCSRCC_8550
 	tristate "SM8550 TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on SM8550 devices.
 	  Say Y if you want to use peripheral devices such as SD/UFS.
@@ -1619,6 +1731,7 @@ config SM_TCSRCC_8650
 	tristate "SM8650 TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on SM8650 devices.
 	  Say Y if you want to use peripheral devices such as SD/UFS.
@@ -1627,6 +1740,7 @@ config SM_TCSRCC_8750
 	tristate "SM8750 TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on SM8750 devices.
 	  Say Y if you want to use peripheral devices such as UFS/USB/PCIe.
@@ -1636,6 +1750,7 @@ config SA_VIDEOCC_8775P
 	depends on ARM64 || COMPILE_TEST
 	select SA_GCC_8775P
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.
 	  SA8775P devices.
@@ -1647,6 +1762,7 @@ config SM_VIDEOCC_6350
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_6350
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM6350 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1667,6 +1783,7 @@ config SM_VIDEOCC_MILOS
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_MILOS
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.
 	  Milos devices.
@@ -1688,6 +1805,7 @@ config SM_VIDEOCC_8250
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8250
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM8250 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1707,6 +1825,7 @@ config SM_VIDEOCC_8550
 	tristate "SM8550 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.
 	  SM8550 or SM8650 or X1E80100 devices.
@@ -1718,6 +1837,7 @@ config SM_VIDEOCC_8750
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8750
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.
 	  SM8750 devices.
@@ -1758,6 +1878,7 @@ config KRAITCC
 config CLK_GFM_LPASS_SM8250
 	tristate "SM8250 GFM LPASS Clocks"
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the Glitch Free Mux (GFM) Low power audio
           subsystem (LPASS) clocks found on SM8250 SoCs.
@@ -1767,6 +1888,7 @@ config SM_VIDEOCC_8450
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8450
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.
 	  SM8450 or SM8475 devices.

-- 
2.53.0


