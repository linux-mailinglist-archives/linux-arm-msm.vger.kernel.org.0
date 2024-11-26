Return-Path: <linux-arm-msm+bounces-39224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 181F69D9D01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 18:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B516C1629A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 17:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DCE1DC182;
	Tue, 26 Nov 2024 17:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lplMH45K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3693D299;
	Tue, 26 Nov 2024 17:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732643965; cv=none; b=s+XBNCActOIcWUfmkFkX1EiBebmO3KJIlMZrBzlkGWwxK2gz4eHPqVAAgoZRR8I8uCml8DSsB5SFq2ZvqWCt/S6rm0+qaonJ/bq8uJqZ4gY55dnXJtKBq2mvxyp7ORjA8XRvOdiGmbL1sHAz7reURdKmAFHFPMq7W25qgWB94vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732643965; c=relaxed/simple;
	bh=AePAptw5GNTnJr9g9/5jWQF7IlRxU7KulzI2pSmiQh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CoLe5HK/X8Ndun1XlqrHss2jvVCdJ1khljqRbkMxqb8lYA4/n/B9pv+DHduWPnMJr472CZHth5VgKBeLDC0HJnnA9a1407dsst9CWl1WtmWZsu+1jQoTvgNWasNC0wgGiB3M5EYygwFocIWQBb4rLwyzNCc3Tx36M6CA2XMQRbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lplMH45K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ9X6X3013213;
	Tue, 26 Nov 2024 17:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tpIuyVXVx4kLvCmwcAVpsnjn058HMqx3WLUP/HjyD+A=; b=lplMH45KC6PuUPOk
	8vlq732iDsYYOOKSuc6OoFP3+Gq5VycHou2BPN0Q5O/tj7eElKWoYmmH2nOKRnGs
	Bd02y3c984sOpqHgtggPJ6jev85iDCD7A9M9h9tOdarUiBSpCJAU8gtWYQN9jtQl
	NStYEbgzjiwCqFNKkzGPQcTpSlH9JSNLHE0T6eYvkRgWidx3G9qqfL6S7vjXIltI
	F2UTltELerhcPxNLXDf37CBKA7JNQHua2pYPfg0r+EiqYA0pu2qqrSf3wjC6XAe3
	7qXBabz4OvL5XvhkG8JEbk9xLEwIktJI1C6ANAT6VP9z1dtdzXCGLr5VanuLUrcN
	mY6Mag==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4334rd964b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 17:59:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQHxDc0013756
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 17:59:13 GMT
Received: from [10.216.46.102] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 26 Nov
 2024 09:59:09 -0800
Message-ID: <c2a8984f-e67f-4e29-93ed-32d908ffef58@quicinc.com>
Date: Tue, 26 Nov 2024 23:29:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/2] arm64: dts: qcom: qcs8300: add TRNG node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20241122074346.4084606-1-quic_yrangana@quicinc.com>
 <20241122074346.4084606-3-quic_yrangana@quicinc.com>
 <40c49e6d-dbbd-49cf-b59b-10e10b24da22@kernel.org>
 <0bdaa2ef-3979-4963-be75-0a5a89728f44@quicinc.com>
 <2vc6tg77qpi5vz7tmmlwgnlxjg62l6vsipjivygiapl4dhqupv@vrpbk3kcdrd3>
Content-Language: en-US
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
In-Reply-To: <2vc6tg77qpi5vz7tmmlwgnlxjg62l6vsipjivygiapl4dhqupv@vrpbk3kcdrd3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0rBr0xhn_LdEsmcb02XCF9hedUtcq3ai
X-Proofpoint-GUID: 0rBr0xhn_LdEsmcb02XCF9hedUtcq3ai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=831
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411260143

On 11/26/2024 4:05 AM, Dmitry Baryshkov wrote:
> On Sun, Nov 24, 2024 at 09:17:40AM +0530, Yuvaraj Ranganathan wrote:
>> Hi Krzysztof,
>>
>> I sincerely apologize for the inconvenience. I added the "Reviewed-by"
>> tag without fully understanding its implications. I will remove the tag
>> in the next patch series.
> 
> First of all, please don't top-post. Put your text under the phrases
> that you are responding to, not at the top of the message. Otherwise the
> logic is a bit broken.
> 
> Second, may I ask, what made you add that tag at all? I went on and
> checked. Krzysztof didn't repond at all to v3 and didn't respond to v2
> of this patch. So why?
> 
> Third, if you are unsure about what you are doing and as you seem to be
> using b4 tool, please just use `b4 trailers -u`. It has its own
> drawbacks so in some cases one should be careful, but at least it
> doesn't invent tags on its own.
> 
>>
>> Thanks,
>> Yuvaraj.
>>
>> On 11/22/2024 8:30 PM, Krzysztof Kozlowski wrote:
>>> On 22/11/2024 08:43, Yuvaraj Ranganathan wrote:
>>>> The qcs8300 SoC has a True Random Number Generator, add the node with
>>>> the correct compatible set.
>>>>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> Reviewed-by: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>
>>> NAK, stop adding fake tags. It is impossible to receive above tag from
>>> me written that way.
>>>
>>> Best regards,
>>> Krzysztof
>>
> 

I've added the "Reviewed-by" tag without a proper understanding as I got
few comments
(https://lore.kernel.org/all/4009f4ee-2c55-4a4f-8805-eafe7efc0147@kernel.org/)
 on the earlier patches and tagged the reviewers under "Reviewed-by". I
sincerely apologize on this and will ensure to avoid such mistakes in
future.

Thanks,
Yuvaraj.

