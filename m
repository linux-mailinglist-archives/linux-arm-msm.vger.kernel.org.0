Return-Path: <linux-arm-msm+bounces-93276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOu8IHCplWlVTAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 12:58:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA9F1562AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 12:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98F14302A6CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 11:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF3430EF77;
	Wed, 18 Feb 2026 11:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lR/BJoGA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hpoJO1YC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1660930EF6A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771415904; cv=none; b=mUddIV0NJfCxvBIIQh/1QB8oyUC4e4md/S9bjsiEgfDoGDazTLPZLhyspJpX0pMOCnu0ufXhqTZIbvIyVKmzEjDJ1nP7xXZSntdQ2tA1pPlHXPHPSdNBGDYZ29XMXRAhG1iNv1c7pnzXA8a7sfnnxFlUEcIXxIVmDHMC5sDrlB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771415904; c=relaxed/simple;
	bh=NiFhB2AG+mWGtSKo1xUEoKf2XEIkJGZAG/sMcxQFnf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eG/rA2MwHbqdj+5LW459ZXPqw6rEfXN+aBK/4Q9d7i6DKk/mubh43r3g/gzVBf3jQJe7DAk4ZKY5E5I2cLS6FgwcVQHByYFUYguhQHM6KVZ4WdWEyb7MUBccRyJmV8ZxZ9ze/uf9P7Oa/PmKq8tfKzJHjonR+k3CgoCQY/L3e3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lR/BJoGA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hpoJO1YC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I95Por3380488
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gr9/XAIstPahfqY/E+i3reO+
	rg8IoPQG0UJaDdYYkUQ=; b=lR/BJoGAE74gqZlhGhFTKf3JjQGaE4LHXgxDeWXo
	xmuULSE3OtR0I4gf3fS8lREyYm3TtIGhG1CzeMxKjfJtHJ4Mz7T9i3kcA+4p4m9X
	dsbDYTkGyHMMlycmeSM1CrXpIom+W5cFjGQP7d7L7LgAg2ANWymn8ndBtoXbBngu
	BD3GHGf7lUKchLeBaVvM2K6XD9m6PTLYv1P9K1hEqXLXbqafyPLKS66aw5zPxA0i
	XOAMis5GcodMy6jkbKDICYbCsmUaNnpGvlrlGRqKxBzAiizAEq44asaKn6euDC7b
	kI1Ei+/huCGpXfGPfUPn+A/8ZyFub+Wrb9oMHrS0t+CPPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccxnyj8mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:58:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c882774f0dso3307371585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 03:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771415901; x=1772020701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gr9/XAIstPahfqY/E+i3reO+rg8IoPQG0UJaDdYYkUQ=;
        b=hpoJO1YC27CIn4JuH1KsWnDLQHqFH6WsZw8/1CfhXSMpAHz81pn9dJVK1/6j1fiYf3
         sPQnT/U9GstMmJRgYgvD54WkbK84gicPdIuFw1dT8M/G6dvoF4Ndyqt+UGRb8mc3gUqM
         nbtlzzOOwsdmVtOXH5Xd+Se++0wXllIwK/X3MrIMUM6Y74fNGG6z0Iq6onGLApx+ld6p
         pi2QflbKeUWu+tlyUZyzDg3qYX0CtnUNs2GeRAUH3EnK5Y5vKN+A7qrdFAO8oCOyeGbY
         xmQtRnJwt9cAlUBPdgxcXoYnPRp2s9o1ohFRfypWUq2oZWsIr1BTMoNsCt3dg5TCgk8G
         sXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771415901; x=1772020701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gr9/XAIstPahfqY/E+i3reO+rg8IoPQG0UJaDdYYkUQ=;
        b=u8qLaExJLyO3sdW573cTpDtNYbPJmVyh4GNxZyGJY2kTKv0Z53X1vmkoR4B3wILvrM
         TQAxqr+CEUtsTjg1mIpMYrS9KCBYq+XtwIDaU5M4i5G6JkBLQ3+i1xCNbixJxkqoJ3EX
         orK1ovD5hhX/cWTlBuPWI/AAz9pG/tPICeZHBokhWOJMc/EyL362l2JH0T6B2oi7bcQ7
         b0v3igPjJWZ8VSGxG3cyoQHPL6mCCfnbFQ6i1upRRZ5hy34+mAaYxSXxGNgXhMK6oBws
         1vQ+B++n9kScs4PFk2x+VFpMOxyuzoHemcdVuCEbC8hnQA5dJEeCriuCKkdKku33iPwe
         jR8g==
X-Forwarded-Encrypted: i=1; AJvYcCWlh8swhWXRWhBcgMDZEo+OyFA5DW3/tHaP+npWAuXTJM5rhQf0Nffv6cypjmVP4R1Os3405YPwYouDppFx@vger.kernel.org
X-Gm-Message-State: AOJu0YzWjecjF4EjDnXelUp17g+Ysj2LR+xquE2xp9cyFWCE7u1APdPS
	rRcF56V7t66zKXUVm0bt/pZKawLSs/8RmC8AnTA95VMfYr/gSTv8bdPoBHsDG0piGnG5KBPJriE
	KyLD10p4EHVWgmgg7OY68imAnDP4yL8Bj0L83oe9tZ4DWa5R8CL5snKOjMeOvGw78PRtu
X-Gm-Gg: AZuq6aIoyYvjtymioBdvqQDOqk5pKPK4ENpRhPeI1RMxRB0v7Bs0NKy9gD/fwVOI/B0
	iLFMsaoZEEh/zS4ZX/6U+sKRvqB2ykUoV3tSKIZARFPr8N4W4KnfMuDJ8tu/fY5mG0A2zQQGpiF
	LWhJ9o4s8O9v8adyEvZBZhO/Tr5saCu/zofWevbpoGFh7zf8y7FpZ9bgNpj3FwGqrckkI8r60vb
	hbC1zia2vfm2YokmssA6KIfZUTA0r7QktvNRY38PUhN96x5et49PpuESsUbOo1M13V3pVkx5SNz
	w/S6ON88uuyoat8IRl4em2VvqLf/p1otwiCm/YVP3CSwWwreVf83DWZpp/RaDXH/8kbptOwL/oB
	Y8AdQHqJDe2hZ/CCG/xVWDgMk892GQj7d01CWHKdtkvjR0PCdi1GFj26lfkbyszgtypZjMIrh4G
	JMduN172ZsdnOMT8KMWSz4fNaGNn2fAeEeW00=
X-Received: by 2002:a05:620a:410b:b0:8c6:a64e:92b4 with SMTP id af79cd13be357-8cb4c039b28mr1747937585a.78.1771415901179;
        Wed, 18 Feb 2026 03:58:21 -0800 (PST)
X-Received: by 2002:a05:620a:410b:b0:8c6:a64e:92b4 with SMTP id af79cd13be357-8cb4c039b28mr1747934485a.78.1771415900728;
        Wed, 18 Feb 2026 03:58:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38706916f7asm44157521fa.37.2026.02.18.03.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 03:58:20 -0800 (PST)
Date: Wed, 18 Feb 2026 13:58:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
Message-ID: <ljser6u4fd5qc4lxxde77igtxz6ertbeucsg6s3zbwlykfowpj@yf7h6tqh6cik>
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
 <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
 <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
 <9405b67b-9e08-472d-a937-38c038fdf73a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9405b67b-9e08-472d-a937-38c038fdf73a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 6s_xkzJFJVwGzlGR_CXpN38tuMClNzfY
X-Authority-Analysis: v=2.4 cv=Do5bOW/+ c=1 sm=1 tr=0 ts=6995a95e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=SXzkmgPmAAAA:8
 a=VwQbUJbxAAAA:8 a=OL8-G2NCgTYwbf1Q410A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-GUID: 6s_xkzJFJVwGzlGR_CXpN38tuMClNzfY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEwNCBTYWx0ZWRfX/qe267loo6D7
 dummITs53PFALxBxVvFKoYWxAHFNdUGQRUVkAqx2DH/RDUQ1nrv5T54xJHVApWXz3N5vw0iWLt5
 ZzqbHVgmh4baccr/VaOMKQEOHmiSy9HcsTXBnFnyCtmC3fNx2PHQCX3Jhv9ckoQy0w5tCdfUQxO
 frrvDbTmMKAiE4cPwx2AD7n0F8lNttvg5JgX/axx70+t2wCaWbfKy3D3JuPi7Sr8ytBJ0NyajRy
 +2ChEfxb2RVEXCtlcCSnKwnqShWt9Jt+5MrQZOv7SSIeuXigc86OZzhOrz1OvNGnHuHUAFu+KsO
 eCjlwll9HU3095WsbO9hqnypmyxpnlJIth9qAtQrEXMSetSyYqvRmzL5xa6x91EhRG68e8P6Nz8
 CaHIFBqFj6fIjAherqOlT1c5YEcj3rxvgnqte7K8zrwpL+/3xMgGP+2r1lsH55ukffMD1urRsrj
 AxVINTzC80T4xjUrGuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93276-lists,linux-arm-msm=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[oss.qualcomm.com:server fail,qualcomm.com:server fail,codeberg.org:server fail,ixit.cz:server fail,sea.lore.kernel.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,codeberg.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DAA9F1562AF
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 12:24:26PM +0100, Konrad Dybcio wrote:
> On 2/18/26 12:18 PM, David Heidelberg wrote:
> > On 18/02/2026 11:30, Konrad Dybcio wrote:
> >> On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
> >>> From: David Heidelberg <david@ixit.cz>
> >>>
> >>> If the OS does not support recovering the state left by the
> >>> bootloader it needs a way to reset display hardware, so that it can
> >>> start from a clean state. Add a reference to the relevant reset.
> >>
> >> This is not the relevant reset
> >>
> >> You want MDSS_CORE_BCR @ 0xaf0_2000
> > 
> > Thanks, I prepared the fixes [1].
> > 
> > I'll try to test it if it's not breaking anything for us and send as v2 of [2].
> > 
> > David
> > 
> > [1] https://codeberg.org/sdm845/linux/commits/branch/b4/mdss-reset
> > [2] https://patchwork.kernel.org/project/linux-arm-msm/patch/20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz/
> 
> Please don't alter the contents of dt-bindings, it really doesn't matter
> if on sdm845 it's reset0 or reset1, that's why we define them in the first
> place 

I dpn't think that will pass. Current reset is defined as RSCC, we can't
change that to CORE behind the scene. I'd prefer David's approach.

> 
> Konrad

-- 
With best wishes
Dmitry

