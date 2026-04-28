Return-Path: <linux-arm-msm+bounces-104970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ5HIl+c8GmGVwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:39:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D367C483FE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A2AD3017C30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28DD235DA41;
	Tue, 28 Apr 2026 11:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RM+Eq6m7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FMJrSRW8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C882F2116F4
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777375923; cv=none; b=EXf68OOFxDA93JnjtQFmU0YSiUtjTV/7sG5nhGWbVDYLM222AHw9XJ177OGdXgGJNxOcFlmZYYni+gtgApIVNsYKXXcw7hAs64/ZtEkFgeeH+KDrjjog9Fl4fx4uBikxXLsurQcJ8dWglembYLrEPjG0ad7r/go0abC8P8GyN9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777375923; c=relaxed/simple;
	bh=C87nC3J01QCttgmpiPi6hGd7xg8rSN3lym6Ro7FRTE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fE3NPCZiNOhnlJ0OOyENRvtdGSNiuiX3YGfxX2Uh/OxmS+7/A9wewbN+WlB3OLdIYAwMA8AjlACrBUgNkGcd/56JkCIaGfGTppKE45EB1zaOkw/YlBIT9QjxBeFRNbHu/N69RoiB0GAVEJKuD1Rms9qO+ehZ+YFlxdrKfy3v+nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RM+Eq6m7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FMJrSRW8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SAO2xO1329580
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sQLZEedAb88z0FcldXX3/tkr
	8XsiZzoWRGMmS0yjlBs=; b=RM+Eq6m7LyVwq0YUZuHQ2FBEIgoNu2tiFFFHljeF
	KqsPixmYhdlCEE3aiHrjNx2kGP5ch/DO8HY3H5IQyLWd0COR3qpRiD2YkqdTOcFg
	EvZeThsp0jMwDgoua6sPpeKfStnhBlKOL0lBmmlZPjK+i/kKinLW046qFN8mfoKr
	dGGvDQKPVk5DbDEsBeKaX/apdXKjo131DgFSymWZeS0pEl6faCoPM8o3bFJzLdnE
	JmpB6ywQ6haJDg2YXthgkQBs0eQeLkNH5W6a10QvdZYhuamMZr1QHz0ivuqBfzsJ
	UObWZkjZPhKzuKWEoevovO33o7mZDZcK+C2mrQ0inajBgg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhahm29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:32:00 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-62846961f0bso418136137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 04:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777375920; x=1777980720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sQLZEedAb88z0FcldXX3/tkr8XsiZzoWRGMmS0yjlBs=;
        b=FMJrSRW8PigvIrrsrjaj5u8rWQYmJFXcm0QoGmiMs/ssjW4LQjpx1BsKliIll+D1s1
         hnTevS8urMf48a4EkU1/Qat9qMHm6mQF6r1OmFy0zsfY6vHyDUVQ/bwAt0RcRi21Zy85
         TpCiSt5y10FCl1y0lLzIynI7rRyiy5RK87gK92UBeEKj+Wr9be3DSaLtuTcnNTqQW1DM
         7TQ0BI42oiNN5XJvNZNHCzCI2kqtiO4q1JKBmzsQoY+nVBit1+u/a5JFhA3NCO1e7uaE
         HtjlXwWdY3dQ3m0lcByFWNRVYuvcojrX0V2lK/0yVSEuT5+g3pDVlyQ2xKZcMvFSysRe
         cHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375920; x=1777980720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQLZEedAb88z0FcldXX3/tkr8XsiZzoWRGMmS0yjlBs=;
        b=pOvlfASfUoYLmdOht69LgRd40JbtkHVmFbjY/5dUGvqRZl5P0zQZwWGaTOcaml8U+Y
         ygLFg1Dq7uDiiQw63/vgVQJ5Z8scnsmFJq6jUauRAEgymwGVQiD6Gm4jgNUfLbbuQ2un
         bt02gOKK3vuw0xcSvlpsUfFqfbbS6aHj/QT9bkgww5CWKhMeJKEIVhv/q100GR9FKBvM
         do5JaYmr4SEmpRE0zdIMj7XTBltqzB9AvCxIEfEYETY7KDbjonDzPPlXhl8dJjrIuLxr
         bdn5hhIGFakhm54PqyY+NXnZJcMwHGex9FNgXsvwOpTdIxa8uck2aS8/mJE2Q/m5oSjj
         qepQ==
X-Forwarded-Encrypted: i=1; AFNElJ/m4e23yft9o9kaUMJpYWQa+03IH8DA2sPF1icvRMg5pvhCSoaXVZMjZBxxQnUwdyzBuCgW0Yc7ijRSAMz8@vger.kernel.org
X-Gm-Message-State: AOJu0YwmxOHYvo7GQto+DY8Wu1SR2El3OQvT5Qp2J72s+/H3/yYItrAn
	o9l8ABORZHz2zM7YaOELS3cleflFhYxQZvCSyVv6JSUEKxu21Mxal9d+ZpRtbR1tw7N5Bgx4+SU
	RYFg9I06aOtWwedw7yaFpidqmjBtGc7HF2Wh/KqG73sVHO0FPWYnYOoASc4KquBLLAtv9
X-Gm-Gg: AeBDieuC8q3aB8gv/HodyGH0ljMcad9O7KldoPRTBCYGIdqe0lqfDDtnrmZnptn/Rol
	E+HPdRAoBjVcN3zpBIU/xBuaqh/MbjNFS/Cv913Ph0CHidcRintpMMBL1mBmCip31TnPHZTbJ5O
	4hgQO5V/uCXHJK6tXH5FlLShmKtEOjl0wTI/NPROUFr9oT6g6UHMOVki8hvPRzkhp+Ogb+KC5M5
	PheU0wDb6nrQ/+ybE+fVd4L/jqEZHcIVGFmGSDL/j+2b6+5ycr4amUMKOjip4msx7sln1ZvFL2M
	PSIqUKDXltlw7eNKGz4xNyjmuCa/OKKcwn/QQWWukQFvC+QpiDRUCXjM6v2aM9CNSCm1x3iF8gD
	jG4wUQlwt2p/SfhdQ8Aj0/D0omqYdYyIMVU9nG2LEixHLzYPYq/7oR6FS3INi1JIWORvnQh1tEo
	1sZbnm98a73ME3rXYu8DTxE4/6v1TcqqYZgB9FyqktdJTWTA==
X-Received: by 2002:a05:6102:d90:b0:604:f29d:84be with SMTP id ada2fe7eead31-62808d611a0mr987281137.3.1777375920144;
        Tue, 28 Apr 2026 04:32:00 -0700 (PDT)
X-Received: by 2002:a05:6102:d90:b0:604:f29d:84be with SMTP id ada2fe7eead31-62808d611a0mr987259137.3.1777375919640;
        Tue, 28 Apr 2026 04:31:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3923f591370sm6515701fa.39.2026.04.28.04.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:31:58 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:31:56 +0300
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
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <jstultz@google.com>,
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
Subject: Re: [PATCH v2 06/11] drm/bridge: lontium-lt9611uxc: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <55zrfwf7cy5p5qyyw4wpevbb6k5fgmyj3o7sg5ztc6iklvaa6n@6al7kqhpdvso>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-6-4300744a1c47@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-6-4300744a1c47@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNSBTYWx0ZWRfX/9uUlAcjs4N3
 Br+XH+zWy+ToFoIqAa6oRTB/6zxUUGAYI9aQKJ96I9PvvNo/1fP/NrH+TF6vZ1LT/jsvyyOciqC
 kazbB2RXjZCphZYU7UX7I3A26myGYoVfTu6eF3h1gcATMtiTYUOI5izQHeV7bM6uSft2blTLjbN
 bSdD/uGRp86aROh79lhA7XQridH8xEMwTdmOjAvLLQD4+cmEYi2k3jP0ROy1zl0lM/AHWSY+Iee
 TaRzGWcEItcELjL1v+WbKsjqN2jyRjbjBfz0lVq5lmFfuuOvT4J65OZxi8XrCHPspchrNiYtoiv
 3Dx3w//QIRLckoU0WBAO5pc9gw0hKWHYuut4srf0cxHJ9VvGeJ/1uwfGhVS/8v28YWyodGmHW3G
 LZjq9Co9KkNdd+gJPww6gLiuAfZ/qBDYyaZeNHSEXVf2UmdCxMvTz3F1DgLg9DE7HYc0zYwPMZC
 R9q5Kp6e1e+/Xp0+fdw==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f09ab0 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=8NnIfHsthi2a-_wE1lAA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: nUN8aJ2t7KSPlE3fgc6JPESacnaJ7Rfu
X-Proofpoint-ORIG-GUID: nUN8aJ2t7KSPlE3fgc6JPESacnaJ7Rfu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280105
X-Rspamd-Queue-Id: D367C483FE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-104970-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,hisilicon.com,linaro.org,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 11:15:52AM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal. To achieve this, instead of
> adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
> pointer which is automatically put when the bridge is eventually freed.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

