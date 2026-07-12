Return-Path: <linux-arm-msm+bounces-118550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1oz5OV12U2q9bAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:11:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C69B374478C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:11:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LwGs31om;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BGF3xIoE;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118550-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118550-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CF4063003484
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 11:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830E43A4F4A;
	Sun, 12 Jul 2026 11:11:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0BB399D0C
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:11:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783854679; cv=none; b=iR3/4Nv0UMDkgnRgv8UkjG+w/gEn+LFmglFc/s+rHZdsHIlDCfHhdi2+PPqTaKVg5XTGPfSvkx2TlrvSxuyQmTxLBwSbcUZ13fCVsC/OtwxHg3iEk0Z11i1XYFMpfQmV6eMdme6foqC0KkzY1UQ2XNkvJsOl2kU27NLygA291Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783854679; c=relaxed/simple;
	bh=2HjFLjwdcrqQqaCY6ZRoT7pszVFo6PVFyoXm2t67oSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=giKKg6u4uIl0sZndGVtmju1UU9fAh1WUWkmsR8KHUvv8qru5u6zBsrVIf1bIN50oCl2NI25rlhcmMkmS7ZHnEKquavXhvteQRuiXwFiRJjiZkW3MW6Nu5hXwnNz0A29opaChG9rhogbCQ093hxD0q44aIwqc5z3IYrq4/gN9yP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LwGs31om; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BGF3xIoE; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAc5jq2386438
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LY8nTUIx9LtyTOuym7nrEjxt
	tDVZI/m/HtVz939s7qY=; b=LwGs31omgyQ09eM88G1hjEjWhQsYorfgkPZyt5/t
	aJ7bOIIRU3fOxmJ/GjR3sRmsaFr5zaYVE3GajRDiz79iqn8xCqynsyAD6ZOvDGV1
	4k2xm1n63YFQRtyWbcEgVnnOBGaUlBI7EFO9IUa7sszwO5muw+pCv43nuQzNA582
	lQpbHVjJxPMxWxBsVSelZewqXnHkJmwEMh2+j267zEeM/4u57Ek4sUPoFXEIIJcu
	314PUR+tQVQQ9CyQ/eYGZD4E3wZl4wYk8Wl0n0M4yjJo6T6TxtpIQKpswdoQhLGk
	7qhVK9uffzRWPzX0ZHefTFBs8BiM6nasBvYCbZcRmWoI/w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe8vakr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:11:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bec738909so19177151cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 04:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783854676; x=1784459476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LY8nTUIx9LtyTOuym7nrEjxttDVZI/m/HtVz939s7qY=;
        b=BGF3xIoELh8b7pzqI54WRrgG8p+qEC6VIX8U5hGOBlX+OXm17Je/MnvI0+xImZSmbz
         XT2u68rE036tuwMpe+qHc8qBEm00DbV7XKccvImvPVxSHmm4T0cuLwzp4snWtq+TohxL
         96WGszVve7zo/Q/DqXVDPrivVGwSHjv+IRJnA7kTJy6004t2CwvOGyQ36381RJmHk2SJ
         lZjy9SAso7WL+Xw0G2cvl33lW46ueas2D+UxD5r0/o9rO6lvh23hMZAQTdtSuNis889n
         sDdMDIrn4BSHg7H1rDTLUZPAyQsmKWKPqV1o9NXhDPaU/ZuXwmEynb9HPLAL8TuQ0cu/
         7idQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783854676; x=1784459476;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LY8nTUIx9LtyTOuym7nrEjxttDVZI/m/HtVz939s7qY=;
        b=STgGtPU2piKhPIHKlVio8H+Jf5ZOr0OXQsgl+qReE0bvD689Tvp7g6CDEdAysZYvf3
         rS1zo5N8jMfjt1wwfJvG390TGdImNGhUOhDyKkSNrVm4H9HQoGWwVRWhOPIv8lOOWCKe
         U0FoYVfluoG20uFwhJvpO1aQNLTD3GbkeWVe1B3A+ZA//HiD98j93sh5tdRC8E72qSpp
         trGp0B6ZVw19rXsv2dviLZJ6TRqc5S8UKhYU1mNRsNsciVe6P3rY8bc3Yjm4yZLYU3w8
         qxVqzNQJCByDA87xCtBlfm8izMI0fBfLWHmnK+8V0xze7g0ecq+67JXU9CuI5S4JBNkj
         scYQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+9FWPzYP4waXRYfX5je+z1Q2PtkNEB7xbNjlGsYAe932vnFReoYOEa6sG5jY/E8MOxM8oS/UAtwJAntCy@vger.kernel.org
X-Gm-Message-State: AOJu0YyNMQCnsQY1OzpZA6qgpJPXUPGEMaljJLWY00nJTjmDP5/XW5yI
	bkmtunzs3Lb0vMyyiIsI+8Qa/UpqhHPccknBJOnG4fhJhJZaoMkKTW/Ylr5jag7vTInhTiT+Nbt
	KC5GBOtlMExDiRGydA97Xc9FM/kpWdmP2cEWVPmmXdv3HdUZZQcIMq6R3EOLA6yr0MgVy
X-Gm-Gg: AfdE7clRP4AJZ8hM4KuSPIKavV0RMPGL1f4O2fqRH3/pFoSn00uSt8eAn8Lj5LupeE0
	pE+6CTG/CKw63b6kQzsZyZ07DHoVqZt5lPzpMYpQ9cEqwr4nJHeF8bScET/XpK5XNWd5hpMczTx
	oYr2bDjM0eZrVMCpSthCNv8mnypkevBvkfe1ikvRHiBOh4S4rE8mjs8AHsqwNezWMdOhsVhvblW
	XZTUjIkTpGQn8Li2VbsmfY6V7+aox2g0ff3d55+vxVeXgSbr4Y+t0dDFnuxeN310mBJB6CNJLP3
	IKj1Ixrh84ziN+pjdejZRHOSUnY/tEC+M+ioHrxh5Q63Sein/7rmzVi8smXkVCHayjsm5PRg1bJ
	zY4IPr8iFz3Xmvtgdn7y5SCtFGyFa5A2f0K7461J3zAc1ZtitFvjB2SLkx5f6leVcYRG8jCwIw7
	+n41nmB44/y11USnUsHBpYa/AZ
X-Received: by 2002:ac8:7c42:0:b0:51c:2149:52e8 with SMTP id d75a77b69052e-51cbf279432mr52411941cf.70.1783854676159;
        Sun, 12 Jul 2026 04:11:16 -0700 (PDT)
X-Received: by 2002:ac8:7c42:0:b0:51c:2149:52e8 with SMTP id d75a77b69052e-51cbf279432mr52411781cf.70.1783854675702;
        Sun, 12 Jul 2026 04:11:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca4a297sm2057513e87.7.2026.07.12.04.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:11:13 -0700 (PDT)
Date: Sun, 12 Jul 2026 14:11:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH RESEND v5 01/25] drm/msm/dp: introduce stream_id for each
 DP panel
Message-ID: <7fjeip5h4jzvsuowvfgmnm6krh7tvulrv3l3laa65quscq2jzp@lor2elvhmhia>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-1-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-mst-v5-1-2ed6aee1867a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: qNcfinDvVwp-GrUp6CRsi5Y9ehEK0QOy
X-Proofpoint-GUID: qNcfinDvVwp-GrUp6CRsi5Y9ehEK0QOy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDExNSBTYWx0ZWRfX66tUe5WtGQ7L
 mrKV28Y+YEucTjHTGGR38HrOF6GbFYFk9aCEgsS/ddTKd8QSS5GSfvR7kiyd3LrpXx906/NnVLz
 Bm5MLidF88MwoIm6Pu6zUn168Zs+nWA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDExNSBTYWx0ZWRfXwzo7kWgzPufI
 nnMGksbFl/CjmjMuxrbw+Z8Qgh5VKVZm46nuJxor9BwDcjGNTl4mzV8ftbNYCvtrtzNGmz5ufVW
 t4lkA6mqjw3SA5zjrtUpwfpNCHTi6t0bXtMrduw6UkPE4wB/MHwOP7CGyuygH72YNBAJayvc5Ct
 jeuDoAAaKxgeCoWIsb3EpIzagezbr3KQn85tRmRuWTIcaAAXL7TP6DgAL7wA4w4J/5BNPUwcsGv
 li+NLZHKwTyDpy6njwo78hnoE6h4v/7KrGt6gq/V1wJiSpZu/+PrMjQLxQgLx7i+gNXGME8Z5RP
 fBYUQDAx2rBCH7VkKq1lR1y+BuSfURVd0Y2TIxEQlWtpsZdZUNzo20e0yYUBTk4LwKm7Qe9NMEm
 QGHv9RgeI/e4FXUYgfA22Ex4UYUu9tCi7CNnpN7nikbnc+JXZbcnEQuE0QJlM112uXulvHyPch2
 XNwwP/NdXJ/GZUpiGvQ==
X-Authority-Analysis: v=2.4 cv=WONPmHsR c=1 sm=1 tr=0 ts=6a537655 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=GwlwfuPo3DdifNSfN00A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118550-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C69B374478C

On Mon, Jun 29, 2026 at 10:14:22PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> With MST, each DP controller can handle multiple streams. There shall be
> one dp_panel for each stream but the dp_display object shall be shared
> among them. To represent this abstraction, create a stream_id for each DP

You are not creating IDs.

> panel which shall be dynamically assigned to actual stream IDs by the MST
> path. For SST, default this to stream 0.
> 
> In the MST path, panels are dynamically assigned to actual stream IDs at
> stream enable time by the MST layer.
> 
> Use the stream ID to control the pixel clock of that respective stream by
> extending the clock handles and state tracking of the DP pixel clock to
> an array of max supported streams. The maximum streams currently is 4.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 67 +++++++++++++++++++++++--------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  1 +
>  drivers/gpu/drm/msm/dp/dp_panel.h   | 11 ++++++
>  5 files changed, 55 insertions(+), 28 deletions(-)
> 
> @@ -2188,38 +2188,39 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
>  	return success;
>  }
>  
> -static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
> +static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate,
> +				    enum msm_dp_stream_id stream_id)
>  {
>  	int ret;
>  
> -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> +	ret = clk_set_rate(ctrl->pixel_clk[stream_id], pixel_rate * 1000);
>  	if (ret) {
>  		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
>  		return ret;
>  	}
>  
> -	if (WARN_ON_ONCE(ctrl->stream_clks_on))
> +	if (WARN_ON_ONCE(ctrl->stream_clks_on[stream_id]))
>  		return 0;

Is it an error, defensive coding, DT mismatch or something else? Why are
we warning the users _and_ returning success here?

>  
> -	ret = clk_prepare_enable(ctrl->pixel_clk);
> +	ret = clk_prepare_enable(ctrl->pixel_clk[stream_id]);
>  	if (ret) {
>  		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
>  		return ret;
>  	}
> -	ctrl->stream_clks_on = true;
> +	ctrl->stream_clks_on[stream_id] = true;
>  
>  	return ret;
>  }
>  

-- 
With best wishes
Dmitry

