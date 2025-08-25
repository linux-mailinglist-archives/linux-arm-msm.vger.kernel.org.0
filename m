Return-Path: <linux-arm-msm+bounces-70732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA04B3486F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 19:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11BF52A3BC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 17:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B963B301033;
	Mon, 25 Aug 2025 17:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mk8agO8O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2713002BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756142041; cv=none; b=Xy1R/xxgve63OkpmSlIbCcmVUthjBcEQdK7XiqdFvOfwjQvhjrBPJQcupKraTTvgPNWrf2Sp/cl2f6DrNxU+Mt5ApNPYRj4PBH58Cc25rzBC1hxGqLWEs9ML2/hIowTUSZSN99nTH9IxwCRP69GVAyOAtUxU1hNcp10lqIIG3H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756142041; c=relaxed/simple;
	bh=cjqN1QiUmQidH2i0o8JvlIeD8/Kks9qiMj3qly97v/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fo9hs8+U36hZ158avI6wgAGo2k/STSjlXrJ6CAKuOqtdIUAOv+nU8zIog5ZaRrfeiR861nJSng5qKc9QdpVesTpuK4ghoSQHP3QFzdAFgYJli9nN24rjCRhFt7ZkD8/pK+da+C3uF7KMhDNr0FIuv7QF8iO69N6Y28zLpJWry7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mk8agO8O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PG4A8S025091
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7KZRtqKWnJbLSwQpwonaaONT
	oh9dnHVWnrg2acQzYvo=; b=Mk8agO8O4C2cyO+k9l7Xj0Eov1Gkf4uCPjuPRQSM
	4wQ6fsbjA/YpiVyRM8YA/ObGP8v2DaDKOjLcdm0yfOwhCC31FgHCcCD5HitKkhay
	vIuQ0Mb013VlU6lCNuJvVMH1tR2sbQAOn3BHCvKKjLs5/wVdfy/Ns+YqlnAE7rdm
	mE9MK91Y1t/PRgwMNhPuZwHR7TFdI2L6cV/jzJlIfF72naZvrVFatNoA2YPok41w
	fc1NEGOOqiqtdFFe/7f+YCKDKd+5HqE0hIBMukLyEt56/EHYikvNlHB46tdfICQ8
	66GtpfCd20l8YHMVnQsoSCDKyKx9AnuNUzcQ6r2A2r+coA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um603c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:13:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70d93f57930so118618636d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142038; x=1756746838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KZRtqKWnJbLSwQpwonaaONToh9dnHVWnrg2acQzYvo=;
        b=A4zq4dTlITSs0uk5Iskp2uCy1m/8VYUYsCdbrni7eomRhXasC74mGCxNLK8s2Hg3si
         rq4ABXzYS+kjzFUZKpUjXCshRqRrB841fud6yioEU2zFfRYxMzCiWlrt3CnXqgvX4zpZ
         BH6kOy8geCsjbJUkTpbMaHMSf5Ul9ib7OdUgbiWwZG8rraSSs8jahZkNtyuoZt+F8UfH
         GRpGQw3hfvReu+zOhaUmw/ZFGiKY4loRFLZ0JFhWR2B+VjkPAhrl5a7XW+6cYlKFATuV
         Wc0kXo82QICkzlikGPTM3IoW7rz31dUaLADetlZCocCJDHU8zeOmMTbzJy7aaLVx9dHg
         qTGA==
X-Forwarded-Encrypted: i=1; AJvYcCXSMCg/NkahikfO1JIRDNeu2UClVdWjpYbq8pVBTTq1tsfKUXKsQNLqMos1d8NnHNHkQsRHeXg115QH5i++@vger.kernel.org
X-Gm-Message-State: AOJu0YyKjQ8ySlgc2lDLIDdymChQu3ryuAPIYUKXsBgZue2jevwR0JNz
	uiqbAlK8hLkWC0rp/ShMwv9t+C4ZurK/gaZnUlVs8FJcxLbBaKrYe9UxzhS0foXbpaQhO0T1n5c
	Guu05H8l24BqOgUik2vSuIdJcjsVZFMfkLWfVnEAd1QTUI6QfkpdAdL54Gd9aXOSGSR94
X-Gm-Gg: ASbGncvcmToeFoxoS8F7vQM5t+0Ku9mky3qpNkStDYz/hYhexBHEYiZMMKEyIfrqCpi
	WsXRLyKojdL8R2KdgbMKBJZdMWpD++zSwo2MeARq/pSwm7yAqxZVpQ6BBysSUIQmf1BUhnGJMlW
	6l41O8pn6WDiH3IX2606MW4M+P2xVtBGyHMpvmtdC1PbWJCU2ZTn+TUSiavEX6LriIubQgtq+OY
	QvAt/ujYTnLL31wQ20GzvaAXRpAsxahNh01HXHHhjNJGlxNaKGbqs2qN0tSN4yyD/XzzDAQpJOy
	0wTc/tjf2uoUH7OimzOKVcIYfrcct9GUqzF4Kk+Ham6kXb32B7ukeqmK8h2YfSuphW3TLFf2pID
	JS3/Sdk01LD9yIL7h7Dwh3PhwHzKjNmXkBI9/YJp2j3YPjfSdbJ/6
X-Received: by 2002:a05:6214:d8c:b0:70d:6df4:1b0f with SMTP id 6a1803df08f44-70d973bae47mr165335726d6.61.1756142037828;
        Mon, 25 Aug 2025 10:13:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdj+FFZ2fiH2yMSwN4KYEuhBhcuKZOiJBSCzLyu+64VlJ0OHTuoJtak8qkNW7VvT0uU7U8+g==
X-Received: by 2002:a05:6214:d8c:b0:70d:6df4:1b0f with SMTP id 6a1803df08f44-70d973bae47mr165335226d6.61.1756142037066;
        Mon, 25 Aug 2025 10:13:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e5d1b1asm17681701fa.50.2025.08.25.10.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:13:56 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:13:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 03/38] drm/msm/dp: break up dp_display_enable into two
 parts
Message-ID: <xwvuajrm76flwhnciclz3bxzj6vmvladm4t73mr2pyrblczi6e@wbyq3x2yabrk>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-3-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-3-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ac99d7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ryBzyUWMAq7bL-B5d80A:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX+ocBhA053w9z
 wRObX7cZXasvAHpz3oscFqnux/QzY8W+24mWIKNttznkMavvYmUmpFIIxrm5fPeMUM9pVoWOoQ9
 T8u3Y0T4LNF1hpwvIieSDeuxQfixO519Z/cpy19iLFzU/QlA1kIRma6xJ/MfLiIMZGA2eZMgsZV
 Chay9Qr+wcXBZsQvDEmuHZYqNHleVdfpQ93uFFi2qBE5ie24bxGAgk2YrELH6kxd/4fdXDSKTBj
 sRoYWdsMCVo6X9WBOdqSVQ2o+VWqxdFbWQNIoqxPgIi4xKbMiZgZq2K+kqZcGtb9VXd8mMCFnoL
 Td58QaQjyEuExz4BIgxvcHZ4Qtzn5KOnPYh1WDTeCZ6BZGBa8m+R9KpOtUcKtAtkpnmtN6G1K/i
 EnZzUG2e
X-Proofpoint-GUID: gEWkdGrk8qa-gM_ZEBkwqAet25MKFqXq
X-Proofpoint-ORIG-GUID: gEWkdGrk8qa-gM_ZEBkwqAet25MKFqXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

On Mon, Aug 25, 2025 at 10:15:49PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> dp_display_enable() currently re-trains the link if needed and then
> enables the pixel clock, programs the controller to start sending the
> pixel stream. Split these two parts into prepare/enable APIs, to support
> MST bridges_enable insert the MST payloads funcs between enable
> stream_clks and program register.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  51 ++++++++++------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   3 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 113 ++++++++++++++++++++++++------------
>  drivers/gpu/drm/msm/dp/dp_display.h |   1 +
>  4 files changed, 113 insertions(+), 55 deletions(-)
> 
>  void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 60094061c1029bc7a06ffaa80d9403b40aa07eb1..2fbf16f27842bb7639efaa2baecac7bdf8908432 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -20,6 +20,7 @@ struct msm_dp {
>  	bool link_ready;
>  	bool audio_enabled;
>  	bool power_on;
> +	bool prepared;

Why do you need this? The msm_dp_display_prepare() function can only be
called from within the atomic_enable() callback, which is not supposed
to fail and which is always called in pairs with the atomic_disable()
callback.

>  	unsigned int connector_type;
>  	bool is_edp;
>  	bool internal_hpd;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

