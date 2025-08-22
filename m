Return-Path: <linux-arm-msm+bounces-70348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C37B314C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B5D6567BB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F1A2C0296;
	Fri, 22 Aug 2025 10:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aRLhTNmw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D59296BA0
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755857360; cv=none; b=uXvn9yl2/nZIrFSgysGvgTNcY8kHk4RD9Tc7qKG7HOqmmgF05zswpCHiWIlK3000d7aiR2TYDG3zsu17gz0TaCFXM032nbMPwrbywg8hwRbiwh6QQA5AYKxoL9CxwY4ELszwG0TmD1Mp0+2xzgcPcENjSMR0akwbAj0QjReQgNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755857360; c=relaxed/simple;
	bh=1+cEJqEPnMhs0VGIKCr+QdXiw1/UgnnBPrisveWge2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkyI9Hfb0REsp98yXCeCi4SKwhF9oN0mu8XaVKFzu/Rez+LcMCnc526YNbvVUAyxNu/uNS7eWa6LHUMtoz4Jvk3v+zj/tbyodtgrLU7luTPTWrR/H9jGq+SZH4tJYN23MHeFjA9clxKNWTYumOc1lf9lAEMb7PxDmkHE8raWULw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aRLhTNmw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UKQs020877
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/CUwk5QH1ZSt+M+5NuLxUaiWmoXIPaE8loSJYuZG5tk=; b=aRLhTNmwMlgE6JQe
	tWwNf2M2oC4oojXabs2KKGwrhhStri5fyzPV+aU3lhp7Jbi3ypNE+l6O+n77w+Tp
	2+SNiqs/0+tfPliih6suw9tHpp0ffs+9zMvXNPDnj13DW/s9SKKdCdxxzOJF/6Cd
	2+pirkH5OE53jNtRqWAYvIT1QB/WQS/5kyUqK+EvwumVYk4v3hTDqjc62miMMSj0
	4B14/XgwMenyqdYSqstlznouGEBuD2xxAJJ9JnOfdMzbsleFWKK2Nn9Ue5BS1F8s
	y7j3e5mNRCzD09dwMDo+M9AcSE5/u8Ow4n4rCDWtFLgLegNNY5i3RDJyrHH0ucW+
	tyuQBg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5290uef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:09:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70d93f579ceso23530436d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755857356; x=1756462156;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/CUwk5QH1ZSt+M+5NuLxUaiWmoXIPaE8loSJYuZG5tk=;
        b=AnO6fPRYzeROAptFpJvt3duYp6BREjgoOTd+7oBGU320bj0lK24GU/sFHWg59EUd9A
         JpQ1DHbK4Xvso7c5uHZJPP1+fne8phV45hSoFtNb7J3sdub/osuMKfWCZ3yCBS6RfeAH
         Zlnn56CLMs6BfuhQg8i5g9S4Uhfh0yLJy3XoT2Z3joHcPuMZgpTwjtvrClAQzCgilf0g
         1wigISlVGVQhEqWtwKJyrW8QwyN4ZZK74eK5VO7cXqIoopFR7L8eFliS43o8CGrKHmCx
         pGBQuvZTHIAcyo0Qh6gUw2ZSOYsRsh/IiOICIPuCI8JlYABzzgg5MLbsg1IRNO/UVtL3
         VF0g==
X-Forwarded-Encrypted: i=1; AJvYcCU1Eg09ALd4J2nX+0qCrtekau1NAY1v71NLo8EJ7t84ypVQkU5ituAfXPBa4t18zfQtrJvs28D60neqxapG@vger.kernel.org
X-Gm-Message-State: AOJu0YzmRyI2tXaNpD73HyUoWOW/M6SF8U4vwGKf0yNnkqFOlF+wVhFE
	FcVawI3WtvexEciOh86PI2QNav3SCTsI9Zp8qAoTXjhmTNTvJM/koRwaYA5N6vI+BAk0UHbCs/F
	imGT0Q6RxDuRytmQ9ROb/xRnmfVLi/UAet7TK1Gm9MhRpYaKcHVkDGNND7856gCzv1uRn
X-Gm-Gg: ASbGncsnyBkNBTPFjBTQMcXsPh2iKSXJEk+CPoX5Vnn460k8AGrlE0l4m9IXGsZFSy6
	wenTZHxWZOqykWplZe2ygMFv+Gut1sw3RRgCJiNaHSwYOlCvsVlbnj5blm9aP8WfMr+LhWwW8uF
	43oI7IdIyTiTqAEUpPuYscFixK3DrRU5v7aKNBQvoaqJDNqqXvGXA2pukD0arDO6t8XmBzSFi3+
	7Zl4Ejw0OZIs+lLWPUw21blgRl6F3V5HMXoD8tda5h6Lr1Sikrds5drxsFYeblLzQprl2EGiLWI
	agpSbgZQgJLoCS7flowt8g7DXOfprJRh9x/9x9GxMOjH3hocfTKhNzyOdoHVCIQ0a2mvZeZRJ/U
	1GIbTcP8jukIb7y0VR6zc+RPpGp/UEK6976kApmJxLMvoXWEKA8YJ
X-Received: by 2002:ad4:4ee2:0:b0:709:d518:74fe with SMTP id 6a1803df08f44-70d972f905dmr28317806d6.38.1755857355580;
        Fri, 22 Aug 2025 03:09:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjLDedc3TEHaa5fOfhQL6JH2lzExRdfVuK/adJjjF/AbJ1wFTlhwvAYsjorze1ggX8bWHyRw==
X-Received: by 2002:ad4:4ee2:0:b0:709:d518:74fe with SMTP id 6a1803df08f44-70d972f905dmr28317336d6.38.1755857354860;
        Fri, 22 Aug 2025 03:09:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33650ea5f6asm3013591fa.53.2025.08.22.03.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:09:13 -0700 (PDT)
Date: Fri, 22 Aug 2025 13:09:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v3 08/14] phy: qcom: qmp-usbc: Add DP PHY configuration
 support for QCS615
Message-ID: <tdmjo5et4ohwg3g5z7wr4dhvvlqbd4z6nfo2hbzpyo77e6okdp@z5f7hlvyovx6>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-8-a43bd25ec39c@oss.qualcomm.com>
 <su3zkeepxaislh6q5ftqxp6uxsyg7usxmc5hkafw7yn2mgtqeu@wua72odmy7zp>
 <2e3c1559-7da2-4c6e-bcef-eb1e8dfd4c31@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e3c1559-7da2-4c6e-bcef-eb1e8dfd4c31@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a841cc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VDbBU9HbQ_CCQpQHtSwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: l3ByR6oU_pQ3FDbS7NXMDJgMX67ijtzq
X-Proofpoint-ORIG-GUID: l3ByR6oU_pQ3FDbS7NXMDJgMX67ijtzq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX0cFYYg7MHafW
 XIVSc8gsmfxSepjJUyknircWXvn338EifDe/uxWMaHuZEwTFNrCM+cWY1WeG6r+FnoYQgsLfFO+
 EblxEMgEey7Qhrs0jF0pNlwj2dN4Ak8IIUmYOmPp5l5xA/17SHNS4dcJo/BDJc0nZgaCu2f2tCI
 oKQ101VyI1G4p7m9k4DZhSKz49qYpO+kpIvboLqEYTSdcPphFXGg3KP+2ENjZSnJ0R05KQWck19
 MbEhU9KbQmq7cx0ZN6DNyO6DaVvrEAWWsiaCWd1CI7FgZb4bl7A79tqWlBzBK215lWPyObFB8o2
 774B1j3R9vJ1E0ZuZQzv8EpA7YqoUCiX6MRrqY88iA7vsuRAzrWJThxOnup0/i1QqLYAv+OLvxY
 Z74nZrlPargEpDd0u9gFidpIatjhkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 04:43:11PM +0800, Xiangxu Yin wrote:
> 
> On 8/20/2025 7:16 PM, Dmitry Baryshkov wrote:
> > On Wed, Aug 20, 2025 at 05:34:50PM +0800, Xiangxu Yin wrote:
> >> Introduce DisplayPort PHY configuration routines for QCS615, including
> >> aux channel setup, lane control, voltage swing tuning, clock
> >> programming and calibration. These callbacks are registered via
> >> qmp_phy_cfg to enable DP mode on USB/DP switchable Type-C PHYs.
> >>
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h |   1 +
> >>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c   | 251 +++++++++++++++++++++++++++++
> >>  2 files changed, 252 insertions(+)
> >>
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
> >> index 0ebd405bcaf0cac8215550bfc9b226f30cc43a59..59885616405f878885d0837838a0bac1899fb69f 100644
> >> --- a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
> >> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
> >> @@ -25,6 +25,7 @@
> >>  #define QSERDES_DP_PHY_AUX_CFG7				0x03c
> >>  #define QSERDES_DP_PHY_AUX_CFG8				0x040
> >>  #define QSERDES_DP_PHY_AUX_CFG9				0x044
> >> +#define QSERDES_DP_PHY_VCO_DIV				0x068
> > This register changes between PHY versions, so you can not declare it here.
> >
> > Otherwise LGTM.
> 
> 
> Ok.
> 
> This PHY appears to be QMP_DP_PHY_V2, but there's no dedicated header for it yet. 
> 
> I’ll create |phy-qcom-qmp-dp-phy-v2.h| next patch and define |VCO_DIV| and shared offsets with V3 will be redefined accordingly.

Nice! Thanks.

> 
> 
> >
> >>  
> >>  /* QSERDES COM_BIAS_EN_CLKBUFLR_EN bits */
> >>  # define QSERDES_V3_COM_BIAS_EN				0x0001

-- 
With best wishes
Dmitry

