Return-Path: <linux-arm-msm+bounces-72876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A823BB50797
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 23:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 984F31C6382B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 21:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852481C3C11;
	Tue,  9 Sep 2025 21:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PxPB7rPQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5F4225D6
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 21:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757451615; cv=none; b=FrUfGEisTCSHFU9FYbU9lEJzjfUUTdyxK96Pfhm3K0vvCbaeSC+wOxS+d365930ZKLwv0n0YRfuOAgolIUn20rpUvxKWG/fHarzJkJT0tXIDfzCSO+pxv6SpWgLEYrWBeUbVJZTv9T7Oj4HBVvRNVfzkn9RWSPL2rjIjlFSGhQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757451615; c=relaxed/simple;
	bh=8V4Bhzzvs9zygxGz2U+YuP2tINhCtsLXcU+asmS+6Ss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L2DcXmbOHGF+0aVU4EX0sC/BiW6T1kzJaBy6w/fyxXWA7T2DTigbHpngbZh6fTIQzV4iuwVC6Mq/hgykXbRTZwqmas+QnZl38dKqAbTVY8dD1ann7ZW2o6LGC5MI1KMz3I8V+pmmS6PaskWJIIMBHKDx2eE5R4o72nDDqUBb8No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PxPB7rPQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HVFB8029169
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 21:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xla17iJicYpKev/QNXdqc8YcoWYyLjkenruSMyyFfa8=; b=PxPB7rPQ4svcQSZQ
	QyjZu2uiYaqvb9a3H+sQlwH/5aiW1bSUw8kNNgxFWy+b2mR2E4Hp6ba6fVtdeDWm
	B9Gx7XeuECSawjDilO8l0S+3x3iyDC+KVq3kMIgeWINY26JtjPKxqCyBf6dS9dzC
	eDu3YbukAeyf1AaVu+/9Z7I4LTNL69l2SV7OlLtbqTPXhDFepWKgNWL68ohRVfJE
	xqsCzivs5cBK6Wurfcc8FkW7kbbk6hxdbrvf5OfQz3O+3pKUDr5eyHE0ds+xafEm
	Io+Wl0E0nTmWYVaTAZZryYK6sbemW2M1j96xRtzrnC/AbrKh0ULjeqnV12JtGLUa
	KBAtzg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8hp3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 21:00:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7722ef6c864so5663785b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 14:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757451605; x=1758056405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xla17iJicYpKev/QNXdqc8YcoWYyLjkenruSMyyFfa8=;
        b=JETXRGevlk8s0pp0GJ0KyhcCmGJKf9FrDkSpte/6gA1kNXARpmSNlV4zQ7yd+h/2ir
         ssWfsoPtJRDZ2dGvoMFaKn/t+aoRKR9reRzKuaSG37XdIAFGulfTRq7HCCZMNOjT7zVR
         aPV5UIU8lbhIBAiOmhmdjZBP1l94iNyF0GLlARBDoykdsmedCy61xhbvjNMRR0Ih52PT
         0i8PozyMg9Jt+ekVNq0aHRHJVMQh4IpMNy3SYEroHqV/macE9aJwOfdRE+XWb6mS/OmE
         wZG1pFhjjAncfWByU+aVs8m3wtZcLllzS7Op7n7uu7r4GQJR+rzDHK7wpN8P0T7zIVhe
         NlvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh4YcbKTX1x9y24FAU4ZHISPrBVGfbpE7t7s0o3s8Q6odAF9/NsbyocXgkGv0T96WW6XXd3nFdgNf/mj9K@vger.kernel.org
X-Gm-Message-State: AOJu0YyyJIDFGGLkBULH3fogMUny/kaC6pt8TpAhQxMY83nnWptDzGXy
	FcYjymx9dEtxekqBs3VKwZrtLHUGqxQaxtIRJ3vbBRYySt7Uzwgft2MXV2sEThPHHtP6j/Tmhcg
	amA5/B9VjLGZQNqtMpFJ9l7eK166HfUZc46aduLHno54ruxqVq2lf3bvOhxGB2HVlN9I=
X-Gm-Gg: ASbGncuzeepjw+QjcI8WDr8XPvRmiWFYkJdBfvJcQWDIDpmgztZCNoqNnxdO8yCjaCJ
	azt3RhDyQ/OcGsZpfxzr8VCTBSDRtpkGwtKS2tw2I7zDxba5K0vcKxFeSnhMFy2gvKa1hS7pUQU
	k9iGtka4qxTe9f9T4sKmo5hiOjvSFkHx8tJ+B45mVipNST+tl2Zq+rNGlRBk2mmEDuDrj8WEfbo
	c1LpszT6d0Rp49An7T36/vxyLFFGt5sOwZRMGdhjtLRxdSxvgDiuSQN8Wzm9VP3J0prAz/T2p3h
	5uTEd1HcOqnpRXyluxvjxCguY0BmhEbCAc6sFc1SutL/w185I9uFO0+QeWgb7dovrJNJg0eL6H/
	Dfvk/5sr1+tSLofaYR9TAZtiEbSDN/mTgyai22A==
X-Received: by 2002:a05:6a00:1792:b0:736:8c0f:7758 with SMTP id d2e1a72fcca58-7742dd506a1mr14346026b3a.10.1757451604560;
        Tue, 09 Sep 2025 14:00:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPoCCl4oTUfrkkB6L6KOV3tgeo10q/nP1o0Y+0BVtF89ZoRpxM+guv+SKYacMeBkrnqcUTvg==
X-Received: by 2002:a05:6a00:1792:b0:736:8c0f:7758 with SMTP id d2e1a72fcca58-7742dd506a1mr14345987b3a.10.1757451603933;
        Tue, 09 Sep 2025 14:00:03 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774661559a1sm2913058b3a.45.2025.09.09.13.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 14:00:03 -0700 (PDT)
Message-ID: <810b5737-53de-42f8-96d7-1c712cb87822@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 06:59:54 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
To: Bjorn Andersson <andersson@kernel.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuldeep Singh <quic_kuldsing@quicinc.com>
References: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
 <rvz274v27t54iktoa6uds5hyrs5ujkmahdl4o635gkah7cw277@jf4fjp5wb7ci>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <rvz274v27t54iktoa6uds5hyrs5ujkmahdl4o635gkah7cw277@jf4fjp5wb7ci>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX1d1xRQmnTRLv
 +zyWfKxkkW+r+1s+qwfUlOEsUwd3KrEo6Rvs30Z4pwTu674jDdpLzPu/8k8xXZAgARrYG7XFetS
 yZ87Ui5uwQd0qSxzIdJKiCJjZ69sYzun+xpMnT9sgt17p80bmbwsOQajzN95H9MdREDwekJf0YR
 CaSmNbfWm5AugWd4cxY0eFVLTDZ6tgCxbwf3xa7Pue4LkkeVyDyx6c1ARbPeVMETy0xRJn6bWXk
 ScnXK9r9AiKLv6sen2SaJ/CofPXOH7GSYX2Lpjd+68Bd08QyfCUA3sTDTsgnZYLlm3suU34CoL+
 buoYhea68PIoIWWJYAPjC+4AHfXaKBnBouMfY2aG4q14csA4SPeuuGXJFRo09FEzXYUdAq+JlXg
 5RS+SmUt
X-Proofpoint-ORIG-GUID: izBn7o0_c-8KOUXZWTSH_wJ8c7dpHTgC
X-Proofpoint-GUID: izBn7o0_c-8KOUXZWTSH_wJ8c7dpHTgC
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c09556 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=PQODIOjcjKhI4WzMhAgA:9
 a=lVWfZRcH457ZfW6I:21 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031



On 9/10/2025 1:03 AM, Bjorn Andersson wrote:
> On Mon, Sep 01, 2025 at 09:55:47PM -0700, Amirreza Zarrabi wrote:
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
>> available in [PATCH 12/12] Documentation: tee: Add Qualcomm TEE driver.
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
>> More comprehensive tests are availabe at
>> https://github.com/qualcomm/minkipc.
>>
>> root@qcom-armv8a:~# qtee_supplicant &
>> root@qcom-armv8a:~# qtee_supplicant: process entry PPID = 378
>> Total listener services to start = 4
>> Opening CRequestTABuffer_open
>> Path /data/
>> register_service ::Opening CRegisterTABufCBO_UID
>> Calling TAbufCBO Register
>> QTEE_SUPPLICANT RUNNING
>>  
>> root@qcom-armv8a:~# smcinvoke_client -c /data 1
>> Run callback obj test...
>> Load /data/tzecotestapp.mbn, size 52192, buf 0x1e44ba0.
>> System Time: 2024-02-27 17:26:31
>> PASSED - Callback tests with Buffer inputs.
>> PASSED - Callback tests with Remote and Callback object inputs.
>> PASSED - Callback tests with Memory Object inputs.
>> TEST PASSED!
>> root@qcom-armv8a:~#
>> root@qcom-armv8a:~# smcinvoke_client -m /data 1
>> Run memory obj test...
>> Load /data/tzecotestapp.mbn, size 52192, buf 0x26cafba0.
>> System Time: 2024-02-27 17:26:39
>> PASSED - Single Memory Object access Test.
>> PASSED - Two Memory Object access Test.
>> TEST PASSED!
>>
>> This series has been tested for QTEE object invocations, including
>> loading a TA, requesting services from the TA, memory sharing, and
>> handling callback requests to a supplicant.
>>
>> Tested platforms: sm8650-mtp, sm8550-qrd, sm8650-qrd, sm8650-hdk
>>
>> [1] https://www.kernel.org/doc/Documentation/tee.txt
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>
>> Changes in v9:
>> - Remove unnecessary logging in qcom_scm_probe().
>> - Replace the platform_device_alloc()/add() sequence with
>>   platform_device_register_data().
>> - Fixed sparse warning.
>> - Fixed documentation typo.
>> - Link to v8:
>>   https://lore.kernel.org/r/20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com
>>
>> Changes in v8:
>> - Check if arguments to qcom_scm_qtee_invoke_smc() and
>>   qcom_scm_qtee_callback_response() are NULL.
>> - Add CPU_BIG_ENDIAN as a dependency to Kconfig.
>> - Fixed kernel bot errors.
>> - Link to v7:
>>   https://lore.kernel.org/r/20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com
>>
>> Changes in v7:
>> - Updated copyrights.
>> - Updated Acked-by: tags.
>> - Fixed kernel bot errors.
>> - Link to v6:
>>   https://lore.kernel.org/r/20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com
>>
>> Changes in v6:
>> - Relocate QTEE version into the driver's main service structure.
>> - Simplfies qcomtee_objref_to_arg() and qcomtee_objref_from_arg().
>> - Enhanced the return logic of qcomtee_object_do_invoke_internal().
>> - Improve comments and remove redundant checks.
>> - Improve helpers in qcomtee_msh.h to use GENMASK() and FIELD_GET().
>> - updated Tested-by:, Acked-by:, and Reviewed-by: tags
>> - Link to v5:
>>   https://lore.kernel.org/r/20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com
>>
>> Changes in v5:
>> - Remove references to kernel services and public APIs.
>> - Support auto detection for failing devices (e.g., RB1, RB4).
>> - Add helpers for obtaining client environment and service objects.
>> - Query the QTEE version and print it.
>> - Move remaining static variables, including the object table, to struct
>>   qcomtee.
>> - Update TEE_MAX_ARG_SIZE to 4096.
>> - Add a dependancy to QCOM_TZMEM_MODE_SHMBRIDGE in Kconfig
>> - Reorganize code by removing release.c and qcom_scm.c.
>> - Add more error messages and improve comments.
>> - updated Tested-by:, Acked-by:, and Reviewed-by: tags
>> - Link to v4: https://lore.kernel.org/r/20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com
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
>>   allocations using the pool.
>> - Move all driver states into the driver's main service struct.
>> - Add more documentations.
>> - Link to v2: https://lore.kernel.org/r/20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com
>>
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
>> Amirreza Zarrabi (11):
>>       tee: allow a driver to allocate a tee_device without a pool
>>       tee: add close_context to TEE driver operation
>>       tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
>>       tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
>>       tee: increase TEE_MAX_ARG_SIZE to 4096
>>       firmware: qcom: scm: add support for object invocation
>>       firmware: qcom: tzmem: export shm_bridge create/delete
> 
> These two patches are for code maintained by me, the rest by Jens. So we
> will have to dance to get this merged.
> 
> Is there are reason why these two are in the middle of the series? Do
> they need to come after the first 5 but before the next 3?
> 
> Regards,
> Bjorn
> 

There is no functional reason - it's just that they belong to QC,
so I kept them close together.

I'll move both ahead of all other TEE-related items.

Regards,
Amir


>>       tee: add Qualcomm TEE driver
>>       tee: qcom: add primordial object
>>       tee: qcom: enable TEE_IOC_SHM_ALLOC ioctl
>>       Documentation: tee: Add Qualcomm TEE driver
>>
>>  Documentation/tee/index.rst              |   1 +
>>  Documentation/tee/qtee.rst               |  96 ++++
>>  MAINTAINERS                              |   7 +
>>  drivers/firmware/qcom/qcom_scm.c         | 124 +++++
>>  drivers/firmware/qcom/qcom_scm.h         |   7 +
>>  drivers/firmware/qcom/qcom_tzmem.c       |  63 ++-
>>  drivers/tee/Kconfig                      |   1 +
>>  drivers/tee/Makefile                     |   1 +
>>  drivers/tee/qcomtee/Kconfig              |  12 +
>>  drivers/tee/qcomtee/Makefile             |   9 +
>>  drivers/tee/qcomtee/async.c              | 182 ++++++
>>  drivers/tee/qcomtee/call.c               | 820 +++++++++++++++++++++++++++
>>  drivers/tee/qcomtee/core.c               | 915 +++++++++++++++++++++++++++++++
>>  drivers/tee/qcomtee/mem_obj.c            | 169 ++++++
>>  drivers/tee/qcomtee/primordial_obj.c     | 113 ++++
>>  drivers/tee/qcomtee/qcomtee.h            | 185 +++++++
>>  drivers/tee/qcomtee/qcomtee_msg.h        | 304 ++++++++++
>>  drivers/tee/qcomtee/qcomtee_object.h     | 316 +++++++++++
>>  drivers/tee/qcomtee/shm.c                | 150 +++++
>>  drivers/tee/qcomtee/user_obj.c           | 692 +++++++++++++++++++++++
>>  drivers/tee/tee_core.c                   | 127 ++++-
>>  drivers/tee/tee_private.h                |   6 -
>>  include/linux/firmware/qcom/qcom_scm.h   |   6 +
>>  include/linux/firmware/qcom/qcom_tzmem.h |  15 +
>>  include/linux/tee_core.h                 |  54 +-
>>  include/linux/tee_drv.h                  |  12 +
>>  include/uapi/linux/tee.h                 |  56 +-
>>  27 files changed, 4415 insertions(+), 28 deletions(-)
>> ---
>> base-commit: 33bcf93b9a6b028758105680f8b538a31bc563cf
>> change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527
>>
>> Best regards,
>> -- 
>> Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>


