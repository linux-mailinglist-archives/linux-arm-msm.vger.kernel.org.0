Return-Path: <linux-arm-msm+bounces-36333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB709B51A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 19:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 325D828253D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 18:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC3D01F429A;
	Tue, 29 Oct 2024 18:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B6OVgNrG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39581CC17A;
	Tue, 29 Oct 2024 18:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730225672; cv=none; b=Dtu6Wk7YjtE2TE1es5QurDFuju7SutR70NfPzg7BNGxM9mDh2fhVgPkju44MEvDbSO+r1BSYm/4HOIu5HTdrkRHVWkENAg0/IT74kA3iS9aHmKm7mB6egdJW9pIqu9ViDm00hfNevOguFlV5uQ6gYFqkvTtLbyg5i9ZZmuf3NMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730225672; c=relaxed/simple;
	bh=Rd3MsguNnsICkONXxm8idNgHaFthwNydLlPkzBeuH0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hVmLlB5JQrsjWFCDNbu/uka7u+QZKssX93IEzoMIpJLY/EFxBH18K9fYTMYNV0g5hzSn6Jktk+o9PwjfkPKYQxxzbNZGwelkh/mH045yZ2QG0EjboD7+QfaOt785pU3DkF9/DsjpzG7+xXRfq11sMmeQbvsFQ8oc+UqtZX/ofs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B6OVgNrG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T9YSIU000668;
	Tue, 29 Oct 2024 18:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TtAKUgNx8KC6SxCbiVhWSUNYzjfeXXUCQiAhyDYtJ9s=; b=B6OVgNrGbLQldUD0
	fjCvg27BihYcxKKR0gq/F+EjiBlhbhUXp0eS8HLgN8WXTX0x6rfJH29kiGw5IyjH
	cU6S7q42MmAE0+6m5VSDZCEYS6gFrCSzoChWqUnN9eLATFmzjy65kA4LaU2XqXUl
	lEUSoanpvQBh8mn7IpSvJvfs1V1UrAOZTRAvdn/1ssZa/yn3P5nJxUHNb1NeZJrz
	Z1aqKm+CCdriLgSpDT1N6GiE60RmcahwWxU3yK2sGe+uV1X/F5+bzkKLJcfqW70b
	cJNu2GvGOB34zXs7wd6EeEvsmTqVG2bWde2qoy8xEZ4Ua4WBdRgQFV7/DwDa4mZ3
	/Nvs7g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grt71932-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 18:14:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TIENt5012749
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 18:14:23 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 11:14:21 -0700
Message-ID: <b37a40b7-e675-4cbe-9330-58b082010848@quicinc.com>
Date: Tue, 29 Oct 2024 11:14:21 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/msm/dp: tidy up platform data names
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241028-msm-dp-rename-v1-0-a2564e9457b0@linaro.org>
 <20241028-msm-dp-rename-v1-3-a2564e9457b0@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241028-msm-dp-rename-v1-3-a2564e9457b0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 784-KYbpJq8zJj2VBKr9xN_rUKEp6jsC
X-Proofpoint-GUID: 784-KYbpJq8zJj2VBKr9xN_rUKEp6jsC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290136



On 10/28/2024 4:49 AM, Dmitry Baryshkov wrote:
> Follow the established symbol name pattern and rename platform data
> structures.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 38 ++++++++++++++++++-------------------
>   1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5cc349f672c0..aba925aab7ad 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -118,7 +118,7 @@ struct msm_dp_desc {
>   	bool wide_bus_supported;
>   };
>   

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

