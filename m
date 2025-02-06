Return-Path: <linux-arm-msm+bounces-47051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A4DA2B2B7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 20:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 091B6188B2F7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 19:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703C61ACED7;
	Thu,  6 Feb 2025 19:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fx65SnyR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADA5156C5E;
	Thu,  6 Feb 2025 19:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871721; cv=none; b=sZL7MlReR0T+ehDhLoeZczZxU9nx54o8gM9P0wWGv0txSd+u05z44cRcF4SCkq2uUJVOZFpmO9C3dHRofI/s9a2FoPNtwkD2C2MuYtiuHMY40VLSgjnuA49Sgb2/BAVWXVgMosuErlRQ4I2ZidU3izu9npDoSK13zGHfYZcNnVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871721; c=relaxed/simple;
	bh=KD3Tivuqec64/cv0h84BpbioMwkWOoscZUAaj+dmMeg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=DEEuu9BfNa5gtA5mIJCJU+fk2dQiKST4aTKjO7WR9LxJxzZuArSFO87FTy+Y4tIcSLz4yl1L+GBC6u48B1GKlFRR4/LuiSA6AZBApgOWfzrf4NHNhlacwpEMCq2PLPty4RiqEtnSMFdBXWGxWnAVUMcACVxYrFqWuDAuQfTTUBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fx65SnyR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516GrTIK019088;
	Thu, 6 Feb 2025 19:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vR/ei5/xB3V8KNV8RDZKjsSFuoqxaN8JLAQUcXW3D7M=; b=Fx65SnyRqqduSNA1
	BJZh8DcobrYU7GaBjnG72/yLRDUeetD0/OFSDyr12BJI/cIvNhcHoTsuRsGQeCnT
	hk0NWf/+fwSF0e5ASNGZLtm75N5dTVwo4wyoolSIZdlz+l8Fi9W3KeOjwIb64Hoe
	OyJ60qBNVOawNspqYq3YFqUjwBVwMX73oPEpNKSQNiVOVQQI3lGW0HodPLsYBDiA
	vWAkxQ0CtHRJoIW+jdbu82YKWz42fyeeuKdVUbM1sv4tmRvaP+Poyz/9ZAu7GvCK
	yv+2iuy6Ilhgl2m8LLyEOaXkkASeO7jbysN+Tx7LsP4v5XgCmcISGGyjAagxeYG2
	JYj9EA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n10h0f01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 19:55:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 516JtD3V020123
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 19:55:13 GMT
Received: from [10.4.85.59] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Feb 2025
 11:55:10 -0800
Message-ID: <f3b30e00-d6cd-44ee-88a5-e5a523563bb3@quicinc.com>
Date: Fri, 7 Feb 2025 06:55:08 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
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
Content-Language: en-US
In-Reply-To: <CAFA6WYNGH_LP-R4hQx-+XMY3zFN74ij-JngwnuKOsz8=r_-bsQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: G-vwhLYrK_AUV9xNpqFC9CQHg7gGbVkK
X-Proofpoint-ORIG-GUID: G-vwhLYrK_AUV9xNpqFC9CQHg7gGbVkK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060157



On 2/5/2025 4:38 PM, Sumit Garg wrote:
> Hi Amirreza,
> 
> On Mon, 3 Feb 2025 at 08:14, Amirreza Zarrabi <quic_azarrabi@quicinc.com> wrote:
>>
>> This patch series introduces a Trusted Execution Environment (TEE)
>> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
>> and services to run securely. It uses an object-based interface, where
>> each service is an object with sets of operations. Clients can invoke
>> these operations on objects, which can generate results, including other
>> objects. For example, an object can load a TA and return another object
>> that represents the loaded TA, allowing access to its services.
>>
>> Kernel and userspace services are also available to QTEE through a
>> similar approach. QTEE makes callback requests that are converted into
>> object invocations. These objects can represent services within the
>> kernel or userspace process.
>>
>> Note: This patch series focuses on QTEE objects and userspace services.
>>
>> Linux already provides a TEE subsystem, which is described in [1]. The
>> tee subsystem provides a generic ioctl interface, TEE_IOC_INVOKE, which
>> can be used by userspace to talk to a TEE backend driver. We extend the
>> Linux TEE subsystem to understand object parameters and an ioctl call so
>> client can invoke objects in QTEE:
>>
>>   - TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_*
>>   - TEE_IOC_OBJECT_INVOKE
>>
>> The existing ioctl calls TEE_IOC_SUPPL_RECV and TEE_IOC_SUPPL_SEND are
>> used for invoking services in the userspace process by QTEE.
>>
>> The TEE backend driver uses the QTEE Transport Message to communicate
>> with QTEE. Interactions through the object INVOKE interface are
>> translated into QTEE messages. Likewise, object invocations from QTEE
>> for userspace objects are converted into SEND/RECV ioctl calls to
>> supplicants.
>>
>> The details of QTEE Transport Message to communicate with QTEE is
>> available in [PATCH 10/10] Documentation: tee: Add Qualcomm TEE driver.
>>
>> You can run basic tests with following steps:
>> git clone https://github.com/quic/quic-teec.git
>> cd quic-teec
>> mkdir build
>> cmake .. -DCMAKE_TOOLCHAIN_FILE=CMakeToolchain.txt -DBUILD_UNITTEST=ON
>>
>> https://github.com/quic/quic-teec/blob/main/README.md lists dependancies
>> needed to build the above.
>>
>> This series has been tested for basic QTEE object invocations and
>> callback requests, including loading a TA and requesting services form
>> the TA.
> 
> Thanks for sharing these test user-space applications/libraries. Can I
> know which platforms are currently supported by this QTEE driver? I
> would like to run and understand the overall stack on a real device. I
> do have rb3, rb5 and db410c on my desk to test with.
> 
> Also, platform support is important information you should put in the
> cover letter as well as the QTEE documentation.
> 
> -Sumit
> 

I have tested it with sm8650-mtp. But would expect it to work with any platform.
I'll update the cover letter with the details :).

- Amir

>>
>> [1] https://www.kernel.org/doc/Documentation/tee.txt
>>
>> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
>> ---
>> Changes in v2:
>> - Clean up commit messages and comments.
>> - Use better names such as ubuf instead of membuf or QCOMTEE prefix
>>   instead of QCOM_TEE, or names that are more consistent with other
>>   TEE-backend drivers such as qcomtee_context_data instead of
>>   qcom_tee_context.
>> - Drop the DTS patch and instantiate the device from the scm driver.
>> - Use a single structure for all driver's internal states.
>> - Drop srcu primitives and use the existing mutex for synchronization
>>   between the supplicant and QTEE.
>> - Directly use tee_context to track the lifetime of qcomtee_context_data.
>> - Add close_context() to be called when the user closes the tee_context.
>> - Link to v1: https://lore.kernel.org/r/20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com
>>
>> Changes in v1:
>> - It is a complete rewrite to utilize the TEE subsystem.
>> - Link to RFC: https://lore.kernel.org/all/20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com
>>
>> ---
>> Amirreza Zarrabi (8):
>>       tee: allow a driver to allocate a tee_device without a pool
>>       tee: add close_context to TEE driver operation
>>       tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
>>       tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
>>       firmware: qcom: scm: add support for object invocation
>>       tee: add Qualcomm TEE driver
>>       qcomtee: add primordial object
>>       Documentation: tee: Add Qualcomm TEE driver
>>
>>  Documentation/tee/index.rst            |   1 +
>>  Documentation/tee/qtee.rst             | 150 ++++++
>>  drivers/firmware/qcom/qcom_scm.c       | 128 ++++++
>>  drivers/firmware/qcom/qcom_scm.h       |   7 +
>>  drivers/tee/Kconfig                    |   1 +
>>  drivers/tee/Makefile                   |   1 +
>>  drivers/tee/qcomtee/Kconfig            |  10 +
>>  drivers/tee/qcomtee/Makefile           |  10 +
>>  drivers/tee/qcomtee/async.c            | 160 +++++++
>>  drivers/tee/qcomtee/call.c             | 741 ++++++++++++++++++++++++++++++
>>  drivers/tee/qcomtee/core.c             | 810 +++++++++++++++++++++++++++++++++
>>  drivers/tee/qcomtee/primordial_obj.c   |  65 +++
>>  drivers/tee/qcomtee/qcom_scm.c         |  36 ++
>>  drivers/tee/qcomtee/qcomtee_msg.h      | 234 ++++++++++
>>  drivers/tee/qcomtee/qcomtee_private.h  | 226 +++++++++
>>  drivers/tee/qcomtee/release.c          |  59 +++
>>  drivers/tee/qcomtee/shm.c              | 102 +++++
>>  drivers/tee/qcomtee/user_obj.c         | 712 +++++++++++++++++++++++++++++
>>  drivers/tee/tee_core.c                 | 121 ++++-
>>  drivers/tee/tee_private.h              |   6 -
>>  include/linux/firmware/qcom/qcom_scm.h |  27 ++
>>  include/linux/firmware/qcom/qcom_tee.h | 286 ++++++++++++
>>  include/linux/tee_core.h               |  15 +-
>>  include/linux/tee_drv.h                |  18 +
>>  include/uapi/linux/tee.h               |  54 ++-
>>  25 files changed, 3964 insertions(+), 16 deletions(-)
>> ---
>> base-commit: dab2734f8e9ecba609d66d1dd087a392a7774c04
>> change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527
>>
>> Best regards,
>> --
>> Amirreza Zarrabi <quic_azarrabi@quicinc.com>
>>


