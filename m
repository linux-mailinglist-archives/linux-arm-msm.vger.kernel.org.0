Return-Path: <linux-arm-msm+bounces-94961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMBPNbagpWmyCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:37:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CB14C1DAFA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C014530308A7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 14:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691523FD156;
	Mon,  2 Mar 2026 14:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cpdhu6Jj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C0XLerUa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B9C3FFAA8
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 14:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461663; cv=none; b=dBegDM+WgJOrhmginXuvEe5rV30Jqgsh9RPq8x/3rYkYRhytjNEqB4fRRtZ5eb8IPf+MVAETLYgFi4YqQziMw7Ks+ijzBJPD1Gcfb5TXKC0ijV058D+GAZ6m7knznBAtO7617n4yq0981xsy7EQUoPc1uuW01jjI6nNSPoJ7Qm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461663; c=relaxed/simple;
	bh=IYXpHc6S9sdnYnjh2tMaJYuwuq7PcbcQVapzcr/7FoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNIMI5+v7hxxFXDRBWZdFhzRwZD+vwkEmn8MDa87z9reNJacwkg3ddQKa8OjiIFhppmgIsW7jKv3wZq2/an5N5gEa9DX4sq5I8Zw7QvmFQDH+lyHMscjeZ9GEzg/W6rR1w/6GtCOGQ8cwHhJQt7cAY/P/49WYHlInqoi3h1rIbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cpdhu6Jj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C0XLerUa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294kgx3753339
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 14:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rCoit7n/E97O69RwfnYeJCNG
	G+VE0LvE/0kxXvBG0b8=; b=cpdhu6JjgYiJRgbzqFI46OD1KIQgm6Wn+T4osLoG
	nRfy9rze7BVGINse+spHgxDV7Xy/yNyzauSsFItObbyhoncdpoNWvblwPHRz7Uyu
	t6RLcl7QXAMvUV4w78x4G/NEnMPVfCBCee3WvUPgXwdoErI7DuPHHBKDqcIIyX0F
	9aFdQEmyqb79hQBAMCPcXwRW02qHDYYWtueicwPrjDVE6DipbICzqpcA7M/oxOzF
	qdeMkS7DoyKi+dHDHN3/UW+tBCF4p98QVBaXl99USW5STxOUdBfWS4/9QawtVVgb
	XRuHz4pPIhIpwIN3coTA9UauALTo3wcycLv5eJ8LrPTMRA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kq938m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 14:27:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899e89bf366so1576516d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 06:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772461659; x=1773066459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rCoit7n/E97O69RwfnYeJCNGG+VE0LvE/0kxXvBG0b8=;
        b=C0XLerUa7n6Fxr1m3Pcbft7a4l4qVBQ/v0j0hf/QYl9Ouw5mqT7uRchFoySMvLcjTQ
         NZsJlBQl+DUnqqdtIPUYz2Sk6sqzaKRag6r3fJf7Pmdj8NFWhPKG3MzY0McUQRFlKi6c
         z1a9+pQ194lXBkjNcptTuHuUqChcYUlA34lk5CT4RjEvYZSvUjOvdevhGOcaJT6FQVne
         pv3tcctKVwolJjuMRw2SEfIAGCBcV/gRunrjDnyCrAEzRqmIHuA2ULxBLw54dF98WYxJ
         U/sWvDmGosLToaY+DbJydQhBuDhaQ1iHvksGrif25mC6FxaKvTEIylcfclJ198aIJPhE
         7GCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772461659; x=1773066459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCoit7n/E97O69RwfnYeJCNGG+VE0LvE/0kxXvBG0b8=;
        b=k3AgWN2zCYO5uP3nQZOsH8YNE5cmK7OCqogD/X7GMPJyhMXpU8Zu/krMBESaXKQ9B2
         Ti4J/SZzBVpPIgK3sYymuLKCEcF7h/+idDrNmubMZ4sSptWBacTY/R7wzLRe/gx/Fqtq
         3sox+J6EeUF6vgui7GxX+DfDsnvaXJX8PFYigMA7y8oC/T38UDe35JOGH0lEnz54IAH5
         L1+TL7OaeQYk9CKHNI6zXczksTiLmyxioHeYRHqrn+kBC8G3FVA46o+h7WoIGqeOXeMJ
         k+gRWM3E7tGXWOlPAEu6o6yMDCDAw24URjZNWEKLXz7xJVx05eqYgr8lYmIo5qMCpCPs
         xyLA==
X-Forwarded-Encrypted: i=1; AJvYcCVCclwRzRwvg5qCquBhqJF0TnXjhfgFJeNEKjri6SmUprJcTkED46bw/46LnytO7wU+oVTCe4HmN7FXY/dU@vger.kernel.org
X-Gm-Message-State: AOJu0YztMxY3Dv0phZAMl+Oi4EVC29WhiS1ec5X0htxM8+UvGdmOcaD3
	/f+/MyvVAa+/XWSPN5mHjfMe71txZYxkddaFAo5xW6udPT+R6+5+0coO8l2L/HDl+wNMfgjUHiM
	vBIkMAthdrng5cqbRNzsRULcbGOWGkaQ4V8rZ/niJIzo8p+baDwjVnTtX/3Ytb2amX9b6
X-Gm-Gg: ATEYQzzaPh5wX0kTHJYC5FzEHo0GtOLymKugSKvDe4AKYkjW1CnKI7+kW95/Icrxb41
	Yh49j1cC09GeKC5jd1mtiwTYJAI25dYXIRhxBbTsi1cV6P9J9xvq87hWPejQW9M4dhBZ70IH4Rm
	iDjCBwmnTGPJVV6YFJasl/j5rMcrTDWUVIIlaBJPCgXW+fPnH9jNEVcB7OyNa+i/bfkW7b4+wR9
	K4l5A5Ay+IPTcwgls4UYnfn3pQMLO9TuOxyCHTh1KgH/qTjF8manpkMgumgCrbn0JSfoJSG/2wt
	o3M4zk5QOpwSc2J1GGKzKou3DKnisY3hHezhf3j8eNMCQ2YMx63/I4uYwL/XHLPv3ff+O9rEg6h
	YRNE+zyGMRvUdtYRg23hAJXIqeBRqmwR6r2UcdJZIWBat953PW9CtmAbGMrm13IfLHn3f/mrlRz
	+ZAmlAy0Csk8VQm1nNIzwYNsQRDYdJCY/rN2g=
X-Received: by 2002:a05:620a:4892:b0:8b2:f9ac:a88b with SMTP id af79cd13be357-8cbc8da87eamr1602991985a.21.1772461658839;
        Mon, 02 Mar 2026 06:27:38 -0800 (PST)
X-Received: by 2002:a05:620a:4892:b0:8b2:f9ac:a88b with SMTP id af79cd13be357-8cbc8da87eamr1602986185a.21.1772461658038;
        Mon, 02 Mar 2026 06:27:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a11771e36dsm1546141e87.78.2026.03.02.06.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 06:27:37 -0800 (PST)
Date: Mon, 2 Mar 2026 16:27:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: yuanjiey <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
Message-ID: <5wbvy257s553jyqzgqacfxhbeqgkrqui2yspqwjh2iyiz6ljoy@olo4l2kbrcjm>
References: <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
 <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
 <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
 <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl>
 <cb22367a-678c-431f-9f52-33663f4af9d7@oss.qualcomm.com>
 <jr4h4sx42dbxpknm5nkgj7ydpkivm4nglfz7ui4bjpom7wf6ub@spqb27d3ov2z>
 <d5c4eed5-bd87-4156-b178-2d78140ec8a9@oss.qualcomm.com>
 <w4ldxcxvcp3fz7u2zxyyjiii7lsrnoa2l6amzwpsn5a63yzotm@iawh6btqtf45>
 <b230815b-e169-4a3c-8c36-154deaf66afa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b230815b-e169-4a3c-8c36-154deaf66afa@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2gFD8VONOXFyP0KaYqKCmpzM67NgeEAX
X-Proofpoint-GUID: 2gFD8VONOXFyP0KaYqKCmpzM67NgeEAX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyMSBTYWx0ZWRfX68pGt1vEar2S
 CBPRsr0qqoguqflZQGipLYnBmixmGrWh/1gW+PCCNd4dOyMO+h3gdjr9Zhq9QZDxc9++ePK5CKO
 PZyusXyIwZQuQBxXYiQSt1yAybbFj7dJoXIXoCkTob9RFixnybnGIqF+owDN4dCb+xTT12ddKuF
 Dpm6f2ddhHXpJMmJSoXDTgvvjHcnULR+918gNtrCk/8U+44eWKDZmqev5PgW/BuELefXT5AWqGq
 iM/qE2KmV3bIsOx64dqFwITtcPBICZiLt81cDqzSFa1mAVqFHTiZ9CSVEoINduO8l4R4+8h3KaR
 qWB9u6Gln40lg8/GJrno7v69TwBZGCyi+I/fJ/tpFQzpInWQwUp0m5aMkp2PAFzTSUhUp3XsFqI
 PSyFxgwblBOv2J7v3uyrdQi9nZEdQH7LFP8Rmvd6hFyciOR5NPMH51iuFuhRSxBdWrVc95BImZ3
 WxPDOeraHHlx/xPDLWg==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a59e5c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=SfF2JtedPo7efatZud4A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020121
X-Rspamd-Queue-Id: CB14C1DAFA7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94961-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 02:46:33PM +0100, Konrad Dybcio wrote:
> On 3/2/26 2:28 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 02, 2026 at 11:41:59AM +0100, Konrad Dybcio wrote:
> >> On 2/27/26 8:05 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Feb 27, 2026 at 12:34:04PM +0100, Konrad Dybcio wrote:
> >>>> On 2/27/26 4:48 AM, Dmitry Baryshkov wrote:
> >>>>> On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
> >>>>>> On 1/12/26 9:25 AM, yuanjiey wrote:
> >>>>>>> On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
> >>>>>>>> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
> >>>>>>>>>
> >>>>>>>>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
> >>>>>>>>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
> >>>>>>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> [...]
> 
> > 
> >>
> >>> 1.1  - MSM8x26
> >>>        Probably Luca can better comment on it. Should be doable, but I
> >>>        don't see upstream devices using display on it.
> >>
> >> Because there's no iommu support for these
> > 
> > I promised to put it on my todo list, but the list is very long.
> > 
> >>
> >>> 1.2  - MSM8974
> >>>        I think it also had issues, no IOMMU support in upstream, etc.
> >>> 1.3  - APQ8084
> >>>        Had hw issues, no testing base, no MDSS in upstream DT
> >>> 1.6  - MSM8916 / MSM8939
> >>>        Can be done, low-hanging fruit for testing
> >>> 1.7  - MSM8996
> >>>        Supported in DPU
> >>> 1.8  - MSM8936
> >>>        No upsteram testing base
> >>
> >> 8936 is 39 with some CPUs fused off (unless you have info suggesting
> >> otherwise)
> > 
> > Hmm, you added 8x36 to mdp5_cfg.c, stating it is 1.8. See commit
> > 81c4389e4835 ("drm/msm/mdp5: Add MDP5 configuration for MSM8x36.")
> > Author: Konrad Dybcio <konradybcio@gmail.com>
> > 
> > Please remove it from the mdp5_cfg to avoid confusion.
> 
> v1.6 is strictly for 8916. 8936/39 both use v1.8.

I tend to agree with you. It's interesting that core list doesn't (and
likely is wrong).

> 
> >>> 1.9  - MSM8994
> >>>        No upstream testing base, no MDSS in upstream DT, normal CURSOR planes
> >>> 1.10 - MSM8992
> >>>        Even less testing base, no MDSS in upstream DT, normal CURSOR planes
> >>> 1.11 - MSM8956 / 76
> >>>        No complete display configurations upstream
> >>
> >> +Marijn, is your computer museum still running?
> > 
> > Should we open a Qualcomm Virtual Museum?
> 
> Maybe someone has a drawer full of QSD8250s!

Only APQ8060 here, but it's not even online after the reorg.

Anyway, I assume that we have something alive and kicking for:
- 1.1, 8226 (currently unusable, no IOMMU)
- 1.2, 8974 (currently unusable, no IOMMU)
- 1.6, 8916
- 1.8, 8939
- 1.9, 8994 (almost dead, I'd say)
- 1.10, 8992 (almost dead, I'd say)
- 1.11, 8956/76

It seems we can ignore (or drop) apq8084 (no activity since Dec 2019).

Already in DPU:
- 1.7, 8996
- 1.14, 8937
- 1.15, 8917
- 1.16, 8953

Which means:
- port 8916, copy for 8939 / 8956/76 and hope it works
- add LM-cursor support
- deprecate mdp5, possibly moving it to EXPERT
- add 8226 / 8974 once we have IOMMU
- drop mdp5

-- 
With best wishes
Dmitry

