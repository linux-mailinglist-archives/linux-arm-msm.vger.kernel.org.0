Return-Path: <linux-arm-msm+bounces-59046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BCBAC0BB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 14:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A006817D773
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 12:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E968A28A705;
	Thu, 22 May 2025 12:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jchA7C/t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD702135CB
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747917543; cv=none; b=fwa5HQY64Ik4hOZ1AJkF7sgJ+eiPvnG52NqEXvNARyoIUMZE18HAmA1v7A8yV1+6Kbhwq1e8+0CLcLum88N7o8DYDuBSRMxvBon6uzJWs4dVneDPQSWmppCjONcGwuTcV5l5R7WVpWL9z12AqL+mYb6DArcX6BQFH1aXt9yNHM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747917543; c=relaxed/simple;
	bh=4c8mk08wS+a0fMwgZ/S4wDHT+5UGah9pupUgAADD+9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIS4YhC5vGMx89sJHNhSopIKX1TnL37WjY77sD2B6akZWPrjlhltoMMYROLJWoKvNzGAgTp3+luSkbDBhkIHojRrquT14gdgUElC/MsPax5xp6WyRjJH2Ya2FJJXEx3EkluZNKwNKuCvweZWkjE/GmpZ/MUkM1ZFrpJTgATUIA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jchA7C/t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MAG6f3032586
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=19244OeHzQNxf5SDPlapadMw
	0CElU62/QrqnAm04GGQ=; b=jchA7C/tYzQs3FSMKQFxdC+2jE3n4zIlVl/HdbX9
	n8tskfMryHGAmKxZ6NN8UAkxanofJJ1VJnP1CthR+8hAOE3UosADh9y9xCNSzMYk
	j0kZr37FN7+gTunVFYJu7rbofO1TOObyb0HrLl+tdJFy8wBSZ3MOhF/G6v1+iLOm
	h/arkBxRSwvR7USQsmLjjupau1ElYP7fqal2xhnEy00Dkqa1Bylmjz8VNkk48wsZ
	BAySQnq/YOExshiMcnDGfxX80OFBWRSfB7VHW02Di04MnD4abWSuFEzvy1LlP/lX
	pki7Pnd6/fAW8sv4iQBCRvzzDyeyYHF0ZJqBP+gUeTpVmA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6x839-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:39:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8d448a7f3so80984436d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747917540; x=1748522340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19244OeHzQNxf5SDPlapadMw0CElU62/QrqnAm04GGQ=;
        b=oNEx/N0FOBjeRnpjU1yjpzdKWAh1cnrKJ3VHx9JW5RpvMKvJBXfYQmsdyJaBaXV9TF
         +A5RLJZanjevrU1czpU++REtDsUm2efcCPpvo5Z58s0YxgYPHZpEtzfw0w9E8f9vX5j8
         JGPFgW474V5+/VAoQ4uzIKwQjLZPx0n3ww3dzB49XHt0FvIoLp/NjXbcefFANdbw+S6Y
         KP1VJpC/jz+//gMgcRK6L5jl5PgI6IZ9dLlZeCQAM+qaSPMW2as5LNfA20AFlRpg+C5q
         Ec+GJd7O+aFNkB6YoF3My+N+hSQ4sNGu8rIFkI7tcLTOryhfbmjfgFfnWUlSOidGJF8V
         qYKw==
X-Forwarded-Encrypted: i=1; AJvYcCUVg0lmYWgt+9taY9BkOf9BIwnzwaDH6A54ta7YbV5AVzhUw3vvzdu/3QItjp5pOAst5uTerWGcx58jxlOz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9hNIhALo6oRjjinckdVosf/cl4GwyvpayE579bRvcEyoaUli1
	RSbPFcFh3DtB5dI0K7AKbpI2nZ7eOim3zieYbjsOqqTkyX13CdBxdinAYUvMq1JoKSybKVuBwNk
	Ct4/T02mkNaCnfjFIQxEHDtU2efLSlG6LHSsT1SzmKgd6CBw6rSVEa7+IfmgI4hbQ6fAJ
X-Gm-Gg: ASbGnctluHEqAu51d/PHmChFxiD/3q836xDRMmBGz2KtSTtRdFsc8oV9RGY2lpquKRB
	914FPGNTJwotu2tIfeVApiPe3YHqLTwckTSLZyYXcRFoucD00sadA0NP7IsA3PjKIre2z21EB8x
	LwKBh5xuCtMGVDt2eQPR/A6Znn+xyW+KZnwSGNXxccKZtC+0M3mStiCej5oB3occoR/EFp+Pg+8
	LTNVZSePaP8bnAKdXCvVr4U+fVAoKHEuowW8PiqZQyy9XsvKetOWj3RLzwAFBh7s/ApEWYB9TB9
	w68JkhjD2yqpuO3gymQXPb6aUHH1mv1LHfh7jrKdWLoAcbTcN6OTYwyDFZiS0sMhmspt0sb6RWU
	=
X-Received: by 2002:a05:6214:14aa:b0:6f8:c23c:5266 with SMTP id 6a1803df08f44-6f8c23c834amr265730936d6.3.1747917540259;
        Thu, 22 May 2025 05:39:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt3dD1d3o6Uh9VFUBMuETCUX8JC+Gh5YdI+vMkCsFQ+A6CYWX5t0w0CnMrGeqa/WbJpReveg==
X-Received: by 2002:a05:6214:14aa:b0:6f8:c23c:5266 with SMTP id 6a1803df08f44-6f8c23c834amr265730536d6.3.1747917539880;
        Thu, 22 May 2025 05:38:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084b6c7csm32876471fa.2.2025.05.22.05.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:38:59 -0700 (PDT)
Date: Thu, 22 May 2025 15:38:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vara Reddy <quic_varar@quicinc.com>,
        Rob Clark <robdclark@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 04/45] drm/msm/dp: split msm_dp_panel_read_sink_caps()
 into two parts
Message-ID: <smj62cjqy7ihd3ywnvwkqzczlg7op4rqy3yrwlibjvouqerofr@bnlpwl3j4jge>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-4-f8618d42a99a@quicinc.com>
 <osctzl3bgutcjt3hjvgxaq64imn2i67hagqm5slfozf33tnj66@5hlfmqmt7if5>
 <2a54ffe8-8e40-49f6-8735-96da47e1bbc6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a54ffe8-8e40-49f6-8735-96da47e1bbc6@quicinc.com>
X-Proofpoint-GUID: VPGt1PhHuB4nQiZiz_RAtRKnW_0LPls3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyNyBTYWx0ZWRfX6Cx/QRqgvY8e
 FjvKd9OrvV6GZzAXA6SAoi7veMXm8EZxVk0+/aUBIQ2644HfMLFe0SLBXiXjOKfXbKpdO3/+9Ee
 fnitdBNlK/dGJB8VZy8Ztr7yge9yr0xGDP6FBHU8U+z0hhDlUnuYEeoJUYv8alZMuOMe0yMlhvo
 U4voguxoCckG+4hLccfCZjz8QeKO2zriSUSEXHqoJ8jr9y7xv8gXc+vQ9PPhIfSZYafGzUuD8oJ
 VojnpE9qpJo6PErEZR5+gP+FB2RSQLOcwNGwOXMOI5asYRuTyp7Xd5DWhUogY4cbamrSN0JhBnL
 dyRV6EFtwrUwkONlk0Ev19jLhtgAjC/8KB3/k3HxDw7AMc6AwbXcXwabsLQhdaKTfmgRK1PQiyi
 w8xFUupDkQzQOWYlcCz6GIqInbAbQhRG/MtMOJV/9fjUXex2DNpqeioaYKhxDXKfonFcERHB
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682f1ae5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=YGB3awJd4VowHVBKth8A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: VPGt1PhHuB4nQiZiz_RAtRKnW_0LPls3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220127

On Thu, May 22, 2025 at 05:51:52PM +0800, Yongxing Mou wrote:
> 
> 
> On 2024/12/6 16:51, Dmitry Baryshkov wrote:
> > On Thu, Dec 05, 2024 at 08:31:35PM -0800, Abhinav Kumar wrote:
> > > In preparation of DP MST where link caps are read for the
> > > immediate downstream device and the edid is read through
> > > sideband messaging, split the msm_dp_panel_read_sink_caps() into
> > > two parts which read the link parameters and the edid parts
> > > respectively.
> > 
> > As you are touching this part, could you please refactor the code
> > instead by dropping the msm_dp_panel->drm_edid? There should be no need
> > to store EDID in the panel structure.
> > 
> Hi, Dmitry, Abhinav will be leaving the company and will no longer be
> responsible for updating and address the comments. I will take over handling
> MST patch series. Regarding this comments, I don't got that where the
> drm_edid should be stored. In MST cases, where multiple panels exist, i
> think that there should be a separate drm_edid saved for each panel.

Why do we need to store EDID at all?

-- 
With best wishes
Dmitry

