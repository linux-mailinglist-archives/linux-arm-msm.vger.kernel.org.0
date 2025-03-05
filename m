Return-Path: <linux-arm-msm+bounces-50420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF9AA50EFA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 23:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B514817036C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 22:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFFC205AAB;
	Wed,  5 Mar 2025 22:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I2IJ7WoZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151D61EEA5D;
	Wed,  5 Mar 2025 22:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741214802; cv=none; b=Y0T3ybK95KIaa7bsrcu1Sso9cC0ZunMZFBFMPyrIAa2or6CkFiYhgjbrDIu7ymFxIfQUq5Vzl0Q6zJj0TLj4GpqzoX2CUappt2axJyqM01lFbx7PyxUi8OrYmp9xZQnzetlSYMS5QTY8eANGUfSwI36Jj7pBb6wApx3R8xIwZVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741214802; c=relaxed/simple;
	bh=FR8Niwgnp4v4URbf7Z9s1uh9Y2DpjKMlC7TjJF9NlxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IjqCPh5uazWVAgkbB5SIue/ubgPeTW0x4DgmuDB2dpEnF3zML2/ZCjKEaCj4d6vgdTUmO8fSVPtMZgLMK13s/Df5FdvJpOzlmY2YNAMb41Y3qqDanAti7mhaBuePk/4EeMckxeXfSlY5dum4fzzHf04ODK2/hyqnwF00W36yeiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I2IJ7WoZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525LhohL028207;
	Wed, 5 Mar 2025 22:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/+PSw0qvB/W8fKpy4PMRcWsMSIMOhwf5q/v1ZQL/lrY=; b=I2IJ7WoZF7e9pg5V
	b3FtX6kFLTOcJ1xoa2qMSzBW4A9k74JxcBTTDf6m1xz8EGPciBe378oKDsjD0puQ
	q3g5bNfnK1dNvLXq0SWrMWwu0+VLyh2kITF2vD1VTBTI5FFgEwPz9kFIw138h0Hb
	nxAHsCHG2Sqlr21sdQFjFSALSS4RGXj7Q5JBoYXwtzgPGDrJktK52/4ldKJ5WmaO
	Z0MzSfLZuLebTY03iKWMqDGMsOptcZ/rQipT+OCxvEcqZrP8wH5MkV5WLfdQkMa4
	TrS3y0EjF/hsIP3U8GB19J6vTwFJnbg4mkAB3p1MGLOw/Sx6KsJEcZZz8/WNnn96
	uwsJlg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6vex9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 22:46:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525MkOfO014259
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 22:46:24 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Mar 2025
 14:46:23 -0800
Message-ID: <d0448a8f-8592-4414-9af7-c0ef528c2bb5@quicinc.com>
Date: Wed, 5 Mar 2025 14:46:23 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] MAINTAINERS: use kernel.org alias
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC: <freedreno@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250306-update-email-v1-0-9a231571e905@kernel.org>
 <20250306-update-email-v1-1-9a231571e905@kernel.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250306-update-email-v1-1-9a231571e905@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZQEz5YSe_4B5utvCiLHvMgIAZPEQS07t
X-Authority-Analysis: v=2.4 cv=bPnsIO+Z c=1 sm=1 tr=0 ts=67c8d441 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=VwQbUJbxAAAA:8 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=tVI0ZWmoAAAA:8 a=7segCkSFUhES_0U3-ikA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: ZQEz5YSe_4B5utvCiLHvMgIAZPEQS07t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_09,2025-03-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 mlxscore=0 clxscore=1011 bulkscore=0 mlxlogscore=880
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050175



On 3/5/2025 2:44 PM, Dmitry Baryshkov wrote:
> My Linaro email will stop working soon. Use @kernel.org email instead.
> 
> Signed-off-by: Dmitry Baryshkov <lumag@kernel.org>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 29e1a423eee5bcf9df7938aaffe5bd3e2f6a2bbe..b3a67e278a839fa14d1329a249ecf4bbec00c26c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7459,7 +7459,7 @@ F:	include/uapi/drm/msm_drm.h
>   DRM DRIVER for Qualcomm display hardware
>   M:	Rob Clark <robdclark@gmail.com>
>   M:	Abhinav Kumar <quic_abhinavk@quicinc.com>
> -M:	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +M:	Dmitry Baryshkov <lumag@kernel.org>
>   R:	Sean Paul <sean@poorly.run>
>   R:	Marijn Suijten <marijn.suijten@somainline.org>
>   L:	linux-arm-msm@vger.kernel.org
> 

Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


