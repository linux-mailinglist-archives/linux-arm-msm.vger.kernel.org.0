Return-Path: <linux-arm-msm+bounces-61442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DFBADB0F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 15:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F27A41889A58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 13:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A922BD5B7;
	Mon, 16 Jun 2025 13:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJ8s8/G7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16382DF3F5
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078829; cv=none; b=SkSSf7yg9/rxGaxecPHeuwJOyZZmbyS+IAU8VZu7ZY1ntaI71cXuk+BMvUFV4VIGFIHbXtPc+lu71Ie/52tjeqjW4PZae0SEFJBM8laaqY2BwdyN7E0It6+FYJs+rvhIpqI9kWrG2VMAs5e83AWqCjGnhZUdKXyoOuCprtoKpZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078829; c=relaxed/simple;
	bh=auZ0yWuSuNTN90Mbhfz0CZ6nReOk3BmOLC4d3+rrjQk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BkjqKTY6AjKqs6gfv285UJhMF2kqUeDknW81N5jyGuaw686nBOSX4ceZ8eOaH1sy5sz5ha94R0rlftfIB06ldP52rquVg8FhBQk3mv9fEOys8PAlPcNnRlllxE1p6yr3VbEkXaEyUmQ+IME2BYRxuN3unwbrnZKpELCG6SBBtEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PJ8s8/G7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8hRFb030619
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 13:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7Zpam38ASYSr7xQnoqo9VopR
	RvFRhEcoJAeLiKpm4U8=; b=PJ8s8/G7vuPYt/KKRBVtIMKfxA71IsdLGshcegsM
	/oBtRUcDi43m4HOJzcAtpvXvFP6qo7ebwaxc2ayZiPQ85I/sBGtrIDaE4NcVVnmi
	YuLmSFMzwIsgJeWH8f8d8CLTUa3mhYZGvJbv/1KcVkGCvjK2AxetiOFzBlw6uzwB
	7HpCDVKytPFZngwQOzK0Ut5ttHiCKMPIZBfne+TosxHsisHsCjX5co9zjvrSFOsT
	AVmRrOzPsQZNBKJLk1OlSMhizIvAnmNJ0iTs+UZwJO3g2J4SE6dHGI0BcvsvIjK9
	JAZTpyCLAwyUfaWbRxplBmUzVFsHHxayuQ5Pxp9UV1KWCQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mcgfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 13:00:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c760637fe5so854552385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 06:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078801; x=1750683601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Zpam38ASYSr7xQnoqo9VopRRvFRhEcoJAeLiKpm4U8=;
        b=voL3K6LOY47+QWVu6Qmxr18AOYpajfOcHSaAdH425T8Hp5VWljIytRKklgFc4TDd+Y
         Uum6XV4lmv3KtsRcDe56BvwBboJC+iu9cOQf7GXSMGrOo4sCM05bV+7ITzfNhYP0c1Y0
         t4fFJql7nJeYQARe7PrAMGJxsdHemKHrcpCMRDajZpAeT4d+RcIa+HMBiLhC05LTE45c
         kVH0oOhVs9QeHmcBIWX9zuJH1vN3gs7xliUC1hzh4YnKOPU4gE9FJ0hAeXYxUhdhpAJF
         bRjB3fTeXf09OnWT90XTipVUdPZn7KlJt7O6D+481sgOYTrshX3nvk5wqY9EhqXY3GK+
         +PIA==
X-Forwarded-Encrypted: i=1; AJvYcCV/qaBma7u1P6MTGVK36pukYCifa/8v7m04wOJjNtx0a/kC7hsG5wI08r0QIVqTxUA96dzA4xmSp9BzjLGT@vger.kernel.org
X-Gm-Message-State: AOJu0YwcqE2CAfxRFcT26uw1wLH0c++kfejs/LbF5LoCWSjZ87wDfJmI
	PA3aRGbjG/GUR5CyhJphtlcu8dOpJbbLY9xvYbt7BWdMwU97oqFSmDTeCmlwwECHNlT8v0znSeu
	ilxTTMwk6LoxXfg+NC8fp1mKPsEGAW4grDCCq5aNWGoOafUpNnDz/f+NvURtvab+z4A/f
X-Gm-Gg: ASbGncuSzPXdHcOyUIxa8kmpzSrue3QCpA6tnt6XyceJMPakBryiWpOzNsH268fM5C7
	0GuyuZfZaxooKmjfu5jJgHj9cOV7lmiYWHID0nCUt4y+E9TsMuMlynlPsdQchwx1Lq/tBWyTR6+
	b6DwuIKhwFweNf6/FB5kqpFBaazYvJi9KGduKOyBsedyTacU0e6y5kn6Ymr/CoF4DQ2dQPZhYfp
	sfjhHIRpUsZLqHanKSIQ52FtLfTxDR/NyXVm6GhWNlQ02fdts5S+GqPzmlT3MMXYUIuQFHw8lek
	g6XeTXx9isKN1YEHR7MLa2xF+ZlwAU+MAFRG0dsKkLI5xnY/2ZQnL+DtBw==
X-Received: by 2002:a05:620a:28d1:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7d3c6b813f9mr1342353285a.0.1750078800977;
        Mon, 16 Jun 2025 06:00:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg4SDTgRhUH5YlbN1cKQ4MXmBOOryw7h3rYCkgqVUR9Af7Zp8Rwpz3qnCpmkW6bIWwziiMuw==
X-Received: by 2002:a05:620a:28d1:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7d3c6b813f9mr1342349885a.0.1750078800532;
        Mon, 16 Jun 2025 06:00:00 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2618f0sm142656695e9.37.2025.06.16.05.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:00:00 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 16 Jun 2025 14:59:58 +0200
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org,
        hans.verkuil@cisco.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: hfi: explicitly release IRQ during teardown
Message-ID: <aFAVTvsDc8xvwBme@trex>
References: <20250612082943.2753676-1-jorge.ramirez@oss.qualcomm.com>
 <54157ce5-8a6b-75ae-0a21-a8df59242c40@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54157ce5-8a6b-75ae-0a21-a8df59242c40@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA4MiBTYWx0ZWRfX60QiM4HZFT/l
 aIWLpsgL7bw6oV/9OowtCGyNDfXD2vNJmzRPD2L2N3/CTqTmR3NIptcfFsnkuzADE3jd+yngtzl
 wm3JDMccUIgoODfirdBGhBSDqaKOJbnhvOAsmt+E4G3VS3/1Beiotoz9To4pTIFnoMEUJnVx+ch
 li6B37AqxgP2HEEkVmK+iRXgZ9+NgTqBkBwxdEsolu/0Cq3NbEkbQHzm7YivkHmjdef1wBjY+4b
 WzyUzh/Fu6DhD8KVXUS069Nr5EQGvAPYuIXc6+KJN0puZlSYBEsEZRrYZPhNmsSRky6YFICKgGc
 cRbtxXFO1n19Un6klEP8fXyFfXrfJAlo/U0NtRib6EqmPzDkSqPZwjPsQUdIsfg7AX/NFZJlO9+
 J6nTlykOmT6tIFGu3pyjeMvW6kB+YpWU2IyedPisLhNVNN8LyZodWgVv66owRkYwcLlFlh80
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=6850156a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=5yDEq8l6dJnGzMHSUIgA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: D49P_CLssS1tdjr4E7VScL4Bc_hv70IC
X-Proofpoint-ORIG-GUID: D49P_CLssS1tdjr4E7VScL4Bc_hv70IC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=947 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160082

On 16/06/25 17:26:24, Vikash Garodia wrote:
> 
> On 6/12/2025 1:59 PM, Jorge Ramirez-Ortiz wrote:
> > Ensure the IRQ is released before dismantling the ISR handler and
> > clearing related pointers.
> > 
> > This prevents any possibility of the interrupt triggering after the
> > handler context has been invalidated.
> > 
> > Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> > index b5f2ea879950..d9d62d965bcf 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> > @@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
> >  	venus_interface_queues_release(hdev);
> >  	mutex_destroy(&hdev->lock);
> >  	kfree(hdev);
> > +	devm_free_irq(core->dev, core->irq, core);
> Could you please check and add the handling here [1] as well ?
> 
> [1]
> https://elixir.bootlin.com/linux/v6.16-rc1/source/drivers/media/platform/qcom/venus/core.c#L427

hi Vikash, sorry I dont get your point - what do you mean?

> 
> Regards,
> Vikash
> >  	core->ops = NULL;
> >  }
> >  

