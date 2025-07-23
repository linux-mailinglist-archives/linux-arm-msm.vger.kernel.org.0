Return-Path: <linux-arm-msm+bounces-66313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 394D3B0F409
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 15:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E7521634A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8841C84D7;
	Wed, 23 Jul 2025 13:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="be3mm9vp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBCA2E7165
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753277547; cv=none; b=LpsBc/7dDciV53esr/fBJD4eaZO5cA3xoVigonn6bCQ7MFnbgN55jRI7laHt0QlCdHBZN9nvHpMbDzSG3RUY/eBXKGk3GuccNqAmRQ8yX3IYiZa3OQ97judCUkDQn/cYQLZFr3uj4fefoNirSqG8R6NjPERJOEReyqYIMeM6KIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753277547; c=relaxed/simple;
	bh=rDMsRExAhg+IKHg6jLoxGwz22w8pztfKeZb3nBhwGLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnuMv5isf+3sfEZJlsgzV31He91FPQmLlxkt6yHvuW70xOLYqpq2FjmzUQvX7TqMxdyf2xQpM6o1DXpQfYVYouoVVuqI2OoOS383mroWWNmQeVofyDILultYcz1gBhuTkLr84P5MOc2cCvfmaSSxhaqG8+8z32Sm0THPNtpxFjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=be3mm9vp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9IKuv008986
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2bXOg94c4P77UMYH5aBqkxUK
	tX2QBEA8geY9+BQ+StE=; b=be3mm9vpNkezVmc8tMKVcODyOi3UfenRTm5h4kQg
	ygWE3bABfpQXTgd9j0w6gtG1LyArH8eD8pd4aAvnHySUx9oLo4Q0ZYKL0Urxcsvq
	AUxljNzdFSHR+yIzXGDuLGXnCy0HNdBbS+W9UB05UmNJtLuaY9cQPDwWsWacuHEg
	XndOkKjsh1dPYaueT+0Cf2o7fifnc7P9SgaO2Q37sbvljVqeBfTAK3OwJW1voSCL
	cqeDHTsiX7pQfKqdMkNzkdW5c2QLU1TSrSwEa9VbI3YdLp2j/0gPK7FAtzZ4KWYu
	w+iqw+G2XQ/B7GBuB6+kwAhCxGG6klrbh/OZNw3pbgNlGA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vbmqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:32:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e36a64211eso661460185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 06:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753277544; x=1753882344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bXOg94c4P77UMYH5aBqkxUKtX2QBEA8geY9+BQ+StE=;
        b=Zl12j8xo+V9hotgbnBGiGH9WPDcDQoXds2wRKIAacUUTJrzXW7n3zYrDT4cqK2oc5r
         4cqX4x6Y/qq3ZWYeQarWnmDuA3TuBryjY2GzGK+zuBvIqxb6t9PdIZ7aHX4frV4SQdg3
         8NXLeOaBRjuN8Y7s4A6MPr68TJDWhjplxMrUhGg0g2CPcJtUoSWAMf4NjlC08Voa5Wf7
         rznVcGdO/QhM8I54skir0bjzizJcKd/jnAgvumtCPPrgyk+Nq6kAe+a/N9advszYAo+O
         FJ5P6lBT6reFxR4Z+iMfpn0O7Xv5wUVa2wO441PI1zcFxI5uOiz8RVQ00YjHCQ9nfVxr
         OcqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKTiTrx9z0xLlqOAbMfcsGDpLJyArGW4zVwcMbKAzYYpAn7mtAhgsjwaWuZRXa5d6zffzwE4CoOM5/tPmT@vger.kernel.org
X-Gm-Message-State: AOJu0YwiLdMRxpOhRZQ7Cc0yT4Rr+Rge3qys+l/xWaTi6hJBM7Vsc5ho
	oeu0KEgo7Pn5SLpk2dq5ofUf5O9RC1sM9fdzi8ocV8F0vg18pU8IPQl0vH+NC3M4yloWsVOIpQo
	acbCG/eWW/37HgTRLombA6zGdDC71RUvPBpPRBrLVTxK5FuBrsLveOXQRi55HaTXN3EEc
X-Gm-Gg: ASbGnctLkglqFfzOqV/SnLgsljs+/SiNbkkXoHXLPiO6E7lmAZ5u8yyJTIfa7Dq0aoK
	dXce22v2CXfKoXspRHqd9ysWr7JS6nYU/m7+M0ugNl9vUAiAMoMf2BMVcv2CilCnnqHQPaA0aww
	Os3hUhmcVOpv2EaJPb0sjMzNpS4WiT5ZjcEClyGXfTLllkUKcTrrkzQeMHoTtg/Tg40/rszUlfs
	85RmOrq7+sfUstvdDNO2aA1mambRXpu/QIkwmJ/tW+3R1UxOPL1NAWJw+joSokdraRiHV3M358g
	NDJKuQTnOaE43AyA7QGGcGe5gmjP2J7sJCgJ5BR5HUeFjmiVTtfwPZ1ButGlzScDb6Lp3TsIXIu
	UHThMRjUrHYmHMzD1dHdlMrbNYPyLUYp9V155VfpuLt/EcGnWno8N
X-Received: by 2002:a05:620a:8326:b0:7e3:2cad:a101 with SMTP id af79cd13be357-7e62a0e49e2mr333553485a.16.1753277544210;
        Wed, 23 Jul 2025 06:32:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEydExjA33+4H64rlfK+rJ8J7FY2kUP7yS6AWx/bNwbVHySO1mJ19QUA1ra95IE7X5gFHrmMg==
X-Received: by 2002:a05:620a:8326:b0:7e3:2cad:a101 with SMTP id af79cd13be357-7e62a0e49e2mr333549885a.16.1753277543623;
        Wed, 23 Jul 2025 06:32:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91eb927sm19151641fa.90.2025.07.23.06.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 06:32:22 -0700 (PDT)
Date: Wed, 23 Jul 2025 16:32:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: ubwc: provide no-UBWC configuration
Message-ID: <bex5yk2trx4ko2ibg6oa4dm7rcud4wypznjsielf2rc6vogss3@m3rle4rp4c4v>
References: <20250723-ubwc-no-ubwc-v2-1-825e1ee54ba5@oss.qualcomm.com>
 <242d4174-d01d-4a65-a4a6-1f4d4e2d4fa7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <242d4174-d01d-4a65-a4a6-1f4d4e2d4fa7@oss.qualcomm.com>
X-Proofpoint-GUID: n1nuNrNQ2QJ8B6vCErhFrelqdV7Pe8Nq
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=6880e469 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=xD5xa0Ad2uggg-ClYCsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExNiBTYWx0ZWRfXx4mtnrWfBkl3
 2+L7X6g5Zba5n+MBQnkO9zPHy1TbzXX8rOm8AYVhNQCbEHd/3nt3SNPXDW3JZPrBaytrDx5Pm4S
 ipVeCpIuSaFfTQWPL9n2iWDoC71cwEvIa5AAW2Bfi3yQ2Edo4YMWfRNpn8DJN5PsEba+jpi0bH9
 EuSeducVgTOJL8Ar70LZ0UDeylK1PvAcelW38BnBtil+RhszoLl3VchqUoBJOydVTJm7G/sI/ij
 IEipdiOOPilvZsGXCoyAdk05UgC2yn/MVzZaLqQvlQZ4v9/dFJH8ECy3knn3YIy5mPrlNiTl7iK
 NqlPBTcKR2ZxY5qsH0Cm885Q4fvjOgSwvuB53izQJ1FIgTvE09RStA4EwD3xuG86rpP9JqibYCb
 81BKGo4/H/sBMajMH8jFsSuqfFKBnRxeZskho3r2p8764fGt8cs9B7d/0BqB45Lk+F+lStuv
X-Proofpoint-ORIG-GUID: n1nuNrNQ2QJ8B6vCErhFrelqdV7Pe8Nq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=771
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230116

On Wed, Jul 23, 2025 at 03:26:51PM +0200, Konrad Dybcio wrote:
> On 7/23/25 3:23 PM, Dmitry Baryshkov wrote:
> > After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
> > database") the MDSS driver errors out if UBWC database didn't provide it
> > with the UBWC configuration. Make UBWC database return zero data for
> > MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.
> > 
> > Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

And I forgot to pick reviews for v1... I'll repost it with all R-B
tags...

> 
> Konrad

-- 
With best wishes
Dmitry

