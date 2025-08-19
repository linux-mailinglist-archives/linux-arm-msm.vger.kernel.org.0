Return-Path: <linux-arm-msm+bounces-69731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F98B2BF60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 12:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2B6B16785C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 10:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8804322DAA;
	Tue, 19 Aug 2025 10:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfBeKcWh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409D0322C87
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755600748; cv=none; b=K+Il3fD7S/MBye/CmwQxPbAPOcM9DY6gzEhEN6zE1zrecnJeQSL6HXmsYULMv9tEOL/Fc2hn7N7CJN+LBwcJI7COwi/x1ZNWNoZVvmxN9d2g4olEpPdKvpUBtjkZ7Vdo0foZ8C7NcQZH1t1r1V2EGwzE9fqQQL9TMAhKrzlEF/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755600748; c=relaxed/simple;
	bh=JHp6Cjl/6HkRQPs/3MG0GDjGm2xUk8pgEnaUJplYzSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FN3dakHY3h9JMvBDuwYqOt5EWMtYeucChyuJIn8Mm5GOoe/rBNoK6SKY/hjtYDhdch+qdkFc6GySaKiWuCwlJ2sPWHJ17FEmpR6R5KuRqlmReiDDAUnuGFlgyHY45jLmfOXTicZoxgMFOsahjREuig5YHqJsL3W0c08y413pGQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfBeKcWh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90XeG008283
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=meTAWZ002tWP1iMId64JmPQL
	fiMSJlabjueQPGjB4T4=; b=TfBeKcWhD2yRfIk38oz9ShgSEu1KkrMFo1TbZK8+
	zgcGSxVDJTFS5BKffpapOoDeFHTUrQn3QeIuyPm4xd7LH3pxWwnE4c0DwmOcp3eO
	vJV+FOL0/cgD1JOQ2PI4EkgCnx7B8aoOhn88Zo7h5TKF6aBgNCxsJNz2E0bEYODL
	NjkwBpphEmNcmPx1idl4Mmhr81AlIjUsOXngpf0/Xm0fXX2s3kulQXrNqXIoWj3h
	uIZQAJulvydpDFQP0AmfH0ufIvxZAFqsFDa0xIgEksTxsckAi0D4wgzWhaGkCHTG
	78MITdhl/YcS5obifMi5za4UcYdXcC8Y0Ec4ToxUxDyO4g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99r644-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:52:26 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a927f4090so118176746d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 03:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755600745; x=1756205545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=meTAWZ002tWP1iMId64JmPQLfiMSJlabjueQPGjB4T4=;
        b=HThzZmE+CSklrLri4n2h7O3Rq9+Qd95Mf9HN9HuYRAKoidwSGV5Ask4bAxnh4oR7/z
         6I/NU462yJR1oI60pQg5J3YvsKpT3FfE5Ct90Qnp24hq1rrxpmBJRwq0FYRapkN7u92t
         i0+Syys7FpDMoimckzCPWtHS+elo3VeLFcAv2Q0qqdRI2KaLl+ZgIEd2NmcBFmrARqzj
         q3HKUntO6D2Aq474jTL0wNYQyd3c+pUVKnD7tlKmR7pDshfbRinG/XSVdbS17pJCpDP4
         onqoeZQZj1snJkoZCaSXIGrbozVjmLeDCWS1ipXDJiF2cIYQWhdXsrC8jZBS+8gW6M2r
         rRbg==
X-Forwarded-Encrypted: i=1; AJvYcCWwMzX+gEtse/tRUvBPph2slUmzgO54qOCip2yjWBZpXaH3gHSkTpBFdnAl86LzDjZQvGa8Ph7krNkl69/t@vger.kernel.org
X-Gm-Message-State: AOJu0YyM5MqDfIjFeWdqDRkTAd5G3FoSWv0kD7MS7n918YVe/039w7x+
	xtHmmdtCq2UG1bpSZ9Gm5WbRN9WGJAEhoQCjVr/rMJRC8nmV5Q+A8++YBDG6jsZQVJb1iGYG0yr
	gjgO66o0jD0F8S0Rt9Xd48F88bvTU8xhO06FCa0aQxy0PHw5+JsLqQ/t5/tO2reDiQ44r
X-Gm-Gg: ASbGnct/IOUNZyXJ/brnNpavApM1RUg41JwzFUdu8TLGeceunjQ66Qd9FiZnR6aZqnu
	t1kS0dXdP8sXQnkc+E0tScBo62BZ7+38iMPv7E41pMFLr220RkgdlARacNELcH3FJX6sWYzqQDf
	K7xfnnH//gaQEctA2PoqFdcnm6A43m6zEMNwD2P/R/xsxOpRu5kmfKNjt3LQX/cF40L/FeJhrRq
	VZh7CMZ7bcmLnreslccM1nCxSYz0VvQ2O5wnMk+gucFt4/TaO/zEJRedRaHK4hWCCrMxdK816Rt
	Wql329QSgy3NRthiBF7SOcZRGsgKItwyNRJQD41XExzPQ0EU8ZDlztx87TgEtPFvt8KX4ik10aL
	iCIu0ELs5x3wgMzxYYTKxvaT+L4T//XFd0zdBBBSQ9x/rJvkXHXgT
X-Received: by 2002:a05:6214:2526:b0:707:a430:e01b with SMTP id 6a1803df08f44-70c2b6db728mr18561306d6.3.1755600744672;
        Tue, 19 Aug 2025 03:52:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWTcLFhjUM0I8L2qtkE5KEq6YT6QkQ/QixKqZj3wqbRnQCQfoRKDE05BN8SvkpHUbQsGPT0w==
X-Received: by 2002:a05:6214:2526:b0:707:a430:e01b with SMTP id 6a1803df08f44-70c2b6db728mr18561056d6.3.1755600744021;
        Tue, 19 Aug 2025 03:52:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35fb15sm2032674e87.52.2025.08.19.03.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:52:23 -0700 (PDT)
Date: Tue, 19 Aug 2025 13:52:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, Michael Walle <mwalle@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] driver core: platform: / drm/msm: dp: Delay applying
 clock defaults
Message-ID: <veuco4na2bnisn7qoi7fhdf553alr6omdzdrtnz5p2x4ywtmzh@2smifabnvnbd>
References: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
 <flybqtcacqa3mtvav4ba7qcqtn6b7ocziweydeuo4v2iosqdqe@4oj7z4ps7d2c>
 <aJ3Y1XhvTPB7J6az@linaro.org>
 <ddp77rvwe6brwyvkzbkouguigd5tjg2qqfxomlhd2hb2x7w7uf@2uyl2q47bpei>
 <aKL1NPuZWWxsAavx@linaro.org>
 <2hzzc3fd52kb54s2pr6fxfnd4svi7x3zt7dyvenja3suhieidb@hrlggbqocqa7>
 <aKRUvCVpz8y47TPs@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKRUvCVpz8y47TPs@linaro.org>
X-Proofpoint-ORIG-GUID: GBXPox63t1FaJDSBR6JVSdz8KQqKyRLT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfX5BayGT8VKGiS
 4cIcqaiKMcltoylW/t/hvtQtjhc1HEz+JghO91HN2aa0woUsUKXkxkLfv/dyjKPh7xrGJH7z35C
 5EAo5LezWqVUoPYNEq+FCDu99YJVXIE+e65fTYb2MYFLFns1kJrZYBAZfk8EjjLIgtO5LJLcChw
 +zcXNJ4d6qENAyOE8UyzB9omqaqO/hxda14z8NIKcQ3EjVlfRdCsPbEWbox+QQv6vGIcOh7sqRj
 ihGm2+jwEDVWp1rbb8I16PEd31tM2C1xLeDvyVKl3Xpq5Bw87Ha/EjsAigyh4B86cW3ulAXRnsp
 t4NBHg3E+jbX3gOlsztcabjE1DtmtXXMLpp9z9qiVgW/inNpjMnVZPVKrXb/AMu3W32qjgLYjmx
 0+roDse8
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a4576a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=aFVlKXMpKZbDbpKwxIQA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: GBXPox63t1FaJDSBR6JVSdz8KQqKyRLT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045

On Tue, Aug 19, 2025 at 12:41:00PM +0200, Stephan Gerhold wrote:
> On Tue, Aug 19, 2025 at 04:19:26AM +0300, Dmitry Baryshkov wrote:
> > On Mon, Aug 18, 2025 at 11:41:16AM +0200, Stephan Gerhold wrote:
> > > On Sat, Aug 16, 2025 at 04:55:00PM +0300, Dmitry Baryshkov wrote:
> > > > On Thu, Aug 14, 2025 at 02:38:45PM +0200, Stephan Gerhold wrote:
> > > > > On Thu, Aug 14, 2025 at 02:55:44PM +0300, Dmitry Baryshkov wrote:
> > > > > > On Thu, Aug 14, 2025 at 11:18:05AM +0200, Stephan Gerhold wrote:
> > > > > With my changes in this series the clock state is always consistent with
> > > > > the state returned by the clk APIs. We just delay the call to
> > > > > clk_set_parent() until we know that it can succeed.
> > > > 
> > > > I know. But what happens when we power down the PHY? The clock is
> > > > assumed to have the PHY clock as a parent, but it's supposedly not
> > > > clocking.
> > > > 
> > > 
> > > I don't think this is a big problem in practice, given that these clocks
> > > are only consumed by a single driver that manages both PHY and clocks
> > > anyway. The clock should always get disabled before the PHY is powered
> > > down.
> > > 
> > > > Another option would be to introduce a safe config for the PHYs and make
> > > > sure that the PHY is brought up every time we need it to be up (e.g. via
> > > > pm_runtime).
> > > 
> > > I considered that as well, but what exactly would I use as "safe"
> > > configuration? There are lots of PHY configuration registers that are
> > > set based on the rate or other parameters of the panel/display
> > > connected.
> > > 
> > > Implementing something like clk_rcg2_shared_ops could presumably work,
> > > with the limitation that it will only work if the clock is really off
> > > during boot and not already running from XO. Otherwise, I think the
> > > simple approach of delaying the clk_set_parent() implemented in this
> > > series is still the most straightforward way to solve this issue.
> > 
> > I know that it works, but it feels a bit clumsy to me.
> > 
> 
> I realize that adding a field to the platform_driver struct feels a bit
> weird, but I think in general requiring more control about when exactly
> assigned-clock-parents/rates are applied is a valid use case. The reason
> we haven't seen more of these issues is likely mainly because people
> just avoid using assigned-clock-parents/rates in these use cases, even
> if it would be the right way to describe the hardware.
> 
> I'm happy to try implementing the workaround in the Qualcomm clock
> drivers, but hearing more opinions about the more general approach of
> this patch series would also be good.

I completely agree here.

-- 
With best wishes
Dmitry

