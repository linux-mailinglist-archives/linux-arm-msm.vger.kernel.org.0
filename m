Return-Path: <linux-arm-msm+bounces-66276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F53B0F135
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F48A545F77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 11:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF45128A73A;
	Wed, 23 Jul 2025 11:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y1/Q8lel"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B8428B4F8
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753270267; cv=none; b=ZY0wY8+lH5ZDjvtuBEW+WetLZWndYw+FBFJ5QROc19SuKzhnMmczRJkSNcBFkq39HF4Q1RNAUHgrefkXxkDISoDFErhVOoW3kzUYVullqDPEnN99bNv3bdecvOiCXSoIVmaXgPo3N7mIsMaRd1xD2R87PJ7hX1Eun8WTt9aUdV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753270267; c=relaxed/simple;
	bh=8R/2LqL8EYjHk+vjnbWhMiilF7QLr2f1y5Aen+tPoN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdfx+0lugbg91we3N+zmfaUNqSOgZ5gObCzS4WBNwBTarYdvSwm+PpGCXFjYRDDqO69s5q/o5uVaVGZN5XSmMpAiC99JaNuyfLa7qjuc6PVghMQ85yKM41faaQ+z7aThfsSfLI/PEau0I8ZwtaUumgPbRv6HKDpuEfVG8xCXQi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y1/Q8lel; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N92ftp009244
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LEy+cd4XZeFNsCcKEQ8NGnzC
	xyrPqaqP08OMrM8m9/E=; b=Y1/Q8lelxaYHM9CS8hCLfOfC/sejyZRu/Dxaw2jJ
	RSNy+cchs6J90LtctQBth+U+2BGHsnG49Skhsl2l62LDgYfp6WTbFrMVKwIyuQx2
	5MC/PLU3SIYZz8ViUCBocs3O6sIRYaIdDZO4BMtnrLqiYNHPicHtyseQCyHr/IKK
	DPgyieLj/j4Vxx70j1K57/N4+p2tp34640qRP8X9Rzfk6HgYD4QqI+pyfy0mVVz3
	W3UpLIa5/oVd72s9LENFDcgLx+NH3WOckYKMmblhNdzTPTgOzJp8ze4pl4CxwPxu
	Tcxy1aaowmU0rRAShauvgGZ1P6XFzne/iW4YS0q8yEFuKw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na3cej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:31:05 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-4e9ba1b4712so467078137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 04:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753270264; x=1753875064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEy+cd4XZeFNsCcKEQ8NGnzCxyrPqaqP08OMrM8m9/E=;
        b=FIr7RxTTcanvSfNmhrxUf+XtwHu5sx23NcBj1RNEC8pAwib/eL/BQU3YqjkrhdSItw
         m60OtD9pZemARqY9d+QB8mi5ahK0iP5sZlF61J7AMTMPG7nz8NE+q1D4ZtVla4tTjbaS
         zwJR98qI3L8G4qXdLzg0kUpwkMg/WI5ioYeAdVVOqo25/tmpSuxlhtVwDY04smjuCEf9
         9zHvug9rtFBVccdCqYw1Oh7HHZKfSD8vfwEngI6v2/a4HcSnGOes82uiHysx1qbFr2Cv
         Wj1GrFxyUCP1dGfJiRXgiZ5MAJV22Xj7Jl00WGI3Rx4SAxv/Xm9ebAWfjp0Ds7LYxNdu
         IXgw==
X-Forwarded-Encrypted: i=1; AJvYcCXL+7zVNtrvc/7+s1wEsyJlYioUON4p9FdBQBmgXurPAeDe5PNoq+sIh1pKybQ3mLSSfZwHbZJsk7QST80K@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3kSL6ZHhYFgsNBjDhWw6NLLIKv9A3FDSOvyM8UN70WbXghYVN
	XODWJcqwV/KmPf3kId4BFnXr8gaXwejxNvoYTLL3B1ONQIN2MCIvZ7QxPb17FjMGDs26t59OR2q
	e8POlTTInqDXq567FD+S0mJGNEKKXeCgPTX7A0cWF2w3Xq4lKCXpinYfXbiJrO/RoOoyA
X-Gm-Gg: ASbGncu/28YQpZtuTqOzZaI+mrbVgfqXSd/65lYJ0O9mEgLWCGA1p9VQ/1X5YH9PrOW
	ubX8PWUtkXvOb47y3eGS7K7cNKQ0gXNlLerM+tHHhcktqiJ90d78nAwLZhVITZfmGnE7CeTDstr
	uvjJupHQjmVWZKCv3mpMuQ9Vx1XkmdPgt0Zk/puTpa3yTQrBy6x8z5A7xBqx25McVbBd0Aa+mAh
	NbaCB6r9HBFI691nATJzKukQUxTnkMLH+grznjPeoYQYDOK1IJxcIu882cFBE/VjK4zvQlC97QZ
	062+CBke677GK53aPChfSA44Sy2+OreYl1vf4VgmVSKOR9Dpr61XKnD++0YGxI3oPbjRxklnEMe
	9oxeO3ukTJDa8T7IG9eWXP0uYGKBtTzAWpquK7S4FdZKSDr64Z03f
X-Received: by 2002:a05:6102:6d2:b0:4e5:9323:d2b9 with SMTP id ada2fe7eead31-4fa14ff205amr839590137.2.1753270264139;
        Wed, 23 Jul 2025 04:31:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElI+nLaRgSNGVDgEVXqwotYLUYVXhaufngd/MK3e1G8/fbHHtEjIQSDAJaJfnpO2XvBgiojA==
X-Received: by 2002:a05:6102:6d2:b0:4e5:9323:d2b9 with SMTP id ada2fe7eead31-4fa14ff205amr839574137.2.1753270263645;
        Wed, 23 Jul 2025 04:31:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d92160sm2268566e87.162.2025.07.23.04.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 04:31:02 -0700 (PDT)
Date: Wed, 23 Jul 2025 14:31:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org,
        tglx@linutronix.de, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH -resend] drm/msm: use dev_fwnode()
Message-ID: <6newddw6tnus7yhzd4d2sin7czbr5x77qdhlxwpjuulnq27jxq@vfntrc6tffit>
References: <20250723055512.1800438-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723055512.1800438-1-jirislaby@kernel.org>
X-Proofpoint-GUID: OVAse5xf-il-ZGX0Kk7VNBCji8blm56H
X-Proofpoint-ORIG-GUID: OVAse5xf-il-ZGX0Kk7VNBCji8blm56H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5NyBTYWx0ZWRfX+144Z1DyuLTL
 blODGRK62l0hXsUvwVBjnkVykbaj5KEIgnoIdjcJSYe+OdzjvcLj0UqQtshd5p0Jtwo4itZ3xqw
 ZtO98E3/2Okx3Uh7NngaKVXu8XNb4TK+dg+5fr7jCuo/HU5fV6rcHz4O7ug8y6kzoTnVLIrscXs
 T522PiVDvCswZFrfwDHCbq89pBXFWL2YDXy98iGtzFP/2+2pghNg50GLG2YI0/m7to0Unso1IfT
 91i76tXWNGf5S7ifcWM2tRgTCVLpjzk1P3a+uMOcL/s4vAqbj35YlnVhL7zEDzvnEHYPojE/KZ0
 1wUVmg2dDBNbIrdqpHtqf8nMEBDoQQ2SS0e40FqeDULM4WPpEuMTsMAlXQG6I/CX9VDLP1WnNjT
 PGeSnWA2Ye9SvfEaMCRC97hLaqKojV40mwUelSTXOZ4RTz6pusVahpobUVYq+7JYOj/rdG6u
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=6880c7f9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8
 a=tVI0ZWmoAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=-sS6WOwEsJUFamFQ3l4A:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22 a=TjNXssC_j7lpFel5tvFf:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=761
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230097

On Wed, Jul 23, 2025 at 07:55:12AM +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> 
> ---
> 
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

