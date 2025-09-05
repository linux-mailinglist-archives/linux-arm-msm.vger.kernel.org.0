Return-Path: <linux-arm-msm+bounces-72343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C012B45E73
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 18:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA5CD167B68
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 16:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7D4306B3C;
	Fri,  5 Sep 2025 16:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7WbpnTy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC515306B2A
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 16:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757090583; cv=none; b=cKH7u9cdu0xUnvLTdvZdVmDmSdervaj9f6EANVYeCtw96D8ZgO0hFY4pRTAgv0StmV5Psws1HdKdHNTOOmyWJYEvQOoelRzJl0+qw7rbyll6glkLXsQja5mi33NMeys1zPYtpX6l2m6aBNyUxQoDfdFE14ApKvAoBPrCudNzzOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757090583; c=relaxed/simple;
	bh=VWbyFdvaSUqfRLDRkm9PlbtB313KqeKRKvFGLA9uaRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+ysnU9HmgQaJLODy2SS773rsH0ZChyG+BSK2sJ2clzyaigR34rhHlwJ5SnVcSGu30edo13bQQHk88yPkvv/HGbStGqCT11QauAoJDxiNaELU3Vk/ciZu0+fLgGgG5wXR0e9eHlfCZKWYaJ2Nsf1ep02Ex1jCCkg9FsdNN6ttpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7WbpnTy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5858Cq2n012146
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 16:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OgdWpq37y+9vEpO9XaoifcHS
	/4f84Cp4GGDpq5ttRE0=; b=D7WbpnTyRf26cppQG3eC6BVX+g8Up/JQd7Ryv36J
	HXyqMrewsAR1tvSC8CHscrPM3xfnuDVgtzZUKSk+iI5d/6Tym7s9/snSHjx6oe6s
	Wtn8dagecrfbq34Zv76/LVTCJkO3xCO8/t+oLkYB6cyzUJZjTmWxJYXDilrLklhC
	DbnAuVII7iLASKR55ouugd20mMjO+o+yeZeFRFXRBFyFCgc0+LfNx0sGGk1NVlGk
	IMjzQ579PEFVEgt+Wa2JSm1bUvFtQ7a4F4LWnRcpA8fqVnl5xG0xrt0nfUl6Qg+N
	8OVw2px2sbbAbTL1hZ3QV9S3ASvUFFBNKEk94ZcpxjUaXw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj84mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 16:43:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5e9b60ce6so27465731cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 09:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090579; x=1757695379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgdWpq37y+9vEpO9XaoifcHS/4f84Cp4GGDpq5ttRE0=;
        b=MbHF2j6YgMDLXGHdX8XpvecXgPSTLw5Y2CG1DaOF8PLeNziw8sqlHt4snt0hVoUrx2
         f0+zdW22cfo6CXytCY8pXvNsGdrYvNqHNwAr6P4q5b1mqxCKI6lYxr2t7KPNmmwIa+nt
         8Zcr8yqlGH1z86aVras8eI3zYvSxbQAa4camN/JycHHfAHR0QrEydw/vD4n5LlgQNOAU
         0HMu+Ga00TPJLkqRpjLJHZrDXeoRkMZMBZtLYA5N9D2OEzdbnS2q2JJnQBMCj6IcUqY7
         pvaq2nrcLG/qEhQzNtyfWNxZjFRXzEuP9OhSH/M3Dst1zz+GN6QbsqFu5UDFy0GfhpQz
         E5vg==
X-Forwarded-Encrypted: i=1; AJvYcCWAmEeRFd5zX5cOVumwwwkTBT0Hc9yYTy6uyC9Ivzb8+1iQ5hV4adLploKgKzIlauhgJLx5pN/DFGnovYtN@vger.kernel.org
X-Gm-Message-State: AOJu0YzrxsLOFI6oqr3n0u9DcOCIaYeBiXaDSpYpDjYhy5NaaD64/CNu
	VsQ83pOFpvpeZas8BzH6w1sxY1H5D225ql9DTrobjBE+0lQHnjCYEQ3sBosQh3xvfz8Ws78KDM2
	MkRKK+Cihh8eIN/oXfZazW7Xw7HpSQ4w503SHgKDtwWTVh7Z+OCVtuVb5XUFyVr35XXx9
X-Gm-Gg: ASbGncvRlEgx08er0T49F/esAZgbOqEGD5WPPKeP3RQToFRFLIWcY0Eykoagpbq52yH
	oqz+uctKkN1s8vGvaMdz/BgRQU3PChUvgcDnryw/zW+nYA5XHVPynlsFjs7+SDog0v0TyXcysf5
	RJwPDZNe5GPDqBhxcEfhCjvzS3ei6+VAmG9r1HJNp/hcvNu+MsXAkCIet4i9EeqXE9fJwFljMRp
	Fbpr5vyFmIw5RDvu1lMs5CpeIpir4Ogvu/KLVa15dRKxE9FzdrPAJ5EGjHxIPHTS6eed9Cfn9I2
	zSqhlOY2fbAYAowivwjL3Y4XpN8KfEXTWDpy4srawdu+Ab6dyPlBKWEJ6/s/IH99SGkLVgepV2U
	NSfL26Eg/dRwstyfA+DNXXRt19TlieCLj5zwNXt5iCgPGcgOV46o8
X-Received: by 2002:a05:622a:1388:b0:4b4:8efa:f9e2 with SMTP id d75a77b69052e-4b48efb085dmr127781501cf.29.1757090579336;
        Fri, 05 Sep 2025 09:42:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHDhaPV+DpUqz0Gpu/izEq6Kzs10bxHEYDUSOPCSB94dwofk5NG2Bs5M2Pj/40aa37D42TuQ==
X-Received: by 2002:a05:622a:1388:b0:4b4:8efa:f9e2 with SMTP id d75a77b69052e-4b48efb085dmr127781021cf.29.1757090578802;
        Fri, 05 Sep 2025 09:42:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab5c15dsm1869487e87.24.2025.09.05.09.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:42:57 -0700 (PDT)
Date: Fri, 5 Sep 2025 19:42:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 06/12] ASoC: codecs: wcd: add common helper for wcd
 codecs
Message-ID: <r2vk6rus2ownex4hunrwxutbrbsggmbe7lgiiksetum72y5scn@6kd55k5cdpr4>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250905154430.12268-7-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905154430.12268-7-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfXyiioNAPC/3Tf
 Y+0Fa/4W2/JwFur4BM7UkfXLc61og11auB9p37Fn3zl4LP2ILh1KkPynoSscNCMARIt+PVIl7FT
 PY2ckKagwtPYgwFAbBu2RSCul5/cG754PoRfeQbxxPJJK54caStXp2rehkt7aR+QY1FfHdwEtB0
 DmUIjyfNs9nVO88vffGBiC0H85NirRYbv7+NDZh84jz8VSsrxmkLemk23cAQPK8pfs1eefIGELf
 4A5FU8iJuzXhOKNli5fSjp3BiWxdXlO5IO6DGTLjmrfC5qb1NJ6HUcpVKQVhTxVayIDkGGIQ1un
 hlR/RZcUG/9cVfxw0KwctEkb/l2ryTjkuk99ZvfZ7IeaXZw9UL3tSoYFUX61QE9bq9eYvXdOwE2
 YlAc3Y41
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68bb1314 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=svJh2_vFcTraKgw4RYYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 2BizUut-TdTImB9OUR19y6roJWJSamve
X-Proofpoint-ORIG-GUID: 2BizUut-TdTImB9OUR19y6roJWJSamve
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

On Fri, Sep 05, 2025 at 04:44:24PM +0100, Srinivas Kandagatla wrote:
> All the Qualcomm WCD codecs have most of its code duplicated across all
> these 3/4 drivers. This is an attempt to remove those duplicate
> parts by adding a common helper library for these codecs.
> 
> To start with move all the micbias parsing and voltage settings these
> are identical in WCD934x, WCD937x, WCD938x and WCD939x codec driver.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/Kconfig      |  8 ++++
>  sound/soc/codecs/Makefile     |  2 +
>  sound/soc/codecs/wcd-common.c | 70 +++++++++++++++++++++++++++
>  sound/soc/codecs/wcd-common.h | 27 +++++++++++
>  sound/soc/codecs/wcd934x.c    | 82 +++++++++----------------------
>  sound/soc/codecs/wcd937x.c    | 75 +++++++----------------------
>  sound/soc/codecs/wcd937x.h    |  6 +--
>  sound/soc/codecs/wcd938x.c    | 88 +++++++---------------------------
>  sound/soc/codecs/wcd939x.c    | 90 +++++++----------------------------
>  9 files changed, 183 insertions(+), 265 deletions(-)
>  create mode 100644 sound/soc/codecs/wcd-common.c
>  create mode 100644 sound/soc/codecs/wcd-common.h
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

