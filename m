Return-Path: <linux-arm-msm+bounces-44068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4885FA03592
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 03:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E3D3160139
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 02:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2366814659A;
	Tue,  7 Jan 2025 02:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LvSDcAbB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0030F80BFF;
	Tue,  7 Jan 2025 02:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736218613; cv=none; b=WckB+HEb9Uq0WYLxRJrwrhNBX+nd07AkHpd5BosrhHa3aYaceWSI6Vzw9NgqRJJJ4JSQpRKY23BoBPn2tX8fP9fN3yzn6lYOnZFeVTX0Gmr6VmzQyTn2HIU5VTZaarD8RhVrpGzYVg0FJgcf//OrLDzoby+KjXjq7MCcu7NUXSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736218613; c=relaxed/simple;
	bh=fm/2Bn2rGru7kX1H4OywgqHuyV7EgNUaortjS767uXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Fq39lco7ia5v+mSv/+vg8xdQC6990c9V8I+8biG1U9UWyFqPeuuDe4bNm7XZBhwnNmFI99kz8KkT8KnfryDmbIIHkN28mP/l7DuqHfj91Cvnqde2bFNPj7gO+pG8MND0XyinPXp+yrR78dRCIg4svNsovlPxwPqnQxJioRTnK2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LvSDcAbB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506E4cGj018475;
	Tue, 7 Jan 2025 02:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hFWgfBWlELxkjApozBl7U6/1C0fwwBj1hF+A3JiioJY=; b=LvSDcAbB2F9rMZPM
	DhOeLbISada7plEQNZLay4PXunERxONj5xkerGbdILIYgeO8X2tRMjDsW6eZST6s
	5EAiVm06E/ENxuYyLyC5zkrIOU2yT95yYp1P/v0hxyDywTFlLyiWwOD1NUUjs7Rt
	ObAbcFuNwyuwiaKKbzAr2Kg90RLHy0h5kPFSaPbyLzYijC8JHCseub1GyfQQaokw
	X/xDlU2RzhGc9CxdI2QKCSDbrdTBhS6i0HhyZgvCJjKkqHi+JY5UftOTaJI1xkqc
	eyMV83bjnkybTNt9y7g/UOgcOoXXtXK93x2twHZDuYj7HUqEa7GAmWXbHUZMP2dM
	RSs/Zg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440gmc1hkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 02:56:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5072ufaP018546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 02:56:42 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 Jan 2025
 18:56:41 -0800
Message-ID: <5edcfc62-ee70-48c2-a24a-642a39f83767@quicinc.com>
Date: Mon, 6 Jan 2025 18:56:41 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/dsi: Simplify with dev_err_probe()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean
 Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
 <20250106-drm-msm-cleanups-v1-2-271ff1c00795@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250106-drm-msm-cleanups-v1-2-271ff1c00795@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1iahhc0U6ewKiIoqjZ5rf5UNCZ88NBsa
X-Proofpoint-ORIG-GUID: 1iahhc0U6ewKiIoqjZ5rf5UNCZ88NBsa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070022



On 1/6/2025 12:49 AM, Krzysztof Kozlowski wrote:
> dsi_clk_init() and msm_dsi_host_init() are called only from platform

dsi_get_config() as well? OR you didnt want to explicitly mention that 
since its called from msm_dsi_host_init().

> driver probe function, so using dev_err_probe is both appropriate and
> beneficial:
>   - Properly marks device deferred probe status,
>   - Avoids dmesg flood on probe deferrals,
>   - Already incorporates printing ERR value,
>   - Shows device name (in contrast to pr_err()),
>   - Makes code smaller and simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 100 +++++++++++++++----------------------
>   1 file changed, 41 insertions(+), 59 deletions(-)
> 

Change LGTM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

