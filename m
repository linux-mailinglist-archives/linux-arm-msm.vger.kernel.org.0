Return-Path: <linux-arm-msm+bounces-60995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E5AAD58DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 16:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92E0A16AECA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 14:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479C926A0C7;
	Wed, 11 Jun 2025 14:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YoxF+025"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99EB1865FA
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 14:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749652566; cv=none; b=mZWTY5GTSMNlsGYP3/krCvv6zgqRTvHGTvbiNag9Vzd+UIpbN2RSJfNhq86wCB6q5iq1BmHet0MYrkEkH8iYrVsB7APk//LAR6LKA7e00VU7ssclFm2lmHWwqle3RIHPTy3c2cnPWUl9J0w9fsFtA0R4vvpebocf7NK76QEoges=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749652566; c=relaxed/simple;
	bh=qyO9F6A2QKFqgK/MfdC/ZXFAP4wR4ICWsbHk09G+r6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5WsK9xFJf08v2Wwqx+n5WyxdObIchwtpASeu60MQwWEzGD/2NN9SPXQyke9a31x5Vs2U9JMgBH1LPr6JfEpo4o9i7PLYpLXSVSjd/how4cYBuhdU14gjO7nrpbe7TCNKIdXUcqJ0elF1Ab7b2xXFvxsbtlVjO2QFziI/mwQBEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YoxF+025; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DN6Q014226
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 14:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mLmE/RXH0IKv1odDBp7vU03/
	R92rKvfrvUmgNkGHXOE=; b=YoxF+0251EWgiYuKTbUrLXrdKQyMkNBmeJv2i5c8
	o/FtKbtjo3J1nKf8Vf5Rum7F1IX08de8eie8kJAjZTpx8k5vFSYOerXGFvuf13jY
	rCsegkyqUgrcRlJReVYtCoYQx1imTHWqpB9dYhpkGlLb9MA8mNFsVjsZH1sCNmLZ
	aBgGa5NzYhVWWNm6soxIp1vIaaurbn9SX8dsMdfssZnCqpl3bfC1hxdkUeuwYNa8
	sEFhKJog/o7zhHEakL4rz24mQ1Lydb4rpzVH1lr8K7Tvd7FvLwckYTcUZ2kYwCJQ
	WfzgYqHHPhRbVa1gCxPzhWJVwkRjiOri1IjlZU0lF39G9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmncwee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 14:36:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5bb68b386so1096021885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 07:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749652562; x=1750257362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLmE/RXH0IKv1odDBp7vU03/R92rKvfrvUmgNkGHXOE=;
        b=k8UO1GY+C2X45rrQXiJp9mCaYV9F63sfRtwrFG0SP2oKbw2ftqf7rW6dxrm5yGlo9P
         dowEI2+/DQ/1Z8jsobQvIVmX66xBC6mfm0Frnp0F2AoAdBEn9ISwnOFYtlNNwjTAEbE3
         wUiMT+4EwAufT3GJiZIzvAkOHeYtYiV0GeJyLP+mxqzhrrSHnt63y1TA0bgMUayZ54V0
         EKeQvwH+fatLlY4OOh+pEWpxx6LLAsgk9lSpxuiY3lDE1DdhjrDa+n62AmjmKAobF8Wk
         ZSsEVaQQSIvfFHkcoDGaZGRMda7xOhcw6JzgFnpIevzqRIM62wHYM2287NCzaMW8x2Dk
         xU0w==
X-Forwarded-Encrypted: i=1; AJvYcCVJIebxu57tw34CLJ9Ggql2dmPGFzKxeApxinN5kNT4VnikVhce/kKQ3dOy8Coa3SrRCpzgnlteMzwfh77t@vger.kernel.org
X-Gm-Message-State: AOJu0YymmeIl6RtVqOG2FSf0apl/rehqeW4mD/IU6omhOxFYU8gTi2PD
	mxqGKW8oXHAbyApX9ym4hSNRBIRogBmWuLj5XzU2POzsiiCtXxfh7DqmeSRIBvg9wLlT7+FAoAZ
	hzgzMa/tELOLiRIQcRL0GqdjpChRsEZMIjtCqDS/liRw7x5C8oU8p+bmvpvETqdtrmq41
X-Gm-Gg: ASbGncv5nnYAk4S51ejNwCAmFeSnG03o7De0RHPIKzwT1teHa16BILyt/UP3urqoaoZ
	ssPccp7lTO+GfLWBaqUdIIqtiMWpcrW1swQ5hFdNvv79b9Yq8VNslKrI3cweSvQb7Tc82EHHKRl
	OuQpAKPQF3fmKLUMxE3pfUVApXpio+NCmQeZogCPTsrz5LaGO3j/LCfKkrvtG2P5iKZVfNeRV1+
	YNBLUqIYWd6sZyDqBQXLBCBYLUne9z5qQ4XacDpo29HydvRPqBXJ+QaFVMZLNjjce8wXQTvWz0w
	RpZICheprdDk+sOh+aco4SB60JiDjv9o/HJe0H1h6n7CT/ISfdcAxFRt9+jdMwIbsrpjHJtv1Gk
	lTwoNUqS0h5Bj/EDhSqnAGKj6XF0hFjVkcDY=
X-Received: by 2002:a05:620a:904b:b0:7d3:abf2:5034 with SMTP id af79cd13be357-7d3abf25054mr166589085a.26.1749652562091;
        Wed, 11 Jun 2025 07:36:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcocr3jV5zIUE3s4dT6Wkzy0azFjS2wr6u1QVQ3RdqHa151L1pCo4IWZNjGrBpAGsMUDwaiQ==
X-Received: by 2002:a05:620a:904b:b0:7d3:abf2:5034 with SMTP id af79cd13be357-7d3abf25054mr166586485a.26.1749652561691;
        Wed, 11 Jun 2025 07:36:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1d009a7sm17997671fa.107.2025.06.11.07.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 07:36:00 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:35:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 00/38] drm/msm/dp: Add MST support for MSM chipsets
Message-ID: <xrgrnjnu4ngod6uizhyx2jtti5xjjhskey7id7xzhpuc5suqbk@g3a57j42ukty>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <chbsxsy3vltr4752uutnu77a6mt5jbsjixfsgb7dqqdcgypkhq@vuldhcnkksy6>
 <b4d54e57-e365-4ec7-932a-79d35a75c2c1@quicinc.com>
 <20250610083021.gqj4q75hybtfkszn@umbar.lan>
 <f5f46747-6c0b-4799-8974-ca666b78ac54@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5f46747-6c0b-4799-8974-ca666b78ac54@quicinc.com>
X-Proofpoint-ORIG-GUID: yqFEWdMMFuSDmv4f6njMCQibYT4coqU4
X-Proofpoint-GUID: yqFEWdMMFuSDmv4f6njMCQibYT4coqU4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEyMiBTYWx0ZWRfX0/GjIgrtJoYR
 cL8oBm0HQVmQ2TWtwgzk4l7x510CRI312DuNl8DgWxRnoQot3TmXEGqWdM1DIyhB1FrN5v18JiO
 4/sGwVAK6odnvwtBohshzH/PmNVup/Wn/aUPRMWpuxcDdODHXgBc/uXIDw0w5DDxF1V2wM/9oQa
 n+DcNqucRHxhu1NZX6s6FpSTROuhz5dunlr1BH3MZIEEOtiIkjAq9LvQ8yCU5WPAcQ6lN2A6xFk
 0CuRvjY2OC5w3Pcd+y2QsAP9VFc04514o2PLIVEypoSICKquIAi+i0qnK7D2LQV9H0REq9Uor4a
 IfcwsANnrgMnJrod1WE9ZeT+xcK2pFtxkAdlF9ViMe+5cS8pVBKgEGAaFpiUHDNNkgrEZQbstiC
 f1C5UQI31VlkbO+xKjFRp7lsRQiqCz7FrtHGqph3UOGX3zTZEz1el4a/c9JkBqK86HOAA0gL
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=68499453 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=3eWIT1bEIV1il--ZwuIA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110122

On Wed, Jun 11, 2025 at 08:08:49PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/10 16:30, Dmitry Baryshkov wrote:
> > On Tue, Jun 10, 2025 at 12:47:00PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 2025/6/9 20:36, Dmitry Baryshkov wrote:
> > > > On Mon, Jun 09, 2025 at 08:21:19PM +0800, Yongxing Mou wrote:
> > > > > Add support for Multi-stream transport for MSM chipsets that allow
> > > > > a single instance of DP controller to send multiple streams.
> > > > > 
> > > > > This series has been validated on sa8775p ride platform using multiple
> > > > > MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.
> > > > 
> > > > Which means that you didn't validate the MST interaction with the USB-C
> > > > stack (there is a significant difference in the way HPD event is handled
> > > > in the Linux kernel).
> > > > 
> > > Yes. this patch series not test with USB-DP. Actually, our initial plan was
> > > 2x2 MST on SA8775P and 4 MST on ACS8300. All of them are native DP
> > > interface, not USB-DP. So can we only support SA8775P/QCS8300 in this
> > > series. We don't plan to support other platform in this patch series.
> > 
> > I'm sorry, it doesn't work this way. This is not a product kernel,
> > limited to a selected set of platforms. So, you have to hook MST support
> > in both paths. The series is not going to be merged tomorrow, so you
> > have enough time to validate MST on the platforms providing DP over
> > USB-C.
> > 
> Would it be okay to implement USB-C DP MST in a separate patch series later?

What will happen if I plug in MST hub after applying this series?
Also... There were several items beforehand, which were left out 'to be
fixed later'. Up to now, it didn't happen. So... I'm really tempted to
say 'No' here.

Also, as I wrote, HPD rework would need to go first (and it wasn't even
posted). One of the reasons why I demand that is to be able to
streamline HPD handling and use the same code path for both USB-DP and
DP-connector.

> > > > > With 4x4K monitors, due to lack of layer mixers that combination will not
> > > > > work but this can be supported as well after some rework on the DPU side.
> > > > > 
> > > > > In addition, SST was re-validated with all these changes to ensure there
> > > > > were no regressions.
> > > > > 
> > > > > This patch series was made on top of:
> > > > > 
> > > > > [1] : https://patchwork.freedesktop.org/seriedds/142010/ (v2 to fix up HPD)
> > > > 
> > > > This series has serious concerns and most likely will not be merged. Not
> > > > to mention that the URL is invalid.
> > > > 
> > > Got it. Sorry for the typo in the URL. So should we drop this patch series
> > > or wait the state machine rework from Jessica zhang ?
> > 
> > Please work with Jessica. As I wrote, I do not intend to land the
> > mentioned series.
> > 
> > > > > 
> > > > > Bindings for the pixel clock for additional stream is available at :
> > > > > 
> > > > > [2] : https://patchwork.freedesktop.org/series/142016/
> > > > 
> > > > This series needs another revision.
> > > > 
> > > Got it.
> > > > Not to mention that I plan to land [3] this cycle
> > > > 
> > > > [3] http://lore.kernel.org/dri-devel/20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com
> > > > 
> > > > 
> > > Got it. will rebase on this patch series.
> > > > > Overall, the patch series has been organized in the following way:
> > > > > 
> > > > > 1) First set are a couple of fixes made while debugging MST but applicable
> > > > > to SST as well so go ahead of everything else
> > > > > 2) Prepare the DP driver to get ready to handle multiple streams. This is the bulk
> > > > > of the work as current DP driver design had to be adjusted to make this happen.
> > > > > 3) Finally, new files to handle MST related operations
> > > > > 
> > > > > Validation was done on the latest linux-next on top of above changes and
> > > > > both FB console and weston compositors were validated with these changes.
> > > > 
> > > > Validation should be using IGT for testing. Please ensure that there are
> > > > no regressions.

-- 
With best wishes
Dmitry

