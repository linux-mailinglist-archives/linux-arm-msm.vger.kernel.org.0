Return-Path: <linux-arm-msm+bounces-8489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB7983E523
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 23:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74E1A1F23ACB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 22:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CC7481A1;
	Fri, 26 Jan 2024 22:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZU/Q92AX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE9A47A6D
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 22:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706307561; cv=none; b=TgI8i8maxYIZZ83tmedTExeBNA7W+o+jXD6Lo2YmC+GbB5yfXSBHNQRM6oRFPEQg066FCHuS3blDxRZIGmeP+S9XPhzVl3m79lfGngSMImEkkytmhUyamah6SflyhvKdKeLgaUthNiX1dg5OaTPGZ2eziJG7nB4afHqdEl7BQfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706307561; c=relaxed/simple;
	bh=V/MjnKoVBD+gkccyC8Tjd0VY5jyHzxYZ++rEnlhVfcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FWy3sCTUWpn3hzK/QZnA/xYE6ATrc5+ovlXIBbMYmoEuNz+dEkH+fmCl0DRdb+095+2yXEL2SLxE8DGy3VqaHGYX/jOCpq4jcBCgqoWOANwwEiMzSypL5I75EvVPvwLGnQdCET5UGimeWHL4E2kZ7hQn4+IC39D+LBM4fuXwfYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZU/Q92AX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40QKx41g030534;
	Fri, 26 Jan 2024 22:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=FjJsxJDFRfmzUSjn/YWB5iFYI+9zfxUcX0SvS1w0UvE=; b=ZU
	/Q92AXoE2q5npfoPa73xOsHQxg4FNaIQ5d1qfxuba6torhaYCXUhjLONw9AyahNO
	Tf0NFi8WE+0nLbDVC9PFyLbT/yTWWbnKViq+/Ovdx6mMC7C0tblX1r5ONlrop1y+
	98UOjq4QbkLd2D91jxF2h4P3k4xDx634XhRCN0KofaS+fDKuFrT/HzJq1WkUA+iP
	8Fb1bEzDgZKZHetbdyRn8J3ir7f+VApfGUUa6GCntMYLXyLYnvYi9bxeUSZngvrj
	0tl4ykZKTtZTt7+Vu4liPj44eO8A7fyBN6ebGxrmUNrBAAmzRnQyfgJjxzE/f8l7
	QdWwIUrr9rUl4OkEqCPw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv8e89pv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 22:19:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QMJ6M3031913
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 22:19:06 GMT
Received: from [10.110.48.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 14:19:05 -0800
Message-ID: <83005518-d306-b5da-fcd5-df3361bdadbb@quicinc.com>
Date: Fri, 26 Jan 2024 14:19:04 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v3 02/15] drm/msm/dp: drop unused fields from
 dp_power_private
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd
	<swboyd@chromium.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
 <20240126-dp-power-parser-cleanup-v3-2-098d5f581dd3@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-2-098d5f581dd3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: T5jEYzf7DB5qzaJudeGZFB1J5PzRClx8
X-Proofpoint-ORIG-GUID: T5jEYzf7DB5qzaJudeGZFB1J5PzRClx8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=883
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260163


On 1/26/2024 10:26 AM, Dmitry Baryshkov wrote:
> Drop unused and obsolete fields from struct dp_power_private.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_power.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
> index c4843dd69f47..b095a5b47c8b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.c
> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> @@ -16,9 +16,6 @@ struct dp_power_private {
>   	struct dp_parser *parser;
>   	struct device *dev;
>   	struct drm_device *drm_dev;
> -	struct clk *link_clk_src;
> -	struct clk *pixel_provider;
> -	struct clk *link_provider;
>   
>   	struct dp_power dp_power;
>   };
>

