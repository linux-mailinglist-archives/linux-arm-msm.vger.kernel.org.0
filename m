Return-Path: <linux-arm-msm+bounces-95913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EINyIkkhq2mPaAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 19:47:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C767C226D78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 19:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 006DF300ADA4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 18:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7AC2F1FEF;
	Fri,  6 Mar 2026 18:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVAjrCY5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fs6CJktz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDB5330B30
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 18:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772822849; cv=none; b=TSR0F1EIAEbapQryn1ZLZPgo9+oWlfAJTx5LuHaas8/z8Jkoz2q1ggX1yX1oCptXRD1ybYT+zRRP825oX3lSY6k1GLTikYpqVgeNbKdXyobmkLQtyyvpnnqe/1c2C0OSxTBjBjKC/SOHQQ77guoV/QIXFj7oszgAN4Pddgd7H9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772822849; c=relaxed/simple;
	bh=DmUxAheTivvYp+/f+TdWWV0MFTOMxlo6Lv0jBot4KjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TF4eyIefsyKPgyZLXAmpM6IJL2UGgGG5dDpQfEKu5KWtY6VyVS7DGzV/Bg8zP6tq/wYQxHUEAs34NKfbMJubCqOg/nBE4rKS9B/mUBc6cVmawP0eZHIfxfdrCybGNa67rwLXn1AlYwe+HPvpMilU8sZD6kwwTa0JwW4535mGtkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVAjrCY5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fs6CJktz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H2HE32734439
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 18:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xUscRt9PkJfXclN0l0QtK+rE
	L2+xLTOFDpKgHRcpxBA=; b=RVAjrCY5rpNslW9GVgCRo31k0oo0n3frulR0LfeO
	6HtgKl3pBCq0JNF9c0YeQeR1StLG/7/nZi1jp3FOx/SQuhj6CIYIWfK/LHeONkof
	JSk3XX1bI5EWcHNbIiqE7Ux8sI6hxW7i045Hc/3oD0TwWsiKOGYO8e+qUnQQ0SIX
	qx6x/0oDpGZzTglb+eGWr/E7x3RNps01g/fQbVqDs5pG4w9MbR8HNHAbsyAiY7wK
	/DHOalIkXoGFohizLcu4qpeBTN4pepA7Ai70IWWPQBZA0AXi6AorjlRVu6Zs/J3c
	OiZbvv/ucEimaeG44Zt7i4Y8f48yShJSYcXnDFdaX1Zztg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2utrdp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 18:47:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4d191ef1so1287295085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 10:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772822847; x=1773427647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xUscRt9PkJfXclN0l0QtK+rEL2+xLTOFDpKgHRcpxBA=;
        b=Fs6CJktzs/1xGRhucl2RwkUo6vk5cm6Ry55btI2DKJryxb2h/zXZOqEAJ9mU+59gvW
         mm86IQZXW3PAxpJYeAKfnWK3KfAgWinpbgA7I26D1VE6v0rcCyDd1QgYWbwFhwb4aS8Y
         +/alO4HeHqsqCKSZvQzWGxBkQcBMi9MV4/EX4bvmOECbKUQUstQejFM/Iu3acoAW8iVb
         cIPt2mGYtRUogfvTlF+Mb8lo1vO+/uypDxwTZqg4bk64EdrTlff7wWJcoWfVlGNlPjyu
         xjwlzOs+T6l3vcSII9EGuEOTsZGZFkkvsilUfldRVFxtLW4x40t7weReKlQJtfiyHIwt
         YCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772822847; x=1773427647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUscRt9PkJfXclN0l0QtK+rEL2+xLTOFDpKgHRcpxBA=;
        b=dxfv6d7rjvXMGeFZPe8rw0k3+CGVrooLP6KjLvxiUdXdcS4C9BNNKJDnURJi1htko7
         Oq+Fh51s0G08Zre1Uf+4/6K4quKL4weWVheLAG0GV3/rD1vBIq81/pW+V1ttE5fnNmP9
         olr0IdEtJjLwS1IfIUPk3sUcI90w5oIWw23gR1ZLYrtbucXTHsKxumOjtTJEf6jcx+47
         2rpY9kZG2PabwLkCeImZxJqcPi95/LADk5xvHGIixnUEctbCSC6nbqgSA1RAiD6vlvnm
         ORYKo6Zn3faM5uRA/Ccaqym/pRpQnyD4zAwSZRRrTvrL6VytMEkyyRzi29XuYX8vGyD5
         cehw==
X-Forwarded-Encrypted: i=1; AJvYcCUJfHrLypE7jSVvoQ5z2KLH2HfgGZbGAiMqtbdYjyEqCWusXQE6ZRrGJbWIDwasYVOUH767cw7YUlJZBnZd@vger.kernel.org
X-Gm-Message-State: AOJu0YzsS5khISUhxYL6TFSBA4EIFM8m6TA3x8GWLEe8u41qvyL71tTx
	mee0sTILYp7XekeICPOTeSOvZdSHM9rt8dyLSrgkkFt4gjeP3d8iqm55v9RqinS9U3G1Ge8X+Tr
	h9Ou4MBfxQinn+8XNECvS6mM/l2y25hpidwYf7sBJBndnR99BoZ2B4WRbkk39z5IkMIYu
X-Gm-Gg: ATEYQzxrpdLyQ47N2yMQvodLrwn2++4CptEyWDUfahSPTW0nn6al8TSC3EoQ9XONe2r
	UeZSe/WxHMDYS7g/mQB22BHDg1pjQwcTmj4GxbDabbU80+ux1EraoUy+SJkQsw5V7ylUQSRIpbE
	06AoolQgqkzVaLZ4AO+6EJDWDDa6hbW2H5hc0Eh/riBB7HwnkkqsiQxyqLhQ7H+KyHXlGO9IVIB
	6OjQHJxXHCIR8zSd+vtrZPn6DboQmHPN8z0A1uU0xLekFR0hxUBVz7IbG1ImUbf9shZAtNY18XX
	yg55ldVD3p54dVge0tHcGI5QIuAJMV3HMIOV02UnWjMVOZqaR+KZyF+0miTbqMsLzSE8wraSgsL
	+QGO0ZS/4jJX8XuUhutHJiQw3SPwxQeebYzIDUdpVU+xQniHBK/JwZ2TmpgTgAxqUO3VKJZ4Xdn
	ZKirdRjZDX1LvqIOszxlOaNqWIS/UwcBw/KnE=
X-Received: by 2002:a05:620a:1726:b0:8cb:4fa5:d47a with SMTP id af79cd13be357-8cd6d494e49mr390658185a.77.1772822846522;
        Fri, 06 Mar 2026 10:47:26 -0800 (PST)
X-Received: by 2002:a05:620a:1726:b0:8cb:4fa5:d47a with SMTP id af79cd13be357-8cd6d494e49mr390654585a.77.1772822845978;
        Fri, 06 Mar 2026 10:47:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a41fa7bd5sm3212991fa.15.2026.03.06.10.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:47:24 -0800 (PST)
Date: Fri, 6 Mar 2026 20:47:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>, Eugene Lepshy <fekz115@gmail.com>,
        Danila Tikhonov <danila@jiaxyga.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Eugene Lepshy <fekz115@gmail.com>,
        Danila Tikhonov <danila@jiaxyga.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: remove bpc > 8 entries from allow list
Message-ID: <groq7xzuqen2bhumrjt7u4v6mnpbnoxzpvn4cue2fayb2mim67@u2ya7glxxgv3>
References: <20260306092518.37849-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306092518.37849-1-mitltlatltl@gmail.com>
X-Authority-Analysis: v=2.4 cv=N8ok1m9B c=1 sm=1 tr=0 ts=69ab213f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=pi0S-Vlqv1HzeT5xHfUA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE3NyBTYWx0ZWRfX8eohSDq6d0WX
 YfOirUhAhjhPtFQSJ4KWs9fGter/4WbSHpbw+VuVBEQqA6p1OLr0YNUTOUhyrcgpS3U9x8JHrYZ
 h+YRA/WLQxspI2vqpqH5csS98WVrUaPovaDZPrWil/VRvogWKmYEKISxYoISAuBjoweBTap+Jj1
 shh3drOzAPt84EEo3bAjcj7/MEhoEoXs5p8HlIV3BbFUSMkgAoRe+Aq31JFcb4e1VkYwpivDNhc
 VAYIAhflQpceZZE0T3JYOya8qu7RTcEiyGLokkOnXMOih11LZIRIhmcFOhWKC1FEK6fvnbny2BM
 U5qHxcf6qDW1T4xOOgohMGsFXWbcP+7MC2ItYIhX+sufhGlkvhMAb8N4nyaXGajhQnKttB+qSmx
 Ta3qRuFKfqjujgrDqSjwbnjXNenseTFG059XLWlI0dcRNG9VouxqYtyjxbyLyCXOnYLUhUdpUIo
 +eFRJGr4QpsY6mcdGpQ==
X-Proofpoint-GUID: hodP1t9_KT6q5lyNiUdJTnlIG_v8V3-r
X-Proofpoint-ORIG-GUID: hodP1t9_KT6q5lyNiUdJTnlIG_v8V3-r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603060177
X-Rspamd-Queue-Id: C767C226D78
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95913-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,jiaxyga.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,jiaxyga.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.972];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 05:25:00PM +0800, Pengyu Luo wrote:
> In upstream the msm, for bpc greater than 8 are not supported yet,
> although the hardware block supports this. Remove them until we
> support them.
> 
> Fixes: b0e71c2637d1 ("drm/msm/dsi: Allow values of 10 and 12 for bits per component")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>

I hope Marijn, Danila or Eugeny can comment. The patch series with this
patchset added 10 bpc panel and used it for one of the phones.

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e8e83ee61e..b60b26ddb0 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1824,12 +1824,9 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>  
>  	switch (dsc->bits_per_component) {
>  	case 8:
> -	case 10:
> -	case 12:
>  		/*
> -		 * Only 8, 10, and 12 bpc are supported for DSC 1.1 block.
> -		 * If additional bpc values need to be supported, update
> -		 * this quard with the appropriate DSC version verification.
> +		 * In the upstream msm, only 8 bpc is supported for DSC 1.1/1.2
> +		 * block.
>  		 */
>  		break;
>  	default:
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

