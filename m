Return-Path: <linux-arm-msm+bounces-81834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2A8C5CBFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E0EA7344B47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 11:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A013101C7;
	Fri, 14 Nov 2025 11:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sf5NkDbs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UhIck5t8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A332ED151
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763118202; cv=none; b=IJdT/stizNgJ7J0kCNfvDBGh7ODZ7IeCxeyzZKuJ//kJfDxSgHL1jzbIpNw9Ah2JtVmqTZxDUELRvSp1lT+/Gyai8kY75zsGl0AltTSYEncltjOHBPT3cRoW3jSPDjwxk49YrYsxlMjWI695/A3mPRxyvnAVddVxGG+AO2AXHL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763118202; c=relaxed/simple;
	bh=R8sjt2St83pI7jLwxENaicoaRphX9gMIqOZGF/00aqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KC/m6cprfeuw4hlwWTt9CGTVIpWZ8vfeThFMUYtM1ErFZR3xIsJhfzY1fKj9UExH4C1vmCoAdkE2g5P5CRmY0mx0BZZgMdZI5vtXDlj1DxhQYCJ5vrCkKWl32w+dI8vX5TTohz+wiWysaBZzWBJD3I4Dzok/Ao8aNbtGpLAsie4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sf5NkDbs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UhIck5t8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8JCHE1590811
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SsL1HDB38FRgMcij+jx/dBoF3vzUnXEGnTWRlo3FyXw=; b=Sf5NkDbsIzoxNN0g
	fio1is6hSCp4F0VbBAhVOImlbSGrtkPsPOnykwY5S6C3X3+DXOvTi5vxmmfSaosg
	PV6wf/0NoqTkha1yJ7E6P4BC0gB1++ENh49zU28tEaqZwM6SbEy29EHNqwwWH8Cx
	+3X8F0SyZln8FE1mRP3LYwY6U2d30/pkkSe8iTrJARyUCizFIo7DjG2asuIm2dhY
	ogKE7tL3HTflIEoBqJ9CAfaftWU7zr6I4pUZ8H4YB3bQWCX/abr/R1vYkj/2NGZ+
	bnJjU1pzQYmnVkUuiwe6Ehm+wewO7ZvtBXoKBszjWw9IGTJ0xPgmvCXGs1sXm8S+
	iJqcGQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9fsx60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:03:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e884663b25so45605221cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763118198; x=1763722998; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SsL1HDB38FRgMcij+jx/dBoF3vzUnXEGnTWRlo3FyXw=;
        b=UhIck5t8OWw2qBKV6CJGFShetgbE4+0O/NCeqXf49sp8LFdx39f8+shxa2un6TVng0
         vvVsF+cZ5BllxXCV6mAVKkx9gJSTC3vlMGbbmWumfNuZVcmIzsV8O9tMZTFxnXJvXXmL
         WC75RiKXRG9h5zxqB0zBPNDs/Avrgyq4GqkJQOQnZDtsMhMh+mC60EMHPUMn7e9W10cU
         4bIe7YPzxc5E4qBooWOynfLwB9CbXqmHNTALq0mw4lpsK6KTK7/J74F4Szx77ji3CEZz
         ZqgCYVnzLaItjBrdN1aMrqH1sIWPBqb5odo7XRS9TS3V9RoHsyOVhs2YARPrFfaMakf7
         nX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763118198; x=1763722998;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SsL1HDB38FRgMcij+jx/dBoF3vzUnXEGnTWRlo3FyXw=;
        b=ouhqneL/QKlYYFN+Q4atxkNgt4xBkoFqVQvVshd9dVsLHdouHeiAVZ0s5/7RJw++hA
         uria1HTZj/LVjCQRYDE0AsarzSEUg2RxkjjmqajPQNe4UP/5ZfNXLEYNCamhq8ozikiz
         eCogyjnwtD5jQ1662taLSBMnM6hZh8VjpMeIFoPSkvqf8IT5M+A5JQTa3m+Z17pwWvYj
         gLOOJ9r4KKtf/TkpcG5h/ojK54xXBref68ZwSbnuNvDCjWCxsNmt+loEhqOkv3U+TB1y
         5uD07IzkcVj7YcLbkPz6wv9QgrqR1rzHENz69mgTu/x8i74kDDlvb9InXzOIRjHvG6Ui
         YPYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN9J+crHEQPW3PqO8CBK61ejq7fZkopeC5W2kL+0yl90jsrGccjdHGeAdry+rY8nlmPL0jYEbXpDjLNVhp@vger.kernel.org
X-Gm-Message-State: AOJu0YwmU4xplyepGELDsXXMft/dfuZ5IysCxvFicS5F5B2x1AXe41TR
	i9HdbNZfXW0BiVyGu8wRlwMGSxMQzdgPdNbyOWbkTOcFLcCqvXZBa/IUwR4Q29tN3yeCQKU+VAS
	NJxXJsGIwKpwcDLA47ADfhVaMTPY+nLc+T5BMKuymmdLOGJcE6IC+dj6NF6TF1gfc4iIi
X-Gm-Gg: ASbGncsmniFwnvWBmyQ/flHHTMAKsc6Ysex8zGhKeKva1AH2VnJtqkqYt0M+hviSaqe
	lYwD4HveZzxSppE8yCjSYJ9bcdwnSTlhKysw1WcwjEKFNuSw/BXFFnW5/yaVJYyYeyp/a6OfuXz
	4nH4lqaT+TQkh0zYAmxn7PxH0HEJ5T7+Ebh9fWB4o1NdLcv1KGMyUJaAIg2lYR4FzU61wV7T7Y1
	imap+Io+hzBJ24o/PI5pAj0DTVPgkh7pqFp3YcfaZ84XndA+1a1Wygr4O9cqfysYFbkUbMMK4YC
	NNCXWQmiLzMRvVms3wP7uNSi3r4O5A+F+HuWQ7o+iQeOwpq0Tn8b/uY+MA/c9nKuBZ3FggrFfRx
	KbRAano93y+7KkG+J7c7g+tTTvHqcgY/QbXm0zYAQgTx3JVNdDDRXxo2iFpwfZEnIZPeGqL6duT
	K/khM4m/+8q132
X-Received: by 2002:ac8:578b:0:b0:4db:e7be:b40b with SMTP id d75a77b69052e-4edf20a3de9mr40782321cf.23.1763118198128;
        Fri, 14 Nov 2025 03:03:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnk790PmVPOn1c7OeBtDwurCO7QZI3gzzVeXmoG8GqrbzlotEwQFNkCiIoA940ETO47ZtSJg==
X-Received: by 2002:ac8:578b:0:b0:4db:e7be:b40b with SMTP id d75a77b69052e-4edf20a3de9mr40781771cf.23.1763118197632;
        Fri, 14 Nov 2025 03:03:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ced4adasm9135771fa.26.2025.11.14.03.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:03:16 -0800 (PST)
Date: Fri, 14 Nov 2025 13:03:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: federico@izzo.pro
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        nicola@corna.info, David Heidelberg <david@ixit.cz>,
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v3] drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT
 DRM property
Message-ID: <ac7fri2okl3bvzvfnjxg74x5gekn74ii5sslvldfw4ioan57bj@w63zkvngpi4x>
References: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=69170c76 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ze386MxoAAAA:8 a=ZFu0rgk015Nm-26e0XUA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-GUID: yLi915Sa0AAleuChc1yHa_yqAJUqynn9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4NyBTYWx0ZWRfXzSd0MXYZDT9W
 jS4gcRX/3PcVEwl3stIQ96Y5f3eKglbYBB7uZkDrAVEUsz6NHSXhq8INkdI5FzcFR+JMA+nblo+
 wsw6TlTo/MpzDH/MLN3Fs9Y6lXltacAuti3re/BKpddQk5iXTkbZgZw0SvLeYfOsGmm2otBEbFK
 vRovtWcvseakpsz1Q1ioT9khlHoYFVaUDHM+Xn1retsuSf20fmlXKTHoK/+Ek0Qdww5+uBuRYbm
 GzPgtmzlMJkY0DHOhuZ6acOQvA7RTpEjqTr7W7szJtuFtB8hKTThWs88elyT7mzm6ojtoZMxx7C
 ThFT2gO9JJm3+6jbaMLgWfhqkmUbdW/ETxxi4163bY+TCvp+Y7Dc9AU/qfI/fdQYSffacn1/exc
 2sPgbWoc1eKgPmdfCMIy5Zd2V+COLA==
X-Proofpoint-ORIG-GUID: yLi915Sa0AAleuChc1yHa_yqAJUqynn9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140087

On Sun, Oct 19, 2025 at 12:06:32PM +0200, Federico Amedeo Izzo via B4 Relay wrote:
> From: Federico Amedeo Izzo <federico@izzo.pro>
> 
> Add support for DSPP GC block in DPU driver for Qualcomm SoCs.
> Expose the GAMMA_LUT DRM property, which is needed to enable
> night light and basic screen color calibration.
> 
> I used LineageOS downstream kernel as a reference and found the LUT
> format by trial-and-error on OnePlus 6.
> 
> Tested on oneplus-enchilada (sdm845-mainline 6.16-dev) and xiaomi-tissot
> (msm8953-mainline 6.12/main).
> 
> Tested-by: David Heidelberg <david@ixit.cz>  # Pixel 3 (next-20251018)
> Tested-by: Guido Günther <agx@sigxcpu.org> # on sdm845-shift-axolotl
> Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
> ---
> DRM GAMMA_LUT support was missing on sdm845 and other Qualcomm SoCs using
> DPU for CRTC. This is needed in userspace to enable features like Night
> Light or basic color calibration.
> 
> I wrote this driver to enable Night Light on OnePlus 6, and after the
> driver was working I found out it applies to the 29 different Qualcomm SoCs
> that use the DPU display engine, including X1E for laptops.
> 
> I used the LineageOS downstream kernel as reference and found the correct 
> LUT format by trial-and-error on OnePlus 6.
> 
> This was my first Linux driver and it's been a great learning
> experience.

This seems to break several gamma-related IGT tests. Please consider
taking a look, why are they broken by this commit.

-- 
With best wishes
Dmitry

