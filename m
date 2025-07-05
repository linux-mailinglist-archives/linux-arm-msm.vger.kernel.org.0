Return-Path: <linux-arm-msm+bounces-63827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 147A8AFA0B8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 17:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6573F5636D0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 15:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00301EBFFF;
	Sat,  5 Jul 2025 15:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVwHtiv+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C1C54673
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 15:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751730356; cv=none; b=rM3gRnxZNLvxAY5JnGUtrCdStWlE2pIm1H9vLEkGbzo+T2lZ6LmhOI9CcT5xwx51W1VtBxmHGY4oyEtyEW921nUouVlbcEcksxfuC7++GvzqVsLI42xPg1jd4JxcsNIVmyi5Ha86ezcCITWJFCT9hCW+l6ih7yYSP6QW8BJxK18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751730356; c=relaxed/simple;
	bh=ip2c9ywNLoNqp5SCenERQj0St9i4NgfcBJlHCCsixEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6ZUxdy/GdMYHKdhoATsg4qOFhhXCO31ljUDyP7UzjOLzTJOdLiQaat+Dbqj5OczQLJi6tqwsOsRETiU3BAUeL2GaRT3IDxB2IvCUYNLU3C9g4JrE7kVIAV60l+zzoZKJhVoeNrn7gxkfM3urv4XueiqvYpMk38GNtRuyN7nO7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVwHtiv+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565FbIw1002299
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 15:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/5hl31AIup9VcraO0H5GHnK0
	/OM1c1STFA2QallXhVg=; b=oVwHtiv+ZtmLyH5r/aP03VJeVWYz+DFWjDG1czY/
	9KBg9HLOiGtVpCvd/dK705+COHYSSVEOkRDuhNk/pFwVWNuJR3Y+9sYEiBdcKDKc
	iDBbWKTFABQGp0XBTsyxL+yUFz5TydLBujRf/h4njil6v//vtoNm9cL+4Uytxm10
	vzr+GC73C7v4J3W0AcCwfEQOfGRcuRYkuRpNDw0CUMT5IYOtezbed90gXXIv103A
	wwi5prH0ZocjumEokBJSmqadyn70E+0tPN3xzLeAYFsXZKpGo59pqRs/1sHjjeW0
	NUF/kcrQiUEhz9dkKQ1yZ9Biz6PDaRbrLmty50DfQKJupA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4x9e4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 15:45:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3cbf784acso496299685a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 08:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751730353; x=1752335153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5hl31AIup9VcraO0H5GHnK0/OM1c1STFA2QallXhVg=;
        b=f5gmlUBjrgdZj8VC4spaXRWFBymLknmCOGCu3Yj3N3J4DbBpLCCBzhsOOxnX/OxTZY
         w6Wcd09/Egdm+vQekeyaHTnxxuQkRKDncd2WNCjgVa1R6utObkeWw+hnhZ/b+FnbfeWJ
         2Hsg0hG49YElujg7jL0vBAibv96DZzW39Ckqjg9eHaTcnqEgbzY32hK2ZME0ez1IPvkZ
         lw4++PY+eHUCsG3t6iqcmP6p7EuXBijR7OO+lZ/2dzlTPeKg7KMSafcmoLzgLLHB07Y8
         /zbJnvUQsJTFXsihg/1usqqXmklKB4jna1CsMT6yWCB2FeqK0HrcjYaGZybNmnL4ZY//
         lkqg==
X-Forwarded-Encrypted: i=1; AJvYcCU3MYBrHzBqJmVitNL6NzFZffap7XS3uihJRiDJyA3+z/hxlQ6D7EkQNaLrej4MKRnVbXpWnKlg3yrRLiRZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzfKUlXzlIOpowHT3eMntpJ/uLDi/7Mvnf3YAxqRMBZ/eqbzuT8
	0THhfjD/qXSsBP3Jwov0+hSkx3sG/PtsWcGVdITnemzv7DSX6JobpQ0l1uyiUN/YN2Tkei4YI1r
	/62ZeTjEl7zov4VTvnTePE2mQ6ONZHfOAjiKHdC7etVls7TpfXq6AbbJ9V5uqwg0ic9LY
X-Gm-Gg: ASbGncvODyHCZrIz8nbxzH5g/+//+GV7k01n2Wx/YWXQ7DsCbasz+1X12DpdjmjxNe+
	XU0taMhiHX3AkW2AoRrzQlG4QyxxEP9c6l4jZsCsg0kq4/QrA+kR5YUAdbtjdLvDNjXrHzRs0Zi
	XmiNB6Q1iaNCHkZgtF2fIxHHblYVowejSHjNK9cv26Idbcw2jSjscAWR8XF2N67aaBhKj+9eawK
	8DFh/5SC0+Q5Lol6SAweWus1gWrF4JIxSmDrCjYzXEmg4zkEjEv2F0TxuAdZ4AQZiGiW1ajaNvo
	PEWKy7BWPf1FV9TIpmyF4GbC+nEdoPI2Euu5OKvdJ4eIPPkKjj+B/2iCOJs4L8O4K6jHrm48b/O
	ghEZ3vJ4jWYfSHZoC1fBQLBiTJfoUqsS0GB4=
X-Received: by 2002:a05:620a:31a9:b0:7d5:dce5:86f4 with SMTP id af79cd13be357-7d5ef3ea581mr460743785a.9.1751730352719;
        Sat, 05 Jul 2025 08:45:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhdyY0C1qvB2PcFY3D1k6Eue1Nah+mBAYGZ3JSrRq66wBkfF8pUORakrJC05vzG4Q4M4ELeA==
X-Received: by 2002:a05:620a:31a9:b0:7d5:dce5:86f4 with SMTP id af79cd13be357-7d5ef3ea581mr460736985a.9.1751730351976;
        Sat, 05 Jul 2025 08:45:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d906asm621676e87.81.2025.07.05.08.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 08:45:51 -0700 (PDT)
Date: Sat, 5 Jul 2025 18:45:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm: Clean up split driver features
Message-ID: <kr7rjmo76av2mbobsgixhgdskak7nllsxghu2slmt6au3icm7x@japd67zoef77>
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
 <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEwNCBTYWx0ZWRfX5/lpzJAZAKBa
 8F364b9ay309l91QS83Gta88UuCHFBhGAEH7XCiOOMTi/o5rJS2GQzENXxQeSzyrERUH/SwxTMf
 0/7xC7AUrlxNeUUGGlAd/t8PYXqoW/fpgjflBxbBAoCsCdMAaHU0v+43CJIPd3U/cbcgGUUMGBL
 t5K2ETP/LpsB75GX4sqAbCuXPmfhvVQ5cveYaBRJPJGmMnE78Ki9hVoE2+UdX946WQpMWi4XWJg
 vR0kI6wHvbeIfDgff3YQZjz5OJZKXha2z9piBzHCFnd+KeK0VzPaPVsfizT1ZK/ekN3wlX4GL6o
 +AbGeu9+/RdJRKF18nY3cHBUBPCbhboG+3IngA2LwBI/mPqKLHGgrKLntxV+KWOb09CDTmeQJG5
 m4XZzFjwDh7WSHRnRIvHcMpi4eLppB4ABmp+QVYlOUHm+dXegc0YfZ9+U4VQfV8iTOi8CwPf
X-Proofpoint-ORIG-GUID: 1EBkK-0r36KL48ySz04l6cmX9rZ-asI0
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=686948b1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=YF7ZKVCZQUMDimIUfr8A:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 1EBkK-0r36KL48ySz04l6cmX9rZ-asI0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=883 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050104

On Sat, Jul 05, 2025 at 07:52:40AM -0700, Rob Clark wrote:
> Avoid the possibility of missing features between the split and unified
> drm driver cases by defining DRIVER_FEATURES_GPU / KMS and using those
> in the drm_driver initializations.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

