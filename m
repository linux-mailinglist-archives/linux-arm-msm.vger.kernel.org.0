Return-Path: <linux-arm-msm+bounces-102984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COqwFnwu3Wn1aQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 19:57:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C73483F1BC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 19:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D9A4302B828
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 17:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3EC33B6347;
	Mon, 13 Apr 2026 17:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dw/nxBMd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dxp2rX04"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C8D3B3BEB
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 17:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776102992; cv=none; b=GhQ7qgbXb1V/1KNOV3rhJ/HuTB5xY/FEbNb2LsoRicUl1VPr/epxbNz0yVvHr09Vo+hFZ9YMspGqD+xpYYyLQRgXTReV3QTBkL7ua3ZczqMti3ip16u2qBKc9SoyP7w+POR/6xhxUXjMcrouDj9/Re2bWqrZzLNEcd5hTd6hrNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776102992; c=relaxed/simple;
	bh=ScamhqKmrgnBHDV9RhBf3Va5tiV65RabmMgEbf6xIXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gM5swicDV3LgR7sdaHPW7c4/uk2hN7v89DETUbUrTJxd0yCoPyocwaZGY5/hY8C+I7MsvZOnBsnWOWQ49lFPL41CM+GUbvBtLLKysoGvkYciCrVGWErKKNC0ZwneS400sjMGa4mXtViwEyd6SIW+F/bI9tn4yp+D3Y/DdKoQTnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dw/nxBMd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dxp2rX04; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DH85hI2229900
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 17:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZOK8xz+kAAT0sGnFLw4aNDwg
	w8+J3RcJlXQkxpqjpmM=; b=Dw/nxBMdq4uF/bpfRCFEEszlAGlfPaHv4z+nVmQj
	dUjFoQO4+KLUN18wfNGZpltZOoG6HkvF1YxLwe3lJPQJVno4vCXlSIBoM59HF/fQ
	44J7Pb4VYomEr3wcHHs9jEFQbpkxHbKhO4YgLQ9zYIscZ3/peMKUa70joNENP+gD
	HdAlZRL6LX6Xb02hIEQKDYQ1PZMp07eGZ5EQEXZGMTt3q3v3R8XnjZQLF/ZGCubW
	fVsH4kC/iOlShXfkHrS5a+uJj6uB7so8J7DPsTqK3wFsJ26kptiFkqnkrn6337Ju
	VUrueMdMLmIM7ESyw26imU04XaK7jw9QavztEH+mFZwa1g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dgxt61ndt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 17:56:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d831e8083so74002881cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 10:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776102989; x=1776707789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOK8xz+kAAT0sGnFLw4aNDwgw8+J3RcJlXQkxpqjpmM=;
        b=Dxp2rX04VwUny0xp1hMrjekGUl5XQg6jP6VqlDtsNvRQ2xCO53o+fw4WdN9Q44g9lb
         zYhxY0CtgBHtl87LEphL/g3Fks4jzKv8nLLn/Gj3WoiGzRCANbb273BQxAn04yiULyOK
         9/eWnLDgXdE+DpUlv8pyQYyXZqm0uDh79hjC0L4Jd8YkWn201j5whHmzr153diWZKokz
         ZOvkRNqQGl+Rfe3hbiCsI0TuOq36OCQ4PEm67R6BV5EFl0XhFVGakR82Kd4qkfNspdkq
         86xmSSVpKQoDAaIURCI8torHP/oyTHA7981/1BesSeHHCnxSJIN94ocGBmLdnHikhZ1Y
         M6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776102989; x=1776707789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOK8xz+kAAT0sGnFLw4aNDwgw8+J3RcJlXQkxpqjpmM=;
        b=RDE9NDSC1RZj6mwxtRjST53eaI/qjVbmurrfAGN8pi/qTYcpWDV+ZeqI00FrkF+1/S
         LWpp8Wtdqqz6n27VtBMwEonnSj8WwYgSxO4zsZMSyRBqcBRaIpx3JIa50g4u5SnNPuCx
         E1Fkpd9htmKmBdHhVr5OQdofv3PYXrUQo+6Y/4GWxpFHbJYM1756ngN+z/Wrx3KYw0dS
         v+4TSRRdzR0jsegfYvLFcxGmYnk6rEecsNO8ORPngYbKWJgtkAEXpa0bIKPE7TrbTXe7
         50yVw8mfcXhv5YkvhXpw0s9dv0cayjMwronLTnxtX+kptW6FFFGF7DgrPaDog2sIrpzd
         8nVA==
X-Forwarded-Encrypted: i=1; AFNElJ+4AaOU1gj9bdT1bScPqKiOfiaR3KoBdHsicWC58S/ix0SrymbqjUVH5iRdFQvdWo4A0NR9XwnNT5RnYM8e@vger.kernel.org
X-Gm-Message-State: AOJu0Yw176if8Cwjk8LTByPOYnp0w1yjaF1YkRGZgXy+Ml0d88YELSxn
	CYHACKMEioL0vNird8nTqzHCpzwIxAsGIO7g+jCKnTCDzG3I5XslYzaOpEaaHFzgeBy0QhD6TCr
	jN7Si/6HtSNjoJEyBICYfHm5qHBvfYEOQYSLnMNFlScOxDjzLxSM3VtNXk74IcvkzmHra
X-Gm-Gg: AeBDiesfrock9oG2q6PE+1VavlPA6NfqP6PWmdysHMRSYGiYYeAHyI51z865ViHJXKG
	4GYK6stwOTe0t4HonqBG6DrdO2iRdJ8JOFKT7kwHA16B+LOqeDeqB1sO8jdrLQ5RfwshnAm7LrR
	WtWiS2BD+wKhqCM6eT0WJlMESZ3dmayswva9cwyCz702EjzjtsHmNBtZSwH9DTZL6pUzCCSbkY+
	wH6DMiI2rFvggGZnULHmm7wPE5+KYntowK/1uc8Bu0BIp/nf+c2BOLf5JamvvCqXPzD/GRM+ARi
	e/TPDvPKYZ412gUoCc5vn9pBCI54mAljCDds7sdnC7ZP2f+MGSSsqbUq/uALYL4fpZ4TQM9+Zf4
	kjpBnpsI0nEkikDIO955ZNNfVdfuARdBpvujp7JMv4cjrezpN4+llV1MVmVgrBKeXcOlinxKFh8
	eqenvSAu4Jk6g6pLGIRJF9J0Fy7VoipuNTK807Wr1ShpwHQA==
X-Received: by 2002:ac8:590a:0:b0:50d:9073:f8e with SMTP id d75a77b69052e-50dd5b3f2f9mr228447391cf.26.1776102989391;
        Mon, 13 Apr 2026 10:56:29 -0700 (PDT)
X-Received: by 2002:ac8:590a:0:b0:50d:9073:f8e with SMTP id d75a77b69052e-50dd5b3f2f9mr228446291cf.26.1776102988486;
        Mon, 13 Apr 2026 10:56:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3fe7db18bsm670757e87.47.2026.04.13.10.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 10:56:27 -0700 (PDT)
Date: Mon, 13 Apr 2026 20:56:25 +0300
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
Subject: Re: [PATCH 01/10] drm/bridge: add of_drm_get_bridge_by_endpoint()
Message-ID: <omlnswxukeqgnatzdvooaashgkfcacjevkvbkm6xt33itgua2k@jcmzll2w6kdq>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
 <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-1-acd01cd79a1f@bootlin.com>
 <u2awvqh2uoc2acuuvyavwwtuvtiaidhbkkj5a2d2wwph2s7j7g@b4j73kwzblgk>
 <DHS6WZRYGWZQ.1X6ABU4UWF730@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHS6WZRYGWZQ.1X6ABU4UWF730@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE3NiBTYWx0ZWRfXybJG3kAGRo1z
 h4qx/FuXQX9GCZAjboS0RTaTOJ0de7JJSwPRtD/2aryWOYugTX89oBcmo2SQ5tj/BM7dl+0jmCQ
 1GvDnTQsQz3DfsF+xaGKMSR+FlMsprqkcnbJIa4/jKNsdMaBpk5hhiFqwQcFxgINPzxJiEBr02f
 vmMMiAfJXMm6ZhqGyk26okdsgtY80h++TkOBrT5kEPv9afTMlr66cbHt+4uZvO+smkpt5PxZZZs
 EPpUvbotH4rMqKza+LL4jPHq/ue16ziWKthiza7dtD59fpfiYf3RRhNW1J6CfGKwp0EdVlGbg+s
 0QQolpVzZgYr8MCt7R4YZd+vaOJd/rS56VPEpduw3a2zg1oSJy+Y7qtVbAe/hoowzNiY3NEJjMY
 0cO8yS82l5TSyW6zuD5QsqBJFkzGQPSb1lSM0uggXLZ35eZzNLd32VvIGz2CPSxB9lzb2Rj0onV
 NCVUmcOiuOo2hLZBdGA==
X-Proofpoint-ORIG-GUID: dGapbyPLKmsppMHZbZMaFEG_0j6FN8ER
X-Authority-Analysis: v=2.4 cv=br58wkai c=1 sm=1 tr=0 ts=69dd2e4e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=P-IC7800AAAA:8 a=Ch5lwy9Ifhz3koOEWzcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: dGapbyPLKmsppMHZbZMaFEG_0j6FN8ER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130176
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102984-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,hisilicon.com,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C73483F1BC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 07:07:14PM +0200, Luca Ceresoli wrote:
> Hi Dmitry, Maxime,
> 
> thanks Dmitry for the quick feedback!
> 
> On Mon Apr 13, 2026 at 4:58 PM CEST, Dmitry Baryshkov wrote:
> 
> >> --- a/drivers/gpu/drm/drm_bridge.c
> >> +++ b/drivers/gpu/drm/drm_bridge.c
> >> @@ -1581,6 +1581,52 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
> >>  	return bridge;
> >>  }
> >>  EXPORT_SYMBOL(of_drm_find_bridge);
> >> +
> >> +/**
> >> + * of_drm_get_bridge_by_endpoint - return DRM bridge connected to a port/endpoint
> >> + * @np: device tree node containing output ports
> >> + * @port: port in the device tree node, or -1 for the first port found
> >> + * @endpoint: endpoint in the device tree node, or -1 for the first endpoint found
> >> + * @bridge: pointer to hold returned drm_bridge, must not be NULL
> >> + *
> >> + * Given a DT node's port and endpoint number, find the connected node and
> >> + * return the associated drm_bridge device.
> >> + *
> >> + * The refcount of the returned bridge is incremented. Use drm_bridge_put()
> >> + * when done with it.
> >> + *
> >> + * Returns zero (and sets *bridge to a valid bridge pointer) if successful,
> >> + * or one of the standard error codes (and the value in *bridge is
> >> + * unspecified) if it fails.
> >
> > Can we return drm_bridge or error cookie instead?
> 
> (while replying I realized there is a design flaw in my implementation, but
> see below)
> 
> I initially thought I'd do it, but I don't like returning an error cookie
> for functions getting a bridge pointer. The main reason is that with bridge
> refcounting the __free() cleanup actions are handy in a lot of places, so we
> are introdugin a lot of code like:
> 
>   struct drm_bridge *foo __free(drm_bridge_put) = some_func(...);
> 
> Where some_func can be one of of_drm_find_bridge(),
> drm_bridge_get_next_bridge(), drm_bridge_chain_get_{first,last}_bridge()
> etc.

This is fine even with the functions returning a cookie: the free
function can explicitly check and return early if IS_ERR() pointer is
passed to it.

> 
> Such code is very handy exactly because these functions return either a
> valid pointer or NULL, and thus the cleanup actions always does the right
> thing. If an error cookie were returned, the caller would have to be very
> careful in inhibiting the cleanup action by clearing the pointer before
> returning. This originate for example this discussion: [0]
> 
> [0] https://lore.kernel.org/lkml/4cd29943-a8d0-4706-b0c5-01d6b33863e4@bootlin.com/
> 
> So I think never having a negative error value in the bridge pointer is
> useful to prevent bugs slipping in drivers. For this we should take one of
> these two opposite approaches:
> 
>  1. don't return a bridge pointer which can be an ERR_PTR; return an int
>     with the error code and take a **drm_bridge and:
>       - on success, set the valid pointer in *bridge
>       - on failure, set *bridge = NULL (*)
>  2. like the above-mentioned functions (of_drm_find_bridge(),
>     drm_bridge_get_next_bridge() etc) return a drm_bridge pointer which is
>     either a valid pointer or NULL

3. Return pointer or cookie, ignore cookie in the release function.

> 
> (*) I didn't do it in this patch, that's a design flaw, I'll fix in case
>     approach 1 is taken
> 
> Clearly option 2 is the simplest to use, but it loses information about
> which error happened.
> 
> What do you think about these options?
> 
> >> + */
> >> +int of_drm_get_bridge_by_endpoint(const struct device_node *np,
> >> +				  int port, int endpoint,
> >> +				  struct drm_bridge **bridge)
> >
> > Nit: can it be drm_of_get_bridge_by_endpoint?
> 
> Argh, this convention is changing periodically it seems! :-)
> 
> I previous discussions I was asked to do either drm_of_ [1] of of_drm_ [2],
> but since the latter was the last one requested I sticked on it.
> 
> @Maxime, Dmitry, I'm OK with either, just let me know if I need to change.

I missed Maxime's response, sorry. I'm fine with the suggested
convention of using the first argument.

> 
> [1] https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad@houat/
>     -> search "called drm_of_find_bridge"
> [2] https://lore.kernel.org/all/DEH1VJUEJ8HQ.MIS45UOLCPXL@bootlin.com/
>     -> search "What about"
> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry

