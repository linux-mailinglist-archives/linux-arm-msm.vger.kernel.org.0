Return-Path: <linux-arm-msm+bounces-102989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNQZD9ox3Wn1aQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:11:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAE23F1D98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D59323037798
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 18:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB65A17BB21;
	Mon, 13 Apr 2026 18:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nxr7YDE+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="egz7KEYf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F413E317B
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776103858; cv=none; b=ZeLGhZrW1rh38sYDuM8Xd9hCqsF4o1fC1uKZq7Ov2Di6lob7i4gt1/T1X/WHTcBGbvnR4nCdSFvJoA+rrJxX/bzYsvAydP2rDWLr17yhWzFKTxYGz1xJVOfCGBq63zQ79czEAbj48rcAq1Rg+CJj2B/R0dPLv2C4KXa4dQcf9+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776103858; c=relaxed/simple;
	bh=EIbWDefZLHeqTm4UG6ZVJiRJUKLOAhJ311O/1113x5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQX9/G7eMz/4NJjs48J2H4xtf2IYLJJ54ExDkLgOWlN50biNfipCkJJ9AdbhksuT65zdCc80LNjCnIJ0+wd1uOabxtF9ih19Vh4qjOxxXQ297jTktdFqLQuzJOhkv7ze/1cKi+wo23seuCNid8ir6DueeXVdwOlK8rcd5mZ4/y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nxr7YDE+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=egz7KEYf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DDmQgh1497744
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=thMSOyRCtxX4mnV8s8UastfN
	C+eBisw9LHuDPQy4Nyc=; b=Nxr7YDE+Ulwbsxs0uQJ+5XFCFHQ3rs6D447Ui0he
	QKbSdxMt2HbxlqcqFyVNXKv1cdRJlXe5AjvPaa3qvzOBv3Wyyz5eXJaZFfPxKhIo
	XTOdfMeDJploU2cL4J8PvpeUbbTzPpJKx9XQu2igu5lSzFPLjR9m4Gay+zyDts6g
	th1flOoNgEstnMsA9vem9nKRS36CbA85DsT6PE6JkFkzaqxewn/zKahWRwkdcgtu
	5Kx/4cOfY+LMvgE2CgE1LhX8YoOJ+lzwYkqZaHLefpYEkyGjWEnfHx+cXJ3QpFB6
	ulBzEUNTB2oRatIaHovicUc4itXNbR9YRqMkh6FAinqO1g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh1pk90b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:10:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d58bed44aso138018891cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 11:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776103856; x=1776708656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=thMSOyRCtxX4mnV8s8UastfNC+eBisw9LHuDPQy4Nyc=;
        b=egz7KEYf5TqRf8KMEvG+IprWGnB09oDDZb0WQPBYZ3jDGQ7kp6OYSMupxvlXK1jf8j
         E3Gh3ZxF86YRpeSyZh4lJp9v/oV2OzeLHnAHvc2igjzj8WCCku516cAVQFAfKNt5ctF5
         4l0Y22poQmC8T6KqfDAN9veT9YLGxhDMiUK5kCWDRQHB/zEtOTQyz31mgNE20bgps0GZ
         hk6rTBtV7TNACU4roLjxWfP1781cpsBbU0c5DcyIpg7t1h8FLvq6vjdxBlEOvUeAfHG6
         mohNBpj9Cs0uE7+MDPAalAg3+Iw8Xs9JavIQ8vnk6zbDRaTUYIFfBWC3IP6eyot857OT
         7nuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776103856; x=1776708656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thMSOyRCtxX4mnV8s8UastfNC+eBisw9LHuDPQy4Nyc=;
        b=r3+V0fDtqE5TR6VGxesIFfy+3iAF6noMdyjrukTgkTY0GVMs4FOxwKjsAy+TS0cb1h
         XN78Qxq8ky3PNODEETU/zuHXEAkp/xau8cKUa3Ub+UB2TGmL83iUjy0XmRc+c6mRlFDE
         UdS616DXCgFRhKk+Vsb9gFgm1BIrzGPibICItEVdj67zbysu/MLc5Swsgc16BrmvGf2A
         O2N/aKi2QA1f/E7oiyCRbVv4PATJN/thWTxZSUD8v4OAf9wBOt/9ZrOurTxOnHJg0k68
         WBKC3u8ZgbzXD0ZUBeaTkM+Yps8kn/RfCX9wA6J1wil5aMnxg0JArjxeWGyqZ2S654Sk
         k5uw==
X-Forwarded-Encrypted: i=1; AFNElJ/yFCkVjXWReuZj1Jj38pKlsDUtbdcAtAqlIXQPtRYCYK5Ug8jhvQZB8nggeP33hlxpuBflEr+wPcTI0f7Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+MKkINCNiqXL/VXXtF5srDlDUfI3iTyE4+LLfCr62VBVoJQbo
	sZVOQYFV0AFYKl07egWbgeGkiWiafnDhblsHqjm1q0X63WTpbF/xKKIZJvjbK5da71/u2b69foQ
	Olyc9s5D+3eAFZ0kkSUt4ITwhHNwUHW+AujY0etSlpMOuPcttx20RLn1VcaZmEkzs+lfm
X-Gm-Gg: AeBDievNtwTGxB+Rs+lGUHTjJ07MxZwfN33yZIf1k9vgF35wUHdzBiQGuNB+9J7a6Xf
	W/yLRhVnkEZKsouuXNCq/FLFPl/q63mS0rKkw7jYrc8TocRWx5wca3IS0l1u/BJ2Oz1cT14QXSa
	OoceT1Ko94YczeGu9NNkuTnj1dUnCELo/r911FFBEIyBu7RxovLShODDehsbHBCjWrgWk6RHUPM
	Pnxygkco/xYltmEE7ZbfTqJxUMoy0I2QZSYxhHRjlPYqs3QpFnS0+eBjNRD/14eeeIyVqfZffuJ
	yD1I/XrFMt2oei+sEDv6+EAXzFHMJNFlUXgwP4N7MYDlqrqmV5NJHwJtUALhaliIcW/MOlK312d
	zPNmSy2w1ZGnH8o6+EAxJgIa7bsa3C9NnmdtWMKeh+m8ezsIW8tKtdLhJWVzFE94hd9xBJzFgMP
	tJT6eJNWumsxWCgV9JjW3UB5l3FObljsRGDThILOaiY8uRGQ==
X-Received: by 2002:a05:622a:1f8f:b0:50d:736a:624a with SMTP id d75a77b69052e-50dd5b95bafmr242460611cf.1.1776103855774;
        Mon, 13 Apr 2026 11:10:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8f:b0:50d:736a:624a with SMTP id d75a77b69052e-50dd5b95bafmr242459651cf.1.1776103855207;
        Mon, 13 Apr 2026 11:10:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee12fesm2704689e87.40.2026.04.13.11.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:10:54 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:10:52 +0300
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
Message-ID: <kie3dnybc3ycjcotnlxdanffv3hr6emaafy3xuhc3x7wsi5s5q@dqvqkm5fidof>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
 <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-2-acd01cd79a1f@bootlin.com>
 <t45cmunr6lhxrvqgwa2mrh765zmjjderfpd32islrbg7jey4fq@d5635guivyla>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <t45cmunr6lhxrvqgwa2mrh765zmjjderfpd32islrbg7jey4fq@d5635guivyla>
X-Proofpoint-ORIG-GUID: DzgtVuma01PtiUlY7F90iechvCwsf6Kv
X-Proofpoint-GUID: DzgtVuma01PtiUlY7F90iechvCwsf6Kv
X-Authority-Analysis: v=2.4 cv=BoitB4X5 c=1 sm=1 tr=0 ts=69dd31b0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=Z46hioPf_zsqFS52ZJEA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE3OSBTYWx0ZWRfX+RBWjY2sN0FK
 A9BLhklG8X9YY15IFqP0B5dL7FN17xJeLSk+//gjVRVD91O7RU24id7aOVoDHSpE0MO7nQJrV8B
 +bBczLf1vX4AeFPl6RBWi7tqEk/4FhnQJJTmT+hW9s2efVqerGOfOByEej5PFSQLA1CRMGH+yzC
 aT00AUP2Aoh5UHUDirnI8MVahCshg1ibBOgSl6tX6v3R8iBGovbmYen6ncBNL23VBtymyxMqVq3
 uXaWJbIuBtBY1eeL8Zq1tLCcEBwD27F87OgN3ocyCRw86Uh/7kMWL2MLtSW0gTFK0eEhM/NbzXQ
 0bCOVamfuS4bdVfmOWz/FyY1ziTkszzY0suLX7Na8U+QorvEzH+Lb+tOy3GzcD3QQUZHjuYch9l
 /nanKTkIg3VXLVL8nzlv27EVFEeT9VLSGhqq92JnQZlsR9EyLD5ZvJKjDIXC6LE1XRDa7cgtumi
 CTKfvzDSk05yZ2gL9pQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130179
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102989-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,hisilicon.com,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,bootlin.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9EAE23F1D98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 08:57:42PM +0300, Dmitry Baryshkov wrote:
> On Mon, Apr 13, 2026 at 03:58:34PM +0200, Luca Ceresoli wrote:
> > This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> > @panel parameter, thus using a reduced feature set of that function.
> > Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> > 
> > Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> > returned bridge, ensure it is put on removal.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  drivers/gpu/drm/msm/hdmi/hdmi.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> 
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> How common is the probe / remove path? Would it make sense to have a
> devm_ version of the function?

And probably the best way would be to change the driver to allocate the
bridge early and follow the rest of the bridge drivers. I will check it
out and possibly send a patch.


-- 
With best wishes
Dmitry

