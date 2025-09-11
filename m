Return-Path: <linux-arm-msm+bounces-73138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EE3B533C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 15:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 601133ACF3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 13:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12B7326D51;
	Thu, 11 Sep 2025 13:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IUiT6jJz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7204230F93E
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757597399; cv=none; b=m1HiM5qjrkif+VWGDwhXB7mQXMyx+ILNXrrgigR301QLIFnkViis2P7cpL9tP+xdNoL0q9O4ug3sRCYxFCfWFMG+AIKZ69xj5YlIuQcapgkmUGy7RbeOEmoSDl+Va72AEDYRRyi4uPOGlwAZj7QO9Qg1sta/KLU4U91XQzO9Iiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757597399; c=relaxed/simple;
	bh=PmlOO5iv5f9fXOncJO2MDvuoQfGMnyKJMo22ffxT/S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBY6xqLG23OztwytmHgvHJIU+yb53jXl2/ECsEfvuGy754ePx0+8gdpe5KDZVjilvilrBs5MqU59g0OR+Wc3NqCKAjftiYcbgEhqJj2cOReYEGzjziEd8kQwK7PmOgWf4pldugMSES7gzkY6EzIz+xt2x1F5hmD6w/8zRa3hlWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IUiT6jJz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BAYnSp006675
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 13:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ey2Z4JMsId+WF9VnovhxbF+7
	8pVNuM6IZRJDnfyjy2I=; b=IUiT6jJzIUMzkChyaP0MALicLXWe5kSE8M37EaXc
	/mgBwHrMxAmKtBjT0Vr0FlrxLbmVRH2evnfOqk/tj5WHnDLAMX1zze4sHhcqTuF+
	gw9bTymHdDo1qRGZZdHoR38rncoHRpzWuyXwBO4ndj2vXbCHNkLIr8WJf0HacWCL
	fmAEWKKZdlgqvSKvHb0k8uMdl05K8/rdeKo7sKvLDxlObBPFV4aaaJkipSbnB84N
	pyyv9MOk03u5IaaF9/eKO1lH/gl68ChvV5+D6InBUDSlRPwsFnt3gPRvjbQsImmc
	87i/SHOhIMJzkGSa9YU14HC93lqV7ig+1wACQSMDrrx+aA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8afsvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 13:29:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b4980c96c3so31192011cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 06:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757597396; x=1758202196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ey2Z4JMsId+WF9VnovhxbF+78pVNuM6IZRJDnfyjy2I=;
        b=JvfOsYhi/QRiAyPUq2cRiH1MaIIwPn13c9VEy51AQYyoLF5lzqJC4ZliokKNpHQ07b
         6zczPLKj3pc2uk/Fa3Pb7g/pqm42BOsQLkbNKPf6NcAxf+Ws3Q8GzZ7WN4nOk6XRL2eX
         hoGsL45OZJBB/2d56oYZ/Nu+hHCuJMGKKIa4iJgA44ujs2kgQtXQ35ub7Tonpq4alutQ
         GimS5vB8dqupul0j2UqTPfM15qUhbMPzSVVm0p86Zu8POs1fI7IzjWLRQ7+m1Ma0iuMU
         p5vHnp1s96NUsw/LwWIZHtWRscDMCvkyZzxdX541XFyKD6CpMtQlQmB1UXsscKOn9VmK
         ICzg==
X-Forwarded-Encrypted: i=1; AJvYcCVDQzmWGu0jx6ntLZY7u+YmDv6dfPZWBlsOs3TPnktc9C1UY6uw0pr3kJisL3WlXqJSR6geh3893VYeJg7J@vger.kernel.org
X-Gm-Message-State: AOJu0YzDywlfmo/bA3n3ZhSkn88P09QNTCZNjKV9Lb1RNv1kL5fU3GDN
	6JjFQ5aIxbRGfHSfb9cYJlnBoZafw97SvjjbSYFKVCOx5QtDthiwGhmfZ16tXqTsXJE8usVioCb
	07WUfmTKNBpsWWwI8M7sOHhhIL0ZCpep8fj/pndeQe49hrwRg2vY0KGp+3ZYy7ZWHTi1t
X-Gm-Gg: ASbGnctv3RDeWiCANxc/2AjF9AWvthDRwr/97LqXL3FBCFS0tBnYJr6Eazv55nS/Plr
	b+KEJtKKoJWV8E/fqDmAZmwJ9mBURpKrXu9TxljcjrWFtxXCBkPBjDh+qjr12+k5cNCjNHXUox3
	SsYH6REXITJ8UC2mcChP8Yhbcprlt0gNYdxVzZqtm6sDAHDOt0AceRegp21MHSGawDChkjoF0ko
	x3ykV1lVEM8VhfFj23cAO4PwBzRfqp1Pz6nYyzB+HdnalzIzmPmHInkVOCHMtwYfFVizksLvXn6
	9LMV6s1J3GhUorOqIkkaVUp8Uw733bwTvjod1yajHW2oPZh5c1t8CQRQih2P+p1PqRW/WxUkLVm
	SB7y3wsghiXwh+PcTDrHY8hpq7+E/zdTLbyw1gciw2ouso/+e2Zn3
X-Received: by 2002:a05:622a:5c92:b0:4b3:122f:89d6 with SMTP id d75a77b69052e-4b5f8445a73mr256204161cf.45.1757597396122;
        Thu, 11 Sep 2025 06:29:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOBNwwY5vu2F6YDZFmUYGcnQ9hxKYIQ7ZgYbQqAmh+km6PDS9gBX8NbKd9eTG/XrE/5BOGWg==
X-Received: by 2002:a05:622a:5c92:b0:4b3:122f:89d6 with SMTP id d75a77b69052e-4b5f8445a73mr256203741cf.45.1757597395496;
        Thu, 11 Sep 2025 06:29:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b5fadsm438580e87.6.2025.09.11.06.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:29:54 -0700 (PDT)
Date: Thu, 11 Sep 2025 16:29:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] drm/msm: Add display support for Glymur platform
Message-ID: <4qrmzpxbuptm2x42qa74hbulb5k4sfyxmu5ji76j232elo7dnm@pkclmnxb2ijx>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <xjtg6emrb7svloz2fkaotfbj4m2wzmddxdsdnjk5wkbmocqzmd@l656suk46pkd>
 <kasmte3rxr3ukz2eqbwlzbpeam2qq2qimzdqta5dl5xsthnokc@smvts77lhirb>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kasmte3rxr3ukz2eqbwlzbpeam2qq2qimzdqta5dl5xsthnokc@smvts77lhirb>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c2ced5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=E1lcnybXH_NDbzajFtMA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xurDimY0m8_vfwB8xaMjH3YMZFpeuAsD
X-Proofpoint-ORIG-GUID: xurDimY0m8_vfwB8xaMjH3YMZFpeuAsD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX4hxA/MRr/UiB
 OJQ1UWomDFnNF7NQ280iRehQ8Z2oaN9WW92z0U2OjSuLYv/KHDmSx3WwFXV/1fcDMnWydLZgjSO
 G+9MiGi/tQVgH4FYQdty4ebVIM7UlfJBCgC4C+rzVKu2NgRgJGgkGM+Sol+JoAceFCW5Eb+DsJB
 w2JWj7HXI/4mkfn/Nc/J5mYUVSFfechJkjm5WSTwxttcmt3Lsm9kJ/M3DO0sqLnV0/qeAPRU2I/
 3GVXlvf4EQhaxG4yIwAZdMGDQLaMRYVSeENPh54emT1aqU9zuUs9B0O35yKe3fS1y6GBhTHfeZQ
 CfzZA4SplN48+gyRYaGWf5Bc5mtcuVSXKW9VBptF/BTDPAQlRqXFjTgZjZNNi9c+TI3utKOtBsm
 qM2ujkL+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

On Thu, Sep 11, 2025 at 04:10:50PM +0300, Abel Vesa wrote:
> On 25-09-11 16:02:40, Dmitry Baryshkov wrote:
> > On Thu, Sep 11, 2025 at 03:28:47PM +0300, Abel Vesa wrote:
> > > The Glymur MDSS is based on the one found in SM8750, with 2 minor number
> > > version bump. Differences are mostly in the DPU IP blocks numbers and
> > > their base offsets.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > > Abel Vesa (6):
> > >       dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem
> > >       dt-bindings: display: msm: Document the Glymur Display Processing Unit
> > >       dt-bindings: display: msm: Document the Glymur DiplayPort controller
> > >       drm/msm/mdss: Add Glymur device configuration
> > >       drm/msm/dpu: Add support for Glymur
> > >       drm/msm/dp: Add support for Glymur
> > > 
> > 
> > This will not work without the UBWC config for this paltform. Please
> > include it into the next submission.
> 
> Ofcourse it won't work, but wouldn't the UBWC be merged though a different tree?
> I thought I should send it separately because of that.

That depends on Bjorn, currenyly he has been Ack'ing those patches to be
merged through drm/msm.

> 
> I'll add it to this patchset in the next version.

-- 
With best wishes
Dmitry

