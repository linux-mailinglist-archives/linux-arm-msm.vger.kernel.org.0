Return-Path: <linux-arm-msm+bounces-74895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B55B9D42C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3E771BC0E93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E222E6CC6;
	Thu, 25 Sep 2025 02:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jaHThDmz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361DE2E6CA7
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758769090; cv=none; b=XoDKmCYQCUrrJ4BP4ja4PMAD09CH+YTf/QP+Ptxz0Xgt/wBLZXB6D/it8aatcC3ff2tHkhPUnkVRIiK7beJFghya/e5T49yfTo7RnjfztROINuHeCqgYbgHTaDdLe9H4l8KQeh8IzFXENMieE1ja3Ei9Cwefeh9H4bzGjBYor08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758769090; c=relaxed/simple;
	bh=8ysZNA/Uz6PY3mVZ0DZWwPSIKRaTzuIq8vyE38GZH6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjQDAyzc38vLbstg60I8iWObAk8iK8CJ+EB1bjKks5OsNLVHic5XGIVCPCmenYMrw1FiGVpw36/zXHE5eQYtbQEadmSTz9aQdC3aCx3EAwYDm5h5qisNlXOReNdd856xI2VUqXhN2x/EVsympMDLRnct3gqw3zyiC0ywCqCs5Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jaHThDmz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0XF2B025105
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qjAC9HnS7arrvmYIoGMsNtnA
	EZsulCcHq35dMFpOR3Q=; b=jaHThDmzhZalaOm2waZn8XQ6kqYA2/a4wonJSNCz
	lQAaMQKEFEjEbtM84KfR6TMNFfQe7mvnql2WmhXXaCsU7cEsUX5zno6PGIDCHTR3
	6xHDedvVV6u6go6fc7HcWACRs8p64j1u1C3qddYPsDaXisPWdhbnXAymSR+xstLb
	ot+Z7FMi/o1MFUHoB6N7pRLVHR+2YtgWLy6VQCdzI5eZDC6NkU0pfY4tHyX/RDHb
	2+z0hOe9QUE54nDqhdITnZW0KcaDYu6qHUKl7612hNUeI5/0/Zlb/mOzt9p75802
	+jS5lcCNAuim/AxNZ3EfBQQ2BZer3TLXTYJWTKNa30KDKg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv16hn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:58:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8502939d0f6so418490085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758769087; x=1759373887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjAC9HnS7arrvmYIoGMsNtnAEZsulCcHq35dMFpOR3Q=;
        b=ITvncVhYS2bzcdgcHFyHvoshn/qiremdsyJ7O03BhHlioopuBH4plfdjcaNKhi1vAV
         oDTa4KniduxLB93P06El9nmsL6Qf5FgeNjiq2Fce7jZyKdyw14yCTecc7aOZYbUv6YZK
         xGo+maMi07o8EK32lMgtthvgXBmKDRNhZwiOu8qzR43uGpa3sT9Y04U3Uxnb4L8Ew9b+
         m6nH9ZlFrF9fsMru+1QSR5sW/nIxtZf+ROIPwrZ2lJvSYVGJYGosMvzLQh979+OOk5yt
         /BMQVcWMgBaskgOKQ0ieaUlwN4xLfZQX07WWkBt4qKx5bnEmTw3cvTeEDcLq1awGFbm/
         h1Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVDIsvjbQB+Xm3Wv2H1HWt0BrJF/SnHQJhtH1GpEROs9MWJa/BBQtJoKJGNtj3Qex+/faUqgmUAQSko3hrG@vger.kernel.org
X-Gm-Message-State: AOJu0YyTJhtTl9Frm/Y9vID9X8YtWeIkH1OBBsErMMKtC4EhQTGjt8/S
	CFT8d+N465jUlMR0ns1g5+h1qrM9O3JOSnWsYvQPjQPPqD93BEEZTQVUtRrADVaPqvObpLBJAuw
	I3gBlBGx55PLB7aZKMx9myoSLr1upkDcBOIpioeVtzBCDTEZIl9+InvyY8cBLZRHLZ8nK
X-Gm-Gg: ASbGncscQHSdmM+3OIdSl0YimqxmobjGSwVGvJJla/EuBtgykOrmB99hYo9AkWJrt/p
	UHZp51OWKFIBruvuePWtskCpgURwbxDWlHgxUoptFianeWOxSbeDug3H9ICLm94h4nOKtg92dPD
	hMH+NhieAAvTmGo7b0CJqHe8YprLR4eDsgVKSivPcUs6dOHVWoPtmTeqkbwIAi8FuwGaPc5ujjg
	B7891cj2HGGziF9lmv8Tj2QU5lUzqC0IrxJNjrBgSxGLEy9ntV540w+OaLgY9zUg0Sh/Lpri0Qn
	/DNkK3cX5UhTQ8mqBR7c+D8dgFxNU6tFppR0+9KrNnDfg4aQxDPx+lSp9tEUTguiHsBwUszs0Im
	ws14Syem34vvrOLXNarHR
X-Received: by 2002:a05:620a:4416:b0:829:d0e9:bc1b with SMTP id af79cd13be357-85bc193e697mr124453885a.7.1758769085000;
        Wed, 24 Sep 2025 19:58:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8/kIGrxuGE1UAhcbH+YWeTWUxLahQYTfRVIJoMIFeM/Sl3/4X1nwoIEfPlHoZiFC4e311CA==
X-Received: by 2002:a05:620a:4416:b0:829:d0e9:bc1b with SMTP id af79cd13be357-85bc193e697mr124452385a.7.1758769084385;
        Wed, 24 Sep 2025 19:58:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb770fdb2sm2174221fa.43.2025.09.24.19.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:58:02 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:57:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] misc: fastrpc: Update dma_mask for CDSP support on
 Kaanapali SoC
Message-ID: <pxffubrq3362deajql2ajheoq53wvgrlx7ttxqlwg5n6zsxzib@zk3lwqwiq5zb>
References: <20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com>
 <20250924-knp-fastrpc-v1-2-4b40f8bfce1d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-fastrpc-v1-2-4b40f8bfce1d@oss.qualcomm.com>
X-Proofpoint-GUID: xREI1-Rni9bz5ui2tGy5dqpQJuvYnN4i
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d4afbf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3nRJTgfC3zKTbEAQhnsA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX+OSbxOvZaa+U
 IYKj1iRLpVntdQ0TtdbXtryBRSgFTw826cmm6KQn24Q/Ov6tyfDPSMj7rMe0aS9+emm+cgW5JN0
 tlcx9jmM7NcX62su5Ywr34ZHC4QuxtlcP0rdIk9amkuLzjRfKbEPiPJuLwI7ae2itFhYBbadBPW
 +Y7Cu/ZkT8NU8I8vCbi4pzDGw/X6euV0mFd9j+AP4jPq0nJ+CPQdiRZUqeiFPArdMwx+VShmEky
 I7iHFGftddebTLXEjoAFuFV36va9U4HgUl7OFRBmSkMH/HuVI014OXTYhkCy/Hm/gyclin5N+ck
 Daj5KE4p80VO5HwQHG1RqbMq7030Nj6ncIUANeXplpRRBXi+NwadDcC97gJjWY+bO0oxZKLd6k4
 3PxXcR2K
X-Proofpoint-ORIG-GUID: xREI1-Rni9bz5ui2tGy5dqpQJuvYnN4i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

On Wed, Sep 24, 2025 at 04:46:37PM -0700, Jingyi Wang wrote:
> From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> 
> DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
> both Q6 and user DMA (uDMA) access. This is being upgraded to
> 34-bit PA + 4-bit SID due to a hardware revision in CDSP for
> Kaanapali SoC, which expands the DMA addressable range.
> Update DMA mask configuration in the driver to support CDSP on
> Kaanapali SoC. Set the default `dma_mask` to 32-bit and update
> it to 34-bit based on CDSP and SoC-specific compatible string.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

