Return-Path: <linux-arm-msm+bounces-74246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A27DB8AFF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 20:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9D4D4E7584
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 18:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E229E23FC4C;
	Fri, 19 Sep 2025 18:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RodICOPT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407F3262FD7
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758307838; cv=none; b=tOzpctx2WhEB42NJ5gq5Ka29o3eUQKBzj9o20PAMfSTRvx8YzYLwCm9y4MAkdnhSbnL/XYgYHx21Atbf3MMwDsyLm1fqi9cmRXclLbKYn5VwQgzb++ryY/tUV9Vqw7qbNKIOvg2+xLj4qZySgRF90x4ORTmrTPjWXpAJ6jFbZiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758307838; c=relaxed/simple;
	bh=GH48vQlKxHp1FNXHWxP0jWvh3YRMVUXRARdfvGi/WRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apexKzjuhr6kmnsovDJki+MZrv9yc64HsZ/M2JhS+GnnEjUrVOzk30A6Rs2Rq6NxLFHhkN6w3ZXY6dQS+Ve3eZO5Zfxp1M185SP6W0PW1MEQYszhgE9ceIw9l2vrl4uHxJ1mKp/pcuMPmEEzHvSoX9AuTLtvAU2rF/gsKuHIDBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RodICOPT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JIMNs9028314
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/zVetAH60xiLOOQQabWXMY2i
	CJqLvqOL6orH5OLF1Q8=; b=RodICOPTncKTFzokmFCdDNVaPBJJd6jTyD+ULkYC
	AgRUa2FVVGtGArGXg1DMC62vrdl8/5pxLVdSoHAsbZnuN+DeRZX83Jqb1GPzcTxr
	J1IHk38SJ4JlTHMBE7vJb9Nzz1w2IUfat+WPkiInnAvzev+8IGTWghg65ZKpcTfH
	+VpDg0MGjOnwUd1obLLgo2mPiGn/aShskL7qec3qnHXS2ttLvmbAF0UJws9swRnW
	OJsWBVvH/Jl4jfDjX3Kv6cJehSWn2hprDacPkGnw5GX0nxq1dHTIzj9zoGA+VYBY
	kb4PyzAGIArZkEH9FbNIhatiH5y/DbWkVO854H/++9QDFw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497v1jhheu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:50:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5eb7b2c05so49298741cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 11:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758307835; x=1758912635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zVetAH60xiLOOQQabWXMY2iCJqLvqOL6orH5OLF1Q8=;
        b=jC0BRBotMgA+JtZwIwGPbwb5ggO15+Nj5kw3tULD/z8SEfR7ZmpmxVeKFVxJBfKF4H
         +njHLIc5hZULp4mJo6hPzZiIrjr65NbMU0VX/60X+mtT/FJSp8MzYivLZZzrne4mFg1n
         0QW3JtzieNIh6OtVXVDbn0MIKC0A3y8EWQV10UGbm2lskg1rCinfrACli2kXlgkzQNar
         odMryHO/+Yv0nawUF4VBGkQWKd3KvaGLJ0DPXMeW6gjT/7ImXS98bkWaQU4cNBW4VD5P
         ypoyQIn/+bzJFuokAm31XFuEwSZbCFISHWz4MJbroqC6Q20Ac751Yg1KTzCwIVQ6fEns
         M9IA==
X-Forwarded-Encrypted: i=1; AJvYcCUTAtoL00QZmyO+iBxha0zCA3cRcWAKQxIEQs+HZCQ9NzcsUnhPpw5oQD8CbxAf1Pzp3WX2ypnW6P3EUNeU@vger.kernel.org
X-Gm-Message-State: AOJu0YwbNCQX1mF2FVqAryfFRQkiHuPKyM+Dm/o3ElAXUgCSbJZjjsJl
	aJkITEV4kF/w93uCYoZpe6BPkxCGxF9u9H5Dyjm49H9P7JQs0QhROLvBUFsgRtkKnon4nakVIY7
	XmD99TBCfLIKtD5EvlfPgInjVDcgims2C4Ggt2PW/TxqlS3cFU3w6kVsLMEI0EPKVvoLN
X-Gm-Gg: ASbGnctqP7mfGgXPJr/wUKSiMq+RtLRT9an2NDiGfYy+3vbBpRzeXC5dj2YMHge6Sne
	y6hqp5NFnwsaqzPKAketXV/vPV/JFACfYPnCwdGSmvki6Dd0an1fRhvM9lBf1Yz6QiNq4czgntH
	6p2h8lqzbTB7Uus6k5nJN9y9qRjvUlMdPVK5/FyGdoCOjTmqVTykdwxrE3o44JHsDHq1YulIY8y
	5LpXFSZPBfbkLcR3VAP/hUfpMUieYsozsfDitxA3rOXYxeZI9L3lThOwWl1KUh7X8d+yhnJyiMz
	UoZYOjJRwQTb7sR91VWlC1Wfdwfv/HVeEKQpq+9txWHAc4FLu5R4/zcnVfSwhlOogfP0eRhDMjn
	KfFMAS26WyOmUr3GXrdEVgyUobgmZJ0z13qIM2TQDaNhfwVNQ31aX
X-Received: by 2002:ac8:6906:0:b0:4b7:a92a:fbe9 with SMTP id d75a77b69052e-4c074a12ea9mr50089941cf.60.1758307834878;
        Fri, 19 Sep 2025 11:50:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHvM68mI4vWxxDdRyLwlfnUEBZv557Y2SOJBuuYk4+sFrbV9HcLthdAsZ2WBw6KM4yV7CgEg==
X-Received: by 2002:ac8:6906:0:b0:4b7:a92a:fbe9 with SMTP id d75a77b69052e-4c074a12ea9mr50089361cf.60.1758307834048;
        Fri, 19 Sep 2025 11:50:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a1e07947sm14292821fa.12.2025.09.19.11.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 11:50:32 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:50:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v16 00/10] drm/msm/dpu: Support quad pipe with
 dual-interface
Message-ID: <ibmp5mztq6ykktbtbhhxwvejwtaznr3m32u2t7xz3ujo5akkc3@gvdzchiu47hd>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <lkpcsed5wkyztbysmiks5xk3ojr3dw74ef65cpoycclxjmbnsp@5adctm46fc3z>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lkpcsed5wkyztbysmiks5xk3ojr3dw74ef65cpoycclxjmbnsp@5adctm46fc3z>
X-Proofpoint-ORIG-GUID: kgiWhwSvwz7AqOaHfsmQAvuXYlsL9Nei
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDExMCBTYWx0ZWRfX5ZRkLGuHcndt
 AobvdCdqYsanf4y7/fxVHc0quO67jHFisros6L+eDME5ynDQZDkJolwOQg1MHMLvb6vSZbNc4+O
 6f8tmiZ3T3By0bCa6k+QocqHNd36VaW2g3B+T+nhF22M02Lqi8w39IBKvGojK5pcUVvmUodIEey
 j7alCofJQ3SztI9Dkj6yxrSSggCIHhrtt3uSkUcu1xv/uRF1R2TJRcxAHqidu6RzaNn0kVjq4aP
 RCs10s18A5fLPn7Gvm0Gy8En98g8ZPd5w8WnAq/5mLElk8Shr4tr3RK7yPfBPAuHY0EQqt7bWIY
 on4m/I0HxB2cuxtxqKxLqSseH3dMen+H3Y8vNUafekvYzCGgVaGDyWPtvmEA9brCXdh2cTQU14t
 Pd2F8QuE
X-Authority-Analysis: v=2.4 cv=AeqxH2XG c=1 sm=1 tr=0 ts=68cda5fb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8
 a=TzENwY7SnjuQWjFngvoA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: kgiWhwSvwz7AqOaHfsmQAvuXYlsL9Nei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170110

On Fri, Sep 19, 2025 at 03:41:56AM +0300, Dmitry Baryshkov wrote:
> On Thu, Sep 18, 2025 at 09:28:52PM +0800, Jun Nie wrote:
> > 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> > And 4 DSC are preferred for power optimal in this case due to width
> > limitation of SSPP and MDP clock rate constrain. This patch set
> > extends number of pipes to 4 and revise related mixer blending logic
> > to support quad pipe. All these changes depends on the virtual plane
> > feature to split a super wide drm plane horizontally into 2 or more sub
> > clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> > whole drm plane.
> > 
> > The first pipe pair co-work with the first mixer pair to cover the left
> > half of screen and 2nd pair of pipes and mixers are for the right half
> > of screen. If a plane is only for the right half of screen, only one
> > or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
> > assinged for invalid pipe.
> > 
> > For those panel that does not require quad-pipe, only 1 or 2 pipes in
> > the 1st pipe pair will be used. There is no concept of right half of
> > screen.
> > 
> > For legacy non virtual plane mode, the first 1 or 2 pipes are used for
> > the single SSPP and its multi-rect mode.
> >     
> >     Changes in v16:
> >     - Rebase to latest branch msm-next-lumag.
> >     - Fix IGT test failures.
> >     - Drop patches that have been merged.
> >     - Link to v15: https://lore.kernel.org/r/20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org
> 
> Thanks. It's too invasive and too late for 6.18, but I've started the
> test run at https://gitlab.freedesktop.org/drm/msm/-/merge_requests/191

JFYI: this has passed the IGT testing, so it will be picked up soon
after 6.18-rc1.

-- 
With best wishes
Dmitry

