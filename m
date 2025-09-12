Return-Path: <linux-arm-msm+bounces-73284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E91EDB5487C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 11:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97AEF17A491
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 09:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8A2289378;
	Fri, 12 Sep 2025 09:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QHzpERss"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E624328750C
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 09:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671007; cv=none; b=FXrNcGCyBlshlJjUWPbzsk3jq7+4beOsnR0qF9/CTJBkvls5BRs1MAMnTcRpsCQ59U3HZ5zp0ow4weXnIoXIZvcM46qgtaRBsoaj2EjzckFg85hnYT4zahFWuxWDrqnwcF/ntPera0WEkIruyDI1JlqGoELU7cPePZ6P5pZlRKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671007; c=relaxed/simple;
	bh=SlOs1DS/YlC686LAlZecB5zz12ropOMVG2osPw6RNW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=inhXLqA1tU8O5VxVGSUMLbo++uCA8KDmLvAa2k59aC9HFvxJep6tGZcMC3eBoN3fH1vy1y+K4t/X7op6s+2ghJHE1Cn8LC6gEA0UYENRnJTb2DKnTzrBqeEddFxbEBqR5Af37JNdunC0Ea1FuADhLReD4qRDe21AYbTeQp93Vb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QHzpERss; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9flHZ002431
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 09:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OD9Udd7rbiexckZHIpahTYqB
	LCmCWRywICtA7wRkc1o=; b=QHzpERssArGdpxOQxFRxqzVwLfUS1u4bDarSxvg9
	e8jIYhrccYF7cecxuM0xPfW4v0nx8yrzK9OWVW57dfQgyvi2gMY6IvGw1DPxZfj8
	9MA05eP12GFFEe4N+yFUTnbPASptLC+grOZPNEhbM5mkOsIHcQbPVw/r6YZc5JhI
	XF7BGfqr6yghI1d+z9x9bXKUx/rUifwwBStb3cECb2UJb9D/4syH/gAB/lKvpEUT
	4X7Hn2D4viFh9INnrBXQPhkzG57ts9lJY3/zXxI36dFQicdshP3vAH4WwpCUURY/
	+YtFtceIBMW5bW6p9EZUuX50eUgVdySpPTPElq78/fMxGg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h63k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 09:56:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b49666c8b8so37039321cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 02:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757671004; x=1758275804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OD9Udd7rbiexckZHIpahTYqBLCmCWRywICtA7wRkc1o=;
        b=FuzheyZDRl3dVw86Uk7mdvk26LnbcdeNzydILxkJOsDu+lYYZoHB9yir549D8ZkP2l
         67WUTn85YtKORMLOXvln75aCzUaV94Cc9k1t+N9AGbEQxd81NsdEBxyKLpbxjlURS7kY
         nGtB4uWd9DcSM9l1UVGyZNOxvtxtk0+VFa2KU7UKAQEQoA5hqRuwpxn/ljD2Jc+TMiow
         YRYnRA0oCBQEQ38KHqiFjGjrRTln1hLXli5avJElHASrPyiHKmy7B0C+IsB0x4LX3bu4
         aguAH+o3ZgQO3iHHLcxL8KNxOf+VbOX70jlNsIog5WU6NXq44YjlJoHECIIUvB43Harl
         7DTw==
X-Forwarded-Encrypted: i=1; AJvYcCXQkwYuku6xpciLl3DGyrc1pQMhDJYk8NJDMcM9jQVIXk3iqDFFx2uZWpfi0fumXeL8ScOxRXgNfZ5lv6ps@vger.kernel.org
X-Gm-Message-State: AOJu0YwYi5TVEhXj8/vuJl6rs6rqUQUIbYixF6YHA+95Sqt+z8uQNPnp
	0GbHoJ+Iak5WKG7sa/QFtD07NQf6uHWFZo/FV0sd/VpL0e48ePyRrz6MPHcK+7+9Ld5f+gipMau
	THNNhgOTERwN3Uu7TXuwlMdr4UeXIqFAp5gMuGtR//F0SJrZTz2hmMSJG45hUnwTStpbr
X-Gm-Gg: ASbGncstACxSVuULwxKEhVRYRxPAfu/iljUp7LlGHaFGJYQkRYW9UyzGaRpnx9VqmwF
	heDw7oT7aAWolT0ZZbeBPywOKQkOTWAB9fdDdHxjn5NdK9bs9LuNNIWD3KrF2nMsFyC/6rTi379
	s2oqWCOzY5B6omg4Qrb7vfJJDe1mwKVMW7P5TTlgQpTerZ6ymiHLGqp456TE8X5cJMlqnBuHkVj
	4suTEoZtT2xehA/NXbpq720Dzpytm+t3kBvhPlfCU5zrywhWQFMiVf4Les0ZD3il3+khT9RUShI
	FufBxi0ydZRyOf8kJ7fY/HTOPwQ1LGxS253ykR3mnEAdiuYYiDTlsH5FSSOSSadyK+TPs14rGf/
	AP/At2IUfsvjsk67RV29wjqJdVdw+1jRuYZRejEQRCHm6k0aDzDTK
X-Received: by 2002:a05:622a:289:b0:4b3:f3b:6b14 with SMTP id d75a77b69052e-4b77d1d50b7mr29032781cf.79.1757671003840;
        Fri, 12 Sep 2025 02:56:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrg+eZkUE6kJIyOVqREfUPXquzVktUgoDHxmRV3RNRm2kAXVXWPWukFFYePEL33rxXTVJhig==
X-Received: by 2002:a05:622a:289:b0:4b3:f3b:6b14 with SMTP id d75a77b69052e-4b77d1d50b7mr29032261cf.79.1757671003214;
        Fri, 12 Sep 2025 02:56:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63e3csm1057056e87.83.2025.09.12.02.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 02:56:42 -0700 (PDT)
Date: Fri, 12 Sep 2025 12:56:40 +0300
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
Subject: Re: [PATCH v4 06/13] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
Message-ID: <ejwrkogssqdzxraacvxdbasxg2ud4t53rb6da2g4vdryyjuzoi@evdibveq7w46>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-6-2702bdda14ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-6-2702bdda14ed@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: zwzZF5nd_ueg9_65dLRqLElONqxCC9cH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfXz83csGWv6egC
 PVJvV1yzWcwj/pH95Lm7AsvfvkT6fJhX2s+N1zE9DXmERVoxQBT6qDUm6OtVF99M0d8Xiezxvo/
 AT3UUn0BArJYEM3q5Urp2wK8jfQtujanSjoOI51ojbBDQ5wkXQkZtSrNe82yGS+LxEh7sZpcOa7
 yOZiPBx1wNiCYyh6cutgoyIIFd0H4LKI8P5Pw9NxbwyNcd4uz0qnsmEDQZHKtjJqMuSNrSSQ0B+
 3/52I+MLlxMqovv3zA1s4oa3L0XNDRlb3tY7B4eNPWvnhlUhyaUYHveQh/67+OdueE2WMnrxRdy
 WPouCkp1VRS0NSK5vV9AUqzjDg/Fd7UDNOGjYU1N+NYLjmzEJtjxi//t38lNndjAsmq5qSPOyrR
 no7B9vSP
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c3ee5d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=kgVMhnFeOIEbK27hWpcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: zwzZF5nd_ueg9_65dLRqLElONqxCC9cH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177

On Thu, Sep 11, 2025 at 10:55:03PM +0800, Xiangxu Yin wrote:
> Move reset configuration to be managed via qmp_phy_cfg instead of
> hardcoded lists. This enables per-PHY customization and simplifies
> initialization logic for USB-only and USB/DP switchable PHYs.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 56 ++++++++++++++++++--------------
>  1 file changed, 31 insertions(+), 25 deletions(-)
> 
> @@ -1147,11 +1159,6 @@ static int qmp_usbc_parse_dt_legacy(struct qmp_usbc *qmp, struct device_node *np
>  
>  	qmp->num_clks = ret;
>  
> -	ret = qmp_usbc_reset_init(qmp, usb3phy_legacy_reset_l,
> -				 ARRAY_SIZE(usb3phy_legacy_reset_l));

You can not do this, it will break compatibility with the historical
DTS. Legacy code should continue using the old list of resets.

> -	if (ret)
> -		return ret;
> -
>  	return 0;
>  }
>  

-- 
With best wishes
Dmitry

