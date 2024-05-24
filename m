Return-Path: <linux-arm-msm+bounces-20423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 058298CEA84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 21:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B60031C20DE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 19:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7551239ADB;
	Fri, 24 May 2024 19:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OgtbNx4w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24D91BF3F;
	Fri, 24 May 2024 19:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716580699; cv=none; b=TUoi48JQ0eTr2GiLGceitjz80grnqwhT7PKxtQTMtIBj1vEXPPjb4g6WZNykneCy2sgjCW6mo4CUCJTzfaYMXGh9DJCFR20yB/EwRxfKXR8UrnYrVbbcvldxgxgSXZh63ysl+zMRNmUU8QnSMqsmjubUc7D0tk++PO+yePGI7go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716580699; c=relaxed/simple;
	bh=Jk9ZlbRa2n9Hxrtp7TncFL1AyoEWt7kqBLq/mbfv6xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aXNk9GKylzAQ3xQM3t3lNtMr3JSXYYvPt87+nFB/WCWR245rx5Nx7zM9eS+DR6y+w+QkU6FvKzuksajohZb06PiBDnwfaNL5cUx74Vi/a2ITH0dE5Rxac7YtcLNgr10h8jWMLepOAXGaq+0ss5QEin30ka++DkPg31qEfMUU1gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OgtbNx4w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44O9MXm3007845;
	Fri, 24 May 2024 19:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNmNo40jm/C6VMqJL+hrO3kVvXt80i+jzJLadaS2o6c=; b=OgtbNx4wTRA9PnH4
	yYmNrae75oy3PTrHE6bR8VJQmsv5twHya1cRlMfxawBNAAedAcdrVIr1sYGlIMul
	FFwCepX2eSw0zlwvNVIAESAuoyOw5Z33Isa1t8XEufuDJoI0bjK86fJBNxF4SU3i
	YNoFcaPBI/dDmTwMkx6tkbT0CY5HG1wdFpXlQoISvPGxDewatSsq34zuItT9SLsJ
	dqZw1m+f2Sj202hODIXiCkWoyQx1Edqc8dNZrT6tvQFLgWTeoht+iHmQNshdKEo+
	wdfugoNHcFo2OKVmfKX0pMM8ZOZYqqtXDTySvQNeLINssvsoN2IWXDSEZ8MgQ4wN
	HCF32g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa9tucpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 19:58:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44OJvx0V010135
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 19:58:00 GMT
Received: from [10.110.54.113] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 24 May
 2024 12:57:59 -0700
Message-ID: <28db820c-860d-be1c-bb94-ed534622fdc8@quicinc.com>
Date: Fri, 24 May 2024 12:57:58 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [BUG] Build failure and alleged fix for next-20240523
Content-Language: en-US
To: <paulmck@kernel.org>, <sfr@canb.auug.org.au>
CC: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>,
        Jon Hunter <jonathanh@nvidia.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <287206c0-b53d-4aa1-b35c-0725adc5e9ef@paulmck-laptop>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <287206c0-b53d-4aa1-b35c-0725adc5e9ef@paulmck-laptop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xdAxzc4BhkCcm6kq_MEp1XDFygdVdygT
X-Proofpoint-ORIG-GUID: xdAxzc4BhkCcm6kq_MEp1XDFygdVdygT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_06,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 mlxlogscore=867 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240142

Hello

On 5/24/2024 12:55 PM, Paul E. McKenney wrote:
> Hello!
> 
> I get the following allmodconfig build error on x86 in next-20240523:
> 
> Traceback (most recent call last):
>    File "drivers/gpu/drm/msm/registers/gen_header.py", line 970, in <module>
>      main()
>    File "drivers/gpu/drm/msm/registers/gen_header.py", line 951, in main
>      parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
> AttributeError: module 'argparse' has no attribute 'BooleanOptionalAction'
> 
> The following patch allows the build to complete successfully:
> 
> https://patchwork.kernel.org/project/dri-devel/patch/20240508091751.336654-1-jonathanh@nvidia.com/#25842751
> 
> As to whether this is a proper fix, I must defer to the DRM folks on CC.
> 
> 							Thanx, Paul
> 

Thanks for the report.

I have raised a merge request for 
https://patchwork.freedesktop.org/patch/593057/ to make it available for 
the next fixes release for msm.

Abhinav

