Return-Path: <linux-arm-msm+bounces-51466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C52BA619DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 19:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 279997A6268
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 18:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B269D204598;
	Fri, 14 Mar 2025 18:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5MINVdX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1721FF601
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 18:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741978514; cv=none; b=nDDOiyykgXDQLSDcGvW/y/TtP9p75yCt34HCfbCWWWyZf0PGXX8dNj5KGQ+wKt0vLxXWjWWHFcSd5lq8SQFf26JhrcGc1cZKuxhTWwZcSEOiyvNKurx22YY0/zHystB2pTpHHY3C6yZSw75Aty/ROkVl3wPCa0KWbFPCnUeeyV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741978514; c=relaxed/simple;
	bh=LNzpERu0WGt1HHgrRI5eUyFwoCLnVZDxJpCWXFwft3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/dv1ZSEQULCPFCHq50R79f7mCAZ8i7VPG6Z58UjXJqnzawcZp8+L/8n5IopB8dXGUUL/MkPQ8zB3EoSphcwnxAPEoukM3GkM5V6vU3tokrlcWpMFghNpmZ5qr9HumVx2y35JadTmNAzomWjKg0ag2hlCqwidMGjJGMdC1hDh40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j5MINVdX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EDu52q024812
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 18:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HduUHmuvaB6gfmmV3ws7Fo/V
	KexaEbdRlx2tI0VvLX4=; b=j5MINVdXVPvVulqxvi7a0/aWKZSLSCpMkIeWCDBr
	PRGyNUPUaenkKpyOfkTUOIbcR71//Ktj6N++ZVDG9qAP1lVnXhf0vhl0G/S8evGi
	IuCHK3ROPe5/gWfHHTuxd9MDGbwyt6ukzxVTSmY3Dn8Msz+aYS4xc7TSL39Oey5p
	ZeXe6D/7rXSFxq+7DU15fbvdTHC3oXi4lK98cMtoeNvs0++3bDCQe1GdOmE/9NCW
	Z6zPNx5p4qW9za9OC0OPb6Q+mc3l74a5cZq2ep0NBdMaIrMjL86i3R6F6ZVeJy4e
	T52VqjDUtpx7mnf7VimKcJKDb1K5qt1LLdzeozG8ClwGnA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45cnscrtb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 18:55:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e916df0d5dso45676126d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 11:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741978510; x=1742583310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HduUHmuvaB6gfmmV3ws7Fo/VKexaEbdRlx2tI0VvLX4=;
        b=wL4to0wA4xVaBcLGs78GVVcxSYJwKTRfHXqKfNgE9MIXTxgOjt5MaPOIwWWGm0yicB
         A+UXwBr5gL4RRQeN/XtYzGht/Ends52CDzJyE4bBvV6V/hQLujEVqrZzIQYaHQbI4bL3
         qeDndFgi3jTfu9CVCDNrgMWaoGfWFCJ2Hi7BujedqXVA8iUokDlAjjavS+irK+xMrAv2
         qDrIKysfWgnYDd/tq8pyP2eejAX4hcGqKSuBFWcqyeKt541VdVeuxvLiSylD3vBk1Gdt
         K5YTThcv1hWLFMNb782gDUUOhv9Jmo+vKPlcEVUdalZxREs0NU8/5lsWD0F8DNoIPQiA
         s7bA==
X-Forwarded-Encrypted: i=1; AJvYcCVR7x+pgtz00I2ilw8PHvi064suCbQu6lRgWJRi6O/v9u/5jx0nLkrmR/QrvyqfJumLHa8ARbtb+Mcnz/u3@vger.kernel.org
X-Gm-Message-State: AOJu0YyC/udSjHC+RBmCF2ceqxmrbXkQDeCvVzhXw+VAPRu8ARpEgw5Z
	g0bOCurBM0c2EcWFvVYqsljCQdH7GnL+nEZjnCIdxIqUskZcoa3DneyRHvhsOFvcd8+Q5MSRHFJ
	hixSiyFmBHXnmcZ0TSvwlvRug+gPg5rIdC2OSl4FA01vtGt53RZa5swfJsikRk5cr
X-Gm-Gg: ASbGncstj+p68LyEkpKgP4nhuya7jRKoYZImuI2+RIrLoKX/gBOgs4lyCzDA8vMyc0l
	NJMbNpfykqYRZOOpl67ExTHYUgR9wH+DcmOcjiTpVfHWX7MbTjYhlUuoOrMRGr1z2tvRgIwYNs/
	3A7LH27hTIGTcp4gmd2LKFLT4ZeeEmfhTKU7N1t2kQOEHwMkGy/feOXHTPEZ5Sc61k+97X+N+sY
	IJH8FpVRw16TSziQV4y4OHToFqBg0G4plu+Ps/HOFfHF3fGgiURVhgPbv9qG9nHh8JO15lNE634
	MLHdA96YStdnR33CMrvK6KvNFZjhhoZ2oACrmcGzV2WTlelxcod0smzir1lRzMeaDOFYwRa/U/c
	L75s=
X-Received: by 2002:a05:6214:252e:b0:6e8:ebc6:fd5f with SMTP id 6a1803df08f44-6eaeaa8e3f1mr49273706d6.20.1741978510722;
        Fri, 14 Mar 2025 11:55:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE257MSzOWoy11FijTGYTY4RP3nDJLcq+KMpo80CBlog1fwjsIU/CJtTndItZwBaXbwOab9dQ==
X-Received: by 2002:a05:6214:252e:b0:6e8:ebc6:fd5f with SMTP id 6a1803df08f44-6eaeaa8e3f1mr49273396d6.20.1741978510399;
        Fri, 14 Mar 2025 11:55:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a92f3sm586420e87.237.2025.03.14.11.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 11:55:08 -0700 (PDT)
Date: Fri, 14 Mar 2025 20:55:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Hermes Wu <Hermes.wu@ite.com.tw>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Robert Foss <rfoss@kernel.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v6 2/4] drm/bridge: add function interface for
 DisplayPort audio implementation
Message-ID: <otidtln4pjb47azr7zhllxkqmwocdnbdiay6xcg6psphz3436i@fn5hxgaflgv6>
References: <20250314-dp-hdmi-audio-v6-2-dbd228fa73d7@oss.qualcomm.com>
 <d5b8a7fa506ed3026c19b383edf160d6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5b8a7fa506ed3026c19b383edf160d6@kernel.org>
X-Authority-Analysis: v=2.4 cv=Qbxmvtbv c=1 sm=1 tr=0 ts=67d47b8f cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=lSd5XUrhw2FdKyVgWKUA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: z9sCy05jakKt7U-5SKF9yLy7n3IRk4ad
X-Proofpoint-GUID: z9sCy05jakKt7U-5SKF9yLy7n3IRk4ad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_07,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=836 mlxscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140147

On Fri, Mar 14, 2025 at 05:54:14PM +0000, Maxime Ripard wrote:
> On Fri, 14 Mar 2025 11:36:49 +0200, Dmitry Baryshkov wrote:
> > It is common for the DisplayPort bridges to implement audio support. In
> > preparation to providing a generic framework for DP audio, add
> > corresponding interface to struct drm_bridge. As suggested by Maxime
> > for now this is mostly c&p of the corresponding HDMI audio API.
> > 
> > 
> > [ ... ]
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

You've sent two r-b's for patch 2. Is there a chance that one of those
was for patch 3?

-- 
With best wishes
Dmitry

