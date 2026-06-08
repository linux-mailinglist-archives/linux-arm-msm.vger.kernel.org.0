Return-Path: <linux-arm-msm+bounces-111698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6fMXLSdnJmrkVwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:54:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E9A653439
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:54:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Mwn/J/4n";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VF5FlxIL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111698-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111698-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 292A330048F6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 06:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C15314D26;
	Mon,  8 Jun 2026 06:54:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671D92E7F3A
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 06:54:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901668; cv=none; b=ts3VI4eNS3QcbU37/NUoLfJ9eN2x2AfQGgveYGU+ennnwQUWaQryTcV7RAP1CkzL1xpCS2CahyWn93tJtb8TfrnZb+rTFxTXeWlF/kYGgE5PJGDvOwo66HAG2VIO75GvMBW9JxWl3aVfuswgYunUGtvDcKTmqrdMQLM2lDQwhds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901668; c=relaxed/simple;
	bh=a5WPFdaL/SwQwazv9zJo7M8mvKByy1exC+zwhtt1IFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTxrLitoELhMc1pvA9ZBquUhcKXus0Jo8KcZxoxS4SgrQ8yKhg1nffS19MxJ4HQC+hPrSqxfbOeXXtliSOsNSQhwwBL45Nd6vj6v75MS7fuqJU7BSlHeglXZYemb55JUaqxk9Ss0xjZ+E2vTWFWd+dbi33B0rDVLOO5f4fQVTGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mwn/J/4n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VF5FlxIL; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OeCB2385883
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 06:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=H2zQplJI8sZJybAB1FpA0/Zg
	REmKAxPvjyF7VfGGQmI=; b=Mwn/J/4nHx4+4TvQFbrU2gb/qPOTmrQz80nuzI+P
	5xpVoFLgjCkRK+aUdpq44LccryxTu0d9IauHxN++bgjKLNiGjjjE9LY+9uUbvqsw
	Lrzo6klrP334j/MMlCHqpYYYf4xE2x+YbJXiCbT0GFRwN/fG+fYFoH1GsS5bsvg5
	cY6rKp40ziOWPkn82JEnYvXV8IX/0tqyJxN0hI6N5PqGthrg5ifeRiR7qzd6ObbX
	cqXDCNl8EBy5qXk+ZgtWtaZiaTafQu4KrYHQh54ynXSGQgCzZhf6r0gQHwwgQX4U
	oL8mkVc4e+WPjTO07yniObHH7q83lKTo1XEbHA8P86/EyA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8x56r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:54:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cfd2a26ab0so1620996137.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 23:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901666; x=1781506466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H2zQplJI8sZJybAB1FpA0/ZgREmKAxPvjyF7VfGGQmI=;
        b=VF5FlxILSny1+cZ+msWZ6KXd4s+IIWW+vqbOpfk4wpIdTVQ2e1ehSPBb73sZAt8UEV
         JNeF0xP6ot2oGQL7mJfPr8YrcviGPJ8W4FEJK67suNiNLTg5QLDbdG251xbChnJ4aL0S
         u4UZMJ8aRRtTI1cv6i2OKWeJfdJpQDNsRPpXcMwp3KoQ00TQKMZixUELt41hrEICt4ZT
         aj4A9xAEK7A304JU+xFvnEocApaEsrxem4qSqMDoDcoEmp8xliDU6/ANzFcf6LpJzijs
         je3PPDz9+I3Zk4wROA/cxEaE+8iDKEMZu2Slx/4wpKErzJWpR2TqKRUK7WQlk0KeDXZm
         /0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901666; x=1781506466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2zQplJI8sZJybAB1FpA0/ZgREmKAxPvjyF7VfGGQmI=;
        b=FlbJCKRuWFo/X+/tvRtR2h4CuRpeBzhiJDkq5ScbLadUtntdis/X5rB+ZE26WKICQB
         LzAKY1pDpqGKrVKFhspL4SPkH43YK9VKD58eG6jCkuc7x8b5Az/bdbP7qbuW7CIGM2/9
         64cN7SQYWDSVUcMMO3ZSwrnVFBLm9PL75ldfjRBIdP+HXCaUeh00B1OZzcKZyyGk2sEG
         Xzpz289T805yLrYblWMGZuv8jGaqT0cTcGTxZ4sMaubYOBXrCej8SuhaBXbcyOZAhNHV
         DJZZdiohoUsXH7scI+ztkIcoCbSNIYA2pVfJg3S7K/g9Rw5zF5BMMeAJIOo6ogOuJQEy
         8X/A==
X-Forwarded-Encrypted: i=1; AFNElJ9Sc+J4JTHFTcWQbiyFPQIkeiY+h8+R54GbKB4+Hs92lIeuo+L2EZXRhNymL4SeIS+QAnyvOTgn0kZ2u4GN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0od5IsxZMH6HGXKOpqBkqNi4iqUF8ZJZ+haAHw/I4hCVD7/kz
	/llHcsDQqLMqETq0AyS8lVJIz4OQgylAcUYvBefn1zhaEEOtyGZCEmp1OrzIoZXESxIOGhj4A7u
	94iKSEKdN3nUfjNuFzkMh5FEo6RflwhG+QcESCnUEiNk8e/DXfngiz9WRCiteBAzchgvNTmMWE9
	Gn
X-Gm-Gg: Acq92OFONVXIR9zptHaBUBwYgyYz4IczLkthBKIMACorL1U8tASzK/VhmEexvVtdsCp
	gKtaJ+ljztRHbLnjtGepIOnnGNv8tQ78LczwbLiu85BNyyrulsd5lJF4fB07arcPb6++mg7F+XP
	Kab35LijUXS1r0rFHKXkCjA1hJ2WJCazg7Wg6JIqQBndDPNUB1m0o0HP1JaG0wH8mnwPSbsTAM+
	DDZ93V0M+mshgjEXAUj6kKOprvuiKFwkA8DgYjfUZWkW40RoZSaJDEGuT/hYrycv14asrDsh55V
	Ck0cuiugAK1TUKfMs3H5e70v236qifrODqnFIVTjBoYfIsoflTqsBTuqH5We2u/+/56D+sMoM/o
	PnyPQKbgYUdioVwu2xbspOEmsAKeLLEOszoSPCYwGiDREEualVDecox25M8VZ8xF5cZjmUQyj/9
	D+Tci4NvTjRBpzxAt2piirXe7Vzw+YQOksTIT7P4A9DSHczQ==
X-Received: by 2002:a05:6102:1609:b0:6cc:f252:6929 with SMTP id ada2fe7eead31-6ff0285598bmr6415262137.16.1780901665682;
        Sun, 07 Jun 2026 23:54:25 -0700 (PDT)
X-Received: by 2002:a05:6102:1609:b0:6cc:f252:6929 with SMTP id ada2fe7eead31-6ff0285598bmr6415257137.16.1780901665316;
        Sun, 07 Jun 2026 23:54:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99c74esm3573991e87.81.2026.06.07.23.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:54:24 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:54:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 04/15] drm/msm/dp: split msm_dp_ctrl_config_ctrl()
 into link parts and stream parts
Message-ID: <eqgtv2zvw25gnso3u543m3ppbwvcd57ymgaktihkj3pwnheots@wzpueuvksyy6>
References: <20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com>
 <20260602-dp_mstclean-v6-4-2c17ff40a9b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-dp_mstclean-v6-4-2c17ff40a9b2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: C4svigz3FxOq-TZRAAvUAxT381hHDnjc
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a266722 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=CYneJor-kvHSDyyzVa8A:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX0XulAGb8Uslq
 EEjJAthMBo722JlMEVLxZ2oYzfPONci5ubnuItZojK46k7xrhowP1QMA9y/pLQVQ23sa8Qw0SB8
 0wQCZUlfm9MeUHoQZnwZOnW/oMEvyKoj9JvWE4oKuHMQYHGq4WbD+nUumzqcrI+ulNQw8dVe9i4
 o7jfqjr9+9x3G+RlrL1AM0UmBkmJQXNUa6MfLpxO1KckSjew7ZCNJT6it8tdAw9nto2SQr7Uh6A
 BEPBfDZZ6FNSQK10kwqi+8zm/IJEDFivTa1ABTh8aOoF5/9mFWHrTosEWq/t/PMbItrDQRchRlY
 Wifa5Yz0sVnJSQjMGKOMvnItnjdoL8rFtaiaYTRkDCEdZkAqBGcpNj66IgHgJvCdEaWh8GC3/xl
 unbWxQQpHVIG0ayVAMSov5uRXu/ys0hxtkbZHqJw/4uMy6oHuWp7aFGQJIaT2/njhRhp3K3jsBU
 NeQUpTmMcuvA8NW8o5g==
X-Proofpoint-GUID: C4svigz3FxOq-TZRAAvUAxT381hHDnjc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111698-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26E9A653439

On Tue, Jun 02, 2026 at 05:11:16PM +0800, Yongxing Mou wrote:
> The DP_CONFIGURATION_CTRL register contains both link-level and
> stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
> all of them together. Separate the configuration into link parts and
> stream parts to support MST.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 46 +++++++++++++++++++++++++++-------------
>  1 file changed, 31 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

