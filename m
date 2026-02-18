Return-Path: <linux-arm-msm+bounces-93297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFQ6BuPhlWliVwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 16:59:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8351578BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 16:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 792953014524
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 15:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830F3343D74;
	Wed, 18 Feb 2026 15:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQTCyQVK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nbhi6tDe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB23343216
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 15:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771430366; cv=none; b=gNvyqnznaGmEL3mhKKjOERze2WNl8s4V/Nq2faxZrf4qcih8vAsNxFcnDrM1rXMRsA57Nd4m9/8sos5ZlAArtI8WmuqKyK0FNbzDRHUYkq7XImRn2DSZ35ZMtVIqN/CCFQcvY+h8DPucVVCqBN5ku0l0HOSx3FfWSSET6Msddr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771430366; c=relaxed/simple;
	bh=i88k5YkercAZNQo0w/ZRWr8Yk6HHpqOQj+1LiKmdzhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfbuh+GyFooU3JszQXwDUzTpelAq8VbIT6AJhISLcyTc5MWsU+iliQ4+HltviZN9HVzIU7IWTng8IEusfOPWZiT4x7fuA71iAdq6HmP43x5rxso3vbEIHjzBRMucYwIq8zDdpmhDG+vaxKGwcM0w3u42YdD8hzl2qg2ptE5tNm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQTCyQVK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nbhi6tDe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I8qEvV3693985
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 15:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3jScn2Aggys8WmvHt1k8JBxs
	Nk1nMV7cMPlxYxor5Og=; b=UQTCyQVKEbUHzebMP34qAL2YQs7UsH+4b84DPOqA
	U7dS4MkssCz7ics/mWd3JwdPzVd+50/5ZAlbH1uJr9EUitJMIa1ohsVDmwU0xRgb
	qAnafve6S89b778RZ3ZPwiSkHdYeL7t0YCMYzjYW5lVW7IdZM09x2j4XdPH7fJCD
	T/Fsc78onNCqTzNHEgR9pFWUgFsBurW7LhT47JNsqGBVc8BfxKy+BhtI/9W9UjNh
	djYC9QF7ewrlLeYvuxdoe7BSUIQDjYDfYhlo1wrAbNRQkI+tAncja7q1cwl+Tdq1
	fr4+IapegjE6ZfpzXzYZ0+Zx9Qf2wqXGmIA/fPRltgcCUQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccyfb2tb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 15:59:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb706313beso237129785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 07:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771430363; x=1772035163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3jScn2Aggys8WmvHt1k8JBxsNk1nMV7cMPlxYxor5Og=;
        b=Nbhi6tDeRl0/rN+8RKFSTGcva2s4Rf0ttSEFr2K7GyF6VePerZcEwb/9OfZCmtoYfZ
         XfBZesDYL0OO752hEtG/0KD9GZMCzywMLUT/fM6xkln/56SkX/zx1HZSc5FCSejLZLD9
         mWH14IsCMBqp9T7LoWfxPrapchq4c5bl2poqCEAK04nb3WhHgiuxApFrprZykwx6TCE3
         lLlwKiuNk2w1E1rFlPyvwLSk6iA3OOkLdagqLdJbuZ4Ybf97e7brJHFC426+eGtRbVZi
         gG8ZPt5l4/sqnN7NiUc3xV/c8JWLkOH8pxZak3mmu2M2KCuXdVJaLIAOBtgQJnaio6zS
         02lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771430363; x=1772035163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jScn2Aggys8WmvHt1k8JBxsNk1nMV7cMPlxYxor5Og=;
        b=XQiSDbeIT33GVvSx4hnOgcj3pNuOoRnbrYyB6VYYeqgQEg71Etjktq/TG3+uBU7Xgj
         lDp9iUwpUZwvJzmWu3WvKx9lKF8KXjbeXe6vE+lfSx8nO8SfUCbvHM3cFteEKL1/t39m
         f+7WG+tGmwRzPzG29qm8qa20xzvMIqkmkwlmnalbo3ZXx1WR1aZT2WFb41N8PB3k2NP2
         2fzxZDT9ZEjqWSpB9IkcX5wv9BRNncPEvR/O5NplV0kLCcKlPGlA5btVrq50L8Do7kPT
         xpEweaVRrlBjG4PDWurdUWmEXbwRh94ApyucauyYI2a7dC7X3nhsd1PXOlk7+SYm4hTK
         mh/w==
X-Forwarded-Encrypted: i=1; AJvYcCWOdf3uBRuy2YQ4JMvTCEgfdfuQLBEWXEofyhRQMMaF7L+Gl4glvwi81F3DtQgMgtrSiNz8vrlJAy0yNp6L@vger.kernel.org
X-Gm-Message-State: AOJu0YwgUcxsxzxVS82q95LUq2PVI9v9svOGCiY8CMpnkioL6D8jFXDY
	AUabHws6tvYew+jcmk2ke9qU059Sd7z0a3sQfsZE3/b/gaz16/GRZm/MealQcpyLb42+OlW1ASl
	JWmp4wcg/HeCGNwoTzQRPFsGaIz4j4miopX+MBHY2V2HkXpmV1bizNDlQ5gab5xRCwR37
X-Gm-Gg: AZuq6aKa4CZPSoENvyJ7/N1smrlf3smYzFB0w9vWeeroFcq8AUZA+eqxPcEJWioURwJ
	ZgXNaLs6sN1TsxXNCxvz8bTR6XZ2Rc/6GJR85P1B77QsTFccBCmpywz+W8jaSQDg1kgxvaKLhHJ
	k1WtzNLBodwvky5yXRZ59wM/Drlfu5cEeZWnf8EhL5V4EYm6ZE2dLw19f4IMmC67pX+O+oL8Ame
	nUhqxQtk3nrsY4yK83QCMi4bZr9YfHoe7ar4x9hPqyEbyrzo2lMoqFGoPcWqbhBlWPQNh/adIVH
	EuMAOojQ82DymvjDeE6+XIsuEXrr2AJCfV8p9+kU/LdXyvReYEFD3NNtNS8ohJRFSab0n1zHjPF
	AGlXpQU5FBFbRa6pFylXMsoZCrMulrrEdjfOa+YJ8tOEAqqmkN8zWdNcFCsRdcO7S11g37xRYZY
	MUkJ6C7/TbCVumVls9jZpQcLy5QQOH3oixKwE=
X-Received: by 2002:a05:620a:448b:b0:8cb:4ba9:cce6 with SMTP id af79cd13be357-8cb740c5467mr252435985a.66.1771430363313;
        Wed, 18 Feb 2026 07:59:23 -0800 (PST)
X-Received: by 2002:a05:620a:448b:b0:8cb:4ba9:cce6 with SMTP id af79cd13be357-8cb740c5467mr252430685a.66.1771430362697;
        Wed, 18 Feb 2026 07:59:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5635a3sm4766803e87.8.2026.02.18.07.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:59:22 -0800 (PST)
Date: Wed, 18 Feb 2026 17:59:20 +0200
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
Message-ID: <t5akkkyyv5yebjmowvqu3nnweu5hz47tagdzv3ifzqwlgib2v2@5jugyaiav5wn>
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
 <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
 <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
 <9405b67b-9e08-472d-a937-38c038fdf73a@oss.qualcomm.com>
 <ljser6u4fd5qc4lxxde77igtxz6ertbeucsg6s3zbwlykfowpj@yf7h6tqh6cik>
 <9b4cb352-d1ed-402d-a55d-cce2d2fe1eed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b4cb352-d1ed-402d-a55d-cce2d2fe1eed@oss.qualcomm.com>
X-Proofpoint-GUID: kkS9enQB63TpiQK4kP6ww4DIQTHvkybc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEzMyBTYWx0ZWRfX3QjFS6fdHRfd
 ckh0my3gbZEiXJppgAmA7njG0wSLInNz+ioZpeY4CmTRVbbi9E5aS4zZTdfXmS8MBvGVyvDhpcM
 i2n7JrBwwQCIs5fm6j+VmbEmToypp+Gf3O97Ynz69i+CTefU6YYuZYLpOYEg8zrEqe6BRdhScrq
 bRffOi0xk7LwnzXb+065tsMaIiBSbhiZRSCHM7VT74FukIUXLbNSXcSxcHE46DZ/ehCvHiNTpoX
 uXziUwe00zjH3LDiMIqNijczFbu/gP1JpfFIenMCulMWGrdCC/Lov1QqTbs8cv3x/SFsqxqkHIE
 jMdf3I6M2brzm8TB0XcEYV/gNmZZXlaYj7iIp8rdE7S9fJTKeYSNSiXdds8Mw/eO45UPrbP0C2o
 9msO/qdhUN2q0e4Ns+56N0QFeGXxdqFxqp1oKlnXt+NHk8QHLBFixFzgwzdyMHNHd/XmSyxDJtX
 U629+HpYhjr6oBhvAhA==
X-Authority-Analysis: v=2.4 cv=JNo2csKb c=1 sm=1 tr=0 ts=6995e1db cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=SXzkmgPmAAAA:8
 a=VwQbUJbxAAAA:8 a=P78Ve_Sz14IPV4iFJdYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-ORIG-GUID: kkS9enQB63TpiQK4kP6ww4DIQTHvkybc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180133
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93297-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,ixit.cz:email,codeberg.org:url];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8C8351578BA
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 03:28:01PM +0100, Konrad Dybcio wrote:
> 
> 
> On 18-Feb-26 12:58, Dmitry Baryshkov wrote:
> > On Wed, Feb 18, 2026 at 12:24:26PM +0100, Konrad Dybcio wrote:
> >> On 2/18/26 12:18 PM, David Heidelberg wrote:
> >>> On 18/02/2026 11:30, Konrad Dybcio wrote:
> >>>> On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
> >>>>> From: David Heidelberg <david@ixit.cz>
> >>>>>
> >>>>> If the OS does not support recovering the state left by the
> >>>>> bootloader it needs a way to reset display hardware, so that it can
> >>>>> start from a clean state. Add a reference to the relevant reset.
> >>>>
> >>>> This is not the relevant reset
> >>>>
> >>>> You want MDSS_CORE_BCR @ 0xaf0_2000
> >>>
> >>> Thanks, I prepared the fixes [1].
> >>>
> >>> I'll try to test it if it's not breaking anything for us and send as v2 of [2].
> >>>
> >>> David
> >>>
> >>> [1] https://codeberg.org/sdm845/linux/commits/branch/b4/mdss-reset
> >>> [2] https://patchwork.kernel.org/project/linux-arm-msm/patch/20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz/
> >>
> >> Please don't alter the contents of dt-bindings, it really doesn't matter
> >> if on sdm845 it's reset0 or reset1, that's why we define them in the first
> >> place 
> > 
> > I dpn't think that will pass. Current reset is defined as RSCC, we can't
> > change that to CORE behind the scene. I'd prefer David's approach.
> 
> Back when I replied, David had a patch that removed the current RSCC
> reset definition in dt-bindings (at index 0) and re-used that index
> for CORE, putting RSCC at index 1. Perhaps it's better to link to
> specific commits when making comments, note to self :P

Yes, I saw the commit having two resets. Anyway, as we saw, it doesn't
work.

-- 
With best wishes
Dmitry

