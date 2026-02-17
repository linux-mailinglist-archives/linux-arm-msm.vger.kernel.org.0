Return-Path: <linux-arm-msm+bounces-93165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAreAjZmlGkpDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:59:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7751414C380
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D25B300517B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C7E3563D5;
	Tue, 17 Feb 2026 12:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bfq+l6qg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ovbpq5os"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D273559EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333169; cv=none; b=XEPZ0SfHNzPq5VUrQviuMVKmgJwvUID5u2E1QIBU/uEXbXhJ4YcwcKYrf6lpV/h68qoAn5g1BUkTtpcl1uW/ICt8fQu7ZWpwdMENhnKoZMgMZz4GNEvxj8Snmd/FMavPSLiGr2tNOABNyz2GS3VyjVuPBtyWjRsKCv7dA2/rzeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333169; c=relaxed/simple;
	bh=f+be1kKb7iTBhEbLcPLQfpNAkmIeI76TNnj9qD1y9EM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dstZioRzkOQPZvryzsrDqbikSldN0TBOP3Poptt2yMN4NB9w7DZ3AcwakTsv09F7dP/URNva5BVvSCTixRgEPs/VWg9xupnNJIT4G6D3+w7IquTb6ZCkS559CNe1S5M3pKxaZm2x5VYdBtf7xKPMcvl1k9DHfeBgQWtPMSq2t6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bfq+l6qg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ovbpq5os; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8qndv048727
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDV+tE8xmcz2xVLI249DtmDhh0WqkdGqcssFz80x9tE=; b=Bfq+l6qgP1gITKMe
	eBawV23fJOoZG26MxqUe+gokeS1d7JX3hlTOB2dijZue014pa0DsX0g0t1u8YExQ
	C0HWCIinUejXjiWGymuz420BqkYp+wLb0dmGiEfdZbl9n89GkLB/O/PT/UnKoiAR
	0FMTLKOJaXik4/XftGAzXNgmiQkUo18aIiru6QD+AAHXf9TwCP4vzUy3Lbx6V2Xj
	Rv2BhUnzVXj8iPOxXffO6NiCBDTK1G1/+NYCVeMFrZ6iDgc5ocZkBnrFjlkUgde6
	CH9/g4yvPFrMiPRYHpkjyMqkJenrcD1k4tHPTq4YSU/K6aE7lCp0N2SedbbpAVIE
	3/goJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d82ecn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:59:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb52a9c0eeso3423207885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 04:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333167; x=1771937967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kDV+tE8xmcz2xVLI249DtmDhh0WqkdGqcssFz80x9tE=;
        b=Ovbpq5osjW2NnrDnXK1BNRmV5q+LGuYsTYG/cKPkP3kh2n5BWUq1YoGp9e2e2FxpFl
         onr6bYgdBAcPBkEAU8xQig3p02Hz1B1LOFUJEIx9Kh5Tkf5QRtTq5soRn658pbkBxB+B
         VI0/0v2yriJbeSLlMSA7wH6jtVSR4a7986lx4ax+QlL3LK77TQi3nWXjLZ50BqqWkNLt
         ygZ3AgkA/haKdBcjU4F4k875/uaFVvRVwZap+T0UIb1SOGbZ4VlXjkJzrx2tGvE7km4u
         /s4RvQnBk5g2fI4OWSs+exNlSSrrmW8axxm7Ns6pEm+efWcUkPqw5MGOSHsNMUVeVzhZ
         6kIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333167; x=1771937967;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDV+tE8xmcz2xVLI249DtmDhh0WqkdGqcssFz80x9tE=;
        b=XqKEjQIEI6tFC3c4c7oOXABPZYZkdsU9kaEbtvohhO+lZoCeaEhRU7JSADwEf5QQYE
         De/72abVfsPmWMb/rMy0ilGSkECrhCjVaZ6qrlv2th0PqYAVW7phR6l+9OADgG4vpPoy
         y7jxqGVNZjumU8CKN8RnHOQd5dgflgyxKUve/6Qwmt84c9VbYBnQkiUYJ4aVHMfNh4gA
         F/fLdHYDk7hUJKdN56LS8WkZ3Yb/SUpZO916853A5iV0RpTErNmbCdR147doULwQS5fY
         ZnJcHgaRHAflD+TshvxBQIEESuJ1Q5rei0DcITlNVQ/bebSHuDhFPplcCyw8h7Dk2An3
         V1ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7C+2Y0kZT9zI3a23JnieTiH2EbMaXBhQPe/KYFSJW5O/ejEGB7PGwqD0oQmlYATUWX2S4/AIGZiqgqPrl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz40SyncplTq+Ez08ngIIl9+RHEgiR/+0joudMESW5lAwaZ4je/
	O7jlFmNfZQ1hz9JY6MWzWRYSsfo9FqjSRU1hijtQo50T1RRC89Aj6yCK0SG9/i0AS9lnkF6uE88
	r+bEQvMsuFt6W6m4fTvjC9hjFwnQDfQm9pJOXEOtl3mbAHhxJnCJr4kMmvmtAratdX+yf
X-Gm-Gg: AZuq6aKn2GedymW7UIkzm6pqXUfyND7D1/sFgJfwhg0ET8AWf8T7/zqfaQBvKBH86OR
	Z5AsbGNmwwVd4/AJl021Kql2+BL135V/miGZDN8dM43DS3xnLAPl5x40oD5XQLlJa+7yaAcYyeb
	94Wtu8QLRNpWV4Nwl484oPnlJCAuy2QOLDW26CLZSekZEaNGESqHoHU77PJOfx3XH3QWZxTz0PT
	m7FKjynoI+2HeJ2n8A6uttZit/WcJdcnCvD14Ya3mRGAQPf6mw/xp3qN3v+jQJ7LbedXaPejisK
	j4BseMArq+d/bNUFtkkF+pq2CToivvBWAz7xOm15o4YiTthOvZdOnwjB7NRC1xfnaOlO9D66Hee
	DB9g9NOZO0CJTjp2zd9NrbLioAKCNh04p71wbQGYrZ2+GEx7Jtg==
X-Received: by 2002:a05:620a:1a86:b0:8c7:f79:bd7d with SMTP id af79cd13be357-8cb4c006608mr1365684585a.62.1771333166801;
        Tue, 17 Feb 2026 04:59:26 -0800 (PST)
X-Received: by 2002:a05:620a:1a86:b0:8c7:f79:bd7d with SMTP id af79cd13be357-8cb4c006608mr1365682685a.62.1771333166432;
        Tue, 17 Feb 2026 04:59:26 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a34d66sm129927125e9.20.2026.02.17.04.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 04:59:25 -0800 (PST)
Message-ID: <f633c9b0-8773-499c-91af-3cf438ed52a1@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 13:59:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: interconnect: qcom,glymur-rpmh:
 De-acronymize SoC name
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260217125819.281209-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260217125819.281209-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260217125819.281209-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=6994662f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Rh8BIR2qzSpX2dRZ-WwA:9 a=QEXdDO2ut3YA:10 a=Qzt0FRFQUfIA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX/yYsgZdSeoA8
 sjOPLud/wTE8ulUbiaNgKnn8CEPakKZzbxWv/bbgOjum3i2XJgEyRFTmJQH5lq7iHFs3Wammq71
 fG5w6a9MoWKwo46wkM/coSHwrC33rx0ytRaOXX9lIykWqrM13e/CHZdh+pdlCbtzpUFGrseuNe+
 fcA/3SBt9sAaRFMEzhy1Pn+pgIoX2pLLoeDdaPtBKM6YqSTmWnsJMJTM7tnfVCrRugJT6yT0rJA
 7M4hEH/7JO5/qLle5rc4lu8j9qdIdbHc8qfviS8yFv5H8VFRxQ7OIC4z11e3TmRoYYh788eJ++y
 r5jLszqbD7TZPAGTJCC7YMDIRZThy7Pmjz6QyEj+myNuxg2ecZcSk5pxRiBBzQtOwvPSGI1kPoq
 5pqV1uGjT7czSYOMBm48ZP4HjuCnchvAUDUHnmFCcGiNJG0API55UME9OC0/dnI4UpICMn5pq3E
 MzqlxZjA/H0MYLul/Ew==
X-Proofpoint-GUID: LXE0ZrmLSza_4gUIHTlT6JDJuFfbehfI
X-Proofpoint-ORIG-GUID: LXE0ZrmLSza_4gUIHTlT6JDJuFfbehfI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93165-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7751414C380
X-Rspamd-Action: no action

On 17/02/2026 13:58, Krzysztof Kozlowski wrote:
> Glymur is a codename of Qualcomm SoC, not an acronym.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml      | 2 +-


Uh, apologies, please ignore, wrong patches combined into one patchset.
I will send a v2 for this.

Best regards,
Krzysztof

