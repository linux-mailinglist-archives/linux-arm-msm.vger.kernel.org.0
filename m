Return-Path: <linux-arm-msm+bounces-10547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D98C85068C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 22:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00A921F21F87
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 21:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA8F5FBBF;
	Sat, 10 Feb 2024 21:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j3kpSu3H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DA036B01
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 21:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707601778; cv=none; b=VSjAaMiXXXL9tNsHl+RNLUFe89s6IKXavA1Rvn8AcaTC/P9DB1nZmCSxOTaAfptJfiQnvSOaNfq4Ne4OGS3IzClCD3UwJNuUHDQPg1YbTfPBH7WyvnaqVkBw3PGaY+7SNgRpdnq01Q98DZ7eA+z4jndYJd2lc0Xs7HRXENzxeOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707601778; c=relaxed/simple;
	bh=8pKmPJX4TaXH6XaF5gH353yTtgxaF3HueI8BRnuH0Ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CU+hm+IIpeztYrtjuRi0O/8fbR54S1LEVFV9F+No2Ce8CYNYgK9nQAHrvAAJd0nM9itYaPNDbzf+flQGWbjisXx8csDZ5ddcmjxA7c6Hwdvqgi25/48Jj6k/nj7ISpbBwZrs1Wy22YGt7MWjOSJhfY/AY/o68fbGLkt2pPvyvDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j3kpSu3H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41ALmij0008251;
	Sat, 10 Feb 2024 21:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=geLQB9OhdKeHJtTMNvzI8iuNPRmJTuzmnfx8QPAl4Qw=; b=j3
	kpSu3HfyOafYtznrc+W9WSLEeS6iyJDikiF8QupqojCZ5AWbsAxhVD58WzGR7bzF
	5f6a79xcbPxCbECRmD1c2auSyJ6JKl0fIPJ9AE41REcv3SByduZcahiOry415vYb
	sAQkjecVNICjAqIM8SiQLEivP3Ce3I3lUrbUsvuB+gME8TbPTn6wMp5Jl8q0cFtE
	yJhR7xqq+dhOfdmOdDm1ljaxzqQwsvSVuvSNkWYxh1YW3E+bZPf0Nb6JsYFmqsi9
	SNKDJxybG5pCzBcEzmg6cRfd1Aat6QYpFeAEHKrMZPrDskhaogfD4YekIMwDgbz1
	r8Sg8i2q0yAWEweu0TZQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w62pv8y9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 Feb 2024 21:49:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41ALnQJC022217
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 Feb 2024 21:49:26 GMT
Received: from [10.110.104.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 10 Feb
 2024 13:49:25 -0800
Message-ID: <1664d096-d258-72fc-8352-7d088000fcc1@quicinc.com>
Date: Sat, 10 Feb 2024 13:49:24 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 15/19] drm/msm/dp: enable SDP and SDE periph flush
 update
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Paloma Arellano
	<quic_parellan@quicinc.com>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-16-quic_parellan@quicinc.com>
 <CAA8EJpqq+H1gdy2pJo0Up=5w0mYTPRu2_1swEBNfyAMXztQanA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqq+H1gdy2pJo0Up=5w0mYTPRu2_1swEBNfyAMXztQanA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cc6561D7sXEN8qmpmqTccuQ3IEkiGIoz
X-Proofpoint-ORIG-GUID: cc6561D7sXEN8qmpmqTccuQ3IEkiGIoz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-10_20,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 mlxlogscore=419 adultscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402100182



On 2/10/2024 2:16 AM, Dmitry Baryshkov wrote:
> On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>
>> DP controller can be setup to operate in either SDP update flush mode or
>> peripheral flush mode based on the DP controller hardware version.
>>
>> Starting in DP v1.2, the hardware documents require the use of
>> peripheral flush mode for SDP packets such as PPS OR VSC SDP packets.
>>
>> In-line with this guidance, lets program the DP controller to use
>> peripheral flush mode starting DP v1.2
>>
>> Changes in v2:
>>          - Use the original dp_catalog_hw_revision() function to
>>            correctly check the DP HW version
>>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  1 +
>>   drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
>>   4 files changed, 21 insertions(+)
>>

<Snip>

>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
>> index 2983756c125cd..6ac66532b47a4 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>> @@ -102,6 +102,8 @@
>>   #define DP_MAINLINK_CTRL_ENABLE                        (0x00000001)
>>   #define DP_MAINLINK_CTRL_RESET                 (0x00000002)
>>   #define DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER   (0x00000010)
>> +#define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP      (0x00800000)
>> +#define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE       (0x01800000)
> 
> Just one bit here, please.
> 

hmm .... so the periph flush bits are 24:23 and we need a value of 3 to 
select peripheral flush which translates to 0x01800000.

How do you suggest to break this up?

>>   #define DP_MAINLINK_FB_BOUNDARY_SEL            (0x02000000)
>>
>>   #define REG_DP_STATE_CTRL                      (0x00000004)
>> --
>> 2.39.2
>>
> 
> 

