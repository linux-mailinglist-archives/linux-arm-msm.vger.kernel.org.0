Return-Path: <linux-arm-msm+bounces-40473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 996349E51F7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 11:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50100167F4D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 10:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C923A19007E;
	Thu,  5 Dec 2024 10:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZX1Dx79T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B5F26AFF;
	Thu,  5 Dec 2024 10:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733393858; cv=none; b=WHmWM9xz3f5OZ+l4Yc0343JD6bG9E5C+i0cgkF+ozYy9j23GPsMwnm8XqrT0us4qHf7nBlLnDwEc2hy4XfT83M9r4yOYc8VA2LJrQ8/psy1uZJNZi0LY7aWb7tB8hitA+jBz6qgO4qnBXH1gUFd+OWy6zwscKJmsXDS8QLyM61k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733393858; c=relaxed/simple;
	bh=YC7FQ1eB8fJDARyzxeuOiD3gvXNi8ZNbe51KU1Xfg2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YycorLizTyC5Z1eK4jXHYSmCjqiiU7aJTIMNnVq8PjTbFwYbzQogknP6UVi12KDawETOaxgwAqL/eTclgXhmym1mv760WO0SQl0k2LVsZymQK26sBoJD9SfPdaPL+LNGW0Z5tL3Z931c7+/Cv2ie8E1MKuuopxNO2JiT/1fjhL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZX1Dx79T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B57UxGp025018;
	Thu, 5 Dec 2024 10:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dit2XdV4jZIb+L6jEF8gWfIehhTuSojBtBDYrG6sMmI=; b=ZX1Dx79TqwzKLo3U
	mGA5Z9aJbhUDzHhKOma/mqMlGNdGK4T+gKs9uLPZC4fzgY36K4B3vkmBhCMBkeHq
	mTu0gSs4Q3scZHRNMYB4ulS+wO+9s1RqtytgL9lVBtSRjcDFaG642qrFJL78Jphn
	VDzKaM9OT/o4MRw9XzBvT5TZc+8WDxJPyUIW44q860ZAy/mKCOzxf1pLhurUjP0M
	NBScpNp9P2MpuCYnmnNyTVnMjcTLdbadv82wsEc0J54ji/HclVFhetOeaqEXLEHZ
	/HHF7/UMf6isDbsBGeQYnwG7z6vZ3XklnbA4aZFZNtEu745Ne8YHlNhKkCAJXg7u
	M/oqDA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43aj42bvf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 10:17:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5AHNdU020454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 10:17:23 GMT
Received: from [10.190.163.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 02:17:17 -0800
Message-ID: <6356241e-6bfc-c4dc-1fbd-cd92f1b236ba@quicinc.com>
Date: Thu, 5 Dec 2024 15:47:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 4/5] soc: qcom: Introduce SCMI based Memlat (Memory
 Latency) governor
Content-Language: en-US
To: <myungjoo.ham@samsung.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Kyungmin Park <Kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
CC: "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
        "cristian.marussi@arm.com"
	<cristian.marussi@arm.com>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "konrad.dybcio@linaro.org" <konrad.dybcio@linaro.org>,
        "robh+dt@kernel.org"
	<robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "quic_rgottimu@quicinc.com"
	<quic_rgottimu@quicinc.com>,
        "quic_kshivnan@quicinc.com"
	<quic_kshivnan@quicinc.com>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
        Amir Vajid
	<avajid@quicinc.com>
References: <ac655bdc-5ccf-c6c6-3203-659f1916c53c@quicinc.com>
 <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-5-quic_sibis@quicinc.com>
 <2aycrvnvivcrqctqmweadcgenwugafdr6ub3bzkscterpenz32@bzabln2hkral>
 <29eef87e-96f6-5105-6f7a-a8e01efcb4a3@quicinc.com>
 <k4lpzxtrq3x6riyv6etxiobn7nbpczf2bp3m4oc752nhjknlit@uo53kbppzim7>
 <CGME20241114041419epcas1p3b52bb9795ffd9efa568bb106ba268e02@epcms1p5>
 <20241115003809epcms1p518df149458f3023d33ec6d87a315e8f6@epcms1p5>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <20241115003809epcms1p518df149458f3023d33ec6d87a315e8f6@epcms1p5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: j-5sSJzGurTdnMTU9b402_166u-cHYBA
X-Proofpoint-ORIG-GUID: j-5sSJzGurTdnMTU9b402_166u-cHYBA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=981 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050073



On 11/15/24 06:08, MyungJoo Ham wrote:
>>
>> Hey Dmitry,
>>
>> Thanks for taking time to review the series.
>>
>> + Devfreq maintainers to comment (I thought you already added
>> them by name)
>>
>>
>> Hey MyungJoo/Kyungmin/Chanwoo,
>>
>> Can you weigh in here? Does it make sense to add a new
>> class of devfreq devices that don't have governors
>> associated with them just for them to export a few
>> essential data to userspace? In this scenario the
>> scaling algorithm is in a SCP and we just start
>> them from the kernel. We do have ways to get the
>> current frequency of various buses but does this
>> warrant adding a new class of governor less devices?
>>
>> -Sibi
> 
> If voltage/frequency is controlled by SCP
> (it's an SoC's internal hardware IP, right?),
> it's good to have a userspace governer
> with the driver not accepting updates from userspace.
> 
> E.g., Let "target" callback not update the frequency value,
>   or let "target" callback always return an error with
>   a dev_err message that you don't accept frequency changes
>   from userspace.

Thanks for the input. Will implement something similar to
what you suggested for the next re-spin.

-Sibi

> 
> Cheers,
> MyungJoo.

