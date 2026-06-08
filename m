Return-Path: <linux-arm-msm+bounces-111718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MZ6RNdRvJmr1WQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:31:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D59C16538DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:31:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="OnDbjHp/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ap90dUQX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111718-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111718-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A0C4300441E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F52391E55;
	Mon,  8 Jun 2026 07:30:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC14B390CB4
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 07:30:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903842; cv=none; b=f/axFLrzhUzHkZWhHMPkHz2ycZ1MgR9mYeo0v2i28/GrLHodXZwI5hkmIooYD3JoA3oXghfK9IA59wSl5jguVqzN61sGW5idTLah4bvjTSIcu2ug56mzdXBQWDNH7j+hnbo44tUKeYmYC1ocPgyx2jLANfYHlf8SHyGgQ4Bx1BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903842; c=relaxed/simple;
	bh=OLbqaMw3Aqu7QeHcuZZflowEL27vVtAncYyeTSxawO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUi6/MptXrnwlgwX5mOl58ZP1c7XrTjzkulCIbE+rwzQj3vw0Ydrszz4g/LaBIYAQ7Xg9avLE35yFLSzvDAP1Mw544TaqHVSmSzpw5Zz3OAgNi6f9PWXBVc9Qz7r3Cpz0hU8FhNFZwezfqh4NAIx9hKg/hNbuwjUdTslGj77mko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OnDbjHp/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ap90dUQX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Ot3F2384511
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 07:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NOB6PzJKBKCAB9iTakZfR6X+
	Qsh3+zB9I23qh+8RjR0=; b=OnDbjHp/k4F3OTgAI2di9svMWYMvsGfuj2JuJpkN
	ApcmStw6/dloyNqntXpNN9/P04dJVNfVQZ8NgjeF23a8k/uZ3uqnRxoJxrAfObxD
	8CHPLb5Gdk5ziBPR7RTnKlUSbt3pAvUDuYmS4oVVpodCD4UbtrTrgH4BTFunM/fD
	KVuHmMWQoN4aIGWJS8zxRprcbWXx4AudQTJx62xAhN8H5YTaTwRjvN5kH4jdiRo+
	q0KdilzY1+8pCtgifgu9e0lOQweukGZmKoUhnDjGdIrM60YQ8Vxk5Y/GcQfZ8gYd
	rjffU7AW9BDkJXVzlNQQ8V2ORPxyZ+TF9dm7YBr/WJL4yg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1ee4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:30:39 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c7b5cf8bceso1577092137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 00:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780903838; x=1781508638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NOB6PzJKBKCAB9iTakZfR6X+Qsh3+zB9I23qh+8RjR0=;
        b=Ap90dUQXcl4j74ZoGiBadJTWjYSljzpexr/YEYMpwZJ6FgDDnKf6ks0ST8Ij8h7Frs
         N2O+2ftr3/V8r/lxDkncCOvdnNzFJaMUuVE2hmU9CRIQ/jGq8jpm3b3xrx1/liRRNVD9
         A1I/WqJsBYEvaoLHjEpRwA7/OSGdITED7Pu5DfbtN7o9BVA0rdTAH5TWilcBPV6MeFqw
         XcePP/ouitqrUKF7tvDFITJm9Cm4RUXPU3aGZQw/l65MKBum1h+pECM7ttrZU/PUBJZ8
         zI2PG/GEPW+t41EI5FqzV8iN/MbPSWapOXCHuHiKj6vHIFq5mm+NLkpgnt7ivhLz/7QJ
         A8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780903838; x=1781508638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOB6PzJKBKCAB9iTakZfR6X+Qsh3+zB9I23qh+8RjR0=;
        b=E5+W9ufByWfeoF0wXQhT1cUI4THNsiLTvEMp83yjA7DbrRy7Dwvvwls7SluJngzCXd
         GKT9H8ouIU0NNyb7RfhRPDyJSFrtq6V6sbJjsYkRrxxLH5RwqeYti+7jFfmM5grwuqK/
         YWZaQdIB7Z0iAzOmQEssmC/kX0+oWbz6graYqJM1CFStUosIIPCvrEHuZmvTDjcuHomn
         I2z88mARoYPyXUEqpX1JRHztLrh7Q0wvviCVcSao7+Wc1dYDs+NHXtuE4iBQhcXwsH70
         B8Jn6N8ptTUZNSatdJ93jJ7AQ5ZIujhspcRqwA6ozCNRxf7vSxwZ1YwW+Lr5EHwRbFsU
         25ww==
X-Forwarded-Encrypted: i=1; AFNElJ+6TJ3984IN043RqOFhxcZKi87MimfG4UrXMe4Nz4UIG4VciFQ0NktO+9JlnuUqpFmb6nrU7aXlkyCNA/65@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt0FTc8bWefT4NtmcX0wHXBYvXRN3JY/GFmp5QWVITgLEA+5jL
	v+Jo8IswW9cDaMp7ZU7UdLjFNGX5DetetAZC9pYUTXba2rpEN/jnZs0d5Q47aXUaXcWxFURwr7O
	1tquJHkNTU+B6VOczRzTlpNi8tz6NgiBUvdl4RulRz8aSd4wkxaOnJtiH8gfXtH3+77SI+raphs
	wH
X-Gm-Gg: Acq92OFn8VMrQOdSffILTljn2IDnUS7LpWGdh9k6Cr5RWNXwyiXs5Pc/GNIbKWtlh9D
	fKakLqhpE9Xs1rTb6O2o4c741CtHEvY35HF7Jn8qCbFwhVktyF+WhJsv3Mmv13JsNGoAAIxxhXs
	E0NBVrg75+wWHFe3lSb5ECLwznvSnM7ga5KUyfj/iZc0R2orPkMFK+O3VV33MpijsUIyXUWAzsC
	3WdlEAw/LV9CVwCfYA3xrXStmlK/IAGo+HWueWLvk4eXJ7AW7ZZsDTxsxr+qQwgITfpZUn6JoBy
	dQWGD9tBL1ZhfctZk7jreANYXBculRtjub/fy5mFWY5dYF5jUeps19cke0zyVcv3p1RadD3lL3M
	fHk7Wf914Fl2d3cGkIiK8IJcmcUuVQ6gojLOs1s9Pucvj+npFxUDCAFkmuMttVB2mdzQods3Sw2
	Io0H6F+5IRGiXgse2vuZvBcwFwUjqNHq5MIB4OktY4FjzreA==
X-Received: by 2002:a05:6102:32c3:b0:639:3b08:d64c with SMTP id ada2fe7eead31-6fef353f3a7mr6149011137.13.1780903838261;
        Mon, 08 Jun 2026 00:30:38 -0700 (PDT)
X-Received: by 2002:a05:6102:32c3:b0:639:3b08:d64c with SMTP id ada2fe7eead31-6fef353f3a7mr6149007137.13.1780903837833;
        Mon, 08 Jun 2026 00:30:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b904207sm3590321e87.32.2026.06.08.00.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:30:36 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:30:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Junrui Luo <moonafterrain@outlook.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] misc: fastrpc: take fl->lock when moving mmaps on
 interrupted invoke
Message-ID: <jjfpssvbbhbpxcx5z3p7r7wcowcokscqfjh2jmbqgmjra3ibp5@a5fxebdiwqhr>
References: <SYBPR01MB78817DBE3397783540CE3372AF122@SYBPR01MB7881.ausprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SYBPR01MB78817DBE3397783540CE3372AF122@SYBPR01MB7881.ausprd01.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2NyBTYWx0ZWRfX8nusFpQljtFj
 id0ZstmsEz/hrSr5TVmVswyOEfxJRXQeq9RWWHlaU8MNrWggIsrKnODkfo25QaCaEqfa7TLu/oa
 VTkUUak1k0++V0r8x5DtIPK/OJe4ExPVuRtkl5uCbonJaHUlPJ7DouvgfJlu8VdFV+AnH3LcD8O
 zCsicbjMMFjPUZtUxsdvRZwLbcT5JxCBlKjycQDb/i/wQbsGUH7I9de7W2b0R/risimPSw91RJg
 D9XcYAKJpFtDlvpPpcafRHBcJfR3TK9X3ol7DVA2Ads4xvenxxDSgiL9KpeFmSVlGuWWvZA0fDP
 PeEA+WDYeHXrzXZw7IzgiEws6sw25KrAjNs7DZy13xxE0sX1rDR3JUm/3j/WYkkAvcQm8gSp6U3
 G38cTLZPh2PI7+ar3V2dAtc8EYfzi1UbRkWZIptDwRpUj6SNUvJQ2Tf4RzHoAQ3wDVZoetJcEnW
 ZzCrinqobK7G1y+YAjQ==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a266f9f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=2y4kR7mgpDsC-dX1eGkA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: H0Z_ByHw-iUeCvvULDeE6tpE6zDDtExS
X-Proofpoint-GUID: H0Z_ByHw-iUeCvvULDeE6tpE6zDDtExS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111718-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	FREEMAIL_CC(0.00)[kernel.org,qti.qualcomm.com,arndb.de,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:moonafterrain@outlook.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:danisjiang@gmail.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D59C16538DD

On Tue, Jun 02, 2026 at 01:29:58PM +0800, Junrui Luo wrote:
> When an invoke is interrupted by a signal,
> wait_for_completion_interruptible() returns -ERESTARTSYS and
> fastrpc_internal_invoke() moves every buffer from fl->mmaps onto
> cctx->invoke_interrupted_mmaps. This list_del()/list_add_tail() walk
> runs without holding fl->lock, the lock that serialises fl->mmaps in
> fastrpc_req_mmap() and fastrpc_req_munmap() everywhere else.
> 
> Take fl->lock around the move, matching every other fl->mmaps accessor.
> 
> Fixes: 76e8e4ace1ed ("misc: fastrpc: Safekeep mmaps on interrupted invoke")
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> ---
>  drivers/misc/fastrpc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

