Return-Path: <linux-arm-msm+bounces-75760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7C8BB2541
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 04:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45BFC19C7FD9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 02:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA70B13D638;
	Thu,  2 Oct 2025 02:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmFWv5sR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0690D78F2B
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 02:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759370657; cv=none; b=e11kpkcSIZ+YSFJz22Qtb8s1kmpb+4rSdMt1Igzih/peqPxTK9IFDR/GQ7P9CaPqDHrj/UQj3tK8bT5VKNX3peAIwGXHu135SZfutomtwPLTwR8w/l83tub4SIyDqVOVbmeHGo/BR0l+K7Rk3uBus+wwz7wyEshSjGS6z1LXot0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759370657; c=relaxed/simple;
	bh=qs9k2FXOjrriQ2OPU3xgtE9M/BAAl684zxtsJSzBmIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVSWqqrlRrAO5ztgvFIwsr8WV4E2vTlsOlQhkHhKv3L8+NVtB+Ayt86sxciMcKYibExvTiXCcx/t8tYtezql3sTH0S/XeqLh5pzs1uN3hASH2X1RgRr0LdIl3TvmPKeBFlzF7xxQGsHQgRy2MukAY/rgtiGxhQcnUSeBLRQYDYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmFWv5sR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcSOD022972
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 02:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Fl/AGlCNPzgp60GeVcsnYx9M
	fic5Mf7tmPNGf37B3YU=; b=cmFWv5sRCfA9bu+l1CGegC0oVwCyRF1WSfXTqw7/
	c3ii2lErKalhkzrw+3kpKdGmsDL1zaD+YnGtRpvLDuKVuycB5lU87XdgCpAhqJiE
	+TnIhfq4N0cvS1XL1jIVpPkC3bJXTD8BmRez6WePl7cV7PInxkiwqdSZklVUDkJn
	btYMeJYjYB4NFud6RPq3OY8KGALvEZpojZLaN5ZsCyAJWDGWDRCMk1kGjuqZyAJZ
	7M102ffyh34kwET1EU2NFiHjgzvg4JfSsMNtj1L0tbkIYDg1eQWa9FUxpNQ4RKeG
	PlGv0De0+0Lm76jeFzC9LDflaZ0+oOo+2eT8WtcuG2TRoA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n6sre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 02:04:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d905ce4749so9846451cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 19:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759370654; x=1759975454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fl/AGlCNPzgp60GeVcsnYx9Mfic5Mf7tmPNGf37B3YU=;
        b=GMLuvku5OxsjKEss3/NhHu1AI6uqUxmt1kf7ju4q+U/5Sr5cQfqLyvZ+8vYpUX5gxN
         ViSDG/EDNKQkt5g88YuGOl6d+LONqpdo1knhMeD/NLIXdPXWOipFmO+bHbvrdfB0brxk
         XZq+hCZn0ZLYwEEDSUCLEazP1QoTd1ApbHBADIW50MShQZUyjcMRVp47XzFnNbxDf+no
         KUZIhBaFkOw/X/NLXJBTz6qTJRTWrH/YfU0RXDCEAz5K8DrFOrac1c3PjTxdOb/AI5DL
         z34U3iUrinEHSOB1NhSSPA9SVGaJzxDyl27tRVO2g1h9jmhbs1Uaz7Q8erjLAuSYwdtM
         DkFA==
X-Forwarded-Encrypted: i=1; AJvYcCVe/xWG34Gp+hGFtm/Osu0wBls+hzymNlROUjld8dwH3X0PPdJXk59Wx4eX37KKRM1HolOHlv4orN2tODPQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwZKu8mRsjhDlC47Hsr6PpgcLg12m+fx4N8KjWI0Q6qL0WuJI90
	5ZcF/jN7oos/rjcWX6LfGWLLjxnOkxSneBu1ZDqnt27zvFB83MVQz5DHGfSWmkkK2J8BVWAN2Ws
	OWLOCRO3h9MUwtxYB/gPkf1ICS0TvhKKHzunz8OJJqv7ymSsO9CGnholuujRaUHp6nwSO
X-Gm-Gg: ASbGncuJTbH6PU2mVMgi9n2B6lOUwA6l6HQMwy7HqEsuMXxgXPYzJz4PYYmpUKK0Rrk
	k5EgwKw6Ysu9HzKTDGAnEmrVYnuWS0aTl1teM/uMapPl1MY21omq8bxFKlkjI/SpxarQJqq11bB
	AgfSbrFEVl9rRmE/UM6vG0LPQd3EcwKL8mfa1r2C/6PfZULSr8tYEHYMWNh7fyqzHdz3keaovAE
	xvF2sXGMYyb0zGbnpVOV6jOUS/HXjBLNqJ0kxXKnE+NEPmItidyM6hvXzlf7VtvVBdqnjxBl1pk
	3iC+sWZtLH3zxlgBPofemqgTOQJTj9EqU2AI19lSeKVYxdjTJ6O3i8y2Jo4WC5eG+uw7wyr0FN5
	nrN8nq8NaA+y5crGl81Tfe5LN5wpqAZCHyTtQVJVV0jUrbrmkacKK2L1qgg==
X-Received: by 2002:a05:622a:1f85:b0:4e5:6eef:cf5d with SMTP id d75a77b69052e-4e56eefd0e5mr3437751cf.82.1759370653990;
        Wed, 01 Oct 2025 19:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMNoV8VxZzwB9ISG0Qcqu86I8IUKjtKfBRp5TKNTJODnfTge4BFASA8/Hk84j8esTc0pEIqQ==
X-Received: by 2002:a05:622a:1f85:b0:4e5:6eef:cf5d with SMTP id d75a77b69052e-4e56eefd0e5mr3437251cf.82.1759370653504;
        Wed, 01 Oct 2025 19:04:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0109afbdsm390835e87.0.2025.10.01.19.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 19:04:09 -0700 (PDT)
Date: Thu, 2 Oct 2025 05:03:59 +0300
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
Message-ID: <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-3-caojunjie650@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001135914.13754-3-caojunjie650@gmail.com>
X-Proofpoint-GUID: F2Og01a7dzzi9QWlBTziVm4fgWBKIOkN
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68dddd9e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=RAbU-raeAAAA:8 a=pGLkceISAAAA:8
 a=chGVdZ9yfDdcOS25WoAA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-ORIG-GUID: F2Og01a7dzzi9QWlBTziVm4fgWBKIOkN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX2VUpdq5hsz2B
 3LQvnH+mhmpcQZkpHN/foX/MenDG+zR66Z6cS3R5ypeyckSGSA+5N40PTPSiZ2sPVLwTBlYo5p7
 MOgrYIawPz9LqPfxr8tzNkumpIGgQUKH9nG8pNUaTNcZC5rYYtsZZFQFOjgp533qmCnZAz+XyrK
 krlLHlgZkyQTKKdMsuk9R/sXQbHu/7Isk8b1ZD1wQDwYTR+8EvlBankmCkZGDkyu4giCe5ECZQR
 /t6Dymo5dQ/5hUDdccbI+aWYbS52BgU0BIXFrSmoTyctwCBjniDZ3zGGGZkcbPZd679PqDKLWRp
 X9IoxVqJ4tUI2Jj7Ozk1ZuYMBdeVBMoOPycENmWzEBm1Gmc5/1aOXmxFkJ85ptqgCJYvCyvoYs6
 HrPF7yhI9p3VuiKw8R2VA/BPPpWJjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On Wed, Oct 01, 2025 at 09:59:13PM +0800, Junjie Cao wrote:
> From: Jun Nie <jun.nie@linaro.org>
> 
> Some panels support multiple slice to be sent in a single DSC packet. And
> this feature is a must for specific panels, such as JDI LPM026M648C. Add a
> dsc_slice_per_pkt member into struct mipi_dsi_device and support the
> feature in msm mdss driver.
> 
> Co-developed-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
>  include/drm/drm_mipi_dsi.h         |  2 ++
>  2 files changed, 12 insertions(+), 15 deletions(-)

Please extract the generic part, so that it can be merged through a
generic tree.

-- 
With best wishes
Dmitry

