Return-Path: <linux-arm-msm+bounces-111692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oCgMOZRjJmoBVwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:39:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 583236532E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:39:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e+NizCMt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="CK/WThVe";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111692-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111692-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51F8E3003418
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 06:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896214A23;
	Mon,  8 Jun 2026 06:39:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D15E2FF657
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 06:39:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780900750; cv=none; b=sLBv1qWgxIlch+hs/bDVQoElwXNkpVHRNfi+nlUwnLxEwcKd9Sl0DB1HgpRhmabhEDs2UhtSC9pHBfJaOxL5pDGHk5hoBrOXDghHbjsRt/hWCYmlUzcsvOmkfQFHdhmEjlVNMISJSn5ZtpFg5nxJiV1ly/JqI0XwlGI72JFQgY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780900750; c=relaxed/simple;
	bh=Nym8V+yNjQn6A5qW+sv7Bee/PVugLXo2OIQNUGl5aSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6neHWvRcz5QozXcYL60yXapVHQN03gHgHD56OtoKHyxVVcRKWBlCWLpX6E+mOFSsS+8LJy8VgsaUJ/cBxMXKCmLYs0nV2XM/jw4vB//9a/80AyTKYveL/QfRdOS3r8/FBejMkEBHbP2Ip52nNtl2emX577CCWDvW44yrdErxFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+NizCMt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CK/WThVe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Ok4a2347148
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 06:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EkzA2skdq2rjPRHzoDUllfBf
	pNhhxszp0NCx5+beOtE=; b=e+NizCMtvGZwqyNlIj1DUDwD8H8DVYSsi4NntMMe
	sbdT59YDe+6QWfpee8GcTJrGhh9lGHdcBwY+QTJcLMYUaP+oEjm5ssPsfBrZOfDI
	OsC+Kj/BmztE8OhZUb2/yVlWgyVE9eGMJ+Heot5lL/Kw7ZyldUI4ZPsmnkzXje0Y
	BiX4B64vEdsDPS8RaUbor8XqZ/iHgB2pHnrlJREhplx8X+v9Qi8ydJz8L0fuHsTm
	GWdJ8cLNrGoZsSmVi8gmEOHwyMCbAUc3twXdECWy4ckPYt8bcn1ktKFQc7aIm9v9
	DyvlWrG0BuifytSko/vxdV84FjAn704Yo1Z/LiqLWriakQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrekg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:39:07 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cf9627010bso4765834137.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 23:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780900747; x=1781505547; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EkzA2skdq2rjPRHzoDUllfBfpNhhxszp0NCx5+beOtE=;
        b=CK/WThVenzrc2ANjA4Mbu7m3OYGwBpiu/pO6wY2gHtpT+a59P59ul5QjEXpKDmvhKP
         Q3HxJB73BhE1YNWuiCPvMocQDzeEhlF3EK16KmVI+uIbtlEpHsSrVS1axqD2oqdUH8y6
         YT8Xhg9Z/E6dsIzpWM4s9JJbnSOYCJwVqTCs2hI9jN7vLJ0/O9srIovG7wxS5q4ed3AE
         Ow1Kd/XFCjzfg5sfyAYQ8xmGtdGKGzZkqjHpafkQBzpksRO8+gVKEenraxsrKy6xHJGs
         qsnCAObuS2bA+lD5yg+WBQyZmt+e6gH51kJAejkEN5BOEfvVyPT4YdC7b5KXqITrAjmP
         /Q9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780900747; x=1781505547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkzA2skdq2rjPRHzoDUllfBfpNhhxszp0NCx5+beOtE=;
        b=okFWM8y+3/jcfsu3ciMDbIBdPiXoYU2za0EBoXEU8ASbnZeX7JdoqDv04A3vt5KD62
         B2Y55KAmlWikSRa83cyXt/SkQqPMA4oXiED4rR1hqYm0G65YcAV/YZg8oJKcMXBrW8XR
         f8r2zPD9DTpsZWsMuMy/MHuP3iF3dDHZ+TspRRUQL8vBIsMcaf3WDvagfLIpQgh+fLiu
         0dO0ONjHlqeOZTVvGZG9PXJ/GuGKuTACV00sKthS90W8Y+bEUR8c04VrJQrgizAWY9xU
         LMiBLXc5XMhI1i2me32xlvQgNTl/8wdPS3sPWm1hfYBfIDIqnFJCxaInfWJKDUcaIIRF
         R9Nw==
X-Forwarded-Encrypted: i=1; AFNElJ80rODDpqdOJ4d+y+mkMEGxfJmBAZk1953ozdpd8sGh4af+jxStm6BFv9R08xDUZ0ZemubPP84yLNucWZGm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+9M80CDvNQpEYirbwgroEiIT44PWCTxBKAtajhWOQQNJqCZ2s
	k0M567xF4GtDtIM1WzCpIIdOD4VkSrCnwLWutsEd3K6HYP+qJuAJkakqBRfUJiY2lDxWnOyRtHP
	hNToJZvcXhGSkF/C1F3cOpa8hofzyS7wZ1O1HkrgzJgWhGbgrG18dShk/rNcB7vnxp8r7
X-Gm-Gg: Acq92OEVemVri4HL0bDNmyIURX4fJ62HiMJfAG+XeXMRp1QW15tF2jO2UfIVfNvnN32
	O5NRM10Yu8dO58W57iwdFLhC1LIsiBYCTuxCT4ViweDSgG1Jx2gOTYODGa2zgiYkmdEhBcpz+hz
	4pvk6L89+Y+yeEyeQcRK44Dt2Rsuhjz0OPRQ33q5S4pfp9CwOh78T45PopF1O+F8UUlXV2Cp26h
	BGJTh0J2oUgK5lPFTvq8rV58I5AExGJ0kZavmlsHD2dD7eosj7isE2vVArkZw4G7M6ihSE/Jadg
	mm/tUCbZukgk+23B+2Mon5gStscwFqwamqIiQNbyM86Y5UqH5mpnuHsIjPUMGn8bk2nNK517KIM
	CpftUiP8cP+Qemd7UdrCp0XL1s2TmMCn+8eWSy5BWSjYMXwVZio8FssDNVUMsuvffspRmUA7moC
	zsHDPGr60YS9ZjB2OOMeBP2nREynjjLHeGQOuXm14hJUmn3g==
X-Received: by 2002:a05:6102:5486:b0:607:95f4:53b5 with SMTP id ada2fe7eead31-6feecfb6c3dmr6705001137.4.1780900746822;
        Sun, 07 Jun 2026 23:39:06 -0700 (PDT)
X-Received: by 2002:a05:6102:5486:b0:607:95f4:53b5 with SMTP id ada2fe7eead31-6feecfb6c3dmr6704986137.4.1780900746468;
        Sun, 07 Jun 2026 23:39:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9995b5sm3534596e87.76.2026.06.07.23.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:39:05 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:39:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] media: iris: Enumerate cap->bus_info to differentiate
 between encoder and decoder
Message-ID: <6qnzj5pmsc57nc4auxg3qh7wa3kaszu6ao73a72fog4duyb7g4@lmbldld3l656>
References: <20260602-iris-simple-name-fix-ci-check-v1-1-5ec9d0d00983@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-iris-simple-name-fix-ci-check-v1-1-5ec9d0d00983@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1OSBTYWx0ZWRfXzkSfX2ePrmLV
 zNC+E1goqN9rIlUfVc0D1BuYO2uDPlaXNmGevpcAIEEVGAAbIMRCeSV25AYQ6w0A8IoDECWqoF3
 iCLQ+7ZwTwTQM1aMQRBAWGdQ9K55c2ECVl1oBJu1iHd0DhSeSA+Gm3RbTCo+tnmhu47jjOJWV8T
 6+b4uR0Z8ebvSq6dKsmd8wfRXOWQroE8TZ1m7CIj6ONtJhg3hU2BFubNGPAfGtZ5p92eToU4JRS
 bxvKkJFpo6iRnt+KAAsmvxn1BumFHe/qVe1D/Mxr91KZ6yd/B97UOrZ9AbF/oC7W4xBMwcE6gku
 37ylAxQn2i/WItKvXivfmDM1gmZy2qEwfAvTUaU0b27LDB/+nX7D2wZt9fdivWSUUOwMcoSf3jo
 j/ZWRaiPuEUOVvNWybKdTbzUP6rDMa1cfwzzPJhTGKzGmfnSJAPF7hXvCgM8wGJUW/DROxZOaS3
 NYIoPIYXDOfA9iddL8g==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a26638b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=sEgayuerTQoX3LKLxq4A:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: LNJabSbMBgkbcgNGsqrYy3QRTKVegnqX
X-Proofpoint-GUID: LNJabSbMBgkbcgNGsqrYy3QRTKVegnqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111692-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 583236532E2

On Tue, Jun 02, 2026 at 02:59:21PM +0100, Bryan O'Donoghue wrote:
> commit 66c744e28b69 ("media: venus: assign unique bus_info strings for
> encoder and decoder") introduced the naming convention
> plat:node-addr:video-codec{enc|dec}. Right now Iris does not replicate this
> naming convention.
> 
> When we do v4l2-ctrl --list -devices we see:
> Iris Decoder (platform:aa00000.video-codec):
> 	/dev/video0
> 	/dev/video1
> 
> Enumerate the bus_info field of the capabilities structure for namespace
> parity and appropriate differentiation:
> Iris Decoder (plat:aa00000.video-codec:dec):
> 	/dev/video0
> 
> Iris Encoder (plat:aa00000.video-codec:enc):
> 	/dev/video1
> 
> Fixes: 5ad964ad5656 ("media: iris: Initialize and deinitialize encoder instance structure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
> A really simple fix to differentiate encoder and decoder in user-space for
> the Iris driver as we have previously and recent done for Venus.
> ---
>  drivers/media/platform/qcom/iris/iris_vidc.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

