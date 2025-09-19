Return-Path: <linux-arm-msm+bounces-74244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8614DB8AF74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 20:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3066A1B2856D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 18:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F7C25A2C7;
	Fri, 19 Sep 2025 18:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/PK5xiK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE21C1E3DE5
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758307385; cv=none; b=FkviinsSAj30ETHqMBpV2VLiUjYN9Mkqq+Ob6xFV+eGQJrFn0ZdXFdNA7GPUoG/NXqxmu0uA++j85oN4Zkrib1zID72jbDJ4PS+MY7uq8AuWNpiCSAVBbiIKbjT99vYf2MBTXz5eXhwc76oqsONh1WrukdALTQuUzUNo7Rd4CCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758307385; c=relaxed/simple;
	bh=vrkEpEkg6sDXkk+i+SIpLer0i3cfnFivhO+rvdi1vww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gR+MhyyY+VSlUqu9Ubr1cjFIEytc793Kud7FcTxCVlrbjIOqsipeKtQa6rsdQMk3JGqmiJUcg85vDwHEsvI5S+T3qztv0NhcmOzdWXEmHtIN20/XPJqVhGNYJLkRDKTIA+feUIlbP6ZJmNNnzGmPwWppy04y0+lmjykCGvaRSFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/PK5xiK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JGdnQm027113
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iDUVT1j3d1+CSBXfFOTmyvH1
	fdhZ2PGbb9X8k35Q3Ls=; b=K/PK5xiKgRdHln+rXzsf7M3F+hfCe70jVbWY+97H
	vb8vd4bOKlTFixKmvI69F2HTXw9VGxrQBm46A6YdcUnOoU/SxCmibMOx3jPVlOdW
	EN443q8AcfUV/InJZoSJ279xcEKACXMiBb9dq946wlZRV3RynEUHF3+IQJgtNm5A
	xLR9ytZdCiRF2T8hgyeB9H1YY1+F1PO4SQYthEXMuZX0w58qwerZlXGec1hl44nC
	FkkhWac4GEz4e31yLaU+3N1wBViYWHKzovqtTJBvA/fVLo6XGJPLwLAi3qD+MNwq
	5+1T6yT6KtUTFgjiJg0XWSgIuHSLxemc+SaAdWnrcJdS7w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497v1jhgm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:43:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-78ea15d3583so40509176d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 11:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758307382; x=1758912182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDUVT1j3d1+CSBXfFOTmyvH1fdhZ2PGbb9X8k35Q3Ls=;
        b=GDIfHC1bDOQtZkk5knWwbgSlN9aK1ItqkhDkhFHcXUdoTPMmOch9FKb7MiTFKqTR5B
         uXYmONcDKDMTG+pBA2IBLakdM/gRvJC0bpL0PpHFP+Xd/JXqfAvDLQD9VDLYIyswouXS
         M52e1hcMGFyX+A8EWGzfbJKLAwvMeRJo0+PMvoWFclMl8J5WdjbH84DILxIlvDE47JX8
         grr68b1b/Uy5N0mDfj8/4dcrnUmslKuuN/FOwhosXRb0DrudxvrYw912W5sa6ia7U2Li
         PJqFg4v1n/G7KigflTPOr8FVhdsepU/DHGuNPR5p2n9NtmsZ4R2Q4lJ2G+IyrNwrEbKZ
         rarw==
X-Forwarded-Encrypted: i=1; AJvYcCV1A9eRwFlCWAL9Rnd7yfbiJjGLN0joWfmC/LjPr2dEz5TvAX54dF0cOEFt3gRqKWifqW4ePhXky+7i0JuJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0XRgvhZb1q9cgyAcWCvUOtx7qnwT98/6OiydJU0EDaRaVX4JZ
	LWgPIqobOrS/FRckJ1QKMNmunNvR2p8Gq4il9wSQevytlsLQb/lIGkSg6LaWYr3v2pfNE8hWgEB
	UdvN/PRAsUeG4T6t39Ez6J1PD21UOaqt0cVxV4duJq9QXa5bVP7MhKp+eEsjDgYdxbfkf
X-Gm-Gg: ASbGncsffZ/wwaOk4VJYD02ZUp54Sagr7jNBW84JN64NtSUc5QYIzUrt+y6ReueH8LA
	vUzSCCP5Wc5zMmkMZcTnsU2OT9nKiFgJVgLSGUl3wJY5LGqvdbWWj0Y7YgEcPEYbPA0n8fLjq4L
	/JiAWZD/83qk68cABLX/VkSLz0jSiE/1hUr37ClgWwKm4vA2b8adwL1HE9Ac83ikxZVKktEAa0e
	Pf3fHAMtIrtVOv/ohlXiOBfjWcdks0ni17Ue8BJbjBHJd7EpRvhvLw1yAl+O9T++Ng/PEa7srjW
	lPSiyBjC7osE7vwxfRbKOI3khCmAF89VPgDGQ5xfsjGxaq8axCdMu/+kLbh5RF8XsX7Xy1nEk6y
	zG9O9hKQXPsuU9dbrNGpfwGc2TNFJgBw+Z2QZi4FSzkOGuQ6xw6E2
X-Received: by 2002:a05:6214:620d:b0:79e:88e2:1e60 with SMTP id 6a1803df08f44-79e88f16526mr13039976d6.29.1758307381870;
        Fri, 19 Sep 2025 11:43:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBKob9aSVicKYLHzXQPUikT9E64t9XkAJpeGDW6LHYdfXs9n7cQ4eZ9GnUtn4na0s2vbgtzw==
X-Received: by 2002:a05:6214:620d:b0:79e:88e2:1e60 with SMTP id 6a1803df08f44-79e88f16526mr13039536d6.29.1758307381248;
        Fri, 19 Sep 2025 11:43:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f447f3sm1549103e87.13.2025.09.19.11.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 11:43:00 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:42:58 +0300
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
Subject: Re: [PATCH v5 09/14] phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP
 switchable Type-C PHYs
Message-ID: <zhqm6bqnlx3cu2rlv2wdhbhnuwc35jtia72tjotchyq3utla7x@45ws52wsii3w>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-9-eae6681f4002@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-9-eae6681f4002@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: zWP0MsvYZBqAgkb2DbXIXAPVjU4Qo3In
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDExMCBTYWx0ZWRfX1lD/ujEl1XmK
 cne0wWPQ/8jolECvvip8dSnEJuqd07wF8xpTj9SzhHaN5RLiUqFKCz9Slod/PVYUOclDtKhIWQX
 ezXQwk1fTf7KLxAVFmUFh+o9zd7YxR4dg4hPbOFJ4F+gIAgyV6QT/uH6PRKqL7uOVyhKRZ//KwZ
 Rj8zwoA1pTE6ajNiimWKapj8zEnuwTe7A/42PDMpAlDplmfhzceziiPuScyPN6F0s7iL3TS7bTi
 otqADR6uL6NG0xrrub4uB6HRTDOnIFNEXOpc5JZhUS8bPKyjkP0LSor7k/VSp9iSOssaNYPbtxr
 YCGC/yW1kWqj7W9JgTfMT/7QPCnWWWlXkRpeIzkyjTxz02mshMN4a9wppBGc/31eyEL0krxcvTm
 YkCAB0GX
X-Authority-Analysis: v=2.4 cv=AeqxH2XG c=1 sm=1 tr=0 ts=68cda436 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gZRqL4tbKlavufozYNMA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: zWP0MsvYZBqAgkb2DbXIXAPVjU4Qo3In
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170110

On Fri, Sep 19, 2025 at 10:24:26PM +0800, Xiangxu Yin wrote:
> Define qmp_usbc_dp_phy_ops struct to support DP mode on USB/DP
> switchable PHYs.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 194 ++++++++++++++++++++++++++++++-
>  1 file changed, 193 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

