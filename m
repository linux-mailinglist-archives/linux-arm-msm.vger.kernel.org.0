Return-Path: <linux-arm-msm+bounces-57974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA21AB75D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2F554C1B15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D2A28DF38;
	Wed, 14 May 2025 19:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rrg3c3g5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D5628EA72
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250623; cv=none; b=FEvIFjR0hSHp/7ND7XFOh0hOZP2Nv4hUdz89+J+DY4G2MHaDC7D+XI4dHFpkloKBYFw7unjamEvxqrhI946ZzsmaIrsKub1OP+c+Nz00JYvpBS4Q51oaQQ0VJEziWLJbmkmpXT3pzK1gKixO1IwmiLI6n8xMZKT8m6RdxWeNNug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250623; c=relaxed/simple;
	bh=e0fdyVmf32qqHONNTfPkAQYkS29kfAvEZa7mArWCVO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMPy15um5sdprP1aKidXHFXEBPGAh6BiTATpTMdLsFwvG1rUqozQJQVtxAGIPngzkoFndVjLllK7rny65cbg8DLmy8hyS2Xwvxes9LAvAmF6TpDaHcr6LDkhFNEWacCn7dYR4+zw3MNqP//LNmJtiJCn8aJZO6soRZ6mHWBZSlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rrg3c3g5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJGGOX012844
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yni3LltaA+0t8FG4nm2JYBtt
	/uZ60urKlv5zgXzidKY=; b=Rrg3c3g5co+tTuf+LdMu2tXpZFIPWU+w+dBOXMLw
	WNs6nYDjR1A8DgZ5YfHK/8Q3AaCwBlUK8axzq6vPToPmEJc7yQIWgViERORCbh6F
	0/aBMhSi02ITQi6F7qJfs0f5iewwlE8V+67c4+mui7Np48RuFiCWxs3FsCY6HpQG
	x2Yengs2V6ehaqoI7b8rYGEOljnExFGNaCnxERl3YiKaLYHsBlNhHh5NNoP/vZmz
	vwITdVi2iT6tK46AD+nEkhZkJfsPiG0vRQthZTlLfQddqY1XlqXPQUhqxdZOE7+1
	Xo9DRmxCRUZlBlKNzgGwQSZGdXnMLLy6IgXZRFMtexxEbQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcykw73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:23:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54e7922a1so18595085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 12:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250620; x=1747855420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yni3LltaA+0t8FG4nm2JYBtt/uZ60urKlv5zgXzidKY=;
        b=Pbb0PODmBtIFqzqcIbi+IXMynrnpnma3Mc0woTjahFhm1ds3wSMw2AD8+RdJ2L9dSW
         eKDvwFu787aJnt39eg7CMvOirxnolUDLcxpKw3ZdWyZl2xeQ18PueabT/bJrJ1Gg8CTE
         hlQ+f/c8bSJxlNLReDmQT0DCckDrKnbn6gumiLEG2s0eGu8BRz/xqdWhpNodgue3oMQk
         ZehjCv/bC6Yp7Jcpj1uCjXn8B5GM/QcrFgbUbc8Xcz87MJ0KKBgNDpHIe1kLmde8rn2Z
         MMWUVGmO+9mZYs7+7pyb2LgMJE4YPyobxiJ9x4sd0OY/aXOsA4v+keJg6jlJtunOas75
         ynNg==
X-Forwarded-Encrypted: i=1; AJvYcCWy5c1SK5nNpnGAjyx6bDVNalTG1o4Qipcr6PPq46scuDodFxtQPd5FwRCn7ZwZbpJZ7IWiPKqYzUuX29L/@vger.kernel.org
X-Gm-Message-State: AOJu0YxtDBaYLG3DtLKAhqkATAwH7cosi9W7VkFaZ3yoIS1Wte1MxcqQ
	hjPnK7QDl2mgmGGRxeSCs6ltEEdVbpAEpNxIlLJMTU9Gfo5Sjx+m65lWYDn1LnDy4UxxQr78Qgv
	c+ZnoJkrAPswDutZEFmiBLhg7P+hoqeMzlZCrwJDKULh5ILcwqMYZMOPOOIKxfRNd
X-Gm-Gg: ASbGncsN7Bfbswao8hxrRo39XoDSt6/gZ7ByaMNOaY5lhcbu3jPjgplbwnR0qmAU5Rk
	hx4KGdr73SbNX5vr7dPYbckTycPi7g7idyGFjkGiPt0JVaJhSYZ9INswKP1OIxelyLynQRt+zc5
	1+r5BKBOGM14IQFMj+KTzaTrkgv9BXndc/Hgz5tQ+9oIJTunejtyotIn2eYp9lWT5XVvaQnfTER
	Z7pV6heR/jPeAydmyD0e+sNyHmiKbSwU86nOIoSbiOGsBcI45WVFrveVJkLyFGu2+BC+yUoKtUa
	Soo7Kt3iEKGXmM+4CYDgGxh6FbCcUrF6OMl4JPy/JyqVRGC9Fdb8jKL66cqM/CS6hOfgOEMfGw0
	=
X-Received: by 2002:a05:620a:1a8b:b0:7c5:407e:1ff8 with SMTP id af79cd13be357-7cd287f8fdamr535578985a.2.1747250619600;
        Wed, 14 May 2025 12:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBX2PjHSIJlvnaBpvy/6NraZk7yT3imlz6y9snlTUgoROJLWl1hT5lxeeviHrQmSmcw02csg==
X-Received: by 2002:a05:620a:1a8b:b0:7c5:407e:1ff8 with SMTP id af79cd13be357-7cd287f8fdamr535574285a.2.1747250619083;
        Wed, 14 May 2025 12:23:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c33b7b2asm20255511fa.33.2025.05.14.12.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:23:38 -0700 (PDT)
Date: Wed, 14 May 2025 22:23:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
Message-ID: <lkkwnmnk32igcev3gykmtxsohyskj6ehylaypg2dyxbedvksee@lnuc4lfmzrkm>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-GUID: GWNrLvGQ6MthpjcDCvHuap7Xd3tuOa5O
X-Proofpoint-ORIG-GUID: GWNrLvGQ6MthpjcDCvHuap7Xd3tuOa5O
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=6824edbd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=jk0O2evD6aPmCTIX_U4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NyBTYWx0ZWRfX1ajC4J5n2gP8
 Ew44QUUMiZpSEbZtVr36PuhV1jA9BFn0mUY1qRnuWd2N33E/WSqp1NjjMa4EhWNPVEMoW4TkJGu
 NqyVTozL5GaTVudwaUuC862Dv0/EK07rmeOXmmtiWd0h5fj90xx4/vxCpJntr0xkfWNiAW0Y9Tc
 KxzagfD7v8HalzL+1sN8UCRmRzoCEMMYLQLdxw+iedYiAEqlvtbbUKDjOJy3Is3OviieNdFN3uR
 KnZ2g3blSPGX5QXGA3g3CiFwqBzne4NDyzPM7jU2neMXzTAXGNEj01yBbuLHu97c6GPzpnX5c0m
 /Z41L4cKEDBVHtwzX1qi5JAi8FiLNNB9kUUfLXMy6vgIOT7fU4lH83WZE1NVRptzKEq3OOkGZd6
 S9AHZo/7N+cP0StyJ0QetR+Hc8k3DuF9D0UEUxmRWRt8RIhMo3DK007VEZ4wBmelqtPGtA7X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140177

On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
> swizzling) is what we want on this platform (and others with a UBWC
> 1.0 encoder).
> 
> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
> bits, as they weren't consumed on this platform).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>  static const struct qcom_ubwc_cfg_data sm6125_data = {
>  	.ubwc_enc_version = UBWC_1_0,
>  	.ubwc_dec_version = UBWC_3_0,
> -	.ubwc_swizzle = 1,
> +	.ubwc_swizzle = 7,
>  	.highest_bank_bit = 14,
>  };

Add a comment and squash into the patch 1.

-- 
With best wishes
Dmitry

