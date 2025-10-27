Return-Path: <linux-arm-msm+bounces-78975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE776C0EF61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 16:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 841C019A5DB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7422530B500;
	Mon, 27 Oct 2025 15:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXl9Ky+8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BC13019B2
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761578929; cv=none; b=oEqdYHtqDGsAL3o+PDx4zsw+PwB2sJEcUvJQH/onGj8zE4JZMBi4gOn92OlJkoCU1ZKTz8GFwviBTJb2hC0SATNTSPmSljUnzplCOfCbzm03tF5vKrYI3OY7eHFoDC9Oy51W5LifghtAWfOVCqPHCKxB+WqBzsdkjxpEVsqoAR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761578929; c=relaxed/simple;
	bh=No0vFhtPKdnYI043Gk+ECuIMyLsdn51FVS0+isuiu3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nx/DkhDNlVOEvPcpfl8jhVHSPTBbzg9yvSTyXnEIVRqfVyzoUjITIv5CL9zbOd9WgcUgsB+x8TQtAnTk2Cy75xVWTLAPPRPSALduuhoXInMYuzSoUFYbiQjX7PSwe729K2wSpJeZcAlFPmz19SYy93tn+StgJL9vBuIorc/waDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fXl9Ky+8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RFNm2v2232090
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 15:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YrpC/Eij51oIcLt5fwITYt7x
	pzA6N/JSreOhEW3wMcU=; b=fXl9Ky+89oD+F37ykbRqhqQ3dkXcpSACYzcYskik
	WZpI/aMEkH22yOmFh3SshHaNj9KDqs3bYZMDF0FpbTiUvgplvZ5feNcCBjya0//2
	O5sidI6HDx6bqtPtAPvyJuTkzXVvXxQiTGul73MyoFNxawgFtKM4S9SAcuah67eo
	8D7yfw6QNSzjonTu2dLuVJSb5g9WKOpkfn50GypsFIy0E1tYhFsztJFosY4kXZM1
	LWsnrHSUdtvQXV4lY5iGbr28GMrUbUOWqUFENIXUyh40M/lLLfDzZ32VqR1DLWjm
	4fULpVLiCOuhYh0xxIcY8sNWyoR9zVkXmDi4C6B3f12xsg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a24wn9ds6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 15:28:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ecf0501ec2so36538861cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761578926; x=1762183726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrpC/Eij51oIcLt5fwITYt7xpzA6N/JSreOhEW3wMcU=;
        b=fRKltnN+sfeRYYckgST/ZsD7Cf6khdVVr5LgZIxOB5rWwxoiWkbMIT9s1Ci1W3Zem2
         zKvsj4Gfa4Ro8ffCVnpOcbZZfGELY84S2rrt9tjUlOk8H13JQ5LuH8GlZliRPu7AxmRc
         HWjODm1qkNFmCTQVw9/5UjOd6wqgm3TatP3+lyv8HJ3hS1WRZOpRAjhb+3afy48/FxEG
         fD0nYGNPiWCgu4CmQ6/luE/6uqHqt8ZCGzAo5Gf3e+/6SRqqC8QB5uXt6UOaYvvCni31
         RcmUPt15kmwjaX0XRBFWY6X0DyOIGQlKHjdhNDJHk45a9q0Vy5FajG3urtiwFn10YHLa
         +LlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzDHdVG3mV3Y/74m8EPEZKXB0f0i3YahvTRjoBgLhZfyVS8pxaEEf1geQm0L4cpyKxRgrxormvEFIKM6YP@vger.kernel.org
X-Gm-Message-State: AOJu0YzbwLyukv80Ub2JVnpBOS7hX6qxdQCBz4Gqab7vRCnYCMZtfw9R
	xqHrnDKUCQZB4MgvtWEoW+E/J86wibDprDYcxfftE/USF9zTUESQL4NwhPdOUGFK5Al3lSf7iim
	2d7NCav/y2dmM3xeKhYvPMg5mLnR/CbSyevWfDE2tqhi5b5iSKF3SP/Dz/74jfrWZEE2/
X-Gm-Gg: ASbGncsJC5BjQ9UxB6g7UlcsJUP4SPrdfvOt9VEX9dv+HinZYvlbvOOU6+Ds/fzw2Od
	B4aVeytUf7GGCArmB52jlAvEGKw2yNR+jJYIMc1EzV7FcGkc7CbGlaBzdV+3upcQ27tb6nE2y+F
	u+7pHATYZGdworarttNveVozAAcwVroynkg3LDOzR8xgwN/OBfftgDJmoHzkSAmcHLcXh2Mh+DO
	6n+hTnbjQVk0SEYBS+bzAKxhkXCWQ7V9eWkREuhRzFvmv41yEGpmkJo+fClgQeD75lpfBnIsdRS
	Zd8MLQ6VE6PRTGMxs7O/joSIPaXVMN00IUuSbgjy0OytAJNhAR3dH2vnzU/yCUtGGaH1UyJPaVv
	DbhTOlg4PSNYIE12Z8MfF2N9tRvaRPGJ4RY9V7P9YI0nVFopJnOV2X2KFc+3kBSQwxVpPYPSqHA
	v71aYGznutk/v6
X-Received: by 2002:a05:622a:210:b0:4d8:afdb:1264 with SMTP id d75a77b69052e-4ed075ae66amr5031751cf.51.1761578926162;
        Mon, 27 Oct 2025 08:28:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjv+f9Wm8zIpfZr0CI4TlRCnBPRjNZSJNUnKZu9weamrR66/3k2l4bfVFcQ9Uy6J4XGbePmw==
X-Received: by 2002:a05:622a:210:b0:4d8:afdb:1264 with SMTP id d75a77b69052e-4ed075ae66amr5030901cf.51.1761578925321;
        Mon, 27 Oct 2025 08:28:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f700fbsm2410946e87.81.2025.10.27.08.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:28:44 -0700 (PDT)
Date: Mon, 27 Oct 2025 17:28:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] soc: qcom: ubwc: Add configuration Glymur platform
Message-ID: <2ppfdoqa3fyjysfv4kiincmpbdstkgfwxso7tlfcfyfmwsndok@7krfjzdvsozv>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
 <7dxq62ltoeerb4g2fgchb2hd7eomvlexfgyvamxsuuirblavtn@4bg3dy2bukdq>
 <vngf7cnsj36ddg4pdm72airm2nketxk3m34qw6f65ompimpcfl@r3lbv73tmutj>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vngf7cnsj36ddg4pdm72airm2nketxk3m34qw6f65ompimpcfl@r3lbv73tmutj>
X-Authority-Analysis: v=2.4 cv=XIY9iAhE c=1 sm=1 tr=0 ts=68ff8fae cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=L6mQZqrAOGHZejgJyMIA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: X1Rc6KEKmPjoPlJX0ZNp4vox5VnLkRK8
X-Proofpoint-ORIG-GUID: X1Rc6KEKmPjoPlJX0ZNp4vox5VnLkRK8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE0NCBTYWx0ZWRfX8H4c59J01xCr
 O/7OYitLxk9rbSXy9nsXLn/PeosaZOchNik7E/uqjP34GPPlwlHfd0osB0tceCLW3dll/jKW4OG
 JVWSRkaTXc0scVCN5oEEE15FJ+rKHReizNm89TtJkoNVBFE3+Mkh5fG5fR5Fsb8e9/KO51k1Z6T
 Odv1a8hd/gEAO309aFLTiHPXs99v2C6pJgbDVm+/c3gL/jtcmraY442qAxLP5MqIs8oHupZGx+W
 PnE6IPemrDPa63BLIi18+sUTgLnJNgyzjohUacW6DbCbZBXduOTTztsfVDOdx+m+I8UrX+RDP/N
 Y36al8UweuYRYenKqxnKGW1tmybq83iGFTAYHZUVywSWiC81DSBvA4REaOzvdP8gME+zNN90Tve
 Rm0g4Rfw0GBRNKdh320RL0uFeDmOOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270144

On Mon, Oct 27, 2025 at 05:03:43PM +0200, Abel Vesa wrote:
> On 25-10-27 14:29:01, Dmitry Baryshkov wrote:
> > On Tue, Oct 14, 2025 at 03:38:32PM +0300, Abel Vesa wrote:
> > > Describe the Universal Bandwidth Compression (UBWC) configuration
> > > for the new Glymur platform.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > > 
> > 
> > Bjorn, do you indent to pick up this patch on your own or would you ack
> > merging it through the drm/msm tree?
> > 
> 
> Please note that v3 is out:
> https://lore.kernel.org/r/20251027-glymur-display-v3-0-aa13055818ac@linaro.org

Thanks. The question is still valid though.

-- 
With best wishes
Dmitry

