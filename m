Return-Path: <linux-arm-msm+bounces-102986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMSpKugw3Wn1aQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:07:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E8C3F1D0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66D07302EE8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 18:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA183E2751;
	Mon, 13 Apr 2026 18:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjbZNO4Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XktfvXbE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441E53E3141
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776103305; cv=none; b=HOALps9eQbs2R45sXvjCDtm32qU9t4whZEq0Fny6wB9VuXi/wQ8+DiSN1db1U/YQRNgxDWL7nb2mvyQ2NOBB6mF/NWXmrZssJic+WaQZeY2uD+3bbE4/yc/RFv+3u/tcRdNGdI+t2FzhQK6j6zqDgzkIBCKqJZGf/m+FgNxG/N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776103305; c=relaxed/simple;
	bh=uMSodKRjJKcrWjFB+7UQQf8Cd8EKI0zaim8A2bqrw/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SysQnH13CyWUwVyQqKaHTjyGe7OdFbGt6Vxl84WEQj+7MktVVasW+pgH5rAI2yXDdwSzda42cQNOMknVFORHv31vTIvtXV5XMVKU0/zBhKIvO++c+NUSfCEDWHb6FmvIFdwKv543lOKPVCHHk+VKMtw8YYUxtNpYmkx0/hxu7Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjbZNO4Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XktfvXbE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DHE15j2229921
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RrgntLZaILeSjci3xZg8PBfz
	PBDaxQ/Aw+fi1cSA980=; b=hjbZNO4Q9bt4h/2K5hMOt14QfyAOqVQt5MCjIkup
	9siXOZX6diiUjWPHX6nHDCjw0+xVApMKOpQI4O+oC6Oj8RUSh+3Qok4H/d35fr+J
	62rsGvOkqgdG87A8D7CIJ0t2PTo9S7DGMeQmMqG1BuHJyY5gVJmFgf8Cv3LXSrVh
	rQTqfAc87o0a3xj2aVUWzgOAB6nEEeXJw2colnA1gmAqQFjYn+8tZ1Drh2JrHOUY
	m8olujJBYOnDeQM2z64twFi9HD8PxrnbK2aLJK1hqF7WW2sLlw26/CpCpkDcUXUw
	RiN9OVcN9jXa7XrXmiQthGd4DY4fTXnZumqk7t4tEXjUxA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dgxt61p53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:01:41 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-47545742e67so6568190b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 11:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776103301; x=1776708101; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RrgntLZaILeSjci3xZg8PBfzPBDaxQ/Aw+fi1cSA980=;
        b=XktfvXbElpxd7iVshIK1uJIJ7eeuRdmz9Q3OtovSav23hz+TfZO3vs+s6IivoaTxm0
         vCV2uzrbHSDKGrAR75FHBNRDSSSJFz+siQGvjxKVlCLT4C2k3g7EHNxD4hA3OdYLyau+
         B+Gm7CUTYTIGgIB8Gra4t/jtqQm+6nTbTFbXwmaGBSKOG9pbqqiincHvpn3JrI7+2sdl
         Lyhg/6WvV9FNx9BKp7zwi6/4z6DTbpEqwwwEolrQbnGBl3pKKK6h+DCfjZBGFoD1k448
         K+xm1fRCX69ykI5Q3CSy25Ne39x/u9/LxnC1D9WC6rtArnu9a0jT2LRtVYWc1dCsVjIn
         sPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776103301; x=1776708101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RrgntLZaILeSjci3xZg8PBfzPBDaxQ/Aw+fi1cSA980=;
        b=k/Dy4108vsjwTgl8l/SQynqTLB7X9l1RNqr3d0TVt60IRYOyKX8oTqfDLn646B4nqk
         JSrkSqwwpRJcS5C+jE97QIyWAzTgxaVR37DRTmFhlmCum6yVXTupvCdPY378Pa4tGcPB
         ENmHh2WDewYnk4Mf0lCcUxS9rz5lm0MLkgLiW2a1TgNTLMWXzVH+3jOS3k+T/8AXj+aC
         BD5n3hUs3aok4opa0Fxgc0vD1VuClp3lfHxn32lT3Jgly00Eh/Dvi80WteBi+QjWPT+e
         qMmzWj0KUiSWHKSkq9QBYISgqnjZZV6bCFfPh0xUigIjMR8jCuiOKWH6Q97M6wUVAz7E
         bvgg==
X-Forwarded-Encrypted: i=1; AFNElJ9ya4mdCeDU2U2Ji2ACNIMW5Di5N0SdXXjUC0dJjIw+V8JIcX9RE6MMeK2cAQWtODB/n5290tUQFKBx/7Hv@vger.kernel.org
X-Gm-Message-State: AOJu0YxaFE1zy5BVCB7EQYZ9RriwDx8TsbpdQOeXLhHwAtVbcKFgBPk9
	m9ORW69ft6a6lS5YolnVmx4yAjgkoD9ER+V/EEbTGezy6sfSwz82yBMKhL9X9IMzLSdVXmSqOzW
	Hx73mJJoaPNAjLC4sJiyQPipKijnmyBHkJKKnzbgwNf0pU+Ujpax2cLgfIua1RxpUDXlG
X-Gm-Gg: AeBDieu3dw8I12rm8pfAAJHZRPdTbJ8LCY1us2Ca0b0cb3u6H2qzjgQppeR7UL5rp4M
	HER57VVF6fhwTplpgJXlj1MhlCKCnWCWOItNAXPkUR0BwDZ18aIAKEW6hIazSHOY9OrxirOOjWd
	z2qt2EexOfRAYnnfUf5H5G8Jnu7gRdPPeI30Z3Hmn/t21LdsF+GDYu29WJPXwMmn5hF+nVf5Eer
	4Eujn0qh6pz0uQOXdm3qBknNBCBAIjct3QC0YZuEmrIIlQzYROwoqVEu6NFMvPaNBxi8hBvVneO
	kDDG+Y4E9JWUBY2GGm2FplyTb4ZHTOPMVJSn5Aq0qO4gLBZJTcSh+7G1bHs4nk3cetND6SqCKAP
	ZYu79ADAvb9WTfugOccfJJaOiOnfsAY+502J4ScVad1q71uTAwJ4htQ8yKE5nwYAUqAX02wbbE+
	SC98AtUHAirxPV+cyjN9BII90zS8DA12jHYVCjfvotFNjuVw==
X-Received: by 2002:a05:6808:c1e9:b0:467:fd08:2826 with SMTP id 5614622812f47-4789f30c472mr7094096b6e.40.1776103300543;
        Mon, 13 Apr 2026 11:01:40 -0700 (PDT)
X-Received: by 2002:a05:6808:c1e9:b0:467:fd08:2826 with SMTP id 5614622812f47-4789f30c472mr7094006b6e.40.1776103299515;
        Mon, 13 Apr 2026 11:01:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e492710ccsm26015781fa.7.2026.04.13.11.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:01:37 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:01:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/10] drm/bridge: lontium-lt9611uxc: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <rivgablnl6s7u54gyv77vr5pitlvvgzby7qnu4ryc4tttaqa7t@hztujmxw5njt>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
 <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-5-acd01cd79a1f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-5-acd01cd79a1f@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE3NyBTYWx0ZWRfX2kdesUW1IU3M
 kwZM87iOYO93G8FMsSfgAK8BAcduKDzko5bbZsT8JfO6YOPXlSH/Vuo3EGzi8ryyTbpqs8I0lZ1
 uaqrFyikDx3LE7M+duNfxzl4eFDjGPfLNJHv86ml5OCqoYkjB115zIOmUzhbxkbpAwvQUIgrpiz
 jBnn1l4lMAzodQSdX9QLehOzrG3fgMDeofsY6urXmpAa1LrYkA+a662MCP0JRd2Ljk7/9zQhwYa
 eEe4cZI24L9wPISGuFJr9JomLJ52CCF4S/3Nz0WezUFPJq7+aoSl4myBvImBYqJ5ejZZB3TGHXD
 Io39B/1zAJ5knIpTBUbjEiBEIzXGKyAplzMSsizkphb1fHbNsGHRfnveXIypjp3ZqektTxwsoSy
 HPb7YiVIViV3oFx0hovDmcKl20xUJpjuuRSiZHKNLU6HGx8VEFujVzhYs8C399TjJPykUY7NavH
 CzZc0foQZkrOvGxbSKg==
X-Proofpoint-ORIG-GUID: iraVUYPgsb5mO8dX92h0KzGBajVgKMkp
X-Authority-Analysis: v=2.4 cv=br58wkai c=1 sm=1 tr=0 ts=69dd2f85 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=P-IC7800AAAA:8
 a=xZdyE3pWI4XlTmgEQ5MA:9 a=CjuIK1q_8ugA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: iraVUYPgsb5mO8dX92h0KzGBajVgKMkp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130177
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102986-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,hisilicon.com,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 06E8C3F1D0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 03:58:37PM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal. To achieve this, instead of
> adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
> pointer which is automatically put when the bridge is eventually freed.

What if the driver's _probe fails between increasing this refcount and
actually registering the bridge? There are enough possible cases. I
think this also applies to other patches in the series (BTW, including
the msm/hdmi, which I ack'ed).

> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 11aab07d88df..55b80a488c33 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -35,7 +35,6 @@
>  struct lt9611uxc {
>  	struct device *dev;
>  	struct drm_bridge bridge;
> -	struct drm_bridge *next_bridge;
>  
>  	struct regmap *regmap;
>  	/* Protects all accesses to registers by stopping the on-chip MCU */
> @@ -284,7 +283,7 @@ static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
>  {
>  	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
>  
> -	return drm_bridge_attach(encoder, lt9611uxc->next_bridge,
> +	return drm_bridge_attach(encoder, lt9611uxc->bridge.next_bridge,
>  				 bridge, flags);
>  }
>  
> @@ -487,7 +486,7 @@ static int lt9611uxc_parse_dt(struct device *dev,
>  
>  	lt9611uxc->dsi1_node = of_graph_get_remote_node(dev->of_node, 1, -1);
>  
> -	return drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL, &lt9611uxc->next_bridge);
> +	return of_drm_get_bridge_by_endpoint(dev->of_node, 2, -1, &lt9611uxc->bridge.next_bridge);
>  }
>  
>  static int lt9611uxc_gpio_init(struct lt9611uxc *lt9611uxc)
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

