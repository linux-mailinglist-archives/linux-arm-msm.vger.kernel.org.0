Return-Path: <linux-arm-msm+bounces-74242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D27B8AF55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 20:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72C46A00D87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 18:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477EF2638B2;
	Fri, 19 Sep 2025 18:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blqNXqNa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0FB25A2AE
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758307317; cv=none; b=LAfaImIjaOzj3oIkmMvcAyeKDhtSivAELLrY2NdO3qr9gmE0fpGD06WNO3UMF3DeKPzQcGAlR3AZ2YVc3CNe+T2DjAPAdlDionrbpkNdUH25Iz+rt9wInM5PCXErPYTpi80Omw5eGvFrYNxPcvCKLsiOuJrmmI1I6CVw3AT/CoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758307317; c=relaxed/simple;
	bh=TUDF5w3G5i2z98+PxLv36xZF6LqeyndtPpfQFG6mm3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUHsb8InecY+Qcyg5nmjEspmF7Q5E182nipt9zWf9kVv0cOr+e4DWg/JuGw/frkEnCj8tKeHpdF85CfnhJ97CET1fNY13zwnHMjThYVCM0OYamgk7TJJ3m6iLU3Bbr0E1gm3lp+S6KKGlMpskuihma4sgVYGNoWEnLk1XBOwUS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blqNXqNa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JIT5DU007486
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i7CxFXs3E+TxXdjR6pU++0nh
	zSKDiXUs6/X+r4T9DOg=; b=blqNXqNap4RdDUrGJHaDIHahSPTcmOFjAAK+36Di
	IhcA+6lelkrQOZIVWpJSuXMeRHzdHh/A85okxRiUZtD/Puq0p0o1Yl9sFuPKUK3S
	GNpN8JmcC0KqZyKFIkCGuQkKMeGpqo+0jIGMOh4UqHFF8icYmbfvlttCkDjGuLFJ
	5o+m737uE+ltICx5CWLeNg1rcAzxN12kRS1XVv7MD0EYOE/4Su0r6i3TCEQf6XIW
	yPJ2GD8bmI49TxO1khkl/iLaIwqip/E3oZfAVS0rqEuAjU6wOFRLCI4EKfiE4irS
	AG8X9GKy5YRMaiXaJVO0WNnRG4/C0yhxFIBUmET0gFBhIg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498ebex06b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:41:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-726a649957dso42954276d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 11:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758307313; x=1758912113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7CxFXs3E+TxXdjR6pU++0nhzSKDiXUs6/X+r4T9DOg=;
        b=Xqvq7MQYI/U29UNQxIFbFAcBjqscoXXkQeeiqzNZbNXFoj5+/0SCHnPRUQsKkA3HzE
         rKvef7kFdt5EEk8wDRwaCOMo4kbRLWT1EWdI8eELlpUtGmBuS1GMobSXexe4S6yJIWdH
         xQ3WEkAxTgkilYyAIu9MXk9uy3YZu5lQleTQ2KCbhy8pBfkcmzLnISvA4Ln6cpSc6935
         XWthfkWSPMyIbilIowOyUZQT9ee/wV5b3n5hVx9B4LD4IdtjAQVCIYeANFUrQIRmELC5
         t3KGvbv20BsHUReCamm7zgWTmX09CgUwnnk4Wv4bD2w59tpE9kDTUoJxhCvPC3HlhOGJ
         argQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvCBf2zhNJKlfxTMWkbuUYvaoRZmExZ3x34Lg2YeOqlX7bpCg2O9l68+E3fdSahzEodLzNtWpOA2gB0ZrZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwGQ6KhiuuKexGp5hQfiDJYoS66HPpZQDHSPn9hAgsy3jnCUKeK
	OXUcT7huSo8fkpKG/khPcB7pHk0Bi+bJj7M7L9zYLwc0wocM7C3qw1bTtzjeOqY0Mw8KJILE7CZ
	zWX415mo97QVNfx9ee6xQe4Vxjs+0mjjAL54Kk3dJEqR6nPt/+R3khhGIjdCTt3My8yDR
X-Gm-Gg: ASbGncuvqMAvrtEzQOv3rWNlR90p/pGIqZ9XvzvtavCYhZye6w07wKGEi3PS3PH6vH2
	Vpplh6JP9TiHL+q+TwpHapN5ZzDQ8bb46X4+ZbbSo3pCSpgBtylyn+odATpadAaI1W1FbC0UPJu
	jSACxrJQfqD3LPrGoJ4l5LGnYumTLtWE5yX1bePnGseIEbnNwhJ8JtwRu9bYZYuEDqVJWIEi907
	+lY5HDFkq3znKsPLjU/PA09Uz0ExnxaZfHw0xy73cIthHx7edQgOdfJsyQyF3meedj5IPvv0TjO
	bkt1hRCfQtsDams17U82BJ81T0xC1gKSFUTvBKyQuyKb8cQi8H5CluElvSYRksvXWmAsIj9hg9u
	NtPECBQQY+Kb3ZeAPHHeakDkM4kDqvSRVF2oC6DBxihI/nZMufxi0
X-Received: by 2002:a05:622a:491:b0:4b6:2336:7005 with SMTP id d75a77b69052e-4c06d6828d5mr48024601cf.19.1758307312803;
        Fri, 19 Sep 2025 11:41:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+jXszKO5APDEximPKgrAQZzyc5+8giT/WjH1lhXJNUczhHvAVEcXJ87AWsBXaMadhHq3byQ==
X-Received: by 2002:a05:622a:491:b0:4b6:2336:7005 with SMTP id d75a77b69052e-4c06d6828d5mr48024191cf.19.1758307312164;
        Fri, 19 Sep 2025 11:41:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a99e9024sm13738501fa.49.2025.09.19.11.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 11:41:51 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:41:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
        li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
 config and DP mode support
Message-ID: <bfpgktxgo2hb6dpzy3i7jdr6w4de5boorx4n6qeapct2vre4sn@4z2mnppridn5>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-12-eae6681f4002@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-12-eae6681f4002@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Upj4O0vTDQG6TRbuXAqyezvTZVI9x5Wq
X-Authority-Analysis: v=2.4 cv=H6/bw/Yi c=1 sm=1 tr=0 ts=68cda3f2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XgMPAK_adSAUw0pB5X0A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Upj4O0vTDQG6TRbuXAqyezvTZVI9x5Wq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA3NCBTYWx0ZWRfX1uqpOIJQ4xT7
 WclEir++3GSVy9qlR9XaRN342uyh/WAxuQoFTtGSVWvBN0swxWu3Ey7tTmHWQbWU4naiqpMnmNe
 SjvcvRNh/ricKLaTZzw/uO7gkGqmR0lELnKcruicoX8oqC+r3A4WyLYajSA3riLxaWWZ26063fC
 ktX7rBLVik69wLjcG03RUr2sV1co1nyDS963QPsr4ZIbJmnR5ZIMbaXEpCoAPujJoLMkxQ8PIw6
 zX/Og4t4BQfs/lhYOKMt1u1JGyIDmht/HIILKHfsFxuUBPg1V1HfQnNv1Xy2aMU2A7zyEDxFAuw
 dXEpuZN0tqEl2rKXVP+JNFaOj8AIV151xjx7NOMgLrq1S4EahLoGfZMOSoh+ybbYSmw/7qdg5Kf
 EvNMPEYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180074

On Fri, Sep 19, 2025 at 10:24:29PM +0800, Xiangxu Yin wrote:
> Add QCS615-specific configuration for USB/DP PHY, including DP init
> routines, voltage swing tables, and platform data. Add compatible
> "qcs615-qmp-usb3-dp-phy".
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 395 +++++++++++++++++++++++++++++++
>  1 file changed, 395 insertions(+)
> 
> +
> +	writel(0x3f, qmp->dp_tx + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
> +	writel(0x10, qmp->dp_tx + QSERDES_V2_TX_HIGHZ_DRVR_EN);
> +	writel(0x0a, qmp->dp_tx + QSERDES_V2_TX_TX_POL_INV);
> +	writel(0x3f, qmp->dp_tx2 + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
> +	writel(0x10, qmp->dp_tx2 + QSERDES_V2_TX_HIGHZ_DRVR_EN);
> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V2_TX_TX_POL_INV);

Are you sure that these don't need to be adjusted based on
qmp->orientation or selected lanes count?

In fact... I don't see orientation handling for DP at all. Don't we need
it?

> +
> +	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +
> +	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
> +			       status,
> +			       ((status & BIT(1)) > 0),
> +			       500,
> +			       10000)){
> +		dev_err(qmp->dev, "PHY_READY not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry

