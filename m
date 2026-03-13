Return-Path: <linux-arm-msm+bounces-97609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OygDMhPtGk4kAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:56:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3C8288601
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B04A7301587B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9045A3D666A;
	Fri, 13 Mar 2026 17:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TU7NFTRa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWSgSvde"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56653D648B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773424580; cv=none; b=GHjfIXQiQEbp+Lp0nTW1IZtRY+MGQc2wuURGhmWCTGSOVQl3lavfOZxBrXcGxUFhMuGgRMte5dJMVrZUw1PuzkyI2aOQRxgSPrsas6wR0ZxA8lYxy7Sw9dJtuop5YbExcOZNazFrrcAYH06p7y+ZEugsIPF5ggoP+9lEkHWfR9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773424580; c=relaxed/simple;
	bh=Weyup5hvJoqctgYQ39FTt3jpqy76YZyDf1bryi1+cus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbwCogc1diJHytyeQqur1cneFhongSd7pQvt2IduuAqHeHZ6kJeShObEQ946fdzyC4JKevk642rrfgzPKo4xeVfuHDbdpC9AcskekcM5XH/YLFSqe25UxLQBrN+YkquTtoaI07s1/L0ckc/yqHQPDG3il1H/p0c5bL4JfVTwuls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TU7NFTRa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWSgSvde; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DCmGdG3229784
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T0nHSm5dsiHf9m2n8csKq+6K
	k0/f9mLZIr/QYD6IAjs=; b=TU7NFTRaXxTGeooj91AXOvvZRNc4WKrBy5JMOfMv
	gsaoFFJ/kjqHGtV/RemvQcr4ZnOUmtUMBzWrfnE+DWhH1KjbzVt8CWLLimS1+uHl
	u7N6FrvYzwJ5cKAhWqZXYsC2KPjEqvtWH1EmJr51M2ElChTcV+aoMWL6hw3J9v2+
	qZL/TS1QDiTPRzFe+g+eLK2d96knaztGQqYhzblpB8odfY0hHjRZ+Tdk2VdZAd5P
	eEsNuQtMA5Qm1f4oJ3hDNEkp+qtv+mjbtlOQ8f9W4opAhNIa8EJ50KQJi2eOXese
	va6vv4csSTgd9B/CutefaXI+Fk5Wx6O/iRYLcWow7GRYTw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7k7uf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:56:16 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5fff50a4ac4so18711305137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773424576; x=1774029376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T0nHSm5dsiHf9m2n8csKq+6Kk0/f9mLZIr/QYD6IAjs=;
        b=QWSgSvdeqvMkhwvWJ3S6vobQS29CbkmMmaSUxSh0GPfzmknyMUiccwWiOLcWIPT4he
         vdSNXFYMWhk6gyQjI8L3sg0cyt5N50Uj4xIpWjrFhgynOE24fm3JlBkGcogYbrIiv6ZB
         yaQTVTATgi7q2nnbg1u9tUwMi2c5iwNgwiMrseOSoh07w0nIiqAC7mjmMMf6BBz8M5tT
         ++I6OntZr0OE1/ZIrfSmY0DoPsUbW1VvMYAWOJCj/90BKA7mjx/oeVfQCzgbNU7LjCt0
         yNIAS7urOvdzMnDSo7GmuASbTXCZbq8om8iSGRPxUctafrPIaatc2pSY+g7uJdOqmlP/
         HRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773424576; x=1774029376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0nHSm5dsiHf9m2n8csKq+6Kk0/f9mLZIr/QYD6IAjs=;
        b=hmZZ0zgtvqLypU5A3wvCVTReDJ9hCSjpTsAEdsEjv4E83eD85hRWS+7+lwmXFGpMr3
         UfsK6U27LC7CSu2EyElPEzYO/7KfXPn8QttdDHjG5zS1L5hd+N3QkZt6v8B/wb4PZCG5
         pCtCh3KdfO9w1rD9qjWqfuLutqCYmetMmJODwwcfM5FSUUwACuVNM7qgUYA0/EOcgE3B
         UUt56VxOjXBBVEMAGl4xNtEdhe73keLlRvI+0LtyvWNbf5cObVs0or2fk6fOHl53suLg
         bk8+fRRKILOmzgwS0xfFJn/ZYEwtfaItFCuXLfaOmBB1g27zaVIF0EonoMvo9MaP/6WA
         dDEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoFfE5iscTWpVN+cTc3Kx0EeJJisoYRjm04hscOTTM//FWCkS3DoCrs/fdsAlZXK4KSYhKPHwIFMfHh/0R@vger.kernel.org
X-Gm-Message-State: AOJu0YyTz15hCLJq+YYraD4DCNiKwJfMOw7JOR2wiAhjpo82o837Qz+D
	R9YV2e20N/r+JjbcrEbRTCYtxtd3jPkS2iQdjLlcCvNZz263JpqX9+pl7YA+IRIrHvBpPMc65vF
	sXtD4gDdPmdrnqqn5/9BGJ7Kj8lxyYzgTSowquG2I9lhNB6PR21fgDXvI57/tSzyEZbPl
X-Gm-Gg: ATEYQzyuAMvcrr2u40d3M6WOO9UnrmHzi0LIZuYJyfcIVW541yTBy3K/swQPQUqvyl4
	hIq9vQAQY3haSoZba6GW+KMVMy6KWYMIzZyyfNRY3n4hwIF111LLU/CUfO5snjHn9KJ4p0cCQYq
	bZtfPocM/jJeoHuliRzShtiAvLTWxVXgqP6jSVk4Q0dcbjFlcIjuffXxw3w7M7O02LxFDhPufFK
	3b+TiLOdK1nDAXVLMmb0PHim+5kmthHXxSq+ihr+xOaqo0UuI3taIBZDDi1Dy0IJiG8e+xXYtPO
	fp5Q7wlRpF+j4FDT1Q1qnGyZyttYFHoGXN3hwPxjx9lh2JnaxEtL8WW/2/VGzvpfXfHD0fR32RK
	AEYZ2LVnXH/Bp1elw2NdpkMV4pYgAISCMBqmuYlSvVrev4wtMc4wCfcJnj0KbLnUEq1bnHTIraz
	iXXwK5oYU2vKmUWkAscFzBrgkO52NAnoS7vvI=
X-Received: by 2002:a05:6102:509e:b0:5ef:248b:d533 with SMTP id ada2fe7eead31-6020e92248bmr2053216137.31.1773424575890;
        Fri, 13 Mar 2026 10:56:15 -0700 (PDT)
X-Received: by 2002:a05:6102:509e:b0:5ef:248b:d533 with SMTP id ada2fe7eead31-6020e92248bmr2053198137.31.1773424575497;
        Fri, 13 Mar 2026 10:56:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ebc5sm16479621fa.26.2026.03.13.10.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:56:14 -0700 (PDT)
Date: Fri, 13 Mar 2026 19:56:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: add the missing parameter description
Message-ID: <shzdpuesjea5lmkmzu6cnem7xv4adeuk5icp6bkxtxw5jrggag@6aqab5iiqes4>
References: <20260309100254.877801-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309100254.877801-1-mitltlatltl@gmail.com>
X-Proofpoint-ORIG-GUID: eK0l5_aJAKxu4Nqvw_W-r8wHIpk7FUlN
X-Proofpoint-GUID: eK0l5_aJAKxu4Nqvw_W-r8wHIpk7FUlN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE0MiBTYWx0ZWRfX5b9hyGsQZ/aN
 7O+nAICq7Xevrw0en2vjt9HA8nsAQWU5XkDwzVWfchhhMdPkNnZb8MBA0jFarAfeOGTTKDy5Yj+
 LX2UAurwMIpVfapGv+3ils/QTlJ27Utg56P/VoGmGIrcb/7ze/C3ACbhAqgHW5tdbUN0+Ah/U0H
 ACsEbHTdCOUvbPGjxnmBe1kPPDoAITdhuX7lPxYATWKYr9El0aloa6jGzYhFQN1JioXzH/qBTty
 sgeCKLISnD2lkc90ZqA/sbDicHyDaY0wi8l+t3ay6mNhJImbhiAvEcznmtUBhElQNvOm6iyJnoa
 oK8ftCH4A0kvOvh9YbfFst3pAMlvFja0c4TyspyKSosKctcIZ+kw2g0F5a6karzEVJzm0SJ4UFP
 RCjj9225WGbixP64MAQZAjG5LZuoS5g/knH9i5P1TXZUottN2FL2X3qONTWGDOy2BFQ0UugdQ5j
 OTScwTiiIhfCqS4o+5A==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b44fc0 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=LJNnJWuWgWF8sx2EOesA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130142
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97609-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,intel.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB3C8288601
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 09, 2026 at 06:02:53PM +0800, Pengyu Luo wrote:
> Add a description for is_bonded_dsi in dsi_adjust_pclk_for_compression
> to match the existing kernel-doc comment.
> 
> Fixes: e4eb11b34d6c ("drm/msm/dsi: fix pclk rate calculation for bonded dsi")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603080314.XeqyRZ7A-lkp@intel.com/
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

