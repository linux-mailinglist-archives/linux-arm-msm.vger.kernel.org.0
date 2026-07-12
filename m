Return-Path: <linux-arm-msm+bounces-118554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T34PE/57U2o+bQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:35:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFFE744840
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:35:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RBT1c7RP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bCriuF5B;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118554-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118554-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A60D03028B01
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 11:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45EF73A5443;
	Sun, 12 Jul 2026 11:35:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6F4372EE3
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:35:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783856122; cv=none; b=jwUcAFAwSHq46Wtrcnq4ur9z8frC8Octq5K2LWCXYq+MNYtT5NQXMXY2QcJgRFEr28UEpLazLXyzMRQ8p+MFZrtkdUMjum5R2upn40I3BKeRfCe+H/CQ05pN5xnvr9g+jgtr4ivjSOcVLPeNEVu8PJYXCmJnCDkwoxlrwxedpwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783856122; c=relaxed/simple;
	bh=VEamrEOXXhdzQlCWpYBcMhoy5mxqJ/BZr3QvXAhRTXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BtZYVvoIFiaAUcD1L1KiNQjpERaoe5Gp3MeQBePwjDiecyNZ8YVWI2PE1+oaF9VphCGbfj93zTgm743s5kePHq139BsMsFe4TjqKBeguptQlXpyj01dtwyVOnC2FV9PPsatck3IUlXpaMCYwsuRu+0vvhohOXrGv/gv0/yi9Noo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBT1c7RP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCriuF5B; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAcRmE2323990
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C/wSXBBN4gDQlGAHKupNpiLX
	9M+PtyJNTEFTUsKADHs=; b=RBT1c7RPzYBAedGXHdXmBTnwN5FnPZpHPQNSL5G1
	hyEafsAKOXd+T/QugnDyvL8xPk2jEO/eOLfLu7nJXq4VxouQjy5+6MpVnXDO37Qg
	BqKwlulzJOCN65RxXSTeOzbQOmEyDRIdFvoDSYcXD153X41BvoNKeVh6TJ5apDkK
	/x9V4o7LjHyiihA1WyhZAazmRt/PIYvH8P89oe9QH8//OB8XNQu9TswnO9QwhRD8
	/8yhKklJcUEu/btJ/L7k1XGJg0d/ZbLPZXevRRSkxzgeGnkAEc2+0ijkVqKVhwqc
	kWJxoaI+RyTKV2QMsl85uQrt2151mjqmli1aH1/1Uhqmlg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeehjqjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:35:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c12e43b98so32059131cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 04:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783856119; x=1784460919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C/wSXBBN4gDQlGAHKupNpiLX9M+PtyJNTEFTUsKADHs=;
        b=bCriuF5BH9UYDQ14VEHf6IpLgfJYjH8I8/DEISPgagnDk6WDLV+56SgXMv/hSge3M8
         ittjeetExna9+BKIN/cxJrrSCH8AhNf+BoDe6ikR7xvPnZbIz/jyrpduuNtMvi49t5O+
         Ha/jrdG2MAF80TM4kW/SJxeVuaFS1d4c5kEpiXwblmkHSIIxIoEiDfdce66CAq72ic/Q
         qNtebarouoe+E+4LpHrgbXzR3XjIkXwRivOtjwMWk2u6Gq/baYC1qwPWZTRpilf4ITqV
         fu95xUzk39v8mvOmQhcHXjhRdnAsxWbMnoUVmd1PjOXdkHrXDeK/dEFSGxrv3sqTNTLp
         mGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783856119; x=1784460919;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/wSXBBN4gDQlGAHKupNpiLX9M+PtyJNTEFTUsKADHs=;
        b=eByWEkoNWs15nVe07xred4E9n72Ev8pcEV6mFlK0n7xEnJ73L2QpXCnXVAqs9sw7BB
         hjH2pmDz0TJh/+vML7RcI8jXHjCCFEe4zQuX8AofbjTSFfuGWoO8c/+pDApxfskqKn14
         i+1U1/rMJml+kCf9C1i2giLi6KDvf2gIhBOchssDDZHjMczOiSZgxiLWsI48pLVaey1B
         4CLxb1grTGa86oHdUkTqEYpxUD9yJpw+++pWERJbnnlueb7hmVjVCtslghvL8YxGYBHa
         uUMOJkJpJlq5z5M5USjTRfRDveOgKn2X025ZZb3TGsKoXAvtFqh62sxFFC7xtDj15qxZ
         F5sQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXo40z2gBi2tj8/H/PxdEWwf+e+kn7PxOxWypQnFsAqydMOj2P9lwuQ8woAybrgOhtwH3gV3cOJc1aCN9W@vger.kernel.org
X-Gm-Message-State: AOJu0YzcMeGm3KKSfZgcDDh8Z9bPlQqsFSTRNQWczAvQDISZESzd8N7L
	Ey+AFmhHxXFj34b3BZYIAy18aazTPmn3n05YpeCQ7aFSRILRCfryUr10Auu3DqWGJYLp1pMmiWE
	5DdiF9oOFPJV8qhsgWzuMFla/SaTeC1mTeAZf0ikF2WxOPsKZphZw2Y+7Vg7tij27v0yq
X-Gm-Gg: AfdE7cmh5HCnIav7mqEdA1wO3HkDhLBSeeQHy3TpXTRJVWX1gQJ6v/NZoM1EZad9wmg
	rJX8AJq2oLoD1VuaQVbqwR3zhyUSsQ/GmK+tmzRFFeX6kB9rJuZEXMiURwKIZkOJLxJhkBbT2yD
	j5hV2fcPTlN9ucFSZ/hlF3Z8NQFayyqcg2DuuuSQKpDQloSDXFqBbWEKSG6eVFirRz6Um4Ko9i7
	mQr8RRSfdWwJqreSqS7chBRGrI5NcwNfA7VZHQNe7KJpN+giDN7t/AsiMjViQHXhfYVfJlnJWXa
	mHXK+SkhtfyulIezzcBW9UDQroteR0+dOHU/YlcJWABD53Nd/HCczSpQBJOz2iKh3f+FxSoz3yg
	E513S1hvgm3gi7nCrfu0FkOR4tlkHaKsrE8RPKfbJYgOVpyC7UrpAwR3WcJNuwe1Szxi0dWQ9je
	O2iHKTtvVUfimf1u66uX3bxuMf
X-Received: by 2002:a05:622a:54b:b0:51c:1f97:e852 with SMTP id d75a77b69052e-51cbf0e00d1mr55823871cf.6.1783856118757;
        Sun, 12 Jul 2026 04:35:18 -0700 (PDT)
X-Received: by 2002:a05:622a:54b:b0:51c:1f97:e852 with SMTP id d75a77b69052e-51cbf0e00d1mr55823491cf.6.1783856118185;
        Sun, 12 Jul 2026 04:35:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca5002fsm2010096e87.27.2026.07.12.04.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:35:16 -0700 (PDT)
Date: Sun, 12 Jul 2026 14:35:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kavan Smith <kavansmith82@gmail.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH v2] drm/msm/dsi: round 6G byte clock rate to the
 PLL-achievable value
Message-ID: <5zcohpmyufznjrqvs5iqpcbsziq7fg47e7rsbj4hndrcp4c4po@lgc2kunzwwd3>
References: <20260706180753.408753-1-kavansmith82@gmail.com>
 <20260707013240.681012-1-kavansmith82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707013240.681012-1-kavansmith82@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDEyMSBTYWx0ZWRfX4zVUoc6uB4Yy
 3y5PVK4q5gzjhsj5KXY5IORu/S7anrYzQkIoP6/vcO2hdMnERgOjgAjxWQwhSeO3JcicTK7FcDw
 DYSPaRNXemmBN1fzCHyG0DMGYtaRCv4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDEyMSBTYWx0ZWRfX7S9WhrmBKlCu
 ziyfT+0il/lpd8z5g8cIXUry9dngBTtYgpeFJMHuDzf3uPp/wx2MIJ5ty/jAGSbnSsDPBCFAVGI
 wI+ETpAb0y87jqT06VoHLDORGHjfZMYS72WmA9pSJY1XznXDCuZNrBC87cFd1WcfhUPnFVZH5+S
 mHDAPwr++b6DHaCMU2T78xGF3C4jijsKaxozPSbYzqs7KhclIYoPctxn9B4zduKrhiQQjLTDNVX
 FoHDkYIfQKVIZK59DXWaHVOweic10KzIVAVJ/xR5eAtuSasFHqndwCwXpWB6r3t9OmmD84hCNde
 2ICYDh2xVGdeiVvZ52xSo3TqQiaBQImC8ywZfBSmQ42+qIX2ET2LwXxA2bUE0KfG7rp2arjJq9B
 HA26Trcq+5phoE5sUDfJ0jP2XoF4fqVgeSg7FRmOqEA9fM0s9ldnT0MzMlK2xbL/Yd7azDo1+i4
 vVGaKOvifelYMcIKYkA==
X-Proofpoint-GUID: OaJhLb_2Ftkc7nH25bWi3F0NcX78iQkq
X-Proofpoint-ORIG-GUID: OaJhLb_2Ftkc7nH25bWi3F0NcX78iQkq
X-Authority-Analysis: v=2.4 cv=aPvAb79m c=1 sm=1 tr=0 ts=6a537bf7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=S4yUXPuXAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=chEMFHXW5F1Shr2T6d0A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=uB3M1fsSz_FXjR1IXk1m:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-118554-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kavansmith82@gmail.com,m:robdclark@gmail.com,m:quic_abhinavk@quicinc.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:daniel@zonque.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,quicinc.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,zonque.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DFFE744840

On Mon, Jul 06, 2026 at 06:32:40PM -0700, Kavan Smith wrote:
> MSM8916 runtime DSI commands still go through
> msm_dsi_host_xfer_prepare(), which re-applies the link clock rate before
> enabling the link clocks. That is fine in principle, but on DSI 6G the
> requested byte clock rate often does not exactly match the DSI PHY PLL's
> realizable rate. For example, the driver can request 56250000 Hz while the
> PLL actually runs at 56246337 Hz.
> 
> Because the requested and actual rates differ slightly, every later
> link_clk_set_rate() call is treated as a real clock change and re-locks
> the PLL. On a video-mode panel without an internal timing generator, such
> as samsung,s6d7aa0 / lsl080al03 on MSM8916, that live-clock glitch makes
> the panel lose pixel lock and visibly corrupts scanout on each runtime DCS
> command, including backlight writes.
> 
> Fix this by rounding the computed 6G byte clock rate up front, before it is
> stored in msm_host->byte_clk_rate and reused by later transfers. Once the
> host carries the PLL-achievable rate instead of the idealized one,
> repeated link_clk_set_rate() calls become no-ops in the common clock
> framework and no longer re-lock the PLL.
> 
> This keeps the normal transfer callback sequencing intact, preserves the
> OPP vote path in link_clk_set_rate(), and matches the fix direction
> suggested in the original 2018 discussion.
> 
> Reported-by: Daniel Mack <daniel@zonque.org>
> Closes: https://lore.kernel.org/all/1a682c5b-7fc9-3aaa-120b-64b239a355a3@zonque.org/
> Fixes: 6b16f05aa39f ("drm/msm/dsi: Split clk rate setting and enable")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kavan Smith <kavansmith82@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)

Don't send next iterations of patches as a reply to the previous thread.
Always start a new thread for the new iteration.

> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index eabdaa4..5119862 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -603,12 +603,24 @@ static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  
>  int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  {
> +	long rounded_byte_clk_rate;
> +
>  	if (!msm_host->mode) {
>  		pr_err("%s: mode not set\n", __func__);
>  		return -EINVAL;
>  	}
>  
>  	dsi_calc_pclk(msm_host, is_bonded_dsi);
> +
> +	rounded_byte_clk_rate = clk_round_rate(msm_host->byte_clk,
> +					       msm_host->byte_clk_rate);
> +	if (rounded_byte_clk_rate < 0) {
> +		pr_err("%s: failed to round byte clock rate, %ld\n",
> +		       __func__, rounded_byte_clk_rate);
> +		return rounded_byte_clk_rate;
> +	}
> +
> +	msm_host->byte_clk_rate = rounded_byte_clk_rate;
>  	msm_host->esc_clk_rate = clk_get_rate(msm_host->esc_clk);
>  	return 0;
>  }
> @@ -2056,18 +2068,7 @@ int msm_dsi_host_xfer_prepare(struct mipi_dsi_host *host,
>  	 * mdp clock need to be enabled to receive dsi interrupt
>  	 */
>  	pm_runtime_get_sync(&msm_host->pdev->dev);
> -	/*
> -	 * Do NOT re-set the link clock rate when the link is already up and
> -	 * streaming. On MSM8916 the requested byte-clock rate never exactly equals
> -	 * the DSI PHY PLL's achievable rate, so clk_set_rate() re-locks the PLL on
> -	 * every command. For a video-mode panel with no internal timing generator
> -	 * (e.g. s6d7aa0), that clock glitch makes the panel lose pixel lock mid-
> -	 * scanout -> ~1s of displaced/wrapped image on every DCS write (backlight).
> -	 * The rate is already correct from power-on; downstream MDSS only refcount-
> -	 * enables the clocks here (CMD_CLK_CTRL) and never re-sets the rate.
> -	 */
> -	if (!msm_host->power_on)
> -		cfg_hnd->ops->link_clk_set_rate(msm_host);

There is no such code upstream. You are reverting a code from v1, but it
wasn't applied. Please don't send iterative patches (fix for the fix).

I'll drop the chunk while applying, but in future please don't make
such mistakes.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +	cfg_hnd->ops->link_clk_set_rate(msm_host);
>  	cfg_hnd->ops->link_clk_enable(msm_host);
>  
>  	/* TODO: vote for bus bandwidth */
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

