Return-Path: <linux-arm-msm+bounces-118453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OPh+HadEUmp7NwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 15:27:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C072F741AC0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 15:27:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="my/Hit0W";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XzkWZDnM;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118453-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118453-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9596303FFB0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 13:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EEC38D6A2;
	Sat, 11 Jul 2026 13:25:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD523C5836
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 13:25:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783776343; cv=none; b=LAi+lk12J1pqWFc7vPFHhTsILIcIz6ybqJY2p5DfJyDmdJOEG53zjKTjYlDVtV8jUm+jFk8Pg6CNwWzH9nAP79nq6huVVj/nmy6BKabYyhn4XMJBzVqKaE0zkrPCI9Xmj0vQ1cK8NpI1k/HVFRQOi4K52KCbb0r1LEL3kuJKrN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783776343; c=relaxed/simple;
	bh=5QSQGqiyXRwrFcknIZuAVjqWPj3lMvMMcCM69qrmlkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AUfQCCt+2vzfuC570JRW19reIaP8S3b8tfqTCLAy8ptzJThII2vS5897F5xuqNlgh8PtETznGDx8Qt990NakvORsf3HHIM7FkTzS459c3PWYo7Tr1YIsmvRkF7TGYcFDN30OCr0C3r1kgfciAM6U3JYjsCYQYx9OfUwAaFMv7r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=my/Hit0W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XzkWZDnM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BAnacQ3540905
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 13:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dR6f9gGXTOpY1sSwJBhl1gsRgCY5tMNroo+cgHnCkC8=; b=my/Hit0W8oQw+kgb
	Y8/Xmj0eT3EKvTrO2UjkD5KHPxMNmFl//QsI7V9bqpnvK2AuQsEkRjDD59GI+xDy
	HPRxRhpCie95q/UjSdAg7BpYatyvP3BwWtDUhe5HbE7g4hfe0nFF00zRrw8liLx2
	TY9ihNfkkqEJs7uO4QFymVGmfj4W+bODMb3DsyurOqmij4zsf5rLd5uWMqN+Jcze
	LGaTU09YF5unY4RoHw/W0MyqGP2guQU5+4uB3nFMUpjkEojBMg3V06qKtiZsrI26
	T64IZ3DXm7TDfhdBbwuaDJxXYpVktBO7z2WOg7H13iRWdLOwri6Qpgn91pNv+nSS
	W+9VGg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekcgtyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 13:25:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1eb52e1fso31198141cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 06:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783776339; x=1784381139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dR6f9gGXTOpY1sSwJBhl1gsRgCY5tMNroo+cgHnCkC8=;
        b=XzkWZDnMjrTk6TgyA4joV6QBeUKVZha3Tk25/3HGM15ysoO0JFcwydg0PKonU6/Nhk
         /vZn6svdE2JeKMLfhVDxSitd9s3BJBHuhq47sMhI3Y+zynqqD8GJ70j1S3O0z13YGqmj
         y5B6Q1SbXiIVMJHFuaTNi1vJZrp0ooWH32UB2T6Rnxz5bBQU1Q/ChDMXGsUgeu2NsFQ9
         bniZ/ztsizlnWakRBMVjdvzHNQqg++8DT5RDeON0WFod0Gyt8x4W/8O/6dRpLmvV+8N/
         vX2VeumeBbxAaxsyFHjfMOlx3ATKH7ZVSgb3cfz4E8qu2UAvzmTc3YlSjg29EK5R/fnU
         uz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783776339; x=1784381139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dR6f9gGXTOpY1sSwJBhl1gsRgCY5tMNroo+cgHnCkC8=;
        b=MUOJTYWHuTe68XlROJW8NpZvpig0ugfFPgrAJD3fbAxjhCTjyElf6v1qCRhJIf6N/U
         KhGE4LhyVVSAwx93qC8qeZZApBnVRYnk4qgikmQjk8gmEx+2A8GKKNbWcYjJAdGUKXCD
         O7il1Qee/+viVR1NcX/W9AFl8uo+T7N/xruEToEams1XZN0yrGRjcB074qvfFWRb5tRS
         nTBnyqNeqoT+W2AzmmZmAwUO979gBL9Tot4WuAiNZrtrg8wKlnbteUSJpw3Ckc/l3IMk
         s60IX4m7sQSIOPvxA51WOp+4JAAs+UaR4LPHlBYwEquoSSG3WJc3/fJivfSez3wHjwG/
         BvAQ==
X-Gm-Message-State: AOJu0YyLzFcYHXwDR+DpTvC9wFaAOYekQNQ9pE7em5KrbnN6QfBIRxEG
	gqRJB6L1pEKJlyTHfalFwgzpuUvE/kPbGiaHfipWB8NhE3kGuBPxnoPDUCh/nYHdu2TrNrNjt/m
	3ry9OTM5YohQZlwGsm9RWSAiCapbkjUMPE30QtwbQdjiO7rWVAdf/TesjKnuS2DWDz6fB
X-Gm-Gg: AfdE7ckwrJySMnUawfYNvicZ91nxF084APrR5sA2hPpm79hC69L+uuJPy8SnXhHY+2Y
	7CCnQEqHB/mFmlRU87QZ3eXg8gptGpbfdx1x1xTHesBQk6hXd2twE68bhbL4okwA5VCUNOODE8H
	t6+4vEToXCyJtaRqPGVzjhWGcymeflUjidSuOC6g6C+s35K6HbECLM92XSRpnW/1pScKxAS5M9Q
	x73ixP0NXaecy+/pXl+kb9RlsiNmaKkBxvz4J17G4OyimfPAZo2ARi8fSSuDC5NEALza8GxOb2M
	h0QBkOIfmLQq+iKzUvOSmmq7KJVDg3n4EuEQ1ZnEX/6qxwvX08ydrEUdIWnnR81RXultIt0MLEH
	flazmOFMUp8MuE8rKfRNSP4tzosNITcjtnH8=
X-Received: by 2002:a05:622a:1b16:b0:51c:404:af7a with SMTP id d75a77b69052e-51cbf132788mr29297051cf.31.1783776339409;
        Sat, 11 Jul 2026 06:25:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1b16:b0:51c:404:af7a with SMTP id d75a77b69052e-51cbf132788mr29296791cf.31.1783776339064;
        Sat, 11 Jul 2026 06:25:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm67915265f8f.14.2026.07.11.06.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 06:25:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 15:25:04 +0200
Subject: [PATCH v2 4/5] soc: qcom: Avoid SCM and SPM for cpuidle drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-qcom-soc-kconfig-v2-4-4a907e064281@oss.qualcomm.com>
References: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
In-Reply-To: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1748;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5QSQGqiyXRwrFcknIZuAVjqWPj3lMvMMcCM69qrmlkY=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGpSRDSiAdKjB1yDVw1E8Bu0DseOe8OnxtDMnq5daC1yT36B9
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJqUkQ0AAoJEME3ZuaGi4PXxQkP/R2M
 t3ajECZUoBV60x8A65VR7AVtMhajrFiMk+Fbll0gPPcBdT81gOYtdycynJqsyvXGJugrntbOhiG
 CUZMNZNyr8fG4OB+pGINE25XQYeB3yre8eavG524z8O9xlI5i1WVgyPTxPh4opwg2+NRGMoPHzB
 +W4e8BNnnZlMZcgD1rZ+HEGdeRx6o4+gIzjZQ1V036REJGDwojSdlA3auY/UloaPznOIpdRvSHC
 5RnqgwDyR2ry8d1PxoxlJ8Y3AdXpIv4KCQEkLpf4Qr0AYFqeaAQBFptf8tdB8M0adGB/JrXpWfX
 OdLeEOvnGon06/97lYAOyrI/PPVModV1aCoNyBHLLdeeOwFAhe1vwxdGjoSh2yerf4G5bc+yGvB
 gLw16lx2sYfwifABkDjOtLVnSLrAAYa6j3qXEt+z0o6ytLC7Ft8YBFcTpITL6APhYb0/lCEO+GG
 W+yEE2RKbvbT+57t5In/mmWGSRe57OE94bHRz9BtxKXDIgf7W5YA+DjVL2/z3q46aPPq/Sn3iLa
 dDd8UcDTxZ5ADarj6+iE49ldjPautgpIjYVDT9QuiCUkkXfz5V+jCiR6H+snmiIwljMd7ovGmmP
 27yOANSiu3Hb9VC/472OzM9Jf9npOQsZx3sZ1mOOlXpR6CcQjg23OF8dkJXPAKxYV0BUtMnNIcd
 3KbR0
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEzMiBTYWx0ZWRfX/KeAzrrSqcsU
 CEMNWvxhICdBU5uVf0qacxsuYyKvzojd8PdOf0dZo5lWOQ06aLEWMFhEan2UOcs7g22qZYu4E4s
 jDGqQB0VMA8syXeJ4QDXko/opizylHHzyDOa+1VjRdfbC7WexT99b21SdYkt5D8PLIzGv9TfYSS
 mIx1BIOYxFhV4Ly3yGDS7Zkv1Am4iEKkP8l53hH4mkJ0ol5s1rhbUcpQp15QlNYwQdSClfvgAae
 jbsCWbBBVLcythROQyIcJajpzbgBLBUYB0He5AwJtbI58BQ+LBr8gtT3TC1jWxnBVvwp25c/wmx
 SCVbtjzIy6yjtNrHXr1GBvtrwzMjvQR/SmihsFngf+AHD1pXtnT8RcDS6RqCWsorsYGPlyuSbMb
 TJ51Q5iwDv2A4ctb1/ONj5XLoDwUnI8aHVRbvTs3Qa3B90+WabmAVz7B3Iv0+BTm/9GAS50o850
 TPoz8fFFwoUP0rhHkjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEzMiBTYWx0ZWRfX1qBjw35jPIRI
 ZqS/i+Sqkd+BDiOtHz+MOVNsH+ZXpwJOwPLE0qIhjG39mxeS2X8i/J9zS8gtdtCYa44+YsHchfs
 BBHtjJlL4SGHegCrc9hpTVJ6rQS+vLI=
X-Proofpoint-GUID: Uw0yev5dFbV-mpdK0VJD-M5pf0yEPZVh
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a524454 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0Q2KlgmO6JzD7cqg6jEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Uw0yev5dFbV-mpdK0VJD-M5pf0yEPZVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118453-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-pm@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C072F741AC0

QCOM_SCM and QCOM_SPM are user-selectable drivers, thus
ARM_QCOM_SPM_CPUIDLE should rather avoid selecting them but instead
depend to avoid any possible unmet dependencies.

ARM_QCOM_SPM_CPUIDLE does use symbols from SCM and SPM, and since it
cannot be built-in, the dependency must be as built-in.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch after suggestions from Konrad
---
 drivers/cpuidle/Kconfig.arm | 4 ++--
 drivers/soc/qcom/Kconfig    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
index a1ee475d180d..b88b01aa5829 100644
--- a/drivers/cpuidle/Kconfig.arm
+++ b/drivers/cpuidle/Kconfig.arm
@@ -120,11 +120,11 @@ config ARM_QCOM_SPM_CPUIDLE
 	bool "CPU Idle Driver for Qualcomm Subsystem Power Manager (SPM)"
 	depends on (ARCH_QCOM || COMPILE_TEST) && !ARM64 && MMU
 	depends on ARCH_SUSPEND_POSSIBLE
+	depends on QCOM_SCM=y
+	depends on QCOM_SPM=y
 	select ARM_CPU_SUSPEND
 	select CPU_IDLE_MULTIPLE_DRIVERS
 	select DT_IDLE_STATES
-	select QCOM_SCM
-	select QCOM_SPM
 	help
 	  Select this to enable cpuidle for Qualcomm processors.
 	  The Subsystem Power Manager (SPM) controls low power modes for the
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 4e6eac2769e5..fd4d4ecd2df0 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -227,7 +227,7 @@ config QCOM_SOCINFO
 
 config QCOM_SPM
 	tristate "Qualcomm Subsystem Power Manager (SPM)"
-	select QCOM_SCM
+	depends on QCOM_SCM
 	default ARCH_QCOM if ARM
 	help
 	  Enable the support for the Qualcomm Subsystem Power Manager, used

-- 
2.53.0


