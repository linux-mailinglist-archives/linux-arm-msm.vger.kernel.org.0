Return-Path: <linux-arm-msm+bounces-25749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7046A92C681
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 01:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93BCE1C21CA1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 23:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62B918005C;
	Tue,  9 Jul 2024 23:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZtkBH86m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8EC7E765;
	Tue,  9 Jul 2024 23:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720567045; cv=none; b=nMmuzAf+Ctc6OeLPJzrhu07tJ9rN/pW+FjdYt0BtVgfL0kUqGaf4XmkKEGTrgIwm3hMS1Qyrvj76KrFcQSWWY3H0X32C+rPTWFpJeBDuaoW0OG/94JWNdsdX6HMZ0u+iMSnRHEWZU+UlZCIP9ATxvfPjsWJPd7llg4CmIOOICGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720567045; c=relaxed/simple;
	bh=Ivgqusl0tUokXgIMRm87VXF56LMfdcoFJtfl5gDz4L8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=RcFNeQk95g0PYvOmswd7XnAGcmzEG2yGTs6XwvAnntXMavHQ4vxfbHteUZfPKbK2LEQVqSDmoGup0fi3D17WnHSIoX/s7cDlcIXbFJACUXATg/aTWuSizgy8ZTr9frVL6ElTCLjYfo+biVNTke4hKMrUmeSBRXlaPJCC/2JalHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZtkBH86m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469D81Gn012640;
	Tue, 9 Jul 2024 23:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r3AwTGK/2A110THpl8eIw/zeTmYO4gyt4wE1EL2JaIM=; b=ZtkBH86m1XymRDEc
	n80rDH7mFYRSSCNUwiLxkVqh6PFd4MTKZx6hdnmpa559T4yMeOuaEpjqljeQFQ2I
	z25ld+wYkhvzHRl80zFeVgwKfkVRRWTpHpLvEfQYEH9dBNNoBCmr2TJBeunJHST1
	tssQ5Ll669UDFfHA2ea2u2QDHg9XzxRCIbVHRLIipx4kIUb1z84lyVsBjiKWfjNk
	uFFGTFySboaVl/n16s0Epm6ZcvhI+YCRNqYBz0ExeSbt8A8AsSZ6vnHyZYQdS4et
	Rb35v0nUMkBQululHJcPk7SwCCojp83wexaAhsH4cauVbtG1XmKqmAiTV3OPNN8o
	ejeaxA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406y3hfepn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 23:16:53 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469NGqSU003441
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 23:16:52 GMT
Received: from [10.4.85.5] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Jul 2024
 16:16:50 -0700
Message-ID: <bdf39b00-b889-42d2-ba07-4e2881fe9105@quicinc.com>
Date: Wed, 10 Jul 2024 09:16:48 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Subject: Re: [PATCH RFC 0/3] Implement Qualcomm TEE IPC and ioctl calls
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
References: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
 <umwai5fxohuz6apprv6ouhdrnomal4a7cmyhmzpf6dnamnvti2@un4hxx52hkge>
Content-Language: en-US
In-Reply-To: <umwai5fxohuz6apprv6ouhdrnomal4a7cmyhmzpf6dnamnvti2@un4hxx52hkge>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: U4K5ti_hmHt6I-tjjL5YAXxr-CKsFECv
X-Proofpoint-GUID: U4K5ti_hmHt6I-tjjL5YAXxr-CKsFECv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_10,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090159



On 7/3/2024 9:36 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 02, 2024 at 10:57:35PM GMT, Amirreza Zarrabi wrote:
>> Qualcomm TEE hosts Trusted Applications (TAs) and services that run in
>> the secure world. Access to these resources is provided using MinkIPC.
>> MinkIPC is a capability-based synchronous message passing facility. It
>> allows code executing in one domain to invoke objects running in other
>> domains. When a process holds a reference to an object that lives in
>> another domain, that object reference is a capability. Capabilities
>> allow us to separate implementation of policies from implementation of
>> the transport.
>>
>> As part of the upstreaming of the object invoke driver (called SMC-Invoke
>> driver), we need to provide a reasonable kernel API and UAPI. The clear
>> option is to use TEE subsystem and write a back-end driver, however the
>> TEE subsystem doesn't fit with the design of Qualcomm TEE.
>>

To answer your "general comment", maybe a bit of background :).

Traditionally, policy enforcement is based on access-control models,
either (1) access-control list or (2) capability [0]. A capability is an
opaque ("non-forge-able") object reference that grants the holder the
right to perform certain operations on the object (e.g. Read, Write,
Execute, or Grant). Capabilities are preferred mechanism for representing
a policy, due to their fine-grained representation of access right, inline
with
  (P1) the principle of least privilege [1], and
  (P2) the ability to avoid the confused deputy problem [2].

[0] Jack B. Dennis and Earl C. Van Horn. 1966. Programming Semantics for
Multiprogrammed Computations. Commun. ACM 9 (1966), 143–155.

[1] Jerome H. Saltzer and Michael D. Schroeder. 1975. The Protection of
Information in Computer Systems. Proc. IEEE 63 (1975), 1278–1308.

[2] Norm Hardy. 1988. The Confused Deputy (or Why Capabilities Might Have
Been Invented). ACM Operating Systems Review 22, 4 (1988), 36–38.

For MinkIPC, an object represents a TEE or TA service. The reference to
the object is the "handle" that is returned from TEE (let's call it
TEE-Handle). The supported operations are "service invocation" (similar
to Execute), and "sharing access to a service" (similar to Grant).
Anyone with access to the TEE-Handle can invoke the service or pass the
TEE-Handle to someone else to access the same service.

The responsibility of the MinkIPC framework is to hide the TEE-Handle,
so that the client can not forge it, and allow the owner of the handle
to transfer it to other clients as it wishes. Using a file descriptor
table we can achieve that. We wrap the TEE-Handle as a FD and let the
client invoke FD (e.g. using IOCTL), or transfer the FD (e.g. using
UNIX socket).

As a side note, for the sake of completeness, capabilities are fundamentally
a "discretionary mechanism", as the holder of the object reference has the
ability to share it with others. A secure system requires "mandatory
enforcement" (i.e. ability to revoke authority and ability to control
the authority propagation). This is out of scope for the MinkIPC.
MinkIPC is only interested in P1 and P2 (mention above).


>> Does TEE subsystem fit requirements of a capability based system?
>> -----------------------------------------------------------------
>> In TEE subsystem, to invoke a function:
>>    - client should open a device file "/dev/teeX",
>>    - create a session with a TA, and
>>    - invoke the functions in that session.
>>
>> 1. The privilege to invoke a function is determined by a session. If a
>>    client has a session, it cannot share it with other clients. Even if
>> it does, it is not fine-grained enough, i.e. either all accessible
>> functions/resources in a session or none. Assume a scenario when a client
>> wants to grant a permission to invoke just a function that it has the rights,
>> to another client.
>>
>> The "all or nothing" for sharing sessions is not in line with our
>> capability system: "if you own a capability, you should be able to grant
>> or share it".
> 
> Can you please be more specific here? What kind of sharing is expected
> on the user side of it?

In MinkIPC, after authenticating a client credential, a TA (or TEE) may
return multiple TEE-Handles, each representing a service that the client
has privilege to access. The client should be able to "individually"
reference each TEE-Handle, e.g. to invoke and share it (as per capability-
based system requirements).

If we use TEE subsystem, which has a session based design, all TEE-Handles
are meaningful with respect to the session in which they are allocated,
hence the use of "__u32 session" in "struct tee_ioctl_invoke_arg".

Here, we have a contradiction with MinkIPC. We may ignore the session
and say "even though a TEE-Handle is allocated in a session but it is also
valid outside a session", i.e. the session-id in TEE uapi becomes redundant
(a case of divergence from definition).

> 
>> 2. In TEE subsystem, resources are managed in a context. Every time a
>>    client opens "/dev/teeX", a new context is created to keep track of
>> the allocated resources, including opened sessions and remote objects. Any
>> effort for sharing resources between two independent clients requires
>> involvement of context manager, i.e. the back-end driver. This requires
>> implementing some form of policy in the back-end driver.
> 
> What kind of resource sharing?

TEE subsystem "rightfully" allocates a context each time a client opens
a device file. This context pass around to the backend driver to identify
independent clients that opened the device file.

The context is used by backend driver to keep track of the resources. Type
of resources are TEE driver dependent. As an example of resource in TEE
subsystem, you can look into 'shm' register and unregister (specially,
see comment in function 'shm_alloc_helper').

For MinkIPC, all clients are treated the same and the TEE-Handles are
representative of the resources, accessible "globally" if a client has the
capability for them. In kernel, clients access an object if they have
access to "qcom_tee_object", in userspace, clients access an object if
they have the FD wrapper for the TEE-Handle.

If we use context, instead of the file descriptor table, any form of object
transfer requires involvement of the backend driver. If we use the file
descriptor table, contexts are becoming useless for MinkIPC (i.e.
'ctx->data' will "always" be null).

> 
>> 3. The TEE subsystem supports two type of memory sharing:
>>    - per-device memory pools, and
>>    - user defined memory references.
>> User defined memory references are private to the application and cannot
>> be shared. Memory allocated from per-device "shared" pools are accessible
>> using a file descriptor. It can be mapped by any process if it has
>> access to it. This means, we cannot provide the resource isolation
>> between two clients. Assume a scenario when a client wants to allocate a
>> memory (which is shared with TEE) from an "isolated" pool and share it
>> with another client, without the right to access the contents of memory.
> 
> This doesn't explain, why would it want to share such memory with
> another client.

Ok, I believe there is a misunderstanding here. I did not try to justify
specific usecase. We want to separate the memory allocation from the
framework. This way, how the memory is obtained, e.g. it is allocated
(1) from an isolated pool, (2) a shared pool, (3) a secure heap,
(4) a system dma-heap, (5) process address space, or (6) other memory
with "different constraints", becomes independent.

We introduced "memory object" type. User implements a kernel service
using "qcom_tee_object" to represent the memory object. We have an
implementation of memory objects based on dma-buf.

> 
>> 4. The kernel API provided by TEE subsystem does not support a kernel
>>    supplicant. Adding support requires an execution context (e.g. a
>> kernel thread) due to the TEE subsystem design. tee_driver_ops supports
>> only "send" and "receive" callbacks and to deliver a request, someone
>> should wait on "receive".
> 
> There is nothing wrong here, but maybe I'm misunderstanding something.

I agree. But, I am trying to re-emphasize how useful TEE subsystem is
for MinkIPC. For kernel services, we solely rely on the backend driver.
For instance, to expose RPMB service we will use "qcom_tee_object".
So there is nothing provided by the framework to simplify the service
development.

> 
>> We need a callback to "dispatch" or "handle" a request in the context of
>> the client thread. It should redirect a request to a kernel service or
>> a user supplicant. In TEE subsystem such requirement should be implemented
>> in TEE back-end driver, independent from the TEE subsystem.
>>
>> 5. The UAPI provided by TEE subsystem is similar to the GPTEE Client
>>    interface. This interface is not suitable for a capability system.
>> For instance, there is no session in a capability system which means
>> either its should not be used, or we should overload its definition.
> 
> General comment: maybe adding more detailed explanation of how the
> capabilities are aquired and how they can be used might make sense.
> 
> BTW. It might be my imperfect English, but each time I see the word
> 'capability' I'm thinking that some is capable of doing something. I
> find it hard to use 'capability' for the reference to another object.
> 

Explained at the top :).

>>
>> Can we use TEE subsystem?
>> -------------------------
>> There are workarounds for some of the issues above. The question is if we
>> should define our own UAPI or try to use a hack-y way of fitting into
>> the TEE subsystem. I am using word hack-y, as most of the workaround
>> involves:
>>
>> - "diverging from the definition". For instance, ignoring the session
>>   open and close ioctl calls or use file descriptors for all remote
>> resources (as, fd is the closet to capability) which undermines the
>> isolation provided by the contexts,
>>
>> - "overloading the variables". For instance, passing object ID as file
>>   descriptors in a place of session ID, or
>>
>> - "bypass TEE subsystem". For instance, extensively rely on meta
>>   parameters or push everything (e.g. kernel services) to the back-end
>> driver, which means leaving almost all TEE subsystem unused.
>>
>> We cannot take the full benefits of TEE subsystem and may need to
>> implement most of the requirements in the back-end driver. Also, as
>> discussed above, the UAPI is not suitable for capability-based use cases.
>> We proposed a new set of ioctl calls for SMC-Invoke driver.
>>
>> In this series we posted three patches. We implemented a transport
>> driver that provides qcom_tee_object. Any object on secure side is
>> represented with an instance of qcom_tee_object and any struct exposed
>> to TEE should embed an instance of qcom_tee_object. Any, support for new
>> services, e.g. memory object, RPMB, userspace clients or supplicants are
>> implemented independently from the driver.
>>
>> We have a simple memory object and a user driver that uses
>> qcom_tee_object.
> 
> Could you please point out any user for the uAPI? I'd like to understand
> how does it from from the userspace point of view.

Sure :), I'll write up a test patch and send it in next series.

Summary.

TEE framework provides some nice facilities, including:
  - uapi and ioctl interface,
  - marshaling parameters and context management,
  - memory mapping and sharing, and
  - TEE bus and TA drivers.

For, MinkIPC, we will not use any of them. The only usable piece, is uapi
interface which is not suitable for MinkIPC, as discussed above.

> 
>>
>> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
>> ---
>> Amirreza Zarrabi (3):
>>       firmware: qcom: implement object invoke support
>>       firmware: qcom: implement memory object support for TEE
>>       firmware: qcom: implement ioctl for TEE object invocation
>>
>>  drivers/firmware/qcom/Kconfig                      |   36 +
>>  drivers/firmware/qcom/Makefile                     |    2 +
>>  drivers/firmware/qcom/qcom_object_invoke/Makefile  |   12 +
>>  drivers/firmware/qcom/qcom_object_invoke/async.c   |  142 +++
>>  drivers/firmware/qcom/qcom_object_invoke/core.c    | 1139 ++++++++++++++++++
>>  drivers/firmware/qcom/qcom_object_invoke/core.h    |  186 +++
>>  .../qcom/qcom_object_invoke/qcom_scm_invoke.c      |   22 +
>>  .../firmware/qcom/qcom_object_invoke/release_wq.c  |   90 ++
>>  .../qcom/qcom_object_invoke/xts/mem_object.c       |  406 +++++++
>>  .../qcom_object_invoke/xts/object_invoke_uapi.c    | 1231 ++++++++++++++++++++
>>  include/linux/firmware/qcom/qcom_object_invoke.h   |  233 ++++
>>  include/uapi/misc/qcom_tee.h                       |  117 ++
>>  12 files changed, 3616 insertions(+)
>> ---
>> base-commit: 74564adfd3521d9e322cfc345fdc132df80f3c79
>> change-id: 20240702-qcom-tee-object-and-ioctls-6f52fde03485
>>
>> Best regards,
>> -- 
>> Amirreza Zarrabi <quic_azarrabi@quicinc.com>
>>
> 

