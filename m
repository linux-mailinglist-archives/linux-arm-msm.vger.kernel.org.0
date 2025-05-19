Return-Path: <linux-arm-msm+bounces-58474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CEFABC1AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 17:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A86E189082E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 15:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E467284B38;
	Mon, 19 May 2025 15:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4J51pG8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B300A280CFF
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 15:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667301; cv=none; b=ncIz59TcjyVk8UZ5cHFZkocJxriNI0uWz+tvVM6o+9nMPMlRIg1CJUdpXHC8J+/TbFd6K43svwjsm3e8f2lq55jFYSzjFTQr5K+jB0XDIuISPwB6/kVCD0c1rVu/4TQE7nDDawerxqbbVPehSX5Qg3yXXovntxVxJtjEdKziOuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667301; c=relaxed/simple;
	bh=ILrvKtqjno8XWN3kqUgdsY+HZftdvQtnAfXlAoTjKFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ninbBbnAj6Sdwxc4gRR0VyBEqi1gjvFGDYQXXmuvLpExQhZIQMKRVjVcZFxicKWTv7/AsuG/bNnCSYqtohOyBuISK4bYrgsfbLCb/wGca1nIz4KeWA4UNBFG6jMfZz/6RGO4T7xcSv2Ievjd9flQqDDUl0SCdJw2Iqey6m/zN4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4J51pG8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9V18V023798
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 15:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pnbK04rSw5LfgSejzbkh3QJ3
	tYtMCLEGOFKCm7S1tuY=; b=n4J51pG8BVZa1SayKI0SpSjmp257mTlLVz2mPke/
	GP4Ws9bG81sl4rgTq/gVV2Qabr1qPr27513kQ4Qr9364x0oL4oSEBbHeJXg3XCds
	8fOo03NrIYOPGR95kIvQzlE/buW2JkN4Y5c7UgiIdGAUXPRs+BvKJyyLbTtPhn+b
	uJOuOg1fBh6vihIbR1syPZDRUJ81nMZzHWucLdijEGSwNfGO6bQCEzXPcmptBYLj
	KvtjpHs4ft9EMQpYmevTyn/E3DC6gIuZgeFCVweO0/bMSvJssF6chY8LOklWV9Xo
	Mct3swrsEpuvpY25JZHecb13xCTn+x+cVimMyLMFVtrkXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsvq3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 15:08:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c955be751aso855402785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 08:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747667294; x=1748272094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnbK04rSw5LfgSejzbkh3QJ3tYtMCLEGOFKCm7S1tuY=;
        b=uSUr7tGDrrZl+Qi/CftP70ped7NlMK4hMHoK0BG+zKemsU6Szlv4oURY0Eam/tuczx
         mk7szXSBz7Pt72iKkgDFF3xKGhlNvrKnOD4Ag+AnE1jLbkFRgvu0iTZju50gvumhFdZh
         HEWy4eEStdEm0u/cx3RVvyhHJymMpwFXP+gcWR9ezjKYanhDH9yUoMW8pXqMa9b2diNC
         +gxLVNCNe396QIgF4Qk7lRG3FlUI6wLbMmaezG2Zu5JEFJiET63f60s1DYl810mSGs4l
         ECk3dgDd9mak43cVGDQydkBxmiKIn3A3WL49Kqif+uLahszwvPFRSKkrz9rGmrkwxhnr
         Q/ag==
X-Forwarded-Encrypted: i=1; AJvYcCUhIf9khOLm4qUVDtvIEF9MnJoPpg/z0c1qHxRexXjH2AyW8lhZmDSv0aa+XYeszSTiTK8XqGIzK9iFSivP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy557cY2U+EDkfZPFkOI2mBkHEjwgdnavuNUnLKnZTwD8N+aU63
	Y5mekXXjhw1Bxp71zEKo6sUydGl/NQkV4A3EL2N95lRKk1ihwO334hKdAu4lyr76Tq0F8+SAs9z
	v7vxtM/a05WnqJcQh31EhLrVj6G6Ycemp2DGJ9v0wzDimH/irjaLzLtNm5EN6G2FzIorLFXJGOx
	qS
X-Gm-Gg: ASbGncsr+HWZz9DVOupGIwbTkpfE3JBQXWTdvXvyTd+2g1VStJZvaIEHaBucor41JHJ
	tygJGUnp9UujWoq7H0VpV+coT9r6qnVA25XiON/GsL/JuhPPkhg36UcX3ggMTUvaxC3SjKRSpAK
	9VDyZ76Ob1hA5gkCG8EN6xIiPg05r6usiVeVvdpjI70jhcup6JQ8yopRiy0UFfNcOvAZUf02q8d
	ORkw2hy8XHZcSEWPDnAaGbV5Ud+O3e/7eal00sxkz7OKwHYKB/Tk9hDeQAt6IDYj4ycDMeag7Ol
	XYB6DvlIoBwdp8nDNNTZlS3YRX9+WwYoogYMUa4bg62lZwyZk8AMrLVT4LrrBT33Y3IJsfUzKqM
	=
X-Received: by 2002:a05:620a:4593:b0:7c5:3b3b:c9da with SMTP id af79cd13be357-7cd4677d5bbmr2280742685a.40.1747667293824;
        Mon, 19 May 2025 08:08:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS7ZI9iTUTS3skWTcOcofhzUOZ7bKXIr+bJqh1BroaJVamHikSdw6gyrDyo62FkE6ExDiHnw==
X-Received: by 2002:a05:6830:488e:b0:72a:48d4:290b with SMTP id 46e09a7af769-734f6b88831mr9233068a34.26.1747667282670;
        Mon, 19 May 2025 08:08:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085f097bsm19317971fa.110.2025.05.19.08.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 08:08:00 -0700 (PDT)
Date: Mon, 19 May 2025 18:07:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
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
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 00/24] drm/msm: Add support for SM8750
Message-ID: <pbg537yuu3sy2ueho5gcfu6cuvgmkobzgvtfemghvp5w6errtv@f4gbobbeqosk>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <75f503ea-e8cf-48f3-b39e-388ac456821f@quicinc.com>
 <24e49307-7d75-4736-9b5c-2e6286fe57a3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24e49307-7d75-4736-9b5c-2e6286fe57a3@linaro.org>
X-Proofpoint-ORIG-GUID: usVjKx1bQBDdo01bpy9OqMUsNV1W3zf6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE0MCBTYWx0ZWRfX4IDhvE2P/3j4
 5gCD7sWWXCrf7uVxf6HmGXIXlCqewwIjIWUB1zi3w9+rFt83zEVUQ7ZeH2miSGHi6UWG9kKtyVv
 uNH4NVhRuCJucJzqz6aE+toSX6lUgArU/w/ixGkaYETMU/9d79dZj3IVBMbyhUVTKcL64Q/qQgL
 axuk9yIPotf45I/vH3vN2+P7F91A3CrpW7AHe1tY6+MXtlcvUMJR9rpaHb4PLXmDOLR4uw6UEoo
 8fIVS1yspoThWSAQ+dD8UikJbCMjQomkVcyScwlnNg+YQ2kixiFsEM8YDkEh6NtQ3OZXaA32ts+
 5MJrLWcUPaiWNn61FTWhYkX6OsljtRItxwR4p/3c2JzMK2TwEWvtNB4c63QZz5bRmiabtg4saNi
 Qr1uRukzi/RcrA1tli1VG8rsWhK4tMce8GjO6eyLRF4Yohza4xQkRjBZ4k+e7LVEuxtj7glT
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682b4961 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=mreiCzLEixqGZhZwl8gA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: usVjKx1bQBDdo01bpy9OqMUsNV1W3zf6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190140

On Mon, May 19, 2025 at 04:52:15PM +0200, Krzysztof Kozlowski wrote:
> On 17/05/2025 02:08, Jessica Zhang wrote:
> > 
> > 
> > On 4/30/2025 6:00 AM, Krzysztof Kozlowski wrote:
> >> Hi,
> >>
> >> Dependency / Rabased on top of
> >> ==============================
> >> https://lore.kernel.org/all/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org/
> > 
> > Hey Krzysztof,
> > 
> > JFYI, I think there was some discussion on IRC (specifically #linux-msm) 
> > about having the feature bit dependency back in February.
> > 
> > I believe both Abhinav and Dmitry agreed that you can keep the changes 
> > to do version checks and drop this dependency.
> > 
> > There are still some ongoing discussions regarding the feature bit 
> > series, so this way your series isn't blocked by that.
> 
> I was asked by Dmitry to rebase this on his rework. That was quite an
> effort. Now I hear the dependency - Dmitry's rework - won't come in and
> I need to rebase back, which will be more effort. Can you all ack this
> so I won't be needing third rebase?

Please wait with the rebase. I still plan to get it in, it is an ongoing
topic. Anyway, I think there are several open issues even with the
current version.

-- 
With best wishes
Dmitry

