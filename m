Return-Path: <linux-arm-msm+bounces-69852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CDBB2D0CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 02:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DA3F624829
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 00:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88C77081E;
	Wed, 20 Aug 2025 00:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cEO8gOtj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633AC3C465
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 00:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755650979; cv=none; b=JyWbkB7Wv47XpYRyd54KkIIdeYwe4fRvuRHHTQ8yusVDnhshncarwmBLyYg/cMYk3VPDfqJpDyfYJdUVOmeQypNwBFd/jUIHQgK56ByuBeDIKzK1PE+ylLyPbZC8dgzwrqe2sbteSWXsXAKH14J0nxP9h7yIrwW1lQHHqZqouFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755650979; c=relaxed/simple;
	bh=Rjq+3fz/bHLH5SdPEX0my0AZO/wLNhETTXOqjlGZUFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzMAg8N9kYT3L+iVhLcIRYO4TESZWMj7aq4dlzxUUeUsz+MPcqvGMzvO5JjGYJ0o4Yf77q7J0BDH8Stm8oo0mBfZjLp6LYJhegIMbQeKQvahD0wxoGlctu6y3xcHuu0+Zcdqiq3lxI4wY9l9fragNa/wOr3qL3BAHcxt1R82fZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEO8gOtj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JL0pRP010823
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 00:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7zu7l2y9FBY48F1LOrgt552y
	dSy/rBgg7xXX+MIdGBY=; b=cEO8gOtjKCDyVBmgTI2FC0zHb7EUqrTyGCT5cnI7
	IXMGLE0Tq8TVen2mFXh0N2Sl1nJIxWH8zOIqKsua4DuMjtAbWUQOjNqeNSxddk/S
	ooyQ7z6rCBeRlE7/WqZAvy0YZSa6Ytq88MvTy6th308rt6Fc4A8jvihpD/Rzsbfk
	lNVs2OVHSgBs/lyMI1YbOSf+Gx2VHUezMKEqKNoQW4DT0kukD6bbgc6NTcpZmbrO
	IfymP1rYxZOsVyP5qVBjDgJdLDqBepiVqRHy7uK6uvcphSR6tC9k7bhgjL0ir54+
	aZilODCBAqcqFZ25i1ea4Fjyh45X8IKhzg2zq4hgVf6SEA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0td8e7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 00:49:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9289baafso9433276d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 17:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755650976; x=1756255776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zu7l2y9FBY48F1LOrgt552ydSy/rBgg7xXX+MIdGBY=;
        b=MLeOBLUoAD5mZsncWBbKluHzsTjPMNnIK/IF7kBIsKbbQhDbVl0+PPC/zUKlspsHUk
         5mGU2uLGtXb+bnGqTMreklQ4dzTUS0X1FnAql4Am1I1wnZrtXHiwBWTR2KX76tHUmt7b
         Mjqm+29gTiJNUzWd3B8upONteiCzNL7rrgor4A9sVgAms1GI+PEV4nxtmGz5WdfzdIlF
         OB5ZksHarUMNamWS/LUeBtuk5BYTeW+uB4HPejJMYxmkcPhffKCUuoh70w8KcfeJGm0L
         LQQY09LF+nnfCQPOy65q+ZasXW69/dLrqN2RQKkSuxYYLXkO74n26LWbMMNUaIuXp6Mw
         gi2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUquhWZNAKCRSVpB7897Y81AIAkAKHCE5nMePmIeRERKW04J084aPg08fepK7MJwj3mY/il2HJwRREYVrHa@vger.kernel.org
X-Gm-Message-State: AOJu0YweATcJdnHeTH8cnw1G0othjp6lP5InysrsR0eQvAWReIpK1sO5
	ADEJ/uw5ugUH6HPme1Pqg6q+FoR717TxVUrMd1/+5pEhICU6d1XnsqmazSrE4YGtko8ckNbFvzB
	gwz80yEyHEQfh0ThYTiMnP8D5dNryolZHS8iTkZPnoFqjHiEGs9tNSM+hv6AN4CnrG33H
X-Gm-Gg: ASbGncsEaYpqPkH7I0zXH5XigCFS4OJHGdm9Opg8Ruw7XWlRweUYWJl5Hi43qLkO/pc
	rLY+TwKHY4TRAQXrJOKWPPU0Yb38bjxp+JRISatWwIvCLl1+UW17Y6OZsDDSa4LQZYn72vAjap3
	nQ3E042ev/XEnCxWAMnt8h6DQKOEJ8O+rRnlGAXNVJPMbXgngAr8VFw8g/QbAfBXfbFGpZ5/97u
	yjFUFMyzOmT252csmeUgVSf2sOH8kj3uAB3L/q9kXYJovd5S4BeuxCor0sQU7CSUXuyH7cEbKS+
	1jk9TLCWQeSqo0o/cthVpM8osRYFzMOecUqlMrsWI7TnNbRXI4WtLl1OJehexS2yqGY5q+Gv9Mf
	RJsuPM+PlLQW6Uu+PJ8l94PIvDWVjkW5fdhBI3qgm+OmGTd5W27+O
X-Received: by 2002:a05:6214:1c0c:b0:70b:be30:62c7 with SMTP id 6a1803df08f44-70c689212cdmr48106506d6.24.1755650976072;
        Tue, 19 Aug 2025 17:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJlvHfhO/H8jyDOpduulQj1SpN2n0STcA5OEQOkKAQCJmffL6GHOubWWLrzJfepchpusERIg==
X-Received: by 2002:a05:6214:1c0c:b0:70b:be30:62c7 with SMTP id 6a1803df08f44-70c689212cdmr48106356d6.24.1755650975640;
        Tue, 19 Aug 2025 17:49:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35f11csm2323366e87.51.2025.08.19.17.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 17:49:34 -0700 (PDT)
Date: Wed, 20 Aug 2025 03:49:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 2/2] phy: qcom-qmp-ufs: Add regulator loads for SM8650
 and SM8750
Message-ID: <ger4kizeltjwalfuwu4dpfjiskrv2okgo5c7d6n3pb24yaxgfo@nkcndblyx3il>
References: <20250819222832.8471-1-quic_nitirawa@quicinc.com>
 <20250819222832.8471-3-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819222832.8471-3-quic_nitirawa@quicinc.com>
X-Authority-Analysis: v=2.4 cv=OfLBzhTY c=1 sm=1 tr=0 ts=68a51ba1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=ehUKESkC_4NtqqJ1MVkA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfXwpr+gYZF5Bpe
 3pEqPYCKv02H0rhhbJPgS+wYRhwl/E53M9VU85E6SfS2eJNMJ/brnwoPWhKMPE0sCJ+xRW+AZoW
 QZX6EOMBrAaoVweiX4JJxkB2S8MFkVBOeA3cHCySJe5/wUdMWxQRTgcxPqbSTC2xfnj/jrT9PC/
 ZSMenNA8cPwJFWoeJOhNC+Q9Bz9k4q84I86pPZAr/0J0gP8NKZfoD8ryeHk0dupWGCr3wO0WaHE
 KNV7HYj9bHNpV7I+zKIJC0G7wgNmlXf4ytqwCJUttg8Op8ZZhrKUPXo7gdqP6gXLDbitBY47w3M
 QjTtr6JeduzQ5ro782gvekUNAQlGVu1/jRmFuwKUcDL9NFXFzXGJnGCNiLK73ZzdNMOhTUGZPFU
 3usd1840Is3esnSuOOfucjeoLtirrA==
X-Proofpoint-ORIG-GUID: JBovPl-aM9aPUW21FpOATfD6AmwySHvA
X-Proofpoint-GUID: JBovPl-aM9aPUW21FpOATfD6AmwySHvA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508190196

On Wed, Aug 20, 2025 at 03:58:26AM +0530, Nitin Rawat wrote:
> Add regulator load voting support for SM8650 and SM8750 platforms by
> introducing dedicated regulator bulk data arrays with their load
> values.
> 
> The load requirements are:
> - SM8650: vdda-phy (205mA), vdda-pll (17.5mA)
> - SM8750: vdda-phy (213mA), vdda-pll (18.3mA)
> 
> This ensures stable operation and proper power management for these
> platforms where regulators are shared between the QMP USB PHY and
> other IP blocks by setting appropriate regulator load currents during PHY
> operations.
> 
> Configurations without specific load requirements will continue to work
> unchanged, as init_load_uA remains zero-initialized when .init_load_uA
> is not provided.

Can we please get configuration for the rest of the platforms?

> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index aaa88ca0ef07..1c3ce0fa6adf 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1170,6 +1170,17 @@ static const struct regulator_bulk_data qmp_phy_vreg_l[] = {
>  	{ .supply = "vdda-pll" },
>  };
> 
> +/* Regulator bulk data with load values for specific configurations */
> +static const struct regulator_bulk_data sm8650_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 205000 },
> +	{ .supply = "vdda-pll", .init_load_uA = 17500 },
> +};
> +
> +static const struct regulator_bulk_data sm8750_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 213000 },
> +	{ .supply = "vdda-pll", .init_load_uA = 18300 },
> +};
> +
>  static const struct qmp_ufs_offsets qmp_ufs_offsets = {
>  	.serdes		= 0,
>  	.pcs		= 0xc00,
> @@ -1638,8 +1649,8 @@ static const struct qmp_phy_cfg sm8650_ufsphy_cfg = {
>  		.max_gear	= UFS_HS_G5,
>  	},
> 
> -	.vreg_list		= qmp_phy_vreg_l,
> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list		= sm8650_ufsphy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(sm8650_ufsphy_vreg_l),
>  	.regs			= ufsphy_v6_regs_layout,
>  };
> 
> @@ -1676,8 +1687,8 @@ static const struct qmp_phy_cfg sm8750_ufsphy_cfg = {
>  		.max_gear	= UFS_HS_G5,
>  	},
> 
> -	.vreg_list		= qmp_phy_vreg_l,
> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list		= sm8750_ufsphy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(sm8750_ufsphy_vreg_l),
>  	.regs			= ufsphy_v6_regs_layout,
> 
>  };
> --
> 2.48.1
> 

-- 
With best wishes
Dmitry

