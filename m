Return-Path: <linux-arm-msm+bounces-98857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OTeGYGnvGl61wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 02:48:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D876D2D4DBF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 02:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADD3D3023A65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 01:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780882D8796;
	Fri, 20 Mar 2026 01:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGineV8l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YqVP3kyY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAA52FD1AA
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773971325; cv=none; b=Xwmk4oGKfV7BzfEGkyPqzWddff7/Nt7OzzDD1EkgTHEUEBbJI4qMjoff9cxgSuFQyHK6fdlyvIhJYOrqbhHMK2ZYUoRJFnDPbNob9igdGqjdWcz4ewA+YjNPjEV38tZl96NXzYGbl+Y96gTxvIPeZJWDu/xp8BNQwz9MSyftLvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773971325; c=relaxed/simple;
	bh=urV0Qtt7vgHGTvVWMudBrf18Pe4E1rGE+8BfNjxR3ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyvEPr/wpxFaustdrvs1q7xtzI09cMpd07OODsZ8jdYtYGe/OhpMjoVRScfPfLoa/A15AJVQC7pRCTH8Qvtv++F4m0Zwx0cAZBbmChwRci+JO19+aPuu7uQMOfaw1q33g7uiJ6DfYCFgrY5s+1qEAwjcteXTOasbYoVzqNvLdQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGineV8l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YqVP3kyY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K0rsQe1567148
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nlFMLVa07a9IMlgit7CImUyQ
	MUM2PByEWw1Tn2KTY2k=; b=MGineV8ll98GfDhLCT4i4ekLHGxb7nKOrxRahsQl
	E4hFwA8hJwBeszoPMzKgk0VfPO50mOabCj626l3hIjJGNXT8uqLomvX6CrfKROdU
	PPNMsoAmT5OkklZLxiapWVPTV8jj1ZDjbv0JtF7JGUH12WaNQh6dq7omnEaEAlJ4
	/ZkBB1TTxjkhvCEL5/wNY0LRRiF2Y1vMRcOGxO7eaZjOMWuU87KqptixfD/CgNDK
	Ly77qFNPXOwSsaDoBJrKvc+z+s3msc1pkGf/0WwureBnsERxNkEZFe66nuf76WLO
	HhAWKYMi/n8BMQOEmP1w41Z+yglyPpfkYF7TYlGwvgpuag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0akxkjw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:48:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50925fed647so114061651cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773971318; x=1774576118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nlFMLVa07a9IMlgit7CImUyQMUM2PByEWw1Tn2KTY2k=;
        b=YqVP3kyYE10FrdxYaOYh2+hG7pW0ol7vAwP37nLiGy4jHW+96zBLKczUwynR1s8yir
         d95mTz0S1UB/eDA/y9u6qlL46tohy2QIZGhvZQz4uRTS6gDLDXPFyO29x329MpsS3nSC
         1B0RdyrP/SjO7Fl5ghK/aleJXh7EVzGTJQG70km14oWQo8epxIkgVAyAwzE8QR3Jh4To
         1Ni1FODCQhaYq9xBOHm7OOwWV4EDuYiMXwi7yO86ZLM7om5QUhkBnn1uorSoSzeikYNA
         68bm0F7OOFRUGiWxbvlMwEyxIyUDvNnTuD49z+cQo67dlMre3rZz4GzLU/8/yr3Y17mm
         fiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773971318; x=1774576118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nlFMLVa07a9IMlgit7CImUyQMUM2PByEWw1Tn2KTY2k=;
        b=fUKrxpSPO5XwuQQ/1Tgjp+NVRIu9z+FJv1FHjh2WdIj2XiPMCjpeJUIKMFSdMqP/Sx
         vZQBelIqU0zWURBPqddo5F1L7T6++TYIYuUJ6T8MTCKQiZXHsk9vaDxs0GbDv6qCFaGc
         SnTOQ4ZznzYCPA7Dpl5/XfOAbP5qWx2UFkXORYtqBgPLoK2cjwm9/eJyew9ACaM+cSj8
         WZFLLDE065FPzR3nUCyH04T3XwkBAilOf+PN3tlWpaPRDp5y7qe5SNGnCIWPaEybsNgV
         P5bIwy0s7iZYYGHxyl6NfbjauPoNlCKCTeLQqLcYGjScvaEqCbjEdUCL40LyHJ6uGuin
         22PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTACAlqvukCAj9Zzk+O9aihbnAA9hMdyOxucRIKIe5I3W64n2A/Wh8W8Z8ztY09IgU8zPQC8xf+zls7/oO@vger.kernel.org
X-Gm-Message-State: AOJu0YxBclo9dulrvkqNbqY0s8aMlyVPGJZA3DLNWka+rSRse16z/gAJ
	CFfrjGahE5eOKaqwDHvMfVcJ5RxkWtPfOkeR7HdkVOC+/1V5C6z0QFbAWklnQ6sDzQe/H6aviZC
	HVyYgM9wpboMCFe8DB19+/mopj52gWBoGB1DBllzkOogHLgQdm0NwlpKKP9knA7mM6Kvr
X-Gm-Gg: ATEYQzxeYslTaLId+WPxV0UuYxsfSdZw56yHQKEbA4aoMWXLGlh3S9Wei+zQE5UPgfM
	VSWw7P5gtyJ1F2sGukZJXF/rlxY7CqLhSkF9cmY09wqoFgM4cXJfWc1ULs81hKtRsLX40J7mUMB
	aju4MtP1umUlOE96gwS4SDU/JzGVZ4z/U2BsZjnqFR2CYkbDxvI9mNBgwCX1U6Ejrgwwu3aioJ1
	mi8/uP+tXrB5wh10DDonYasuy5J4NO78f7jVUq9qbfnmt4LhU7Pyzes/ThYmVbTbRRLVKgZdofR
	rwAfCuTfO6OuXbM3BI+knY5pOiKFnr4qwxp65oFBLUD6v7uLqIk4LBCtIuXX3Ol0wiqAyG82gxg
	+8gwPfA7lOevz7FyMb8bNwo6QQ2QaW+i6gS9Otf5LfHaJJSKLarCYM1EtExLVmSPZ/qzRTgoWiF
	SCjN173QgM/yFeUMNdO+yJIBFad2rRxU6uH68=
X-Received: by 2002:ac8:7d84:0:b0:509:39b1:d4b3 with SMTP id d75a77b69052e-50b37505441mr21584091cf.47.1773971318522;
        Thu, 19 Mar 2026 18:48:38 -0700 (PDT)
X-Received: by 2002:ac8:7d84:0:b0:509:39b1:d4b3 with SMTP id d75a77b69052e-50b37505441mr21583721cf.47.1773971318073;
        Thu, 19 Mar 2026 18:48:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851ae39dsm238925e87.36.2026.03.19.18.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:48:35 -0700 (PDT)
Date: Fri, 20 Mar 2026 03:48:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm/dsi: fix bits_per_pclk
Message-ID: <dggubmwmcgepioyev4jfibntdgmmiiomahnrvodewcw6ktplo3@bngbsgvzuzoa>
References: <20260307111250.105772-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307111250.105772-1-mitltlatltl@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDAxMiBTYWx0ZWRfX0mMB+ixVMk3B
 u8OEZXbYd14OLlh0Em4F+JKeQUZMe9Bjxv8KvraIjjsz38CHX7A32SY/rweTz3jkJiR9twiXXeB
 QhrmLprFm6kBaGiLUA/5KyU03GfpIiUE/+wQlZmLtiiAq3DOh9v+qy5FMGzmuPs31kpDxkSUWsU
 vzDSI8KIhn7lyqJw3eO/P8Gntg/mfUPy96glBfYEGse1Yt9V+8Z8/Dy890iFWpsDldEyb4G9tYB
 5Yolju34ksNjX+S2AXOOk/ThBAsAL5E/Uw80e7jP3+O/ZvgtJHrHWaSvgmZ6dE6G+d+7CdG5bWG
 M5+PHmiGsyeJzSbSKX1B+9W43FG+f2VipCmJ2rHUSQGNHAlx9Xcq/X/VdmNFnVluy0LrfRZtTxs
 8TCzKXpN2hL/5yMM7Cs4qij1CSKgmAJvlEgw5aFqsVQgO9GIcxiTFM0uO8I9dujcBy5MS+x36F0
 RfXpE+1M4NHpOSaLD7Q==
X-Proofpoint-GUID: ahtw4hpUUUcUOusEC4Xipkr-8ufP6_VN
X-Authority-Analysis: v=2.4 cv=ZeMQ98VA c=1 sm=1 tr=0 ts=69bca777 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=4BbrJ76QWEWctDjhbfkA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ahtw4hpUUUcUOusEC4Xipkr-8ufP6_VN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603200012
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98857-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D876D2D4DBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 07, 2026 at 07:12:48PM +0800, Pengyu Luo wrote:
> mipi_dsi_pixel_format_to_bpp return dst bpp not src bpp, dst bpp may
> not be the uncompressed data size. use src bpc * 3 to get src bpp,
> this aligns with pclk rate calculation.
> 
> Fixes: ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when programming dsi registers")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Pengyu, what is your target platform?

> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e8e83ee61e..7c16216e8b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1030,7 +1030,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  		 */
>  		h_total -= hdisplay;
>  		if (wide_bus_enabled)
> -			bits_per_pclk = mipi_dsi_pixel_format_to_bpp(msm_host->format);
> +			bits_per_pclk = dsc->bits_per_component * 3;
>  		else
>  			bits_per_pclk = 24;
>  
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

