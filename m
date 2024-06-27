Return-Path: <linux-arm-msm+bounces-24431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 983C991A548
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 13:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 186E51F24E38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 11:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396BC1494CA;
	Thu, 27 Jun 2024 11:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jN7z5zWm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A660913E41F;
	Thu, 27 Jun 2024 11:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719487825; cv=none; b=VVPdeQjzhOMTOLOQQczV4JiyhstficB5sxgUBxLa46YftgplDXLDDbPFpz/sLLJcQy//U3gTXgWt0XClO9d5M0Hj23ZGbs2GS4F/gwyBo2K5EZ3Rbz9QtJSbV8IvFxu1prSLwaeCe59yqs7hmKwk74qxIfOjM4885y6/u8CJISw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719487825; c=relaxed/simple;
	bh=FMOhaUV2i8MrCHhGIzcTXcbZCBRkMiRMf4upve02Zg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NNkqJL3NIWoyGWOc8MqmB0CydzSGH5hL8J8m/H4hi8FvhjgpDL18Rmv4C/5TnBk1LFH9/1vvTGZxA9ZhC8F9QkBnhRVw94OSq6FFgdNZWDaemOg/rGyQN7KULFKOglB1Dk0wyR/MOmSdFb5KBHVcvOKkLFGbAjdEJUnuKn8Q/PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jN7z5zWm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RAe8RE016143;
	Thu, 27 Jun 2024 11:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yvTNhHO8YwMDefQ88K6TNlh3o4bpkTA7GzgWDR19jog=; b=jN7z5zWmwMVhwmOB
	P3A5vmzLUQkc5ttSyG+C4XfdueBJdSuR1zgf7kvO8LbiRJwgzBbT2V/YAVdZnp0t
	AmFRFHKmnl+aDlq8LLWhm0LOYyQUqm5S/XGmud51uMgQlUA+NPc1wsm54322K1mT
	P2fQ8vMsRq4SXnndL6Le9oyjuODheVmqXc5hI+ykyO+E7jOsSu3BQMiqYNvhq8fY
	yf7IE8phvsyAyfbKjqEWCEF4PER9GF4NZObEYC/gHV3dhAS3DC1RDvYr5VTY4tkT
	D4pZB+VG5MtFQQzC4f9vLDnOl1HlZkGDjrVu+rb1d5Ry5HGwU5wfqCOMAA0HleDJ
	gFRbdg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400gcmb8th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 11:29:47 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45RBTkwS012401
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 11:29:46 GMT
Received: from [10.152.201.37] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 04:29:41 -0700
Message-ID: <2ba4b368-d706-4723-a0aa-f1579600db23@quicinc.com>
Date: Thu, 27 Jun 2024 16:59:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/8] remoteproc: qcom: Add PRNG proxy clock
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <sboyd@kernel.org>, <andersson@kernel.org>, <bjorn.andersson@linaro.org>,
        <david.brown@linaro.org>, <devicetree@vger.kernel.org>,
        <jassisinghbrar@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <mark.rutland@arm.com>,
        <mturquette@baylibre.com>, <ohad@wizery.com>, <robh@kernel.org>,
        <sricharan@codeaurora.org>, <gokulsri@codeaurora.org>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
 <20240621114659.2958170-2-quic_gokulsri@quicinc.com>
 <chi3pzh5ss3mivnhs3qeoen5hsecfcgzaj6qnrgxantvinrri2@bxsbmpufuqpe>
 <73cb638e-4982-49a2-ba79-0e78402b59ad@quicinc.com>
 <ga5kczcyn3dqoky4525c74rr7dct5uizun2smvyx3p3u6z6vtm@5vshoozpttod>
 <2617940e-72ad-4214-be26-7a5b15374609@quicinc.com>
 <dyh3vxosjjfztgwgpb5jtoqhzfyf5jyfndaujqoslepzvbet4o@kx6xaotzazcs>
Content-Language: en-US
From: Gokul Sriram P <quic_gokulsri@quicinc.com>
In-Reply-To: <dyh3vxosjjfztgwgpb5jtoqhzfyf5jyfndaujqoslepzvbet4o@kx6xaotzazcs>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5XAp9QFoO9ErigkzPYvY_k_GoJj92gRz
X-Proofpoint-ORIG-GUID: 5XAp9QFoO9ErigkzPYvY_k_GoJj92gRz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_06,2024-06-27_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 phishscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406270086


On 6/27/2024 4:38 PM, Dmitry Baryshkov wrote:
> On Thu, Jun 27, 2024 at 03:31:01PM GMT, Gokul Sriram P wrote:
>> On 6/27/2024 12:47 AM, Dmitry Baryshkov wrote:
>>> On Tue, Jun 25, 2024 at 11:03:30AM GMT, Gokul Sriram P wrote:
>>>> On 6/22/2024 2:38 AM, Dmitry Baryshkov wrote:
>>>>> On Fri, Jun 21, 2024 at 05:16:52PM GMT, Gokul Sriram Palanisamy wrote:
>>>>>> PRNG clock is needed by the secure PIL, support for the same
>>>>>> is added in subsequent patches.
>>>>> Which 'same'?
>>>>> What is 'secure PIL'?
>>>>     will elaborate in the updated version.
>>>>     To answer your question, secure PIL is signed PIL image which only
>>>> TrustZone can authenticate and load.
>>> Fine. So, the current driver can not load WCSS firmware on IPQ8074, is
>>> that correct? Or was there some kind of firmware interface change? The
>>> driver was added in 2018, so I can only hope that at that point it
>>> worked. Could you please explain, what happened?
>> The existing wcss driver can load unsigned PIL images without the
>> involvement of TrustZone. That works even now.
>> With the current change, we are trying to add signed PIL as an option based
>> on "wcss->need_mem_protection" if set. For signed PIL alone, we send a PAS
>> request to TrustZone to authenticate and load.
> I see that you are enabling it unconditionally for IPQ8074. How is it
> going to work?

Correct Dmitry. In this change, it is forcing secure PIL. With a 
separate driver for secure PIL, this will be sorted right?

Regards,

Gokul

>> I also just noticed that Bjorn had suggested to submit a new driver for the
>> PAS based IPQ WCSS instead of overloading this driver. Will also address
>> that and post a new driver in updated revision.
>>
>> Regards,
>> Gokul
>>>>>> Signed-off-by: Nikhil Prakash V <quic_nprakash@quicinc.com>
>>>>>> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
>>>>>> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
>>>>>> ---
>>>>>>     drivers/remoteproc/qcom_q6v5_wcss.c | 65 +++++++++++++++++++++--------
>>>>>>     1 file changed, 47 insertions(+), 18 deletions(-)

