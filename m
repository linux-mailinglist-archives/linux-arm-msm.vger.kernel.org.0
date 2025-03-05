Return-Path: <linux-arm-msm+bounces-50317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C98AA4F7F6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 08:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 771BB1887618
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 07:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A311E5B74;
	Wed,  5 Mar 2025 07:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nQ9rInBa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3E341C92;
	Wed,  5 Mar 2025 07:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160046; cv=none; b=TGLNdaNL6Np2Zqb7WF54vQp5u7YFiOAG/U7CQeyPum1W5Zw+F930dvMVTNzpJes0Pv4/PfDFLT37PpzyMZHRg1j5J+9brJkvLtZIM3cXXmOtS3vwAK93dUsAChan2jfIJIZM93BZmaN9bT7i+knImacX2giMgPimPCVfzE4WgzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160046; c=relaxed/simple;
	bh=XEGSmpn2aHGdVbjCkRrNxXXTUI+JIObF9Ktsf8Iuaz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nSl0TBtmhc5zqkhxhIpdmaIQcIjxK1vhFEk4TenzH7TfHYUcVTVQgqFGr62T0V/20gjv0beMPG0QuM6F7PoAuZ7vP6t74Et6nKhVlAJFdEs3YyYO3QMC5XsVnsq5nMi0g7MAJ6AfBS6G0hcnZu1bBfeCmSPvYsAMKwCsmaufYKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nQ9rInBa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NA1TR012504;
	Wed, 5 Mar 2025 07:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hkbd+w83jA6vLO9ch5oNuqVahKhyrbFYg9Yesc5oBOs=; b=nQ9rInBagpCMC0i8
	RP7f1KLdZK69iksb2wv7YZQ5qWKjQ3CqN1mWXSCXO5kS/QFwzlLSLYEQXzM8MRZD
	EQGTLryFpULb2Mw3GInIWgrWxDDWqj57g5kSXpKGOoLOd7pq4oF5ms4tMKR1H216
	8XDpLrVmFsJzVyuVn9aCq5INVQiIu9aW2RUwTKuPeseHblRJdwLkNbOdXIKuAeBn
	uLAbvF8jAN/TOJpA9EbQG6V05My/zdZfBe245wgTfXh2r7oorbNY2m5/2cgzMqhH
	TCl2O5ztAvRz6bUfwqQ+umR61P8mXwkD62fJEG6baPEcThalvq1RLxWbslFz+Enm
	tAz7Dg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6wmf83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 07:34:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5257XxTc028396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 07:33:59 GMT
Received: from [10.216.38.32] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 23:33:55 -0800
Message-ID: <60b2e0d3-bd95-47bf-ab02-edae8b86c392@quicinc.com>
Date: Wed, 5 Mar 2025 13:03:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox
 driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <manivannan.sadhasivam@linaro.org>
References: <20250228045356.3527662-1-quic_srichara@quicinc.com>
 <20250228045356.3527662-3-quic_srichara@quicinc.com>
 <lakoxihaqlu3vq42eoqtlip23ggdieizotyzax5up5n6ndbwsi@ddqyzvsdtmkv>
 <1359984c-2ace-450b-a3ff-bac0b9fb5cc9@quicinc.com>
 <2xpu26pu4ovnchumwx7xzlp2gldpfgsurnhuqaioygb4a6xmsp@ygmpk6furqs6>
 <3e326578-ab46-4d7e-ad1e-3d572613498b@quicinc.com>
 <CAA8EJppXHXafwx+GPh0UhFLRLW5DNj8RwXdO4+fDdXp=SE13Uw@mail.gmail.com>
 <f8efc961-2fbe-496b-93d2-55f9072bd08c@oss.qualcomm.com>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <f8efc961-2fbe-496b-93d2-55f9072bd08c@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EZcyQOmC c=1 sm=1 tr=0 ts=67c7fe68 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=x5kFa4O9RGVme2nmDfEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Vgg5Kig8y_noRb9aTM1MItbPiMledeJN
X-Proofpoint-ORIG-GUID: Vgg5Kig8y_noRb9aTM1MItbPiMledeJN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_03,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=796 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050059



On 3/4/2025 10:16 PM, Konrad Dybcio wrote:
> On 4.03.2025 10:46 AM, Dmitry Baryshkov wrote:
>> On Tue, 4 Mar 2025 at 10:33, Sricharan Ramabadhran
>> <quic_srichara@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 3/3/2025 6:34 PM, Dmitry Baryshkov wrote:
>>>> On Mon, Mar 03, 2025 at 03:58:42PM +0530, Sricharan Ramabadhran wrote:
>>>>>
>>>>>
>>>>> On 2/28/2025 12:03 PM, Dmitry Baryshkov wrote:
>>>>>> On Fri, Feb 28, 2025 at 10:23:56AM +0530, Sricharan R wrote:
>>>>
>>>>>>> +          dev_err(dev, "Failed with status: %d\n", msg.resp.status);
>>>>>>> +          ret = msg.resp.status;
>>>>>>
>>>>>> return msg.resp.status (is it really errno?)
>>>>>>
>>>>> ok, yes error.
>>>>
>>>> The question was if it is an errno, not if it is an error.
>>> status != 0 is an error always.
>>
>> Is it an _errno_ ?
> 
> Dmitry's asking whether the status conforms to the Linux's errno.h
> ABI. If not, add something like:
> 
> ret = msg.resp.status ? -EINVAL : 0
Yeah, responded on other thread. It does not, so will add the mapping.

Regards,
Sricharan

