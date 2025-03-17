Return-Path: <linux-arm-msm+bounces-51607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0480EA64C1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 12:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05FD91886ECB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 11:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB2A1D79B3;
	Mon, 17 Mar 2025 11:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYHxUqMP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72A7236458
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 11:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742210252; cv=none; b=lKD1nYRWj20SoAVvfN/ymXmYMzvjsXe+5vq6tESiye+A2Jgsn0QOElvg4A2H/d8wURrj6cChLMQt1qarW8iu5wpQlUd73aZznJos7w7ikYf+/f57Jdum96jOqDFa0cGnzx1Y7aN8lEAr5fR85msvDI6r70yMyiSt6xZb6NAcpdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742210252; c=relaxed/simple;
	bh=MjGaHAxIyKXmVDUqw6iZrWpQY4My0C236pP+phIqMXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZrTaH7Vv1g+Ox6LnTVJoR8zdzPSGkR1LR4bmApZxJgxf4XqQBeGeue+5Ootn4qVKTVMQ/86PLvLAUWXSHR59RQUuOafq/A4rdi+wGk9IUXyHfb9zp8wz56EXJNHCy2RpjuFZHb2r9DLBw0iQveWXp2IAEkIDl6L2IqunRD7l+Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYHxUqMP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HAgOYM001749
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 11:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h74ZuGvGt7Gc4RGJOB1qbK9R
	Ms5B7HunMvfAcbl6nvI=; b=HYHxUqMPrJ3obXGUkn3BioKk6j6uxHLRu7NOjZ6Q
	na2xwlx1XjT+6HHgGhYHgxUu0HyEUuyTIw4tkbu7bVGW4moFV4UW93i1sFXRpgW0
	C+b+xTlN219AHLkDzh4tcROiG7Dng8YcRpKoU8os1A4BeGsWI85bY1d5QTWYvVR9
	mVK9+SHC0mXBWnWtE2KjB5SnL91X+q02dIyuEGOJQ63A/viXrJNynF0ffqW3ekMA
	4uV+/ttvfdmdKGMgKZBIhm7ClX968bawO6/xmsRiK+cZg95wEZIsntqvexcreKnc
	Cfr7Faml7mCCPwX/cYaHRobY+9D4Qdg8QLj01sKWlQcWYg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1x7vfcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 11:17:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8f6443ed5so94372426d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 04:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742210248; x=1742815048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h74ZuGvGt7Gc4RGJOB1qbK9RMs5B7HunMvfAcbl6nvI=;
        b=jBRXOwWcJ6b+FpOLg3pp4yjja6E22UKq4DaQXPs75qlZG4Qt3V/cqEvR0/p1bE5avt
         UwMykc11S7eWwfdCR4X26R3NTcM+PJMLm6R6JIpSrRmWhLEOCUJTh6Pk+ELgwdOPvltc
         FNT3z9X5/fVFZB/Cgy33Kp22F2A9iHvkgGIvXBGtJr6nKPw/YrDQMy7ClJgo+CT26S37
         3gVzhXMwWqGYIopjFU1OpbjDo1R97/WCJyC1pgMfEg6phBadnj2LNd45fPpSOxI7/jfN
         qaTt6EslssVKRKNwsVXJTqB6/g9y04KZGFAIr9Gvt0NZdggLGb8c/OGhwTSP8zZrTIx+
         o8eg==
X-Forwarded-Encrypted: i=1; AJvYcCXyCrEY9HSbKQR6cPGA0u3zYEIm/cfQRw9s1Blf8EWGB+PNTtfN6/Ows/SMEwNsGFCQKuKGE6Kcfv3WZ2q7@vger.kernel.org
X-Gm-Message-State: AOJu0YzALgys/gehoIznNoxBBK7AWyk0AjrVcj9DKHMb3R7pfVE1TE8h
	REcB7v3UVWHGEYWhR+DtwNkuFI7LfHKgEcet0Kll8zsSmAVjVdKDCrUDeQQrzxswqlmdYz0UGRN
	gSkUgwQWd4R2f14TV0mozO3aVjVLdRPLYAdnWFcP7jlTeA0xJYTMK2OQmBEiS9YXt
X-Gm-Gg: ASbGnctDZiuGeawED10Ysad2teLz3/WH44TQQfViIDOBj9Kfk9ExYEZvDJOYdU8Yiag
	IeAnAb5UfIpvw50u5c0IAhpp/SC7dMuHvGQm31lUJcam+w0ht8n/lomRR2YtcaAhOIs7WOI19sr
	sJUjoQw/wDPIarE0vy5+QOMNG1fwiJFHZ15nkqxPJgUNNoZh0sPjxZkq+Xey87jiy0CYRt/b+pB
	ZiSQSO16TuEUsyIpj4dUnV2OgsY4IOJfecnHmS+YsVu/ctaCjhnIFmQvm+Dey1o0b96NRUL6cYl
	aUb0u+pxemn/VKf04WVGCvMm1f9i8vRH0UZNZdlbuJyoRwk+AgJXd2a9aMzcQstJjxQEZcZEwDd
	1qZQ=
X-Received: by 2002:a05:6214:5784:b0:6e4:4adb:8c29 with SMTP id 6a1803df08f44-6eaddf4d222mr233455216d6.12.1742210248622;
        Mon, 17 Mar 2025 04:17:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1cyDl4xkioe3y+ghWS263/60KKZ8OYW8NPmR6GC2f7A41gOXYwaVyUw5mFVJ9O7ml2j/IHQ==
X-Received: by 2002:a05:6214:5784:b0:6e4:4adb:8c29 with SMTP id 6a1803df08f44-6eaddf4d222mr233454916d6.12.1742210248276;
        Mon, 17 Mar 2025 04:17:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864e24sm1302546e87.107.2025.03.17.04.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 04:17:26 -0700 (PDT)
Date: Mon, 17 Mar 2025 13:17:22 +0200
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
Message-ID: <2wxcuacri3ts24hyuqpvw75cubkhcup2mftrsu7yykrrodulix@fmuzn3unykux>
References: <20250314-dp-hdmi-audio-v6-2-dbd228fa73d7@oss.qualcomm.com>
 <d5b8a7fa506ed3026c19b383edf160d6@kernel.org>
 <otidtln4pjb47azr7zhllxkqmwocdnbdiay6xcg6psphz3436i@fn5hxgaflgv6>
 <20250317-dancing-loyal-malkoha-ad5a36@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317-dancing-loyal-malkoha-ad5a36@houat>
X-Proofpoint-GUID: xqksZ4SFGnYbneTaYBaAyeOlXoXczb5d
X-Proofpoint-ORIG-GUID: xqksZ4SFGnYbneTaYBaAyeOlXoXczb5d
X-Authority-Analysis: v=2.4 cv=Jem8rVKV c=1 sm=1 tr=0 ts=67d804c9 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=dGy_cPlXK_KhQYNS9IIA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_04,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=949 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170082

On Mon, Mar 17, 2025 at 10:45:16AM +0100, Maxime Ripard wrote:
> On Fri, Mar 14, 2025 at 08:55:05PM +0200, Dmitry Baryshkov wrote:
> > On Fri, Mar 14, 2025 at 05:54:14PM +0000, Maxime Ripard wrote:
> > > On Fri, 14 Mar 2025 11:36:49 +0200, Dmitry Baryshkov wrote:
> > > > It is common for the DisplayPort bridges to implement audio support. In
> > > > preparation to providing a generic framework for DP audio, add
> > > > corresponding interface to struct drm_bridge. As suggested by Maxime
> > > > for now this is mostly c&p of the corresponding HDMI audio API.
> > > > 
> > > > 
> > > > [ ... ]
> > > 
> > > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > 
> > You've sent two r-b's for patch 2. Is there a chance that one of those
> > was for patch 3?
> 
> Did I? Sorry, it was indeed meant for patch 3

Yes, at least mutt and lore show both under patch 2. If/when you have
time, could you please fix that so that the r-b is recorded for future
generations?

-- 
With best wishes
Dmitry

