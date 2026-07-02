Return-Path: <linux-arm-msm+bounces-116013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 91pYGS1ZRmpTRQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:27:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C04B96F78F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:27:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SMeYazgU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CP28NFgN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116013-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116013-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB76330583DF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB6C47DD57;
	Thu,  2 Jul 2026 12:21:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13647478E36
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:21:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994905; cv=none; b=q60FX5nLt9OcCYkIGXeJZORE+FfjTeh3dfaqHsvd4FQ3rhRYNkmfwSOtJeejGpELd79NI5TbzK1SUbZwciGTnnLpmOyClc6zmaik2kSpcE+83Cs8OZ/xZ3MW9Hzr8WliocWSG86KWa9JxZs5oXTkm0/m7vr0FKllYrrVuU3TeqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994905; c=relaxed/simple;
	bh=NGcpVbb5NjS6cY8Z4ZaTnD2UA8Otxov4YSlaR14bxfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7PbU9mxh6Fg0kWqw/FfbCnPaVFHylVTbmzZz2LTKrq9FCSvgrk9+GokuBuPLorhb3/rMryFcyegp5N7v8NSD6wvuS5oibzukRLJru0sm4clHFeZ9bEUwk2qFcNISsy8u8eLOgJvCitaQJBVVrMduKfAWU96Z+XuD8ZfmVutZlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SMeYazgU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CP28NFgN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628KUb93049525
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3PdU5MpDYb+4NbgqvJM+G5Er
	Q5QlPStScQ7+050Jmd4=; b=SMeYazgUrxE/KTK94D5qTUStTuIWk1Kx/Lh/Hch5
	dXalsoc6wenh1FNwHN//kxtkDiguKF2+9EYUhde8nPMRZW9cPrkpzMLOoVTk117b
	pOVYZ3nqxxlhK1MQkIitcD2vB1+pGgTocrtdnzzFfc2o+aaOavD2nr2uFFwhF950
	Wr4ZAmR6E4OC85b3t/fez2yH9pByB9g73Gay2ozsiUsoF0WuuS/texypS/L0ldb5
	8fXrh2NViGF5PMDogZvnTO3RpwVEXJy5qVGQS9GxTe1ETKpQENCconRtCKjGqaES
	d4Y++08Q9QW1H1RsAALWxUGc8ubQvlwLng7XVDrMAf6l8w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541vnes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:21:42 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-967973f71fcso591763241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782994902; x=1783599702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3PdU5MpDYb+4NbgqvJM+G5ErQ5QlPStScQ7+050Jmd4=;
        b=CP28NFgN/5r8Osybox+dGkcKoZDL6/rV8ZS+FM471wIXTRxQ+92JJdxIM3Ik7l6ibq
         AJJ8GdzilrycWBEG13mVJ40i1HoijPYc8dFauyAFEpSKD3Jpi6hsONusFz/3m2BNSouI
         PwVdkEp+3zjpoqJ02uQla/+a1RmPxOTK0gUosHCqAlO0w+DfzpYI/+Fy56Drex6ejRWY
         GmnaxwGqRYdlRv/3+E3gyuyIf9A3M00AaNTcnWW+AjiQbSxZD539M4PTjANUjatmFqDA
         eVncN1s2DpvEwncH/nN7AQeQHTv7s0xpIAcT3gdESXI+x2FbdcA3eBosIalCEp+A1x+D
         cLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994902; x=1783599702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PdU5MpDYb+4NbgqvJM+G5ErQ5QlPStScQ7+050Jmd4=;
        b=MAhMj/OTXOlO0fdXOJvqZmOC2AbIzDsxA+SDWv4ZWwwUrVzbcoOrIhbNLXEzeoVCGZ
         8wh6EgpqaixWb0AbGwZMgHrtxBkDGy3yjNpt0QhZEZGbZ2Ls8JKT5L9F9JMNccqQbb12
         E+scIhVVtzjzhDd/dZazIE7ARj5zHd2Vy34Y85ECZa1NzQYU92c/QBBVHYvqMbHgbsMF
         MD4Io8tkVjjFVELIXBk9+RiZLeRm7+TVIlX0W2ZBefsKm1k2VzZwiOFzSF/rfz/DC73D
         fF25kkqIZIiirHe5f4cvk2i4GVWg4x5lrE4PmCI7AkH/mgERcVdkXj+VNd0Pjqnk+C3O
         XN3w==
X-Forwarded-Encrypted: i=1; AHgh+RqTWt1aeFDhWeiq/rgJd1F4Hd9QXkIOdro6RTfBerTd2JycKyr2SSiBFNmysUAphE7nWJic5l2Ol28aiMbV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3qTX8rptJoeHjstM7x8OSv0E5VcQm9uFGqlWeIdLpWY153xRT
	BI5U8aem7QCNGzfsQKHKf5NSw/I15GEaveoq7fyi0476nQkQMsnMjkwMV0ouPQ8+7aAEoDtqseO
	t23wiW/UBLDJiDVs/VjrCl3FuU2qzqZiL+XnLE+cDTs4+jyUHkLowLtvxVwKeeQLzMDHpC/5lzg
	HX
X-Gm-Gg: AfdE7cmiTBKNRPNRFTDI+VW8jrqta3571u2srKnFGDzL5S9BPaJlHS1dP3JujNjZ7sd
	5gCI3n42hDWwaccDdI8KnSq0JE1aGHdtuu9DOb8EtzxDrE8ufowzifERJslshRVxK4TDHmB1OH/
	+Wxj/Q8DCFmLYnRFnthEiG/TyiBN4dGPhq8srLz/07eGkdAiNW8pbwGLSv9fu6I6Jp1p0fFexYo
	CTuznLsnTO+6fWRdEs7vw7WmqX5qzpZy53sRdcJXtoXXMz4NNV3PBtdOT4w+D3XXEzrSUqaDKRG
	zIs+ZVWBbQljnyX5Tgr0iBbfhTBW6zFy1OfMribu175nWBJ8t5fdByvp31CXbY3qCrQQWYT0uyc
	M+S3P37VtT1Rald0p7wyWPDwtFdC7Lhdf1D6GQNpLwbrK7ZTxSK92G5JH8w5VaLCeBoCp9PUdKB
	U5lsFtCJevpT5teiq3IvIR/QtK
X-Received: by 2002:a05:6122:3c4b:b0:5bd:81fc:ebe9 with SMTP id 71dfb90a1353d-5bddf34490amr2406318e0c.0.1782994902140;
        Thu, 02 Jul 2026 05:21:42 -0700 (PDT)
X-Received: by 2002:a05:6122:3c4b:b0:5bd:81fc:ebe9 with SMTP id 71dfb90a1353d-5bddf34490amr2406306e0c.0.1782994901615;
        Thu, 02 Jul 2026 05:21:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec899195asm652004e87.8.2026.07.02.05.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:21:40 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:21:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] phy: qcom-qusb2: don't unrelated bits if autoresume
 is not used
Message-ID: <3goo36jai5g2v24ijlf7g4gehq5zdlk7uwizya7dimqtm5pmrs@norf4xbqdlw5>
References: <20260702-fix-qusb2-v1-0-b5cf55621524@oss.qualcomm.com>
 <20260702-fix-qusb2-v1-1-b5cf55621524@oss.qualcomm.com>
 <64f7efcc-1cd6-40f5-80c0-ab5f882854a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64f7efcc-1cd6-40f5-80c0-ab5f882854a3@oss.qualcomm.com>
X-Proofpoint-GUID: jS377PIFj53Ie_gRY03IfbiavFtLIhFG
X-Proofpoint-ORIG-GUID: jS377PIFj53Ie_gRY03IfbiavFtLIhFG
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a4657d6 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=Ob6tVj9ndvG_seX3utUA:9
 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyOSBTYWx0ZWRfX+NAVeIfnWdQv
 u8qnwUGEKAISqXyY81wtPmH6ESBM9tnNIcR8V6eFdtgbkUdqj8VqHmIKe47494dSwjTbwFB6qFr
 r46Hoz/b3EIf4nOuEMrxyU+laLlWCniJKYaMpV2YHqJqhJyq3RHiDo3aps7DpaA+tr1Z/s2XyU3
 6MLHj0t3pbtpj1FN1SmFZsE3eS5zQdB0UUCTOZzAK8UiF1e5xPAAYZfcy+j2ve7cXp0Jg44/lob
 rLdVeL6toszUXxCfV+ufABxA/Aeu1uTDnj7kyDt5MHy2ufxuVzbLSM8YrRqoLYLdR2k4r3h67rn
 Yz35hyJ2Lit6dQYkRDiIDCCZG+msqIQktLT5u2t8j0xOjU5NII18KpUkIgnUedlo54iCb8UpMi5
 CMWxCU6HpzmfdUSrRsNjtU5eFzXv9BPGYgQBEQ4UriVEG3KuQeQXS+RQAKi3yOBS/rjWa35+pg0
 pZI9RuJJhLTYk/sK3Sw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyOSBTYWx0ZWRfX96nxuKLAGDcA
 2LgQLtD/t4BgK4OnO2Q1zOgH6JUl1mjEPP6rhRMQi8diFJDOvHFyb/IMMw/oKhCvyE/98yJy14M
 oLtJrkLST9Jw/DBt8d4fXikC1NzcRps=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116013-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_kathirav@quicinc.com,m:baruch@tkos.co.il,m:lumag@kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C04B96F78F7

On Thu, Jul 02, 2026 at 02:00:06PM +0200, Konrad Dybcio wrote:
> On 7/2/26 1:40 PM, Dmitry Baryshkov wrote:
> > The IPQ6018 and QCS615 platforms don't need to toggle the autoresume
> > bit.
> 
> why?

Here I have no idea, the HPG is unspecific, exact details are to be
defined somewhere else. The platforms, when they were added, just stated
that autoresume is to be skipped. Maybe original developers (in cc) can
answer this question. Anyway, if autoresume is to be toggled, it should
be coming as a separate fixup. I can reorder the patches though, so that
at least register layout is correct.


-- 
With best wishes
Dmitry

