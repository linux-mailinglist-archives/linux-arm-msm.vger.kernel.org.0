Return-Path: <linux-arm-msm+bounces-56598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C197AA7C5A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 00:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CA203B11CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 22:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352A721C174;
	Fri,  2 May 2025 22:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBZRc5D4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BAA21A94F
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 22:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746225815; cv=none; b=uBMVL4HokXPDLu69E6nglLy5wtGc2QgHjH+E7wapUsuCwk5rw7OJ2uJQhk1oqb1VW+p9UK6peVONJM9NmJWnzIziuUinAGstU6PwUpR78XMOQS8llis74F89f4ysjCsJ0EkK+wzJWvKvpzIXWwe5ukZWNA5uwa1x3OLCp8sWRGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746225815; c=relaxed/simple;
	bh=cT8nC8mZfOCD7lTXfvpIEpKdy39UtRQgSpJDhtuMs84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uy/cqEhzMKuf95YXqpEaFiPmAIl8FnqzCr4ZDZ+RJtP4W3c90gG+nRXktyMCVLH1ssdcFX3xfwL15wQ1NhwXq3bkycSxf3l7DlZDS66pG5EHNATdUHqtp/IBmKeZ3N1T7x8x36Eic+7k54nmjtzixYzDEMFPffEO8O2u2vRiwlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBZRc5D4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAtq4009179
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 22:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CN7xAI5RxauZHSlfvB2dYCQh
	k2oKQHJwg6cw+tFAgxI=; b=gBZRc5D4VtIwHTesw8c96N0We8YMT9B1/H4e/S5U
	3oYIKUD8+rjDiCJYS++0hTrSNHQW/yllkOhaeAZk/5CFoPZ4d+MT8AfjwirCgHs6
	keSX1ZnmoOhr/N229UAKoi36p9S4gALDRHCM5wf8i56AOMMRFKn3QibqUPe4liG+
	jtBYahA/Kus2Ldh89xMnaJmhQ2eGqVwNY0yf4LW4/PYI0AMLoeZuXcfoFjbi4fF5
	a9wuRCyDx0X0IZmc4yZX0XnXFyjGine1RWPxsnS5iaXVv4KoIJIedI5EEcgWJqTt
	Nf/GOisGHzNcLKCwGaqC+IhZT6Mx7orcvLEihyJfnaPuzA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u21juu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 22:43:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4768f9fea35so64267121cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 15:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746225810; x=1746830610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CN7xAI5RxauZHSlfvB2dYCQhk2oKQHJwg6cw+tFAgxI=;
        b=lTp930AdmYNF2Z2SWntOBph2TBWlKn3Ab9AFWizlq5zjDB+SPh3+3GP3Zekz8ahEPE
         ogppu5BhnQmptPZIWvkNF16GekT7hjhz/vsrjlefFSQoFh5bGVAJBujxdbus5UbX1R9m
         uD7qgoDBNH4Tet3AuMHGalnJ7MUnAQYTHYTLT5S3xCXGK+VPLKTKe+G9K39pxIueWAO8
         2rHI3p2WiaHft1q+Y2Y9epN8wEksXxKEDaZoukaVbq5MHMDWIyEtAxK4iHBmCWpI4nee
         1aJlEosiU/ruEIiWYn9L+iKSM8ufOtxNsLlT0VvDFP7f0dHFiLR1eE+19Kl6KlLr5As0
         AG3g==
X-Forwarded-Encrypted: i=1; AJvYcCXxNOVIf75zOBZD/iXCDX2Q6swUh7xQvuwqKRBBhDbYo7d4t2qt8sBkRk8jZfb5vghFKRew4SNtmWgujNnb@vger.kernel.org
X-Gm-Message-State: AOJu0YyVP0V5HiYHdMagEtN1nhOq+WMuiaJsULUoMWC2cgsxY39/yIkm
	jRNADZ8Ql9eWwHfkSjJkQ0zLIRALFiZz0Rpl9S9GtNKHRlzKxJNJM3UJ2aZrxFRdHSE5/WSAsnB
	emGPgbhA3E+SuzZmb3d7XnlrbEE9Gegdozw8eJ6EHm8zQXQo8KqNKSAj/mAwGVAQi
X-Gm-Gg: ASbGncuKCgKVT39pAG7RdzMz5VyU1RF/qI75eDInxcYXyYbJfh34Y3c1jw1hXKnoQbE
	ZphowXIUD6Td/n7mju/BfPZoLrtfMqgFxRFvbx3eGvt0cNAleFhEiv3CINu0DSKRHDY464oXDgv
	5qP7LpEiYmuOEt18hvMXLb+KWVknOh+MiwHxzUuWsMDk+F4d9tO+5EDZufPwa+Un9m0Y1x3EDZJ
	v0VPmhFpyFbor4iJ5o0HNgUbZSbRx663TDr6vRLJvhkoA/dlwBKIaq4mrdBNpWQetnbzXvFh327
	UCbau6qxyRwBZWHATR27KD/6qiq1v1emhBqR4YSZdvdjlMVa9wR8HH2fVggZGA1k2vXmnBC0ELg
	=
X-Received: by 2002:a05:622a:5c14:b0:476:b480:e440 with SMTP id d75a77b69052e-48c31a224a3mr79130581cf.23.1746225810296;
        Fri, 02 May 2025 15:43:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyDC/ycgAmMGrAX3PIpDNuTMextZpMxyJBxhg9RzguKAZ/R/C4ebf5Fg9mF7ewzlpaMNVwpg==
X-Received: by 2002:a05:622a:5c14:b0:476:b480:e440 with SMTP id d75a77b69052e-48c31a224a3mr79130141cf.23.1746225809891;
        Fri, 02 May 2025 15:43:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202a897cc6sm5072491fa.70.2025.05.02.15.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:43:29 -0700 (PDT)
Date: Sat, 3 May 2025 01:43:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 14/24] drm/msm/dsi/phy: Toggle back buffer resync
 after preparing PLL
Message-ID: <b3dbtmqigdrazkhlu55r5tzo5w7ixf65m6y56nvqnaetkv6onk@xsakfzc7mmzu>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-14-8cab30c3e4df@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-14-8cab30c3e4df@linaro.org>
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=68154a93 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XEkVnyDaZeylL3GQtG4A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NiBTYWx0ZWRfX4CuE0OS3Ilw/ GnCQn6NWGq007hHTXRi2slunWq6QE27bIPuZXsw7ppHY7Jk/mDblve+7RaV2clyvpucz9Q5h8ss 7luhzqvkuh/7KDrtNE2VdZRjP0kgEzbF6TRiziugpbVMwqhG4iCpvxWa8FdtTbn/fuYE8VE13ex
 G4OVNxGjWtEj6aFBpmYRqDBPgxj7ky8F+KJeYKTiJRTH/GylhWj4MxSv4II76Zh7h4NBW+JlnOL UZvaWzInr7L3O84SNylEXJme98MZQX3lL69jEzZWLXpsTkpOBpE9Fh8vRh1tsqXze3ocJSQjatD rqLggjH4t0U2a/hJGYguClEjy+wQCPygF1UfZ2xK6Bvu+Vt7p4SFP1lOo+YCK5UHXJt85Xr3+8p
 7S+nyuyX9g7PZg9u+x1uJrxleOs+C+gvyR9QU1Z2/t3e6ia6uzjaMl9BuADed5GIGjPkXpwI
X-Proofpoint-GUID: PDYA1HpeUW0KjKINAmXxqIpZmkTk-znH
X-Proofpoint-ORIG-GUID: PDYA1HpeUW0KjKINAmXxqIpZmkTk-znH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=769
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020186

On Wed, Apr 30, 2025 at 03:00:44PM +0200, Krzysztof Kozlowski wrote:
> According to Hardware Programming Guide for DSI PHY, the retime buffer
> resync should be done after PLL clock users (byte_clk and intf_byte_clk)
> are enabled.  Downstream also does it as part of configuring the PLL.
> 
> Driver was only turning of the resync FIFO buffer, but never bringing it
> on again.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

