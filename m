Return-Path: <linux-arm-msm+bounces-73195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A062BB53FD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 03:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C28CE1C26BC6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 01:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74431145FE0;
	Fri, 12 Sep 2025 01:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3TxWoP2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE71128819
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757640223; cv=none; b=QVBYqDUAKIUeqVJxQtgqj93fXeVLmBCK/C7G0JA/MCj72B/b2SK5L5xbrNU5byM9j8i+g1qvcY7lfPG2ug2TZVuhI54/SDFPYps8LS3xAsNEqOJTsTtrfjInjHr+D2oUUWXMaUpF7J1qi9JMh5w0y1KFOzy7KlI341fxzAnZm3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757640223; c=relaxed/simple;
	bh=1QhHmcne+afHWrmPYChFnyoHWYfd27UDyP7cgfsSLMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fs6SP2j8H2jjaczZrT+TR3mYwURfnTzeoa+fiY/jzdjlYE8fQbfmFJPMDAiKcVYmdWp2A5EKvh2Jf1NB4HHsk+FaY5wZNOWyJ80KqYbpqvx4ZKGEWA5IxEfPe4bP/UsQOnk27yqg9/Kw5Xi1nKzx+I0nMk1nwNjEx++cytFNl9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3TxWoP2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BJ82YD006675
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=phbp1n99fIqtgMb8Vmy4j4H4
	6BAYfSIrlAEx8Qjq1Sk=; b=d3TxWoP2/LYVaA4Gx0sEwXAL/6dei5QGC1WRhyK7
	E//AnrvxWvAc+hQu5facbEQscD/S7ydLzj/Rk9Uh+fYDyI9jFBus/XEanDKY+Z/b
	E1LJhhr+497Y7asGnsVon0KnMM38vzia5xzqr9FfKbqbSfhB4WLIAZ2phAzrYpc7
	TPVGxbmdsGqWRCw9DftynMpaCrhenT0wUVWNsRT+J8y9gWyH79rigQSv8Lsh+FeB
	T5eCNjBspj43EO2dXA0AalhdF+J3l0GO+Lem+SkDp8yAjnTgU3AySS5k96gdtV5x
	NldL1vfUDh1ND6jl8QcfTkbZBKA3fBrc6xb7n9WzGdfFqA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8ahrdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:23:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5eb7b2c05so32726691cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 18:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757640220; x=1758245020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phbp1n99fIqtgMb8Vmy4j4H46BAYfSIrlAEx8Qjq1Sk=;
        b=w290maaFK47iZfA/vFGWNyDmV606HguG9O026964mvgpIUNc6OVz+4nhExZv2JFzdF
         22oH4QTu9JqlEGT629pQzkcYb1576p2cgoFD5CZXV+Nso3bPFFy7okeLeH0NyS35xtLg
         mouROr6Rq/eip/ODxRLQkhSIF69s5wm2inLiRAaNvN/HgmZIKdRjEUQQwg1slA743S3G
         /MVU0RpeboRuxQcCCcnlMsgZckR4GjntpIHaguCV+VKatuKilpoySp4qNZhi110v9/zD
         Hqp4bl94VIH4owrNu3c/gpwuxnTaGnVoRpkVxTHJHa8ocrOD3HtNdvMP0ibUXoa8i3nR
         Ob6w==
X-Forwarded-Encrypted: i=1; AJvYcCXppZa8ww62JpempN3hcDVex59y3wmtMdoYM5l4bSJEJ8eLcO7E+Yhixm+0bAlr2QPs3iyfdrs7ja1Oht4G@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq8NGAW+HrXu22TPP0tKVlhg9Rap9vhSWdQpAGq+n2c/DJKLki
	iQO89eAIq4+lFt+dRx8BR3WWtXLJrw7PDJhuykJhBcyPw99YNrHxWiNBm9s5EBzeaX6mJJ2TBZT
	VYj7ckABUjD4gr0kQMmDRbJGLz755Hjif3Qy4ElZqQDNc93gUozvzfI0+59SaR/gewaWS
X-Gm-Gg: ASbGnctyRFVpBiCz17y8b58SXuCTD0fZ+dGPdL6leqTTFmGfGxHFHledxiP3h71uubo
	SxgA0gddc2Q1N7IkzUgn3d2Yw6SgvdYHZ3D/aMk3MUCu1u1kKBUpPpEeC+Z9H4OD3RbPYuZxHMb
	T4sWF1+8fg/i3e3j1uAoDDIvOEpd/+3n6vxf7eMGkb35adP9RdYMT0geDSeRplgXDOxI2pRjVvI
	IJ8q0Cb7rmJBv4md0O2ny9ScaqAmwJvfyOR/vHO6qARA8BNCJjJ/loKQP7gEfVnjQmwfjgpOroa
	MeGlYCAVfmm4V/9cW/QRxb0VqwkCOtF+zFGGQyOVBvQ1fuj6C/GV2WqzeTy086BqnI3ZL2nUUz4
	gUASM9NuN1NOqPaf0VKeZhQWuYO+WUSIcxyj41PR50wX0f8yPbEhW
X-Received: by 2002:a05:622a:1249:b0:4b5:e72d:dbc5 with SMTP id d75a77b69052e-4b77d129e28mr16280171cf.48.1757640219981;
        Thu, 11 Sep 2025 18:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAynI4bz/KxCp5t8jQU11GPgKeKhLD17wiB7Oe2sOXdsf6j6PRyZcg3pJ4ziMN/rj7L8iEeA==
X-Received: by 2002:a05:622a:1249:b0:4b5:e72d:dbc5 with SMTP id d75a77b69052e-4b77d129e28mr16279831cf.48.1757640219550;
        Thu, 11 Sep 2025 18:23:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1a820665sm5335571fa.33.2025.09.11.18.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 18:23:37 -0700 (PDT)
Date: Fri, 12 Sep 2025 04:23:34 +0300
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
Subject: Re: [PATCH v4 03/13] phy: qcom: qmp-usbc: Add DP-related fields for
 USB/DP switchable PHY
Message-ID: <msoxnqzbmyxztzr4e4a44gf34i4alvnkzbq2hxwcymc2k6qdd4@5cij6oq4k6qh>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-3-2702bdda14ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-3-2702bdda14ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c3761d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=vMfMRHGFLa_JFT07zEoA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Coq4aJIkXNZFWDEmZetNqcIznttdtn1H
X-Proofpoint-ORIG-GUID: Coq4aJIkXNZFWDEmZetNqcIznttdtn1H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfXzP5BSTUrLxsC
 tZxOgTUOjBcPrpJIIfwVd5WEpC53SJWefHd9tL4ucpV36uypRE04XpVYuGyApILe6VNXF4b5Phh
 CSzioXX9T7eVyVUwVwN1tNWsxdEU19XZRSsZ52OSpVDgzlT2/mo6HPnQQgR7JEp/imouzJo2eR3
 zUr+Rhkbt8YHkcHre/ZzaMuVrpq1emaD/Kj2XxXDVzT/h+VmjO2isgNFEawClKlYsVzAK5/gNcn
 5GMy37U8A3yqoi7aiAOW6wf5HjG2/+cB5LVCqFK2k7PBKD/XpR4WeuyxRAAzPyuv3lUwoKqkIAh
 FGNBdtid/tW2cEkTcKB5w4m2CapzUPqAfdvoWO7KTXCw8GCY26BkL/PYOk9BPLf8e5/Dfdu8eZg
 tPFXpWcA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

On Thu, Sep 11, 2025 at 10:55:00PM +0800, Xiangxu Yin wrote:
> Extend qmp_usbc_offsets and qmp_phy_cfg with DP-specific fields,
> including register offsets, init tables, and callback hooks. Also
> update qmp_usbc struct to track DP-related resources and state.
> This enables support for USB/DP switchable Type-C PHYs that operate
> in either mode.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 54 +++++++++++++++++++++++++++-----
>  1 file changed, 46 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

