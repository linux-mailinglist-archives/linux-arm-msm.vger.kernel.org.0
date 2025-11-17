Return-Path: <linux-arm-msm+bounces-82141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D6BC65816
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 18:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 788B33813CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 17:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7DAE344055;
	Mon, 17 Nov 2025 17:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljNED0M6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DC+IqOcK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6561343214
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 17:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763399056; cv=none; b=Sj0bRGu6fEqYdryN6anFzZ0CWWF49UImMxIghk5Fjnp2qAMpEHquSRtYscsejSk5tteq/m/Bhu14Wc+ENiNTM+/zRANzon2zxR9kAYOqHYPRSW9/1ktk9/VHh/Ku29U5xb75OCuFS+SFL51SsrcziDwob6kHDESNMmLdoUZwOHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763399056; c=relaxed/simple;
	bh=UlRaI7LkkhBgWJdsnD3hJHnk9YYxxDNM3nKFHPTsTaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEhukxyX9mb69gPTefU2pa/O5HR92pgvXQc1AU1AHZgw8pfkkQwKWhRPCgFiQge7t0wlCAlIGI5N9v22RVpqTmYMDCCDD5BrJhfbm5VQefeE2YBmvT05eCTuHwPVgf4VvSq6C5coHhjBP6tjzi8hoehHb8ws5tkUrn0U43p5Bgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljNED0M6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DC+IqOcK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHACc403572694
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 17:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=auGccE90rIjIdFyTXoV5wJQk
	YHrnmK29IiGf5JNrfow=; b=ljNED0M6+jorXllcfva1IxJRLkgphEVVo2iB3SPZ
	Jn3r5qdTYBV/6zfJ+N2I7XTBuPclr4qwXA2SAKsAncpRmr9oy5/efwz2nwFCl3Cs
	ssjaDSel6+kRbD5iGbWkiD5lWRAkSF+0iLNSniKyDDjPy398lRAyPv7McmxOBXAK
	iaH+zRhFs+QeA5Ytfc7G1c2bi0dQqGE76zmEAAlfkHVYjovFzuuzQ3n91ad+7ev8
	7rlTdhc2UOH52ozIUFd42bgz78XTH+x18SJAFvJ7eROnXZ1ITwDq2lEoQomPvjw0
	L09Yj5Xekb8WDRyiybQiwI3Gm1fwRu4S71W1LPCSrZZEmQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1rbs62h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 17:04:13 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5dda0c4a160so3632554137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 09:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763399052; x=1764003852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=auGccE90rIjIdFyTXoV5wJQkYHrnmK29IiGf5JNrfow=;
        b=DC+IqOcK44APMCl4EL6HvrSPg3VNyKxTqy6PHv6ExtJfJ1QJP9Xp2eqHuQ9ljqi+So
         HbqLh5KNNtRUEYeeZIa7EgW4pRCtao6H3c/nYacOuCOaBoJhsEPDbYg92ZR4+FQk4UfZ
         5BOQIlfE4YNMi58Q1vm23les835Nh5H2buVt4L2JWJG0d2WVZLSMOdK3USko5SXFzKNm
         5ZjG+0kBIwVZYm4wNtQVyW0kJsvKOrMfgNhvQx6jvHTOjSmyCXRktcLsDsB2RxDhO+Z6
         ICBjP59KOaVFCAqjc+enlbEhELVUWui13aSO/d50QWBIoIhjOx0rTW+7kTPRJO+hptgx
         Vk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763399052; x=1764003852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=auGccE90rIjIdFyTXoV5wJQkYHrnmK29IiGf5JNrfow=;
        b=Fja/rwc3vBIkCPfWy6mh3Jb36bCiVMTTWrQl4uCuvcf8PLojFV4y5vGuCMhvTK8wOb
         WteGKxE/jEYhPUty7IARBd01IGcz/5xjS4LdrGZF8cnuH6Tk9Ih6rSytjNHvlXcqR3WQ
         I+hWHty9fsoDghXCX6OV86bWr7vE9uw3rg1RNRGhMR9oe7ilfr4r8VJTJiNLVShz5XNA
         sAycaOp03Cgb+O1uZhuI7Fs4cesa1e3CwPI3zJ7TvoKgM4Awx3Z9CjGzA53caPlHYySE
         L2m3X17nA97Vg87/7TLR+AjmqJuXF7AwiDtmM2ko0x/mYPBFG1lXds7AMVfDVSotBP0p
         wzZA==
X-Forwarded-Encrypted: i=1; AJvYcCUIoLMDqMAwv8oGOvcWNInoOeJdnd8jEVJmT6Mo8gnPcYAxdBp12oQgjrQWkizcGF6bR68bd0pGnwX9884i@vger.kernel.org
X-Gm-Message-State: AOJu0YyypTQyNx0kgHfpC2yXkGJ0oWkqfxBEArKiBhrsLV6DCRpnbRyL
	LqzkpmDid0SDe39iPpOH0kYHTYkliKuS0BqsrJTmG2eOodmjHenR2J40c8rzZKiugx34G8fEGZt
	O34uCh5kIrU4UasPukrJjP4QG+MHqFPcDspY/wjK5ep5oUqV5mIdvceK38TOAU8uWClMY
X-Gm-Gg: ASbGncu4u56cVJ5O8Eq1ZAj4Wj8cbkJr6mOxyd/tefIhFIfDynOGda8Jq739s1Xe5kr
	O7FQqi3mO6vHsFI2HASnKTDnr5P9DjFwMuG7yUJiKUVYGBQ1cXSmnk6lP96tmGjxu/0d1XL2IZS
	D8XL4eEFafJ/qemYTeC3oXyh6HiELF6KhWRn7pIJV+nrp9a66Nh87XXdnP27Xij+BCzSfSWlQWn
	p4B37PzCYUD37AmLVfdNvqJzbm1kPep+Ewj3vwXtZvB63z1ECdojwsm40EPzQNsHUAmoceXZzl8
	IS7CiwjJIJHmGKReBFQoNnnmVdz9RlQq4dQpOX3GJvXSLpnhilHUFyj1xlWibSgRvc00TGK+69i
	RuKVqyS5Gw6fcVP81zB3uEOxG5p9eRT2tzVCyAJOTwVv56gzeMA7nY/tYwfLrt4wsaeO+Ngcx/X
	M1oMLKehXISlev
X-Received: by 2002:a05:6102:b06:b0:5df:aff3:c41c with SMTP id ada2fe7eead31-5dfc5b6b717mr4093936137.30.1763399052356;
        Mon, 17 Nov 2025 09:04:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXNo7QYSWJZGIJhlOrnk1Ofy+tgIpP/4dq9XF52/Er7n0o92dPWIKRs12DVJIGILZgAC826Q==
X-Received: by 2002:a05:6102:b06:b0:5df:aff3:c41c with SMTP id ada2fe7eead31-5dfc5b6b717mr4093851137.30.1763399051760;
        Mon, 17 Nov 2025 09:04:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804056absm3239102e87.82.2025.11.17.09.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:04:10 -0800 (PST)
Date: Mon, 17 Nov 2025 19:04:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: scm: Use __cleanup() for device_node
 pointers
Message-ID: <zv5hes2kfo5jpyko37mcn7cduxuhgywhe6xutyhbmef53mygwy@2z2z3hnupszu>
References: <20251117-scm_cleanup_of_node_put-v1-1-307d36d6b849@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-scm_cleanup_of_node_put-v1-1-307d36d6b849@oss.qualcomm.com>
X-Proofpoint-GUID: fg6C4YG5O4yLRNX28BVGOsuz6teJDBnj
X-Proofpoint-ORIG-GUID: fg6C4YG5O4yLRNX28BVGOsuz6teJDBnj
X-Authority-Analysis: v=2.4 cv=FPAWBuos c=1 sm=1 tr=0 ts=691b558d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=m6nvOr43LiMaUP4TbuEA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDE0NCBTYWx0ZWRfX3KDOHQSBvhr1
 NYrt5FRm5BBe3neiZQw1JYo/+SDh60sGDKnDo7gnlwTqOHCffSvj02gUDe8UowfJagu3LoiGYjk
 QAe+noocX5qHbOenDpy4weeznlmPZium0kijUcQpeuCmUJtCOtjpxYmPl0MmoVYdbgdIRcxWhC8
 b7UJl196TAEWHzxRL4Qy0rm0/z5QZYdjA87xn3bKPzdJU3zp7oq7N1yzBNvGNRWaSBSBlkvvBFy
 ojCAINjGI9fNURkfdgXSihEWNQ6fwAGu5UzKFIKbRGT3EUuNdt8rrCcPEJFC/9Vlgbjw7N8WVfC
 mgQlXOAO34pc/NtkEx5pAv06buKcOBklKxwQOpXEtb0p0AfMMU6T/xlh6Jw6h2ygv3Xd/3wltwM
 5a2z0OWsAbNPVbbbtPzqAff/l8R1vA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170144

On Mon, Nov 17, 2025 at 09:52:55PM +0530, Kathiravan Thirumoorthy wrote:
> Make use of the __cleanup() attribute for device_node pointers to simplify
> resource management and remove explicit of_node_put() calls.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

