Return-Path: <linux-arm-msm+bounces-81777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 660A4C5B44E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 05:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1147A3B7260
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A4127BF93;
	Fri, 14 Nov 2025 04:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mSi4Yuw3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z9DbqoPK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2233F279DC0
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 04:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763093437; cv=none; b=EAfvdais6ye7PiHQmr34Gsm0Zw19aOXBHhYbUfKwCJ3KSnK/X9BTRnEerNyxcfvpL9s9PCo6xo3g9u77rj8KoSWofOG6/JPb/TOUcYMRtN19k0ly3tvrTBoACwlzk3DdUSLH2idCBCNQq67K8yE0Whr8xEPLk1sk+ZqEd+ZwvfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763093437; c=relaxed/simple;
	bh=YU1imKGYyWlh3cHl7uG2TgDwxPzQcCM1uRDtQaw1Zqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eg103Wyjp81dYZi5tCTdrbJS70BlWntaacYTg1ripMKGED9lR8mJYHFWShgSqqjLJ+iVw2/k8Oc60xtBqCAzC1H6ysa/Fit0v64ZEpDyWc/vYmgHcFE/hsKSL5K0QrYljnRjCmR22CsfBK2GIBT34xt8gBj6iteWQY8gpXqWau0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mSi4Yuw3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9DbqoPK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMavmw1745467
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 04:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=crP9H9A4OcxAdHeYBDCioqy1
	FA03fE0Brnx4WcqsdO8=; b=mSi4Yuw3Zykfknp8ri+j5F8O/r3CUUMYtJehaVrZ
	s9UZm8BvQtKUNoDJGqI7M2xBBb8P4yUkf13VHfyHHtGOltqpoOg1ZIR3IvIcbhBk
	IW39H3CSBnlLqKQbNgf3gP2bgcCsnzXdbhs9inJCIn/3UgXSIzVJ4MvIfwj9OzMF
	+FzwF8WsWiP5XDktwsu3xvUPsgbbpT3qz7UfPWT2tX9iUVNO00EqpCz19RrGoxxo
	TZz9mMCr0Jh3aUz3rr3PX++Nlfn4LqMOAjz1sUO91Z9Iji0R1ez/soV6A41VGUcB
	hGuSWvLNUH4QlPJnCKmnEq+0wZqbWvmgzsuBXRzT/NmnkQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9egsfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 04:10:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed7591799eso43273321cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763093434; x=1763698234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=crP9H9A4OcxAdHeYBDCioqy1FA03fE0Brnx4WcqsdO8=;
        b=Z9DbqoPKK8Ijjp/Sxd41UKssQUk3xbQ1CjRtElRHOYWfdkmXtYfEBjFoj7UZK03kos
         cNljBCHN4MXWF58A4DEecXO1DxvM+fE62p0lT0gTSf6+pSg4x3Datv4fLvgS4gf83wx3
         77XfKJLLOLM2gTBbFdTtszIclcox78pCdNmgsri4tksjkndSbbSrVh0Munr4mbaOtRh9
         Otz+NeeKp/zfdJk7KxA0cKuLQo3+ffq1zH4y1lJVfbWbQXcZAlgixLK6Gps512Jvqh2S
         AH7YsljXyebSg7aQlV+Xhh9bijNVL2kd1f0p3bDy7JtPG7JStorQ9vyzQ4E1E6Z7Uu5j
         7G5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763093434; x=1763698234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crP9H9A4OcxAdHeYBDCioqy1FA03fE0Brnx4WcqsdO8=;
        b=L3Ig/4Ape6SqtZ7TCPQk3MWPYEcCg3Vwa+lk6Fip+P7MPKEaydghmQp0bS852zqXuS
         NGhC77k22+ccrnFxX+dKrf6lIREBDukDTAf6XznuZyUHPnWzBl+zTmRrpAAa8aGyNduI
         OAcet8cJkc1ZU+FORuMlEn9mPWesu/hZ+EmKLNM80os8wYq7qI+4ZTwf4i0Onplw287G
         V4A6OvuPGzp8DwpL2s89j7bDDKfo8VAnSHADFGRzoD+CWNzkkk51PBII2jAhe/vCX7bp
         VJ/tjfI5dX3eJe6sQgGslme1uBuNtWxci/f6fDioeCR2HAMHKGhs9HZJlwV3bLEJPgzA
         xDmw==
X-Forwarded-Encrypted: i=1; AJvYcCUvR0EU61iQ2+Tv9xWB5uPUnKGr2/7b24oVhx5CmwKS8xurpAeehdfJ+MVaAEzmgcsw7K7KQ/Ea6b3OSrg0@vger.kernel.org
X-Gm-Message-State: AOJu0YzYLb62L8Fjg2/Kz8QThEQIW3XdVep3LC0i403RsTwwdXzT1yj1
	tCyOrxiYAfpBCmkm54dFAhnN2qREaAINbnpScqpvdWGY5L2dZshRwMwhDttLCuQHK0ggWGV6xR0
	XaDxNsI+62ZAUyKEFmqkehNTYUE5c+0qTUsivu/VPx9LILjQNyF2o7h41NwJjIZzHo89B
X-Gm-Gg: ASbGnctgHr3FSAZynK71SjGWTGPCbuI1zVvXGbCVzYziiZ/andDZb9KnbzQteTQt5Md
	tNF59BwByAxrFZUeIdpM2Azpd3aF8dghNIwzB5oevfMF7EZeGe1qR3+dnQw6vPjPeJWx2JFzbTX
	R6eODOw146xLR/zcwI/bryD+kirxAei8bmSDm7ajK81ArasR7VdtTooP7IajCKiPFYKxs8SerHb
	87PHgMrmCi9cna8kmXYxG0X+mMSGbrDpqyMdTQSXcyTBNN2S97Q1DxLW66ptBgQwBGmVRuOOcR8
	nKHGBExY0WKMKI2DuHk0PVQceOWt3rwO219db1N0iy8QJiMdGtzxvwmumCzFyyNZ5jGb70jW5oN
	8a9i6j1UQcXsXA3WZNHOADRlVte9Qhw5v2z6v0lraRStv58dNvZL/MkEvbMLYKVy6iCYq44DOci
	oazv5DBtIL3ilw
X-Received: by 2002:a05:622a:101:b0:4ed:1ae1:5390 with SMTP id d75a77b69052e-4edf20548bfmr28626591cf.18.1763093434133;
        Thu, 13 Nov 2025 20:10:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkrItC4byFnxIb/MoLRr+P54Wcvm8Kw5FEvzyr+iEPn+IuRhxLLOuNt9CdpWzfVeAdyLyKdA==
X-Received: by 2002:a05:622a:101:b0:4ed:1ae1:5390 with SMTP id d75a77b69052e-4edf20548bfmr28626361cf.18.1763093433637;
        Thu, 13 Nov 2025 20:10:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040d89csm781380e87.107.2025.11.13.20.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 20:10:32 -0800 (PST)
Date: Fri, 14 Nov 2025 06:10:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Teguh Sobirin <teguh@sobir.in>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Message-ID: <w3fffuitwki7imcpc75m2e5kv5fpg5nj6udpxytm55kqa4mkud@rkl2ywspwm5y>
References: <TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com>
 <ukz4djjytsne3y2w3epkdc7gzegmeeijpcqblvftcx73ccs43p@es6b4ew4nrzx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ukz4djjytsne3y2w3epkdc7gzegmeeijpcqblvftcx73ccs43p@es6b4ew4nrzx>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyOSBTYWx0ZWRfXw83EhVv/I3Vm
 kTeacocZO86bbcMhzrt8mDxxeuRVQcyj//m288QfQsdHsKFDhnkOvGwfGTUNIxfRdPSmwCJXEVH
 /oN9URTIPiufscyiE597k6awjFTPzK/QpkP11pPeleCDtk2LkhZOu+A8QZls8N6MYKWg4b4A4/2
 hCy2P6XXSLLXYiPIZUgB62srrodUZdS70y7NCFuMKxJhFs4cjAC9EGwfzcYEt4QoQGmcxAPICNB
 L6twjd/xAk1P4VA6lomkxqem1scJ9Y7uF+BWb84x6SdgB1l9OuxX1i22gUdYjv8XrpM13CACeB1
 fiCWpmh9XSRdNC/NVR6vbhPlhvlewbZLSiEvUfnZf0lwMiSDQjP0sRSv/epmuZ+OnJNBumiiY80
 hL3RjtKq905gBOQvJNo545+LkmaFOg==
X-Proofpoint-ORIG-GUID: Ahw-vkupK9y_Fv0J-nhySi6e058k_UX2
X-Authority-Analysis: v=2.4 cv=Afu83nXG c=1 sm=1 tr=0 ts=6916abbb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=UYdELWV9MdadiCxCyV8A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Ahw-vkupK9y_Fv0J-nhySi6e058k_UX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140029

On Tue, Oct 28, 2025 at 07:02:28PM +0200, Dmitry Baryshkov wrote:
> On Tue, Oct 28, 2025 at 08:36:35PM +0800, Teguh Sobirin wrote:
> > Move the loop over phys_encs outside the
> > hw_mdptop->ops.setup_vsync_source block.
> > This way, vsync_sel() is called for each interface.
> > 
> > This change ensures TE vsync selection works
> > even if setup_vsync_source is not implemented.
> 
> Please see Documentation/processs/submitting-patches.rst. Don't describe
> the change and pleasw wrap the commit message on 72-75 chars boundary.
> 
> I can suggest something like this:
> 
> Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> INTF blocks.  Currently all code to setup vsync_source is only exectued
> if MDP TOP implements the setup_vsync_source() callback. However on
> DPU >= 8.x this callback is not implemented, making DPU driver skip all
> vsync setup. Move the INTF part out of this condition, letting DPU
> driver to setup TE vsync selection on all new DPU devices.
> 
> The patch itself looks good to me.


Teguh, any updates on the patch?

-- 
With best wishes
Dmitry

