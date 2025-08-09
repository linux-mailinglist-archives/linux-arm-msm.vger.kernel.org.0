Return-Path: <linux-arm-msm+bounces-68170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7A1B1F33E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 10:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB2E7189C02F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 08:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5B21F8747;
	Sat,  9 Aug 2025 08:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MAGfaBA8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F168146A72
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 08:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754727642; cv=none; b=AeQ8CI3bO10jZJFuBA/MUMnRxZooLXuxRWMWa1Ibh3q8KFZSYXBwkcF3Ah8PDf+K/7vF+I8/1Jtj+O8jFp6FPd4ZdN0OPJd4YbwRObvMPTH2vqWNcA9IW4F+AbhbH+7bdrlLskl3FsOiQAzx9+VSztxLz+Lk/qv/V7dpNVPqEDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754727642; c=relaxed/simple;
	bh=SGjFGOE4lQDZczOSBQm6XCZj/aKwb7yDyErC94c8G/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ueu691e+3x13S6Skkm7sTt9e18Y/O7+ZPWB2rcHuO3B+NEsQxW1ECkoyWd7aLA5raUdqKLAvcUEdBKaXBr92TBxvJIHcZ45ynAfyrniyWrpErRr7lduahhWNJi0kEURYmcv41cv/ekklJbBaDyAhWV1Nk/P1t2g++Ykv0sObu00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MAGfaBA8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5794dlIH009287
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 08:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2H9KRizh8IleLkCoQjNl9JsL
	yZ+FWKuglV3/DdZPO8Q=; b=MAGfaBA8T+Ra1m1wA7iBsHcVPnWichOrkJ6Hwa2P
	MDJWxFoJIyAChoNv7Whs+9DgoVdmCqEWVu91q0gSjXWHwtBMxxa7RuLZiUtG8Fag
	QMcPIvqAgLjCrqE+tFwUV9trMjCN/M9RtQpFw/Z9rPC9azPkItP4yxOT2P00z3dO
	+CHGX8SCr3dCjUy7dEKxEjs01qM7fNulbQI6Js+koHbfqr0p4BNRbI0ecCQoCLI1
	1GsUbAyQKCLD1ohKLTUErVQCdGt89ERmq7byNZcOKB6YrpPAFQHOFn8Zqzkt/SJk
	EVpAvcE8TihcMBj3HLOMv+ayG5eEIRvv2Pku9ZniMjOZKA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygm88b6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 08:20:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af18aa7af8so72672271cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 01:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754727639; x=1755332439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2H9KRizh8IleLkCoQjNl9JsLyZ+FWKuglV3/DdZPO8Q=;
        b=xLjJYFK2TErC4vrtFVfF3/TukWYnRWLhFfIYQQ9Lx87NWr5Ho3dpZFxrZIYuPxu9JN
         5cuMVXFsDJJlxTWUrSxgL0Xv4UzBza2reLNoO5AwGGATu2UTUHNogQu4QzsKfwl/93sL
         tUl9Nqa95ZUxEIaWc9m1AmnLyzW/U2Lfv9hoaVWiVkmxRR7vZcoU+imY7eqRlaZksNIp
         2IBXJwXX5Y1Qh1fW8FLVJYt6UzSqKKnYcPaps6pdhAQSPJwSJgiXIbLChtJLg9bz9JW1
         Y+ruscf03k1r8otJwFZzwbgKjHaMnpzoGd+ELEnTzWuHsN9h6aVegBCyQtPkkaapAATc
         Iyhw==
X-Forwarded-Encrypted: i=1; AJvYcCXYK7tFSkKubVVNDEF0pqZmmwYAD3Cxa5C1noKx9miszQZTmDAZpkRxMQc8mqYUKlGjdu/YSo7Bw55VOjsq@vger.kernel.org
X-Gm-Message-State: AOJu0YwH1+oBm9CET3rwyItaA+ZCzFi8QYkiB3w48CDuNoa6NYUIoU3D
	D+kredpIBh9jJE/Xkb0u0AKkJHs5IooyXdKQArsOFKPyYoXiPm/3HwCkUkw4WT5MtQd/GBWW5FV
	woV3j5FjDo80SYjlpjd3PYsKF3pRu9QNT0E1od9m5MivJcRl6Hr9jbEvX/vHBtxCW87Ju
X-Gm-Gg: ASbGncspNoZU6FR/jANMyr6jnUwgEOyg60H0jtsw3kpZOwMWO0wcWjmnvGC+XqxbOlP
	fjMEL25anVXixkm0tRrDuZ3tHoQcaSkCQ9lC7cDB3f4xWBJz4a5FFY1oH69nYphXoZ7fGccMNbo
	phbd0PeU+lrLOnekYm9LYqeFRbAwcBE1TXLUwOIQdXZy36U+9LiG33gY1D9BNErzuXaJd3Fvpe2
	LW+4htFaSip8FMbSd754lcT8odZdabw6JbrqwnqVWF0dVSjDtG+nIK65qlcgKEZ/glkqIdUfxH0
	cgp3Vymz69miIozoyRDuoFxlyhN8ixppDx3Nn+9bKd06IPsGXpGcLpEV4tqcy7+b5lFRlKNSvDr
	7IPQKUqQf/hHP/L6HcwFKITI8dkAD4XwTy372TR49nTCCo728tnPy
X-Received: by 2002:a05:622a:20c:b0:4b0:6d53:a0fc with SMTP id d75a77b69052e-4b0af4deaafmr103917371cf.7.1754727639474;
        Sat, 09 Aug 2025 01:20:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaybZqS8e1II26PBLtR2MEev8RqN/YcLWWOjMTMd4jMxYQpAM2kTd+wUuQlaFFQ87m9qtgiQ==
X-Received: by 2002:a05:622a:20c:b0:4b0:6d53:a0fc with SMTP id d75a77b69052e-4b0af4deaafmr103917111cf.7.1754727638990;
        Sat, 09 Aug 2025 01:20:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cc8d64512sm146866e87.11.2025.08.09.01.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 01:20:36 -0700 (PDT)
Date: Sat, 9 Aug 2025 11:20:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>, Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/msm/dpu: avoid uninitialized variable use
Message-ID: <fcgmsw66wi6eqtcwhcz5yc6migoauygaztqumztseo7uu4a62g@bg5xnnd4eosw>
References: <20250807072016.4109051-1-arnd@kernel.org>
 <ouan6tfmoefwuvs7wmhpzjdwmxfhqh3ad26j5tmwdugnq7ieda@ddw6dfqtq27g>
 <20250807143444.GA1009053@ax162>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807143444.GA1009053@ax162>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX/azik+cLghpl
 RKOih01m12z0DPCXxIGiLJuCxEFDWNLjMQPmvl1XPZgb1N38KvS4XmNnUndOwCwmJDShC9NgZnB
 v/5bfueWvhJbd0QyT/ILeb31HBtAHq1cTUmETPaRr5tb9ty3BnnRPe0qljXVmsy/dAeViZ0K4oN
 NM47e6Pnje1CQ/P7i4cwnwn/D3cTkj6mEJpbnmtBnyYxNkv5rqmukVE3qLhrML9vSNMOw3u1DDn
 Tuf7zAAk+bDWMCZH3Oe3y4rE6EZTqAmc2zoQNn/ENV8rokRYZdiASFQIs7+HQj2zey0s2ZWrZJI
 bApuaFsyzluw2q3aU3AqO6xrU9uxSwfYQgzl+m0vXNUPVBd3bDC0nWm/TxNzZI9KRI+NYNooYid
 bI+Lgiwt
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=689704d8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=yl-pN8RVu-4QMKwhACwA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: IPrFwRcOsRlJOo4TtUZdL52DJ4cXtabM
X-Proofpoint-ORIG-GUID: IPrFwRcOsRlJOo4TtUZdL52DJ4cXtabM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

On Thu, Aug 07, 2025 at 07:34:44AM -0700, Nathan Chancellor wrote:
> On Thu, Aug 07, 2025 at 11:09:38AM +0300, Dmitry Baryshkov wrote:
> > Having no plane->crtc is a valid setting and it is handled inside
> > drm_atomic_helper_check_plane_state() by setting plane_state->visible =
> > false and returning early. Setting crtc_state to NULL is a correct fix.
> > Could you please send it?
> 
> I sent this fix three weeks ago, could this be applied?

It will be picked up for -rc2 (hopefully)

> 
> https://lore.kernel.org/20250715-drm-msm-fix-const-uninit-warning-v1-1-d6a366fd9a32@kernel.org/
> 
> Cheers,
> Nathan

-- 
With best wishes
Dmitry

