Return-Path: <linux-arm-msm+bounces-66364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A0DB0FC52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 23:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C271562908
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 21:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF8027056A;
	Wed, 23 Jul 2025 21:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nqs/YFDx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397352586CE
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 21:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753307588; cv=none; b=Jabp653VeufE44SSgmHjzxF7eO7j0Ke7au8Y2isVNddwPi3qky09mFF0W98oEMnHDGqzFc+EEF+1LWKZy1rhECSxzYwPqTXy+32cSobnGMzdJWuXH/xfSXy1nntWSoyytqkv4Cyct9aEiAe8gZUFd+jG3bv7zn+dkt4WOSHsGSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753307588; c=relaxed/simple;
	bh=JxV+DxloFt94Ixe9PiwGI+roaXWCqRL4mU67C7TAiOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAInzk4lQGch5cliqylMhGELfejpvkNlkaqF3dvddw5Lbv6IRaxozgRw2wJmZHbOLzR6IbNlmh4w4cuFip/+1nsjgHQQGW0MwcVEafbXUh77R5mDIqbQsC4J7cku5A3GIssOgYi8SUbWDLkOgVPgOcVIrFcCn4lJ1ZWgxh1Mwo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nqs/YFDx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NH9ExT020004
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 21:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v72jQE2tLfM4yFjj0GK92SGI
	mdakpqBvLjrNZl77Tu0=; b=nqs/YFDxNBje1ApXmMFgBluOnK0kQE83xMukvMLQ
	i5CRsGZKizemqdixV0lmFlKl5b3w3B5l1SrJYLFW/jVqCt9o1VU7M4mUiAeyfEC7
	K8QM5hZKN9kyddwv86Q6wbuCfxsseiACZ0Ile1h2Os9Y7Vd8OgJz0ygz7jD5iolA
	bx5IHN/LLYJDycrCSLY5nNgMuaBzPkSrfIqBsTWNUHl463L5KUrP9+IEhsYaDmem
	ZyZBBBrvk/ObQ0ad9UUVWNpimk/dEtrWEiUO8sB8nQH5FySp+VsV7JlM/yoGy37p
	ddLZtQn+iiwkhpvXXgi135LL4/gD4rqobc4psxEF8MQzDA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3esepd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 21:53:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-706f10c50ddso5701006d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 14:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753307585; x=1753912385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v72jQE2tLfM4yFjj0GK92SGImdakpqBvLjrNZl77Tu0=;
        b=VRIYCzY6yYp5TcO8RHHJhLAu6ZC28VmDin6eafbI1nq5odzUuOVIF2HPhOtGQDmF1I
         EwDtH8bLJkKm3yk36WabXNtpU8IxJdEtfg4wQO2YhxJ6fWcWteJRDYm9yl96pZUVnwRF
         MKd6aOv09RndVBGiiadlvMFHiXRU2zwODhjlSpbFxX6VjJn/cDMvvSOjKXITHjq25Hgk
         4ZfchCBStGVmGbkkXiNNRjHjOlPA+8qqwhMV0hMmconru/oc/uT7AljxEfKiiBqaFS35
         9ihNoPhJmmvlgmrrWZjq6bdQseGgvxIQhNuA6Yky7zSWVEfza5TdI+8est6cRn85J1Nx
         RaAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWifctzCmC9x2v8RbliACWWWauIM4sBFHzXCwA551b/5K+OlyeecbRuUt0eV53YW557gl+W3ipIZCuL5HK@vger.kernel.org
X-Gm-Message-State: AOJu0YzeA7e9XISRJ05XOm270j9ZG4oaYP8XGCJGzbj+KciHnpNA5E6a
	3gtI4Rzh1suduvOgURhku8vrY50+lUDqpqexFMof/skjLexBWDb98rEuNYt4UAj5pCKvJad/I9H
	YYZT9Nc7OL04lrb9RAlo/FDg9PRY/wN9la7vb2rDUcZKWlSQGEfWyGmwxz9JDNOmDGwIsP28Rn/
	nL
X-Gm-Gg: ASbGncvr3eBHiKQ+P7rAysdeiSUuhX6j+6hUL0cW5ALAD5vgrq7hgXAZhSsr/jAE/dQ
	GhxT63avxk5gzo0o96V+fMMApVzKb05OodbC9jxcrpfnWnW5/pMWruTpeI/+w7oYeDyIidlxzQK
	z7keYVIrcaxgRHHCJlvZsdvE/P8dI+Qb3EBoNvJErbJMiKvXZgOzlj+9JYHL1wtaIW7NRBiFb9L
	O41/u3ITNskdQ/SGOq8o1mqRpgeY9h20KaglXmgEiOJyjnT7AWFKS4D5xbwupidjMa9BHQAGnOg
	r9d8iw8m1/QiWM2LZ6Frl5RGQcJ7nJTYJ9EYzv1aU6GOV0haCeuxFd1pxk4plAG9UoXsS7qxyu8
	3HnEq1lAlVAuZC+f6NNdDVAIpThH2JIhJlFeBBvWC0dLkKolSd59e
X-Received: by 2002:a05:6214:c65:b0:704:f953:eb60 with SMTP id 6a1803df08f44-707007987c9mr54947836d6.47.1753307584342;
        Wed, 23 Jul 2025 14:53:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLtHVDKzBN5wiY19PRElCtVoKBtRxEOU+M0J8TZMQP/DquUGxds3clV1zM02s/3MTy6pOoIQ==
X-Received: by 2002:a05:6214:c65:b0:704:f953:eb60 with SMTP id 6a1803df08f44-707007987c9mr54947606d6.47.1753307583818;
        Wed, 23 Jul 2025 14:53:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53c84badsm33283e87.145.2025.07.23.14.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 14:53:01 -0700 (PDT)
Date: Thu, 24 Jul 2025 00:53:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/17] drm/msm/a6xx: Set Keep-alive votes to block IFPC
Message-ID: <s7ck5taxbozy3dxtav2huxh5d4ietfmqsv4mliajelu2gy4eqo@6xmp73eamqm7>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-8-9347aa5bcbd6@oss.qualcomm.com>
 <jvn44gmttkidyy4emnz6mytqqjbwltlxibywfr6bfbqjfbq35e@fuvvefesqbzw>
 <0427769f-62a1-4a20-af94-b340413296ab@oss.qualcomm.com>
 <644a81ff-bbce-4cc7-a364-8e0c591898b3@oss.qualcomm.com>
 <9322badb-9f94-4bd1-9e3f-447a9134cd7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9322badb-9f94-4bd1-9e3f-447a9134cd7d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Rpu23trfnlHLRjxq3EILa_V9-HJg0NTA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE4NyBTYWx0ZWRfX/7r8Id8IQB9O
 zollHzlgiFQA+DnUVKJF7abi3tql6Q9TMxUOEK/mcHQ7KXNLHybM5WsrhUVEWY/62+ODtaYWUgC
 9LaEsmq2O1dGw+r6INR5Qj9ECKdBtCeVzjYbLSkJXIElQy3YOxbxJngdNHe5WixazhPE0X0TqLP
 i7SrNwxBTG5POl0EtH7fpLGDEoYt2ZiYeH/p8gKIAqr0D6LJL3Ifv+fa4i2za4m9ehgeTFuwKsW
 e/QV3SgeggqfXtzaHSlc5ux3h0sOtT0aRN7pRtrx0TtKFKoxAn54MYS3GZSYNF5Rk7scgyY6I9Y
 aXrGabKVuGsYi5EzvzrwouaP3+JQLILQv8RX6HDmXWmL6cYC8OQ8ScgGafjVRLb970T3Znf0hLI
 YvULZprfeqmGk4EsQRMARZ6NMGvT9+YIP8XGmWkw1kjHqMMxz6B71xLtsYjqFrQNZqzFHLWM
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=688159c2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=4BsFJF9TogBGrZafdScA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: Rpu23trfnlHLRjxq3EILa_V9-HJg0NTA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=849 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230187

On Thu, Jul 24, 2025 at 02:52:52AM +0530, Akhil P Oommen wrote:
> On 7/23/2025 3:35 PM, Konrad Dybcio wrote:
> > On 7/22/25 11:24 PM, Akhil P Oommen wrote:
> >> On 7/22/2025 7:14 PM, Dmitry Baryshkov wrote:
> >>> On Sun, Jul 20, 2025 at 05:46:09PM +0530, Akhil P Oommen wrote:
> >>>> Set Keepalive votes at appropriate places to block IFPC power collapse
> >>>> until we access all the required registers. This is required during gpu
> >>>> IRQ handling and also during preemption.
> >>>>
> >>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>> ---
> > 
> > [...]
> > 
> >>>> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
> >>>
> >>> a6xx_set_keepalive_vote()
> >>
> >> static fn! Why do we need prefix here?
> > 
> > It's good practice to namespace-prefix your functions, so that you
> > can more easily find them, e.g. in a backtrace.
> 
> It would be obvious from the parent functions in the backtrace, right?

Think about jumping to a tag, etc.

> 
> A bit subjective! I feel that the prefixes are unnecessary for small
> local helper fns. Prefix for *every* single routine in a source file
> makes the code look a little bit bloated.
> 
> -Akhil.
> 
> > 
> > For a prefix, adreno_gmu_ would be even better, as the register doesn't
> > seem to have changed across generations
> > 
> > Konrad
> 

-- 
With best wishes
Dmitry

