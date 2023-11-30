Return-Path: <linux-arm-msm+bounces-2758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AB57FFB67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 20:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB637B20D0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 19:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D38B52F6A;
	Thu, 30 Nov 2023 19:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aCju9OyY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B0CAD5C;
	Thu, 30 Nov 2023 11:32:38 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AUEW6xJ013380;
	Thu, 30 Nov 2023 19:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=l4YSnUiC8qsWdFacXbZIqX8flbgJK64MbQewVhSlGDM=;
 b=aCju9OyYIXvQRo4gChuIZ6FOPOgvAjC3ASr3y9eV6XgBGl5cxcCCkO6b8vS+42yys4Ml
 RS7HO1nsXz6zdLTuZtdgYFvVxM2HPjqeIZXi5Z1aE0QOBaiDHF5+UEjBpdLCo5wX2a1J
 NmTZ2CsCyB9Ak1XaPbmWEClZKHzlBFVcnJzCgAb6ILtgMU1K9Q7QEd5DLJKHXANJPICS
 GuiTxK+M+re0D+2pPuRtDGtQbyE54basdNaCl+RQUklNHjyMZcxr8gWxULfA6mNviDXP
 +P5+svFFzh55UWyyMNQ3QpzNfy9PpIIFrfkRnq+8/w4snL18tmY7H4pR8AI5ljowagnR 8g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3up5e8vevm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 19:32:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AUJWV3P005180
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 19:32:31 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 30 Nov
 2023 11:32:28 -0800
Message-ID: <c8e1adbf-a63e-5a6f-9b4a-e68a2af67779@quicinc.com>
Date: Fri, 1 Dec 2023 01:02:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] firmware: arm_scmi: Fix freq/power truncation in the
 perf protocol
Content-Language: en-US
To: Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla
	<sudeep.holla@arm.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_mdtipton@quicinc.com>, <linux-arm-kernel@lists.infradead.org>,
        <quic_asartor@quicinc.com>, <quic_lingutla@quicinc.com>
References: <20231129065748.19871-1-quic_sibis@quicinc.com>
 <20231129065748.19871-3-quic_sibis@quicinc.com> <ZWh6cuApg-sRbA2s@bogus>
 <ZWiE5nM83TZd3drT@pluto> <ZWiUqGJ8FaA1GBjm@bogus> <ZWi3iN3HDc92eMFO@pluto>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <ZWi3iN3HDc92eMFO@pluto>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O5K-K3vczoQpmaCEbreqN1Dib8R38MkE
X-Proofpoint-ORIG-GUID: O5K-K3vczoQpmaCEbreqN1Dib8R38MkE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_19,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 mlxlogscore=940 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311300143



On 11/30/23 21:55, Cristian Marussi wrote:
> On Thu, Nov 30, 2023 at 01:56:56PM +0000, Sudeep Holla wrote:
>> On Thu, Nov 30, 2023 at 12:49:42PM +0000, Cristian Marussi wrote:
>>> On Thu, Nov 30, 2023 at 12:05:06PM +0000, Sudeep Holla wrote:
>>>> On Wed, Nov 29, 2023 at 12:27:47PM +0530, Sibi Sankar wrote:
>>>>> Fix frequency and power truncation seen in the performance protocol by
>>>>> casting it with the correct type.
>>>>>
>>>>
>>>> While I always remembered to handle this when reviewing the spec, seem to
>>>> have forgotten when it came to handling in the implementation :(. Thanks
>>>> for spotting this.
>>>>
>>>> However I don't like the ugly type casting. I think we can do better. Also
>>>> looking at the code around the recently added level index mode, I think we
>>>> can simplify things like below patch.
>>>>
>>>> Cristian,
>>>> What do you think ?
>>>>
>>>
>>> Hi
>>>
>>> the cleanup seems nice in general to compact the mult_factor multipliers
>>> in one place, and regarding addressing the problem of truncation without
>>> the need of the explicit casting, should not be enough to change to
>>> additionally also change mult_factor to be an u64 ?
>>>
>>
>> I started exactly with that, but when I completed the patch, there was no
>> explicit need for it, so dropped it again. I can bump mult_factor to be
>> u64 but do you see any other place that would need it apart from having
>> single statement that does multiplication and assignment ? I am exploiting
>> the conditional based on level_indexing_mode here but I agree it may help
>> in backporting if I make mult_factor u64.
>>
> 
> Ah right
> 
>     freq *= dom->multi_fact;
> 
> does the trick..but cannot this by itself (under unplausibl conds)
> overflow and does not fit into a u32 mult_factor ?
> 
>   dom_info->mult_factor =
>   	(dom_info->sustained_freq_khz * 1000UL)

wouldn't having the 1000UL ensure that we don't truncate though?
Anyway will drop the patch when I re-spin the series.

-Sibi

> 	/ dom_info->sustained_perf_level;
> 
> 
> Thanks,
> Cristian
> 

