Return-Path: <linux-arm-msm+bounces-71779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1833AB41A31
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 906401899839
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBED02E8B85;
	Wed,  3 Sep 2025 09:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsQoZwdU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C892E8E16
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 09:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756892164; cv=none; b=AfuylQtDDAFYAyjjPBg8bAPbVi40NZgtaKvS7jyJn5Z1OitmWfsyn7r9LfT/OABJ9Ca+Yx1gdBo84X2+V3ZSq6KT5855VjGPY8k+VPplP8pSHM10WRtFTewai0PbjW2q85BpisgTMOmqa77jJuDMM+P5ERiQn6UO7ayaG0l54AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756892164; c=relaxed/simple;
	bh=OJN1kckVzL5kTW8Z8v+NbbA8S1FdVa0vxS0nn8VvgoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHhxD5bRwKHkpaYaREr2OKSMPw7HGGyOBuvgC8t2elqiQWfCxnrBQSmbma9vvPJzg2bfv9SL8i1Fgm19d8aA9HKYaoNzgnmT/Gm8lWY0Op8sTRglS825ClCTM0mRJ6deOuB780diApCnFBqCS0lTtXetbW2aa/aZHrKq//v90y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsQoZwdU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5831N86v025282
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 09:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vSerlDJpxvfSadnBQ8QnDpTg
	YM6Q1KNBUaEKDfGqWbs=; b=UsQoZwdUapKoi6LnOo0SvJ8QMQCSFB4ulL1jZemo
	tP37+zgMx8Qeu8cV8rZvtJHoao4gHv+iZkAkGPF4XoSq+zTsG58FAkH31LnWC/Jx
	cmEtdiaPd78FUUhKDe0zjT9Wu8lE6f+AYIVMvge5i04FSJUqNMu+ptgfaD925loV
	RoWPad3TPZewXw4RHTjDdnAtVlv22ltQIYBYGgfrWhvUVPQy272YqsXIvnNHGrVL
	p3utT1gxYNBL+fEKtH4jJbZtNO9y0zYb0zyCWIe3lzV6MhGtd1+Ilxb/5FW6uQ+c
	FpYQabteem1iWJAxECYcd4IzYNxycDC5UK88myah5tFJ+A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv3571-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 09:36:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-72048b6e864so18386776d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 02:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756892161; x=1757496961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSerlDJpxvfSadnBQ8QnDpTgYM6Q1KNBUaEKDfGqWbs=;
        b=Itc4T1DdHGQyvaPrYttrqc3PRQuqgmBj61TH594ux1VxLP3ibkpEP3LD4Re3kbkV9d
         MNeq4jodjepH5KmBzOOXAVzauwOG3g6hDMYR8pHxcPHdCFcVGuKJI5V0n7M6Q2c0Akyt
         sTwVor+Sr/zqaKaKHn4siE84AcI1wNpfMnb6IbOVCmDC0GRc5Bo5/g64yhEZEW0FFbi6
         LAB6xjrIF1pGIMKGbHlDezBU8JMoV28VD/J8Lek9CApcxXNRCzQ3N8XbbIY0qMKDcAYx
         qF1inEMdBl2Z8wQpV0jy59wkK7EsRJpUJrKMXrudrqGZiGK/yd0WY5xpfGaiL+8frYB6
         gs7w==
X-Forwarded-Encrypted: i=1; AJvYcCV1/+r7a7EHJ+vQ1OC1tINH/yJRZ0XLVPvLcTSX/QEn+0iueIBuJ8sXuSqVhvAKfREAEUkUSsUT11SSPQUo@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxe2chZyqgT6sUz/9TrI7LyLiwrR2m0O7B2KlEVlAtD5ikbM0M
	nQX/Mp5NQ55BaLMdJGQQvHoxF8nnhVH+k1N7x8ayw1Z4fVhCCWOyRXJV1D8lP6s483Oke5fY3ZK
	LCLzxP7Zx+uQkgm7XrUQ2KY7ok7XaMcd9DW2YpEbGPW00eqk8YqwaK7LNf/gHrnBVBIRA
X-Gm-Gg: ASbGncv1nVCmPjXEqp1TWmbpHKhQDUiVy0vnfFAbfMLuQ/foshbmBviXTCEDDiOrSVV
	8c0Vj31dBDcgwefX2myTgXpeYZfcXexeBNcBRPIzlPt46Cre5risGuwc1dMEY0kTmRszxtRJY2k
	enz+3c/y9Xi4nz65pDj3HcertNiTh/wh4Y+FejsykOhutJCiefCsFfx+JEMKAm2CW/aym4E5R+G
	GmEYFw5Tjrhzjnk8HmrIHMRo0A1XwlvRS5f7WM8BNfQnS1G8PpSCUTZlUU3kI0znMUw+bGupINy
	Ak3f9+d67Gj3Hx8IG2sfANJ8mRMpAlYu0ZrKjhOb6FdxBrLZhOfNIpctsaVQcVnshJVxLBpLTks
	RgVtySHUXkdWUP9BJenWKubAVpLo5AqksnI5azHxVt2aF+ipZWGJB
X-Received: by 2002:a05:6214:1d29:b0:71a:5b14:3caf with SMTP id 6a1803df08f44-71a5b143f14mr94106816d6.42.1756892161147;
        Wed, 03 Sep 2025 02:36:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqgDTlX6V0CHb7DNRDOoeNqxg6UWnd6OmRx0Se3MK3/xtEY2lCzdiwyL/yLPFBz7pz69sN1g==
X-Received: by 2002:a05:6214:1d29:b0:71a:5b14:3caf with SMTP id 6a1803df08f44-71a5b143f14mr94106496d6.42.1756892160620;
        Wed, 03 Sep 2025 02:36:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c503d7sm9027131fa.11.2025.09.03.02.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 02:35:59 -0700 (PDT)
Date: Wed, 3 Sep 2025 12:35:57 +0300
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
Message-ID: <oeecjgt43z3pgt7eaxat32vk4sch2h7hp3ibpvvw2cb2mognyx@ft73uzdyiq56>
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-3-f3ec9baed513@oss.qualcomm.com>
 <a701e4f9-57b7-46cc-b42f-f1a4a902fbbb@oss.qualcomm.com>
 <zmaphb3douzah5m447naluu7cjrwieb36uznjb7uamblxduira@xhtklqmy22tu>
 <b7a1b89b-54dd-4d02-afcd-0144df5a6d57@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7a1b89b-54dd-4d02-afcd-0144df5a6d57@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX/BjRXNyJaFHh
 MS6sVrf0dmdhHLg3Pr9UgtxanMZ3PWdPwqpvD9nLBXDcczgI9nig2kFt5DFFesrIZsYUWqGTgY+
 WjfjNJxcWnvFp4Sr1OUrMnwzYBFlxpK6dKcP0f31imaIBSItQ1K+I71MLY+Z74d2bSeUFWReTP0
 Q7fTSlxv6iL449Ixv/EcZS5euNmntJaQsMRTf/+Dj20/hG+8GpfjY4Jxk2UYTIURyAcqbyE8xG4
 P35CWbxMEsHHcSc/VYiKe7mAmoAmLpz3mX2nFekt/UaizVDC5dnnFNbcUIO4IYYbSwlO4hiUhZ9
 8QdK4+pG3/AEdhnzk8IFLyD9vJvJVA014xTaHcOqesO+9/tkC3tjVRu2NgdoPVApJo444rn9hmb
 E2MpKxPS
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b80c02 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=TuRy5nDU7s93I7UbW5wA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: dlR1p8HCEwSHnW-JD0Fu9IrW6ehS4Utk
X-Proofpoint-GUID: dlR1p8HCEwSHnW-JD0Fu9IrW6ehS4Utk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

On Wed, Sep 03, 2025 at 11:25:49AM +0200, Konrad Dybcio wrote:
> On 9/2/25 3:02 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 02, 2025 at 02:30:48PM +0200, Konrad Dybcio wrote:
> >> On 9/2/25 1:50 PM, Akhil P Oommen wrote:
> >>> During bringup of a new GPU support, it is convenient to have knob to
> >>> quickly disable GPU, but keep the display support. This helps to
> >>> fallback to 'kms_swrast' in case of bootup issues due to GPU. Add a
> >>> modparam to support this.
> >>
> >> I'm not entirely opposed, but slapping a // in front of the compatible
> >> in the dt works just as well
> > 
> > Which requires rebuilding and reprovisioning
> 
> Fair

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

