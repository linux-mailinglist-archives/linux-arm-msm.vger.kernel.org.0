Return-Path: <linux-arm-msm+bounces-112709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IMXbMySRKmo0sgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:42:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2525A670F15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:42:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=m0rgj0Cy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DE6NOn6E;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112709-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112709-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C5F73198D64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EEB23D525F;
	Thu, 11 Jun 2026 10:40:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6923A1E80
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:40:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174419; cv=none; b=P+S2Cv6JXOP0XxBorN/FevGrJe90VwejJum7yU2iC2/5ic295OhKAUeaSaOgUgd9hKF3kFSIUOwOb8uljhtnU+zaYdEZmINJZqhsKe0wLo0jiAJD44QZ/s/An//A4BC15c8cQiy5tm5+jc9i2NJPsoQa7+n7zP0cOGxynRfJYsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174419; c=relaxed/simple;
	bh=A7pnOpM35mxmpEPZzld3qRsJucg4A7vN2Xh4vs/WYXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gIckx3wMydHZaSX8EaojyDUQBRfb40F3OvcY5BXeaRQTTbYDMmEV+HQHxBDIzn+eei4BChvxaYwFyMCbPoEbxrLmbmvpGmYYO83X4RSmFaMIKwL7PGq8Xz9V4v+UmSCl2GYbkzCxPr7LArEiWwd59kuDBeBBoN0O3ddhsjhBIrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0rgj0Cy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DE6NOn6E; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA10qE299643
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sUpFjmkzWfMN2QRiPW54aDlUCwn2XnoIkOG9sMLmAG8=; b=m0rgj0CyDJk13hcx
	TrGXhRYgdQzfrsn/YHCcKs9RbkXtFwveGZpU1u5JzHpo1lI5EIw7AzlJpHCSoJF8
	t2fQ9oN5tEaRF1laGyxCsR6zydKVXdLhriAKWzd1iZnJqQsjx6zlnR263NGOYbir
	1uINho3mm4QKe99nbRpvleWdJu8S08i452oE8X0FdyH25Sm/Aga8C2/rxvArXqaN
	GHFkHfmrCe+SjQz3/QFdjQ1cYC+sDTOfGd9beltxdQOAbUnhLaUKdBzJtCANsKVr
	7MjcQsDV7Me5wJrRhobUcFWAu4/5UufSGkN35da5kB4IWqTsNoEjhX254hCLYtwq
	nxnncQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe702xvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:40:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51759082206so23232281cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 03:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781174416; x=1781779216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUpFjmkzWfMN2QRiPW54aDlUCwn2XnoIkOG9sMLmAG8=;
        b=DE6NOn6E61JzKosMRVvPZxUj4kOdWMEBKLP1cKciYZ5EYda/OVMIrjNCawfG+XOk8y
         0MC37wVY2TjMWkO0qjohk8uUsDxLG/kTP6JRTUrgx6Wfuvaf0L7Bl/U+clKZRhOezVOE
         jWp59j1hAj5EHB0jIoDruWOTH/VY9UqL+il95466jtHwnpnTU268OuLqHGDmNfDBtbQg
         yMo9AWOf/dYzLMPJKVOePn0ICMlNvopZnJTmZ3dqkDBaNRnq0lwpacPmWCBuvtwdac38
         YHtBpEGVsK1r6h5s9etJ1Hytpb5FY6LYmNS7aEkU6fbE7bymMUNAB/xnf7TIxZOF1Z3d
         K5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781174416; x=1781779216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUpFjmkzWfMN2QRiPW54aDlUCwn2XnoIkOG9sMLmAG8=;
        b=QXiDbadzwLkuJtH+E9wFxGqu9t+mAO9lxS6NoWDbVR+hFM7CIimpPaV1seI3NU/no1
         5Lz7ISUqb4jpe7DROGmaIZO1hHyQ2HvhQiIKKsstM58FojCuDUADJzhJ6XuOMynZZ3Fm
         tBXGC3ZBJXx7G5Mst7u/4VsE9aXfOGR4P2Ii1X+x1mZQ42lxqEgyCzduv/2MS3Tp9CXj
         EE/74QhFT/yQLEQUPHRBNeBCgNFIDtgTgM44EY39rUgQlsJgX71iqFUDQc50WvgzBWGZ
         5zjiyVH/9trJ7Kj8uiP33vrHKZ3w2pICAxTYkgNQLGChnS0d1A++rC8gcSvscAEl4dZj
         Uuhw==
X-Gm-Message-State: AOJu0Yx4PKZXBvI5IT07LwVpxsUalaB5erNUNRJMEAzAblWpnA6rYG4P
	fqYuFfi3JhswQz8GPvVtL/2gRSQrHBfptHswodc+PWZoYaGmrm8CsIM8KQVJfP8XrGASE/qGrKv
	Us42n6s0R/GsIRxsrMKOIIUPmS8JwGeBQKBVZeYi4Wtzz24uckk3TXesF6pI6OWUcSed9
X-Gm-Gg: Acq92OFs10FpdRN2g7jF/j4y0JwciRmipyux8J4gLq8Qkz/Wrgx11BIJd+Oh8OlTlGA
	T28vmDG8jFBrXB9DKzTS8xw/EXwQkFDuJizyEsWxUiAwypW+MBs8cjmgchCBpozy2ze5roFttWQ
	PnJKcC+ZipfankqZwh8ehWbNK/0/koxxSeXrIqkpjKczuh8uXP5iMY3N1hPEdHXgeiCceNrL8kv
	vaKiDK1rYlU0mrOd8vMWM7Oan5C+a5H0NTnlLZrDrRHD3pKUlas5Lj7OAvPZ+XwB/XAWFgiOmCb
	vQjlqtXc+ngsGaoKs+PB3omaS/CheBkkqa0sxu9lHq8iR56BV6N/1nMTfaW5VW0OW4BiSsGobh4
	Orw4r/H2lV56l4ZNUrYcx39ZhNaF0KyxOiie71PUWtpOvUARDkTRSyZUQ
X-Received: by 2002:a05:622a:1dc4:b0:517:5af6:77f9 with SMTP id d75a77b69052e-517ee1d207fmr22890161cf.3.1781174416186;
        Thu, 11 Jun 2026 03:40:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1dc4:b0:517:5af6:77f9 with SMTP id d75a77b69052e-517ee1d207fmr22889871cf.3.1781174415786;
        Thu, 11 Jun 2026 03:40:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb53c3ebbsm47181966b.32.2026.06.11.03.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:40:14 -0700 (PDT)
Message-ID: <d3d3859d-e94e-47af-8b6a-966166b883d0@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 12:40:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] irqchip/qcom-pdc: Tighten ioremap clamp to single
 DRV region size
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260527095426.2324504-1-mukesh.ojha@oss.qualcomm.com>
 <20260527095426.2324504-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260527095426.2324504-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RUc3flI7yodhnQJ8e18aBCAk7TexrbFV
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a9090 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=PDkayDdhMvzo2kSqcdMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwNyBTYWx0ZWRfX6SkcQsvYfWna
 yUkHc6hYgPV6xUjC7TPKDBoYrOLhlWbzzw6ScnzVQWCmGiDROTDwZl+Gb4AO5x6B5be3n4GHfPs
 nKZ9BRMXveQ6QGczT6HEH1Hv1/Pcv/6XcYkPClzpBXMfIPud/o9y2eUABhvqJvV6U4+iJCLc9Kz
 Q3DSXYXN8iZOk1pyg4qOYhpyozbyxowTaf7nPQ5Gh9vO7DBixsGyEhY8l+Dlfhq5wiVoeg58pAp
 acCjgzJ6ZqU+ihZULsIIY84eZvAXKkxjBoSpyquNoyP+rTa4Sag5UL2YcRt6ceBic5DwKL1MWRn
 avNZiIMYG6ApnIzX3ZdPMgGk0YWnTq2OEE0zuGBMoO4Jk1E3VB6N21sJsFHprW+KWZHP15F14eq
 v0SqXlnKI/IxSv0QXx9Owyrcu5/opUfU9+cf3YRU+9UVvOK+s1bwudxtbePwULSngAh8ca3mv6+
 GuK4z3mwoc1iUwMp6BQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwNyBTYWx0ZWRfX6gPgLyasvfqN
 hu3vxPrWkyp9q5LhWqsUx4at/0ySlZNTJuPq+4xAPWeJrXi5W08tXnHhDV0dnnC7NryGuIcOcwj
 B3o86nP24WrFxIIx3wkC8VOpL74WhwE=
X-Proofpoint-ORIG-GUID: RUc3flI7yodhnQJ8e18aBCAk7TexrbFV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112709-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:tglx@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2525A670F15

On 5/27/26 11:54 AM, Mukesh Ojha wrote:
> The QCOM_PDC_SIZE constant (0x30000) was introduced to work around old
> sm8150 DTs that described a too-small PDC register region, causing the
> driver to silently expand the ioremap to cover three DRV regions. Now
> that the preceding DT fixes have corrected all platforms to describe only
> the APSS DRV region (0x10000), the oversized clamp is no longer needed.
> 
> Replace QCOM_PDC_SIZE with PDC_DRV_SIZE (0x10000) in the clamp so the
> minimum mapped size matches a single DRV region. The clamp and warning
> are intentionally kept to preserve backward compatibility with any old
> DTs that may still describe a smaller region.
> 
> While at it, rename PDC_DRV_OFFSET to PDC_DRV_SIZE since the constant
> represents the size of a DRV region and is used as both the ioremap
> minimum size and the offset to the previous DRV region.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

