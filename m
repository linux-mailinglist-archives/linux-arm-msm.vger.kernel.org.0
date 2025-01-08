Return-Path: <linux-arm-msm+bounces-44471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8FFA068AD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 23:44:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34E1F3A6629
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 22:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75112204F61;
	Wed,  8 Jan 2025 22:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cTQFf1Fr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94E42054EB;
	Wed,  8 Jan 2025 22:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736376227; cv=none; b=UrXox5ukGJvPuJaS+dY4Av7MJtLcFCJKUAalIsREIqjG4MhvkD6d/OwgA0lN1dd0lIlDVnPScwDkCJPSfSRaqdTXjOB8RrUzpvzdIID+X1SXkhBoVzE6D9WRDyflDzbO1mP+6w9bQOkla02+Z4nfBNcVkK9P03T25n79EeJr3T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736376227; c=relaxed/simple;
	bh=g2KSV/xEqvcgTlTDamFIQI+l+e2BE17dNKL5mfShcQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=A1iwDSa3ARZMNiZb+4IG+ujSQIIKEg4vNkGrMqNTEuAqDYHU1C4POzg7Rij21bz0HmttBxECaCfTklISBq86pyH25TZfLza+qJ9J1fUGD0I6Hs0/U3jvxJnWR17OOWcYWg/jVrh7va0ItpJh2mNKpoSQzEpjGpKtqGBkYxm9eI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cTQFf1Fr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508HMlxa014796;
	Wed, 8 Jan 2025 22:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pe4G+UyYb8cZtDj+ltdkPSaWk2YVBHhcyJrZWNEnXxg=; b=cTQFf1FrybgrKyii
	TEz9QmPqOAKYMBdZHoM8l8zluabyB8DGidjRZ1rDRNGn1RRpjUkhF+D9meZIAF3V
	pz+aXaSAyzCLIjDj1WvENwnU1FDxRhj7iO4J7hkXA5An9pgYZFtghKaHgZ3jPIlL
	kGJsn3VwiuqbD5q+4Rapt4w1pQVKG3GblTRh2cxROpSY8jI/ccwoB3/8CbwtadeJ
	wLWnckYSpuyQnco9qra/wG/HawBRjEDfTki1iyJbIlTozUfqYhY4JP/ITrxnJbbP
	mGmJeBdSzrJZJH5uN1PMoHBDOKDp1hHbQMVCC1Lwcxh8MZVlOhO9tZ7GcZH27zZu
	f82rpw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441wq50pke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 22:43:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508MhUd5021460
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 22:43:30 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 14:43:29 -0800
Message-ID: <48c109bc-58c2-416a-ba6a-a15ca754f16d@quicinc.com>
Date: Wed, 8 Jan 2025 14:43:28 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
To: Abel Vesa <abel.vesa@linaro.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Jani Nikula
	<jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin
	<tursulin@ursulin.net>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Johan Hovold <johan@kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
        <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        Johan Hovold <johan+linaro@kernel.org>
References: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
 <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-1-918949bc2e3a@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-1-918949bc2e3a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: R1XT-ytBRZAZ1E1Tb4N3fk9CX-hEtAs7
X-Proofpoint-ORIG-GUID: R1XT-ytBRZAZ1E1Tb4N3fk9CX-hEtAs7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0
 clxscore=1011 malwarescore=0 mlxlogscore=970 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501080186



On 1/8/2025 6:31 AM, Abel Vesa wrote:
> According to the DisplayPort standard, LTTPRs have two operating
> modes:
>   - non-transparent - it replies to DPCD LTTPR field specific AUX
>     requests, while passes through all other AUX requests
>   - transparent - it passes through all AUX requests.
> 
> Switching between this two modes is done by the DPTX by issuing
> an AUX write to the DPCD PHY_REPEATER_MODE register.
> 
> Add a generic helper that allows switching between these modes.
> 
> Also add a generic wrapper for the helper that handles the explicit
> disabling of non-transparent mode and its disable->enable sequence
> mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
> to move this handling out of the vendor specific driver implementation
> into the generic framework.
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   drivers/gpu/drm/display/drm_dp_helper.c | 62 +++++++++++++++++++++++++++++++++
>   include/drm/display/drm_dp_helper.h     |  2 ++
>   2 files changed, 64 insertions(+)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

