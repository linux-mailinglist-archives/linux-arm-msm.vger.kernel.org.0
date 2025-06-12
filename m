Return-Path: <linux-arm-msm+bounces-61080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B3BAD69E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 10:06:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3821F1798A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 08:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B058F18DB2A;
	Thu, 12 Jun 2025 08:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWchK8px"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8DA76025
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 08:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749715564; cv=none; b=ZqS1KiqxwZjoj8GaZROITG+IsYwBNDZIcizMnevhLzOpzRQczFqNWEgU8/m5Jd8XhCT6Ortj4AounVHaoyfSmL4wp6ppIVAU6dcvF4xvpWWHL36iaUfC/tkj20lGMGB8q0pe3NbJe4b/S3KD76iDzllgw2ehGPgoIWeDgvvn/XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749715564; c=relaxed/simple;
	bh=GEFxzDSmIx7mSLc9grOdHwi4rsiBtOIV3MQN45BvOzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRLUdVNSIS4rD9XK8xPqJR/mIympA5m+YzKpJOr7uH3CaxytkQSbLBuW1s5oI3Ul+x0COvcRSP7/VW9lUYBaEXwNmQANRdYI+uZ69OIUPEat7jz3WDZ58rVjPg4+Hz0g+TX+5rKIaxDhLE/bW7XjwMu7SwnDjvMiM3nQn6GUwwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWchK8px; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C7nA5i027470
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 08:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gYLKSuEg9yfr55w0b30ljKxa
	Qtj5FKzqcidTfQG7b1s=; b=hWchK8pxGoMT2/EG1HZjedxu+PirePqVOZPXDA3W
	5N7W/ppp/7y8/AbzqgzDPXSdNpwsHrSHQJGKBLRbxnwUnH8oNqH64hMyR3QPlwAK
	qVnvLLcpuGey6Zu4mq0Vbg1QAeuAaXh5FFrnQxjs8sCHgYLepdSYHIic8NOMK/Zy
	XnU+CxuLkgojBgZrHS20tYzvntbOBCRHwvdhl2JUCOzIZhmEwR6hj25m8quPsmSA
	XfH15gFX9TXVHQNqsz+E9AySOg43qGEIbklGh745jjzoHPcuwaUBSXJoRH+jU9b7
	4Uqi7kCPVUW/4LXVPSae4TCl/RctH7klKLoaM8HJCgj9BQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrheqa5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 08:06:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5750ca8b2so107470485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 01:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749715561; x=1750320361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYLKSuEg9yfr55w0b30ljKxaQtj5FKzqcidTfQG7b1s=;
        b=NmcGtdqHTiaDqe9McChx7eVVR0u/fS1XdA4dnzamTvosmRKK7KGh7Ci14bPdoRdxAX
         LKxBsP32Z/JQBrcR4U+HEffJ84B/9Tk+IQmT+zVkg4QuwfKbZ15T1IFdjoTdzeeevh+D
         COqsdttlHg4yRNXtwQZyoC7x/J844P5f3rc4/qfTX7V1hIKCFTJrc66JUCTBml17cOpS
         Ex4qVBMU66ORSkqJT594R6ACuUNIjAzEhNNtqkJCPsi1y81hfqhYctScfbzZ+P6Df0l4
         5SxMqTj9gMOhjx/Fn+14tTveq7Z8NzFdDm+Xxpk7TJcETUssgLu7/bCADwrljyeZGC/6
         XV+A==
X-Forwarded-Encrypted: i=1; AJvYcCUvsYDjJOW5X4VKNx86UELurqXflJMobYm7FGa4PfD+IUiR8GZVc0NAnZmBHltTn1PCVOS2/5jSQH4rKgdG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf8BMEPgCAAjRo2E4XRwqjM1Ru7olM33PSlVoRvdk/NwTJvyGw
	YYj1+lIA1aFBNYQMA1Uc1uA6r1SgjyNppZF1lZYi4SlHITAPx3th3FomvoHiaDPRabc5tZizaae
	b0e6TooopouyKnGLJq469kHZd2nDdTYhwYwuGTNBWvnhlOCIgDplMXke410J6b7G1PJf2
X-Gm-Gg: ASbGnctos68u0+5Ljs+l5rF1WNCx+FigdMNtPF7HzK4rD7f43zIKRpay0wfNqR8aom9
	yKLJOnsVSpaoowmkrkhakYq7IOVpJW5TKxM2v4qquv9H3U+bkkXCkMl4EjhTCik23VylPbynogz
	iyTDMZO8ibT4T43f8byjTsJ5TkKTQZGaRw2UJAXmxffmlx8oktBJvXeYTUg7B85eT66BgBbinSo
	puHGx81ivwOTqAuaGqAb9WDCoYQZuvAqo63WaMcUxfMROEW4ySbHj4XzAFTWhdd4P68DrDfcA2f
	eg14JPBIro7yeHP5hV0n4U0dea0mgxi4IIT3cYI2C0BhK7VHijIYGcCmRlZMKA9iUBdGSQVyGSg
	AdoXiDyY95w4gR8cuCTkpInwEBiGpfHX0MMA=
X-Received: by 2002:a05:620a:2d8a:b0:7d3:a6bd:93fc with SMTP id af79cd13be357-7d3a88e236emr679314685a.28.1749715560597;
        Thu, 12 Jun 2025 01:06:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtEx7/LfcxXUMv7FkqbwpLWknBCvl7pRsgiOfE3tIOvpsdV/K8xXm+GR9qDQXkbL/OA9rOLw==
X-Received: by 2002:a05:620a:2d8a:b0:7d3:a6bd:93fc with SMTP id af79cd13be357-7d3a88e236emr679311185a.28.1749715560158;
        Thu, 12 Jun 2025 01:06:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3307ae32sm1370641fa.39.2025.06.12.01.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 01:05:59 -0700 (PDT)
Date: Thu, 12 Jun 2025 11:05:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
Message-ID: <qw64xqfnyy76f6oawtaecvraejcwyml5k7oxdy67adj2rh46lq@nupxbuy3vwu4>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
 <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
 <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
 <61dd2c3f-20ac-484e-8a45-f42fd5f42b86@oss.qualcomm.com>
 <CAO9ioeX1uE3ty5oSezYOLJKqf8G5dLYAS5nRiNvryWTk0RPdEQ@mail.gmail.com>
 <f3d376cc-6e2d-4ac3-88f6-3104eec67acf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3d376cc-6e2d-4ac3-88f6-3104eec67acf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=684a8a69 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=QxY6PIr9u2238qDpXlUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: KtD2xeBAgAE579GuHrIyV_RnTuk0cUWK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA2MSBTYWx0ZWRfX1l7XFhpbs5X1
 MtRGeBCe6j2V7Qw9o34ln+fbkFjFPnzItzy8D+ICLRZh6vcFlSL834DIvSLGffg/SLkutRHTmur
 9YLOAA70OkX9gvhygMq4R2vIWzQ/EIgJhm7gKU7rb5pkzMSmMZ+Avop0DfUMjf05JHDd3y4Bv1T
 oV7F4hAXm64BwBHXNxpITIt5766YvRWkrGSQBUZPu7kwcVHcHOLmL0JGtmDApaN+EfoVB7yuI/y
 p8wurGTDqgETn/rRo4PazipjVm1rKvu1ypEqKpUkHuW+2GRS6OJH/6JmE7pLnlztq3c27Bn2C8K
 FBm6HaP6xMGDSK9ZaayFtJOkSaVTX2+Z6+7AUZhjzvApc9vXMSrjlRswQzB0XVX+mVUOtGJMMKA
 gDM2un0jT6/xudCZYnwYf/WQPiKpB174zQMitLIXAVz8vTRgLJB2sr1v+4kEedVqMRnY56fL
X-Proofpoint-GUID: KtD2xeBAgAE579GuHrIyV_RnTuk0cUWK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120061

On Thu, Jun 12, 2025 at 10:50:10AM +0530, Ekansh Gupta wrote:
> 
> 
> On 5/22/2025 5:43 PM, Dmitry Baryshkov wrote:
> > On Thu, 22 May 2025 at 08:01, Ekansh Gupta
> > <ekansh.gupta@oss.qualcomm.com> wrote:
> >>
> >>
> >> On 5/19/2025 7:04 PM, Dmitry Baryshkov wrote:
> >>> On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
> >>>> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
> >>>>> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
> >>>>>> User request for remote heap allocation is supported using ioctl
> >>>>>> interface but support for unmap is missing. This could result in
> >>>>>> memory leak issues. Add unmap user request support for remote heap.
> >>>>> Can this memory be in use by the remote proc?
> >>>> Remote heap allocation request is only intended for audioPD. Other PDs
> >>>> running on DSP are not intended to use this request.
> >>> 'Intended'. That's fine. I asked a different question: _can_ it be in
> >>> use? What happens if userspace by mistake tries to unmap memory too
> >>> early? Or if it happens intentionally, at some specific time during
> >>> work.
> >> If the unmap is restricted to audio daemon, then the unmap will only
> >> happen if the remoteproc is no longer using this memory.
> >>
> >> But without this restriction, yes it possible that some userspace process
> >> calls unmap which tries to move the ownership back to HLOS which the
> >> remoteproc is still using the memory. This might lead to memory access
> >> problems.
> > This needs to be fixed in the driver. We need to track which memory is
> > being used by the remoteproc and unmap it once remoteproc stops using
> > it, without additional userspace intervention.
> If it's the audio daemon which is requesting for unmap then it basically means that
> the remoteproc is no longer using the memory. Audio PD can request for both grow
> and shrink operations for it's dedicated heap. The case of grow is already supported
> from fastrpc_req_mmap but the case of shrink(when remoteproc is no longer using the
> memory) is not yet available. This memory is more specific to audio PD rather than
> complete remoteproc.
> 
> If we have to control this completely from driver then I see a problem in freeing/unmapping
> the memory when the PD is no longer using the memory.

What happens if userspace requests to free the memory that is still in
use by the PD

How does PD signal the memory is no longer in use?

> >
> 

-- 
With best wishes
Dmitry

