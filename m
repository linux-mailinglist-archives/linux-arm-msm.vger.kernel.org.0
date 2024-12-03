Return-Path: <linux-arm-msm+bounces-39982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B219E1158
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 03:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 447AA2819A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 02:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211984C60B;
	Tue,  3 Dec 2024 02:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oPbim6ay"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03FE154C0B;
	Tue,  3 Dec 2024 02:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733193199; cv=none; b=meSCDaGPkz6S0ppNzba5XEYT8P5VgDx95a7wPUC4IyR0ibYtvRZ4I88JXG0L0gj/Wv8yuVBKSgoG2I5TXB8pQdRi1XqChGBlgMEK5wBjuymWUab33E9p/liwjvCht8g4T7PN5rG4mnFE8PTb5JQhsXHI8PLbFIh5V5kMULEKMoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733193199; c=relaxed/simple;
	bh=9N23yqUoFWJPxouORASrI1wdXzhgpNaDXev2IiCgr+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qGd4ynDhusOsTVjG3/SQsf/i47tkZt6IeuLlX/zxAnMsxjLCZTLS87cenRKM0GSV1gx426f8Ha2AF30W+ENxLDutEI4Bp59G+lmqNSRveBHNLMRsFvtdodAwRnxY+uhMCD37URMFerkV57Qyi/sOJFm7izGPGNubMtKchDerSeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oPbim6ay; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2J5nJ8004593;
	Tue, 3 Dec 2024 02:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wZd0z3ZWOH13xeJnttEEz5pZ9+IpIV6V22dj5EbFz5s=; b=oPbim6ay6uCcBTVK
	zKk0406/zXbNEhw7TTdL7DWllMhgofbQLOIDHxFc3+2tZmhFoo4kpIB2YevmSTpg
	rhC12uELAP4k9r9dV3zew+7GJP2KQRXxaceJm71TNPThfAn2qMWrQIycCrefkz3c
	6XLUaixp5UcHSg3K+otzc2HtfH5Xqgscy/pa0riV8x3Ni7l6Q+pJgPmOBua8GX4R
	ML2b5kWvzwsYLBTY+GAeZFPFZu10TzoAOrq3b3oN/yTIA7x8oQTpnVBOIXljz6Vz
	Qv1Y0KNaaSZjKYj9Qw3gLXYkwdYOn1B9B+UEw8wJW7KRrkXA86Ija0+p9IJuw5Om
	vkGHPQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ufe6f2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 02:33:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B32X810012299
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 02:33:08 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 18:33:07 -0800
Message-ID: <15695281-4c14-4653-9591-774069210ae3@quicinc.com>
Date: Mon, 2 Dec 2024 18:33:07 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/14] drm/msm/dp: fix msm_dp_utils_pack_sdp_header
 interface
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Paloma Arellano <quic_parellan@quicinc.com>
CC: Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd
	<swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-2-d9187ea96dad@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-2-d9187ea96dad@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NT0j4USn8r3N-piTQzmkESnBUh3tDPnr
X-Proofpoint-GUID: NT0j4USn8r3N-piTQzmkESnBUh3tDPnr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=853 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030020



On 12/2/2024 2:06 AM, Dmitry Baryshkov wrote:
> The msm_dp_utils_pack_sdp_header() accepts an unlimited-size u32 pointer
> for the header output, while it expects a two-element array. It performs
> a sizeof check which is always true on 64-bit platforms (since
> sizeof(u32*) is 8) and is always falce on 32-bit platforms. It returns

falce --> false

> an error code which nobody actually checks.
> 
> Fix the function interface to accept u32[2] and return void, skipping
> all the checks.
> 
> Fixes: 55fb8ffc1802 ("drm/msm/dp: add VSC SDP support for YUV420 over DP")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_utils.c | 10 +---------
>   drivers/gpu/drm/msm/dp/dp_utils.h |  2 +-
>   2 files changed, 2 insertions(+), 10 deletions(-)
> 

Apart from that LGTM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

No need to resend, I can fix it up while applying.

