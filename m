Return-Path: <linux-arm-msm+bounces-71611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 369DBB401EB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 15:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A990D188F54F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 13:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9972D2D481B;
	Tue,  2 Sep 2025 13:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVk0WkuS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9242C11D4
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 13:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756818128; cv=none; b=WnJv7QI6KAvgtzCjZl2/hCUULtFWddrYl4jk1tD7BhjEEZahOYaqBCd3ZkWuKtp1PRN0Fd4GerJ1BsjwEOCTFDLYYPiTQ7wCATW9kcBvwh3KR9StNtcidteocHKpUyGL4h1lw4aZb5qBnNylKZN7X36sYHKalAEl5mbDWUNZYXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756818128; c=relaxed/simple;
	bh=3kmKkZjwyDSpW+F20e7OaMntgz7HZHV/pwjTc9DqUwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxlCMhmRBalxtr1Zbatd2zNdFfHqSut4PJWQl5mHcWuhRl+2MwFsdpvSOVxHzUuKnm1aAdm4mjY6NSYNTf8DtZ0VPehHXP97OkN5AnZrfNRnpARgNYrUwJzIP2b74gpzz8NEUF6MPnWt6mYQaqGpCqnl59Mtt4TGLWkRj8yZPFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVk0WkuS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582B2oYt013338
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 13:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DI3pErojxmIjWUczxGnCciKc
	RSBlU9zv3W60qXm0b74=; b=oVk0WkuS9zYpad0XHNNdHabJFeXiPvZUPFdKCJO6
	HMdDXTUACzAEeFOb8gY0swD57tVFGIuhD6oKhMewG4dZB3ImivQ4Ha26EEwrl6AC
	590Zo/KrpPYQBQUc/3Q2ZYrVXCxpHawyi8QepRySbRTKeyp4AHX2bxGHnYAHA+jn
	4kru5a3dBtY97MJ967fzFVD+uWkS4kCjgFIc9IP4/wGMjGypufD4sRaXohBd9wa2
	to2ujfqfFyZb9cwEqcHJApvcd9YrFnBb3Bp41Rs5kqxWi14XHCxB4C+gPlHrHmfp
	EiWbz/xvTDhZkn6oyKOROSjFfXzDTCM08i7Rw8O8UigtjA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2ffr54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 13:02:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7724487d2a8so4261355b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 06:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756818125; x=1757422925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DI3pErojxmIjWUczxGnCciKcRSBlU9zv3W60qXm0b74=;
        b=rOh8biZyvI5dNE+8K0BAL8fRCki+xpirC/3N5H5+AgTqO+P4aMY59ADnRdAz+ff/eJ
         uqZpzoM+bI+soDQ8XwbdxB9IIwCkzYA9y+w11gURJGt9eg0dGxlEQWOglGRXjlWi2xsm
         jEAhiDe5ik4ADNDjUAaACBELu/lWtC0l1hF7hoLf28A+q7bSn5occ0yTN36OV1H3m1y7
         6ct4kpPDYEYX+6KXpUk/EMva/udnnGBXu02sB0KRBQHAdCkUmWiuoiQxiVCJoK9Mkef7
         zZ5jQ1SUHKxTXv73wLel1fVA4wlo3I68GsMtX322IC8ZBbES7qRmQIfH0KGwi3d9bsfU
         mOkA==
X-Forwarded-Encrypted: i=1; AJvYcCVoedSa175QDwk16Iv12B6OjzTeOnSoAtjvNbhd5cG9kDz0YBPTGmT+e6pzZedB5iuKEE+UnFV4zPnMP158@vger.kernel.org
X-Gm-Message-State: AOJu0YzmEYXUWxwQstOszF8TEXz7v+QMeaxKL8OGqhm2AyPYB8xDm4FP
	I8VK6UO7+kRKmX0N4OMvQFWJ1IK0CCQ95Ry2FFM2mZgBeoKlvxwIEIw1TskYUG5878qg0Sc3nMA
	b3U5Jbr6BhQrnoJbSNiP5+xf9iAHUD9hkUaLXgAmG399l9P/ygCyPScnbIXu1DN4xfVEm
X-Gm-Gg: ASbGncvL/DXs2Sf3tIsNILW3kpnS5Y2xQYOZXOQdHrcCUAjg4lP4ea0fIlC5ng25diF
	mHmecrjPnfeWJ1pYP7VseC+IdeuvO0fwOTHsOMU7jlBJXgMzSwpKBZOaZyflu03elceCs3SVQqU
	Yq3U3HWLnk7ZZE/Et/n0qfBcZfNvGDFiFCCGxkHJW2Sp9TbP6T+VUWE264U1IBTV/HESwbrYh+x
	mQXNMlLSIhm1CV5StOTg2ILfdCJIU1/0EOK+gT7vEC2C4Fts2XE3sZgBX/4n452kFXwnWiFq/2Y
	IWQmaQvS/PiHlMMuiiQg2Hjrl0w+ScsvqB/v+EagTDof5nbl5ydcw5plcB8K11Ot1Tc5GPcaycS
	4B9fx20Pg1xNFo9z0gsyXUmiDML+o8XgptEpWSWtlUOx5xeZmQQ/F
X-Received: by 2002:a05:6a20:2446:b0:23d:d9dd:8e4f with SMTP id adf61e73a8af0-243d6f02e27mr13224711637.28.1756818125027;
        Tue, 02 Sep 2025 06:02:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr2WgYJlX68yywgyWjPUXsRjYvXEYtyzFO9iJAKUUUIjy9ijeStIweH2qG+cpUesIk7rFkhA==
X-Received: by 2002:a05:6a20:2446:b0:23d:d9dd:8e4f with SMTP id adf61e73a8af0-243d6f02e27mr13224650637.28.1756818124529;
        Tue, 02 Sep 2025 06:02:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-560827901eesm672660e87.78.2025.09.02.06.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:02:03 -0700 (PDT)
Date: Tue, 2 Sep 2025 16:02:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] drm/msm/adreno: Add a modparam to skip GPU
Message-ID: <zmaphb3douzah5m447naluu7cjrwieb36uznjb7uamblxduira@xhtklqmy22tu>
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-3-f3ec9baed513@oss.qualcomm.com>
 <a701e4f9-57b7-46cc-b42f-f1a4a902fbbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a701e4f9-57b7-46cc-b42f-f1a4a902fbbb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX3SwQyK1ZPoKX
 IBZd09Y95DfFNcDNFxUY6mX+i/H0TwhG6CS6VzYHXmNXxyeqTPNp6MdMT/3/RV+o2Hv2pB+p0WO
 tYynAiEnanBdSGWYo8wXIumQ/3yH1ex5ScqLIBtAq3JoMDMa6OF3kMBzczIroM5biU5gnab9kyi
 olvtXRCUf8iRznD8VBezmJgsCg5F4tbBib4DI3UzzlPSPx1iKzBrDhElI6MXAeBgAgtgiGAAgkY
 V676otJJDfDwpLrAilb5yLjsGUM6nus4AM4C7ikdGtbrijo2g1h8k1XdRdy+pyq888QP9lcErWK
 v75fpVQKWK2EuiJnexIXtOegtYWne8M/BzwGSY3OkCi/y2uM4aDmii8F1QzuKqJbMZzHKSvGKNE
 A28ngSGV
X-Proofpoint-ORIG-GUID: wjFWMF5ceWQ_ilegTCPbAZBNhSrBWqZL
X-Proofpoint-GUID: wjFWMF5ceWQ_ilegTCPbAZBNhSrBWqZL
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b6eace cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=PxnZWOFFpC0IAZjruz4A:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

On Tue, Sep 02, 2025 at 02:30:48PM +0200, Konrad Dybcio wrote:
> On 9/2/25 1:50 PM, Akhil P Oommen wrote:
> > During bringup of a new GPU support, it is convenient to have knob to
> > quickly disable GPU, but keep the display support. This helps to
> > fallback to 'kms_swrast' in case of bootup issues due to GPU. Add a
> > modparam to support this.
> 
> I'm not entirely opposed, but slapping a // in front of the compatible
> in the dt works just as well

Which requires rebuilding and reprovisioning

> 
> Konrad

-- 
With best wishes
Dmitry

