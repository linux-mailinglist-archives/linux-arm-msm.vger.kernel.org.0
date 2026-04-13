Return-Path: <linux-arm-msm+bounces-102985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBvvMqgu3Wn1aQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 19:58:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACE53F1C06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 19:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA63830215B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 17:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B3333FE1F;
	Mon, 13 Apr 2026 17:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYJ29elX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i3FxdaHQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9C530E84B
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 17:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776103071; cv=none; b=YEQmKZxM4slFKf8m+jTRmGH/EycOS14N2mKdA7QsSU2HP6H1IFo0D6uY54O4X5ivkZvaXYEL2/KnXO5WZp7oc5jtvqRfAjiss969XLrSzdPUEdonff3UAgilL3djawPk3vlbyjETrCGVcnzaombImlYvusrXFNV9kBwj6jhcyBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776103071; c=relaxed/simple;
	bh=gdpAoHCsJV9N4gnaPPkgmh41VUJIrfXEmzEc1TTMeHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQIhpfsWjNQS6fSgWnOimfln/mMtS8ZFnNPJdn6At/7BFwKGYP6PrjbmoS79gVyg5ASGliHkbzEA1w74gOP1OAtU9KOzYJk/5iMr0CI9ffbZXkiqrtyPO7NJSGYYO0j94jWe/cI36p5y6+UyAhj8OjfpJjldmgrogk+V2pJu9Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYJ29elX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i3FxdaHQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DDlxvR1496715
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 17:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PF56oFFcY8rN+D6lGHMuLLpm
	LnPKi9sPdMQpQo/0PDo=; b=AYJ29elX0COrAWmTaSA254ZqAugCQ02TUvSX6j9e
	ssKVfQ/ZKRvjBAzIJDC5cWaKwIS9ppem1QmqpoEWaItL/4uVXHDn0waVbxJ7c0y7
	1mw3q0Qp4peLxQWVyALDwhLVQLnnRa/4c8YDBGNfdqpXTcf+STwKNlk5QcgM/CRN
	sNkUUe6MJNAiPTMDR4sSE68TT9lwq61YWWBjXyh4EXe0Qjxe8GeI4FE1JgQw5Uas
	Q0M7K3L9uEv+fUxXLek9I3wgvCOHXzjihMU+jwCTjVYPhHMrbjx6Jsd5pwWColgm
	4pgTSV/WiA0hKsWpvaRNzpmDJn9lwIbUE+zMOb6PP2mQZA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh1pk8xx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 17:57:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b52a2d70cso48857161cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 10:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776103068; x=1776707868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PF56oFFcY8rN+D6lGHMuLLpmLnPKi9sPdMQpQo/0PDo=;
        b=i3FxdaHQ5V/bkULDQFKxNXJemKJ0yFO+2ouwuG66VCD5X0TiQ7slrYCa9eWbUsDSil
         faCuThnn4NquCSsSq0JMSzq+bHnx58qpj/QVTkImB8CQ2+8Qc02N3xcPTkGD9xNG3sRb
         ma3mCwE3ns8xP7Oq3G0wkrWrT/mfX3YDJ00iHvyJJQl6z53VZillfj3mPuu2M2HfFQhh
         L2i+ZKG+5fEDhPEXJGPTeHMt14Qem/z4egjEuiUiQG5GpI0oCPUX/selnVqNBdIZPj+4
         U2W4Fwb43IM5zFX10TYNYYeNKN5At8uo5LTdE/4VYfjuZktxhhMp91zFjX+9SED0D+NQ
         Teww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776103068; x=1776707868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PF56oFFcY8rN+D6lGHMuLLpmLnPKi9sPdMQpQo/0PDo=;
        b=tWEw1Dlrv/BSc8E/T9JdBUoLY6eUWo88FGLXGAettfGI6jpje48Gu5G3kftb/HkyP1
         1RfgTAAjNf9UHzUVss7pDYUERMGlzSSTlpstVEBXMxCTeYsBIVfknctmOWIfcQoUXdKz
         x8GLuJD4dmmNVgzsB16P8KItoHEIbjx4U4qcPnaSxy587yOKX58USRHCVYQXubjpOVPg
         uv8nRl7fjbVf5PjY8VBCIXamXvrfsB2plCM9OQyC2iVpTJ46FmLFKx6WKkkoVB5GmgD7
         IB/TLOimBdW2Ht8gXjhJAIaPohqHh1suKfQvUiTw2MMlUQmm8I2Pw+yJIm7sWWpOPIxs
         HPGg==
X-Forwarded-Encrypted: i=1; AFNElJ/TOXY7CxdaCO5gFMfpFNvdDcZe5hbNjoiaxsLbZ77d5G2DTLvPJZagEAZ11PH8nPWF4QjslTPb0DPRfnHc@vger.kernel.org
X-Gm-Message-State: AOJu0YxdUAvai/vSMOn6vJXFOo1H7B1DItFX9qXROZnmIWdcVZ3NWXfX
	paGIuvTOlaP/lQ7X13xTBzo+uAElbdElj2DFSegj0NX1Dfj0He/CZpDcao5mVvJzYIt0dAGiYAr
	lgRvWHNGmtmSudl3UYEW0lhLE7vTR5AzmFqU7Aejjk0OmD4TgGiwR+rnTg2Ms68T5kfHg
X-Gm-Gg: AeBDietU0RjIavGeAx1wWaEVOz/SAHaPevP6HSLyA5MNzTow+A/nZ+UR2loQJ6d7IPO
	QbU/AuOVSVxn2WG07YKNwudei4lKBxwnfusqp5HyOwlGzy1hScY/jRw3r+OwFII3+7hk22TIksN
	0MrxUyw6imGo3CaxiuNRNzZ2RUJPcUPTW6ZhA6rXQoqveWn5YFZURHIo7zRF4VSV9QGvtorezPj
	dM9PMKZSu4Tn+qF3Bl3Sv0Vqwp7SzaEtTV50AFsctybOjcjLXyfpATIA2h6muVTgHdCdVxwOQgY
	l3yjzTOCP31nj5eaUEb+gmlN8lmsxP4SdYsNabmrTyCA7U4hElu8tVBdfqTosILziFKfMLHJb7S
	1j73SeGwExNgnUc57YKU3PmDuWRdamPApf7X/pCvmtRnSmJsp6jfETeUjW5RVVzUrKoxpjcSvW5
	ePWQRQK9UhMJrBcSim7W9UDrvU0sXhh8wAe1LNZYFKBe8FqQ==
X-Received: by 2002:a05:622a:a40c:b0:50d:6b77:4c06 with SMTP id d75a77b69052e-50dd5baafadmr176516691cf.29.1776103068191;
        Mon, 13 Apr 2026 10:57:48 -0700 (PDT)
X-Received: by 2002:a05:622a:a40c:b0:50d:6b77:4c06 with SMTP id d75a77b69052e-50dd5baafadmr176516371cf.29.1776103067734;
        Mon, 13 Apr 2026 10:57:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e8cd635e3sm221471fa.8.2026.04.13.10.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 10:57:45 -0700 (PDT)
Date: Mon, 13 Apr 2026 20:57:42 +0300
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
Subject: Re: [PATCH 02/10] drm/msm/hdmi: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <t45cmunr6lhxrvqgwa2mrh765zmjjderfpd32islrbg7jey4fq@d5635guivyla>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
 <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-2-acd01cd79a1f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-2-acd01cd79a1f@bootlin.com>
X-Proofpoint-ORIG-GUID: kW86m1icbcvb2ipYPnb5NjH27goUCxum
X-Proofpoint-GUID: kW86m1icbcvb2ipYPnb5NjH27goUCxum
X-Authority-Analysis: v=2.4 cv=BoitB4X5 c=1 sm=1 tr=0 ts=69dd2e9c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=hXVsb92WUBna0ZnZifYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE3NiBTYWx0ZWRfX7VoX2pBUpEbJ
 2a7B61mk3kjK4ZulLFuNC2tOX6oA75a3jevVXhBQrIT/U9OQkWv0FHqNpSBW9GkdEY5d8qXzP+g
 YXIsAxIHMd+mIq94wZaBSJQyeOZBKB5Upx0Di/xmU8kBOAKYBHEJ4LTn03fjfD1vyoAfzeHDjxc
 5zxrwKlCApAYVlEyBaoI71I2XHB9cfDxEgUM2OLZ4AQ9HAVV7mI5FuE6diysyn12BkzcFqEsIjy
 /2RXEfF4QtekigVx7U6xkv28pqf1ZZmpB1JM7THyKPiHbUIdUa1U1AAvlZmkzqvp3uGnUQFnhTB
 fG+sdaUgXBGqOR88M8b9h0BAujfwy1dFj5+XWiMexq6M+2TxL5ZS5PHmSsEQcFEWdueEYXqGF78
 VCtnpEExLWPNxwOrRguyZPPzvSGz/AU4j726z8uD2dyoRPLcGE3Xr6axdvkiWF3WuDm8zvoYll2
 STORXx2kJE0ZEgxm7wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130176
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
	TAGGED_FROM(0.00)[bounces-102985-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,hisilicon.com,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 5ACE53F1C06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 03:58:34PM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

How common is the probe / remove path? Would it make sense to have a
devm_ version of the function?


-- 
With best wishes
Dmitry

