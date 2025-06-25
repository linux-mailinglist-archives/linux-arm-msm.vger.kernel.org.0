Return-Path: <linux-arm-msm+bounces-62482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A070AE85DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 16:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC7AD3A31DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 14:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA319264A9C;
	Wed, 25 Jun 2025 14:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QxZ5cnOE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C837188715
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860677; cv=none; b=ZSrklh5tlP4WHu3HhgZNK9qsRUAoHI34/ai/iJZBaqveNNiyMNMQONyOHkQE/hmRcLEEoU/20ps2behdPn+6L9vosxncMHLtBc1cXXZxo9cuxWd2BCkwGM5A9y1+cqnS7oVy0eWI9crpTSsXkHjjsFT/7xL0xmEI2l+F5Pyegms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860677; c=relaxed/simple;
	bh=8eT/fOLThxftYtvpcRG/6FNIormyhjzWmm0diXGJqow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X67Ex6klJGLp50MGxIgPEO6c/g57euMYZQJgRCfdPEZuOaCfjBsqq1VbBZjHdRo3IEMb5P2QLxNv5BfWvmUdSPzAOSXOSiAax/3+9kr0alTpq/wwZh9a+OGUTqTJETfLjKeNWLt4kMPGENGD5eROw6DtJWmyhFRMtZm5b1sBX1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QxZ5cnOE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCbBfR006106
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+qRpaoWoOAGUcQvHdr+LjcPB
	Kx5JqKIrIwBc+b+23KM=; b=QxZ5cnOEpi9cUR564qPxT90NVWZdMVF0blLz00dN
	a60MbSUa6V+EM7Hh99OWQ4HjGiiA+KEjSbscHHrjQM37HpWes4PsW9Kw0uzwrNHa
	35APwRDXf2PfXrVzCuqd8ZsdD/goJMugEn2189Y2aCtY6dfYnh6RH2z1jMYCO6YW
	tvWUrkc3/gLOY4tiKmVeqqV3XaXPlzPw3HcaLz8OOXusD+/XrPBcR0NkzdITXADC
	9lkiaJhfQ3RyRU16K7Ar3kHcUbeygtIZlnfHoHF1WgRi1JA4y1v7WNulKmMrjHIa
	vgH7Q+pxZiaNV2CzH5PQBe9aLz8gixKu3L4D24lU3nQ7xA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgg5he-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:11:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d38f565974so171834485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750860674; x=1751465474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qRpaoWoOAGUcQvHdr+LjcPBKx5JqKIrIwBc+b+23KM=;
        b=Z1oQk26cjV1vddPmVT5mitaUAy9roC0Qqf8xZj3nJNU8IZaKWTDj62d0OhZtOlJjPk
         qC+vAq49d0dHB3HEBtxDAFjAPTnitlMmKk/AEIwjxth1a2brSNuXCSaAIEF1YPTBnI6W
         ElSxLzCrQQLEzaZaD869APGawPdltuIJ9zHjSXu4bDzRR/x8vZiLZCCeX6QjDYGmBbyX
         L79pD+iO1nB1TFX+gHWGtmsP6iGkm2DzUhvMCtF0qhkJKGhFFipk6SAZpLlSsUBiVnxB
         dsFIc6+ax9zcmt7hV/QMvRGLbz81ydvbWZFeGbbd23E6xcWgRCiDC34hYhKtK35NEIXE
         NU5A==
X-Forwarded-Encrypted: i=1; AJvYcCWQ96LuT4A/LP7nv0Uhn9gZxSanxVnQNu1dRrb0dYo+X+Lko4lKDGZ2VJSr4xio31Gpfl9HHK+fkHXW6xbj@vger.kernel.org
X-Gm-Message-State: AOJu0YxBcWlb38T7iMHdUl8HEHYyz/6cOgfMCrbnZhAvGOR9aV2N33Hg
	dw+udBtX6GbETxKGmfLj9AujZbEM8qgmXIjJ57+Z/gM7TIWjFQZYxMgLNUWm87eAL1gzAx1qBp6
	xxaDCjkYz+LbYUXsUv7xP6rcH/a3wVtdJxJHZiJVsr84eJ0X1oLvmzeUW36JqFNS2vAMr
X-Gm-Gg: ASbGncsXoyBAAG6+vpQGy55bWj5DtF5hqWNwRHwgVMafq1IL7CX/wfjyZvZRsCdXWh7
	1eAlA/S7QluaRKB5lGL2ndyXFW9koX3uKblzow0+rI3Kg7Ibgr8tjVZgSzL8UqNt1whGAUgyjGM
	N9LHExnau09kdq+ni3fYasVSsqGNnl7TS0C4Z01D3o3ED1yAvnX+bedLDcLiX1C3PorgIAV1+T4
	skVhJn4/YJLYzKQ/Fn0Nixe0XtwJu2zkUXYYGsNJfqjWLqHXvtoPT1oEi5vs6mdRdsvmePUYcIl
	IiDSyzSFO/K586a9CaO7AVHFblExifaAGHreP/rMrsdarJFFPIgu4iJFXo7fP/MNr/Y0XQ07jW/
	3jJbq1gP/zkJYwFnSm6okS7GeKz3HR5s6Dnc=
X-Received: by 2002:a05:620a:c4c:b0:7d3:ed4d:812e with SMTP id af79cd13be357-7d41ec0076bmr1016205485a.9.1750860674201;
        Wed, 25 Jun 2025 07:11:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsdTX5U21ci+ZoikbgW9ha3da7QH+cSVnPctS29p4Tf3xI2/dfSDOybeyC/94tf13yQvCYig==
X-Received: by 2002:a05:620a:c4c:b0:7d3:ed4d:812e with SMTP id af79cd13be357-7d41ec0076bmr1016198885a.9.1750860673537;
        Wed, 25 Jun 2025 07:11:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97f79ab1sm19898871fa.31.2025.06.25.07.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:11:12 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:11:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Georgi Djakov <djakov@kernel.org>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] interconnect: increase ICC_DYN_ID_START
Message-ID: <p3vjrgnxm54xvzvk4evt3v4hpot7stcxx53phopabe6eqa6qhe@rxbffiisaxrf>
References: <20250625-icc-dyn-id-fix-v1-1-127cb5498449@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-icc-dyn-id-fix-v1-1-127cb5498449@gmail.com>
X-Proofpoint-ORIG-GUID: HDuB0ZlOm4h1QG8Pc2WxIJXN4AzZm-ma
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwMyBTYWx0ZWRfX4TvulQ+XXqto
 aHF0GoA+fepSYs2/r6G0U6Iys4ajeZ7chRcdpoqn6TW8UZ9oCKOUChL5IwAhaJ7pexRqJJFHHnL
 yGr/JP/w3bLI+7dCMFzaEQYs124bDpdZuwkazYNUeIjk8nPLAgtTJypLjtS7NxQ2+tRwoVjE5vl
 LqMkGHnVZncjtAzVI7yTOX/8icYhAxgz19pRJfTb2w1t/kxsrLK1zYZs0Dgv33B0KO+mDXUqhqo
 GYqzneOoS9Ko7r4TutPHTu/UneeZWJi/RK9rDaR7DYmp1KIsbhUgyt5exI7k7Ly7wwzGecKyMt0
 XZ7/sT6lMN5LvBnp8pPQhuA9upceBsODx4PpTvwt4u31RJIudCwYyTq7mznFHauGaFqFpge5mA/
 0IiaUvOleTszTk9PBcJMq42OYlBuMaInDwvGIS+Qm+jWHkSyVGYtTJIlHNYONXl3a1K0VPSd
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685c0383 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=lmldiUiqA5WZr_cUjP8A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: HDuB0ZlOm4h1QG8Pc2WxIJXN4AzZm-ma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=883 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250103

On Wed, Jun 25, 2025 at 03:34:23PM +0200, Gabor Juhos wrote:
> Since commit d30f83d278a9 ("interconnect: core: Add dynamic id allocation
> support"), interconnect node ids greater than or equal to ICC_DYN_ID_START
> are reserved for dynamic id allocation. Yet the icc_node_create_nolock()
> function allows to directly use such ids for creating nodes. This can
> cause problems by executing dynamic id related codepaths even for nodes
> intended to use static ids.
> 
> For example, the 'nsscc-ipq9574' driver creates interconnect nodes with
> static ids starting from 19148. Because these ids belongs to the dynamic
> id range, the icc_node_add() function replaces the node names
> unexpectedly.
> 
> The node names looked like this before the change:
> 
>   # grep nss_cc /sys/kernel/debug/interconnect/interconnect_summary
>   nss_cc_nssnoc_ppe_clk_master                          0            0
>   nss_cc_nssnoc_ppe_clk_slave                           0            0
>   nss_cc_nssnoc_ppe_cfg_clk_master                      0            0
>   ...
> 
> And those have an unexpected suffix now:
> 
>   # grep nss_cc /sys/kernel/debug/interconnect/interconnect_summary
>   nss_cc_nssnoc_ppe_clk_master@39b00000.clock-controller            0            0
>   nss_cc_nssnoc_ppe_clk_slave@39b00000.clock-controller            0            0
>   nss_cc_nssnoc_ppe_cfg_clk_master@39b00000.clock-controller            0            0
>   ...
> 
> Increase the value of ICC_DYN_ID_START to avoid this.
> 
> Also, add sanity check to the icc_node_create_nolock() function to prevent
> directly creating nodes with ids reserved for dynamic allocation in order
> to detect these kind of problems.
> 
> Fixes: d30f83d278a9 ("interconnect: core: Add dynamic id allocation support")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/interconnect/core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

