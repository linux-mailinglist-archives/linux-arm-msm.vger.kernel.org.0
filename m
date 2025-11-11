Return-Path: <linux-arm-msm+bounces-81229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 547A9C4D4A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 12:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED16418C0203
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 11:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C393570CD;
	Tue, 11 Nov 2025 10:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZE9KAt0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+UnbB4E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B96234F481
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762858482; cv=none; b=e+0jj0DG5HTQB1VI911Pw42bqwCpwHyUCTMZOsI/9XUO5ukZ17ufYnr3iLOEovJpHzqxe7PTmuUpu8OPI8RYfJIurXewECrYcDpS0pVU0BcUbUu97WYyUKAJlNJGx8WMn+Ta9mkgBTk66Y52fcDD5tRrYId8MIjs708OJGO0Hos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762858482; c=relaxed/simple;
	bh=uX2FRXbwwZCCv1tYbHwS7dtnDr3CH51sdbhNp9wWUD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTi2o3wGm2s1hq5GdwRj7eIG8M1kB23LgDUFV412yWZyxj0Id72RvLrrSG1Y54YOv8NVrX08jXFKOvm7T8vKek5o5mQFCChUVNjFwXhmXz+C+p8teyb0Ql3isNEiHfKaiboznXNy0lvoFDw28amZZd46SssKHOrMV1oEBVYuXpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZE9KAt0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+UnbB4E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB7HXoP212299
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bjzJGvDc5zRS1OfTZQSifCpq
	YpVSEVlEOhF0L9KjMqA=; b=VZE9KAt0/uqTpHpUQlsHtUrGzV2Xaiq2acFdXg9B
	0Oldk1XNUX+M1FOafQpV5D6QJ3w7vkE3cuvA4gyK0ZaWgcnfsbRbLDqWuydJgUSD
	TUwTc7wXaXDRna/cAp+lomRL8nBE5FmtQokVflqaVpOufdXbfX3PAdSl1BP+qeQ4
	gInKNEuGfpxRdqveezwIyNsQoWkxys2ksQh2mu0KL8Gc2yIArPBAgMObTxnc8o6H
	CUq29WUP4BccXcwNsc72oo7yfgMws46TrdCv0uPKImHQyhKAEr1EV5Kw8B2uT7Ct
	Kr4hhxoosmF8uKkkZZhjGFGSDyBAEwM7XSB48SLrxiDYDQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abpy8j4v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:54:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6855557aso16431121cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 02:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762858479; x=1763463279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bjzJGvDc5zRS1OfTZQSifCpqYpVSEVlEOhF0L9KjMqA=;
        b=Q+UnbB4Ewj2XeOZajBcSkjqCzmU4qlhJZkbBDIcJ4bUqtniuBEJ9lOJMnNLIw92FAr
         VtueYJeLxyh+pc8bDLDyaDK+o0dmbDLHAuf5P1ZoPGbJ5jyKGDOK3SD1pBjdwx9WqFk6
         MTFM0K4nuJypr3CwvJkDQYUTCbIEV2OUMu2hP/gqL7Rq6Zhhk9UObdgYVq+HXe3+siNQ
         1cvV0xulJiMPNQ4kX3PfssHujeO0lG+i3DnljgLjF9kqrCEHcLYPSYS3jZnJ67qwip60
         DKz7kMsBU8b2o3/bYcI9RIwR0PLxuTaqJS/8wbbwnjFt0XTabzOhuG21j9I4ph0ew0LZ
         qQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762858479; x=1763463279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjzJGvDc5zRS1OfTZQSifCpqYpVSEVlEOhF0L9KjMqA=;
        b=f1WBamGKMZYbk+DyRET7IZiVTQ6R0B5XTMqDM5zTgdL0lR/VrnLoJbVQIubXJ7z252
         kX7JWhTg55/yXtf83kfqB7hBXaiIePu3e2MDhRpXyIquoH2aaPrfxljrAzGOE6Y571X9
         rZrmjIguxhJXCbEmZlZKz77r+/C5KdU1IeZDJ3ysWlp4Rl/sSJxNgD6Q9MGoS1R9WO9a
         CAU43V60CAZIM3kRWZBNZRXGpBJ4lCnXvcTPJHg4apVfxFFc7h2TI9a/Xpd36IX5foYI
         THdRHuwsJpwn6OiXuU270NRAf7c1tnS2NDiczrLOgaQGzLiu5qnu6+ufsGoqLdzWyrco
         FYEg==
X-Forwarded-Encrypted: i=1; AJvYcCWFY2m8vHz+Jhl9grQe3h+8/CWHYJmhen+uNz0H+rMj5AxopXs/okLO56+PI1998nDiB8Z4oyRi7qf+Zugk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl/k0Ca490FUgAHmB1/6KoUu19Kxa+jWaZsLa6iidinN7ttBqO
	v084nOg64wv0QcLqYhm7+r1ndxILWhDEo4bD9KOo7PfVLBd5axZCiJsLJ6vY6vQoYsZpnpPLNRD
	apk00TyGFUmMPgszMs8UZc9WazWVDLsZtFejXxFiWgqmFgO4Wwlg9V6Y1PFcoaP1H38Jl
X-Gm-Gg: ASbGncuq0zpQkYObyyOkqhDsAmojIqkypDcarR751KCF9PnRqrGK3s/N4D5uBx8/Esc
	7YJE2FOG8AT9U7hcuk6yptNSQvwt+iTBrQcswks2mQshnV//zzMTw+Y0OpZIHD+rsYJufhOO8xT
	EraaygKdcJld/ud6eyIcB1ie8yy8phTZqB+YMGtsER14I5IsBY15SNDapyrvdEA3ZX7D+l4tu4J
	wOZyjR2olYFsbL4aq5nmRaW5KQSrrWVne28i31dwc4OaYGNQevuhK1kFSzWFnJeJl4NS/G9lp3C
	tu9wUkbHJaYzskn0X43LFvRMBlBPizpfV3K1MhsutzXS3TluyaDu/Edh8r7Sfles7URSaIMImNe
	9Ivys7B10dUCMXQJaKoZD5d7rK0xpcnveE1eAOfPGA7FSiRQH3SycbCrI0cSkTPNa+SWib1Z8m6
	qTxDGF7MfRaDe6
X-Received: by 2002:a05:622a:188e:b0:4e6:ded9:6b29 with SMTP id d75a77b69052e-4edcaaa3ea4mr32888431cf.3.1762858479344;
        Tue, 11 Nov 2025 02:54:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlDf0js8yY75bKRYmabDEAq0elXP2pI/iZd6RI90nqeKsx02RoVZL9jJHhTzE+f6l/HKMiwg==
X-Received: by 2002:a05:622a:188e:b0:4e6:ded9:6b29 with SMTP id d75a77b69052e-4edcaaa3ea4mr32888181cf.3.1762858478897;
        Tue, 11 Nov 2025 02:54:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a0b74b6sm4784539e87.64.2025.11.11.02.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 02:54:38 -0800 (PST)
Date: Tue, 11 Nov 2025 12:54:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 2/3] net: mhi: Add MHI IP_SW1, ETH0 and ETH1 interface
Message-ID: <ljrvtl447meb34zfgzef3dw4oqfp6j3ixxwoooewxxvqsi23tz@fbg4zkpctddn>
References: <20251106-vdev_next-20251106_eth-v5-0-bbc0f7ff3a68@quicinc.com>
 <20251106-vdev_next-20251106_eth-v5-2-bbc0f7ff3a68@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-vdev_next-20251106_eth-v5-2-bbc0f7ff3a68@quicinc.com>
X-Proofpoint-ORIG-GUID: znI1K6kOUVc1yN9fGtYSvOQbPBe6L1BS
X-Authority-Analysis: v=2.4 cv=AYW83nXG c=1 sm=1 tr=0 ts=691315f0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bC9JWDkrhmRD4PJ24AEA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA4NSBTYWx0ZWRfX18wy1xkbmSS7
 Lf9llILx+Y9De8xpT4nXWDvRB4qnpXO8IOwnuuDLiO9ngosOtMKWlJajzowx0yAe9UkfQGfdTSc
 pb9pQmN4nWiOXxENMYoFS1IFxqFORciXQk9Q37UZp4zv3DI+6AURyePYvb/la0a/FZf+yO+lHHG
 8ZL0BJT07RrsRbiJfzYYHhMr2beZcjnzT/dr+LPmEM8VettCph+cvOK7Zr0CbJdatPFtsNNtL3B
 wJfrAA1cIkRH00pjF0BxW0N+YGoVEfKVX/xrVJki+4qE0SgUdNZ3uxX97qR/ye2nKqApFHcTWBQ
 iaA5V+pVOxeoPndZLWqqHvYMvneDuyB1XABMjZ5enppLJS7ZKFvHW1lm+Ad45t1WfvYzZ4Yah0L
 yxdpp+n9WR6SUOf/G1sLvwEQkVpl5Q==
X-Proofpoint-GUID: znI1K6kOUVc1yN9fGtYSvOQbPBe6L1BS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110085

On Thu, Nov 06, 2025 at 06:58:09PM +0530, Vivek Pernamitta wrote:
> From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> 
> Add IP_SW1, ETH0 and ETH1 network interfaces are required
> for M-plane, Nefconf and S-plane component.

This is a very useful, totally uncryptic message.

> 
> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> ---
>  drivers/net/mhi_net.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
> index aeb2d67aeb238e520dbd2a83b35602a7e5144fa2..7fca7b1ec7b8250fca5b99ba6d1be470fed87995 100644
> --- a/drivers/net/mhi_net.c
> +++ b/drivers/net/mhi_net.c
> @@ -449,6 +449,9 @@ static const struct mhi_device_id mhi_net_id_table[] = {
>  	{ .chan = "IP_HW0", .driver_data = (kernel_ulong_t)&mhi_hwip0 },
>  	/* Software data PATH (to modem CPU) */
>  	{ .chan = "IP_SW0", .driver_data = (kernel_ulong_t)&mhi_swip0 },
> +	{ .chan = "IP_SW1", .driver_data = (kernel_ulong_t)&mhi_swip0 },
> +	{ .chan = "IP_ETH0", .driver_data = (kernel_ulong_t)&mhi_eth0 },
> +	{ .chan = "IP_ETH1", .driver_data = (kernel_ulong_t)&mhi_eth0 },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(mhi, mhi_net_id_table);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

