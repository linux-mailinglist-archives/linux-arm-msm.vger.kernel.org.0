Return-Path: <linux-arm-msm+bounces-98505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SATNDjqzumlWawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:14:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 372E62BCD24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E327A30E463D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F190C3D8117;
	Wed, 18 Mar 2026 13:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XvcSP2y4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OY2To3rV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A101B3D7D78
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773842266; cv=none; b=samOdB7ThXjrxhy/u51jqYbc2mK0C/B2fJ1zHqj5932hKzVwyZjzI5MAgfdzKXIewlcMtOyRRygTSYNnNLJP/iDWQKlQ+9ya0I4b3/y3y0nwh4HDsvYMxxpSTWHZWJ6eg0d3XDH9sTw3AGE78tNrAx872Q5YafsOtifjwzjPkzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773842266; c=relaxed/simple;
	bh=Tf7SwvGGIfLamX0Z+HIt6bAjpIXJfLR9lsuhsefl64Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivnEaNnND2LlK/5INDW4wGV+PiNcN9G7IINlk77bG0eRWE9oUoC1ea9loU2JsGeRZ1LhfvXT3dr4yplD8dttHT6ZSskS+GxWiL8qzVjaMPq49zfSZOgDnoNGATdT3gYdJ4tgrE/ahyAm+0UJMmf3V8fGlUXAstncGapdQ5xry2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XvcSP2y4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OY2To3rV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ICBojC909996
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x9u2qmoAdv7pYKpKSfsrbR/+wBGQsLJ01sARA7HpqUs=; b=XvcSP2y4TBDJzMIP
	ae2tANoqm0Bmzxsum/2HHyZ8z6mtOQMTc3RxUfwvUOr6cwA4ozFMaKuOr+FDQtL/
	UVZZxJ/uLPqAdPDM7UW7wgqx7viwuuTvgHZOiXjk3HudLyXFdDA7OmaRRuXIH17S
	AHFgibbG3X9CAJBtyw0c2xFRLkZTLVVDyLT1+hGWuUWB8bbAMfpwUwg4Ojba3Lhb
	EVbgG5bwlubU0xbqipeAwxVXi4xrDvo0SApv4kcgf153l6RhHYzEUpwDew0x3zwr
	emdmbFcUujVcbYeY2GyyyBU5/1jrALmfzstmzXFbtVDYcdJpEZLpyMmzt80DDnCl
	1gD4fg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyuucgc8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 13:57:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509011403a7so4750001cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 06:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773842264; x=1774447064; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x9u2qmoAdv7pYKpKSfsrbR/+wBGQsLJ01sARA7HpqUs=;
        b=OY2To3rVfGW5AJhuSboEXnynCzcujkIs27rmxanGaYBRSaHZ6eMYZq51rWEMCOqF8r
         2fkR75qFprNhN6AmA8WffK0T2vtk7IGGh58FLsLdXcygu8KBoTyFRqYUSVNG0yciGz4N
         ZqlpSanm7pccBXAu3oePu66/Izv3KQb1YlvRLdFN1wkEYGyTuI5kyleNnegsSTeCgLvP
         ZzNU5RKwNXn7HsVyz04y1H/4+a5evoI7MuFwWtFORCc58Tpvr98q4OdXf7IFm1nUy/bB
         Ea175g1qNYbejseCeDbc8JrsGWqnjC/r5bGoDesrD4RNeLO1rHLGmD4FNjBxW20GNp/N
         f6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773842264; x=1774447064;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9u2qmoAdv7pYKpKSfsrbR/+wBGQsLJ01sARA7HpqUs=;
        b=p83A943HtPSV/yX5sLD2Uhn4FzmYtH++t49GoVMlnh84XE6SR6FVePBAI6NGX86Ud3
         CQiFjNJPtpnnseG4X0d7EhGOz1+GgLssZnCelvOlDucGSPDr9x7I79aDZ6C76tQdbPvl
         H86LWYVeotoS7BLEsktO/0YpwwY67xmdUCoG7a8RXAk7NOC16twf1VFskoiKaIaIuk4w
         V5O3v7fJLd5UuBUNKxgZ5oOm0jRpaSDHU1EqtjGCfYgL3qSriGLHE7KsDhUY1k4yLZ9e
         N1fCmtGguOMJZKs8eWjeQpN/lDneDnZQMmeeMskySWJAb0q6gRU5yVBSEZs9urm5nv35
         zYsA==
X-Forwarded-Encrypted: i=1; AJvYcCWC8DGWfxrFRiD0lFQBcUsWfH6hhfKmPuNNm5VE7SDLk1HH17fYBscdSFnczLB6hXhmpyJKqqS80XkHiJiN@vger.kernel.org
X-Gm-Message-State: AOJu0YzN0HD/HRxw7lblVzuSUpQtJMLRv7mjxWvXfXue8L2Tj+w2Dtuk
	xulAtHI7+PdOQqcNVKtLdRJMqGC+If1qMoj4HADQqtkcJLkJi2MQFCmWrBHBtc5Z1tGZSirbNtR
	Yz0EhOxP6xg9QnERIb47xajhBz9Jh46VT1pg+i2e+z7xHjmL+eeOGRsm0zyz3/fQqj/TD
X-Gm-Gg: ATEYQzznzRXnurf2YG5Pb2txwkl+o/L7cyhJhfuV7AnMBSkFsjVVPBYOSqpdepexR6r
	LVieTL8YmLA0lhex3n3r9QsNh5SeHWRXl/w2CFEtlF3CSpJkhXTL2Gfpiw0ssqhowxAL2OQIb96
	+d4I3MrfYG7UA3dts4JtPbsToLo04FHV3qP1S8ktKLu0y8aRJoMC86Y8bf/u/EFVzktq4FwC8fW
	uvhq6OQCxViJmCzhv4o6s0TJIZCNVV8BIoqPeKh+S1KmaTiXzhrXWakD+QrTzJyxFyNlzNEHwJL
	1+dHsPFq+XrZxT8rgo3CZr7ymeud33Jc+rlg8nf8aiJ9lbsb2GYPi24JwQ2h/xIWlOweOf3gRky
	tNyPQZn8piDBT0JPbisovqf9Tv2ToF5Gdf79x253JMQEHmQSSwxZ9SIPURIjNkEkGMdtp2oecCB
	LrwsSI4e6kJedsj4RZjQZ0z7vTdlb3mbTQ9HY=
X-Received: by 2002:a05:622a:1a81:b0:509:24e8:ec38 with SMTP id d75a77b69052e-50b14751d56mr42403401cf.10.1773842263839;
        Wed, 18 Mar 2026 06:57:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1a81:b0:509:24e8:ec38 with SMTP id d75a77b69052e-50b14751d56mr42403041cf.10.1773842263314;
        Wed, 18 Mar 2026 06:57:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd517e114sm6366201fa.18.2026.03.18.06.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:57:42 -0700 (PDT)
Date: Wed, 18 Mar 2026 15:57:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?Q?C=C3=A9dric?= Bellegarde <cedric.bellegarde@adishatz.org>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, antomani103@gmail.com,
        mitltlatltl@gmail.com, krzk@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: fix race between cmd transfer and host
 power off
Message-ID: <6wu7eezhtqyatbvoryprfpwkcmofdk4albr2zedfrbnrw37amf@rx4lslum3u6b>
References: <20260318105635.270949-1-cedric.bellegarde@adishatz.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318105635.270949-1-cedric.bellegarde@adishatz.org>
X-Proofpoint-ORIG-GUID: 0VReBLskdl_ukmllsULw5_LVgEc03eDS
X-Proofpoint-GUID: 0VReBLskdl_ukmllsULw5_LVgEc03eDS
X-Authority-Analysis: v=2.4 cv=U4ifzOru c=1 sm=1 tr=0 ts=69baaf58 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=LCWlJkpBAAAA:8
 a=1BZaoZaY-UnUrn2_TpQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=dawVfQjAaf238kedN5IG:22 a=z1lahxahPt366DkPXCx7:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExOCBTYWx0ZWRfX6HAEfQkMbOXt
 RewhdcUYv2+gwYv0Fj0NhHv47ZhreR10rQq2jh0YSRVab6yJCFTvDNehhhpdL0wPC4m/cMDqV6q
 XLy2pB41+Pyrgc8EpIBCClBtNsSmk4dpdOfrrTiue1wV/WHDp5xVCoVDg485WLznpmMuKB/i1Dt
 mSeXQIQj/0aY9oRP9oBTRllqqPH6bKoBTT6otgwd64mhcHgbCb5IGvEyK3SEvqah+5aZgi1QieX
 y0FgDhdeJeseZKbtl0dVlISST2XLwJfSx2gDUdUFh2wrTasbbNGIIcbqaLZHs1SVLWzB124TEIp
 uMgg08SsD5TFdAHYq8tkOEFN8HRGDZW1AZRN++N2TlRS5Rndz8Ss7iHXKghdMUkcSduvOMeZzIQ
 LgKrX5DmJF5yZ1tV/hqiNw5ZJr2OxlpRXZC4Ay424GpaUf1joWibAsRlUn4L8QIgSjyoXPHOKK1
 ZREyG70laef+ilWPXlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180118
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98505-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,adishatz.org:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 372E62BCD24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 11:56:35AM +0100, Cédric Bellegarde wrote:
> The transfer function dsi_host_transfer() guards against the DSI host
> being inactive by checking msm_host->power_on. However, power_on is
> cleared at the end of msm_dsi_host_power_off(), after clocks have
> already been disabled. This creates a window where a concurrent DCS
> command (e.g. a brightness update from the backlight driver) can pass
> the power_on check, call xfer_prepare()/xfer_restore(), and toggle
> link clocks that are already being torn down, leaving
> disp_cc_mdss_byte0_clk stuck in the 'on' state.
> 
> Checking enabled instead of power_on closes the race by rejecting
> transfers as soon as the bridge starts tearing down, before any clocks
> are touched.

Thanks, but it is not correct. The transfer callback is documented as
requiring to power up the host if it is not on at the time it is
called. Could you please implement corresponding logic?

> 
> 
> Signed-off-by: Cédric Bellegarde <cedric.bellegarde@adishatz.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 4d75529c0e85..f66f138cfba0 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1652,7 +1652,7 @@ static ssize_t dsi_host_transfer(struct mipi_dsi_host *host,
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  	int ret;
>  
> -	if (!msg || !msm_host->power_on)
> +	if (!msg || !msm_host->enabled)
>  		return -EINVAL;
>  
>  	mutex_lock(&msm_host->cmd_mutex);
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

