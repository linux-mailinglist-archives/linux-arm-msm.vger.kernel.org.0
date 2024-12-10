Return-Path: <linux-arm-msm+bounces-41362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 621EF9EBC11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 22:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E53ED282799
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 21:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5852397B0;
	Tue, 10 Dec 2024 21:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pc0Ktdl7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B2C1A9B4C;
	Tue, 10 Dec 2024 21:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733867081; cv=none; b=uQ8wvj9Q5Dpf9Dv8tKZy5fZ/ROO1M7XW/ufECKVFdKZ/w1UmwEPxHSfwddfu2t6Z+GzgqRy9ZyXJY1Ra1elKltOS5bBYOMZ8rqkJ2yeLOgYWB5V/VaF59r8IuNTmj1Js+e/AWVSGQ4XR7UG2tcOGknZOhV5cD5naqXm72icxwlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733867081; c=relaxed/simple;
	bh=RgFRJO9SxDbTYwqB9l2YEX3eD4HJt7/X9nbJYXoi4Z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SWJae7HM1Ma2QFNw37NV9hdU25oFXR7asDnNGIvcygxoA4ssiWQFlk2U6hlbHVLOjhZua/C9Ld/Ul0swZEQd2ZLWp3Qssyzrr8iCuBs7tfKOpkcKzJlCEgKSnBzybqm3qQLSeGnrvpXiM6LxAeuPqjFptVPsXiL7Y9azD+VLqjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pc0Ktdl7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAG2LLP002749;
	Tue, 10 Dec 2024 21:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51H1zx6ZjCIKp6pg8lVoWsLVvCUHrUDqc8EXCbYTcrw=; b=Pc0Ktdl7NlBSoUNh
	M9xDwzn2aqDyAcBTu9PQm4kbWuONOOb+7zzUPiCKQf0tYcY/Tm4GhnKzTT6JUhXz
	6VROOHpSfSDzuIxthmbxqvNETnjTSIxEzUIEX2KFrO5vgNpHv05mgkqJIdOXn1L7
	dCwg3Q/iAkoqJM9eVyx3aOAAjYSGGPe2BZZ4YU0OhZ19Q4ckz3yK29ynfbUmND8G
	SbvVyLH0o72I01hwFntIUl/QfFFaYOE4IZRz/tdapM//PkgilWZv4mDuRXEur0f4
	7ZTx5d+tiLGDx+HhvI3vVqZKTEQJ7OeWoRkc92AzomFVFlyNW77mNroETtFGQp7J
	h4SLjA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dxw45m5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 21:44:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BALiXNt005768
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 21:44:33 GMT
Received: from [10.4.85.13] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 13:44:31 -0800
Message-ID: <d26420b8-f62d-4c2a-ae58-a7fa5744ba28@quicinc.com>
Date: Wed, 11 Dec 2024 08:44:31 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] qcomtee: implement object invoke support
Content-Language: en-US
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Sumit Garg <sumit.garg@linaro.org>,
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
 <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-5-f502ef01e016@quicinc.com>
 <CAHUa44FhZc1ZVgJQrqbDdY1kegNgHrC4VTs66-5CDfY04D6MMw@mail.gmail.com>
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
In-Reply-To: <CAHUa44FhZc1ZVgJQrqbDdY1kegNgHrC4VTs66-5CDfY04D6MMw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3lP6DyhHCYupfFmkE1NW4XcyA3Qhp7k5
X-Proofpoint-GUID: 3lP6DyhHCYupfFmkE1NW4XcyA3Qhp7k5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100155



On 12/10/2024 9:24 PM, Jens Wiklander wrote:
> On Tue, Dec 3, 2024 at 5:20 AM Amirreza Zarrabi
> <quic_azarrabi@quicinc.com> wrote:
>>
>> Introduce qcom_tee_object, which represents an object in both QTEE and
>> the kernel. QTEE clients can invoke an instance of qcom_tee_object to
>> access QTEE services. If this invocation produces a new object in QTEE,
>> an instance of qcom_tee_object will be returned.
>>
>> Similarly, QTEE can request services from the kernel by issuing a callback
>> request, which invokes an instance of qcom_tee_object in the kernel.
>> Any subsystem that exposes a service to QTEE should allocate and initialize
>> an instance of qcom_tee_object with a dispatcher callback that is called
>> when the object is invoked.
>>
>> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
>> ---
>>  drivers/tee/Kconfig                    |   1 +
>>  drivers/tee/Makefile                   |   1 +
>>  drivers/tee/qcomtee/Kconfig            |  10 +
>>  drivers/tee/qcomtee/Makefile           |   6 +
>>  drivers/tee/qcomtee/async.c            | 153 ++++++
>>  drivers/tee/qcomtee/core.c             | 928 +++++++++++++++++++++++++++++++++
>>  drivers/tee/qcomtee/qcom_scm.c         |  36 ++
>>  drivers/tee/qcomtee/qcomtee_msg.h      | 217 ++++++++
>>  drivers/tee/qcomtee/qcomtee_private.h  |  47 ++
>>  drivers/tee/qcomtee/release.c          |  66 +++
>>  include/linux/firmware/qcom/qcom_tee.h | 284 ++++++++++
>>  11 files changed, 1749 insertions(+)
>>
> [snip]
> 
>> +/**
>> + * DOC: Overview
>> + *
>> + * qcom_tee_object provides object ref-counting, id allocation for objects hosted in
>> + * REE, and necessary message marshaling for Qualcomm TEE (QTEE).
>> + *
>> + * To invoke an object in QTEE, user calls qcom_tee_object_do_invoke() while passing
>> + * an instance of &struct qcom_tee_object and the requested operation + arguments.
>> + *
>> + * After the boot, QTEE provides a static object %ROOT_QCOM_TEE_OBJECT (type of
>> + * %QCOM_TEE_OBJECT_TYPE_ROOT). The root object is invoked to pass user's credentials and
>> + * obtain other instances of &struct qcom_tee_object (type of %QCOM_TEE_OBJECT_TYPE_TEE)
>> + * that represents services and TAs in QTEE, see &enum qcom_tee_object_type.
>> + *
>> + * The object received from QTEE are refcounted. So the owner of these objects can
>> + * issue qcom_tee_object_get(), to increase the refcount, and pass objects to other
>> + * clients, or issue qcom_tee_object_put() to decrease the refcount, and releasing
>> + * the resources in QTEE.
>> + *
>> + * REE can host services accessible to QTEE. A driver should embed an instance of
>> + * &struct qcom_tee_object in the struct it wants to export to QTEE (it is called
>> + * callback object). It issues qcom_tee_object_user_init() to set the dispatch()
>> + * operation for the callback object and set its type to %QCOM_TEE_OBJECT_TYPE_CB_OBJECT.
>> + *
>> + * core.c holds an object table for callback objects. An object id is assigned
>> + * to each callback object which is an index to the object table. QTEE uses these ids
>> + * to reference or invoke callback objects.
>> + *
>> + * If QTEE invoke a callback object in REE, the dispatch() operation is called in the
>> + * context of thread that called qcom_tee_object_do_invoke(), originally.
>> + */
>> +
>> +/**
>> + * enum qcom_tee_object_typ - Object types.
>> + * @QCOM_TEE_OBJECT_TYPE_TEE: object hosted on QTEE.
>> + * @QCOM_TEE_OBJECT_TYPE_CB_OBJECT: object hosted on REE.
>> + * @QCOM_TEE_OBJECT_TYPE_ROOT: 'primordial' object.
>> + * @QCOM_TEE_OBJECT_TYPE_NULL: NULL object.
>> + *
>> + * Primordial object is used for bootstrapping the IPC connection between a REE
>> + * and QTEE. It is invoked by REE when it wants to get a 'client env'.
>> + */
>> +enum qcom_tee_object_type {
>> +       QCOM_TEE_OBJECT_TYPE_TEE,
>> +       QCOM_TEE_OBJECT_TYPE_CB_OBJECT,
> 
> The second OBJECT seems redundant. How about QCOM_TEE_OBJECT_TYPE_CB
> or QCOM_TEE_OBJECT_TYPE_CALLBACK instead?
> 

Sure. I'll rename to QCOM_TEE_OBJECT_TYPE_CALLBACK.

Best Regards,
Amir


>> +       QCOM_TEE_OBJECT_TYPE_ROOT,
>> +       QCOM_TEE_OBJECT_TYPE_NULL,
>> +};
> [snip]
> 
> Cheers,
> Jens

