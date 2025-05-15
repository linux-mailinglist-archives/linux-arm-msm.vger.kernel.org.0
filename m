Return-Path: <linux-arm-msm+bounces-58045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A99B2AB8200
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 11:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 951627ACAAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 09:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCEF029614F;
	Thu, 15 May 2025 09:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qp5/WAig"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65942221F2A;
	Thu, 15 May 2025 09:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299969; cv=none; b=pAghBkzPp/O+LIIlHMaH0UfdAGADWe2hDdlASeDg+mn6CzERiIV8+ExR+9gkNgTvuF1Awd1Kz1b6Jx3Y7hHKLqxrTKZnHjKDD6wRGx6Gzv+RUAmAXNSK0QKZT37g0q3dOKnYjKusi02SHYn3JQyXtaJBAIxQa0Pg4EMB32bIpx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299969; c=relaxed/simple;
	bh=IU/roORDYzgbEqlRhZdc0PCV3WR+hlwzv0gD5uIaSYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bcEOk7OZi6lW3Nb8H5u4bLD44UOTN3rTLeywhgK9brP7gkdQpUgdcLO129nnMUQDAw/l5+uaAfTEz2KMoEXnPp+HZ4OA0MYQMh9CyB2BxRrl+gLYgiG0F4RZ9AKa/3LieJY+cVsKVssxEpeNBoJqPmpRh2z1PD0btr564GHYKkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qp5/WAig; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKnbAa015271;
	Thu, 15 May 2025 09:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0+JUJwBGk6EfyJ0jZn76d0sgqFvhNWii6j18SwECpBM=; b=Qp5/WAigV4GzHeOQ
	qEQANw7cJg8OYtw2/5cZbmhfZGIbJY+CwDYRokXerwbGrj2KOpQr1sqgZ4IGrxq1
	WHVp1IsQlUJc5GM8xtWHDKjmZTroAS4nXVUUTe9c6OVaJiSOUvvLUHhUnukSpmP5
	xAmlF9aXvu6/d62aniRrD7Loib02w7vKQQU6ejkSGzRQuyzw6p56Mqsq9xnjp6KZ
	2HsPGYNdy/L4nLKRt/8rziBtooGnUoWzi9pgDg9Pz7H4zbsgo5XYg7VMmbJu1vP+
	Aouv++1wKWTlwtOKkxBdDrndy3yFuTZgU72eh0kbgFOvgeeyWv0eZinmokWm3tMk
	PVRyHA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr5f5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 09:05:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54F95t6g016854
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 09:05:55 GMT
Received: from [10.218.44.178] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 May
 2025 02:05:50 -0700
Message-ID: <dc3c6aab-42d8-4741-826f-d22f140184e2@quicinc.com>
Date: Thu, 15 May 2025 14:35:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/11] tee: add Qualcomm TEE driver
To: Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi
	<amirreza.zarrabi@oss.qualcomm.com>
CC: Jens Wiklander <jens.wiklander@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu
	<quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R.
 Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        <linux-arm-msm@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
        <linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        <linux-doc@vger.kernel.org>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
 <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-8-6a143640a6cb@oss.qualcomm.com>
 <aCSZ4n5UMP_Jom2h@sumit-X1>
Content-Language: en-US
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
In-Reply-To: <aCSZ4n5UMP_Jom2h@sumit-X1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jE82sMeDPdTRDYWFaLaUE7soCqIgHBhw
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=6825ae74 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=bKlOgf2cc0x0kgLSBpIA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jE82sMeDPdTRDYWFaLaUE7soCqIgHBhw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDA4NyBTYWx0ZWRfXxG92tc1sTpxz
 9oQPNmNmmAGEmQ+vg3WoDy6ULWiZ0TNJLm1zjT/KgGXxVxDhGi8D/OzR9qGtD6X/2OZv1gxwDwT
 SmFaU1gJQYcPYyzKUfnQjGonVEwThlFRSLLwxdyIK+JocDHWcqDkmMlprCYCLp9yFhu22CeDyMA
 5UTsHuraCdImHx2STHw8OvuuuOiWmkvfC6YUlZZoXdYXlIbEWoYIn/eDR69LhqW1ugqCQewvvOS
 BAiosviKgKpyR5Q0rQav7itDLoZf7Abh/+4MW7DQoakyUVg1QV83x6FI3eCzg+Mm+IrVJDievNC
 ERq6Hmd8LxaodtcFOGLSIi6dDrwhBWweSR3bAbCvrhqc8peE1mGmJHAZ8eN6Ahu1AsHzGiOW53q
 h5CfRwUsVqx6k37fdQerz5r+R/nCtEBR5mB+tqgi7FNTelcCIN161fGOYCtAr8FWiyKTyT7i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_04,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150087



On 5/14/2025 6:55 PM, Sumit Garg wrote:
> Hi Amir,
> 
> Apologies for getting to this patch review a bit late, mostly due to
> it's enormous size.
> 
> On Mon, Apr 28, 2025 at 11:06:29PM -0700, Amirreza Zarrabi wrote:
>> Introduce qcomtee_object, which represents an object in both QTEE and
>> the kernel. QTEE clients can invoke an instance of qcomtee_object to
>> access QTEE services. If this invocation produces a new object in QTEE,
>> an instance of qcomtee_object will be returned.
>>
>> Similarly, QTEE can request services from the kernel by issuing a callback
>> request, which invokes an instance of qcomtee_object in the kernel.
>> Any subsystem that exposes a service to QTEE should allocate and initialize
>> an instance of qcomtee_object with a dispatcher callback that is called
>> when the object is invoked.
> 
> I can't see any kernel subsystem exposing a service to QTEE as of now. I
> suppose RPMB is surely going to be the one. So I would suggest you to
> drop exposing kernel APIs for that and instead they should be pushed
> alongside a patch-set adding a real kernel service for QTEE. This will
> help in the review as well.
> 
>>
>> Implement initial support for exporting qcomtee_object to userspace
>> and QTEE, enabling the invocation of objects hosted in QTEE and userspace
>> through the TEE subsystem.
> 
> I think this is the main goal of this patch-set, so we should limit it
> to that.
> 
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  MAINTAINERS                            |   7 +
>>  drivers/tee/Kconfig                    |   1 +
>>  drivers/tee/Makefile                   |   1 +
>>  drivers/tee/qcomtee/Kconfig            |  10 +
>>  drivers/tee/qcomtee/Makefile           |   9 +
>>  drivers/tee/qcomtee/async.c            | 160 +++++++
>>  drivers/tee/qcomtee/call.c             | 764 +++++++++++++++++++++++++++++++
>>  drivers/tee/qcomtee/core.c             | 806 +++++++++++++++++++++++++++++++++
>>  drivers/tee/qcomtee/qcom_scm.c         |  38 ++
>>  drivers/tee/qcomtee/qcomtee_msg.h      | 239 ++++++++++
>>  drivers/tee/qcomtee/qcomtee_private.h  | 222 +++++++++
>>  drivers/tee/qcomtee/release.c          |  48 ++
>>  drivers/tee/qcomtee/shm.c              | 149 ++++++
>>  drivers/tee/qcomtee/user_obj.c         | 713 +++++++++++++++++++++++++++++
>>  include/linux/firmware/qcom/qcom_tee.h | 302 ++++++++++++
>>  include/uapi/linux/tee.h               |   1 +
>>  16 files changed, 3470 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 906881b6c5cb..88a9ad34bcf6 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20257,6 +20257,13 @@ F:	Documentation/networking/device_drivers/cellular/qualcomm/rmnet.rst
>>  F:	drivers/net/ethernet/qualcomm/rmnet/
>>  F:	include/linux/if_rmnet.h
>>  
>> +QUALCOMM TEE (QCOMTEE) DRIVER
>> +M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +S:	Maintained
>> +F:	drivers/tee/qcomtee/
>> +F:	include/linux/firmware/qcom/qcom_tee.h
>> +
>>  QUALCOMM TRUST ZONE MEMORY ALLOCATOR
>>  M:	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>  L:	linux-arm-msm@vger.kernel.org
>> diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
>> index 61b507c18780..3a995d7f0d74 100644
>> --- a/drivers/tee/Kconfig
>> +++ b/drivers/tee/Kconfig
>> @@ -16,5 +16,6 @@ if TEE
>>  source "drivers/tee/optee/Kconfig"
>>  source "drivers/tee/amdtee/Kconfig"
>>  source "drivers/tee/tstee/Kconfig"
>> +source "drivers/tee/qcomtee/Kconfig"
>>  
>>  endif
>> diff --git a/drivers/tee/Makefile b/drivers/tee/Makefile
>> index 5488cba30bd2..74e987f8f7ea 100644
>> --- a/drivers/tee/Makefile
>> +++ b/drivers/tee/Makefile
>> @@ -6,3 +6,4 @@ tee-objs += tee_shm_pool.o
>>  obj-$(CONFIG_OPTEE) += optee/
>>  obj-$(CONFIG_AMDTEE) += amdtee/
>>  obj-$(CONFIG_ARM_TSTEE) += tstee/
>> +obj-$(CONFIG_QCOMTEE) += qcomtee/
>> diff --git a/drivers/tee/qcomtee/Kconfig b/drivers/tee/qcomtee/Kconfig
>> new file mode 100644
>> index 000000000000..d180a6d07d33
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/Kconfig
>> @@ -0,0 +1,10 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +# Qualcomm Trusted Execution Environment Configuration
>> +config QCOMTEE
>> +	tristate "Qualcomm TEE Support"
>> +	select QCOM_SCM
> 
> You should add a dependency on QCOM_TZMEM_MODE_SHMBRIDGE too here.

I think you meant QCOM_TZMEM because MODE_SHMBRIDGE is one aspect just
like MODE_GENERIC.

-- 
Regards
Kuldeep


