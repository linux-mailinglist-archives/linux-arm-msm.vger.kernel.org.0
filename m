Return-Path: <linux-arm-msm+bounces-27430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DD1941F1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 19:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53F8F1C22D12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 17:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A7A189522;
	Tue, 30 Jul 2024 17:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I/WKhAUx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE671649C6;
	Tue, 30 Jul 2024 17:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722362307; cv=none; b=h48X9QJy6pB9TntJWswOx1pH/8Fv9VuYG62yIq/RCpT0Kyv3mAkhurMDIOodAlbVSq5SJU5UMC/WAc0qkhnj5dPxj0oZlH8ydyF2RZon2xt7AK9lvrQbPi4LFwECHa1tSFFQQuyHnA8xEnIcnqKG5gvhFPou/opPNatkcDcyuzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722362307; c=relaxed/simple;
	bh=CWiMZzQc6iujg0PhZc5Dl7DAw2HDLJyke0lETFBLUzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dBtV1nhBFDFXOgZoKH4NM7UIL5qnzX+g5/jXQp06Ayh4AT/Su6DwEXl7rnmN90FHywECyYrL4lAldIv9/dcoii/Q1ucoLTZHowVxcQ4A0iTrudW6JFINBQsskfHm3ZWVY8z7ocTndNff96EAVJ7ka7ZMow14eyjPfw5Scs2I7AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I/WKhAUx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UHvgHN030534;
	Tue, 30 Jul 2024 17:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i3zIHuBSrqmdngqmaB2D8Qm7MvBmeypkC15fgCfN9gk=; b=I/WKhAUxaVTywhvd
	Y3JLrZ0uRbDqJD7smtwj6qwwNihnHeq/dQo3f4AVfC5Wf7w8VVWKCTpsWaWwokTP
	RAA3BM1sakDpnWdLCitV8Mlk+TjUyffrE5M+g+cW7J38kYpzBWpWMYmmhhVczKyn
	1E21aZTadwiWI/dB/vu66k8/o0t2FTDwbLpMAAHCA8zelC8WvCJ2w6grX0wONxw/
	BFRf/GaKcBv8mQHogTNMKnrsh44t1uwm5Gs8ZDtNrQ1JQyggDPzx0KFvl/rznEVL
	hucEbGlQkT+vRmG8u+kplQWaPg7MXkQk1NeCV2GS7onsbgwzWoS3LlkE/Kw23Col
	20xrvA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mt68rcbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 17:58:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46UHwCYq025157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 17:58:12 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Jul
 2024 10:58:11 -0700
Message-ID: <cecfbed5-aec1-439b-a866-4eebcd3bd421@quicinc.com>
Date: Tue, 30 Jul 2024 10:58:11 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: fix the max supported bpp logic
To: Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
        "David Airlie" <airlied@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Guenter Roeck <groeck@chromium.org>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Vara Reddy <quic_varar@quicinc.com>, <freedreno@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <neil.armstrong@linaro.org>, <abel.vesa@linaro.org>,
        <quic_khsieh@quicinc.com>, Rob Clark <robdclark@chromium.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240725220320.130916-1-quic_abhinavk@quicinc.com>
 <CAE-0n50mBEX98HH+5BurM-uRyzrxcPXFJ7yLg__hFJHfYjm67Q@mail.gmail.com>
 <8fa86c0c-183b-4787-9525-38dfe6bcecc6@quicinc.com>
 <CAE-0n537mpOMkVWrXGSpjU8cHZtUZXFfdG1YTfevu2SRo1hPTQ@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n537mpOMkVWrXGSpjU8cHZtUZXFfdG1YTfevu2SRo1hPTQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ErS6-3DdwiciUDQ3xRLHRPJw_DHd-uI7
X-Proofpoint-GUID: ErS6-3DdwiciUDQ3xRLHRPJw_DHd-uI7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_14,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=986 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300123



On 7/29/2024 1:08 PM, Stephen Boyd wrote:
> Quoting Abhinav Kumar (2024-07-29 11:28:35)
>>
>> Thanks for the feedback.
>>
>> Your change looks valid. We can use this and drop the max_t usage.
>>
>> Let me push this with your Suggested-by credits.
> 
> You can take my
> 
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> 
> and either squash it in or make a follow-up.

Done, I have squashed it into this.

I have also re-tested and since the logic is the same, I have retained 
Dmitry's Tested-by

