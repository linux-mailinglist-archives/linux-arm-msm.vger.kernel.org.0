Return-Path: <linux-arm-msm+bounces-42415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CA19F3DB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 23:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 702981693FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 22:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97ACD1D88D0;
	Mon, 16 Dec 2024 22:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Km8BpZP8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9AF1D5AC6;
	Mon, 16 Dec 2024 22:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734388989; cv=none; b=HjF+ElpRudUi4wwpDA8S6qq94zVYke45osuJzt1izXwe4fVkW9cOwnv5XvGilpF4OFh4Bj4McWd7+GTjELxi21UOEOeabEGs2vUjpldXiM514Px8Nd+gmAoTNESHW5cmlAUTvbQFfJ7VeWIWW/Qf67wwyMHKWv88wnwvbS8CLvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734388989; c=relaxed/simple;
	bh=lGM80qH8pnV5C/dirqqgdp+OaWvFZgQ1uxawsXFyY1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jmfbegi31xy8GLI00gYjgZpiE9zCypamRuGWZrStha5NXFU/prBYiB9jVQQRiAQUYWlfQ9++VsNGmVaB2v2zA6wadyh7SGIgMoHR6vGWqGb00Y7MjXrIBeVOMsVlGvx0iXcxtLxzF2wCkSikLt8Lys3M78IcZmW+a9cVLK2Klec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Km8BpZP8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGH9U2P016945;
	Mon, 16 Dec 2024 22:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H2L8uVyKd4qvBkJbrYXcMZ2oODeoHo/p2so9JSQLiHU=; b=Km8BpZP87w8cOaeD
	lKNUocOIKw585GAP3iMvcP0klGWDTepIqVYgedxH475QJbvtarzIVuxCQ2ljimr8
	kPFlf6eXRKQNCH6ZrvpbEJ5TPIM5dD7CXgm14+fAt7TRO+na6tQqTWzAv6F9t6Nl
	Fo7fm2wU/WxJovo6wHxPdFmSvNbhwpZsy15mHLXT6cOdEvy0hx6cIu0xB4/oo5aG
	58zRYlzrcyWjQovBJhLCWu8o0vZ6jPK9yAf8yg2Y0yosnq+lya90tRjhTEzi9qnH
	174Jsj2tESdNYMjv2cjsEZweeFSqbdfmGyvx9Nna7x/9zXYLpgijP6PYPkn9VCzL
	kkP3Pg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jrc1rqcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 22:42:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGMgvIL001796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 22:42:57 GMT
Received: from [10.110.119.169] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 14:42:56 -0800
Message-ID: <dadf64ae-348c-49bf-b5cd-6b37a81ecf20@quicinc.com>
Date: Mon, 16 Dec 2024 14:42:55 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Richard Acayan
	<mailingradian@gmail.com>
CC: Rob Clark <robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
 <20241216-dpu-fix-catalog-v1-7-15bf0807dba1@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-dpu-fix-catalog-v1-7-15bf0807dba1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dK4aoDXc8E2edzBaK6_YWLW8j7Og53v0
X-Proofpoint-ORIG-GUID: dK4aoDXc8E2edzBaK6_YWLW8j7Og53v0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 mlxlogscore=881 mlxscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412160186



On 12/16/2024 12:27 AM, Dmitry Baryshkov wrote:
> Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.
> 
> Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 2 ++
>   1 file changed, 2 insertions(+)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

