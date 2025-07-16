Return-Path: <linux-arm-msm+bounces-65309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BABAEB07CD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 20:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B76D34E0CB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 18:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4692BE645;
	Wed, 16 Jul 2025 18:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jdgzDPo+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9DC29B205
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 18:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752690194; cv=none; b=r+/Kt79TMR4kRBZGGIq52R9mdX8ptuJqdREweIE5Gxl+azRqp5Eqk3Oixk1aVv9skX7bWu4o7bhp7C+TRcOBa7Dpv13XvOWo/wJhHEEcmeerw7l8fcX5rHTbM9MCyEL+VGtb0Dd2b+TdG0GDWypPZYE5TsVuS9UoO4vYK/qjQlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752690194; c=relaxed/simple;
	bh=DoCggDPXxoCH10+4U1zekwBy6EFTZXslLJab/HUMrvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ffcDljx/YGp1sJGFVnCL6PK+EosyIGml9A8rE1lOQJMqULwJ5JLTCczvBehUZ04qSgxRKP2fgX5PfRJt1aVcm9ZddQVtb4buF3pITenPvZD/6JQ3VKn4OZ20pv8iFHxlPXelEqjKuZRjeFbCr695EhOPct0z+mOFgScIGfZo7rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jdgzDPo+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GGDfJY030631
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 18:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JK4iMoMMVXxdCtDOd3oRY/UP
	XotWkPq616eJEmzqYJI=; b=jdgzDPo+S5AeuFxHitcGVjiSb91nBxdmv+ZwTS9B
	KJ9Fn97AOnoeL4wtT8aau1LwC9v/yn0gk1cPJk+XNNummwnlWWohJ1QulxHoi3kd
	XPUhZ3oGK4+aDEa5EIqfvtDL8gXlxefqhNPzjud7Z/c3X25P8/MGp/TUYTRYLUJ/
	mgGAZSvsXTk3jK+AEqFUVn/5Mtk4WAf/t8Gggwg7QxDfWevcYPb532lLoWvGaUlR
	q4451Ygz0AdXirlQNhfDABBNAeK8qlLjP6GbiFXGhSdzitFCw/9vE1imZXry5sQb
	AQCBuiyzzapPs7KXTdmlpOft9TkSwzB64gi+1i+Rg/ewSg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7hsf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 18:23:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7ceb5b5140eso18616385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 11:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752690190; x=1753294990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JK4iMoMMVXxdCtDOd3oRY/UPXotWkPq616eJEmzqYJI=;
        b=Xesyd5yYhkSQEdYEBzsPlQzWG8J4KbRWRqAZbSELdjbS0YSBL3r4rgvf8q85My20mo
         IWH0bgXiTGcIbBZMl+yn/DBc4ghgo9382PxImhsRA23sze59yn+f+c/Ibt7x0LhP0WDq
         0ry4xs7yYGVscMSHdkZp2NSFmy53TQLwir4glYTLgeC42L9gwPRTcYJbhfWqYnUQ/KEh
         A/yl2TqTvlYwaUkC8SfcRTwQFQIWCdVBXyKDOna2JPVwu3C6SePxDa8DbVuVvR72Wc8E
         Q4rujWHf3FeZgRz02F3EWjQmUbBC1WIVq4Y8hPYiRlyGGw6Fpgs4W6+y75xx1cs/IsBH
         Mnhg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ+9sn/t2KxN9gimiVHzwVOk12dlWi0DNenL82iYzfdjWDAjibq9/2edSflLKGwaA7z/tl/spa9xWbsfSF@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuu/c/PKmdrLNZz9yfJoU2lXARpopNSh/EQgwj9M0W3r7hzvey
	0nopL0M2fkvH/1wYk1Pn3zSyknbzjqhihSHnLhD8ZqHeEBUU3dARmz2sHHJctc8mlexRazuhNfG
	T3o92STjEAzh+zNdywH9kfS+Xr4bYuoMal6JHzARb+HCoNs7+PveDUgUpRr+D4or7PDSC
X-Gm-Gg: ASbGncvSXMchj6gQ2iPH0cdMZXIfzbFENiMLMw9dk+9S5nx46pdsvmYDrhSnHaZPbTe
	kiWdzL54JjncGpwsS9asxBQgMilBS6HQpnzupTnLHeNKT3lPLXCLdVa3OQjy9fe1xqzREelHd0/
	PUmtozPIOhXpnHJdxxzrekCaUtTKBA79WP5zreqdba/l9DnV6K8S1oCmC4KeygJkJAN3b8k8aXO
	QrmbcyzWgWeswxCOVHhoi3TM2no/YAQdIQ7U/53Qt4XUfCTXoeAA7wM/SeFJo55E6feUIE8OcqI
	YSu3lqcIpka1K/5dNOBbyHCXiErqDTOS5Q3s8sFb6/baAj7BFS4I8trVtAaPY5xCmIoBNyZCn+x
	Seh5MlM/m6rPG7O9nCTYUrR1+zArMVgE/qmJ0yIHOI2wWHlrlI4th
X-Received: by 2002:a05:620a:6282:b0:7d3:a7a7:27ad with SMTP id af79cd13be357-7e342b368f8mr700585585a.37.1752690190338;
        Wed, 16 Jul 2025 11:23:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4dGOAQzmmOnjOY9QLp8IFiHzk+jathDu/1gUNdhAauGYoBTABP8XBoC53a1ib974mH2810w==
X-Received: by 2002:a05:620a:6282:b0:7d3:a7a7:27ad with SMTP id af79cd13be357-7e342b368f8mr700577385a.37.1752690189707;
        Wed, 16 Jul 2025 11:23:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bd725sm2745529e87.14.2025.07.16.11.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 11:23:08 -0700 (PDT)
Date: Wed, 16 Jul 2025 21:23:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: robh@kernel.org, lumag@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        ulf.hansson@linaro.org, konrad.dybcio@oss.qualcomm.com,
        quic_tingguoc@quicinc.com, quic_rjendra@quicinc.com,
        kamal.wadhwa@oss.qualcomm.com, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pmdomain: qcom: rpmhpd: Add Glymur RPMh Power Domains
Message-ID: <brk26rybf37png4lqea2ekmtdpvdubhih4rq4gazek5aqjzfs5@nbthyvvnxtna>
References: <20250716152758.4079467-1-pankaj.patil@oss.qualcomm.com>
 <20250716152758.4079467-3-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716152758.4079467-3-pankaj.patil@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDE2NSBTYWx0ZWRfXzLGcJqKMkVN2
 HevSqy63ChjL52bqhE1B1W9MkZcv4PuibCYq8cYn3Shrm6ZmEFYfUppkVXutA6rTe/Oyn1qlCtx
 l1NfDyIPwV8OXZGu9ltxU5vGdIQDYh+tX/px4CxeXDeePqH6K0EhMGYEayZ8A4KOsUAceK9/G5e
 VnPB2dRQ25eiqE2uhXajWiK5+zsDmF6kfZ50R9sxW6YCZ+zZcoefN7HqJwwD33QhytqI9VJmdlC
 ua4Ri9JfZJpZeop548XRYsEc5UFSpHdm+DYQHlCtL0gOz4GLjFS83m1ZSO8NY7UqFHhi6PuLkjh
 4W/ZLK8yR1mpekD5L+p8Ki3BJFOnD40v85N+x3I+xzKo2xHRyjXBzeoq4tW06jomMrAqRgM+a/n
 f3Hm6KllOw7E2JFJJVIThyvAlGfEvlM9mTXqaBjoazJNcqljg0J+eZaGw0jEkqbFQuLNol32
X-Proofpoint-GUID: NQZku5WT7x03_bblNhBi80RE2crMt7eN
X-Proofpoint-ORIG-GUID: NQZku5WT7x03_bblNhBi80RE2crMt7eN
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=6877ee0f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=DTRyGS_NSo7weVScNrYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_03,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=846 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160165

On Wed, Jul 16, 2025 at 08:57:58PM +0530, Pankaj Patil wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> Add RPMh Power Domains support for the Glymur platform.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

