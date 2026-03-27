Return-Path: <linux-arm-msm+bounces-100492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKEmMOMMx2nBSAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:04:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 190DA34C323
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86A9E300E265
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C6940DFB0;
	Fri, 27 Mar 2026 23:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqUcaWMA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ItJRjHna"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107C01946BC
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774652640; cv=none; b=seiUug6vxJY6I7+mCQR4FyUV4tEUt7fQQXW8UvgaGGv6gotLQbfaxIHiOYhyrLpKLqZzoTGbViYyFOgBrOocZbsUEMZol2/eo380ZK+VGnDz+DIAxEYsm7c9jCszO48fGu++DjDc93+6fgOLXj6nJjnNXjh5oADdf00x1zN/90k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774652640; c=relaxed/simple;
	bh=QM1jd9n4qS+zuNSXsJ8xRqzoRSuFoqy6lpBvqhWXb18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJTihX388LYbWTtmzN8LMUXEXzYIbTZfBQzQVRiyJaqZCgKMoDU+n9R5lnZSZ15SFrRLQodRn5V+DSu2t3vy8caG7Ia29IvvxExUAdx+5uwqBh/d4g2ljsl9wqFUuKF+VBi6PLHwID2YWBSw1VPhXsqCNEttB3d8p90qxVQ+Xbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqUcaWMA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ItJRjHna; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN3omk2095924
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z5lg2W0UuVlr+Qx+/w+Ks+mJ
	i6GF4ieSNkAtC5HKjjs=; b=mqUcaWMA8X78Rm8upqSqGag0mG6RGIZIYoi2Qr/m
	RaYmZb4paLZL8TFpOMR4m8/gb7L4ApFJ8GYNYWQ6mkzTnwkK4T4UVW8Pmf6irh4P
	PUyuseREJ5FfDLHW55y79tj2H2XwrITgAHqiS0m7kyUYIQFZ6Ej28Ydo8I14Xpwn
	32zCCZxhH0w5rSXmGgVVcjxtwkRsNGT2+/htpvqyuXxFlM4SF0VtD1pz7EfvsnKU
	+9NT2fWdwxfHwaFDSE9D/H3FxOJJ3fWlLdkzu5RZgG5MhOeM2aRmU/NiTrN7ZBpS
	Wu901kp8U3hDZh6Id9E0/YxWka8QcwmALxEQHnbgYCaZPw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d631q0106-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:03:57 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-950be47e8c9so4399252241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774652637; x=1775257437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z5lg2W0UuVlr+Qx+/w+Ks+mJi6GF4ieSNkAtC5HKjjs=;
        b=ItJRjHnaWL4VrYAfQEpb3OpVbA/QdfJKP8QtRXyRh1Dx65Hl/olwhOnEbtuQ1gIWLb
         v3K5ai4VCJ3pMCcGfDjD3KvLCa7/o1qg2DZojjQqK13+dZ1x+lRY1YiKk7cAQUeoMRps
         dc/oVIskMgWRavQuxKWqKjgk7cPl87cKq+HIVW93gEzbjZioWRbvLBNTivzUgMEoqxX8
         CbYDFny+fvW+vHgYKuZsDQkmYXNQ6inGzcwV93/Am0KVcWTQZoecLTbVQ9zz2NV3j2qH
         EXkl2fBfK/Kaka5YUrvHMZAV4xtlZ2m64LaBOJiAud5fYmBsx39a278OxcFUIJOagJBo
         erbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774652637; x=1775257437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5lg2W0UuVlr+Qx+/w+Ks+mJi6GF4ieSNkAtC5HKjjs=;
        b=j/VzPj+hF+IEiF6VHPc67kckehtkVT+NgqlHaKBUL7Mikr+AhR7qz/lubmQnlzhJzw
         nqoVgaT4bGr81qyp+3oIzY5bjvaH4QZsJukrKHcaSd5WUk66cNJ3PYVsniZ08kW7d0+B
         JYo4+bdGpJ67nLkTBk9Jww3CkW7GDiKUZwFP4wxhISywK7PbecQMWrtEYr3PZXKjDOpg
         vtt08JG70mFYBDqa11jizmqikjeJDpL+5ZAiDZUYlV4B21/rOgkJdoGcuPDAzFOkK/7I
         REXHWxVCYqg6OUk73JrSYYllRwruAYjb4Yt+F4tTsk6lW2x2n4z7OzkXxIsQw14Rruhi
         8Wqw==
X-Forwarded-Encrypted: i=1; AJvYcCXKDJVLE5JeTZ8F1scB04ipwM04Cie0gsuj/qdoY5zQWH+mfuS0zawBWFGD1wlU6ooSI/uERtaCvTKrtndq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1s4oOGWL84NHFrMrQWAH9F4jEVqaZu8VjWiJ6gUbXmDYPMt0L
	YUcE8Xqv/c5gbIlTd5mmtH5mif0M57Fm0k/okVmf4s6fzGgP2sUcqwjGsPYFVp8uDEQPSUYVPJI
	NPg3HyFmdmItjAXM1wIgZxHK5xSoj87zg0JTLJiSdsX06fqHy1abkhI7pUfmrnmX6g6Om
X-Gm-Gg: ATEYQzxaepCzJHQ0JG0gKLIgp4ObWK1zvw7p0ZodcXn6ghjRAT7pJhIbl0Slnvufs1K
	tyF1ULKqirUcEB7i1KXoQu2mi8+JwVgzqtO1RCYGrxupnUq+v52BOTE8dO5Udt2CEbPpaI5jgLt
	y0hUBoXxF1kVt+fX3vuv7R7H6prA0gUFz8jUUk6yQYxPQoO7WBahwWQFhiouJNot8S2tlOB5iHQ
	CkZOz23qk5f3/OA+vQXRSIPj1VV/C6L52JqQ+E384BfTCh9/nXceS5yev34Ty3mU4GgDZKQE+f6
	Yj/OijIMI56RoHgy8/dQJFiU+2GDnLuvjQMKsp/KL6GouEjN1EM4XhC1Qy3Ju3r2BRKcM3+egKB
	/5Ne+iC8WmO/VP/rHx1E85umovBU2WeVTFiwGf3QVLLCq6BwVDbp0RuRRJXONJ968H/SpNMbCnD
	yjp++mhnmOvW4fLlVHOZJKV58ey5t3USjBKas=
X-Received: by 2002:a05:6102:dc6:b0:5ff:cb2c:a04c with SMTP id ada2fe7eead31-604f8fd7517mr2169652137.1.1774652637341;
        Fri, 27 Mar 2026 16:03:57 -0700 (PDT)
X-Received: by 2002:a05:6102:dc6:b0:5ff:cb2c:a04c with SMTP id ada2fe7eead31-604f8fd7517mr2169643137.1.1774652636932;
        Fri, 27 Mar 2026 16:03:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838e171fsm1105971fa.37.2026.03.27.16.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:03:55 -0700 (PDT)
Date: Sat, 28 Mar 2026 01:03:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add support for Eliza
Message-ID: <mrigb4vb77lr2nux2htuhiaowt7hi5rilulholka5hiwshkg5k@dsu4yqe7vsam>
References: <20260327-eliza-soc-pd-mapper-v1-1-17334d6ab82d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-eliza-soc-pd-mapper-v1-1-17334d6ab82d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OcyVzxTY c=1 sm=1 tr=0 ts=69c70cdd cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=pcp_vEgg3rxU9ewbONEA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: ykcSYZaDzQEsVz8nmHVeNyMogWynPy9h
X-Proofpoint-GUID: ykcSYZaDzQEsVz8nmHVeNyMogWynPy9h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2MiBTYWx0ZWRfX4joOnpLM6EWT
 xjONN0p88ySdyntzcKNiW4FxWVUIguZIFjWEFKyW1FRxO5+Qn6VRbAWFm9qZJfEFC9PF9b0LKiQ
 6YFoyMewDWcI03HNen8vvTxA1CBW8U186bS4q8OFWDBp7q6K6BqlwsOUPWpgZrGnFDF1rqe0n4D
 GvX+4olZlfLREB4e6UjePTKpOD3YcHdsAjeoqfNPJPbSRqgbve3yIx5NmTwQeSjVdOL1iCn9EUU
 gjg0Ew5RpW4XCmqTjfmY/5aUQbxgaY63rjl7nYPq4rqbY1/34FHm8wwOpRrF4u7JhteOS+vmoTw
 ObYYJN6ujZc0H0fVew4EFIRRdTvPQOrz4dU+B8u3PSEvxUN4CpPmFD/ZtJ8gd/0lX7qY3NsvVON
 vMyub4o8m6+zZu6Yzyv4lSEkEaFkXqBK4QzGguXyi5F6DWTPsONYK1bNLgwVVc//DkEKsQczGMm
 6SeLNz8gf6A4Z4UFe+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270162
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100492-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 190DA34C323
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 04:22:33PM +0200, Abel Vesa wrote:
> Add support for the Qualcomm Eliza SoC to the protection domain mapper.
> 
> It has the same exact protection domain configuration as SM8550 SoC,
> so reuse that.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

