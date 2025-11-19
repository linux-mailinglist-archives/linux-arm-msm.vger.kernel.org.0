Return-Path: <linux-arm-msm+bounces-82459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAAEC6D960
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 10:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 6E2462D6EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9933358A1;
	Wed, 19 Nov 2025 09:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+D+5ons";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ALw+cBoO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2261733557D
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763543209; cv=none; b=Op0r8FpvIJphkUboUUiQwb2s6bm+6DH5y+zJ4idcaV75qynMVv7ifIYWXvHii2EgZ2/VBnigElhsNSy0NzvIaif2M7wAAw+vOcaXKNWxXzvG+kbUJ4iQJu5yKCSB90S5/8WcMvAeQmcGwg+BLgNhPc40l0VPUiNWTgOMl+x113U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763543209; c=relaxed/simple;
	bh=f3rTgy2Bs4565MP1USf7swy2ZYOzbQuK24mjtHWYfUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Un4oAxZPWCoMzpkovIGlir5VW5BiBxdhofJEdyPVUjHXw/DfT7NfaQ0JETb+yr1RXTBGrGHn+RZ9buuKFgemiZB1yC52qmbPbePCsq3/BngJPKg8U9eabAMTeMgFlNO5dJKLSFs3/yogenErLg9orgqY6slQNdz83rnS7zOWQh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+D+5ons; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ALw+cBoO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ1OI4F2756393
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XzKQwXLYhB9n0HCBzZGVPyut
	5drQc2JGgiwv24zVm78=; b=U+D+5ons6zhayBfBdu3VAGlqjD9jG9jLc7S51pxv
	mgs1LzPb8Kiolt5SgZCVLNDsqw5+dMKJrx17HMThboR2LwtcaZMIoL81SJGvaD59
	2Yz7Ce7HeloS1LF7AYMlpKnylBQr9xoIs5VlQU7ip5w/IzZ2Zf/OmYtj9tx7Es1v
	6Y6uRSgYUWuAwL21J484y3BWtdxg0l8e+TItlo1Ig7AWqtLVApUElu9Q34/55Ef5
	Hfem4pTfOOVWZzHdEia530NzDHlkosPY6ggHAQl2YUb8CJFuZWj2jWgcjbvCjk3X
	HeH9d7zq6/sLrEmMB5zuJ9xx2jOxUAkRxKSXabAwcCAJNQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj3xv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:06:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88050bdc2abso222992836d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 01:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763543205; x=1764148005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XzKQwXLYhB9n0HCBzZGVPyut5drQc2JGgiwv24zVm78=;
        b=ALw+cBoOUpABYUKJnBN22AZDKjbIkhPvmmJQnBA5vKKXo9Bpm3XICy81CG6iP2UgpQ
         +5FWT61dsomsQLNzdoZU8whcbBP0SZnKuimycAq/DTCWunlrIgrMhmP6QUtjXy7a3DC7
         5sl3BhBTXTlnQ+YZyFGl9ztr9ES9KK/hOybOsq3MwMlZPQeRoLA03j06NO5ygk0gp7pp
         O/hoQGJO0WCjZosbt4+u3xD+BgRHNZHFCx65SQ4CvG5WewAtV1OkPZjmsccwFJhj9Uvt
         toGxf8Rwd32+K+HKJ6rtVLL4POifCNsmrHEE0k4xAbLfUwuH7IH9nlx5Ql2ahmGiDau9
         D5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763543205; x=1764148005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzKQwXLYhB9n0HCBzZGVPyut5drQc2JGgiwv24zVm78=;
        b=RLJ78jdt+ABh+Za5zSCKya6IDq/eJycYKVcByM3PLI+d/3DVvdH/eba9h1+1/aZzvg
         u3mgg7H7nTYWCRiBInOqybliuheUcZVl/fVIEakJEsSnp852YKbGc4CAACqWEXoawFHX
         CRH/Kelisu8jSLnQL4rbpt1aYfhAuF+cjMzcue1niF+MSWVHpxaElnR/i1qQ4NVrI1NV
         mU7q801UHxerGUdD2Ww/c3TsKFYfJrddZHmA2pI0KUKpfq5ipWFUlXnLnXAl0tmAqx30
         vwP2sgbEq+iWCufovV8nFD8Sc/3XuBfiiOgCdS1gRwICQfyWsNEbIVs1wzXJo64FZVtN
         2zQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK1pbWAQbwtBSmd8I5Iuvtm+zT3hJQyT7DnH+XbGc7EEnEaIHMyGJmaIsAqGYKvi6xBv/BbgsK+u99hDQM@vger.kernel.org
X-Gm-Message-State: AOJu0YxlChBTmKlwOhYoSUMXUk+EGhj9k8zljl581If7G2Frzn90ScZD
	Bo/CIooLPZTJQyYZtg9F/USC9Kh/8Zid4vp26h454cjFQjwtO4E3L5lAafn+y/GXQ0DHA5mMcz4
	xSJ84Vywx5z/wWuESPuzQdqRsYLWPK2lD9QPaWIZLDkmgf0avZA0gHoWrnYpu3hSjbUwe
X-Gm-Gg: ASbGncvBlnG5kqPh/oHBtm26aFNfPvSLkHLWcYV6QPulQ+xGT+kpt3RTFZGQfol6dSt
	+TqU2ZpOiR7WM9FQtrH9jFZdPcgFpmSJzJTE2fB4vzFtdFVEEO6A+i4p2DiiCOfo3Qlr0G4UXd0
	zLpZz8pNuyUTeu88GoBX22Wy4yqQ2SBBKkb3Mk4NMk5xnR5E7btJr4hX1RdH0Ra7z/gwgA2KEAp
	ONrerUf5JdZOCsovsS/hxff9Obzhr15XT2sGFSSkreCO5la+cCg9mfuGfOMWflutiRze+TJl3/Q
	AHSg4d9Btq879DdLwmOtDKYPiCSVWSlsz9c6iv2+b692WCUF8HIdtHtydZhY1jZ6OsnVm98NZhk
	ben2ZfIbTy9su47iLcSbBOLrMtmWgMcZEPUzwuCw2Bkw1TIXvs1syj/Frzhafk8bHsGwaG59xkf
	wip0YeovIrawaBYtO33LBZ3Jk=
X-Received: by 2002:a05:6214:20ad:b0:882:44cc:f590 with SMTP id 6a1803df08f44-882925b1fedmr254974306d6.17.1763543205454;
        Wed, 19 Nov 2025 01:06:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5qJ5+KVHDdHbpO1HnfiJm2EWAr2140+VbakG6ydxryGga8kana3W+5BZEtAIAFA+yOWrXNg==
X-Received: by 2002:a05:6214:20ad:b0:882:44cc:f590 with SMTP id 6a1803df08f44-882925b1fedmr254974086d6.17.1763543205003;
        Wed, 19 Nov 2025 01:06:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804003a4sm4606244e87.59.2025.11.19.01.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 01:06:43 -0800 (PST)
Date: Wed, 19 Nov 2025 11:06:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 RESEND 3/3] soc: qcom: preserve CPU endianness for
 QMI_DATA_LEN
Message-ID: <mlvbcfwldtsivl5ioko64velaz2npixwaf4qukrji36alatqcl@bxv4fmrv2qyh>
References: <20251118065343.10436-1-alexander.wilhelm@westermo.com>
 <20251118065343.10436-4-alexander.wilhelm@westermo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118065343.10436-4-alexander.wilhelm@westermo.com>
X-Proofpoint-GUID: Ip-JTrbVxjjpvorM8eY_nHhWekP6QyQC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA3MSBTYWx0ZWRfX3AeY8kBC2sQf
 xcSM5DQhkspMksKYKPBwTOUz/JXxTbl3I5kgAWhleSnpwll0omVrYsoHZYwaqspsc28hELBu/JX
 9qu5SjjaCdViviasuBECecO3Mzm1XJgqwKohaJOBlKxWPZ3pLEhNKATGQzTOGkI4kHIsyIA5/F7
 80SgkCBkMXQlEWUdEsYELMQhHOVkWYrLyHQMLOzmnpmE9Rqv/cvYxJO7JBCejkV8CEjvn1zpNkc
 ntqyLugHg5Q7yop7Inh6kj4olAcwY2qoTCH7UZTyG2gCRqAxJkOOxWWr0fShGPYKTnTbSuZYZ0O
 x/Y/Hnwj8s2jpspqUGIP+m5DzSyuTWrAUZhws1CPg07iY3gtU4X8P5/yD3qXBbkVHY4SisueNee
 jaJcF1sgctvJAuuKmU3WjYu2MIyGfw==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691d88a6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8 a=XW_CCpt8tLB4Xc_L39sA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: Ip-JTrbVxjjpvorM8eY_nHhWekP6QyQC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190071

On Tue, Nov 18, 2025 at 07:53:41AM +0100, Alexander Wilhelm wrote:
> To ensure correct handling of endianness in the QMI subsystem, the
> QMI_DATA_LEN field used in host-side drivers remains in CPU-native byte
> order. Remove unnecessary endianness conversions, considering that
> QMI_DATA_LEN is always of type `u32` on the host. On the QMI wire
> interface, however, its representation is variable and may use either 1 or
> 2 bytes.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> ---
>  drivers/soc/qcom/qmi_encdec.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

