Return-Path: <linux-arm-msm+bounces-102689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LU0I5EA2WnDkwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 15:52:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 289093D85B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 15:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8338B301CABA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 13:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E353C870C;
	Fri, 10 Apr 2026 13:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SGfzgDEf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U/qS8vkv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89F3CA4E
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 13:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775829133; cv=none; b=hvYgnsn8BPfOsrEs09Al6qnLKTqbDoXLYGmK/InH4igAcqSfrMkPCdW1LKaL6mpYilZCCrdZMrEddNALALnCP3GDXWGxxr0K+C3iLzXQ6VZ/ha3i7PqeHReYYNFh5vVkP21W7QWe++7SFmja0KT4AkNA7BLFMp2W7Yc4Q7YULRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775829133; c=relaxed/simple;
	bh=IYrzl1RAbgYLt2WhweFfHvY7HqTpdJYal5bLJ4/d0xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbeiAOjGwRx0LQbDBNQlPmTfC6HXzEKzTWNo9mEXIh8B+y+mcx5SqsCexGU6pg0rsEZExyzFbbicrRkFo1qe+KCkCHPgU3V7OTzW8Cuc7y0dYvJoLGO1Xu1sHHOg30OyGQaHgnCdAX9yBTnX8VMgP0BgY8JUim57qSSErptusk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SGfzgDEf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U/qS8vkv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AADj0U2698258
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 13:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D6n98aPN2xgHIqFP3YmENZo5
	DpksRhsWwsJxP9z2Dlk=; b=SGfzgDEf79p4IOvBYHZ3MlwLFiGZYl4aSfj9TXLt
	5BrXDR08ksy8IwQ1TTzgSoOr1usAXtRoh+n/iru1LvcvPw2DVNmtb5+wau8NJt2i
	urH67z27uUOl+VNZwpSZhDFSmaFRAZ8NG3uMTBWW7Z9OQyNSAij/JOPfgoi6Mw94
	YBH19kB1/UA/+eayBzx+RWoPwpa2GR49TEHf40A3T7ODrkCwzaq8kWyQNhE/Wo45
	TJxjmYIHCWQkDC/AwFzMw1kTFyH/bu5b8v63cRU4LBTwHBIqGxoqoMGUVViFla2s
	Iry5V/3GG98bgYeoh6Cx6g5GYrzoPlY5t34sZfT+pSJ1rQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9ubyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 13:52:10 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-953c8c95134so2587931241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 06:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775829130; x=1776433930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D6n98aPN2xgHIqFP3YmENZo5DpksRhsWwsJxP9z2Dlk=;
        b=U/qS8vkvpuQaK8Nt/7tF3kIkQz+I+2GljCzCpMmfJbx/uAea0EsCnqCVRxGFBNJBx2
         UtjNxW1o04jglbJ1Bw0Kx8GKHHyZdT2q7VVCOv1Rx+Ixlwnu0nQXGJ011gYxtH7eYDK8
         sa0vzElDLzvRND6TspqkrcG1DQxdf1OtyxpZnOKRdArxHd03Xtyb4NTFsmRtJkiAJ0DY
         8qSnw0P8iDAqgAcvaVU0LXUEcIXRfdKNkqvRhbZvb+PuSTeUAuNe/Y1/zQoCTbBpHXR8
         1APfx1y4FIdTeu0wMPIQ8icyzPAyPf3JQiVKcQHG+yYJBkh+T3LBBi3o08Uk4DqLxzFv
         cVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775829130; x=1776433930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6n98aPN2xgHIqFP3YmENZo5DpksRhsWwsJxP9z2Dlk=;
        b=aS9Fv6Cd03dEEeB29Nn1w1rZkHwLz5uzkzNjti/v92hxOpWCIV01tgG+4CUJGIlzEa
         wwdlT9bSlUErBDrTDsUxP+x70fa/uFHH9wCD8YQXG2T5seSFSlFVQlwf6/e2Se2o8WHe
         mNGGu0xrvb3hU9UP/S+nP+DzYmwF2FXUk6QJBN7Of4piEc2jgHGeysDrx4pT6nFg1qbK
         ZBnWVNkwqQcF4zZabi2rZ2c7UnOAuPKeX3zKLdZ7Ybxh+5pmW/aA8GHfIpT+Va3EUdzJ
         NbWvt/D6FqHRV6edepfg5jiapU4iXJIuJobzGuS4PNu16/m7YfK7sNIZtDWFaS62Z8xp
         9JbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs8SzYwGM9LeSteZrZ8UccaBYwpTvTAL2rGvV0Tn1K3MHMe4swGEAEb+AE/F3CyMtAITHl4/JRIbPqjYOc@vger.kernel.org
X-Gm-Message-State: AOJu0YwZvfov8yjVvMD1WIQu1bFfst9RayFIkkJ285DeX8O4egXWsJml
	8K9kMFDjzQperz9e2QcltOZsxXV21Z2T0yCwmUfEbMiDLI9M8Gna59EBvCMyjuaVRhhIRNht02T
	XGv+pZzkGlCwycHD+WcQ/HYZxDnPn76Yhb62LNJr3wpzndJSAw0yUrTGb0GazOwlfH/qK
X-Gm-Gg: AeBDietJB1hjrgiOR65zWfmZFXh5cVWEt6ApQHFJHaak4SgN2BcKsxHRlEvCzuYVsrh
	BCiDx7xOaKa4DdsDW1TcxR+MvWLBhqULAwOXJ+44/XmGVw/6vRuRW/W2Far72D4apTZvxeBXhs1
	wDmjEa8don8yPlorSG7w6m0Tbu08xJtR5FdQjOUBk3IUSEc4JVU1WsehcyVtIYC5hIlFuk3wY7k
	xL7pY+70ifQbh/BhrRbcPoK84F7J0Hy4OA0mdBrzIpKwudORjiAyn2MRIXERvfpasHe//hEEBIa
	tm1+hRHRVdnGbEn+jhqsHOpsRAb+HR8q/B/xTbozKKNkZ0BBL2WyRDsozm2ini+EUhMSIXpR+aR
	UKwVNGCbbIgot/ncAUPo+C2Txjd/sg0hKJ0PZm1I823k0JUJUlAjlt8vElZIla9swoCCDGiuIyX
	8MXnzVqyy/O41RNftUPmG35NEsMMM9py5GixY=
X-Received: by 2002:a05:6102:6044:b0:605:27db:c899 with SMTP id ada2fe7eead31-60a01472c5dmr1167181137.29.1775829130164;
        Fri, 10 Apr 2026 06:52:10 -0700 (PDT)
X-Received: by 2002:a05:6102:6044:b0:605:27db:c899 with SMTP id ada2fe7eead31-60a01472c5dmr1167166137.29.1775829129762;
        Fri, 10 Apr 2026 06:52:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee86a45sm754519e87.11.2026.04.10.06.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:52:08 -0700 (PDT)
Date: Fri, 10 Apr 2026 16:52:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/39] drm/msm/dp: remove cached drm_edid from panel
Message-ID: <7cnjdge435t55s5vf66fkjfmkz7jvcbbax2uuismyc74mv4eia@toe2vu2folqa>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-1-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-1-b20518dea8de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEzMCBTYWx0ZWRfX+5hf5XQItfQH
 GS6VtGO5INqs+hPWMyeSazHbBuqJBROituYTNx9LBuYasRQpKyz0je0iODkrRcI/Da9f4elX8s7
 gGzjVeefZtkB3Y0XlDusFnyM+ECj5GbDdzApyvUK8Vca4Y97Bvl1WTsToCVSc+uyZEFDsmXmhC7
 5On9Af1Y/6kLtmdI4Sf2N+Aykyxp1vKQo13ZP0JkDq06L2QmAQHFWxZt4BE4ML5knYkM2O5Oy8a
 nplyLi+dCrUtsaSpypIVCcwXcNmnn08wkaVTIrUr1TK3NnFzlWjne6cONh+f2Fw6CruscSM1Aqv
 7jeI7lcw0XXki3qxHniURJJ50CGGsQqXHsL19AUmhyDgDg5/lp4plWHTyQXcnaX191KYGw+AF09
 LTVinS2vnE7C9DA0dMch/hAeHpPx3gB+kz2gietuAyGXuqYuIh1dOqguBsAlc7cIpvGhJMkfAsQ
 kz0EQ62iXyNBs6j7XXQ==
X-Proofpoint-ORIG-GUID: _r4KN8OK1Gg_IzLqdw5BMSI8YEuV415T
X-Proofpoint-GUID: _r4KN8OK1Gg_IzLqdw5BMSI8YEuV415T
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d9008a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=moIHXxoqlhIiEUXYKbMA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100130
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102689-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 289093D85B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:33:36PM +0800, Yongxing Mou wrote:
> The cached drm_edid seems unnecessary here. Use the drm_edid pointer
> directly in the plug stage instead of caching it. Remove the cached
> drm_edid and the corresponding oneliner to simplify the code.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 27 +++++++++++-------
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 57 ++++---------------------------------
>  drivers/gpu/drm/msm/dp/dp_panel.h   | 13 +++------
>  3 files changed, 26 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5c6a24ec140d..e28cc1bbb5b1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -268,6 +268,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	const struct drm_display_info *info = &connector->display_info;
>  	int rc = 0;
>  	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> +	const struct drm_edid *drm_edid;
>  
>  	rc = drm_dp_read_dpcd_caps(dp->aux, dpcd);
>  	if (rc)
> @@ -275,10 +276,20 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  
>  	dp->link->lttpr_count = msm_dp_display_lttpr_init(dp, dpcd);
>  
> -	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
> +	rc = msm_dp_panel_read_link_caps(dp->panel, connector);
>  	if (rc)
>  		goto end;
>  
> +	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);

Where is it free?

> +	drm_edid_connector_update(connector, drm_edid);
> +
> +	if (!drm_edid) {
> +		DRM_ERROR("panel edid read failed\n");
> +		/* check edid read fail is due to unplug */
> +		if (!msm_dp_aux_is_link_connected(dp->aux))

Does this work for USB-C AltMode usecase?

> +			return -ETIMEDOUT;
> +	}
> +
>  	msm_dp_link_process_request(dp->link);
>  
>  	if (!dp->msm_dp_display.is_edp)

-- 
With best wishes
Dmitry

