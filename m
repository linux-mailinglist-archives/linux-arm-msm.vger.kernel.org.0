Return-Path: <linux-arm-msm+bounces-67272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB6CB17719
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 22:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DC8A189C9A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 20:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB42D246BB0;
	Thu, 31 Jul 2025 20:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kzbIiL0y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743FC481B6
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753993411; cv=none; b=Qc/7pAASzBVGdd3kYIq9ozeByg7quUt5aHsI66erZG4FEiNDoXIRlLp2Jbc02LrHUslLs2xa5udFK0g23ENdPNUDryOI3LWXDSqDxtL8M5zwRGoU7n/j6Ycz/+VOEJFaLdchgn7mPvgIkjdqTlRAqpvk3U6beN6GeTV2ESeWH9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753993411; c=relaxed/simple;
	bh=6BS0/r564Mr0wQVda1HbGywe5kFCQVQe9P3LHKToAII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6ZWufJlibJk6XBkhSFbB1XkGzTVqLZokyZ31FAvoKmTofbUoqhIegbpq5qCKiWUKfVxAwWHKFmnA2FQfkTK4MeuvhqCpMAfA7XHXqo2y/JwankgWiFmgHZ4CmXh8X85BdTw2QXQG8i1dY6r+QcntNgP4XAfe4EdmmGKh5fmFWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzbIiL0y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56VDf8ux020313
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 20:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f3HxypiWDDr8xm36nB0lYGa5
	9CbpmhkWZfBSL/BLjek=; b=kzbIiL0yy8yVyIUWAxXKQH8wuFSA4jEYXZwdNKeG
	RvS/AWunvMNjXh/hoAV9g+HiY6YSjpEooc7GLtFtaGj4q8hXw14+b1usXyTw0tEb
	RS1eh99MnmuLA44CMh/ICBFFHRkKTvqAspX+dK3tPYoOfb0Er9PwBk4iNZVtdt4S
	Pw1FmPzhwq/wQqneU1ns52m6GJ9OAm0pr96KHGuMCXQgq3qqPsfbiCfIQ1Ti+5Jh
	QEniM2WutaxUOXU1EnDOl/KDQ3uXLU7UEKyFa71cJC3TuZv5YATPKDjWCqQGkCup
	TZZypUQpE2BVSKd45nWFUi+P3kcGi76mGpJaV+GbBqphvQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1as2uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 20:23:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab87fec9e2so30438141cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 13:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753993408; x=1754598208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3HxypiWDDr8xm36nB0lYGa59CbpmhkWZfBSL/BLjek=;
        b=g4HTnVGVsfROtxJ1gdPZJxvdC7qBinu7/vo1ALyzZsvpJy0uMYpXMRFJEatBv1lJ48
         b91uldmkmoqVBiJmxIm5stLRPW9+mDVOOfC1jzMvcYyD0s3Unw1BguyVFc1ppdzG/tlc
         s5UFZyvFh2W1+EAHbnVGxbYpH9zQXsK9HbTBNthNwsjDeAw+t7DjeJnzmIr6kuuVfdLs
         K61uAHIzMbHg8c7VTK1C5cNxUzNo8rWWKQWeT+Verto6Nw7Q0Dn9j61Vso/ZrXwIF+Ky
         HhKA/M011n4fBuc+T8+kHOKNO/BVi5BvVWakoOrT/wZiMoKlzwjm2IxtwBWNfT2fh005
         UEPA==
X-Forwarded-Encrypted: i=1; AJvYcCV8bU4Mx6U0ZImaL0kS2P/QawJZ0QkGpQuPoxypKkMGdw8Wz0KZhRDc58gxTvvmft/zs0xOLr8RLMgcjzI0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5P5rHgE9WeO4z/atS2BWuRQZISsPCfLVWH/62Uw3W71/X43EJ
	a00/AIpsvLryMcwI31GzP79TyI9FDu0/2Iv4lKbBy30s7+Mi4Ugg7Y72IBj4Kr0z/4gaxyRA4uI
	NsuQNTPMWG3ewAlHpZ0Sg48Q6UoT1A2qGG9gQ9weiXEnYiHvp0J2DJMT5XAqShY2zbP73
X-Gm-Gg: ASbGncsubzIAKmmK2XzIkP6maC2+MlmJvJe+ufcDOm88CPCMBjIn7dJg+O701fFcIAc
	uAj7LxKt92Sfa6fUI1Qa3HzjUAb+V1WKYP/XHaGZ2BFP/Hx5CMeolej3eMoPUebppPegYGqIkv0
	5dHwgKUnY65c78cg3LrR5orujxOhzW812w0aIW+eRdoiYKJ6Gc6Y0q97gK2sARmiFmNbpWYj9nO
	9PeDJNgJQOAmmCN5CG9Mk0KN5TOF1uIiZAYcI53PIxeX6BEO4XIqVtLAUwbOZLNPazB5Qdiqp8F
	inRQmJQd13bY8ZC6ainv2rnr+JoglDegalikAaf+IRhKEMJsZlmEF/01HC1EMI43BjkImB1JxwG
	Kwk3wvDH1ULoyoH8LUPfbxaYkKxo8W7BkrdmDektwVitOsktQVV36
X-Received: by 2002:ac8:5a08:0:b0:4aa:827c:1347 with SMTP id d75a77b69052e-4aedbc6d40amr143765951cf.46.1753993408178;
        Thu, 31 Jul 2025 13:23:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGMGIh1Gf2+K/S5JsxxWt05bE+b7j7MOvdw2bdF3UYcUhqsNNUsy6RcMZ313EFuyJbcDLkUA==
X-Received: by 2002:ac8:5a08:0:b0:4aa:827c:1347 with SMTP id d75a77b69052e-4aedbc6d40amr143765371cf.46.1753993407622;
        Thu, 31 Jul 2025 13:23:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238946f76sm3187081fa.84.2025.07.31.13.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 13:23:26 -0700 (PDT)
Date: Thu, 31 Jul 2025 23:23:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
Subject: Re: [PATCH] soc: qcom: mdt_loader: Deal with zero e_shentsize
Message-ID: <zf5tkmd6mhhn3ktbip7vxeri6oozyswzit2a4j7kkfghnwqrwy@cd6dlf32vwsx>
References: <20250730-mdt-loader-shentsize-zero-v1-1-04f43186229c@oss.qualcomm.com>
 <490f9017-629d-4c19-8c2a-7fd106b4568c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <490f9017-629d-4c19-8c2a-7fd106b4568c@linaro.org>
X-Proofpoint-ORIG-GUID: T68dJkvPX6XJ3ttluI4WUOfXHK7zEUtE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDE0NiBTYWx0ZWRfX01/oeclk+SR1
 LQH0WASVbu8iAtwhZ3ap0/xZ9LTXsL/mfLmpq5Ti/0mlDMfKJwKFU53NGIXxE7/NRKkahzZm17Y
 N0yH5XKgoDKeg7VsAeeeqZCqTsRlIUyJkUPUkz/j2zsg/E3iPr8AgsX1UjodMABFzpeB8DhqORO
 abGEFPIoJ15t/AmcTQBs9X21lF0m/5Kmf8JGlnlbUiKBKC9PRc2BEqcK6V5UX5PRlzNiFQvyIk6
 Z9MhQkkr0gQxEFkyNyb+P9hGz0VSO7ZJVHuH55tePn5zxUfW1enNn7BrfZSwS17jxvzcZAtHgdP
 PLzbZ3elG5GIYM+hbk+uS5jYmtEa6IgFOMqKTyTC4fLmvmQLw2w098zw0jMn2G9q+h5mHyG1RC4
 xJJ7BtYnstWqGtotH2njEM/mKWBKAUtgyoAEa9eGgBhtZyFXmOvKn/z1tkG2gS8fSDgWZfnL
X-Proofpoint-GUID: T68dJkvPX6XJ3ttluI4WUOfXHK7zEUtE
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=688bd0c1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=Vn5WVHSVvbZXIGMPreoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_04,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=766 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507310146

On Thu, Jul 31, 2025 at 04:58:09PM +0200, Neil Armstrong wrote:
> On 30/07/2025 22:51, Bjorn Andersson wrote:
> > Firmware that doesn't provide section headers leave both e_shentsize and
> > e_shnum 0, which obvious isn't compatible with the newly introduced
> > stricter checks.
> > 
> > Make the section-related checks conditional on either of these values
> > being non-zero.
> > 
> Missing:
> Fixes: 9f35ab0e53cc ("soc: qcom: mdt_loader: Fix error return values in mdt_header_valid()")
> 
> Or it won't apply on stable kernels

Then it should also be:

Cc: stable@vger.kernel.org


-- 
With best wishes
Dmitry

