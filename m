Return-Path: <linux-arm-msm+bounces-83355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 571DFC87D14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 03:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 88885354AA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 02:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55DB723875D;
	Wed, 26 Nov 2025 02:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M1b6sxjb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Me2gcJKF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7182F6199
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 02:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764123729; cv=none; b=a5UmBuMtN80vVa4vLjW1/+sSQ84WaBG/WS3HyLHC6Igm3y8L++KmWFu2EfcJLhjkQoPOmuI8QAXqgtLWDo4lgmYnoYx4CY3ijzQGKL3LJB4Hv2OkfU20TFaswMX0NThRvpVXs8dBF0sES8V44ek3m4vyA0QF65seR7BtQ8GxXhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764123729; c=relaxed/simple;
	bh=l7gw3rEVwDzGn2dQHpz5O1qWU0UM4ZnGaVGBpmr6v3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buSsQJvCX5P7LzaxpgvmvJ9NCoyUoWsuKxwcYZ3XRpsejRqsihS+STxwzqhMJzM/st5aPhb6Qiy9GjJrCF/kZHPRrm6u9NOVJ4hirCzl00T2MZnPneehGaBzW1z4ciaVZ39elzhOhiEMOfUm6akYNFcqhPm8AYFX9PLyxevCH+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M1b6sxjb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Me2gcJKF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APFxxf62655501
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 02:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5qlJm1PEgSWHm2a5dJnrXFBs
	d/b2sDxumfwZyTWBOXQ=; b=M1b6sxjbMY/yyo/2Co895konDqRTAOrFpe2kt+qN
	2Y2FiSJ8Rf727VFurzlCWB/Ll18NjwKoeLBrWlZIj9a89sioZXU4UeM5kgXi1jYz
	a0PjtJ13ejfDWydlBtQytL2VbMCNMZ6Lqv/cZUT42D1q6z2+409JZ5m8MU7+PSEA
	QuI/z3DgTIn5cDyGPGZeMzluToAX1YgYfkQ9UFCYxfhXqRoPUpRfCgl2kN6GLGW8
	SA8nf0VA5f7uuR7DwtmyYbThyBJNRan0d5gGD+i2wAHBe/LYImryuGKNjd0Xr3hS
	T2QqUxhRKdiLm/My0HuyXR88jcKHOQjzuoEFFJvMU570DA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an9fxtqw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 02:22:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed69f9ce96so240733741cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 18:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764123724; x=1764728524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qlJm1PEgSWHm2a5dJnrXFBsd/b2sDxumfwZyTWBOXQ=;
        b=Me2gcJKFcsiqBnMjs2efdiRQGHpauhi0/ZJXD59yIIENPoz5q7Dzj9rXrF6NHrxe+4
         sfTCw2MfxWFnFyY2hdZaLm51J8NJJuMGEDBc2WTDKGp03E++zTbbid9FqLTt+6Yv9sjD
         kzQPea0EzsdD6Wu0sNU2RVb9CxQFU4XNBwEmJMDjFLY4UFdKlwrmDw/k5LsM8pRMnko6
         DigOW5evsrNQQSS01f9FIwrgMPKhUPfOtUjoYKjZ8QVy3wWLLWhtx4KbcuwehYr2AaPg
         70l8D/Mkwhals2ZJ5rHTi7pk3wEMQ8T0miI5B1XwyRkV3eetrObuWtZL04iu2PccDabh
         WIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764123724; x=1764728524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qlJm1PEgSWHm2a5dJnrXFBsd/b2sDxumfwZyTWBOXQ=;
        b=fTc+DhJRgfkX93eDn/WpY8NNGhsH0raaF2x91P2AbNFCurFne5/lygfC0wEnmL6oQ4
         AULYceoPB2QuzVrpp1hCqh9UbsfiVGr5Zn8jBQSamvQlR7mmJLBoaqVdqgpGftdB+bxz
         lGNRIhUJHCGW4cQio322AWMAN0ljtjxaj6wVvEp2iFESiI/1Q5d5zW1jOERZOYBNelPo
         yyNPBYKgNC/33peuUGdz6drC+eXf6utrHq7k2L8TO1tcjIT8t19+89tVFbF0vZnocniv
         HZihylQRiTvUaXn1uef5Z5kuCsDRR7YFHjT5e8CwSP6VMpzHAvc1MQpAZYpuInbvIMyb
         /zWg==
X-Forwarded-Encrypted: i=1; AJvYcCVQlit6hY5zp3wWJMxtwWUHfdEy84W8ueOHoR9Mei7Ldywzm6cUgxZb05BnY9UzAOQ2N8FhB6W07EWKebx5@vger.kernel.org
X-Gm-Message-State: AOJu0YxRSgVxp10ophL1+uQj/q8iqF+tcksGCbeOixTbwADNdAEQQJ9s
	4jE6ggXEbGZuHn1F0Awb7R9BouzAicE5CzMQJdsduOQ8SS7ecOXAFWO6nLCDmnUPgUJAlaZJb0Y
	0Ki7dEVSpSP8SC06I6+DvijrFio97n5gsUgCHaYltbEgg65vGQWm9k0yOH4TUJoeoXyJq
X-Gm-Gg: ASbGncvabs3TLXdTgNmgsTdIprmWds2JR91/d+Hndbv46MO21yPWbdOtdVYOT3fc2xp
	qMu3+OI8TW5UV2aXBf3L8DVhkxr4U1du0NyPlljWYEfEg5TqxG7GqBVX9YEujkEg3VSL9vcP1ne
	zd3D9H/sC5erGvw297PdyCaDtT8a3MngxsszdwzNbHfKsrRk6URZ7Pt+r6B73MydV6wFvHS/kAB
	Jz0LPoEp4J4q7lqs+gaBDFKPe8xjMCmnQYhIAU3Xd3Xx2hgkmGh/BuhamKOUP+mFtQWlrGQ8DWh
	6ylFh3Q5e0dpBlFK7uYgIBKTLeobWMGN+cgtQb5Gwvfa7U16IsxpBt1yoUlfBFC90ylUl7nYnoB
	4WThaB8pcF9F/6eOv+rQG2l0NbTJsARFHwIHW6yie4NyDRl9+Zw29OjHbFTaH3FXA71NlpN2T90
	U=
X-Received: by 2002:ac8:5f88:0:b0:4ee:3c15:f3e8 with SMTP id d75a77b69052e-4ee58af8ba1mr222371501cf.76.1764123723902;
        Tue, 25 Nov 2025 18:22:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVLUZPGR1liVRkso5mzj488BQHwRs7zWR74Ymgv2jrMJBZwQWKhUivIrdNTXEgADPB9mIxOQ==
X-Received: by 2002:ac8:5f88:0:b0:4ee:3c15:f3e8 with SMTP id d75a77b69052e-4ee58af8ba1mr222371311cf.76.1764123723515;
        Tue, 25 Nov 2025 18:22:03 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e4682c7sm139564396d6.16.2025.11.25.18.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 18:22:03 -0800 (PST)
Date: Wed, 26 Nov 2025 10:21:51 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v2 08/10] Add interrupt registers for DPU 13.0.0
Message-ID: <aSZkP/8xK+rdCkp9@yuanjiey.ap.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
 <20251125064758.7207-9-yuanjie.yang@oss.qualcomm.com>
 <5ncorvgosgt3w7flwtwpnsw7hg2js6inlyfmidds3ozt5uk3gd@7t47ilh2jtwq>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ncorvgosgt3w7flwtwpnsw7hg2js6inlyfmidds3ozt5uk3gd@7t47ilh2jtwq>
X-Authority-Analysis: v=2.4 cv=I6tohdgg c=1 sm=1 tr=0 ts=6926644c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=smo03e2hCPVHdcU4MTQA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAxNyBTYWx0ZWRfX965wn8bkGIEV
 QJrgAxI73njh7ip7H+RJQHuzC2fSbl/P4QQofqhqXqT0rno/7AWDn24HHD+FGWitoFx7mgIwkFd
 xM8X0je0vGOO7TPbAFnxbDWLMJooGJI9/PgCYoF3Smllr07jDhLLaiYSweqnT848Z7I2R2nUHph
 r2lA83jl7JtxalKseZo6uuZLAw2l15zMv2Qy7OtTwrdtMiXNaC8I7STZfylTk8vPT/gKB/RJpEK
 G8YmoJxGvclOe9Ldk/uo8GlGY3nfbqSvJ1Eao51zpLngh4pJpsISRHeuZwbUXSiYL0B/pL2kUGw
 VTkJWlQRsnx/d7My9tRUfJKFkFgDyHesLLNNvqyyg==
X-Proofpoint-ORIG-GUID: 34dqOWAK9gz-7b45uTd25XCzNKuSj-0H
X-Proofpoint-GUID: 34dqOWAK9gz-7b45uTd25XCzNKuSj-0H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260017

On Tue, Nov 25, 2025 at 04:50:13PM +0200, Dmitry Baryshkov wrote:
> On Tue, Nov 25, 2025 at 02:47:56PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Please prefix the subject according to the driver customs.

OK , will do.

Thanks,
Yuanjie
 
> > 
> > DPU version 13.0.0 introduces changes to the interrupt register
> > layout. Update the driver to support these modifications for
> > proper interrupt handling.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
> >  1 file changed, 88 insertions(+), 1 deletion(-)
> 
> The patch LGTM.
> 
> -- 
> With best wishes
> Dmitry

