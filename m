Return-Path: <linux-arm-msm+bounces-56345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C774AA5885
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 01:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B367A17E3AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 23:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F4082228C8D;
	Wed, 30 Apr 2025 23:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocKlaSSf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1D8227BB9
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 23:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746054875; cv=none; b=eo6IfSHQojoKW7/VHbBlid3wYXE3uV3Qtzk3Tb5B6cAb2f1oLI129VyNOCUixVSnX5knFtm+IhMz1JxJ6NcKMtAJZDFiVJ8WxYV+xpayXve37LZOooa5Y1ly/fA0mXuzN4R1oyyp187dcv5zJuoM1yx6oLTXNZDwMfkZdHg2zxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746054875; c=relaxed/simple;
	bh=FEmLQ11wrFZLq6mKOv6Sba4anrIgWdtIuytec+iM+T8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bSTJA/5zpR9j2MpjZWDO0ePhzC8T7lWqu8grC3syS41ouTQ8SSKFi9PsOXY+SpUcLpvZGDUHCRWNwHSPAaq31T5HJxHd8Q55Z3Yy/FoJQdf3thlgBLxms8ZAZE2pouNxMM5SD9wb8i3gdoxgsE9h0RirsnUdN8eKC0kOodx6ZG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocKlaSSf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UGpJdf015145
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 23:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	odCpJRBkGnkQbAVJ54CCIY9nGqNy0fI6XSD+YjlnOUM=; b=ocKlaSSf4rZznEqF
	Klk2nTYXgyM3yQqj0f+HHnqeMnyaKhX9F/PL7MT8U3PlpTTYxW29GL+T5iVYdm1Z
	8h0sKJ7XCboBile201QJ1663cBiIuXyFFXHQY35X7vAEB5svVQz6bbMt4GKCAXr5
	dOycvaSdxCpakKgmaTYZGOVPx7+eJGZjlFGEsU+mtsZ/sGkmecsfqT8byFM+6NOT
	+PLPiwcOgMPwixoXM776MycPPlFAK2eY890GaZV7LU5OtnhZcK4jfPrRY1fKRvJG
	OWxvhGuPRJyE+BozIqzNCKgAd8qKKC46dplxCtyecTpR2zzHar4qBCbA5ExWNol3
	GhYpKg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubkwfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 23:14:32 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b16b35ea570so341819a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 16:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746054871; x=1746659671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odCpJRBkGnkQbAVJ54CCIY9nGqNy0fI6XSD+YjlnOUM=;
        b=GZ6JQMb1wCPUg71j3rB/NatY0Xg6cEjl/OYFbFAzEwBPPMceO9AvOc1hPGfOm7l7yT
         tQd6H1ZEOsCbIJfNmQmrBLV6rm7tuTR86UYeRW4pNlHlkbbbx2YltsWSfmhyhdZ/jFMi
         msJ6VVpHBTQXX1ukqb4YzB6iKmYVf+SSTuxeB9inum4qMaD0PYwbiCkxFzHknvsB+/vM
         21bLRVUYSONBuSA/TkiyezJTO7MsBUv3JlFRdki2hIyh/rG/YiqZSP9ip0TgPCeQoC5m
         CFuO2MrHFUNRHXLshVNCd+v3CULFHWdhbdMMfp1ZCNXfOnf2qT/Z4YcVhKOfwLcsy32M
         CaFg==
X-Gm-Message-State: AOJu0Yy91Cq4zyHq4Iue0s0JyGvHcTJ13PXp2vY/nJnZVATyt7eJuMy4
	o3LzIA6t8tfxRdyuL+sFDLi1oiJXY66LP6elErrz1GV4/sjtlgAilOrXMhgkio1gDnYQpreC5gR
	bR5P3WMCqU7F08dvD/lLtLLp6xVrpTVqYjI1wX9NZwwuVr8evJ9XFv5Wu8pNMDM8i/2CxYns=
X-Gm-Gg: ASbGnctc2sz9Nh9xxMaEm5G93jM4XBZ4z4Vs16Rr7yDGqkjnRdJ09at91J4TJ3csAmD
	ghUrqbjy6lOtqqCdbaFsIUYR/4SnTkZQXMZR1GrljNRuNStwDuAJWJvx4+85Va4WShHQnigtMSI
	54qxU/ofsXNBR1IQXYpDzQSt1G7MrP1vZ2o/U03WwgkrWoCWfCSzcrEc+5CP6PPrc6Y8VnyDcMG
	DBTZOc8cCh2cPH/mP4rfEFxGiwD9lSS+c6kMX8fC23c1A8uOprGh+Vkb9w9tDhmxOfzFNyuxdT+
	8JlEUpwlDpz2bqpyE4SQ5w7cH27K8cNkRF6y/+mFas650t8MSjX+bF4AupOQgyLp4vvH8FNbGIO
	LaiRxnBfCEA==
X-Received: by 2002:a17:903:1a8d:b0:224:1c41:a4bc with SMTP id d9443c01a7336-22e08429b31mr5652735ad.12.1746054871027;
        Wed, 30 Apr 2025 16:14:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMYLGkrCoGsf8O1o1c38XJ3QdnATZaLR6dCLDwA6FQ9TVDkH5bWY3cAJLlloAMZ3VnSyvqFw==
X-Received: by 2002:a17:903:1a8d:b0:224:1c41:a4bc with SMTP id d9443c01a7336-22e08429b31mr5652325ad.12.1746054870632;
        Wed, 30 Apr 2025 16:14:30 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7c5asm128540485ad.122.2025.04.30.16.14.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 16:14:30 -0700 (PDT)
Message-ID: <40e28045-7b27-4f7b-8c57-51127fb4e062@oss.qualcomm.com>
Date: Thu, 1 May 2025 09:14:21 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
To: neil.armstrong@linaro.org, Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
 <3c4e3ed8-ceaf-45c7-a52c-dc7b8209418b@linaro.org>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <3c4e3ed8-ceaf-45c7-a52c-dc7b8209418b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PX5A7PIgVUYIhd6__IYbvBJiePXMp0nE
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=6812aed8 cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=LnoSvLFi0Bb5zeF9BfQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDE3MyBTYWx0ZWRfX5CBJUv9AA0Cw qv6alzBvAmYzcy2+8vmM8e2Ckg1kZ+m2BKyopAs4yBC/Q8AgFZ5UAiy58AYzRRHxXS3COjexmdR XjLoAIVmN6v0jOWa6hvvUChO3Kz5ZrvGUMvgVYdjD8YjinsULkQxVpYHzBMYojbH1jsR+ISqgYz
 Wj9MpcFGhEKgO567cXIgBLj81Lp8sisudm3Hq/3/kPOYoUPLDUJQmndaKuu6lbKqfyXIP25aTcX T1dFZpm0Lg3UDRwqyoAidnwYFR1nD5ktGBFD9MjV+xtxeYKmROfgjYo8NBtmrhlfojOSHJr9CMh X5A6qm9mEEX2L7Oi1EcQT5zuzoEJy3tpkTDr1du0PHwrn2e0Icvq/1nz93TriqpcnUKx59gcX6z
 5lurm1/ADGqDIrUpSbB/76DQX8xXgPreL3GWDHOlSMOXp1aq/bEGV0H2KPrxhSJ1wJirsFvv
X-Proofpoint-ORIG-GUID: PX5A7PIgVUYIhd6__IYbvBJiePXMp0nE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300173

Hi Neil,

On 4/29/2025 11:01 PM, neil.armstrong@linaro.org wrote:
> On 29/04/2025 08:06, Amirreza Zarrabi wrote:
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
>>    - TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_*
>>    - TEE_IOC_OBJECT_INVOKE
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
>> available in [PATCH 11/11] Documentation: tee: Add Qualcomm TEE driver.
>>
>> You can run basic tests with following steps:
>> git clone https://github.com/quic/quic-teec.git
>> cd quic-teec
>> mkdir build
>> cmake .. -DCMAKE_TOOLCHAIN_FILE=CMakeToolchain.txt -DBUILD_UNITTEST=ON
>>
>> https://github.com/quic/quic-teec/blob/main/README.md lists dependencies
>> needed to build the above.
>>
>> This series has been tested for basic QTEE object invocations and
>> callback requests, including loading a TA and requesting services form
>> the TA.
>>
>> Tested platforms: sm8650-mtp
>>
>> [1] https://www.kernel.org/doc/Documentation/tee.txt
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>
>> Changes in v4:
>> - Move teedev_ctx_get/put and tee_device_get/put to tee_core.h.
>> - Rename object to id in struct tee_ioctl_object_invoke_arg.
>> - Replace spinlock with mutex for qtee_objects_idr.
>> - Move qcomtee_object_get to qcomtee_user/memobj_param_to_object.
>> - More code cleanup following the comments.
>> - Cleanup documentations.
>> - Update MAINTAINERS file.
>> - Link to v3: https://lore.kernel.org/r/20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com
>>
>> Changes in v3:
>> - Export shm_bridge create/delete APIs.
>> - Enable support for QTEE memory objects.
>> - Update the memory management code to use the TEE subsystem for all
>>    allocations using the pool.
>> - Move all driver states into the driver's main service struct.
>> - Add more documentations.
>> - Link to v2: https://lore.kernel.org/r/20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com
>>
>> Changes in v2:
>> - Clean up commit messages and comments.
>> - Use better names such as ubuf instead of membuf or QCOMTEE prefix
>>    instead of QCOM_TEE, or names that are more consistent with other
>>    TEE-backend drivers such as qcomtee_context_data instead of
>>    qcom_tee_context.
>> - Drop the DTS patch and instantiate the device from the scm driver.
>> - Use a single structure for all driver's internal states.
>> - Drop srcu primitives and use the existing mutex for synchronization
>>    between the supplicant and QTEE.
>> - Directly use tee_context to track the lifetime of qcomtee_context_data.
>> - Add close_context() to be called when the user closes the tee_context.
>> - Link to v1: https://lore.kernel.org/r/20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com
>>
>> Changes in v1:
>> - It is a complete rewrite to utilize the TEE subsystem.
>> - Link to RFC: https://lore.kernel.org/all/20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com
>>
>> ---
>> Amirreza Zarrabi (11):
>>        tee: allow a driver to allocate a tee_device without a pool
>>        tee: add close_context to TEE driver operation
>>        tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
>>        tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
>>        firmware: qcom: scm: add support for object invocation
>>        firmware: qcom: scm: remove unused arguments to the shm_brige
>>        firmware: qcom: tzmem: export shm_bridge create/delete
>>        tee: add Qualcomm TEE driver
>>        qcomtee: add primordial object
>>        qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
>>        Documentation: tee: Add Qualcomm TEE driver
>>
>>   Documentation/tee/index.rst              |   1 +
>>   Documentation/tee/qtee.rst               | 150 ++++++
>>   MAINTAINERS                              |   8 +
>>   drivers/firmware/qcom/qcom_scm.c         | 132 ++++-
>>   drivers/firmware/qcom/qcom_scm.h         |   7 +
>>   drivers/firmware/qcom/qcom_tzmem.c       |  57 ++-
>>   drivers/tee/Kconfig                      |   1 +
>>   drivers/tee/Makefile                     |   1 +
>>   drivers/tee/qcomtee/Kconfig              |  10 +
>>   drivers/tee/qcomtee/Makefile             |  11 +
>>   drivers/tee/qcomtee/async.c              | 160 ++++++
>>   drivers/tee/qcomtee/call.c               | 770 +++++++++++++++++++++++++++++
>>   drivers/tee/qcomtee/core.c               | 815 +++++++++++++++++++++++++++++++
>>   drivers/tee/qcomtee/mem_obj.c            | 172 +++++++
>>   drivers/tee/qcomtee/primordial_obj.c     | 115 +++++
>>   drivers/tee/qcomtee/qcom_scm.c           |  38 ++
>>   drivers/tee/qcomtee/qcomtee_msg.h        | 239 +++++++++
>>   drivers/tee/qcomtee/qcomtee_private.h    | 264 ++++++++++
>>   drivers/tee/qcomtee/release.c            |  48 ++
>>   drivers/tee/qcomtee/shm.c                | 146 ++++++
>>   drivers/tee/qcomtee/user_obj.c           | 713 +++++++++++++++++++++++++++
>>   drivers/tee/tee_core.c                   | 127 ++++-
>>   drivers/tee/tee_private.h                |   6 -
>>   include/linux/firmware/qcom/qcom_scm.h   |  31 +-
>>   include/linux/firmware/qcom/qcom_tee.h   | 302 ++++++++++++
>>   include/linux/firmware/qcom/qcom_tzmem.h |  15 +
>>   include/linux/tee_core.h                 |  54 +-
>>   include/linux/tee_drv.h                  |  12 +
>>   include/uapi/linux/tee.h                 |  54 +-
>>   29 files changed, 4427 insertions(+), 32 deletions(-)
>> ---
>> base-commit: 33035b665157558254b3c21c3f049fd728e72368
>> change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527
>>
>> Best regards,
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> 
> # /unittest -d
> [test_print_diagnostics_info][52] 831360          = Total bytes as heap
> [test_print_diagnostics_info][53] 111707          = Total bytes allocated from heap
> [test_print_diagnostics_info][54] 700160          = Total bytes free on heap
> [test_print_diagnostics_info][55] 15280           = Total bytes overhead
> [test_print_diagnostics_info][56] 4213            = Total bytes wasted
> [test_print_diagnostics_info][57] 454160          = Largest free block size
> 
> [test_print_diagnostics_info][60] SUCCESS.
> # /unittest -l / /smcinvoke_skeleton_ta64.mbn 0
> [test_read_file][246] File //smcinvoke_skeleton_ta64.mbn, size: 32856 Bytes.
> [test_load_sample_ta][199] SUCCESS.
> 
> Thanks,
> Neil

Thanks Neil for the tests.

Regards,
Amir



