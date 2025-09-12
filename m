Return-Path: <linux-arm-msm+bounces-73197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 012BFB53FDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 03:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAD663B7B38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 01:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C9714A4CC;
	Fri, 12 Sep 2025 01:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kIcq5BvA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679BE13AA2F
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757640317; cv=none; b=ixHXyxF3AFcAgbuaGDBl+s1J7fT8K7RDhC+fAnkHkKqy+Lw7aL2n1p4/HeKaGUcMSq8QrIUfsv0GrZeMsCVfI5nrrxil2i4UmtZKr7ssTgZgQoA3ieWPZUdBWBjl8mRGW5t9asZi5+JnqCI+niv9e17UStYSu287Ar9KgbnRH8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757640317; c=relaxed/simple;
	bh=5GCvWmNKo4cUBA+FwiYng+NcOcB+AmFuejPHwIelBkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1WdRRvIGcAU0jX6OfrTnI/V7t+sh/rd0EHJWIHfn9Uiaevxjfu5btsSglm8MSHgijGMKPIbSGtnwbxgE8ajcZqMbgfTdVmH5StUB1qxeEJs4YwpzR9QJSpa4v12/eznSzrWM2x4mCf9mWiqs9T9/4C4SUyxFBRONJwcpSx3FwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kIcq5BvA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BNHnUd001977
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YsVWw194ZI1CWoyM8/QckT8m
	npp2FjAIPhrizuJH+a4=; b=kIcq5BvASDc27V0NaYPfTm2i8yEDFW+b0Y6Z2LX0
	gr9e+Mqnd/HS5R3jxQD/Ls7HOhSCQkUJ4tru+b8ktksPedSj3GLp2RQFi8fNKmcQ
	d7ilTtTwLSOUpW/ajBHQ/USOOdTXARBj+BxFUdp09XFgV4u5QAjGeqb4D9cVV05Q
	CHqSX1pZUDE3wn6OZpwAdjy90Lw7zAQLAiCdlDqTP3NCUYajvzKU0Um7aGqEifyh
	DMYPMHKSVRp1MinW8wT5YfdMa4BtgTsA7lMmyZMvXprg7JoBJ8l5o0bzTJ2nNVPL
	7DHJokCJ/LR+sTPTsovbuXEdE5MXjqFmR5ZrH1646bW+dQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493ydv1yek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:25:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b32d323297so30440841cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 18:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757640314; x=1758245114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsVWw194ZI1CWoyM8/QckT8mnpp2FjAIPhrizuJH+a4=;
        b=bG5cnGP+BxgsOhORVEBTmMRJk37LlobiG3pUSIVLsDBa9pN4ZkN29sANrQE8B0z8oE
         ckn2F6ruM+Y6Brx5jZUuIaox09lJa1o+g4iAm59hQIUKkwbq9mYW/DckoGULmj2yMeXx
         8ueupe7iW6jIavSGEx0jgO8QLz/6E9JIeu+hQXTVfjj0oaB05ODoWaHjxiUAU1V00VVZ
         vhXLtysCEvCjObrYM+D2Zuvh/a/E6PlJmbYAjfMBD9yHR96EobP930yyV9REHvdrAifQ
         B3FYlQpmE6syjDYVNIV4eFTkpHpphhhvT2tQ2+7NNJHwneCfBBfIe5FVv+59T+vy2OIy
         gbiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxBbDx/cDOpnTM/sFtVRkWKPSFMU3za0DS/RAZbxcbNS7teG0QCQV0hYzwXpHqkkmdVxprEwmJrE7FwC59@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2H1+hwWw9shukvbdrGIsOQFAYzXjY+H1l/cq7SGaw5NpRlv73
	+v3r4XJ93zkEZsoWou7ww0MlgKDhG6iIWUa84PFoCwiJ+s2TseEpllmFYgTSpYqinFhUQZmXuwc
	gJAGy//B1UQe75E8VrnEOY3fknx0RUOSzHlc2CZ/lquXPH7IxNe8nfC98CGZQC48AnmJw
X-Gm-Gg: ASbGnct68KKJNMf6XzULM1LkJ6DrpqEyZs7rzePXE4Pns4nlxLox22vXKoAaApmGabU
	AFRKkEIxoOCs3AU1zJrPlUGJ5u9q93CWg/6/l0VI8H2Xem8TglKc2LI8tqiMJD2ojcMCddtgVr5
	2SGDZo3CI7wa8IYhfNsm2/wnL4joiv+EuUX4N9adwTMOLBhfGhrXuH1lLk0RkYsQlIoEZtdfSQf
	/VAU/MJyrH8ohMg3cAPY4lltt44WYjk3PQa4zzAO6wSY40xMMHNvGS/9Fo1YO2w5GVdsvqPlc7l
	PSiOF54o1cr0iVkTiFob0JWto5/mZZg8Z4UFf1Vdt0skmPXjPp0dcy1Rmjkn3jJd0P3CoJtR6dz
	LikSYPUCoPIAfHGyW0t9adCzZGmN7YMFLQ9D0mI6KtIQjFN0Ig4PA
X-Received: by 2002:ac8:5a0d:0:b0:4b5:e7e4:ba6c with SMTP id d75a77b69052e-4b77d16e805mr17533711cf.67.1757640313614;
        Thu, 11 Sep 2025 18:25:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeSzyRo5fxlQ1s5PZqzWjlXyF7vQvka83jPrQMx8jrzjabtE8ps+uhPSg0QScYf/gUsEIfSA==
X-Received: by 2002:ac8:5a0d:0:b0:4b5:e7e4:ba6c with SMTP id d75a77b69052e-4b77d16e805mr17533221cf.67.1757640313085;
        Thu, 11 Sep 2025 18:25:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c692d10sm786907e87.8.2025.09.11.18.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 18:25:12 -0700 (PDT)
Date: Fri, 12 Sep 2025 04:25:10 +0300
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
Subject: Re: [PATCH v4 05/13] phy: qcom: qmp-usbc: Add regulator init_load
 support
Message-ID: <qpcdlcxvu4avnpc2yebrjaptxcckp3jtk3gdrsdssi5pg2yjap@76a2o2bw6gea>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-5-2702bdda14ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-5-2702bdda14ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDEyMCBTYWx0ZWRfX1GASRkwJTmP5
 YyX+xZ+HV1Msn2oOkmjrXMLWx+opHuwNYutQOT9FYu5ODaoCoQNqF6Xn0U568JSkCt4VksvblKt
 rX+PWsyJTKBpDeXw0siKRpM+xalUwoQjJ65ZWcV6azP1S1Esh5WekfMBBJm5enRVxz1CXvcG9I7
 GPh+Ukt5PqYcAhMndswM9KYRIhTKJkxn3Drg4XWfraCnDEIfMv1lA7wNGtJflbdDxUymhRm1JMg
 yKzdhUbBTgvyzcq5x6l46f1Ebc5v11qUZkZG4mpnjMuQr6nm3rVlLSDfFzGecXQciK9EsnM43gn
 ZkSGL59H4DAy9NR4mUxmPsWrRhQ55RPl9EF0lsU5vbMn83F7X9NZrhWve+Q7GzEdccsaF/L6bIB
 jd/Tthnf
X-Proofpoint-GUID: mEJEo8gN2OkDuz5cI4rsyIwpDOk9Hro6
X-Proofpoint-ORIG-GUID: mEJEo8gN2OkDuz5cI4rsyIwpDOk9Hro6
X-Authority-Analysis: v=2.4 cv=LoaSymdc c=1 sm=1 tr=0 ts=68c3767a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=mlQFcmInbWeDH1iYaCEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509110120

On Thu, Sep 11, 2025 at 10:55:02PM +0800, Xiangxu Yin wrote:
> QMP USBC PHY drivers previously did not set init_load_uA for regulators,
> which could result in incorrect vote levels. This patch introduces
> regulator definitions with proper init_load_uA values based on each
> chip's power grid design.
> 
> QCS615 USB3 PHY was previously reusing qcm2290_usb3phy_cfg, but its
> regulator requirements differ. A new qcs615_usb3phy_cfg is added to
> reflect the correct settings.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 70 +++++++++++++++++++-------------
>  1 file changed, 41 insertions(+), 29 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

