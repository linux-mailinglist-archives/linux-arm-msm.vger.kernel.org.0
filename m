Return-Path: <linux-arm-msm+bounces-59600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDFBAC59FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 20:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BD69188910D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 18:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF3827C173;
	Tue, 27 May 2025 18:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDO+A9d8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DE826A08C
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 18:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748369897; cv=none; b=gNpwG+rKxSXkbrphoxk0AIQIhJXynPb2ioC/ZoomXzFsPA9sLvz5KJTHx5XvavZPQaRaczs6zWu7t23i+f69i0OU6y+UNhaAb1XuTCKRYzOQL/qedC0N+Fzm2BEQCSL2ur0YP+6PjgRNR9Lw4X4VpntHmZ6DRkHD0IU/dyGTIZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748369897; c=relaxed/simple;
	bh=YpbGPLy0FhKibJxBQ1UKHzL4fvYwX6zXmzNtF+S2JYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXPXv4GIjAdEb7VRuGUIuzoKtKui0hCtxilHrQBluAhJ1yfD66ZNsR0YGEqkeLgdu5ftCsOzFU2hDjJP45q7+dw1FfRUpX5hiAYoefuG4V+cXa0Abmprd3XG0ylRkYomLLwB+S3jDfZyG2CQcLTzYODhRcBcPmoKM8Xv2BmwSvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDO+A9d8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RIBrsN002117
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 18:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TJK/No0r5bmIrq7qKNYSje+ho/5oIJXFTmaB6JBNteM=; b=oDO+A9d8kppoieny
	ZhcsGWMELZvAJW90tQ1UmkksiU65hFPRSg4HWllxPz4rTTi5OdO89rKMzy6cq4Mp
	CMevBZ23UqM59R86BC25+r2+K6452YHByy0u6lBEaWNlY3y2qK3/D4RywTY+qzfz
	xBBVS6EWCPQHIGw11lHDHDRR2Y/NPBkFjUDuCx82kDKqR/cX3QtpvpIirImn58V8
	O8gFoEUesFa0g6WuYgPcJKMfxnR/nZtXiLUTb7trtDQFxSiO45TTxwfruIOxSva2
	HyKW8VA/Xr4Ua5YXqtnQGES2eJ3A1nCIrIRBltbGLaPnkdWHylYfNFV70wJKeVpy
	Hi/rbw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkshk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 18:18:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6faad1f2b69so30680506d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748369893; x=1748974693;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJK/No0r5bmIrq7qKNYSje+ho/5oIJXFTmaB6JBNteM=;
        b=kmRlh8aNUObuYm5/lqp8lG06/ru3HcIJ6KvhJQ+zYonRU1lKOiXSJuU33+7HPxsPi8
         IW4ewF2VuHO5dA1A6LR0D783/YUJvvACsuuVIl0L3oTeWdlOd7Fc6nl8s8rTb2zLlrZK
         9R0iutR7Rfbg/B4zTXsHHw76z0zKX827qjI2+Gw/jMKz8cg6tDmc8OccRr2MnzY8sd8C
         o/qDLOokP8hrrH8PJoBFkRmWJqEvslZKV5qn1xo6FQVOSnuta/bsRGgSXK8r673hHRQY
         BW1IVsSCeJtgY22jsdL/GHsFAD9K+/+IUNglcxA8dgseoqLvm+FsKwyKjkFqrUbpkVZv
         HHEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoI6dSxfD7xIT8BrwP8+C0yryjsGf0aw8iEJaNuWEyHe/wFejmEWilu2EHcj/+lrUtuMX21PEPsLXt12jS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwjo5JcdyGEM67WZYdF1K1tnB2R4Mx5aVeI8F+4GT6GDyI7qe7
	rxy1vV8+28HmeAHW5LI/qxnp4zL7qTDDRKkh9AVG2OK7me5E+1rYmUhSC+1gjRAEHtorGV284ED
	eif3MjvdN8/kFh0GHAix992d3ZNpZ7RwnF62d6gk26C2pxQ2Vs9KnVI3MXjIaVWBLRxli
X-Gm-Gg: ASbGnctAwHZ7RbutqxBGcQLKDowgICCaUdzhiL9Iu+bitos7bmJQEjhvCuoVLgG38Hf
	i490uDOXJAIRvFpPQMIaTIBu1JH94+rwFp+UiuIptrVKKRFn/fO6XjjHcHtDXaD0M6PYW2vFjhC
	1JTtCXXZm1jcJJC6lBPMuq9/nmQfosei16AiZhbJy69NamUh2octnXxOPN9PIcV/BK4dWoO8qwU
	lZebc32B/i+hjv0+D/BovNrgSWkJBEeJQE7Rc1VDPRQ5Ox2RC0B0cVjNXkNxSYNy8WheHnfHKwQ
	99hIasHxESSHfkVGVKwcq1iWdLYhCdkFCWd8/Nf8I9BeCsHHLJ70qTonfqK7GKUNJDJ3I1NX0RY
	=
X-Received: by 2002:a05:6214:2482:b0:6f4:c15a:6215 with SMTP id 6a1803df08f44-6fa9d296321mr220834886d6.39.1748369893352;
        Tue, 27 May 2025 11:18:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAS6tHMfJZsNl49VnqIOuplxsXW0akPiMhw3zGTdfBngOLfU+1DjVOHBRktmQQvvZoL0P2nA==
X-Received: by 2002:a05:6214:2482:b0:6f4:c15a:6215 with SMTP id 6a1803df08f44-6fa9d296321mr220834346d6.39.1748369892842;
        Tue, 27 May 2025 11:18:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532c01542esm239678e87.255.2025.05.27.11.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 11:18:11 -0700 (PDT)
Date: Tue, 27 May 2025 21:18:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
Message-ID: <kbmqr7gjkd72hgorbhbwb7ttvmecfbb6pg72st7zwt5ogxju6p@itycxk6vriy5>
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
 <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
 <CAMcHhXqDFuo+x99KOK0pQFj-FyTdQoZS_JvehNE2AC_JSoQ2gQ@mail.gmail.com>
 <rvyfkow43atquc64p6slck6lpfsot67v47ngvfnuhxqo222h6k@kdvbsmf3fwsr>
 <CAF6AEGvr_foMVwaE_VSVWLT50cbGi8i3UGwo2e=rORD-1JmTmA@mail.gmail.com>
 <152f5150-30b0-400c-9816-13e4710a4156@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <152f5150-30b0-400c-9816-13e4710a4156@oss.qualcomm.com>
X-Proofpoint-GUID: xIJ6dRZCkZ7-Stm4OS1JjtFwd4Jp76w4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE1MiBTYWx0ZWRfX3nwBz8XuFcOl
 6tW5IJnY8DQaFLROmCi5y+wfsbDW02vnDOHgxcTo/8rM1W5TRLzWf9DuifQXq0h8DRvhcWTJtsl
 8tiaWdE+z58JVL/zx40pBDIM2DBOCUhFas+NM9bPpvz2FpQ+PYJ4lVuNFcSD7+Hl6EKjxjdM5rB
 nmDJ7xyIvzj6A87f5lp0MYQw6G+FDamTuINAiMquW10AmqtdV0TtrU5QR/75sQM5PABHRXeISck
 9V3sAIcSoCG2U7e6ET3GGQkqLsMaPQE7Nq9vwn/lRT5+bKsWN7zh5TMjI1AubGjWVxfl2F6bn/W
 TT27ds3T0TmdZYeTgHaDA8wV0amFM7E8YC4gzP+BiLtfbZCjUE3ZxifPXalaBiUpjaLe406elw4
 uwQGe5BDuHobmzAOtpYhH6WvR9jL8CgxsU1pkM5+0FP80GvTcX/23vRIXjsf7BElIh8txRfG
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=683601e6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=J3uWmJ2zRmaukYy432YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: xIJ6dRZCkZ7-Stm4OS1JjtFwd4Jp76w4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_09,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=810 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270152

On Tue, May 27, 2025 at 12:55:06PM +0200, Konrad Dybcio wrote:
> On 5/26/25 5:28 PM, Rob Clark wrote:
> > On Mon, May 26, 2025 at 1:36 AM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Sun, May 25, 2025 at 09:43:36PM +0200, Aleksandrs Vinarskis wrote:
> >>> On Sun, 25 May 2025 at 15:33, Dmitry Baryshkov
> >>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>>>
> 
> [...]
> 
> >> Yes, please. Don't set okay status for the GPU until it gets enabled.
> > 
> > Drive-by: Shouldn't the dtb describe the hw and not the state of the
> > linux kernel's support for the hw?  Ie. if bad things happen if we
> > describe hw which is missing driver support, shouldn't we fix that in
> > the driver.
> > 
> > (In the case of the GPU there is the slight wrinkle that we don't have
> > a gpu-id yet so there is no compatible in the dtb yet.)
> 
> My two cents are that it's okay to enable it, at least in this case..

That would most likely make display unavailable as DPU driver uses GPU
as one of the components.

-- 
With best wishes
Dmitry

