Return-Path: <linux-arm-msm+bounces-47329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E329A2E069
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 21:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFE183A39A3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 20:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728951E3780;
	Sun,  9 Feb 2025 20:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A3A4E1Nm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D061E32DB;
	Sun,  9 Feb 2025 20:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739132336; cv=none; b=lkFZfRFJfFil6nXG6sV8ZKuPYsiU919jwppqcYL1XBNa8Z6qD2NExq9GQhEopTNHSD3Q8vDP+666v+6LEl2IOCY5NtN0d8U38+bTpY25WM1qbIG/sySC2Grwr0/QbPPO5QBnR1s8DI5oZdgnB6F+kKMeJiFj6bVfM96zoqNwTMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739132336; c=relaxed/simple;
	bh=oaYAuK9nmziiscKPZjJxiKNjUuO72j7bI38bgwqkZNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uH7ke5nfKejtDibQSpC2jLX4RIEn8gSZCcAFxnulSNbNqCJ0swrTun8fhFe/jPF5ioT2px+6bto5pFC2XxCeqJgQb0XwS0gRtOlwe8Xs7T2LLCxs5vAxFsaRnX6helQGLQZH1jiDA/1a2QOU75Sg1LgqKgsTL/sn0NMnoxst+EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A3A4E1Nm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519CSr9d002069;
	Sun, 9 Feb 2025 20:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AknllMxznHeV3Ng+slIocpUPoFbsi91x9tjW8w819Nw=; b=A3A4E1Nmk8ckYt1J
	+tWnFRvBgJFFgXpLXOwgGO78Rw/chS7LoymLX9hrT7SnR2Zl/JALdF9eF2qcqvyK
	GsgPgICp37LQ2rARVZZi2m3e1o3kAtxljJSITGL45bVx83CnYID1927oKFdWH6zU
	5n8n9JUf6//cTnmfIn5wHmS8FwLl5/UvOmsRTxU90wo+gUpGsSSqSaZRxTWtPeq3
	6efRX7EKBDHQuvNNTeY8IxPl8eTanRme3yeBbgynD4mqjCWFHgl4GPn81zGHQUDm
	+EN1AdZi8yzv+GSO07w9gHPzLp4KVXR6Z0wTxYs99+0z+KWOng0mzzivCQ8qikhn
	n59eHg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dyjd41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Feb 2025 20:18:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 519KIgTl006393
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 9 Feb 2025 20:18:42 GMT
Received: from [10.4.85.13] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Feb 2025
 12:18:39 -0800
Message-ID: <c4f6f9e0-5a5f-4286-95f1-f01a46d415ee@quicinc.com>
Date: Mon, 10 Feb 2025 07:18:36 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
To: Sumit Garg <sumit.garg@linaro.org>
CC: Jens Wiklander <jens.wiklander@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
References: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com>
 <CAFA6WYNGH_LP-R4hQx-+XMY3zFN74ij-JngwnuKOsz8=r_-bsQ@mail.gmail.com>
 <f3b30e00-d6cd-44ee-88a5-e5a523563bb3@quicinc.com>
 <CAFA6WYMhyDLmFaZMWd3TFfNTnujAN8ZuzguPgzjJXfhZf2ZnKA@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
In-Reply-To: <CAFA6WYMhyDLmFaZMWd3TFfNTnujAN8ZuzguPgzjJXfhZf2ZnKA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2UIILcL5wVtpnW_3GdsSeNZxVrm3IQA1
X-Proofpoint-GUID: 2UIILcL5wVtpnW_3GdsSeNZxVrm3IQA1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-09_09,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502090181



On 2/7/2025 4:12 PM, Sumit Garg wrote:
> On Fri, 7 Feb 2025 at 01:25, Amirreza Zarrabi <quic_azarrabi@quicinc.com> wrote:
>>
>>
>>
>> On 2/5/2025 4:38 PM, Sumit Garg wrote:
>>> Hi Amirreza,
>>>
>>> On Mon, 3 Feb 2025 at 08:14, Amirreza Zarrabi <quic_azarrabi@quicinc.com> wrote:
>>>>
>>>> This patch series introduces a Trusted Execution Environment (TEE)
>>>> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
>>>> and services to run securely. It uses an object-based interface, where
>>>> each service is an object with sets of operations. Clients can invoke
>>>> these operations on objects, which can generate results, including other
>>>> objects. For example, an object can load a TA and return another object
>>>> that represents the loaded TA, allowing access to its services.
>>>>
>>>> Kernel and userspace services are also available to QTEE through a
>>>> similar approach. QTEE makes callback requests that are converted into
>>>> object invocations. These objects can represent services within the
>>>> kernel or userspace process.
>>>>
>>>> Note: This patch series focuses on QTEE objects and userspace services.
>>>>
>>>> Linux already provides a TEE subsystem, which is described in [1]. The
>>>> tee subsystem provides a generic ioctl interface, TEE_IOC_INVOKE, which
>>>> can be used by userspace to talk to a TEE backend driver. We extend the
>>>> Linux TEE subsystem to understand object parameters and an ioctl call so
>>>> client can invoke objects in QTEE:
>>>>
>>>>   - TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_*
>>>>   - TEE_IOC_OBJECT_INVOKE
>>>>
>>>> The existing ioctl calls TEE_IOC_SUPPL_RECV and TEE_IOC_SUPPL_SEND are
>>>> used for invoking services in the userspace process by QTEE.
>>>>
>>>> The TEE backend driver uses the QTEE Transport Message to communicate
>>>> with QTEE. Interactions through the object INVOKE interface are
>>>> translated into QTEE messages. Likewise, object invocations from QTEE
>>>> for userspace objects are converted into SEND/RECV ioctl calls to
>>>> supplicants.
>>>>
>>>> The details of QTEE Transport Message to communicate with QTEE is
>>>> available in [PATCH 10/10] Documentation: tee: Add Qualcomm TEE driver.
>>>>
>>>> You can run basic tests with following steps:
>>>> git clone https://github.com/quic/quic-teec.git
>>>> cd quic-teec
>>>> mkdir build
>>>> cmake .. -DCMAKE_TOOLCHAIN_FILE=CMakeToolchain.txt -DBUILD_UNITTEST=ON
>>>>
>>>> https://github.com/quic/quic-teec/blob/main/README.md lists dependancies
>>>> needed to build the above.
>>>>
>>>> This series has been tested for basic QTEE object invocations and
>>>> callback requests, including loading a TA and requesting services form
>>>> the TA.
>>>
>>> Thanks for sharing these test user-space applications/libraries. Can I
>>> know which platforms are currently supported by this QTEE driver? I
>>> would like to run and understand the overall stack on a real device. I
>>> do have rb3, rb5 and db410c on my desk to test with.
>>>
>>> Also, platform support is important information you should put in the
>>> cover letter as well as the QTEE documentation.
>>>
>>> -Sumit
>>>
>>
>> I have tested it with sm8650-mtp. But would expect it to work with any platform.
> 
> Good to know that I will try to test it by next week on one of the
> available platforms on my desk.
> 
>> I'll update the cover letter with the details :).
> 
> Also, put it in QTEE documentation too such that people are aware
> about supported platforms.
> 

Ack.

> -Sumit


