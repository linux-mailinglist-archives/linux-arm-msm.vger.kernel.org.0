Return-Path: <linux-arm-msm+bounces-73301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B99B549E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 859FC16795E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBA22D2390;
	Fri, 12 Sep 2025 10:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGkRMSDg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D287242D9D
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673155; cv=none; b=fzbHRfqWavwdhgN+vYYArThARaRlJ6eAfVSt9enxn+syiqCPJ+1y/f591RvlGmHUxOdCUCQ6yNack0BDJak6xnh5wbjoGYpZZ1i32/+i8NdMOOj6pK/CP1fztmqRe/8ayqVAdLEss6cP0a6VprtPk2L6QeOYVXOjh47L6HsXst0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673155; c=relaxed/simple;
	bh=zYERfnalf3Jo/X9Lwlxqt7HW3A3cVCP0YdwKshWJhhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJ6HlJVg0TiM/pQYgCK6gtNyHs8bzjYWfuxLUEJw2BLIugpOxwajBZ6V1QG+0I55a7urmbMMfxeOnYX49M4DX/ZfaAb9RfSmL0mF/A00zp9p6i3ubYpTc4P6dVCihED/OBM+zIYYETmbTPBoW8KBv4cw1BkcsaTVaLM+5e/eebc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGkRMSDg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fNJu017601
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EoZeu0gL7XFLE2oXZAdYX1fB
	kmSI6sTEmRZW+tG1M4Q=; b=aGkRMSDgGwaaJBbM0weNtqcHcsttdaCvb7pGLCje
	h41WvGyTCjM9CEnXLEGhA6kZ5F15GZd4lRFL0MvmJghIYDljoj5iOX07A6aystRO
	ZsF11XtSDDiNXaJL4/Zk3XPGbq94eQ4kwWA7hPrza3qr+fPdHHyBELrzN5WVUCxC
	JbP8GE618fEiK3OLfIoVVl6DUCY1FDEaj9IJCErQ47wUdiS4ft1ATxsZ3iqeHbXp
	5xr9eTX4t0DCsUOfV/yQsIoZ8c0nVzJxy60A8V2pDW+1kooYbH12I3A0NNM7xz7w
	2C4WI5p55cLsDOLQrvZTeSkDOi6iitmh3Wic73kli9dkmg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwskb56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:32:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7273bea8979so30806826d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 03:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757673152; x=1758277952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoZeu0gL7XFLE2oXZAdYX1fBkmSI6sTEmRZW+tG1M4Q=;
        b=HJZynacTUWdQYFwTku4f6VXZY77nIgXKKySHy6ywR2bC/PTF/BvvrhfiqzjtUxw1S6
         eSrUxoyvl9cIfQ1TYgTNNQ01X1XGdM3WW8ru0ZVAwDgOsXNM3ii8vPcitSfBTmPf8FDG
         pclzF+Kp+9oVOnRxiK2IzkHLXPjcZNIAsX9zgEL9nus0mMj94+FU9z7jQE2CaIpsHuHO
         3y4HMOsQdXMr3kA/hVZJ0lVNpcv0vvsr3pFo3pC/mkABNJ09QRwbxcn4/PjBFQwHp/D7
         zWQ15cl4XgSK0SsM6BcOSWiC62iDSUeAYQC9LciIN1kl64uIy9OoxmpK3fueWC61FBXJ
         W3+A==
X-Forwarded-Encrypted: i=1; AJvYcCXFFaSndFni5iACTCtsSHh40DyEwf14N5mN/6UW+iXuPgiUfI5FXWme+iwhvV307yELHWsAM5ccN3/2whZR@vger.kernel.org
X-Gm-Message-State: AOJu0YxKX5R4xKet06gjYLAWctAaJpNZOjS+c7irk51SRvy+02vD0yY/
	2dV1OlAB54SMVPlWsVrJipyVXXBKgdOHSGttiLns9gDMMjp5UMJLD1bYH9w7mXl1h7wEqLUo9ct
	jLAdO/QUClnJ2SUejOf8BQe2cQmYGCuesFOlkodFX1vT5q0G6u5il7vOSJ8lVEaSC6rFH
X-Gm-Gg: ASbGncs7NEY8l4UNTBH7Ur6vomnoyWjQ2vn5cvag0nQERWXfovS/OE4wo0ywZ5SEkkl
	fdcYMm76boIYLe50CLPpkkFmTIPNGrheSvibeGb9lsmDWQRbB8JIvYlmR9eYmkCKjNfymmeH5eu
	wpekyNodZy9y8PesBdXkk7BTvdPk2myf8x1UAYGX6LYYesi+bFISBVMGTBC2efuXlb0EwXWAUbI
	jCTzN8kkPYxzZRh6odivJkPSxewArD7a7yNnA6PvsgaRsbDHkvQGAipG2JWb2BwxJP9O64HbE9g
	Sb09b+/5H8A4NNJ5C7NCYCPStHJb++zbDkK3f0q3tyU5/YoGk33i3Fwj3icgzMCQ27awdTY24aq
	IIMJj2Vx8Z2mOMqdAFL0LLEwMJ7yt7Gokl7mETAeb6mzCxOFlB3iw
X-Received: by 2002:a05:6214:230c:b0:75b:f634:4a67 with SMTP id 6a1803df08f44-767bc026421mr29048996d6.14.1757673152219;
        Fri, 12 Sep 2025 03:32:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH65A47IPcjTGPJhYbtV51wn+vb+zZhqr0yJiBbHtP4GFqDciGEAz/Luthqfq7hIknGdaf0oQ==
X-Received: by 2002:a05:6214:230c:b0:75b:f634:4a67 with SMTP id 6a1803df08f44-767bc026421mr29048346d6.14.1757673150876;
        Fri, 12 Sep 2025 03:32:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63c87sm1082936e87.69.2025.09.12.03.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:32:30 -0700 (PDT)
Date: Fri, 12 Sep 2025 13:32:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 11/13] phy: qcom: qmp-usbc: Add USB/DP mutex handling
Message-ID: <nfugwwknnlxls75yo5rex6ggu5nzpq6enyx6e6nfnfei3icxjg@t7dnzcfcjw4o>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-11-2702bdda14ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-11-2702bdda14ed@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: yB5N7rGWVzlnZrKMxnx6azmJjyEUL0gf
X-Proofpoint-GUID: yB5N7rGWVzlnZrKMxnx6azmJjyEUL0gf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX/mXgdTTMmMB6
 mSzy65ml+bp++2xIv6+WUkRS1scSqmj37vEQR+oZlx5A3OGWRYdSnFFSQZhqam3HG4hJ3qRM6Wg
 A5mI69sCaUMpU9X1hy/PFqeuhaoBfq1DwiVv0jtFlSz2opILvY4I1iwSrnSR0L9prW06DpCy7mz
 hRapyZuKsu3sZVjj4BVlnrcy/uZ758onZCHzcjEPENIuV6xjPJq8RYZic//I0vaiULjsTw/SBu/
 5ZddXSp9bvEQkTxuMZZ8tqiaSLTyr4N1Qt64smzLbZlnNPIksa1nGU/15FvsiTFXb5fvWngGaFZ
 UTlDkGoRBA5VS2V2MT8knCHK6VbCi+c9VMIHJIgWYYXfWUhINQh8BiQdMHHJ0voR3uvnQGavd8j
 pUWgEROO
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c3f6c1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JLxk_RO0mVMWDHH2qmEA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On Thu, Sep 11, 2025 at 10:55:08PM +0800, Xiangxu Yin wrote:
> Introduce mutual exclusion between USB and DP PHY modes to prevent
> simultaneous activation.

Describe the problem that you are trying to solve first.

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index 613239d15a6a3bba47a647db4e663713f127c93e..866277036089c588cf0c63204efb91bbec5430ae 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -1061,6 +1061,19 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
>  	return 0;
>  }
>  
> +static int qmp_check_mutex_phy(struct qmp_usbc *qmp, bool is_dp)

mutex has a very well defined use case - a sleeping lock. Please find
some ofther name.

> +{
> +	if ((is_dp && qmp->usb_init_count) ||
> +	    (!is_dp && qmp->dp_init_count)) {
> +		dev_err(qmp->dev,
> +			"PHY is configured for %s, can not enable %s\n",
> +			is_dp ? "USB" : "DP", is_dp ? "DP" : "USB");
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}
> +
>  static int qmp_usbc_usb_enable(struct phy *phy)
>  {
>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);

-- 
With best wishes
Dmitry

