Return-Path: <linux-arm-msm+bounces-98891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHajC8z5vGmd5AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 08:39:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAB82D6B63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 08:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BBD23039697
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 07:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80C332470F;
	Fri, 20 Mar 2026 07:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pmdwroOB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLJlBSN0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E46351C3F
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773992386; cv=none; b=nF2IcqnIX8aifKpWvOZFUkMb6NZoUcsj8fPuKLYsWdO+70DLQnDP9hEmumUBrfRcKA2aan8Aq7RjmTG5Pjd5TjLGXzC2SeYKOsKhOkSLcb1mVrXFk4krfq4VBBoIEoie+CURf4o5+qWLlPJRnjbETTmwP0YJ8kTirpu4EA4bij8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773992386; c=relaxed/simple;
	bh=YHsd+LM6JlYxfw7tk3vabZwEeL2zTPZ0zzwjD0iqJHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmnhvZ8XNvRDufW4hMEbM0MQORSKvEZng2RE/bKGTwERUsHAJ36vmKmXG5rKqdqaiDfgT14AY4SfnDFgEyk6ESDscnqAeFgwbX+Rmb2Ec7xsHfVWw5wZ7lod1r2oNFgdy0MYAPlgwOEoGRFgH5xDgeOky4YSbXLOIai+oLKU0rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pmdwroOB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLJlBSN0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2Y8Jl1526395
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1JvBC9OODow9TYPa7jEqKZFt
	uz/xNa7SSOiJgEze6lY=; b=pmdwroOBvURECLSvdzRVuRYwGVCdCkHMUPG1Yd1b
	Nv56Q4c6ydDJ6g7ZUC+ihzFYtI9fxVTMjPT2RdC+tY6QqdDoca9lIxTd63wN476R
	5kigQ/mT6jpgjWCChzmxpwse3Dwyh4MI4a1gPJ11kR5UALTjlW29h60EElpQB5Lv
	WeS2nEDyHJT0XzGeANILFaRDySsR41S+bObGha0hzPTffvqGJNBzdo2HNwAiUr76
	kX1kaSsDgrU3JB4Ig90Nnv2+DQn1ijftvZWGM/1cEM5+0qjdnEnnz7n0Y4LoMGwR
	WYDVttBwPrLTgQxOfxtvAw2U96cAa4nfGevrURQ4ssRfYg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0jt92nmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:39:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899f474fae1so263672646d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 00:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773992383; x=1774597183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1JvBC9OODow9TYPa7jEqKZFtuz/xNa7SSOiJgEze6lY=;
        b=GLJlBSN0BIcqc3rBTtMV5PnptKwMs2wkLiDz5Wn6B85QFmCaq5zcdvmXk2iBxt/NLP
         RZWUtuUySVGSpSKjnUAvmstdFzLqyNsfl+OefmEDnJY29wehDhzMnG1LDILOt4feeRZY
         zFp3Kn8RuipiaBXpGRpuP6panfZAaLyHkG9fAeEkWgOzXyJ6coBRt8VavjAsI4YKD5kQ
         aNSbfSLDprKT5tENC7zSAGmd04YHPS73X6yxu6EW0NwfPR+kqmj696E73t9jF+yaFrfy
         IkhAhoJTOProNiS5fLEnwwBTxfPIEjPazX5pRKbzHSLRA5wFet1ESB8TPW0+0/DeCe5T
         WFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773992383; x=1774597183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JvBC9OODow9TYPa7jEqKZFtuz/xNa7SSOiJgEze6lY=;
        b=LcsiaNRrfZBJbAZRAlbTKJqj348KC8AB7/MemJi6xKkp15iwU+km2SfB/E61MbIHq7
         9Ln42qrM4i7ZtqsrKrXUQhoHl/upXXc5kCdNlYQWos6GPuBmo827zYOUTsOgu1R8AlBu
         vw4AuZKT9ncf4Yrq5qwSDaKNo10LqytfsvAKezpimdYvlwiprqm8hMk3Q7jcJVFQ1RjK
         nRS0kwyrVaqEINvKprA2zMZOphehWX6Xzg1sSvm/5Ud6H7R+l0SPbVeHD9TBjVY42u0y
         2MMyDsgp6iHRFBfKkrYhUw/7mcCDpZBaoX1oN1OsZ1nMRVAZXeLFqRZjbaLThyId6itc
         1gbA==
X-Forwarded-Encrypted: i=1; AJvYcCVO3wjD3GCLo0TVTjyKN8NzqJsyBHjDbNCVVX967PDIRYksj19svUMuNWLwPPOqBeVyOWOqjCQrWZM4uFSc@vger.kernel.org
X-Gm-Message-State: AOJu0YwjcBGZc5deH1/iNI7Xzfr2o9q2P9vEg2tfkrJo7lJbqR2iABgP
	OLAYU7LtxkeXKedBaWAoTKl0LvduZL/qHHZCysVckP2Tr3PcxiNg6HLcK4i8fPzVw2nsfwEtR3c
	hpZ2RpgRjDwxYNUHgnum47LaQUrqWsoDC9oH++/1Hy+5gIJu67JNLO/OWxnNmlT3rcb040qL0/O
	/T
X-Gm-Gg: ATEYQzwPwAinIogIRdug1EuDnJae3dF+t1rvgVsXRGs0LF6hAPpZESKZBlIxBkxLHpc
	vtXBnKWJoy5WvOXwmXcyuxeONyVcu6ipP4fJ+8axGjO2OI6iJkcJckI6CcIqoMs63KdWQrfio70
	Rx6PjN+J/Q1eRUpxv0OfrtKNYpBtNu6kpcTKQHwg7yebh9sbkhuC0y29gz6OShbii7of2Vz20dy
	0FnQfVzPEo1X7/HRb8u34SQ36mM5YeGG8MCRUi2Hj1RlJh7tHszxzHWT8L4FKCnJVk9Bn3ZQcSh
	uuLScQ2twDyEQTyFGyO2A+01Y369/Pfxv1g3Nugj0w0+kDJuG87FWueP0e+6WxT8PdHAE7VbgGk
	nQRNgB5QOvLBGoXM3jC/PBeJTnm7bS5HWRIs22ty7BCsAccGOHsEvddEwkLZFCKynaINevTxVfC
	Z39cPTIZLfWOabKbu9KmWp0CEeVucQ974DKJw=
X-Received: by 2002:ac8:5d4b:0:b0:508:fac4:76ed with SMTP id d75a77b69052e-50b24796847mr86992161cf.36.1773992382918;
        Fri, 20 Mar 2026 00:39:42 -0700 (PDT)
X-Received: by 2002:ac8:5d4b:0:b0:508:fac4:76ed with SMTP id d75a77b69052e-50b24796847mr86991921cf.36.1773992382466;
        Fri, 20 Mar 2026 00:39:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf972ba78sm3909261fa.5.2026.03.20.00.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:39:41 -0700 (PDT)
Date: Fri, 20 Mar 2026 09:39:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] drm/panel: Add driver for Novatek NT35532
Message-ID: <wqbpvsy542sij2tb7uxksvaokca3yseednhu3omiczytt7hytx@r2jxzi4tzt6j>
References: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com>
 <20260318-rimob-new-features-v2-2-c1bf8917449e@protonmail.com>
 <byxrw5g4t23vivbt4xxpyfcsbrmlaju4lqqwsc75iqizoqmt4n@ltuwlggbitye>
 <4f3qSm2N-iqHmdKAzp6YslvLGtZbaeYJhV9pae3gtww5xiIUDM3Xov9wdCCumhINDMaHeFaJPMf23RqvZZkDQlE8D6hObDFaCd1vZjUHUoA=@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f3qSm2N-iqHmdKAzp6YslvLGtZbaeYJhV9pae3gtww5xiIUDM3Xov9wdCCumhINDMaHeFaJPMf23RqvZZkDQlE8D6hObDFaCd1vZjUHUoA=@protonmail.com>
X-Proofpoint-GUID: aCppawcQ2As6bbNRVBzwlLZ2HVotFJ0g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA1NiBTYWx0ZWRfX10cKqI/xTaGb
 ry/A8Ec0Siwr0YBHjNvGmGXaF2QijOISpuz4iPN4+gpYtbWapv43ZN4IcXJWlRbgFheAkQt+gOk
 uEv+4ZiUzWeq9zEi27w26XF1I/y+FrPPuLhA5MbXXx84/YNEIK02/VDFAY3136d/dJR0F6czRVa
 4nudgTHKN6hA2m2TqmCN5+sG1WTotUI17aDIMEEAP7BJ3VoZkqnKCB7lA0wsL+uRZae60EMrORj
 PWAeQ2lNvMV+mwkv/+RhaqVn1RIC5o544MPU/ln+O/lNOwiDHrCcIf7piwlCPbW00BGUUN0FZK8
 5hGiKvS4sRY4nMufQril3PG5G2Qw6kF32Of6j07uzZBaTY7jh4XDWocLyvHiaZHdN71805vGB6u
 zD+y6ByJqjFhpWVnpQqRfZi0Ld2tKU5SFYNhVba7Hhf0xr37K+KLl5gqwIc6Y2j7/YpJ6V758O0
 o0CieNSO4ESv0iANAng==
X-Proofpoint-ORIG-GUID: aCppawcQ2As6bbNRVBzwlLZ2HVotFJ0g
X-Authority-Analysis: v=2.4 cv=FKMWBuos c=1 sm=1 tr=0 ts=69bcf9c0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=sfOm8-O8AAAA:8 a=iTJjJGd3XSQqdiMV66UA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603200056
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98891-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,protonmail.com:email,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.963];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9BAB82D6B63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 07:19:06AM +0000, cristian_ci wrote:
> On Thursday, March 19th, 2026 at 03:27, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > On Wed, Mar 18, 2026 at 11:28:10PM +0100, Cristian Cozzolino via B4 Relay wrote:
> > > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > >
> > > Add support for Novatek NT35532-based 1080p video mode DSI panel.
> > >
> > > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > ---
> > >  MAINTAINERS                                   |   1 +
> > >  drivers/gpu/drm/panel/Kconfig                 |  11 +
> > >  drivers/gpu/drm/panel/Makefile                |   1 +
> > >  drivers/gpu/drm/panel/panel-novatek-nt35532.c | 779 ++++++++++++++++++++++++++
> > >  4 files changed, 792 insertions(+)
> > >
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> I'm doing a test: since I'm not sure if:
> 
> 	select VIDEOMODE_HELPERS
> 
> is actually needed in Kconfig nt35532 entry, I've temporarily 
> removed that select line and regenerated .config file. Though, 
> I've noticed CONFIG_VIDEOMODE_HELPERS was still set to 'y' 
> nevetheless, so I decided to not going forward since that 
> code would have been built anyway so that there was no 
> point for doing that. I wonder: is that select line really 
> necessary, at this point?

No, it is not used (you don't use corresponding API functions). You can
drop it.

-- 
With best wishes
Dmitry

