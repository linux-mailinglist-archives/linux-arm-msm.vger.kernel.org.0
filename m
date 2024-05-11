Return-Path: <linux-arm-msm+bounces-19754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D328C34C0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 May 2024 01:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13B411F214B4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 23:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380DD43AB3;
	Sat, 11 May 2024 23:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eNwt+8lq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67454225DD;
	Sat, 11 May 2024 23:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715471571; cv=none; b=fW/jmzziy5Phpk7J8TO0Vh4yMY7ydGcApU8gC3+UTzdgd5Mn8YDg8OdElmPX8F6Ztoy93OgfN7paNzIu1vDEnejEEaVjO0jn28RqT4t9kjgg5D1wzhtlFt7JEqw7WVNUTYpXnRSiBdK+aA/ip9c+mpt+inp/YAOeY6/aJJOsr8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715471571; c=relaxed/simple;
	bh=IbNnSahqd/NNiXXa5cZwi7QOzrJkA2Gqc4Z7NVjdzJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=f8Ft16EeRWMBCuPqkCyihZrWOlhhy66yzi2cKQINePhcDpMg+9FgbNuFifFrczsyGhwaF/+qPfJjW6usRMqsQG2+AlTd6a/TyIF8V/C3lyT0M7yvMMZTGQgPXgVkT+3mcecy6eeba0Pt0rquQBAXzlR8n2u9lfqil9MCS6sxF+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eNwt+8lq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44BNX2fd025593;
	Sat, 11 May 2024 23:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=e6ENqyxIQZA/ZVDqighZgSXE2MZS1LUDrO/qoWPPNGA=; b=eN
	wt+8lqC4gIrnr9Xm2yo9GPHQOO+Zf4sv7INC+7cfM4O8aHeIOam03FdL04HoaD3e
	07wURugB04HLiSgkmbskN5tg7O3TOHnOsNQk3+m9SX3ycuvZwcdOesLSdMHvOpJE
	/cpjSGKZ1YZCgBtQm+kxtnTELYgFTyMjQNiG2+zGHDQZCu/kgLA0ebLw0Q5Ym40+
	bUJ2HLl8FZAfiWds+bxewYNI8lFIiIX2c9zWOXh2scMi1ihMz8Njl0a1nyvjG7DV
	7E+WbFMVbzNNfqW7KSG3z5IePezgZtuNa2q2ky4+FzZtDL5aJ3IpoouELD3svbul
	pnULTxt0YepXnLq0fQcw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y212593w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 May 2024 23:52:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44BNqWVJ005233
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 May 2024 23:52:32 GMT
Received: from [10.110.113.192] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 11 May
 2024 16:52:31 -0700
Message-ID: <68e05c6f-d0ed-efea-6eef-a9ee008c6c24@quicinc.com>
Date: Sat, 11 May 2024 16:52:29 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] docs: document python version used for compilation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Corbet
	<corbet@lwn.net>, Rob Clark <robdclark@gmail.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC: <workflows@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>
References: <20240512-python-version-v2-1-382870a1fa1d@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240512-python-version-v2-1-382870a1fa1d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: w0cgzoGxbAFqIURiF96Y0iqyA8G6T8BB
X-Proofpoint-ORIG-GUID: w0cgzoGxbAFqIURiF96Y0iqyA8G6T8BB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-11_06,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405110180



On 5/11/2024 3:32 PM, Dmitry Baryshkov wrote:
> The drm/msm driver had adopted using Python3 script to generate register
> header files instead of shipping pre-generated header files. Document
> the minimal Python version supported by the script. Per request by Jon
> Hunter, the script is required to be compatible with Python 3.5.
> 
> Python is documented as an optional dependency, as it is required only
> in a limited set of kernel configurations (following the example of
> other optional dependencies).
> 
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Depends: https://lore.kernel.org/dri-devel/20240507230440.3384949-1-quic_abhinavk@quicinc.com/
> ---
> Changes in v2:
> - Expanded documentation for the Python usage.
> - Link to v1: https://lore.kernel.org/r/20240509-python-version-v1-1-a7dda3a95b5f@linaro.org
> ---
>   Documentation/process/changes.rst | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

