Return-Path: <linux-arm-msm+bounces-21499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D74B68D8940
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 21:01:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7786C1F225C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 19:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E2D130492;
	Mon,  3 Jun 2024 19:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D+WM5UcY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBFB259C
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 19:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717441272; cv=none; b=N+wXl4O3S523xcPXmjvMIA3KcxrjD6eCud70JFRVDx4TWdt0ST4WJhejskEpVB5/QSre5VysUSVdFz5Zve6PLO1gq4mY3BcHiTTuFiGr5OhLC1gr2rg4o2TjZPH5Vvpru77r4jKJZu/LKnTeZLE2+R5bm6jmUA/bzrG36OafSWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717441272; c=relaxed/simple;
	bh=OzpyMkwIpXADuwNvqL5VPztFwlRwWQx8mCzTP7QLPmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CVaMy2Wo60VyMfUZ3en8+KEtsN4TMpIIYU/uysJkbu+ekNnUsOyCsoIU8x0+Faoxmwe4WYkPbb8ynUdRNGDqrR9oVrDCDwjfOygTWotg+/u0tBqkK+bjLMfhN4bcwiExQCYyZGvK2U/APPlPz3eNIQiI1boRVYVle6fzn3Gp8i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D+WM5UcY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453CVxaU012671;
	Mon, 3 Jun 2024 19:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBulczDkXO9VgkWgUh8tTAbcPK94WQcka0v8OaUlg8E=; b=D+WM5UcY+36wrX1Z
	YOE56gjSC5TviSmjO8nv6KUxtNcQ3quQlj36+X4fnTWp/m/AYV5jNOUhGAAe7DWm
	A5Iomd3yLV8xCGc5dOp23MjhOPjCUTTFO7/3oIAU9ReW3IE/MZegt4uKiTgL/8Ny
	knz5oDdTUbw29c9i3XA4A53su00tPV10Zl1vD+OEUrdpcLROkkLJONjEbmGCWMzQ
	80M7DoTHd2MBKkJCyVBnOI9jEopBx1tqcQyZW3hxEFm5qBLkvuHbSiBQSQI1pQtl
	hZVMZ5CUc/XHrYNHDoTTQQv1kHbWcZHTi1lj/jqqnbK2TR+aphLROcFUL5apUfiO
	9mKbZw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw4an10t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 19:00:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453J0i2c004859
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 19:00:44 GMT
Received: from [10.110.31.89] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 12:00:34 -0700
Message-ID: <55dae79d-6499-9329-f2c8-a1ef3c94e019@quicinc.com>
Date: Mon, 3 Jun 2024 12:00:32 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/9] drm/msm/dpu: drop dpu_format_check_modified_format
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Abel Vesa <abel.vesa@linaro.org>,
        Johan
 Hovold <johan+linaro@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
 <20240319-dpu-mode-config-width-v1-1-d0fe6bf81bf1@linaro.org>
 <9c2f5f63-291c-c2b5-41a1-d2004055cf7a@quicinc.com>
 <ccgx5mjsxf2asvadithitzl7shkboj6ipcg6onfawa5pskchgd@etighi5usone>
 <c3021397-5d2e-c331-663f-eb3803cfc0e0@quicinc.com>
 <wpc7hzr2xol6mz6j4se2a3j7u52fvs6rpikcbpzet7ebz24dbf@g7rlhiz72q46>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <wpc7hzr2xol6mz6j4se2a3j7u52fvs6rpikcbpzet7ebz24dbf@g7rlhiz72q46>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GR_VIiS0sqdHC6F8KPjup1rPJ_H5mh12
X-Proofpoint-ORIG-GUID: GR_VIiS0sqdHC6F8KPjup1rPJ_H5mh12
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_15,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=581 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1011 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030155



On 4/22/2024 4:06 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 19, 2024 at 07:32:35PM -0700, Abhinav Kumar wrote:
>>
>>
>> On 4/19/2024 6:26 PM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 19, 2024 at 04:43:20PM -0700, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 3/19/2024 6:21 AM, Dmitry Baryshkov wrote:
>>>>> The msm_kms_funcs::check_modified_format() callback is not used by the
>>>>> driver. Drop it completely.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 45 -----------------------------
>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h | 15 ----------
>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  1 -
>>>>>     drivers/gpu/drm/msm/msm_kms.h               |  5 ----
>>>>>     4 files changed, 66 deletions(-)
>>>>>
>>>>
>>>> I think in this case, I am leaning towards completing the implementation
>>>> rather than dropping it as usual.
>>>>
>>>> It seems its easier to just add the support to call this like the attached
>>>> patch?
>>>
>>> Please don't attach patches to the email. It makes it impossible to
>>> respond to them.
>>>
>>
>> I attached it because it was too much to paste over here.
>>
>> Please review msm_framebuffer_init() in the downstream sources.
>>
>> The only missing piece I can see is the handling of DRM_MODE_FB_MODIFIERS
>> flags.
> 
> I checked and I don't like this approach.
> 
> With the generic formats database in place, there should be no
> driver-specific code that handles formats. Moreover, I think this should
> be handled by the generic code in framebuffer_check() if msm driver
> implements a proper get_format_info() callback. Please consider sending
> a patch that does it. For now I can only consider the function in
> question to be a dead code which should be dropped.
> 

Alright, lets revisit this implementation later on and for this series 
we can go with dropping dpu_format_check_modified_format().

