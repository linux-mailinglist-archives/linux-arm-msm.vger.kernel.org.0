Return-Path: <linux-arm-msm+bounces-42698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC3A9F6E14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 20:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91FD11645DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 19:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196DC1FAC5F;
	Wed, 18 Dec 2024 19:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fEKyjMp6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C79B3597C;
	Wed, 18 Dec 2024 19:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734549618; cv=none; b=WlM2EhI9VOrng8FIeB3syNMfdCWhClZCM5TwWUabER6eOCv2jYojXsoGiA/BL6QrrChx0vFiZp1504E246A18+S4jHJ6RGRgDv62TEfYDX1GE+ij3yY487hIB+wVeKzN2jScZPUTphNTO0AzF9Hi8ULR6IGtqsiNQL1DQVTDxDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734549618; c=relaxed/simple;
	bh=caUkMxVhqQWa5iTvO7HMlyIRSdHx+kjQZZVGHrC3cts=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LewGlel4quzbcAkruIhVVMm/b6FyyYx1m1KwTA/12+yDWkacBDTivbqraj+nJJaqzGDx69+9teIuMOkxcdLOZMH9OV8KsYIr/ZNu0JeFTiFEvCiVBGXUDeXRChgblFPIP5TvvprKZt6xAhEH63Y6yvxW0oBbcn/FIdJSZ9mx7mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fEKyjMp6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIGQx4l000411;
	Wed, 18 Dec 2024 19:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DFn18BS63u4upfYlKrniHPEK0vBM6OeD2QpgjhouNKQ=; b=fEKyjMp6/swS002L
	6gH8mpWCqkv89mv5CNbyolvex7F0k6ysXKbYd0KqgEZ/oh3KpvWmA66vlZ98k72h
	67yLtV2heAPi0OAuRgCk9yJdxvK3ud77pgkcnc3hDU/RYAcOYgjuVZlWNesVtKnF
	TfOmcKssz0MNP/AcH2n+4flBob4aiOkuL4PX34vaEpHrtAEa9EffD24vUGFgmdvj
	kYytCWybX/9B5gsL0qUSg6S8RiQNC8PO3tS/85aidIL9mtm1ZIAwWcoi1M/w+BYf
	H4g5vfGHHyL8RlO+aoHZgtmtFBlVrG9uACxBAaheoMHKp1wHm3xn93h4WVh1tFb+
	KGJW7A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m0su8n7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 19:20:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BIJK9YS002182
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 19:20:09 GMT
Received: from [10.4.85.30] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 11:20:06 -0800
Message-ID: <14ecefd5-85a1-4cd1-84e4-a2af241bffe2@quicinc.com>
Date: Thu, 19 Dec 2024 06:20:04 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Trusted Execution Environment (TEE) driver for
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
References: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
 <CAFA6WYMbDExfCD4PAPQCF1HKKxjDH5FcLpnnBBrwayCiY0SkTg@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
In-Reply-To: <CAFA6WYMbDExfCD4PAPQCF1HKKxjDH5FcLpnnBBrwayCiY0SkTg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3QbuXpw9GiIIQq0UP5-hIZZ7onb9pIap
X-Proofpoint-ORIG-GUID: 3QbuXpw9GiIIQq0UP5-hIZZ7onb9pIap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 phishscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180149

Hi Sumit,

On 12/19/2024 1:25 AM, Sumit Garg wrote:
> Hi Amirreza,
> 
> On Tue, 3 Dec 2024 at 09:50, Amirreza Zarrabi <quic_azarrabi@quicinc.com> wrote:
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
> 
> Thanks for proposing to extend the TEE subsystem. However, I couldn't
> see any user-space library or test application(s) to test this new
> IOCTL. Say for example how will someone with a board based on sm8650
> will be able to test the QTEE interface? IIRC, last time we agreed off
> list that you will be pushing that alongside this patch-set.
> 

:)
Indeed. The upcoming version of this patch series will include a library
and a test application.

Best Regards,
Amir

> -Sumit
> 
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
>> This patch series has been tested for basic QTEE object invocations and
>> callback requests, including loading a TA and requesting services form
>> the TA. However, the test platform is currently being prepared for
>> upstream availability and will soon be accessible to the community for
>> further validation. I will share updates as the platform become
>> available.
>>
>> [1] https://www.kernel.org/doc/Documentation/tee.txt
>>
>> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
>> ---
>> Amirreza Zarrabi (10):
>>       tee: allow a driver to allocate a tee_device without a pool
>>       tee: add TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF
>>       tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
>>       firmware: qcom: scm: add support for object invocation
>>       qcomtee: implement object invoke support
>>       qcomtee: add primordial object
>>       dt-bindings: arm: qcomtee: add QTEE driver devicetree binding for TEE subsystem
>>       tee: add Qualcomm TEE driver
>>       arm64: dts: qcom: sm8650: add support for QTEE
>>       Documentation: tee: Add Qualcomm TEE driver
>>
>>  .../devicetree/bindings/arm/firmware/qcom,tee.yaml |  34 +
>>  Documentation/tee/index.rst                        |   1 +
>>  Documentation/tee/qtee.rst                         | 143 ++++
>>  arch/arm64/boot/dts/qcom/sm8650.dtsi               |   4 +
>>  drivers/firmware/qcom/qcom_scm.c                   |  60 ++
>>  drivers/firmware/qcom/qcom_scm.h                   |   7 +
>>  drivers/tee/Kconfig                                |   1 +
>>  drivers/tee/Makefile                               |   1 +
>>  drivers/tee/qcomtee/Kconfig                        |  10 +
>>  drivers/tee/qcomtee/Makefile                       |   9 +
>>  drivers/tee/qcomtee/async.c                        | 153 ++++
>>  drivers/tee/qcomtee/call.c                         | 707 ++++++++++++++++
>>  drivers/tee/qcomtee/core.c                         | 942 +++++++++++++++++++++
>>  drivers/tee/qcomtee/primordial_obj.c               |  63 ++
>>  drivers/tee/qcomtee/qcom_scm.c                     |  36 +
>>  drivers/tee/qcomtee/qcomtee_msg.h                  | 217 +++++
>>  drivers/tee/qcomtee/qcomtee_private.h              | 218 +++++
>>  drivers/tee/qcomtee/release.c                      |  66 ++
>>  drivers/tee/qcomtee/user_obj.c                     | 625 ++++++++++++++
>>  drivers/tee/tee_core.c                             | 113 ++-
>>  include/linux/firmware/qcom/qcom_scm.h             |   9 +
>>  include/linux/firmware/qcom/qcom_tee.h             | 284 +++++++
>>  include/linux/tee_core.h                           |   4 +
>>  include/linux/tee_drv.h                            |  12 +
>>  include/uapi/linux/tee.h                           |  54 +-
>>  25 files changed, 3765 insertions(+), 8 deletions(-)
>> ---
>> base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
>> change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527
>>
>> Best regards,
>> --
>> Amirreza Zarrabi <quic_azarrabi@quicinc.com>
>>

