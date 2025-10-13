Return-Path: <linux-arm-msm+bounces-77033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D52BD3A02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 16:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D9DAF4F8C8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 14:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE17273D83;
	Mon, 13 Oct 2025 14:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TJzZQnq7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1089274B53
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 14:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760366053; cv=none; b=utl+mEx/AvQWqGMu8MJSWyKCLYIm13kjaJVS0Gb2/rQikR1Be1wcO9ICiyyS7OHQDH4lW64afwzxNq0BZvP8n4FKg2gXE5lSuCAsMyRClXNnClsK0UKe1qao17fiCMMsNo0m2cfl+NK8h2TJ4AqxzUHLzkM0AskYfh/lccxdwpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760366053; c=relaxed/simple;
	bh=+Xq9csTV5We6M8IuSeEgmXYhbbqrD0QRAT0qUJg4f5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVVX+CnkIG9/6WiLocpLWl5MaLoYsCiCa/kNYhTe4UhGebPk1dCuT/auDcoRlGra6/hE+RspkR78OyYqQN4XWJTkOmJB4ZJD8qiUd7l/vqSJk0mPwhzehMdH43fe3/IUSo1QbyAjgw0vBnnieElyfldeMx2/u5ucVpKInpW58+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TJzZQnq7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DANVIx017135
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 14:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UnjM2iW4CXaWPsxTyAY4aMVtXNn2X/TlNCmubEZb6tU=; b=TJzZQnq7cyFpLFad
	HZOosQoW1dz6Gfz7pgkTYO6/uzN7eA7tUD4BUGRV4+AWHmAA/tHXM8GrUC3NbKIb
	spyp11FdPh+Lttl+aBnDkjosNPlRa0dT6MSOOI7L83mef3gcJ6xS/OJoHDAcMUbt
	MQdhf4//d5kUoEL/5YtSpFs9bcaWgcZMgFdmAn05VKwzlO30IXfcgunWtq3CnePV
	CX+ZGYrC047nrkEpsRo0ehfuH1o/bqdw8yR6rNzfLLjZDqxgcfGolP0uc/+6HZvU
	Cw+TA6bIXvvLQibRhg/AAAJWuJePvpEBhsD1lSMpAFK8Hn+JFhBToUchZoubKL7R
	2kNB8A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk4y77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 14:34:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-859df490f9dso1040104285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 07:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760366049; x=1760970849;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UnjM2iW4CXaWPsxTyAY4aMVtXNn2X/TlNCmubEZb6tU=;
        b=GjEFYb1Gm7YihYmH3Cu1EXtajmTzBnV4EZKWGHnvDJ0Rx+7tpFaZfN9tTrQBOqV4Ls
         PGNaPL/Oiuui21N1HpJ0btHKAbmbyB6vhxrsBX0KsFdSrGiiYUCtDI4dinrag4gsW+P1
         gunYau8oTmLp6466ZGx4FWPHYpkqpVY/Q+ftSEa2MU12ZQg/lYtWvQiEbsuUtPgtcNmP
         rXyygu87QDiWnevwP6I2vwF6FBz9Je0kxHtJl5sWQSyqkpjmnJ2GcwVwiHtEJwX5HPN1
         AHgK8myDfrh9bD/WYHFYnSfjqh/5Mf3Y1k1MDERqYxCiT6NYrAvlju+YkGbaowVatqVe
         pm8w==
X-Forwarded-Encrypted: i=1; AJvYcCV6ec/ZoOkDmxDP/6aYiY37jxtfsYZt8KucNAFSnhdgHRqUDipKXmIlavNI1epEKeJxtlJAvHhQqfewG/9i@vger.kernel.org
X-Gm-Message-State: AOJu0Yxir+NqyYcdHnBgYMJU8YkeG55uaoPA+dPPZXyK9tMvDDwWt+ad
	I8zsdLGS8kKEGNJKCmyuYnhLeIyzkqkyM2I4Q4Z0B/Jn39OlY3D3JFepqo0UAS6wcrJY22B3beq
	r1Gb4qC2ID/tJe3O+eVoEoj/oi3rzFZHzdPiZo5wXpU+Ss7SdTPALDG+2evkMm7BrLY8R
X-Gm-Gg: ASbGncsjsU65bNT8I1S3p+acW4fDZKDeLQfY+dMROhAHrEROATCqbxLt3sQsY+g032c
	VA4KEg86S2zoOyXPsY0iie47c8SgN9d9ZWs6XdA1YAPp++k8XGZtKEwLc5/qSnraifL5tAJoWPc
	vvSejeJPpmXg4LXMwGw15eo0nwMq2QaUBOU56Z/mN2/nbB4MpD1whbxzlk8xwSQwyuZSXvWt5Au
	EKJQBu0ra7B0ouYPQiH7X5jHrb9Q3MlIndAdQ6AdwABi6AyahBUD7q68Ncqvo6vfuRgeMklwdyF
	8rsQ5AUB0vu0mB76eLS6BgNjsw+fO244paTeg6epL/sdgysC8EkOclZW1njljqb3HiGRgrNlpXm
	367qfqYWUy/bDkI6LqjJUbBXXkjTi+tXrgcyF1J+a72up+rvNBDA9
X-Received: by 2002:a05:622a:1190:b0:4da:256c:3d42 with SMTP id d75a77b69052e-4e6ead66d3bmr306582871cf.59.1760366049431;
        Mon, 13 Oct 2025 07:34:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsAa9RE0jQv7/KQ4V1BacvQuNOMhawZJVvcdaOp6lQ4V+xaBIvIkvcwLEkbpiulXd2rlgZyQ==
X-Received: by 2002:a05:622a:1190:b0:4da:256c:3d42 with SMTP id d75a77b69052e-4e6ead66d3bmr306582221cf.59.1760366048780;
        Mon, 13 Oct 2025 07:34:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5908856394bsm4179132e87.66.2025.10.13.07.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:34:08 -0700 (PDT)
Date: Mon, 13 Oct 2025 17:34:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
        Jun Nie <jun.nie@linaro.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
Message-ID: <3a2v2i5lximl6q7eidd5zhjoyckz2fvgv52rhjruiuyuc6v3a3@5kdqa2eypidt>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-3-caojunjie650@gmail.com>
 <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
 <CAK6c68jBwykcWZm3ckm3nwab-X9Are4rD-eauE4rXA2+XvuX1w@mail.gmail.com>
 <9cafccd5-35d4-46c5-aa57-1b0b8ec116e8@oss.qualcomm.com>
 <CAK6c68iV=n3BvMMa30FuehbMs7-U01s0saZnsYwPVoiyw0VTrg@mail.gmail.com>
 <icj24ghckurcunjormsfhhscng4wfcxiyadl2z5xduitxxqqmp@iws3pssew5dx>
 <CAK6c68hZq2o9YXxzd2dv5AXw5-UfKv_58MoUrQfGyfPiONArEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK6c68hZq2o9YXxzd2dv5AXw5-UfKv_58MoUrQfGyfPiONArEg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: uQsfiVpIrJDP4CPPG19q1EndzTeWBfqW
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ed0de2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=RAbU-raeAAAA:8
 a=pGLkceISAAAA:8 a=MZ1LVty5hXXzp8AwOaAA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-GUID: uQsfiVpIrJDP4CPPG19q1EndzTeWBfqW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX2FykLtVSqaGs
 AHtvi2iGwZRVE6QY3BSexReBB8ywR3iZJJu5wF0wUcGudCea3NOVJSDpREezE3lG6sU/H/dT01F
 hhvJJD40XUI+DPFG/OA/akJnx8F23NcYe27WjhvnKke8mYPMB8gxVq172+7YsjZSKN0fdQ5HhiH
 RYcln2NGFdP7lwsKJckT0oCLmBMw274Y4tX+sLpOjnXlV/fGah2QrTPdGXjy6HENpChT7Xt8dmY
 WVWOCCO/xnzFguMCNl9miGiCMxuav+OTgEgRcNKskPnANKA7VCLvbLwsGhEWKjcwhT2dy7gBBYJ
 TNiIiXl6d9/N+P/8ge5RfSqTaNGABkIgHCLp0nI3SGzMhvOQ6xipoGnz2UXWRyYbRnyGjQ1p1De
 Jd5qJ/Hy4mjFHO7spSCaQN13LmhTqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Mon, Oct 13, 2025 at 09:17:04PM +0800, Junjie Cao wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年10月13日周一 20:31写道：
> > On Mon, Oct 13, 2025 at 07:04:43PM +0800, Junjie Cao wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年10月13日周一 17:39写道：
> > > > On 13/10/2025 04:52, 曹俊杰 wrote:
> > > > >  >Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com
> > > > > <mailto:dmitry.baryshkov@oss.qualcomm.com>> 于2025年10月2日周四 10:04写道：
> > > > >  >On Wed, Oct 01, 2025 at 09:59:13PM +0800, Junjie Cao wrote:
> > > > >  >> From: Jun Nie <jun.nie@linaro.org <mailto:jun.nie@linaro.org>>
> > > > >  >>
> > > > >  >> Some panels support multiple slice to be sent in a single DSC
> > > > > packet. And
> > > > >  >> this feature is a must for specific panels, such as JDI LPM026M648C.
> > > > > Add a
> > > > >  >> dsc_slice_per_pkt member into struct mipi_dsi_device and support the
> > > > >  >> feature in msm mdss driver.
> > > > >  >>
> > > > >  >> Co-developed-by: Jonathan Marek <jonathan@marek.ca
> > > > > <mailto:jonathan@marek.ca>>
> > > > >  >> Signed-off-by: Jonathan Marek <jonathan@marek.ca
> > > > > <mailto:jonathan@marek.ca>>
> > > > >  >> Signed-off-by: Jun Nie <jun.nie@linaro.org <mailto:jun.nie@linaro.org>>
> > > > >  >> Signed-off-by: Junjie Cao <caojunjie650@gmail.com
> > > > > <mailto:caojunjie650@gmail.com>>
> > > > >  >> ---
> > > > >  >>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
> > > > >  >>  include/drm/drm_mipi_dsi.h         |  2 ++
> > > > >  >>  2 files changed, 12 insertions(+), 15 deletions(-)
> > > > >  >
> > > > >  >Please extract the generic part, so that it can be merged through a
> > > > >  >generic tree.
> > > > >  >
> > > > >
> > > > > Sorry, I don't get it.  The generic part, generic tree? Do you mean
> > > > > the drm tree? `slice_per_pkt >= 2` is seen on the panels of these
> > > > > tablets that are equipped with qcom chips. I don't know if these
> > > > > panels are used on other platforms, and if it is necessary to do it
> > > > > in drm.
> > > >
> > > > There are two changes here:
> > > > - MIPI DSI header change
> > > > - msm DSI driver
> > > >
> > > > I've asked to split it to those two commits so that he change for
> > > > drm_mipi_dsi.h is more obvious for reviewers and so that it can be
> > > > merged through a drm-misc tree (or through drm-msm tree provided it gets
> > > > a necessary ack).
> > > >
> > >
> > > Thanks for your clear explanation.
> > >
> > > I don't mind to add the field separately. But should I submit it
> > > with the panel driver together? Otherwise, this field is unused
> > > for a while.
> > >
> > > However, as you mentioned, this is not a part of standard, neither
> > > mipi dsi nor VESA DSC. Recently, only Qualcomm devices require it
> > > to calculate parameters, then we use them to program registers. Why
> > > don't we parse the field from devicetree?
> >
> > Because the value is uniquelly identified by the panel's compat string.
> >
> 
> Yes, it is panel specified.
> But can we set it for every panel like
> 
> &mdss_dsi0 {
>     qcom,mdss-dsc-slice-per-pkt = <2>;
> 
>     status = "okay";
> 
>     panel: panel@0 {
>         compatible = "foo,bar";
>         reg = <0>;
>     };
> };
> 
> or moving the property to panel node? We access it from child node.

Why do you need it in DT if the panel driver can provide this
information.

-- 
With best wishes
Dmitry

