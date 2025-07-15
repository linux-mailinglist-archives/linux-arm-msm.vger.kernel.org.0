Return-Path: <linux-arm-msm+bounces-65062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1008DB0629C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 17:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D937A561B22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 15:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15A0211A19;
	Tue, 15 Jul 2025 15:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElfxlvT0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A5D202C49
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 15:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752592341; cv=none; b=DHBgPMrrOQLZU3TG7hYR0P+UPb52qCEg/iu5lqgpuelhQKDJdlqWXp889o4G8B3RNk3k9Ds8OgCoEXzPdiGAR1DzsMfcCzI0fG1AtEshkvxuV9YOFFyRcWo8RDpiW5w3STVGVLhxzBL6/X+c7uwiunlNiCN/TPe/2hICOZF7n/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752592341; c=relaxed/simple;
	bh=C7Bt6ty4O6b5hObsfJEEwxiNOyTN1VXF/4lKT7wSu18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8MUADERqEucyVS66wnE4IEWd+cfOYGP2Dv1G/ZD+Ptxy8YpwuNTNcmKWnH5dvYwJrr9HpiXDSRFGwfYV6J+ZfoLMFBZ0hXDSdgGx2qzvS+vT1GtkwTIWn4HHQQrpN365bI6QWit5D5kCWtniuNT4aqsgshCMBxL/b6E4LrBJHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElfxlvT0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FCjFrx007463
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 15:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/8/GQmYozt0hkVdJKNP3dY4c
	27MmXYLwdf8DyqAf4/8=; b=ElfxlvT0VzYDBYqLPcqcx5u7gpdJm/0FYmMwnBnG
	y+B4eho5GQ38s7gyWa5V2do3XLCADnVdKyNIdYEaRxCT0C1n6voidTAPb/dJ8PNM
	cQjD55+s9FTC8E0DR8gaP1UR/8u1e6FZJsdhUG9oFq65KyWJvm1FKx/OIVGZhCDY
	GqP34VrlblGX7kQjhS4nxUIVXBXKFZ9NLggE072UbjrSEaUUDqK9bPvusCTM1sc8
	TYWch1G+ETibhGOgFvTa8N8/FWEZDaZpp8bAT7BoxZ0ifVXNJ6WcBNJaKwt99/uv
	EPvODnurcR0dUiYP2bhTrorQpVZq/UucSCwyWS482wIFPA==
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w58ykjtk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 15:12:18 +0000 (GMT)
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-875b64cccd6so1073901939f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 08:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752592337; x=1753197137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8/GQmYozt0hkVdJKNP3dY4c27MmXYLwdf8DyqAf4/8=;
        b=cdDXenHR0p8TF6tCaDvYMN864moPs1oCc55DcnH1WKEyfQ/751hwfH5jypzybeeMep
         sTmPOduM+GOR+ARfjWfBrZrX2jjA/ravFg1m5J1ZXM1k9AmnsKtKKu+uZfR7F9imMpiF
         sznjSoGs5gMveCS97j9BqY0SIMjUA88OSXktCRnR5QYHBwbp4NhIthZvsRRKQVW31O8L
         9UEd4/JZZYGUKu9FA1NcMHx+gil+SQ6ekOS2zwqpZ9/3VujdJw7A4jUcQ9cLHcNrIKGe
         wRBlXDo765fO8a4Fm7gqFsxyiGR2IaN3WG8FB9Q1/OKCiILfjO9qRCoUdUzmRTKDo6I/
         wGew==
X-Forwarded-Encrypted: i=1; AJvYcCU8rwWRjJkJFSZyZzrfA4i6ZFjtMWlex97RtCclcoR4WbZakU3Xh1F8C3HXcwVZBF7OHg3x87b9TtnLZL+K@vger.kernel.org
X-Gm-Message-State: AOJu0YzKpBVXeFMNc8r/kyueJ7jIoDI+XfCwIZOjLlnXIPEn3pbBx0KN
	7mvhI9ARp7o9JWRsvZA1OjntWFboPWInVHEykRPHsfY3zi6LUVRuiTy8ZWh52CvWlSoFjsjvMFX
	46GUCEq5/ds5rRUZ+lyGXwaYqvWZQbuLwLb9Ym4HWJUnsJHScCRA1Q+4iJxyDTrdvffts
X-Gm-Gg: ASbGncsokkvBm2/Pmt8dvfQJOzMTaCuN9FQ9vFdK7uq6C3SwyDipKRcuG2hKVTH/vBi
	Xj4nJfIca8ah1MdeyBbaJZkOdIJrCwdR2n2EfbtQ3iA99A/ep5F/KlBVzWuYmkpAyy6XHQdzvWI
	/TlILChk9LmFs+B0luqRb7lYKVsrnb3wGsFrwG50ylRbEt3Lh3zOGi/g4lv4wAN+4xjgUZC+YTF
	9n6WE1ouLbh1K1c0A9CNESZ8aA9heTNlkU1Yg49AGIAh4iBOliG6yNGz9DQCGXFTxCDx0qTM04F
	xA/f/vBCDoL2mC7dmV2hSdnh1MKDtb0DmYAylqJNrIsDz7uRVpaXeXa3cTZm6Pi6U3ukj+CO7BF
	waT8u/L2Loxmj2X85KTKR7zcjLlRl8lVc7iLAMQ5oxqouPZMpsOit
X-Received: by 2002:a05:6e02:b23:b0:3e0:5042:6a0e with SMTP id e9e14a558f8ab-3e253317f2fmr190550695ab.14.1752592336618;
        Tue, 15 Jul 2025 08:12:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuCcHGzu/NV0coaNVvZvnyxMM3fWdvavBShiCcBGZwVBVkpyKA9SgxNyTJ8HCuKA2VAmYM7Q==
X-Received: by 2002:a05:6e02:b23:b0:3e0:5042:6a0e with SMTP id e9e14a558f8ab-3e253317f2fmr190549775ab.14.1752592336031;
        Tue, 15 Jul 2025 08:12:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7f380dsm2345658e87.83.2025.07.15.08.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 08:12:15 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:12:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll: convert from
 round_rate() to determine_rate()
Message-ID: <tkqu2zt5yulnngwvda462fhmkmtmtjnwieruel6lfjr475h7ld@47goit7jldgk>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEzOSBTYWx0ZWRfXzS70x98NnQqb
 f/ugkMcAx1xUIyZAoyfddkdRzpAqHmM2B38AMdITsLGn14TwH9AmNYguNHFUwn4Kie1v/erNB3t
 /L64i+DyP5e7nb6/8YkuYvx3yIqvSi0KODrjJdXhZLUoYAm2rvYvKJioBAitKoJFeuPT39tEp5W
 8+TaJF+3sTSJuhz3lzrCv5hsP/Joy+5IioG7LaE3L9lLKeC890n6RUfRQn0U7WHCgx//ovYwwir
 q5W63sUqeaVSBPyw+Bef9+he5J/gLuxPphN7AU+vaCoL9Ceo1CYvmjSZzI8liDWFaKIpRhoVcV5
 wcXN8N+fNCZLvfWshBpTa2v/n+Kt2W1cCXKET2hLIO3H+psditJ09RL0RvH3JL0Z5dJRt9FHhAr
 xOenbO8PJaOSeos+4NrfffLvwcSRk+H4xZ3CiGH2pLchOxHKg1LXrDOv4/1F/2VGVaWcbY+x
X-Proofpoint-GUID: aoEpfL7of7_rEsjxWqxDVEfJ0t6P1tLq
X-Proofpoint-ORIG-GUID: aoEpfL7of7_rEsjxWqxDVEfJ0t6P1tLq
X-Authority-Analysis: v=2.4 cv=Or9Pyz/t c=1 sm=1 tr=0 ts=68766fd2 cx=c_pps
 a=WjJghted8nQMc6PJgwfwjA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=CtjknkDrmJZAHT7xvMyn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=958 bulkscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150139

On Thu, Jul 10, 2025 at 01:43:04PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please take this via the drm-misc tree (I assume the rest is going to be
merged that way).

-- 
With best wishes
Dmitry

