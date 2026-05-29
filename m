Return-Path: <linux-arm-msm+bounces-110264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JqoBrCCGWobxQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:12:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4F0602118
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 879BB305244A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 12:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3707E3BCD19;
	Fri, 29 May 2026 12:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IzxTSQNN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W8d5eR0q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CEB305678
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 12:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056439; cv=none; b=EDU/g5q8CMDIBQtLGMC2d6VsHU91Gf/5OLeZbjqptThwGOTKL2+83LRQKeUHGN0ypPI4SkicCwAwO9kdhzZRfW9lK78T5fn1zx6BM2msCPdhAgR5DqD5Xj6wsxeUyOFuz7dPj10zr0h1PYelJu8LqVqVKp8iVdq+B0DlypEYBFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056439; c=relaxed/simple;
	bh=huXbw8E6rXipPcgfI/oulq5BpMxyZJTGhVrRVLWkCV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0lQHH6h3HWbuf8MYQrYW7cSbfi8pmxW5ch1ooU4ojOJzTd1ke8Gr9LNmRDKtBoznvVvHbOQOL51KVsKNwSZ/OfP/9/retpPtrHr9jn6qrrOfLVPCRTRsNr8b94cKsT3PNvywTUUThxOgHx6bWCVe+xFGa0JhYoEXka1e2+71Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IzxTSQNN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W8d5eR0q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T7pogq1495706
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 12:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w5W401i4KtUyBJU1xtt1ZS7P
	g3gpytfeIc6F79YZRj0=; b=IzxTSQNNRau6wTm6QjwiEcWEYWcwDUJIIOcyZDH4
	+75yNC/IEgXGrtKHTWA3JeifFlGq0izbvlwr15ZZ4YEWqSV4wqB86zL4mGAzwu+X
	JowRHucgpM493ZTCE1wWEhzdlls8AmcqjTzIrpsSo1LqotH+C+eE61ogK3fam6uF
	tmqlQsyoYH/PC5xTZE94VD8HOoAVK8qVv+1lGvgWpi74+7kxvaJs6GaTb3qzsfbT
	mOeJDpivXjKjjln/FR6FycAKLC0qh5OppYeur/bbFIoPsephGJb8soTtTvSDP/r0
	AHlYlg+ULj7289fykoKOJP7I1OAsY4p5wAfo9YMWH/pN3A==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef015agxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 12:07:17 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575590529a0so24182387e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 05:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780056436; x=1780661236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w5W401i4KtUyBJU1xtt1ZS7Pg3gpytfeIc6F79YZRj0=;
        b=W8d5eR0qsG5B6GX56uezIWggz76g1PqvSzBkj4lMtXe/fkJz/zoacQTFiUBmHTybng
         LJ6NEcswUT3VfWZacV0whHJ4HDoEzqTFC3iuQve1u3AJ5ch7qEGpsT2Yk9nHhfAom+Tq
         53yba8TPDTHfFArzPHuok201zh+Yr8jZCwiT1AnLs/vvIffv0yEHbFhU8/GHUcxWjJwE
         XHeWN/WA2mPez1DCci6DKFPyD+MqMU9k68xEJVb99OoUbLP7vKruxGBaUq3HoBoVb0+O
         ZnoYwc9v6gwrLbh1kvJobZ0wWMjBXep1WGVqiRgQ9QbZ0KUpkXPnRqRYpsU7RjAcFpng
         2zaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056436; x=1780661236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5W401i4KtUyBJU1xtt1ZS7Pg3gpytfeIc6F79YZRj0=;
        b=GcDoMw8scku3Xo0WeNjPl/VeJq1A59hFoJ6uuAR31eoAPdAtD9iMllBCmfa1pc+V8Q
         dyXaoo6KO1WQJOWYYtva594L+93eGihRIElQHa2X1p/4N9ktK0L0tS0f3BM99zLe5V4T
         sJ77rPirllIQo64qg6q65zh5e0PRYu/K57ewZ4JjCS/Fd1MMKxEX10TjnFaUo3zd2QM0
         WrN6J46h1ye/YIAstYFaOZ2hoxttfK8mgXam3mDjthjN7PZXVBPabFp9j4Qmb0M2du9N
         sawXytMKqqOX/Jk0HXfpw+5VHe6FKzZja7wBM1XhvglSNEbSw/XCmHizeVqVbJBWFNQm
         j1cQ==
X-Forwarded-Encrypted: i=1; AFNElJ8v6Is/qFgnP1bXg7RFYE1z4jdJfnkCKTYN8pS9kyqPLl3TArVGctCP3TT5iV5d1eTlPDlcULnybApce1Pf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3x41DVVy6WrZm/3sXWtcWtzWaAI5fmSYn0TFlw4k/xEPt7hy6
	WcXG66585jdXsJwLPeRcJ9AXfAz6GLajle7V3zeGmFj219ufR/uwO4flb61A1V27XfR7LAzrzsO
	gBYAIAuVXdTxU3qTvKO2WTGf0zjO9N/rb9VpOQPiUNGOaHdQN+MKmXMpbcpZnWtZTCX/U
X-Gm-Gg: Acq92OFuy5CGybBeFn7tjwJvDrMyopcUpFlmvRamMw4V6Al7iOThUbndMCKKawIOvBV
	3uSgyFn2kRER4G1JPjWxoPBA82Mm/vhnvqlP3A2KjTAy9v7OrAgeu0izHzLVOk02wxwr6mGoXZN
	B8klsnfsKUcy0V6a2L+ZVJPNvj/4Ok2nd55cMfpNh/MUE+Z8LobgWiLUbLttVVK2DK0y2nZe1gP
	APUDB1QYNj6EZpeXGRmpvKKFElM5gAwj3DVNJEOHD1MSxIAgzL+hKC2E2ZjsEOvXioZZiLA++jb
	ZSa6rBdcbF31mBACcW8/B1w6vFiso4hyYNHvjLILhJxWTI3+0GyvmjqtwzJv4c+4ytaps5O/w1J
	WfGRE0cxb8vmU0PF2gDZ772YwZH3A0r5akA9+Mceh6X35OH6A38MrJ8iM9akcNYQeMDfJm4qVIs
	CC1J82Oh1HgXR0ocM32Kbf2+TsygOxKMOGl0f/1CTozPdznQ==
X-Received: by 2002:a05:6122:378d:b0:56b:9b7b:83e7 with SMTP id 71dfb90a1353d-599f6cb1402mr838117e0c.7.1780056436441;
        Fri, 29 May 2026 05:07:16 -0700 (PDT)
X-Received: by 2002:a05:6122:378d:b0:56b:9b7b:83e7 with SMTP id 71dfb90a1353d-599f6cb1402mr838086e0c.7.1780056436015;
        Fri, 29 May 2026 05:07:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b596664sm235308e87.39.2026.05.29.05.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:07:14 -0700 (PDT)
Date: Fri, 29 May 2026 15:07:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Daniel J Blueman <daniel@quora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Restore second parameter name in purge() and
 evict()
Message-ID: <6l4aqnqhmhjg35ofoofu4zkcfn5ua54wxy7vjnxnmhew5lspof@vmjkxlzb6vj5>
References: <20260518-drm-msm-fix-c23-extensions-v1-1-0833559418c7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-drm-msm-fix-c23-extensions-v1-1-0833559418c7@kernel.org>
X-Proofpoint-ORIG-GUID: zninLW3nIut6xXHchrWPFVYSWcomE051
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEyMSBTYWx0ZWRfXz9j5wukFLQ0U
 NDdzBtrE3R0/wsj0pWYqxOPZKyUbXbLNr++clMygSJEyZV/fteskx3HAahfVWABBynmJ/6bfwhx
 wvksJrWSYA3A10K0ZUcwYNwwxpH1sg/QjKvLB7j6o82r2lZkSFoDRi6HsMOktRff8QgC/SfgQF0
 KpySeX0FhOMv1xGbpoluzLatAWSba+2sL2mf/Ptn91QoVJsLfFW83JuX/ipL5Qq3OfmnoQYk1JF
 QtJZkJ1LAJQnBQVZIcF1YKXQqEEYq7v8K6EEhgGj4LCSZi2FjZjSjOsowCugGeTBL09yKF1723+
 INdAtGauZcIMvN0yJO066qP2e2q09PJOK5s1P5Ks10977mC3NdnZou25TdCl418/xlf+aFXF5Z+
 ny5+agzpPc2TXEYryICfDATqnXhWC5F7NXwAAvja+94jAViIMIBlRmyVzhsdr4rEPABGODR3XE5
 wk9vR9GPubUUwm3pFaA==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a198175 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ooG1LIPqdb8N2y3itNcA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: zninLW3nIut6xXHchrWPFVYSWcomE051
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290121
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110264-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,quora.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A4F0602118
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 03:17:14PM -0700, Nathan Chancellor wrote:
> After commit 3392291fc509 ("drm/msm: Fix shrinker deadlock"), all
> supported versions of clang warn (or error with CONFIG_WERROR=y):
> 
>   drivers/gpu/drm/msm/msm_gem_shrinker.c:105:58: error: omitting the parameter name in a function definition is a C23 extension [-Werror,-Wc23-extensions]
>     105 | purge(struct drm_gem_object *obj, struct ww_acquire_ctx *)
>         |                                                          ^
>   drivers/gpu/drm/msm/msm_gem_shrinker.c:117:58: error: omitting the parameter name in a function definition is a C23 extension [-Werror,-Wc23-extensions]
>     117 | evict(struct drm_gem_object *obj, struct ww_acquire_ctx *)
>         |                                                          ^
>   2 errors generated.
> 
> With older but supported versions of GCC, this is an unconditional hard error:
> 
>   drivers/gpu/drm/msm/msm_gem_shrinker.c: In function 'purge':
>   drivers/gpu/drm/msm/msm_gem_shrinker.c:105:35: error: parameter name omitted
>    purge(struct drm_gem_object *obj, struct ww_acquire_ctx *)
>                                      ^~~~~~~~~~~~~~~~~~~~~~~
>   drivers/gpu/drm/msm/msm_gem_shrinker.c: In function 'evict':
>   drivers/gpu/drm/msm/msm_gem_shrinker.c:117:35: error: parameter name omitted
>    evict(struct drm_gem_object *obj, struct ww_acquire_ctx *)
>                                      ^~~~~~~~~~~~~~~~~~~~~~~
> 
> Restore the parameter name to clear up the warnings, renaming it
> "unused" to make it clear it is only needed to satisfy the prototype of
> drm_gem_lru_scan().
> 
> Cc: stable@vger.kernel.org
> Fixes: 3392291fc509 ("drm/msm: Fix shrinker deadlock")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_shrinker.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

