Return-Path: <linux-arm-msm+bounces-81329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C4210C50691
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 04:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AF1104E9E1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 03:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8AD2D12F3;
	Wed, 12 Nov 2025 03:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mXl7v1/8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDrs3HJg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8FD2C0F71
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 03:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762917083; cv=none; b=o6cDd9exOWlt66CBQ6Qj8NVOFXtZOa93Ep/lxFcU9v5w4nDmDaXzWhhcg3w7Yv8O2j5a6R2U+T8XFjQpcE8Bkr8QQwobBSSbmxNO8fZxExPpWpEUiNPwk6o9kxsMvH2G+ZFCGc6PoIZsXcnym4cAP6SizBdBp55fs+i3cwseHnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762917083; c=relaxed/simple;
	bh=EXyQo2XCGqUKNjh2SKL/EEEG0nvjTKJ6PDUTuDkSVdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iapqmO826R3UoYrSVbIBTGrIrdReF5o68jdLpzNQPY1Qgsydszzn8ppzX5jtI0gPbUml5D8r+x7tWmVYeyekbZzt3HNfLJt4Sd82/Nc8kw9p4WuqVmrpegg+ukLMrPh5u8G6mont29V66Z16bp/a2VvaaKPGvtS2GjNCqWe4Sfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mXl7v1/8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDrs3HJg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABGIdpg2763938
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 03:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7I5ASJbiXFUjCDLjJspnGT8T
	6HCYyqonpWR8OtpmpS8=; b=mXl7v1/8JKX+W8UWrLGRWAHiSSkOFdopLhwa1H0d
	q3chLJShw6YtLgwTd17o+mWQz5/0kI68uNAOW2ZIL1QdHoRmsaaMqaxhgiI742zm
	DaQ3H0NBUqNZ10/QujkTP+LSrhfw6q4gdvj/HXfkLtYbxnGvFoYcTMHLZnhn0P+X
	0RQKcXS8+2OLdw3xBPEwbTzTi1w+V46C3MVuSwP05nu/snE5MRmR0bKg4FvWOXS/
	gpZA2fooTNTp2zQo9OIXL5mOnF4rWnmCmBVlF9+fmUTiL48IR51YBPdyB5s8TeqC
	p6TB6nS5oQk60TCz6zynYDIp1gTO8842ZRsBKx+c7FRYAA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac8j51hkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 03:11:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e89f4a502cso10736761cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 19:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762917079; x=1763521879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7I5ASJbiXFUjCDLjJspnGT8T6HCYyqonpWR8OtpmpS8=;
        b=TDrs3HJgETMbEeaqCwdTibRPDjZpliWAvjyxaY14XJRQOzQrMoxbPqxB2bCq6aeglJ
         ZGeWd1PKEk4FI4LL7yGchqhD7oQCYMEWSvb4NR3Br+f0feRQytFCjpihCadsMaJkZpW9
         scErHIPwePOBEz6McbPDBkvsppE1WcQggs3L+8DLxyC45vCQZkWPXQEQMOOHaVJfHj+p
         6yvroK+V3fETSNXCIBXm3TMPAeXVclTfcWq7Z6vlTQG1CyuVjuGUjyLHDI15l+nKcwAg
         CFW6XdJPp7Uuto3ezSjiQuWp48DzAu5GQQm/cwencBczeSWNI62+5DOZLQ9uXsEdIM99
         WF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762917079; x=1763521879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7I5ASJbiXFUjCDLjJspnGT8T6HCYyqonpWR8OtpmpS8=;
        b=mgq3vWvyI3hbKBKos9frZ/vzx5D3O2kFa9nzixfLZtNw3U6LxgDROPekBsVGt0nsh8
         8Drkbmfsh3C0WlcGdpOX6G9eqjGPLjaQc++DEqwu3l4rBLqRtON0NBvQTrCWwj8dJGCM
         +mpa7ree+lHgEfJ3eHkyDU5xBX3xiXqfxPOHI8WElSji/RR5IObbPQUzk0X5B2OWki+E
         5JIunOYPg5WVB50+zJdPrxnZUjv2DHtVqNo+MBuLK+G8I/B2By3dgBRnvrH0qh0J/qzY
         I632aQI0KzwE/n1N8xj60OJxU8AtwTc52aDijbvBGM1M63vwYXBC5g1wSiLHYrh6LlsY
         Nx/g==
X-Forwarded-Encrypted: i=1; AJvYcCXBs9itBf5jFtuRxTL5YMjDJzDH6Tm6lUFNMAjKmYnM80DQjRYdhUMCpAW0DxNF19O3AjQGHOZXYVO68RPj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Trmwqc3KYfobP4zOfac3H4Qc9Cotas2YQcIsNNLtqlhs623R
	umU3WrYijgozrW4+RGWb0R2plyMhNlnp2mjcCo0tcmnL0HIrrv2N0dh30v81QeMymzi/IM28m29
	E80+Qt/a1eyaltKLfZrm8ESLQpqIMVddDV3RZOjYoeyqwurmM1HEE9V3iDGnUZWCDvc7P
X-Gm-Gg: ASbGncugoqHA0w2KT8j6MHz0kinQcpDHHtZmCQWbKJkC/yGR1iNlzvK7z6ywjp3ae9D
	cvl5E+Wbb7Eys/X1wnN7YOpK6SLWBqVPOO6n5EnBS8UpmE0QmmPwfEAekthZ6CiH8vhE2LWtp8d
	cjXFsL9qxxnrl4QLJ0zHVdfY0NemLIeuh2wNCN2rzm1DLNp7h29nI9SLwpllofEMZiKbe8lcBLS
	OM3Wdk2qyVMjOlVXpPIQ7YGYiKW/ESfAZpeMd4mbrtqLxuKb8wRjCw78rX3apYrvmtHHCg9s8gf
	Sl6ai8tRpIJ+9lpeWQoayErdGvVL26FAdnUzrVOpU1jsbY10YlsGpmVjXkjZRqC9Z+6gmW+4fzs
	7G6rKiyxn6OmXoCXDMJK+LRS8JzvY/gcJCq8kmW89QRq1R9SXD4KBMGZmW4Sx39StdPaFUNjsug
	0elCy9bnENejUz
X-Received: by 2002:a05:622a:1990:b0:4ed:685e:f3d3 with SMTP id d75a77b69052e-4eddbdddaafmr19222031cf.81.1762917078912;
        Tue, 11 Nov 2025 19:11:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGItbTS9amgruWtVUfzM5Xu7LUQSRzrfWwGLisuakKtCzvIwYg6qWkM5gDKUv2oTc7wmQsHw==
X-Received: by 2002:a05:622a:1990:b0:4ed:685e:f3d3 with SMTP id d75a77b69052e-4eddbdddaafmr19221891cf.81.1762917078509;
        Tue, 11 Nov 2025 19:11:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5957bc49440sm47759e87.9.2025.11.11.19.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 19:11:17 -0800 (PST)
Date: Wed, 12 Nov 2025 05:11:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/3] dmaengine: qcom: bam_dma: order includes
 alphabetically
Message-ID: <com7xvhrr7hq6axjji6tnkvb5bapmddbzpz2j7zrfog6323d5t@blevtj7w3hzq>
References: <20251106-qcom-bam-dma-refactor-v1-0-0e2baaf3d81a@linaro.org>
 <20251106-qcom-bam-dma-refactor-v1-1-0e2baaf3d81a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-qcom-bam-dma-refactor-v1-1-0e2baaf3d81a@linaro.org>
X-Authority-Analysis: v=2.4 cv=OvhCCi/t c=1 sm=1 tr=0 ts=6913fad7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EWPwqxXB_ygDNX-GOH0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: mxkMPZhT6p7XgmKJK-IwgbxifFsWOAcn
X-Proofpoint-GUID: mxkMPZhT6p7XgmKJK-IwgbxifFsWOAcn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDAyMiBTYWx0ZWRfXxwCci8GJ+jx4
 l8a+AsQZ4tLyO+iw80hcwDcWwUmA+zfMmTtSLsznthVtGj8oqOfaVzLTgK6h8M0Cd/bhawBTDZt
 fEY5cD/ZyIMJ0JEdKMlzM4bvkKwG75v3ACjdGxukE4775TJV5qBOFw4L+jFJ31Jr/yahea8v1jL
 8h4jgqdIJYIL9yVg/o8yVvw2f06SIUcj/oXOcc0tPVBQ2LLLbYO7+CkwYe1ygGNmXme+1Ap+wJU
 D/5itE4Tnwe1zN5japtvQOaFxRLpzRVFs8dd5k/RoFcshm9dl1Yf6ivJI6aeVt3cdHjJWCLSlcA
 B1S24jTEFKcB0uTXD97NgcR8jFEa+DvTZdU1zkq0854xJqxl70pribf17XxYGHx2WXRP0WLgwqY
 A4ZyMRugx815Drnr3KQXv2FEEzwuVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_01,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120022

On Thu, Nov 06, 2025 at 04:44:50PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> For easier maintenance and better readability order all includes
> alphabetically.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/dma/qcom/bam_dma.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

