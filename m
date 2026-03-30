Return-Path: <linux-arm-msm+bounces-100877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDaXOIvDymmL/wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:40:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 620F735FD46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:40:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05E9630338AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090563DEAC9;
	Mon, 30 Mar 2026 18:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIfh/4pp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Huj/pAvM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04953DE42C
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774895977; cv=none; b=cneVyHsdD3BEOqO/REibutezEBA9QHuoTRaZDAHSpQ+2TYbMe6lADlLIIgNxFJPin93pwDkX9U/F7rhlZeZ/hhD0lpjT01HH271lsB8rtla5WqjAQC8/hUWlilArTbht8yiwz0FdT+NHWLB8Ho3Vs7rQxLs/1yz2iA4b8gi26BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774895977; c=relaxed/simple;
	bh=jt8ZJedIC7qktM8/LDiP9QaW5cwF/fa4m5+gZnl4PZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjzmpS1aMdIs7PNUGO03GzqRvBgM2gB0JAJacC568uFnZh7K+NUcCS4EnhscV+SurrzsqP5HHbS9ao12gui38v+XtWPivoY6laJ8Zn6+er22fKi4V0UT1LGcKkg+MJ2OKk+rp0x/R3MyZ6H5ns/G1xMmyLsUE6vQouMUwI5yoy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIfh/4pp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Huj/pAvM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UG4DYV3668677
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i2E+GE09FmltyRsV3H2OSAIQ
	wNIh7dFlCvCCHrzV+aU=; b=ZIfh/4pp5HbF8TUPbT0rdz9Jwx6gDNi1ltR9pTcP
	Mgpxyoss277mPutIlk9V9lXE+zf1OKOf8CJk/0HUgdjmgYIptPhzHg7RT3sJzuRK
	mldUH6bjZx2rcmkeb4acl/ZX1K1k4dkwSxJAfCR3E8O9i1kWwpg9yjyC0YR4J+ey
	P7G+RY0J6EMo3YKhA9B1Y4ClHcEepmXRiO+Nnpok7mgYBuxk3Q+c8o881O6vQOOi
	GrPtnoUoeiRNA1ldVovOJt+WJs9Nm8O1IhkJxXGD3b0NKGb49MqqiVUlif7/kTJq
	k1RP8XBPoWJg6t/kSLWR4sZF6796pI7pkNO3TpUQqfX5Gw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7vcc0m1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:39:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b802961ecso65027021cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774895975; x=1775500775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i2E+GE09FmltyRsV3H2OSAIQwNIh7dFlCvCCHrzV+aU=;
        b=Huj/pAvMuzWaZs0fer2s6wOSwa8ZlrZQa0aCj/SCrdrKai4xdJf3lKJmD/84tHQ3au
         nMq8CGnKChmQpTP2R01qfeyacMgv9QBr0xL0DP1NVId2Ma5wOjmrG6lKhu4nsQ4zhinC
         58FA1LQd3Re0CXIdED8nZ8XUBtRDY9sreiVKfqSLibbgHbVdRMNKiZUCsL90XXQweW0F
         gH7MpLwsMdHzKnbcXPcipC62Nkqz95310UF6k3OuTmH9ZMiXG9s62+sSFZDICeSp0YEe
         ETJ5Tcb3Ry7IzvnwefiOdBzBcG8R0+bSyfsFejeeey9q7bBX4oEUiaQOdDRylfzW/zio
         Dhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774895975; x=1775500775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2E+GE09FmltyRsV3H2OSAIQwNIh7dFlCvCCHrzV+aU=;
        b=go4kC27A2NVIIaKD8QrocfSwz7Uk6EAI1cN/6WVzK6K2uljvzSpe0Z+y8oQasYHg7t
         AgDJRoZUjZLkPKMboMjUMGzrRokEVqUIQZ/8QLqOQAkm1YmGnaRdvMKqj+Q9Dso2SKdN
         OXana3/BEr38b1HkbSZhYra6tan2SagJZwqVg2P6IpxgB8L5ZigxuAw6C5wSorj4zEsl
         qY2leXHaih2XP9xAnVsbGGUBIgcfWP8MxjgpjB9cknxf4V+zonPbj7wiitOvlwHvF5pS
         TaxSB5K48BaLcx1K4Yeg8o9WsSQi75iKYqipHTsPa4rNhF1oq2Eu4tTf1uan1gx367kQ
         iDVA==
X-Forwarded-Encrypted: i=1; AJvYcCW54u6dfczFehiE+bxAitKbJJv3aQkoyv9qJAARxzJoXMw7KFat0okC2VQwxtttw3VzZvHffWONA6uHZtlc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx14Or7m2dJLanJwOYz1b1C47hLVG+myNWeJajE67nUppTaoxt2
	SUE8vLcnMNtDCNJ0fxDCwH1AOl7HsPzJFiiY3AAjVg8KvQIZ0lBwLgIu0+ffwicSqV3Es6a/7FU
	7Ojab1aQvU0lXF5pRNwYXYzZTFxX/K6SeI3aCzkcCD0QA0kuZVitTIwBIboBEqGBFWRN9
X-Gm-Gg: ATEYQzx7YwfNP/xMa3doYJ/36iI831UoKvY1/wcrndq4cOiTBPAG+60REIl9hsbAmqS
	7bD4qC9dfx11NYjs2JJffbaBgxCzkiQER0l2i91lO0HFKQ59+VCA1MMYjufagaFsFxPIzx3y502
	aWaVJrJTarPguz9g5Ajy/3IIxlQAj3LZ5pAU2RWXW2wtaBhlAkkLu3ooSRhg+3kCJQ99470dEtY
	aVoKkoOrd7Fy4KH7nGM6CCgZem/GOD3WFHuXd32N3srzqhP1NnUhBXP0nWFyxJs9KnPKh/87w/y
	sSUe8z+/2AWojKjQjAbUeskjiBbry/M/xy8m7mOVT9/L/FcJeu+03hRdjapPrRc83JV9DU11Y11
	UDwV7XO8hmBKWJ0d+JzCHBWIOXnChYQxmIFQ/hqS/cJE3okD4Zd5IGgUWuR1dvFKS0bS6ECDuVq
	GETRm4Jazyg94qCV05dmU/qtBIWMyMlic90yw=
X-Received: by 2002:a05:622a:5408:b0:509:1949:7b36 with SMTP id d75a77b69052e-50ba386e266mr188295821cf.30.1774895974903;
        Mon, 30 Mar 2026 11:39:34 -0700 (PDT)
X-Received: by 2002:a05:622a:5408:b0:509:1949:7b36 with SMTP id d75a77b69052e-50ba386e266mr188295461cf.30.1774895974338;
        Mon, 30 Mar 2026 11:39:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f41e7sm1842309e87.5.2026.03.30.11.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:39:32 -0700 (PDT)
Date: Mon, 30 Mar 2026 21:39:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com
Subject: Re: [PATCH] drm/msm/disp/dpu: consider SSPP line width during mode
 valid
Message-ID: <c7xvoopmujdmdar4lr5oghcc4olc72fpfrpe6yq7wrmtqaytjg@iweixftggvbg>
References: <20260328-msm-next-v1-1-12ac4e27c670@oss.qualcomm.com>
 <v37m6z5le4rk56b7pinr5wbi7l7s2bbgkggglx4eog6w7ja77f@lvyxc5tks2bs>
 <acrBL4fF4aiAw8m9@hu-vishsain-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acrBL4fF4aiAw8m9@hu-vishsain-blr.qualcomm.com>
X-Proofpoint-ORIG-GUID: M14sJXBYHUpX4_aysPKSUMXhtq5_dAG2
X-Authority-Analysis: v=2.4 cv=GbMaXAXL c=1 sm=1 tr=0 ts=69cac368 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=-cc8BWXbKmujejAm6N4A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: M14sJXBYHUpX4_aysPKSUMXhtq5_dAG2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1NCBTYWx0ZWRfX+8S5YMKc8c+s
 jIzSjSe1U9Pk+QLXFPAGQvwL+kegxkaC8VZYMY0cq9HOirZ/k0O2v94SQ0Q1vdkodZeK6aX7DZF
 qkKhVwkt4bwIy1EYyCjANYuvGPGn0uFg/3oh46wfuGsedLRjoOtC/Ut4TRrGHcqbS2LvvcmdNIT
 VyWaDkuKFgFskmxfgUDgEy5TPVkvUqvfP4pbewK64ia2hPm2/3jovIi7QTSApOhEn+9MP2qR98p
 uRt5LZtz8NvbIpUB/Y1CsF6VnEMSrIIiLaLCXPp+9bsrWyFuix08nKLDUOJuQ83bnPOmC5Eobvn
 fH1HuIVlORzr34ZRpZkHRHA3bWF4dMOrosYZUJ3I/hD0xLsNyYWwwJcEP3bnK3n5M60cueovu/d
 d+nxI2yzULrDPntwqvRxBXr/fHllFWg2RWVK1+ABVgQKShKmFuJZzln2fTtRsd41bvTnt4ata9p
 v3By/Um+yo39YtZQhmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300154
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100877-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 620F735FD46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 12:00:07AM +0530, Vishnu Saini wrote:
> On Sun, Mar 29, 2026 at 02:24:53AM +0200, Dmitry Baryshkov wrote:
> > On Sat, Mar 28, 2026 at 10:45:35PM +0530, Vishnu Saini wrote:
> > > Few targets have lesser SSPP line width compared to mixer width,
> > > SSPP line width also needs to be considered during mode valid
> > > to avoid failures during atomic_check.
> > 
> > Technically this is not correct. There is no requirement for the
> > planes to cover the whole CRTC. Nor is there a requirement to use only 2
> > rectangles to cover the screen. As such, it is perfectly fine in
> > mode_valid, if CRTC is wider than 2x max_linewidth. It would be an error
> > if the user tries to stretch 2 rectangles in such a case.
> 
> This is to fix an issue with 5k monitor on rb3gen2, since SSPP maxlinewidth is 2400
> it can't cover the whole 5k buffer in left right split mode.
> Do we need to fix it from drm backend by dividing 5k buffer into 2 planes and 
> use 2 pipes in split mode.

Quad pipe is pending for 7.2, most likely. However, I think, instead you
should teach compositor that if the commit fails, it should retry with
the lower resolution (it might require somethi g like -E2BIG from te
commit).

> 4 SSPP rects --> 2 LMs --> 3d_mux --> DP
>  
> > > 
> > > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 12 ++++++++----
> > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

