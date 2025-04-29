Return-Path: <linux-arm-msm+bounces-56131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14895AA0CFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 15:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD0643AAE68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 13:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1EE1E231E;
	Tue, 29 Apr 2025 13:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoMznvEv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2E246B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 13:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932082; cv=none; b=XUgnCaYfcmMVqLFOa+V9F/dNgmllFcqWbx4FQlTux29NnpZRiDfHMvz9wNi6B3xdKG7dgI58iZm523ODNkuAAs0Hk7xZpzMgXrNoSJ2+SK4RylF6qxzotDFG/9sfU2HcYcqso99706JqQHILk1fPcH1oRqg4Cse6/gWPEbPqu5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932082; c=relaxed/simple;
	bh=ZOohWAutHYyLaTiVQ57fjkzaDbOE5XJKpPbXcT/tm5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJ7pAkLS/sAKp8fuPAsGhcH+Ohbo033ecVZAeQuKHJlvLZsRFm4bhx2G47Y4WvYCplE2uUCqWxxtdusm7EVgQwTB5DVdhakpaSGJHsYnL5LzWNrjrc3xOpeRTFPwBqDvwWDOTzktOH32s8fGyXwOTWbbyFQKwphgcE87mKD8V4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IoMznvEv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TATixX031124
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 13:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3iycI3ZTNsOLa0MGqAVtc71f
	WejZqL8jSxO6Snm5fiY=; b=IoMznvEvvdlStb0Rbk11LLtBu7NMG2nowZ2iwo4B
	fSEf08qftmKZKeH+PHWsH34CVZjWvTGK7iytfGpnB984TB2Kukc1An41CckNTid3
	Jzg2sneWcJCzRuujj+2RNmczljMozW0lvIn9wweC9lytef2jsgUp6UfNSaaiEOux
	60pQeVIFuygGzFVuXwMy+eKzeKmTRy1vHWD+NEXKfxsuy/go2sFHit33kqG8l2bf
	tOaLec4r3VhhVNDl8aGRO2JYpKF6K9YfgGPUq4PbAwOccwrejy40BnFLnnezIE7Y
	1g8ZnCuy0Qu89+QTHu+pMU5XvEHn/GkfQOGkDKk6+0Vzyg==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevkrbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 13:07:59 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d43d333855so50591405ab.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 06:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745932079; x=1746536879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3iycI3ZTNsOLa0MGqAVtc71fWejZqL8jSxO6Snm5fiY=;
        b=lxbUR0dsJfwVpGD5Cey46UEX2RAzmcD8CdbkuU1BpPqJ1X+Ufp90eYCy+sRhdTtTyz
         LHznsi3tpkxT6Vms++ClsU6gB+eIWoQe2s+xvfYTR2xFjsqUeQaTyVhfVlR3z0n8pGvM
         JBu03xJdbD+xePZPWr5QPDx/iMdePXLtsJvzLxLV8q7Zd8KEX4Js0jP1sQZZEHcG7tce
         IRJMMxNXYHywImiUtRGAuTDPFzCfOn5oWcBfzZ6Qtm02RRsAZ0gUscngeSvfn0+6sh0n
         CYAGF+7aJMZNjDri7K01WnHjG1avsBBKKvC8h5+cZCMM8Cgbl+aRcIHcBS8QuxXEJgYP
         Nuig==
X-Forwarded-Encrypted: i=1; AJvYcCW+u6IkgRk3h9/aWSgMoYpYybHELquwURibEc4NH2G7949pBodVjSkol8oynv7/PTcEyl3ZviezvK77NwYx@vger.kernel.org
X-Gm-Message-State: AOJu0YyHThwdFTcSQbUfXqbQhfuz+w/sL71gLQBGGiiWaKYVfcK7wxaA
	T55AEKo6XQzluT+2nP7ZuOZufHKW4WLR2mxge4fEbeDBAdw7ZSTzd0NhJJs5S+9oF9JYKK/AcUN
	pg+1r18Exx9Rhgdx4kQcen4JDfhcjxqz8y09m0bQBE/NWuo7tDdWEXwfD+ubYgQkN
X-Gm-Gg: ASbGnct2+qp4fd8E9bfJsviSqIru9N6mVf48W5UltM+oaC+aLZzJkC/YkHan2fuHUhy
	PAg2Z2WBDSPx9MssDGuyaA/0St/K+JIOaF+liX/irXZJ+/vonjbHqvbM9DDcq5k7hRqq+YxK519
	hL/ah8vIm0FdJabR1zopunxIMqsWQ3ZZAbI5p6chts5KY/dKkWICZPwR8+7op380KIZN/ncOm21
	TW+jMkDxn1W3Ul8GgtbIW4DHdr7NIaR4PYU/L9kIpQ6s9ZxAyhxWLUk9v+iVw9DOnZKpQvuXiKV
	CM5iHrxdf2WhXK+6KiC6nsU5an3/l6TbxHxK59teZhB6/W+tmb91gqeXwYh8Yo0vJOBXtTaTWs0
	=
X-Received: by 2002:a05:6e02:3d84:b0:3d3:db70:b585 with SMTP id e9e14a558f8ab-3d95e037fb5mr29829365ab.21.1745932078935;
        Tue, 29 Apr 2025 06:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxYKe64KrJHOVGDGU//vPn33RLxakuwv3sE5bOFok85OIRMr67JhLX/wsIASignHrLnq4UpQ==
X-Received: by 2002:a05:6e02:3d84:b0:3d3:db70:b585 with SMTP id e9e14a558f8ab-3d95e037fb5mr29828975ab.21.1745932078596;
        Tue, 29 Apr 2025 06:07:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca7fbbsm1878954e87.159.2025.04.29.06.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 06:07:56 -0700 (PDT)
Date: Tue, 29 Apr 2025 16:07:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        laurentiu.tudor1@dell.com
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <gcy2ka6d57pcyymaqeilwuo224jydudxvfwd47d2ufkoycjydz@7lf2bjbz7kl4>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com>
 <aA+N8YHX0DZ6h9Uj@linaro.org>
 <aBB-gl150GVaZPn5@hovoldconsulting.com>
 <aBCE3wSG2g5pp7jg@linaro.org>
 <aBCH4oo7dbG8ajvP@hovoldconsulting.com>
 <CAMcHhXrDEVrM4fEyMwZ9TDgqgY=s_mTcKZMacCoUuZ2fa8FhWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXrDEVrM4fEyMwZ9TDgqgY=s_mTcKZMacCoUuZ2fa8FhWg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: wD0_mR-oWuvjSUw7pLKKzxAq3L1rfYWi
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=6810cf30 cx=c_pps a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=x2CRZeuriRqWQSmQ5gwA:9 a=CjuIK1q_8ugA:10 a=Ti5FldxQo0BAkOmdeC3H:22
X-Proofpoint-GUID: wD0_mR-oWuvjSUw7pLKKzxAq3L1rfYWi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5OCBTYWx0ZWRfXzfPNbXjt8icj gZLI02Z143Wd4y9XCdO3aqKeu+pj+IVh2XjnaNbSYY9hhNzGjWCif0Qn4668aOrD/cwfVGL7z5Q 9nlUKNkA4Sqj/Wf9uBCIeku2h8dYk5plITl3CFZD0qAL5XGiC8e9cYpdZnXJwAqJyEhbJO8EzE4
 RB7PXe7wYxn1cRrF7nYSrGY63l2ve8eli4i6I/jCFjYGRiVcmssNzbiB2Pgvc1fxZmhJ8TljzZ4 CsPrycsV6Rhxvu8eXwFFS3c6rJKl7HdZYZ+DZK6KphBUE8SOmnMI7F6CZK9JviUk3W5VbF2O//D gjHC5WPS7wSIEIShWJGpP+8FGtQ9MD+Wybft5z6c04bjN6qgWwOEdflw0QobeA9wa/JJgfNZ+rY
 ln1B8WOVWa8a017XSon+kfM4tOqYZ2AOC4tL/wJnECfTsii0KB8YGmQ/g94TqIf6yqcY6+vY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=634 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290098

On Tue, Apr 29, 2025 at 12:57:16PM +0200, Aleksandrs Vinarskis wrote:
> On Tue, 29 Apr 2025 at 10:03, Johan Hovold <johan@kernel.org> wrote:
> >
> > On Tue, Apr 29, 2025 at 10:50:55AM +0300, Abel Vesa wrote:
> > > On 25-04-29 09:23:46, Johan Hovold wrote:
> > > > On Mon, Apr 28, 2025 at 05:17:21PM +0300, Abel Vesa wrote:
> > > > > On 25-04-28 14:47:04, Johan Hovold wrote:
> > > > > > On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> > > > > > > On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
> >
> > > > > > > > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > > > > > > > adapters or docks with retimers in transparent mode?
> >
> > > > Ok, but my concern is if they may have worked in a default transparent
> > > > mode.
> > >
> > > But if they are by default in transparent mode, doing the setup to
> > > transparent mode will not break it in any way.
> >
> > It looks like it will, see below.
> >
> > > > > X13s doesn't have LTTPRs on-board so when reading the caps, LTTPRs count
> > > > > would return 0 and none of the of the transparent/non-transparent setup
> > > > > would happen.
> > > >
> > > > But this is the crux; does any off-board LTTPRs in transparent mode add
> > > > to the count or not? If they don't, how would you ever learn that there
> > > > are any LTTPRs? If they do, it seems we may have a problem here.
> > >
> > > Count gets increased either way. It doesn't matter if they are in
> > > transparent mode or not.
> >
> > Thanks for confirming. So then it seems we do have a problem as since
> > 6.15-rc1 drm_dp_lttpr_init() will switch all LTTPRs to non-transparent
> > mode.
> 
> In this case, let me add Fixes to the entire series. Do you think we
> could land it in 6.15-rcX then? The second option proposed to roll
> back current LTTPR support and wait until 6.16 will completely break
> DP output on all X1E, so it's very undesirable.

It should be possible, if you rebase onto 6.15-rc, add Fixes tags and
send it quickly enough.

> This series was tested quite a bit on at least the X1E/X1P devices,
> both with and without docking stations, as it is also (v2 iirc) part
> of Ubuntu's concept tree since little over a month ago. You have
> confirmed that x13s also works with this change but without a docking
> station. If someone could confirm that x13s with this change does work
> with a docking station as well, it would be safe to merge the entire
> series as fix to 6.15, correct? I could reach out on #aarch64-laptops,
> perhaps someone has both x13s (or another qcom-based non X1(E) device)
> and a docking station.
> 
> Thanks,
> Alex
> 
> >
> > Johan

-- 
With best wishes
Dmitry

