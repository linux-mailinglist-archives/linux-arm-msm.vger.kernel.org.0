Return-Path: <linux-arm-msm+bounces-114348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XoZiDEXbO2oQeQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 15:27:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 837C46BE988
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 15:27:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jj9UF+e7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C0qyiNuT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114348-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114348-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 560AA3018BC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 13:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABA13B38B7;
	Wed, 24 Jun 2026 13:27:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9422C270575
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 13:27:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782307650; cv=none; b=N0VLQvc05M0crTJdtpXaYci8DYDrk/ysPo0q3sBgSqTG8iSF9e7yuOTOyndII8f9KkvNd7MWl1jBWPs+IxdlUqfr6nCQ3NztFapJl5qOFpwVPs1Hh1ARW1NnQlAPrAvJfPw1BBpzTvTD2I3ZcRkxjAK49MQwMCn0q1ARBA96lAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782307650; c=relaxed/simple;
	bh=duZC2OscGpXHWodWPKD380KuNFM1k4kZJoKhzMl1xZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ln+oB+dpdldg2jQ7dvf6ilp6/r4/ZUM/xgZcaTf672+uRl25iij5/+IO8DWgB9Mso5kWspq31kWz9HRUuXJZ+KpIxOGuofXaiLYlubu30RNIB+NgRBeWg34S63RzdtsbYoF8k/Pv/Pq8zfP6aqR7ZPrujHuxU2nAAeZZWAiGOwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jj9UF+e7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C0qyiNuT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANYux2869036
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 13:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	duZC2OscGpXHWodWPKD380KuNFM1k4kZJoKhzMl1xZA=; b=jj9UF+e7mcyHkFry
	G3OBA+CFbOXZpeODwFJOJ/iYYBEaq1Rkz4ksQ5+BlATv/X2A01uy6WrUku6VTL9j
	LJTNb4l5Mzg3t0WPHqQ251e73x4gPCL8eqSMMCz/WiW5QodeJg9/zSjx9uaIO/Hg
	bv+fr8F2RvYv//SNCYdv5jMCF0jg5TaDfpgSi0uSO4SgLWBsf2dDv8x6I8wi/Q1q
	RDN/rq4Ljpm9XGNjF0twuHdLy/AOQ2HpryCWCKSloa2CFKa/anuJyutmCTuFVJ/U
	lgFIVXIYfgRcC0z3k8McLSkP3oFC+nLczf0+Owp0YJ7NodBgPcyhRZhboZB2cGKE
	yp0k0w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq1bnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 13:27:28 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-966d2895042so22595241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 06:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782307648; x=1782912448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=duZC2OscGpXHWodWPKD380KuNFM1k4kZJoKhzMl1xZA=;
        b=C0qyiNuTx/rLR9nmvkxXx5CCRg/TpD42lRJqFaNIpC5UnqO+z0mQh4pAh3DPhcc0U4
         3p0gEDIJi+PIYz3TLJncAje8NOraLRFhKJ47CeeflOLyNjb95lJHKg/uB7GL2TRYiuKy
         2tHaWJZYqBiAKzILgqI1Fb8OxdqTwwKfg38gVIrIvAnQnowDzCEBEvXKTYvpu1YKk+MD
         fcDwv9m+MyUe2X4vnjHiG6xSs9slgb1e/WooVWdOCXyzrIPHk8Z56tkzpVoKfc4KnGmM
         mWMesVqmQTQUbYWiWojHRusRsZwbTnZsZDTGU19epiA68DFLLEXUfbudpCsFdfolBhrF
         s1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782307648; x=1782912448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=duZC2OscGpXHWodWPKD380KuNFM1k4kZJoKhzMl1xZA=;
        b=s9TJA05nSeOX4+knptYkxKpKJv0/U3A7/9Mi7kfTxI2U2YLhqycvCno2Cdprh0NrSd
         Amdu9N5lOKnZirv1N6ultEDAM/tWbkX6xGMIQxERPJUMH1yBQAk4ZB3cVBonX3kEQNmS
         qjN7KbIZ1eXcWBBVG3iV7icD5YPxKU4Qf6hskqjZFHMxZARKTEiDD1cUNWVnYoyg2vn5
         hPEySHB4u608JrPi1+zr9YEbyXbZgPLhOnFtAn16R9WINuPG4lFEFeOYF9G22nftVpU5
         9R8oRJottp3cgzOfs45EsXtonAyzJDF0CXLZzUYEvTw+4TtrWiBf04gcGkSaL++NK9ZR
         g1Ew==
X-Gm-Message-State: AOJu0Yw6Rc8yMqREU4m6Uo+biwjsbr2fipweGMqjwWmQ+zF5ubqOQotq
	cd6vu9Ro1ZmwTB9AIlKmEZhopJ1PBcLacjKEvFfuEu2Y+JD8v6lMTjulomT5w3pOp2agZgwLuE0
	1maXP/Vue4qsQK9dlsoetdZzFET9/rqWz3E5UJgtWmKiipHIrL8/0R5+SZXJkOwqPXjPJ
X-Gm-Gg: AfdE7cly5Ygpuw8BSnR5gQfN/jKhv89ZYMODkcNLqZA5VWy0pfylLZ3kYX59zM5ZPaX
	Ulm+DsxdNmxQpkHVfRUSpiKZrPLeN9jzhYmJTFCf8V0U2qv3JHieryC4YbEF77NDCpbR2Sh0Yo6
	2bKDPq6rMrSmPy1ShAHvBvY5eOK1kJ7f1SvyfsR0uAyYXuarp89X/os+PMSudbKnFVzyeVHRO6z
	mmPIPmmDmq60f25OQ7cCR8AffJNthY3TgtDKVvo/tab0EMtsZbRKb+S+m/8mWDDcuUOkaNuuoMS
	o4cCB5Xq11/Tg7IPg159BC0w8nVssPlBMsT5vAzNDq/gUfOsaKlPz1KjDj1EBrfNCHNl/I40lFx
	sW1HjaHcbVG7GYc/cFNJS/b2P85yaY+CqnoA=
X-Received: by 2002:a05:6102:4187:b0:633:7c8:37aa with SMTP id ada2fe7eead31-72f3834069amr2096139137.2.1782307647806;
        Wed, 24 Jun 2026 06:27:27 -0700 (PDT)
X-Received: by 2002:a05:6102:4187:b0:633:7c8:37aa with SMTP id ada2fe7eead31-72f3834069amr2096129137.2.1782307647443;
        Wed, 24 Jun 2026 06:27:27 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c6161595csm666209666b.62.2026.06.24.06.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 06:27:26 -0700 (PDT)
Message-ID: <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 15:27:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDExMSBTYWx0ZWRfX1bT2wv7pyqcn
 oQ5w6ecC0cQfywOLpyZME3Yc0oqV+4aweHJNldP3dSmhSXGTBg5adHv4H8NW9K2guDRLEFSjtqd
 LOxhdhY4u4O9S4j2g/hZ6YxzQH3FHhY=
X-Proofpoint-GUID: 4370muEimEtPmpmycZmh0_0U2S1yjq5A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDExMSBTYWx0ZWRfX1s0upM+fsnos
 PdUz/dGUWSKkO0YoV81QaWsUEyVMR6k2l8H+KCMwsvqfZlJv/Phj7lO1sY/09Yond3H099JbhKc
 Gt9dpKssUJ5usN7VnFVenlEtegAO7w/FVJKgGAPKcoaQBgtjg22AsdLmtMCljnQ6mpzeVOK0TXP
 RAmY8zrBeKlVdrN8trkdiZrJEtwBhndnHbE3qagU5Fo/SRlVSqbCFEksUvmBiphBu5SF+rOjTWI
 my0fiJq5RrXIP4kfuTQjAdJohvVAk7e7FecFcxVW/auhV2Vzy7LujpqUWYZ5yanD0Y26AlOxPv1
 33D8wAnel8RxagVOs+HXsmdkG3vTLDzXuD7WLiO7ETd64E56cyfuUqcIbQIvXDpMy1zpxGF8gwp
 NJExggRbLiXZMlu+p/Qggd7KaruMPA==
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3bdb40 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=0WHfKmQBZMWu5BVM930A:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: 4370muEimEtPmpmycZmh0_0U2S1yjq5A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240111
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
	TAGGED_FROM(0.00)[bounces-114348-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 837C46BE988

On 6/24/26 11:49 AM, Jie Gan wrote:
> The AMBA bus attempts to read the CID/PID of a device before invoking
> its probe function if the arm,primecell-periphid property is absent.
> This causes a deferred probe issue for the TraceNoC device, as the
> CID/PID cannot be read from the periphid register.

Why does it probe defer?

And is this required for all TNOC devices?

Konrad

