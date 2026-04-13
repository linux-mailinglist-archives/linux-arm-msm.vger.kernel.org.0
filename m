Return-Path: <linux-arm-msm+bounces-102990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCffFEoz3Wl9agkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:17:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F053F1E44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCFD9300361D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 18:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCAE3B6BF9;
	Mon, 13 Apr 2026 18:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Va4+DI7e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fssLNgtP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF2930E831
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776103957; cv=none; b=m9iCcOaXF35+rLiKJQIMra5Nz4KkB/yWst655XW2HOeSZautLxcx7cJBfe/gVCL04S/s4QGJnwmM1t5AsYBywdUTVBPSszM9nrzR8G0KAZD8X4PgDA86PYtjehLVHEljq415SawCyNZbhYnmWlLCS5TFbYafHsrGT4dOfz19c1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776103957; c=relaxed/simple;
	bh=WIz48XFuI45gHkr3R2havTcAlpL8wj8p0+wFD6h31yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQGcdhgZ+6f9w7xSDU865GSGeNMTsyMRw4cgl15ybYict2haXw9sZ7vJ4fgj+tz2fvlS4b82oB+yRP5TwaFw3motpG2rEomNngVMTzmy9aMSH6KKUuzHBWMQznLLW6ag9MRxXGlG70Nc58oXVT5aWiPUxgi/DNFS62BTmqk9Ms4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Va4+DI7e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fssLNgtP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DH8QrF2231040
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BedpZMXwITef0qZfNsBgP2xL
	4vUIvRtvUBOZ7w9v5dY=; b=Va4+DI7euOKah4rylJBA1blv7r7Nghgd2cfthrea
	nG2Pdd2quhvGidQKWbbgMcHefCljwVxtPhRksF2D4p5acalYsRuM72kHEkcQIQrA
	SzDDQvva4J0BdqhAjR9s2O9q34BGEGzsCBNg1p9CqPgoNH9wbBXROz6pxoEMLbug
	+3YXLjFAhUZ3lzlE+u5qTiASywuWb584EvNS8pVi5rRSGeh8amlF5r4El/N2+gWa
	RemAspNddcCBb6kLR+pKlpkVmHgeo/f57U9E39UAAZbliNBRMGGqIx9FJzg/8QJJ
	eAvbzdcK1B7XWhUb3tGKg5OIZGmW4o1w0rbfjT09kaqo5A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dgxt61q9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:12:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4031b86dso126409371cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 11:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776103955; x=1776708755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BedpZMXwITef0qZfNsBgP2xL4vUIvRtvUBOZ7w9v5dY=;
        b=fssLNgtPqnvf13VNWMzMZT+3ZRGpiki6QAG0+PBeenVNL3NViJ/paIskU/ddFHXFUw
         WxxthH30gzHTswAo8Wx2H4poMCx5x07e+ZRHiRpWdHBIJsGplpT79vsKd2Cfh1lOXfnA
         mTiAMTEcf243xNMWW4lum8L3h/bJ9cSu0v0AwlQZb+KkQP9mkwIkMzHXJRuFqqkkpmVF
         LE6Xn/B68PkSpCzSdbE4/lCLsh8/iNxzmYVea+uTumOcrcEEI+cSzoS/jawkXOjF9+4Q
         1uyEC4vLH99T34LgcERguFY0ZjIUpW3zl91r58j9+WMiA0QBks4S377f3E264I0vaibb
         MO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776103955; x=1776708755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BedpZMXwITef0qZfNsBgP2xL4vUIvRtvUBOZ7w9v5dY=;
        b=cIHvZEK38ui3Ug9yAiYKxc8e6Ranh7u7FpZxWcBQ056H3DkdgKS7ZK9bnDjC4F4jqv
         XULpyiAO3uvcGBrVB2dRp+fiB1ESEF6KwA14FN9Pls1CkBrnaZbewQQgD+vtZmSmON5K
         RzUBx7ku16k3C1jk/Bii2ar/HmJcOv59c5Vb7DLOlYWcQxRC7L0lKQGEPGjgtOUGjJvF
         roRYRAwzssvHsRFnggCy/3F2t8cIdZAzcsvSAMr99VYXWoTEvNGetX8Rpi3m8IOJ714I
         M9Zr2kWekGnSE6O1ia342nycS9NW6LisWkSdFWd9O3yvNtT/6K2Oc1Isuo1WWzZX8ua7
         ppHg==
X-Forwarded-Encrypted: i=1; AFNElJ8xdKIbEQRk6PxJmm241HyrP517rG5hWxhsN3cA5yX+7GTpjK7EHz2B2PNiGZQ4Pqd9SYVUbyEeurlombrc@vger.kernel.org
X-Gm-Message-State: AOJu0YzuDZhWGJCP7+AYqx8Hjf/QDd2QlNPr9L4A3VEJMjxgSr+V+QOU
	lngottHEGE5X+XCXMT8c/T+OdGYp5MSD2UQSicRWUQY9wHbOh/0lGAEpIxrD09rGh8ammJFeqKq
	Wi8Pr7su+ZsLUHPdfsDVnmvcUsejUMRgHr6Or0BhaBUcgMktBdOtowbXFcRVwOplQXsPR
X-Gm-Gg: AeBDietByeDX4L/18RMPoZpM9hRFz+ZF+mzJeQxTKd/OIY0Ib5gmN9QRyL5eL+cJfGC
	WcvY5jYyfdCqPdM02HGBYbzH5p1LOC0RjbRqa+jBjZxixF7gfeAw17pTLsSNbPPHUWZwte4b8lX
	OT2azI3bMglkW1MqLRCNcsQfmGmN6E8KSdcj5nlSlVh2d68HoETPjKkSgb5lLQ0pnUSw9rDalD1
	AyZ+ih7c/wV85qd/EFNdRnSAQBo3/pcc2uSZDaEzxmfsk2nkUZyfYUmbki5OzvcCkRlbDA9IASM
	rtNSVJhzfrxDj/gkaj6fTHKv9JOgXkLsoHulDK2wqgfedI9NrbqPsdVPXhGCGDGYYmlq2ix+E+C
	dCtwyWrHljIgC++6plYjOjXySNGTvEcRYxgg6UtU9Pq65i5ae/RpekaY6OjZz5F6C1rS45wG2R5
	wLcpuTacOdCmd43SOm2iGOuC3DONeOf7xQbvIzuXMmWA7zVQ==
X-Received: by 2002:ac8:5a42:0:b0:50d:7384:a660 with SMTP id d75a77b69052e-50dd5a97333mr233249221cf.6.1776103954536;
        Mon, 13 Apr 2026 11:12:34 -0700 (PDT)
X-Received: by 2002:ac8:5a42:0:b0:50d:7384:a660 with SMTP id d75a77b69052e-50dd5a97333mr233248641cf.6.1776103953905;
        Mon, 13 Apr 2026 11:12:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49541ddfsm28584361fa.27.2026.04.13.11.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:12:32 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:12:31 +0300
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
Message-ID: <3wkifgya3irb6d7xwpjgd5pf5win7py6xqdrkgr2tzsgy22c6x@ajp7napy4f7o>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
 <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-5-acd01cd79a1f@bootlin.com>
 <rivgablnl6s7u54gyv77vr5pitlvvgzby7qnu4ryc4tttaqa7t@hztujmxw5njt>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rivgablnl6s7u54gyv77vr5pitlvvgzby7qnu4ryc4tttaqa7t@hztujmxw5njt>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE3OSBTYWx0ZWRfX1NQGwk4N5BFf
 baGJgUgG3ydudcYvuTGUjQMj/GI4LkffOzT7wHTB8yYqlXGXuzEVd5JSyG3+vOmlLslG1cXIvMw
 08zxUvTOtEkd6mBFwnGLKWAldmvdUp31rKf4Q6p85ACTbzChzm9gwNPELPUNnRpXGutaScn1NCT
 QEnyjRvSkaN7VaeSB0iIr3gQY3lnc8oEQSAWIvzUGgjSA614NfaZQFOjjVJwPUZCvZmrKj5Lmic
 RpR+ncNlfP7KHivWikfo61aRY3pARiNz5hctgGcflUf6DSH2zfRzVX9CJDBMHU6wur1ExdwchDL
 AzYKdZM2KRxE+GoenC9l/qHItNvPcuZsoM4aC2Dg4zLDz3vc67O4i7ss+36VSs6t4TfEL4EZzcN
 DGU3SGZQwMjSxJbrWkLK3hVwYxQnUH/CufTJxP6gbrBWO/J8HuV1knV7MMECKs4W5oWhKQLJDkQ
 cb9D/xUvj0mJS6cBCTQ==
X-Proofpoint-ORIG-GUID: h8e30LQBV4VOMu1z3wr9Lp6ohGEQRapl
X-Authority-Analysis: v=2.4 cv=br58wkai c=1 sm=1 tr=0 ts=69dd3213 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ypQp8mP0imzWzDNcvG8A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: h8e30LQBV4VOMu1z3wr9Lp6ohGEQRapl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130179
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102990-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,hisilicon.com,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 94F053F1E44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 09:01:34PM +0300, Dmitry Baryshkov wrote:
> On Mon, Apr 13, 2026 at 03:58:37PM +0200, Luca Ceresoli wrote:
> > This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> > @panel parameter, thus using a reduced feature set of that function.
> > Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> > 
> > Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> > returned bridge, ensure it is put on removal. To achieve this, instead of
> > adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
> > pointer which is automatically put when the bridge is eventually freed.
> 
> What if the driver's _probe fails between increasing this refcount and
> actually registering the bridge? There are enough possible cases. I
> think this also applies to other patches in the series (BTW, including
> the msm/hdmi, which I ack'ed).

And after reading the code, I missed that it's handled as a part of
bridge_alloc / __drm_bridge_free(). Please ignore the comment.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

