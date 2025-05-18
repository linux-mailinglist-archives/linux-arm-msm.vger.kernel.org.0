Return-Path: <linux-arm-msm+bounces-58313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B39ABAF26
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 11:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6541E3B5749
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 09:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B1C205E25;
	Sun, 18 May 2025 09:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n7Nev6nw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758F713D891
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747562251; cv=none; b=pwI5DU1cJiSK/B7jOMK+Q5Vt8OhdOgHTYebCItugm5L3ae27Skw48pM+S4Wbb2ZTXmv1nuk9Z3wvXZf3Wo6u8c+ozeBLm0wdfSSLkplHtLh1jhqG0s6pUBzAHJwWhjw4w/32NSMR6dnSz0q42CJRz/dl3GJQuTAfHLl/mvKeX0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747562251; c=relaxed/simple;
	bh=g0Q07u/rXiKtu5NIG4+5VhsYIiUztvKDg/4XRdi7uhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+mi1avap7UDa/20mY3cChhFvShbdw+U9V2cQlaxbr0taD/6O3B/Z52w1t7T8I6o+hIY/ZdNylNgNHNEgj/26+e/pxe1rev2Cy9+uyG/ClOYEev6xTDrPIP/oUWpMBeF+jJWFIHnP+Scj2Citb68w0cwsjPFst5CXlxXO0cGuO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n7Nev6nw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I803RU007090
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xtlsK26IRXZ/58NCN1CWrrVG
	lERGjp9AXyiJ/lMq4CI=; b=n7Nev6nwXxcRCXVjKKHTZtKH9pIzHQP5lZTR/d8+
	xt88ESg/dqQq14Sx0fgGt1fjz3nZUbII1KYtAsG9NIjPXK8xZDnfB1YQndTsf+rG
	OV3kJHVtMBhQnNs5363lk3F89YkbndWyfgWb8ummFF7L/FrR3O1vKrXuOD8NZyFD
	5mZuLi4cZe1Kei17TlD0JDSR2w0nfqUx83FC1RQLHc/l8+xYat6Drw/1o+Is1Y6Q
	6Fm4o8uzuiR8TVpi9Hj28HHuvDk6aQQGduyKqB2uiig0X+/s11P9zL6raZUdj4PX
	dm4c+rxmxKlvs8JMww3lhO6Wq4q5iS4iAsbYudh1Carq/Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnyhtpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:57:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c9305d29abso695621985a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 02:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747562247; x=1748167047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtlsK26IRXZ/58NCN1CWrrVGlERGjp9AXyiJ/lMq4CI=;
        b=FllNg63JJBgOHf9Xhy8ftVEUY0PoJYJJgOUUP6A8YAKCIlFy2sD83X19vq5UknAWIM
         JWkaUXYOyiOB6RaLGs6G0M3NA6VhA+iCfyEcS3IpYEtbApvXredBQf5qXKVbKUsmC7i3
         Rq1jDBak0vjOY6nWQX3JWkengIwH8X4axkOG09GNpJ/hhfLkgVKkcNegU0S1X0zumNIn
         kmKSHti7eKkPi69KnKELA8Ef+Ts6wtTFmgN/rJLdyCoJayC+Drxun12dNTtAOmPYquWY
         eRApq6ZZRi9Qo/kX6JFGe5uwMREYms8ldIjgk0lCivKEU2ddUCVyqZlWWZNAG/NnnqJD
         TV2A==
X-Forwarded-Encrypted: i=1; AJvYcCX+Lsa2WTDXQi2au3sGjwm+lsHShdPozvZarM+dPoEe+tXIyTvthB7RlCvlYH5Epi4U798MbzC0DZXiHbgB@vger.kernel.org
X-Gm-Message-State: AOJu0YxO2BN8umkTwjy6CrMqchkHvZxHld2tPNyXSiBwBfjSbx/XDtyL
	ovprgQM2nMJDoli7ihgy4ndzJVHQ1MkMUGDDT+NNP1y1gNahXQxdkbZVWy1/ALpRanAAbA0W/fo
	84bey/YusPqEnWwTYhc011WpoR47BF9v2YM6Fvq8Shr7UFl2b8+KTq84OKjyI2YJCg8EQ
X-Gm-Gg: ASbGncuMCX3YAWASs7GN8bKUGGMiinhlgm1VQ10KazT/5e38QC36a79OXrhyd2n01hp
	5eUYs45Gz3ZNeePHBXc0rZOY48bG12Ft39GZEeIpxOklyZVSdWBOidWfz1ACyBxROjrt7RTA/hp
	XEuUOTSjrVSdPErNtRl6lH9FB1a5UZyYrm6rgWHTYNDCc7JayFRZivDRnUVpNNgT5u1or3nRic/
	DVSyT3pzQbEeHhh5ULGjz3PoGJdA7pXvQep99RV4/j7bfYXKVwfSFQhRoWaTUI5gEXHwbnS4B9Y
	mCFs9nbIlioA+yo0jEclw27+6cM9d8iQQY+Fyy5S0S44omaLRWBVYIrbxMd7KlYSzdt/o63dWJ4
	=
X-Received: by 2002:a05:620a:430d:b0:7c5:5d4b:e62f with SMTP id af79cd13be357-7cd46779caamr1359734485a.43.1747562247339;
        Sun, 18 May 2025 02:57:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ5pBjRydjX6p8CyddzYdMdBy0D9FOBBlqON0ng7sKi7sHV/ur38csJo7tBnlIEVgInmOAjg==
X-Received: by 2002:a05:620a:430d:b0:7c5:5d4b:e62f with SMTP id af79cd13be357-7cd46779caamr1359732185a.43.1747562247003;
        Sun, 18 May 2025 02:57:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e9cb4d69sm1260695e87.21.2025.05.18.02.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:57:26 -0700 (PDT)
Date: Sun, 18 May 2025 12:57:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 10/14] drm/msm/a6xx: Simplify min_acc_len
 calculation
Message-ID: <cet4mrockbsa2lwrjmpvqfffhlk4r4xzbfoiffuohz37oaklsj@6spwjrcyxf7r>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-10-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-10-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5MSBTYWx0ZWRfX0gg5mZXx+1Ik
 JZgS5bUX4yUoFNfuwV7rBL/VXWoX9wehEijaSaJNgE98nmIdBOA1uCdsTYVYbBPaksQpjvBffVk
 /pbFl3gaTXlcPTtfpL5NRgacegX9pwyo38MIXSrizsGWasD3eFeg24iEAzcVbP09RdwXOjLWZLN
 PNLWk/HGJkWpKU/+zQkgKsBrsWlZRR2s+Zc2pu7oWbrDB1uKPZZgUwRgjSISNCXU5H8KZY9eoww
 CucIACDUmiRmolIoi4gc2se5ImUFz6HD+sRu/wAZl6RIaW8EDieqUZjzORWeq1yxbA5qaPwoM1K
 oAFkhIm0xtruy9Qbv3li/Cmfc84ZQb47uahmmmd+KuZTG1Dh+hU1Mm2tuZQrEgJjCaBniZI3zb8
 gw85Pqr3JpZfPlGvCSFMHoTvWbgrJIlUqhspD2FRyYEn7k0SotSXjahi05VhPquccF/Wjv6I
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=6829af08 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=WrN7u6T5calBdp3Od3AA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: uXJfxA-64cW7-dWgpvffFi-41ShtHSpR
X-Proofpoint-ORIG-GUID: uXJfxA-64cW7-dWgpvffFi-41ShtHSpR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=921 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180091

On Sat, May 17, 2025 at 07:32:44PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> It's only necessary for some lower end parts.
> Also rename it to min_acc_len_64b to denote that if set, the minimum
> access length is 64 bits, 32b otherwise.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

MDSS sets it only for a610 as there seems to be no UBWC support on the
display side of QCM2290.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

