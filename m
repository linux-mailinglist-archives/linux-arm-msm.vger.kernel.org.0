Return-Path: <linux-arm-msm+bounces-32089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8731897D689
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 16:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04B26B21DD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 14:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9ECD2AE69;
	Fri, 20 Sep 2024 14:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X9caUx4W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22484224F0;
	Fri, 20 Sep 2024 14:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726840858; cv=none; b=ksbOjTsTmpnNs2E96IpYxoLuTd23sBXqo4BzijRe6CZzF2+7YFlYik6+ulFBLyksqCzGst0NLcXrk2VLaWvCLBu0s6uXWO81ACIOJTikK2ShsFn/fxsMhDHjIpzVb6s8xMl/DTTuzmB6TGneKWBczs+qK+i+HkNLFLfaI4nYpvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726840858; c=relaxed/simple;
	bh=SjouKvnGzvSQYYGymuKxBI8tlJLwwvujAM9/Hx6FcxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jOpqCEwlt348sDel//6fNaRKV9BNLtnEsBIxHxxynLkW+BI4O/cza2fx7M7lPyzh+9z9QnrjN3GJLUx/4KEXznZ86/rLEWccjuyOvlOhlhpkwQem+tcng/xyInfLQLFlmH9/OoqAYaS0vV4qHkNe+XeWvWkGflsLOhHzQluAYXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X9caUx4W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48KB5tad017555;
	Fri, 20 Sep 2024 14:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Se93HO0HCudHeOs3VcVG74GCHSXa9IoKZz1+bHFhs2o=; b=X9caUx4WUMG5TR5e
	XKnYibiKKX6i3tCHlmpDCsQT3/mnoK/z9K4dY0p8UC9RgKrdqEi2x9sT9uw63Ahy
	ujf93IeBCU3tV+8iDDOppHxTaPx4vhxctRnfQsAFg6H5briGfYnjBW4pfJUvYmft
	XrWwdo9W1mmDTNCJMwIGVWuZKq5ewqVtKLQMqdizUxJyGUArK/01HENlL7zV7AIh
	upehnRSJZTQsHaXGOWL6TNmfc4+cGQuGyF/4TMsiZB5GG87cODqq9757GPpTr9LI
	bcb6CnE/tifpM2NqnklpuivgaNqrqy1R/bQLQdNjA8fY0/xxv2NNvY4uV+KMkFrn
	OmJW0g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41ry4aa2cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 14:00:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48KE0HxF013883
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 14:00:17 GMT
Received: from [10.111.141.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Sep
 2024 07:00:14 -0700
Message-ID: <18e971c6-a0ef-4d48-a592-ec035b05d2b7@quicinc.com>
Date: Fri, 20 Sep 2024 07:00:11 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pd_mapper: fix ADSP PD maps
To: Johan Hovold <johan@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20240918-x1e-fix-pdm-pdr-v1-1-cefc79bb33d1@linaro.org>
 <Zu0wb-RSwnlb0Lma@hovoldconsulting.com>
 <sziblrb4ggjzehl7fqwrh3bnedvwizh2vgymxu56zmls2whkup@yziunmooga7b>
 <Zu06HiEpA--LbaoU@hovoldconsulting.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <Zu06HiEpA--LbaoU@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8xh5ep7kPkkbkIMIPCF1nbqlX1sStHZ7
X-Proofpoint-ORIG-GUID: 8xh5ep7kPkkbkIMIPCF1nbqlX1sStHZ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 malwarescore=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 mlxlogscore=906 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409200102



On 9/20/2024 2:02 AM, Johan Hovold wrote:
> On Fri, Sep 20, 2024 at 11:49:46AM +0300, Dmitry Baryshkov wrote:
>> On Fri, Sep 20, 2024 at 10:21:03AM GMT, Johan Hovold wrote:
>>> On Wed, Sep 18, 2024 at 04:02:39PM +0300, Dmitry Baryshkov wrote:
>>>> On X1E8 devices root ADSP domain should have tms/pdr_enabled registered.
>>>> Change the PDM domain data that is used for X1E80100 ADSP.
>>>
>>> Please expand the commit message so that it explains why this is
>>> needed and not just describes what the patch does.
>>
>> Unfortunately in this case I have no idea. It marks the domain as
>> restartable (?), this is what json files for CRD and T14s do. Maybe
>> Chris can comment more.
> 
> Chris, could you help sort out if and why this change is needed?
> 
> 	https://lore.kernel.org/all/20240918-x1e-fix-pdm-pdr-v1-1-cefc79bb33d1@linaro.org/	
> 

I don't think this change would help with the issue reported by Johan. 
 From a quick glance, I couldn't find where exactly the restartable 
attribute is used, but this type of change would only matter when the 
ChargerPD is started or restarted.

The PMIC_GLINK channel probing in rpmsg is dependent on ChargerPD 
starting, so we know ChargerPD can start with or without this change.

I can give this change a try next week to help give a better analysis.

>>> What is the expected impact of this and is there any chance that this is
>>> related to some of the in-kernel pd-mapper regression I've reported
>>> (e.g. audio not being registered and failing with a PDR error)?
>>>
>>> 	https://lore.kernel.org/all/ZthVTC8dt1kSdjMb@hovoldconsulting.com/
>>
>> Still debugging this, sidetracked by OSS / LPC.
> 
> Johan

