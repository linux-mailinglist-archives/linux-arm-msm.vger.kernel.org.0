Return-Path: <linux-arm-msm+bounces-116020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JIQbIsRdRmpnRwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:47:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5786F7DA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:46:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KcVzo1UD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fPx88yNF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116020-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116020-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BD68302EEAC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C3747ECC6;
	Thu,  2 Jul 2026 12:36:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFEC477E24
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:36:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995814; cv=none; b=UUAuBnfZqHra+HYfSISLOLGEYPmWnPdMi1mISFvzxPoIbeFp7HUjHxEDzOZUYAW4FrAm+ZEMcbi6qHTXJd/0nwjvyr1rQjHiCO+vQhvYXEHnFNzVOZUi3FLh0Fl8IQ7ujoG8jYVAKwjaFVvkEPiXREc22l6e8+UPEj0oKAhF7pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995814; c=relaxed/simple;
	bh=qMhcTDAGA0EuM00DbuLPfeBkC0ASx4vU9b4isflc8pA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=br4Be8QYHxguBOhY+VfaAPDq3adLcqbiegN51Tfp82GQhX6v5rR+Q6o6C1MbsBj29oWAmPXjtcEZqHR9F6pzETy+Y69TEvVFOeQE3XisZfI7k85nnmaYMFmb+38KBPnM94wIE73FSVt6rI40pTiJDPPP+kwSsYrEuBg/sITQMtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KcVzo1UD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPx88yNF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662AfB1S3592225
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lCJCbv0E0BPHDGtCuRumSuKi
	bvcyxri2VpiCoKAiOo8=; b=KcVzo1UD0A4Gl6Gc+lUxWkf9nedpLFnibRu45zan
	whVecqsEKpxEEtWVLIiQP0FZVBuOC3U3PeaInxP6q9yQvne2iHnTeUiV4BUBnJpL
	yt0Od0rYVb5Rs3wASjPeMUjF7+nqUvvw/4gxCemm+WHwJVyp3EkyaGZlE1hpBqGR
	9yOhOpLXrneDTnJ/OKCQETLRP3L6qmEaRtoQhjyuGRMU4eHZnZm4YgLk18MBzJWt
	f8oun5dDMjIjxYeSBWnUn4hvmk3CdxwvUygT1BK55TGosqY46eHY9MH8ZlJAevdG
	ghrtsgWNs8pgYKdpYlyilTdpntzcC0UZSDB5A7cUuhhLqg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9qqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:36:52 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bbecd250b7so225680e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782995811; x=1783600611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lCJCbv0E0BPHDGtCuRumSuKibvcyxri2VpiCoKAiOo8=;
        b=fPx88yNFl/cdkQNRRfjC6uPZ83l4CjvNsKdWnemSiZ0T1p1VUWr39bAu2UyBIP6djh
         GlebuwKgJm1lEfoLTW/U8Iwj+2U8/HMkDmNcgxebk742p06N7kqFYWrdsBLlB/CkSurP
         0Udf+uBQ0nIQ/s5gBAZwvREjmIbkHN7sjEkcunBpghHek503EiM6YNd7BuI24Tl2r1fI
         N1PbmxXr3tAux92Zz1ciDPLQ3Bn78C/+kH7DEQ+J+ZAImo5p7euT8j6oiT7xsDx7BWEK
         eZwxiV7BOAv2JOoVeQodXOmKS6y7IwLHHwsA6JZHMbgA+xt1N/SlhgDjtYasRcxz1u/Z
         xkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995811; x=1783600611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCJCbv0E0BPHDGtCuRumSuKibvcyxri2VpiCoKAiOo8=;
        b=HQKEdkFajhElOvnVdioJAksxRltD9brjT+NyygR4djpLzTt65SO6+SY/ydXvLu40Gg
         zpR2XQfWujMnHlJHcV+WiY2LF+vBiN9Y4Mivr2+IGxgzWzeJ/gQBmenpwwk+uQqL2QTo
         XCvrw1J5jKpVTTnRs3OEDQgZkxFSxalQMqwWVTjPNpTk7WTMa/sOelzHyKWG8nEBeEd6
         +GtpcGHA3Fp/vW2xJa69e0mKJarUZXWcHfDslqh3uqYJWJoN7UbthwgXpNq6/wPyPOXY
         x7EmL+BL0CU9uK0G5DVJXl22WD6DBZaXvgylT+zyPY59GFzZ5KaZqN3I5BGjlWEA+pJn
         nTHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rreh7k7qkB2dSo6vfY1F54VOUuD+LuXOIxpy13EfL2BexSZU4sZWO5CDjL7Rk3+BBn/rtN4XoX7A01dXAKN@vger.kernel.org
X-Gm-Message-State: AOJu0YycVJE7PQPwgxST6AL0yMmWKxXaBriVoxOtqoXSl6ymR3ecMKzU
	Nkrklju6uDsiOjRZH8p3xVPSmegXLuoRbifWyo+aGXWoTr+SCsSkv7ZlUUgDFZwsSDW6kK1//6V
	37JnIrgnLiETy8iCNumb2If9MVY0zCAq2lp8YHk4vSVDgNz2+dJ0OBFB8CwiCKK0WCcnq
X-Gm-Gg: AfdE7ckWdYajnSsdHakSfSUAa076HN4YuupLv7cESAYOzd1wmkYPoDsvPz7nJlgO32x
	KXGAtasdqePBIiMleMd7KRhFakn/pSaKJ2WQHgM93GJrS+660Q53oJ11JGsN3hFB39oPAi2h28Z
	Q83LMgsvftgSrjaOiR3wpuG7xAICtNoArvj3KTimtokQK3ElFP4QA9GUZ6ef+ADID9nADqEfP0m
	386VJG/L0Ci26K7n4px1ui3DEC4eMSwVxUJtkBKzlt74S24//uNEHaYyEGxy5Q8a7mCBCmL0OBR
	jx/8rYsECSwQ9ralzonXi0wsveuIpwsFHCVif67mJBaq4OzSbcwcRD1T0C5OIccoLBjAjE2uG1r
	Zs6ScBuBWClaiCQFpOluvKfcJsJ9JY0tr0cocPuuB3rNCeBMl+bj3x+ll/3/Ol9LPaLUGdccmp/
	za5PRIHz6d/1wncHN30rgZl0bR
X-Received: by 2002:a05:6122:e1b2:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5bde3b0e0f1mr1773670e0c.11.1782995811101;
        Thu, 02 Jul 2026 05:36:51 -0700 (PDT)
X-Received: by 2002:a05:6122:e1b2:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5bde3b0e0f1mr1773656e0c.11.1782995810560;
        Thu, 02 Jul 2026 05:36:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89d526csm644713e87.43.2026.07.02.05.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:36:49 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:36:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jun Nie <jun.nie@linaro.org>
Subject: Re: [PATCH v3 1/2] drm/panel: Enable DSC for Visionox VTDR6130 panel
Message-ID: <yx4spk3w6stqtcxbivjwk6osghilb4a7a4drxr5l5wpzbwkjkd@2bzpt2zajker>
References: <20260702-topic-sm8x50-vtdr6130-dsc-v3-0-db881a3fc026@linaro.org>
 <20260702-topic-sm8x50-vtdr6130-dsc-v3-1-db881a3fc026@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-topic-sm8x50-vtdr6130-dsc-v3-1-db881a3fc026@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMiBTYWx0ZWRfX2aTwyhREYyqW
 ZgqsSM7TUr7HX+90dvDXsAGwch9WEDyqAkUt+ode7ixavqUjFBo7oqNvbgAcjDVlYjXTVTYmEwn
 fGRHObSnQJr7X+z55BXDRgVOctY3V1CIIemvMs32VuvV1cxNLZxSGgrn04MMRO1XGfP3N3u28NO
 SB/JkUbSQA8aLb5nFP6n+V6alephQJUJu37Wr6lvQ8Kak8iQ+8cJIeW1FHdOX9g4C3XNrde3dX/
 zIOXdKeEVeI9NQarL3MZ9aapzkm1YyvGdW4FsxAJk7xdGuToJXJzui+FURoFM7LS5I/pggsFjkG
 s4u4CAvdvSEEDn/NJOgor0LjeTn1+Zw4bMCL3ClcyHqrw7GSVoYoseykEnG453T8Ti8NNbJqCz6
 xQesiEZXykfe206SK0+jDInZNmvlgresxSJJEnKjXbVOojv1BAq5l4fIdeQy7+/yYfIdtWzF9WI
 QU3gh6caKGtbo0V2Meg==
X-Proofpoint-ORIG-GUID: qi_uGMdQISvnYYUCpgxilGZT7w2QmWvj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMiBTYWx0ZWRfXz5NY6za4G+84
 ORrOXPeyxsRussN2uFVjqEEIbllBuzB1TDWtxgXfnoFiNNgK/Z/QF0QXxfRu5cUaE8cu+Nl7FiJ
 A8Km449hsBtB2rSSgNu4/Xu7Ppklh9s=
X-Proofpoint-GUID: qi_uGMdQISvnYYUCpgxilGZT7w2QmWvj
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a465b64 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=hr6On4wLPrmFn5QqzOAA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116020-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dianders@chromium.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jun.nie@linaro.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,vger.kernel.org,chromium.org,lists.freedesktop.org,linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,2bzpt2zajker:mid,linaro.org:email];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC5786F7DA4

On Thu, Jul 02, 2026 at 11:36:09AM +0200, Neil Armstrong wrote:
> From: Jun Nie <jun.nie@linaro.org>
> 
> Enable display compression (DSC v1.2) for 1080x2400 Visionox
> VTDR6130 AMOLED DSI panel.
> 
> This panel is the default panel for the following devices:
> - SM8550-QRD
> - SM8550-HDK
> - SM8650-QRD
> - SM8650-HDK
> 
> Enable DSC since now functional in the MSM/DPU/DSI driver.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/panel/Kconfig                   |  2 ++
>  drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 18 ++++++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index c0cc2bb4a3eb..d4e6535f3595 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -1352,6 +1352,8 @@ config DRM_PANEL_VISIONOX_VTDR6130
>  	depends on OF
>  	depends on DRM_MIPI_DSI
>  	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_DISPLAY_DSC_HELPER
> +	selecy DRM_DISPLAY_HELPER

With this fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



>  	help
>  	  Say Y here if you want to enable support for Visionox
>  	  VTDR6130 1080x2400 AMOLED DSI panel.

-- 
With best wishes
Dmitry

