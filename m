Return-Path: <linux-arm-msm+bounces-70934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CEAB3719C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 19:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5ACD3A7078
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 17:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8FD214A9E;
	Tue, 26 Aug 2025 17:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfKd+GfV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EFE29DB88
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 17:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756230301; cv=none; b=QIxhJ66kAKjtT6zSLcnl6W7IvMdHhWCgLZsUIYGU+38VN8etVN846j3tlAYw/6j9hw07o9IZX+voj3ca31CFaIA2Cqd32uBNezjm/ah0G6aDfOafDEumM1Sn01+aqr9iYrFiO9VSbu4TVOqcoNoCljgRDDGX5a6qdiLdl5muRQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756230301; c=relaxed/simple;
	bh=peeJCLSFmB9Be70U5qh+hzXe+fh//AVaBy3veqanqIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQzUEsf5lJRv9QBVW1M9022cxDOTPBeiEr2HUyeRbXw/F9pvZ1NdSD2Y+O+aePz12s2hk5L4dxprokVE17LPp32+4Dskyur1kax2OoERKUa8cIT+5u4QXsRwTGLu8eT88onjt4cSVWQM1gSXAONJsyfAbFPYGoAhVTItoa+apgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfKd+GfV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QDRSdR008235
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 17:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Fo1/9Ip6/4Cnz50sym4R0+zd
	sohgsrtps0QIg0lGkcM=; b=SfKd+GfVGy8xCvuGCGOvIj5jNVwjV4HE7/RKfpyy
	V0BQCWKndvp1G/yRrXqPDmnB+T7L2ulJyIajRk7Yubf3pD8RLLLFuMschKiNMo9X
	+oUkU9fPk2y+oOxhzbJoiXdadeS0kuOppSq51pT/IcJHDJwVapwSwJlTGDMdWwGU
	Wdho7eX2MfubXdAJHcYcSQILGGnoDtpvEU1SE4n8+RV33oOaAgmstJGRNRoZGeOg
	X9UyB+7pbha40sDq2IwR0kSg/qwP1oDvHeJXROmhvMrck+aAUL78RVbCAmNQ2HR1
	U2FlXdz0WGfpw00kVOLjhSPT4gzbAIXaauzZh0dAeAmxCA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unsr4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 17:44:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70d93f57c42so86093006d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 10:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756230298; x=1756835098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fo1/9Ip6/4Cnz50sym4R0+zdsohgsrtps0QIg0lGkcM=;
        b=wPhc2XNLsoDEwDrs5pj78jMizV0rlMKivkmjKIi2WLOUv+SJP/dQPGeorUCcCa9dXF
         vDtyQmxsqHWRpgrypOXGN38EuvPS/FbXX6kHM8AuvWJQJmwpva7Y1anFhR4obAvq8Udd
         DQ0LjuGEgdYTRW54L71TAYj5glFgMZx/3HY5y9crbpzcwCaDGw7rwMmRtoJXbw6BDp2L
         SNbM8ruZpgTyBEqxDGTp+cMQU18N7nQbqibFqudo4EWmuv+kpir/8EpaZgcXLqi0VYIm
         8QM5krw8pHUO6BN9Hgc6YrR2jAwbuok/mUPNQqoe3WjgkcdV3qxKuNud5etWbFCH3k56
         DFnA==
X-Forwarded-Encrypted: i=1; AJvYcCXLNTSlumDtgNArRm2tzQXfEONqRfACJgW2+EiHionXdyjILND6ylOqX9O3j+5PKQyPOHDviL9a6IicVXyK@vger.kernel.org
X-Gm-Message-State: AOJu0YzeVlyD3JGPVkmK8hDgmBAJO+oTmFWYkmhrByH9oR2XzEP6lenc
	bvzYIjo5PrcuCmLH946zz2Cysnlrs3sxavsdy4CHwx2Tn3TcYFhv5nWG7fObSuXXINbIeSRqEAn
	Ot3HnSQgJgpyyunLScpYgv3BBMCFCixaC7sonljzyNcVR1a7Z2fjI9NgdjQfrwr8l8QPU
X-Gm-Gg: ASbGncvRBFjGv0s300isPAmTGC6zt3OOHvggSmLiBWsIsh3DE4Gf7/beyhrwyMLnlq4
	aQ7/oGhedPDBgTmFe5fA2vzbs6gyv03MUUk0DlR13CaVAZGuIUUOE3OULzs/khh0D3mVgNaXyfD
	gZmX7/whBNZNisfx6zPEqtoPv3vPdP93KDKhRZjJOdfPjixs5VfpNUQDVE75WNRfaJbLVDpZPvZ
	Mge0hP3dv2K7fl7XpzPIPMraKQciBsga/IVXxPs5qIyKYRmZGhR/uAqAnTKOFdnMUDsZpgrDsrm
	wR+2iTvo8sskRarI/F6Fu3J+/xtE1ucLoUg8oaHxfMo+WMsFvdesZ3J30+A8GgD9L066/IwsqnS
	Fc6LZRHTAVTNy6rVT+85uOzbtT2bidPsQpkYm9O6NQnYHeqn896J/
X-Received: by 2002:a05:6214:5283:b0:70d:ae3c:b712 with SMTP id 6a1803df08f44-70dae3cba60mr119353666d6.26.1756230298148;
        Tue, 26 Aug 2025 10:44:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqr7erg1723NCR76J53tDrWLPj6Q4rsJqNLBT87HEUC8VXg2JCngL3ZutGor5JaNkJQe0UUw==
X-Received: by 2002:a05:6214:5283:b0:70d:ae3c:b712 with SMTP id 6a1803df08f44-70dae3cba60mr119353156d6.26.1756230297529;
        Tue, 26 Aug 2025 10:44:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f3f260c7asm1945645e87.126.2025.08.26.10.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 10:44:56 -0700 (PDT)
Date: Tue, 26 Aug 2025 20:44:54 +0300
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 29/38] drm/msm/dp: add MST atomic check to
 msm_atomic_check()
Message-ID: <lp7yv6w2ofbohmhfusroetk6dy4hbcegdfuuzo2bywmngccefd@q5ssvwe545g6>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-29-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-29-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-GUID: RuSOdSMUJYJryrxnBba_bK8oDO5njh-Q
X-Proofpoint-ORIG-GUID: RuSOdSMUJYJryrxnBba_bK8oDO5njh-Q
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68adf29b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=AVsrb5vlp7rL4eKdMZ8A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX8AX6UMjwJdaH
 iZtm7oMrGT4vV2rF+QzwEZnTFylnmmKZ0TiH1S3UGoKL4u6XVes972OwSPQ64okQIQOfOfKGX6w
 3UV1tCCG9QIwd3zJBNvFXvpLZpezo6WTkJ6+isTwt6oySwMvgavNAu4d1hjuhAd47e8cdd4IFbC
 kSXoqGFNKLBM2hHWpZNlSjl3H9bIVMt6vXfgby2qFoGf2nSuTQxf511Emg4oCG3mwDnYL5VjlKD
 NNXiL9gUyPkNt8Q6FfAJVeD7oV7nmy6yzRQP1oZlidkCk5WkGLoKzsTE2biddqhF9qi05sKPrtE
 IxEP76HYEjvSge493r1Nk1wVygEFrHB48BqNalLJd9i6XyurNC6C/nWLquNVVJrG+L4YQzF+odh
 /U0Y8Dyd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031

On Mon, Aug 25, 2025 at 10:16:15PM +0800, Yongxing Mou wrote:
> Add a call to drm_dp_mst_atomic_check() within msm_atomic_check() to ensure
> proper validation of atomic state changes related to DisplayPort
> Multi-Stream Transport (MST).
> 
> This complements the existing drm_atomic_helper_check() and allows the MST
> framework to perform its own consistency checks during atomic updates,
> such as validating connector states and topology changes.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

